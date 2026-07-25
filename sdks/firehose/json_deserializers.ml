open Smaws_Lib.Json.DeserializeHelpers
open Types

let awskms_key_ar_n_of_yojson = string_of_yojson
let awskms_key_arn_for_ss_e_of_yojson = string_of_yojson
let amazon_open_search_serverless_buffering_size_in_m_bs_of_yojson = int_of_yojson
let amazon_open_search_serverless_buffering_interval_in_seconds_of_yojson = int_of_yojson

let amazon_open_search_serverless_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interval_in_seconds =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_buffering_interval_in_seconds_of_yojson
            "IntervalInSeconds")
         _list path;
     size_in_m_bs =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
   }
    : amazon_open_search_serverless_buffering_hints)

let amazon_open_search_serverless_collection_endpoint_of_yojson = string_of_yojson
let non_empty_string_without_whitespace_of_yojson = string_of_yojson

let security_group_id_list_of_yojson tree path =
  list_of_yojson non_empty_string_without_whitespace_of_yojson tree path

let role_ar_n_of_yojson = string_of_yojson

let subnet_id_list_of_yojson tree path =
  list_of_yojson non_empty_string_without_whitespace_of_yojson tree path

let vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = value_for_key subnet_id_list_of_yojson "SubnetIds" _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     security_group_ids =
       value_for_key security_group_id_list_of_yojson "SecurityGroupIds" _list path;
   }
    : vpc_configuration)

let log_stream_name_of_yojson = string_of_yojson
let log_group_name_of_yojson = string_of_yojson
let boolean_object_of_yojson = bool_of_yojson

let cloud_watch_logging_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key boolean_object_of_yojson "Enabled") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "LogGroupName") _list path;
     log_stream_name =
       option_of_yojson (value_for_key log_stream_name_of_yojson "LogStreamName") _list path;
   }
    : cloud_watch_logging_options)

let processor_parameter_value_of_yojson = string_of_yojson

let processor_parameter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "LambdaArn" -> LAMBDA_ARN
    | `String "NumberOfRetries" -> LAMBDA_NUMBER_OF_RETRIES
    | `String "MetadataExtractionQuery" -> METADATA_EXTRACTION_QUERY
    | `String "JsonParsingEngine" -> JSON_PARSING_ENGINE
    | `String "RoleArn" -> ROLE_ARN
    | `String "BufferSizeInMBs" -> BUFFER_SIZE_IN_MB
    | `String "BufferIntervalInSeconds" -> BUFFER_INTERVAL_IN_SECONDS
    | `String "SubRecordType" -> SUB_RECORD_TYPE
    | `String "Delimiter" -> Delimiter
    | `String "CompressionFormat" -> COMPRESSION_FORMAT
    | `String "DataMessageExtraction" -> DATA_MESSAGE_EXTRACTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProcessorParameterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProcessorParameterName")
     : processor_parameter_name)
    : processor_parameter_name)

let processor_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name = value_for_key processor_parameter_name_of_yojson "ParameterName" _list path;
     parameter_value = value_for_key processor_parameter_value_of_yojson "ParameterValue" _list path;
   }
    : processor_parameter)

let processor_parameter_list_of_yojson tree path =
  list_of_yojson processor_parameter_of_yojson tree path

let processor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RecordDeAggregation" -> RecordDeAggregation
    | `String "Decompression" -> Decompression
    | `String "CloudWatchLogProcessing" -> CloudWatchLogProcessing
    | `String "Lambda" -> Lambda
    | `String "MetadataExtraction" -> MetadataExtraction
    | `String "AppendDelimiterToRecord" -> AppendDelimiterToRecord
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProcessorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProcessorType")
     : processor_type)
    : processor_type)

let processor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key processor_type_of_yojson "Type" _list path;
     parameters =
       option_of_yojson (value_for_key processor_parameter_list_of_yojson "Parameters") _list path;
   }
    : processor)

let processor_list_of_yojson tree path = list_of_yojson processor_of_yojson tree path

let processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key boolean_object_of_yojson "Enabled") _list path;
     processors = option_of_yojson (value_for_key processor_list_of_yojson "Processors") _list path;
   }
    : processing_configuration)

let kms_encryption_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ awskms_key_ar_n = value_for_key awskms_key_ar_n_of_yojson "AWSKMSKeyARN" _list path }
    : kms_encryption_config)

let no_encryption_config_of_yojson (tree : t) path =
  ((match tree with
    | `String "NoEncryption" -> NoEncryption
    | `String value -> raise (deserialize_unknown_enum_value_error path "NoEncryptionConfig" value)
    | _ -> raise (deserialize_wrong_type_error path "NoEncryptionConfig")
     : no_encryption_config)
    : no_encryption_config)

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     no_encryption_config =
       option_of_yojson
         (value_for_key no_encryption_config_of_yojson "NoEncryptionConfig")
         _list path;
     kms_encryption_config =
       option_of_yojson
         (value_for_key kms_encryption_config_of_yojson "KMSEncryptionConfig")
         _list path;
   }
    : encryption_configuration)

let compression_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNCOMPRESSED" -> UNCOMPRESSED
    | `String "GZIP" -> GZIP
    | `String "ZIP" -> ZIP
    | `String "Snappy" -> SNAPPY
    | `String "HADOOP_SNAPPY" -> HADOOP_SNAPPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompressionFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionFormat")
     : compression_format)
    : compression_format)

let interval_in_seconds_of_yojson = int_of_yojson
let size_in_m_bs_of_yojson = int_of_yojson

let buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_in_m_bs = option_of_yojson (value_for_key size_in_m_bs_of_yojson "SizeInMBs") _list path;
     interval_in_seconds =
       option_of_yojson (value_for_key interval_in_seconds_of_yojson "IntervalInSeconds") _list path;
   }
    : buffering_hints)

let error_output_prefix_of_yojson = string_of_yojson
let prefix_of_yojson = string_of_yojson
let bucket_ar_n_of_yojson = string_of_yojson

let s3_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     bucket_ar_n = value_for_key bucket_ar_n_of_yojson "BucketARN" _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     compression_format =
       option_of_yojson (value_for_key compression_format_of_yojson "CompressionFormat") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
   }
    : s3_destination_configuration)

let amazon_open_search_serverless_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDocumentsOnly" -> FailedDocumentsOnly
    | `String "AllDocuments" -> AllDocuments
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AmazonOpenSearchServerlessS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "AmazonOpenSearchServerlessS3BackupMode")
     : amazon_open_search_serverless_s3_backup_mode)
    : amazon_open_search_serverless_s3_backup_mode)

let amazon_open_search_serverless_retry_duration_in_seconds_of_yojson = int_of_yojson

let amazon_open_search_serverless_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_retry_duration_in_seconds_of_yojson
            "DurationInSeconds")
         _list path;
   }
    : amazon_open_search_serverless_retry_options)

let amazon_open_search_serverless_index_name_of_yojson = string_of_yojson

let amazon_open_search_serverless_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     collection_endpoint =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_collection_endpoint_of_yojson
            "CollectionEndpoint")
         _list path;
     index_name =
       value_for_key amazon_open_search_serverless_index_name_of_yojson "IndexName" _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
   }
    : amazon_open_search_serverless_destination_configuration)

let vpc_configuration_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = value_for_key subnet_id_list_of_yojson "SubnetIds" _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     security_group_ids =
       value_for_key security_group_id_list_of_yojson "SecurityGroupIds" _list path;
     vpc_id = value_for_key non_empty_string_without_whitespace_of_yojson "VpcId" _list path;
   }
    : vpc_configuration_description)

let s3_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     bucket_ar_n = value_for_key bucket_ar_n_of_yojson "BucketARN" _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints = value_for_key buffering_hints_of_yojson "BufferingHints" _list path;
     compression_format = value_for_key compression_format_of_yojson "CompressionFormat" _list path;
     encryption_configuration =
       value_for_key encryption_configuration_of_yojson "EncryptionConfiguration" _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
   }
    : s3_destination_description)

let amazon_open_search_serverless_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     collection_endpoint =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_collection_endpoint_of_yojson
            "CollectionEndpoint")
         _list path;
     index_name =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_index_name_of_yojson "IndexName")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration_description =
       option_of_yojson
         (value_for_key vpc_configuration_description_of_yojson "VpcConfigurationDescription")
         _list path;
   }
    : amazon_open_search_serverless_destination_description)

let s3_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     bucket_ar_n = option_of_yojson (value_for_key bucket_ar_n_of_yojson "BucketARN") _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     compression_format =
       option_of_yojson (value_for_key compression_format_of_yojson "CompressionFormat") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
   }
    : s3_destination_update)

let amazon_open_search_serverless_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     collection_endpoint =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_collection_endpoint_of_yojson
            "CollectionEndpoint")
         _list path;
     index_name =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_index_name_of_yojson "IndexName")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
   }
    : amazon_open_search_serverless_destination_update)

let amazonopensearchservice_buffering_size_in_m_bs_of_yojson = int_of_yojson
let amazonopensearchservice_buffering_interval_in_seconds_of_yojson = int_of_yojson

let amazonopensearchservice_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interval_in_seconds =
       option_of_yojson
         (value_for_key amazonopensearchservice_buffering_interval_in_seconds_of_yojson
            "IntervalInSeconds")
         _list path;
     size_in_m_bs =
       option_of_yojson
         (value_for_key amazonopensearchservice_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
   }
    : amazonopensearchservice_buffering_hints)

let amazonopensearchservice_cluster_endpoint_of_yojson = string_of_yojson

let default_document_id_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIREHOSE_DEFAULT" -> FIREHOSE_DEFAULT
    | `String "NO_DOCUMENT_ID" -> NO_DOCUMENT_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DefaultDocumentIdFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DefaultDocumentIdFormat")
     : default_document_id_format)
    : default_document_id_format)

let document_id_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_document_id_format =
       value_for_key default_document_id_format_of_yojson "DefaultDocumentIdFormat" _list path;
   }
    : document_id_options)

let amazonopensearchservice_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDocumentsOnly" -> FailedDocumentsOnly
    | `String "AllDocuments" -> AllDocuments
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AmazonopensearchserviceS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "AmazonopensearchserviceS3BackupMode")
     : amazonopensearchservice_s3_backup_mode)
    : amazonopensearchservice_s3_backup_mode)

let amazonopensearchservice_retry_duration_in_seconds_of_yojson = int_of_yojson

let amazonopensearchservice_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key amazonopensearchservice_retry_duration_in_seconds_of_yojson
            "DurationInSeconds")
         _list path;
   }
    : amazonopensearchservice_retry_options)

let amazonopensearchservice_index_rotation_period_of_yojson (tree : t) path =
  ((match tree with
    | `String "NoRotation" -> NoRotation
    | `String "OneHour" -> OneHour
    | `String "OneDay" -> OneDay
    | `String "OneWeek" -> OneWeek
    | `String "OneMonth" -> OneMonth
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AmazonopensearchserviceIndexRotationPeriod"
             value)
    | _ -> raise (deserialize_wrong_type_error path "AmazonopensearchserviceIndexRotationPeriod")
     : amazonopensearchservice_index_rotation_period)
    : amazonopensearchservice_index_rotation_period)

let amazonopensearchservice_type_name_of_yojson = string_of_yojson
let amazonopensearchservice_index_name_of_yojson = string_of_yojson
let amazonopensearchservice_domain_ar_n_of_yojson = string_of_yojson

let amazonopensearchservice_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     domain_ar_n =
       option_of_yojson
         (value_for_key amazonopensearchservice_domain_ar_n_of_yojson "DomainARN")
         _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key amazonopensearchservice_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name = value_for_key amazonopensearchservice_index_name_of_yojson "IndexName" _list path;
     type_name =
       option_of_yojson
         (value_for_key amazonopensearchservice_type_name_of_yojson "TypeName")
         _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key amazonopensearchservice_index_rotation_period_of_yojson
            "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazonopensearchservice_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazonopensearchservice_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key amazonopensearchservice_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : amazonopensearchservice_destination_configuration)

let amazonopensearchservice_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     domain_ar_n =
       option_of_yojson
         (value_for_key amazonopensearchservice_domain_ar_n_of_yojson "DomainARN")
         _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key amazonopensearchservice_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name =
       option_of_yojson
         (value_for_key amazonopensearchservice_index_name_of_yojson "IndexName")
         _list path;
     type_name =
       option_of_yojson
         (value_for_key amazonopensearchservice_type_name_of_yojson "TypeName")
         _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key amazonopensearchservice_index_rotation_period_of_yojson
            "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazonopensearchservice_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazonopensearchservice_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key amazonopensearchservice_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration_description =
       option_of_yojson
         (value_for_key vpc_configuration_description_of_yojson "VpcConfigurationDescription")
         _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : amazonopensearchservice_destination_description)

let amazonopensearchservice_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     domain_ar_n =
       option_of_yojson
         (value_for_key amazonopensearchservice_domain_ar_n_of_yojson "DomainARN")
         _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key amazonopensearchservice_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name =
       option_of_yojson
         (value_for_key amazonopensearchservice_index_name_of_yojson "IndexName")
         _list path;
     type_name =
       option_of_yojson
         (value_for_key amazonopensearchservice_type_name_of_yojson "TypeName")
         _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key amazonopensearchservice_index_rotation_period_of_yojson
            "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key amazonopensearchservice_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key amazonopensearchservice_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : amazonopensearchservice_destination_update)

let connectivity_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC" -> PUBLIC
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Connectivity" value)
    | _ -> raise (deserialize_wrong_type_error path "Connectivity")
     : connectivity)
    : connectivity)

let authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     connectivity = value_for_key connectivity_of_yojson "Connectivity" _list path;
   }
    : authentication_configuration)

let block_size_bytes_of_yojson = int_of_yojson
let warehouse_location_of_yojson = string_of_yojson
let glue_data_catalog_ar_n_of_yojson = string_of_yojson

let catalog_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_ar_n =
       option_of_yojson (value_for_key glue_data_catalog_ar_n_of_yojson "CatalogARN") _list path;
     warehouse_location =
       option_of_yojson (value_for_key warehouse_location_of_yojson "WarehouseLocation") _list path;
   }
    : catalog_configuration)

let cluster_jdbcur_l_of_yojson = string_of_yojson
let non_empty_string_of_yojson = string_of_yojson

let column_to_json_key_mappings_of_yojson tree path =
  map_of_yojson non_empty_string_without_whitespace_of_yojson non_empty_string_of_yojson tree path

let error_message_of_yojson = string_of_yojson

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : concurrent_modification_exception)

let content_encoding_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "GZIP" -> GZIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContentEncoding" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentEncoding")
     : content_encoding)
    : content_encoding)

let copy_options_of_yojson = string_of_yojson
let data_table_columns_of_yojson = string_of_yojson
let data_table_name_of_yojson = string_of_yojson

let copy_command_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_table_name = value_for_key data_table_name_of_yojson "DataTableName" _list path;
     data_table_columns =
       option_of_yojson (value_for_key data_table_columns_of_yojson "DataTableColumns") _list path;
     copy_options = option_of_yojson (value_for_key copy_options_of_yojson "CopyOptions") _list path;
   }
    : copy_command)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let error_code_of_yojson = string_of_yojson

let invalid_kms_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : invalid_kms_resource_exception)

let invalid_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_argument_exception)

let delivery_stream_ar_n_of_yojson = string_of_yojson

let create_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_ar_n =
       option_of_yojson
         (value_for_key delivery_stream_ar_n_of_yojson "DeliveryStreamARN")
         _list path;
   }
    : create_delivery_stream_output)

let vpc_endpoint_service_name_of_yojson = string_of_yojson

let database_source_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_service_name =
       value_for_key vpc_endpoint_service_name_of_yojson "VpcEndpointServiceName" _list path;
   }
    : database_source_vpc_configuration)

let secret_ar_n_of_yojson = string_of_yojson

let secrets_manager_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_ar_n = option_of_yojson (value_for_key secret_ar_n_of_yojson "SecretARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     enabled = value_for_key boolean_object_of_yojson "Enabled" _list path;
   }
    : secrets_manager_configuration)

let database_source_authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secrets_manager_configuration =
       value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration" _list
         path;
   }
    : database_source_authentication_configuration)

let database_table_name_of_yojson = string_of_yojson

let database_surrogate_key_list_of_yojson tree path =
  list_of_yojson non_empty_string_without_whitespace_of_yojson tree path

let database_column_name_of_yojson = string_of_yojson

let database_column_include_or_exclude_list_of_yojson tree path =
  list_of_yojson database_column_name_of_yojson tree path

let database_column_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_ =
       option_of_yojson
         (value_for_key database_column_include_or_exclude_list_of_yojson "Include")
         _list path;
     exclude =
       option_of_yojson
         (value_for_key database_column_include_or_exclude_list_of_yojson "Exclude")
         _list path;
   }
    : database_column_list)

let database_table_include_or_exclude_list_of_yojson tree path =
  list_of_yojson database_table_name_of_yojson tree path

let database_table_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_ =
       option_of_yojson
         (value_for_key database_table_include_or_exclude_list_of_yojson "Include")
         _list path;
     exclude =
       option_of_yojson
         (value_for_key database_table_include_or_exclude_list_of_yojson "Exclude")
         _list path;
   }
    : database_table_list)

let database_name_of_yojson = string_of_yojson

let database_include_or_exclude_list_of_yojson tree path =
  list_of_yojson database_name_of_yojson tree path

let database_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_ =
       option_of_yojson
         (value_for_key database_include_or_exclude_list_of_yojson "Include")
         _list path;
     exclude =
       option_of_yojson
         (value_for_key database_include_or_exclude_list_of_yojson "Exclude")
         _list path;
   }
    : database_list)

let ssl_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disabled" -> Disabled
    | `String "Enabled" -> Enabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSLMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SSLMode")
     : ssl_mode)
    : ssl_mode)

let database_port_of_yojson = int_of_yojson
let database_endpoint_of_yojson = string_of_yojson

let database_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MySQL" -> MySQL
    | `String "PostgreSQL" -> PostgreSQL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatabaseType" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseType")
     : database_type)
    : database_type)

let database_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key database_type_of_yojson "Type" _list path;
     endpoint = value_for_key database_endpoint_of_yojson "Endpoint" _list path;
     port = value_for_key database_port_of_yojson "Port" _list path;
     ssl_mode = option_of_yojson (value_for_key ssl_mode_of_yojson "SSLMode") _list path;
     databases = value_for_key database_list_of_yojson "Databases" _list path;
     tables = value_for_key database_table_list_of_yojson "Tables" _list path;
     columns = option_of_yojson (value_for_key database_column_list_of_yojson "Columns") _list path;
     surrogate_keys =
       option_of_yojson
         (value_for_key database_surrogate_key_list_of_yojson "SurrogateKeys")
         _list path;
     snapshot_watermark_table =
       value_for_key database_table_name_of_yojson "SnapshotWatermarkTable" _list path;
     database_source_authentication_configuration =
       value_for_key database_source_authentication_configuration_of_yojson
         "DatabaseSourceAuthenticationConfiguration" _list path;
     database_source_vpc_configuration =
       value_for_key database_source_vpc_configuration_of_yojson "DatabaseSourceVPCConfiguration"
         _list path;
   }
    : database_source_configuration)

let retry_duration_in_seconds_of_yojson = int_of_yojson

let retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : retry_options)

let iceberg_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDataOnly" -> FailedDataOnly
    | `String "AllData" -> AllData
    | `String value -> raise (deserialize_unknown_enum_value_error path "IcebergS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergS3BackupMode")
     : iceberg_s3_backup_mode)
    : iceberg_s3_backup_mode)

let table_creation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enabled = value_for_key boolean_object_of_yojson "Enabled" _list path }
    : table_creation_configuration)

let schema_evolution_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enabled = value_for_key boolean_object_of_yojson "Enabled" _list path }
    : schema_evolution_configuration)

let partition_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_name =
       value_for_key non_empty_string_without_whitespace_of_yojson "SourceName" _list path;
   }
    : partition_field)

let partition_fields_of_yojson tree path = list_of_yojson partition_field_of_yojson tree path

let partition_spec_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identity = option_of_yojson (value_for_key partition_fields_of_yojson "Identity") _list path }
    : partition_spec)

let list_of_non_empty_strings_without_whitespace_of_yojson tree path =
  list_of_yojson non_empty_string_without_whitespace_of_yojson tree path

let string_with_letters_digits_underscores_dots_of_yojson = string_of_yojson

let destination_table_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_table_name =
       value_for_key string_with_letters_digits_underscores_dots_of_yojson "DestinationTableName"
         _list path;
     destination_database_name =
       value_for_key string_with_letters_digits_underscores_dots_of_yojson "DestinationDatabaseName"
         _list path;
     unique_keys =
       option_of_yojson
         (value_for_key list_of_non_empty_strings_without_whitespace_of_yojson "UniqueKeys")
         _list path;
     partition_spec =
       option_of_yojson (value_for_key partition_spec_of_yojson "PartitionSpec") _list path;
     s3_error_output_prefix =
       option_of_yojson
         (value_for_key error_output_prefix_of_yojson "S3ErrorOutputPrefix")
         _list path;
   }
    : destination_table_configuration)

let destination_table_configuration_list_of_yojson tree path =
  list_of_yojson destination_table_configuration_of_yojson tree path

let iceberg_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_table_configuration_list =
       option_of_yojson
         (value_for_key destination_table_configuration_list_of_yojson
            "DestinationTableConfigurationList")
         _list path;
     schema_evolution_configuration =
       option_of_yojson
         (value_for_key schema_evolution_configuration_of_yojson "SchemaEvolutionConfiguration")
         _list path;
     table_creation_configuration =
       option_of_yojson
         (value_for_key table_creation_configuration_of_yojson "TableCreationConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key iceberg_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     retry_options =
       option_of_yojson (value_for_key retry_options_of_yojson "RetryOptions") _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     append_only = option_of_yojson (value_for_key boolean_object_of_yojson "AppendOnly") _list path;
     catalog_configuration =
       value_for_key catalog_configuration_of_yojson "CatalogConfiguration" _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
   }
    : iceberg_destination_configuration)

let snowflake_buffering_interval_in_seconds_of_yojson = int_of_yojson
let snowflake_buffering_size_in_m_bs_of_yojson = int_of_yojson

let snowflake_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_in_m_bs =
       option_of_yojson
         (value_for_key snowflake_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
     interval_in_seconds =
       option_of_yojson
         (value_for_key snowflake_buffering_interval_in_seconds_of_yojson "IntervalInSeconds")
         _list path;
   }
    : snowflake_buffering_hints)

let snowflake_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDataOnly" -> FailedDataOnly
    | `String "AllData" -> AllData
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SnowflakeS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowflakeS3BackupMode")
     : snowflake_s3_backup_mode)
    : snowflake_s3_backup_mode)

let snowflake_retry_duration_in_seconds_of_yojson = int_of_yojson

let snowflake_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key snowflake_retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : snowflake_retry_options)

let snowflake_private_link_vpce_id_of_yojson = string_of_yojson

let snowflake_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_link_vpce_id =
       value_for_key snowflake_private_link_vpce_id_of_yojson "PrivateLinkVpceId" _list path;
   }
    : snowflake_vpc_configuration)

let snowflake_content_column_name_of_yojson = string_of_yojson
let snowflake_meta_data_column_name_of_yojson = string_of_yojson

let snowflake_data_loading_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSON_MAPPING" -> JSON_MAPPING
    | `String "VARIANT_CONTENT_MAPPING" -> VARIANT_CONTENT_MAPPING
    | `String "VARIANT_CONTENT_AND_METADATA_MAPPING" -> VARIANT_CONTENT_AND_METADATA_MAPPING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SnowflakeDataLoadingOption" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowflakeDataLoadingOption")
     : snowflake_data_loading_option)
    : snowflake_data_loading_option)

let snowflake_role_of_yojson = string_of_yojson

let snowflake_role_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key boolean_object_of_yojson "Enabled") _list path;
     snowflake_role =
       option_of_yojson (value_for_key snowflake_role_of_yojson "SnowflakeRole") _list path;
   }
    : snowflake_role_configuration)

let snowflake_table_of_yojson = string_of_yojson
let snowflake_schema_of_yojson = string_of_yojson
let snowflake_database_of_yojson = string_of_yojson
let snowflake_user_of_yojson = string_of_yojson
let snowflake_key_passphrase_of_yojson = string_of_yojson
let snowflake_private_key_of_yojson = string_of_yojson
let snowflake_account_url_of_yojson = string_of_yojson

let snowflake_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_url = value_for_key snowflake_account_url_of_yojson "AccountUrl" _list path;
     private_key =
       option_of_yojson (value_for_key snowflake_private_key_of_yojson "PrivateKey") _list path;
     key_passphrase =
       option_of_yojson
         (value_for_key snowflake_key_passphrase_of_yojson "KeyPassphrase")
         _list path;
     user = option_of_yojson (value_for_key snowflake_user_of_yojson "User") _list path;
     database = value_for_key snowflake_database_of_yojson "Database" _list path;
     schema = value_for_key snowflake_schema_of_yojson "Schema" _list path;
     table = value_for_key snowflake_table_of_yojson "Table" _list path;
     snowflake_role_configuration =
       option_of_yojson
         (value_for_key snowflake_role_configuration_of_yojson "SnowflakeRoleConfiguration")
         _list path;
     data_loading_option =
       option_of_yojson
         (value_for_key snowflake_data_loading_option_of_yojson "DataLoadingOption")
         _list path;
     meta_data_column_name =
       option_of_yojson
         (value_for_key snowflake_meta_data_column_name_of_yojson "MetaDataColumnName")
         _list path;
     content_column_name =
       option_of_yojson
         (value_for_key snowflake_content_column_name_of_yojson "ContentColumnName")
         _list path;
     snowflake_vpc_configuration =
       option_of_yojson
         (value_for_key snowflake_vpc_configuration_of_yojson "SnowflakeVpcConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     retry_options =
       option_of_yojson (value_for_key snowflake_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key snowflake_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key snowflake_buffering_hints_of_yojson "BufferingHints")
         _list path;
   }
    : snowflake_destination_configuration)

let read_from_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let topic_name_of_yojson = string_of_yojson
let msk_cluster_ar_n_of_yojson = string_of_yojson

let msk_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     msk_cluster_ar_n = value_for_key msk_cluster_ar_n_of_yojson "MSKClusterARN" _list path;
     topic_name = value_for_key topic_name_of_yojson "TopicName" _list path;
     authentication_configuration =
       value_for_key authentication_configuration_of_yojson "AuthenticationConfiguration" _list path;
     read_from_timestamp =
       option_of_yojson (value_for_key read_from_timestamp_of_yojson "ReadFromTimestamp") _list path;
   }
    : msk_source_configuration)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_delivery_stream_input_tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let http_endpoint_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDataOnly" -> FailedDataOnly
    | `String "AllData" -> AllData
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HttpEndpointS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpEndpointS3BackupMode")
     : http_endpoint_s3_backup_mode)
    : http_endpoint_s3_backup_mode)

let http_endpoint_retry_duration_in_seconds_of_yojson = int_of_yojson

let http_endpoint_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key http_endpoint_retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : http_endpoint_retry_options)

let http_endpoint_attribute_value_of_yojson = string_of_yojson
let http_endpoint_attribute_name_of_yojson = string_of_yojson

let http_endpoint_common_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name =
       value_for_key http_endpoint_attribute_name_of_yojson "AttributeName" _list path;
     attribute_value =
       value_for_key http_endpoint_attribute_value_of_yojson "AttributeValue" _list path;
   }
    : http_endpoint_common_attribute)

let http_endpoint_common_attributes_list_of_yojson tree path =
  list_of_yojson http_endpoint_common_attribute_of_yojson tree path

let http_endpoint_request_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_encoding =
       option_of_yojson (value_for_key content_encoding_of_yojson "ContentEncoding") _list path;
     common_attributes =
       option_of_yojson
         (value_for_key http_endpoint_common_attributes_list_of_yojson "CommonAttributes")
         _list path;
   }
    : http_endpoint_request_configuration)

let http_endpoint_buffering_interval_in_seconds_of_yojson = int_of_yojson
let http_endpoint_buffering_size_in_m_bs_of_yojson = int_of_yojson

let http_endpoint_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_in_m_bs =
       option_of_yojson
         (value_for_key http_endpoint_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
     interval_in_seconds =
       option_of_yojson
         (value_for_key http_endpoint_buffering_interval_in_seconds_of_yojson "IntervalInSeconds")
         _list path;
   }
    : http_endpoint_buffering_hints)

let http_endpoint_access_key_of_yojson = string_of_yojson
let http_endpoint_name_of_yojson = string_of_yojson
let http_endpoint_url_of_yojson = string_of_yojson

let http_endpoint_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = value_for_key http_endpoint_url_of_yojson "Url" _list path;
     name = option_of_yojson (value_for_key http_endpoint_name_of_yojson "Name") _list path;
     access_key =
       option_of_yojson (value_for_key http_endpoint_access_key_of_yojson "AccessKey") _list path;
   }
    : http_endpoint_configuration)

let http_endpoint_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_configuration =
       value_for_key http_endpoint_configuration_of_yojson "EndpointConfiguration" _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key http_endpoint_buffering_hints_of_yojson "BufferingHints")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     request_configuration =
       option_of_yojson
         (value_for_key http_endpoint_request_configuration_of_yojson "RequestConfiguration")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     retry_options =
       option_of_yojson
         (value_for_key http_endpoint_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key http_endpoint_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : http_endpoint_destination_configuration)

let splunk_buffering_size_in_m_bs_of_yojson = int_of_yojson
let splunk_buffering_interval_in_seconds_of_yojson = int_of_yojson

let splunk_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interval_in_seconds =
       option_of_yojson
         (value_for_key splunk_buffering_interval_in_seconds_of_yojson "IntervalInSeconds")
         _list path;
     size_in_m_bs =
       option_of_yojson
         (value_for_key splunk_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
   }
    : splunk_buffering_hints)

let splunk_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedEventsOnly" -> FailedEventsOnly
    | `String "AllEvents" -> AllEvents
    | `String value -> raise (deserialize_unknown_enum_value_error path "SplunkS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SplunkS3BackupMode")
     : splunk_s3_backup_mode)
    : splunk_s3_backup_mode)

let splunk_retry_duration_in_seconds_of_yojson = int_of_yojson

let splunk_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key splunk_retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : splunk_retry_options)

let hec_acknowledgment_timeout_in_seconds_of_yojson = int_of_yojson
let hec_token_of_yojson = string_of_yojson

let hec_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Raw" -> Raw
    | `String "Event" -> Event
    | `String value -> raise (deserialize_unknown_enum_value_error path "HECEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "HECEndpointType")
     : hec_endpoint_type)
    : hec_endpoint_type)

let hec_endpoint_of_yojson = string_of_yojson

let splunk_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hec_endpoint = value_for_key hec_endpoint_of_yojson "HECEndpoint" _list path;
     hec_endpoint_type = value_for_key hec_endpoint_type_of_yojson "HECEndpointType" _list path;
     hec_token = option_of_yojson (value_for_key hec_token_of_yojson "HECToken") _list path;
     hec_acknowledgment_timeout_in_seconds =
       option_of_yojson
         (value_for_key hec_acknowledgment_timeout_in_seconds_of_yojson
            "HECAcknowledgmentTimeoutInSeconds")
         _list path;
     retry_options =
       option_of_yojson (value_for_key splunk_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key splunk_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key splunk_buffering_hints_of_yojson "BufferingHints") _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : splunk_destination_configuration)

let elasticsearch_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedDocumentsOnly" -> FailedDocumentsOnly
    | `String "AllDocuments" -> AllDocuments
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ElasticsearchS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ElasticsearchS3BackupMode")
     : elasticsearch_s3_backup_mode)
    : elasticsearch_s3_backup_mode)

let elasticsearch_retry_duration_in_seconds_of_yojson = int_of_yojson

let elasticsearch_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key elasticsearch_retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : elasticsearch_retry_options)

let elasticsearch_buffering_size_in_m_bs_of_yojson = int_of_yojson
let elasticsearch_buffering_interval_in_seconds_of_yojson = int_of_yojson

let elasticsearch_buffering_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interval_in_seconds =
       option_of_yojson
         (value_for_key elasticsearch_buffering_interval_in_seconds_of_yojson "IntervalInSeconds")
         _list path;
     size_in_m_bs =
       option_of_yojson
         (value_for_key elasticsearch_buffering_size_in_m_bs_of_yojson "SizeInMBs")
         _list path;
   }
    : elasticsearch_buffering_hints)

let elasticsearch_index_rotation_period_of_yojson (tree : t) path =
  ((match tree with
    | `String "NoRotation" -> NoRotation
    | `String "OneHour" -> OneHour
    | `String "OneDay" -> OneDay
    | `String "OneWeek" -> OneWeek
    | `String "OneMonth" -> OneMonth
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ElasticsearchIndexRotationPeriod" value)
    | _ -> raise (deserialize_wrong_type_error path "ElasticsearchIndexRotationPeriod")
     : elasticsearch_index_rotation_period)
    : elasticsearch_index_rotation_period)

let elasticsearch_type_name_of_yojson = string_of_yojson
let elasticsearch_index_name_of_yojson = string_of_yojson
let elasticsearch_cluster_endpoint_of_yojson = string_of_yojson
let elasticsearch_domain_ar_n_of_yojson = string_of_yojson

let elasticsearch_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     domain_ar_n =
       option_of_yojson (value_for_key elasticsearch_domain_ar_n_of_yojson "DomainARN") _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key elasticsearch_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name = value_for_key elasticsearch_index_name_of_yojson "IndexName" _list path;
     type_name =
       option_of_yojson (value_for_key elasticsearch_type_name_of_yojson "TypeName") _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key elasticsearch_index_rotation_period_of_yojson "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key elasticsearch_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key elasticsearch_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key elasticsearch_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : elasticsearch_destination_configuration)

let redshift_s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disabled" -> Disabled
    | `String "Enabled" -> Enabled
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RedshiftS3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "RedshiftS3BackupMode")
     : redshift_s3_backup_mode)
    : redshift_s3_backup_mode)

let redshift_retry_duration_in_seconds_of_yojson = int_of_yojson

let redshift_retry_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_in_seconds =
       option_of_yojson
         (value_for_key redshift_retry_duration_in_seconds_of_yojson "DurationInSeconds")
         _list path;
   }
    : redshift_retry_options)

let password_of_yojson = string_of_yojson
let username_of_yojson = string_of_yojson

let redshift_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     cluster_jdbcur_l = value_for_key cluster_jdbcur_l_of_yojson "ClusterJDBCURL" _list path;
     copy_command = value_for_key copy_command_of_yojson "CopyCommand" _list path;
     username = option_of_yojson (value_for_key username_of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key password_of_yojson "Password") _list path;
     retry_options =
       option_of_yojson (value_for_key redshift_retry_options_of_yojson "RetryOptions") _list path;
     s3_configuration =
       value_for_key s3_destination_configuration_of_yojson "S3Configuration" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key redshift_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_configuration =
       option_of_yojson
         (value_for_key s3_destination_configuration_of_yojson "S3BackupConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : redshift_destination_configuration)

let custom_time_zone_of_yojson = string_of_yojson
let file_extension_of_yojson = string_of_yojson

let dynamic_partitioning_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_options =
       option_of_yojson (value_for_key retry_options_of_yojson "RetryOptions") _list path;
     enabled = option_of_yojson (value_for_key boolean_object_of_yojson "Enabled") _list path;
   }
    : dynamic_partitioning_configuration)

let orc_format_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "V0_11" -> V0_11
    | `String "V0_12" -> V0_12
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrcFormatVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OrcFormatVersion")
     : orc_format_version)
    : orc_format_version)

let proportion_of_yojson = double_of_yojson

let orc_compression_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ZLIB" -> ZLIB
    | `String "SNAPPY" -> SNAPPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrcCompression" value)
    | _ -> raise (deserialize_wrong_type_error path "OrcCompression")
     : orc_compression)
    : orc_compression)

let orc_row_index_stride_of_yojson = int_of_yojson
let orc_stripe_size_bytes_of_yojson = int_of_yojson

let orc_ser_de_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stripe_size_bytes =
       option_of_yojson (value_for_key orc_stripe_size_bytes_of_yojson "StripeSizeBytes") _list path;
     block_size_bytes =
       option_of_yojson (value_for_key block_size_bytes_of_yojson "BlockSizeBytes") _list path;
     row_index_stride =
       option_of_yojson (value_for_key orc_row_index_stride_of_yojson "RowIndexStride") _list path;
     enable_padding =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnablePadding") _list path;
     padding_tolerance =
       option_of_yojson (value_for_key proportion_of_yojson "PaddingTolerance") _list path;
     compression =
       option_of_yojson (value_for_key orc_compression_of_yojson "Compression") _list path;
     bloom_filter_columns =
       option_of_yojson
         (value_for_key list_of_non_empty_strings_without_whitespace_of_yojson "BloomFilterColumns")
         _list path;
     bloom_filter_false_positive_probability =
       option_of_yojson
         (value_for_key proportion_of_yojson "BloomFilterFalsePositiveProbability")
         _list path;
     dictionary_key_threshold =
       option_of_yojson (value_for_key proportion_of_yojson "DictionaryKeyThreshold") _list path;
     format_version =
       option_of_yojson (value_for_key orc_format_version_of_yojson "FormatVersion") _list path;
   }
    : orc_ser_de)

let parquet_writer_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1" -> V1
    | `String "V2" -> V2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParquetWriterVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "ParquetWriterVersion")
     : parquet_writer_version)
    : parquet_writer_version)

let non_negative_integer_object_of_yojson = int_of_yojson

let parquet_compression_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNCOMPRESSED" -> UNCOMPRESSED
    | `String "GZIP" -> GZIP
    | `String "SNAPPY" -> SNAPPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParquetCompression" value)
    | _ -> raise (deserialize_wrong_type_error path "ParquetCompression")
     : parquet_compression)
    : parquet_compression)

let parquet_page_size_bytes_of_yojson = int_of_yojson

let parquet_ser_de_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block_size_bytes =
       option_of_yojson (value_for_key block_size_bytes_of_yojson "BlockSizeBytes") _list path;
     page_size_bytes =
       option_of_yojson (value_for_key parquet_page_size_bytes_of_yojson "PageSizeBytes") _list path;
     compression =
       option_of_yojson (value_for_key parquet_compression_of_yojson "Compression") _list path;
     enable_dictionary_compression =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDictionaryCompression")
         _list path;
     max_padding_bytes =
       option_of_yojson
         (value_for_key non_negative_integer_object_of_yojson "MaxPaddingBytes")
         _list path;
     writer_version =
       option_of_yojson (value_for_key parquet_writer_version_of_yojson "WriterVersion") _list path;
   }
    : parquet_ser_de)

let serializer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parquet_ser_de =
       option_of_yojson (value_for_key parquet_ser_de_of_yojson "ParquetSerDe") _list path;
     orc_ser_de = option_of_yojson (value_for_key orc_ser_de_of_yojson "OrcSerDe") _list path;
   }
    : serializer)

let output_format_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ serializer = option_of_yojson (value_for_key serializer_of_yojson "Serializer") _list path }
    : output_format_configuration)

let list_of_non_empty_strings_of_yojson tree path =
  list_of_yojson non_empty_string_of_yojson tree path

let hive_json_ser_de_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp_formats =
       option_of_yojson
         (value_for_key list_of_non_empty_strings_of_yojson "TimestampFormats")
         _list path;
   }
    : hive_json_ser_de)

let open_x_json_ser_de_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     convert_dots_in_json_keys_to_underscores =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "ConvertDotsInJsonKeysToUnderscores")
         _list path;
     case_insensitive =
       option_of_yojson (value_for_key boolean_object_of_yojson "CaseInsensitive") _list path;
     column_to_json_key_mappings =
       option_of_yojson
         (value_for_key column_to_json_key_mappings_of_yojson "ColumnToJsonKeyMappings")
         _list path;
   }
    : open_x_json_ser_de)

let deserializer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     open_x_json_ser_de =
       option_of_yojson (value_for_key open_x_json_ser_de_of_yojson "OpenXJsonSerDe") _list path;
     hive_json_ser_de =
       option_of_yojson (value_for_key hive_json_ser_de_of_yojson "HiveJsonSerDe") _list path;
   }
    : deserializer)

let input_format_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deserializer =
       option_of_yojson (value_for_key deserializer_of_yojson "Deserializer") _list path;
   }
    : input_format_configuration)

let schema_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "RoleARN")
         _list path;
     catalog_id =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "CatalogId")
         _list path;
     database_name =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "DatabaseName")
         _list path;
     table_name =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "TableName")
         _list path;
     region =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "Region")
         _list path;
     version_id =
       option_of_yojson
         (value_for_key non_empty_string_without_whitespace_of_yojson "VersionId")
         _list path;
   }
    : schema_configuration)

let data_format_conversion_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_configuration =
       option_of_yojson
         (value_for_key schema_configuration_of_yojson "SchemaConfiguration")
         _list path;
     input_format_configuration =
       option_of_yojson
         (value_for_key input_format_configuration_of_yojson "InputFormatConfiguration")
         _list path;
     output_format_configuration =
       option_of_yojson
         (value_for_key output_format_configuration_of_yojson "OutputFormatConfiguration")
         _list path;
     enabled = option_of_yojson (value_for_key boolean_object_of_yojson "Enabled") _list path;
   }
    : data_format_conversion_configuration)

let s3_backup_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disabled" -> Disabled
    | `String "Enabled" -> Enabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3BackupMode" value)
    | _ -> raise (deserialize_wrong_type_error path "S3BackupMode")
     : s3_backup_mode)
    : s3_backup_mode)

let extended_s3_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     bucket_ar_n = value_for_key bucket_ar_n_of_yojson "BucketARN" _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     compression_format =
       option_of_yojson (value_for_key compression_format_of_yojson "CompressionFormat") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_configuration =
       option_of_yojson
         (value_for_key s3_destination_configuration_of_yojson "S3BackupConfiguration")
         _list path;
     data_format_conversion_configuration =
       option_of_yojson
         (value_for_key data_format_conversion_configuration_of_yojson
            "DataFormatConversionConfiguration")
         _list path;
     dynamic_partitioning_configuration =
       option_of_yojson
         (value_for_key dynamic_partitioning_configuration_of_yojson
            "DynamicPartitioningConfiguration")
         _list path;
     file_extension =
       option_of_yojson (value_for_key file_extension_of_yojson "FileExtension") _list path;
     custom_time_zone =
       option_of_yojson (value_for_key custom_time_zone_of_yojson "CustomTimeZone") _list path;
   }
    : extended_s3_destination_configuration)

let key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_OWNED_CMK" -> AWS_OWNED_CMK
    | `String "CUSTOMER_MANAGED_CMK" -> CUSTOMER_MANAGED_CMK
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyType")
     : key_type)
    : key_type)

let delivery_stream_encryption_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_ar_n =
       option_of_yojson (value_for_key awskms_key_arn_for_ss_e_of_yojson "KeyARN") _list path;
     key_type = value_for_key key_type_of_yojson "KeyType" _list path;
   }
    : delivery_stream_encryption_configuration_input)

let kinesis_stream_ar_n_of_yojson = string_of_yojson

let kinesis_stream_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kinesis_stream_ar_n = value_for_key kinesis_stream_ar_n_of_yojson "KinesisStreamARN" _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
   }
    : kinesis_stream_source_configuration)

let throughput_hint_in_m_bs_of_yojson = int_of_yojson

let direct_put_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     throughput_hint_in_m_bs =
       value_for_key throughput_hint_in_m_bs_of_yojson "ThroughputHintInMBs" _list path;
   }
    : direct_put_source_configuration)

let delivery_stream_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DirectPut" -> DirectPut
    | `String "KinesisStreamAsSource" -> KinesisStreamAsSource
    | `String "MSKAsSource" -> MSKAsSource
    | `String "DatabaseAsSource" -> DatabaseAsSource
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryStreamType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStreamType")
     : delivery_stream_type)
    : delivery_stream_type)

let delivery_stream_name_of_yojson = string_of_yojson

let create_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     delivery_stream_type =
       option_of_yojson
         (value_for_key delivery_stream_type_of_yojson "DeliveryStreamType")
         _list path;
     direct_put_source_configuration =
       option_of_yojson
         (value_for_key direct_put_source_configuration_of_yojson "DirectPutSourceConfiguration")
         _list path;
     kinesis_stream_source_configuration =
       option_of_yojson
         (value_for_key kinesis_stream_source_configuration_of_yojson
            "KinesisStreamSourceConfiguration")
         _list path;
     delivery_stream_encryption_configuration_input =
       option_of_yojson
         (value_for_key delivery_stream_encryption_configuration_input_of_yojson
            "DeliveryStreamEncryptionConfigurationInput")
         _list path;
     s3_destination_configuration =
       option_of_yojson
         (value_for_key s3_destination_configuration_of_yojson "S3DestinationConfiguration")
         _list path;
     extended_s3_destination_configuration =
       option_of_yojson
         (value_for_key extended_s3_destination_configuration_of_yojson
            "ExtendedS3DestinationConfiguration")
         _list path;
     redshift_destination_configuration =
       option_of_yojson
         (value_for_key redshift_destination_configuration_of_yojson
            "RedshiftDestinationConfiguration")
         _list path;
     elasticsearch_destination_configuration =
       option_of_yojson
         (value_for_key elasticsearch_destination_configuration_of_yojson
            "ElasticsearchDestinationConfiguration")
         _list path;
     amazonopensearchservice_destination_configuration =
       option_of_yojson
         (value_for_key amazonopensearchservice_destination_configuration_of_yojson
            "AmazonopensearchserviceDestinationConfiguration")
         _list path;
     splunk_destination_configuration =
       option_of_yojson
         (value_for_key splunk_destination_configuration_of_yojson "SplunkDestinationConfiguration")
         _list path;
     http_endpoint_destination_configuration =
       option_of_yojson
         (value_for_key http_endpoint_destination_configuration_of_yojson
            "HttpEndpointDestinationConfiguration")
         _list path;
     tags =
       option_of_yojson
         (value_for_key tag_delivery_stream_input_tag_list_of_yojson "Tags")
         _list path;
     amazon_open_search_serverless_destination_configuration =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_destination_configuration_of_yojson
            "AmazonOpenSearchServerlessDestinationConfiguration")
         _list path;
     msk_source_configuration =
       option_of_yojson
         (value_for_key msk_source_configuration_of_yojson "MSKSourceConfiguration")
         _list path;
     snowflake_destination_configuration =
       option_of_yojson
         (value_for_key snowflake_destination_configuration_of_yojson
            "SnowflakeDestinationConfiguration")
         _list path;
     iceberg_destination_configuration =
       option_of_yojson
         (value_for_key iceberg_destination_configuration_of_yojson
            "IcebergDestinationConfiguration")
         _list path;
     database_source_configuration =
       option_of_yojson
         (value_for_key database_source_configuration_of_yojson "DatabaseSourceConfiguration")
         _list path;
   }
    : create_delivery_stream_input)

let data_of_yojson = blob_of_yojson

let delivery_stream_failure_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND" -> VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND
    | `String "VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED" ->
        VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED
    | `String "RETIRE_KMS_GRANT_FAILED" -> RETIRE_KMS_GRANT_FAILED
    | `String "CREATE_KMS_GRANT_FAILED" -> CREATE_KMS_GRANT_FAILED
    | `String "KMS_ACCESS_DENIED" -> KMS_ACCESS_DENIED
    | `String "DISABLED_KMS_KEY" -> DISABLED_KMS_KEY
    | `String "INVALID_KMS_KEY" -> INVALID_KMS_KEY
    | `String "KMS_KEY_NOT_FOUND" -> KMS_KEY_NOT_FOUND
    | `String "KMS_OPT_IN_REQUIRED" -> KMS_OPT_IN_REQUIRED
    | `String "CREATE_ENI_FAILED" -> CREATE_ENI_FAILED
    | `String "DELETE_ENI_FAILED" -> DELETE_ENI_FAILED
    | `String "SUBNET_NOT_FOUND" -> SUBNET_NOT_FOUND
    | `String "SECURITY_GROUP_NOT_FOUND" -> SECURITY_GROUP_NOT_FOUND
    | `String "ENI_ACCESS_DENIED" -> ENI_ACCESS_DENIED
    | `String "SUBNET_ACCESS_DENIED" -> SUBNET_ACCESS_DENIED
    | `String "SECURITY_GROUP_ACCESS_DENIED" -> SECURITY_GROUP_ACCESS_DENIED
    | `String "UNKNOWN_ERROR" -> UNKNOWN_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliveryStreamFailureType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStreamFailureType")
     : delivery_stream_failure_type)
    : delivery_stream_failure_type)

let failure_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key delivery_stream_failure_type_of_yojson "Type" _list path;
     details = value_for_key non_empty_string_of_yojson "Details" _list path;
   }
    : failure_description)

let snapshot_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "SUSPENDED" -> SUSPENDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus")
     : snapshot_status)
    : snapshot_status)

let snapshot_requested_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "USER" -> USER
    | `String "FIREHOSE" -> FIREHOSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotRequestedBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotRequestedBy")
     : snapshot_requested_by)
    : snapshot_requested_by)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let database_snapshot_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key non_empty_string_without_whitespace_of_yojson "Id" _list path;
     table = value_for_key database_table_name_of_yojson "Table" _list path;
     request_timestamp = value_for_key timestamp_of_yojson "RequestTimestamp" _list path;
     requested_by = value_for_key snapshot_requested_by_of_yojson "RequestedBy" _list path;
     status = value_for_key snapshot_status_of_yojson "Status" _list path;
     failure_description =
       option_of_yojson
         (value_for_key failure_description_of_yojson "FailureDescription")
         _list path;
   }
    : database_snapshot_info)

let database_snapshot_info_list_of_yojson tree path =
  list_of_yojson database_snapshot_info_of_yojson tree path

let database_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key database_type_of_yojson "Type") _list path;
     endpoint = option_of_yojson (value_for_key database_endpoint_of_yojson "Endpoint") _list path;
     port = option_of_yojson (value_for_key database_port_of_yojson "Port") _list path;
     ssl_mode = option_of_yojson (value_for_key ssl_mode_of_yojson "SSLMode") _list path;
     databases = option_of_yojson (value_for_key database_list_of_yojson "Databases") _list path;
     tables = option_of_yojson (value_for_key database_table_list_of_yojson "Tables") _list path;
     columns = option_of_yojson (value_for_key database_column_list_of_yojson "Columns") _list path;
     surrogate_keys =
       option_of_yojson
         (value_for_key database_column_include_or_exclude_list_of_yojson "SurrogateKeys")
         _list path;
     snapshot_watermark_table =
       option_of_yojson
         (value_for_key database_table_name_of_yojson "SnapshotWatermarkTable")
         _list path;
     snapshot_info =
       option_of_yojson
         (value_for_key database_snapshot_info_list_of_yojson "SnapshotInfo")
         _list path;
     database_source_authentication_configuration =
       option_of_yojson
         (value_for_key database_source_authentication_configuration_of_yojson
            "DatabaseSourceAuthenticationConfiguration")
         _list path;
     database_source_vpc_configuration =
       option_of_yojson
         (value_for_key database_source_vpc_configuration_of_yojson "DatabaseSourceVPCConfiguration")
         _list path;
   }
    : database_source_description)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let delete_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     allow_force_delete =
       option_of_yojson (value_for_key boolean_object_of_yojson "AllowForceDelete") _list path;
   }
    : delete_delivery_stream_input)

let delivery_start_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let iceberg_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_table_configuration_list =
       option_of_yojson
         (value_for_key destination_table_configuration_list_of_yojson
            "DestinationTableConfigurationList")
         _list path;
     schema_evolution_configuration =
       option_of_yojson
         (value_for_key schema_evolution_configuration_of_yojson "SchemaEvolutionConfiguration")
         _list path;
     table_creation_configuration =
       option_of_yojson
         (value_for_key table_creation_configuration_of_yojson "TableCreationConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key iceberg_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     retry_options =
       option_of_yojson (value_for_key retry_options_of_yojson "RetryOptions") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     append_only = option_of_yojson (value_for_key boolean_object_of_yojson "AppendOnly") _list path;
     catalog_configuration =
       option_of_yojson
         (value_for_key catalog_configuration_of_yojson "CatalogConfiguration")
         _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
   }
    : iceberg_destination_description)

let snowflake_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_url =
       option_of_yojson (value_for_key snowflake_account_url_of_yojson "AccountUrl") _list path;
     user = option_of_yojson (value_for_key snowflake_user_of_yojson "User") _list path;
     database = option_of_yojson (value_for_key snowflake_database_of_yojson "Database") _list path;
     schema = option_of_yojson (value_for_key snowflake_schema_of_yojson "Schema") _list path;
     table = option_of_yojson (value_for_key snowflake_table_of_yojson "Table") _list path;
     snowflake_role_configuration =
       option_of_yojson
         (value_for_key snowflake_role_configuration_of_yojson "SnowflakeRoleConfiguration")
         _list path;
     data_loading_option =
       option_of_yojson
         (value_for_key snowflake_data_loading_option_of_yojson "DataLoadingOption")
         _list path;
     meta_data_column_name =
       option_of_yojson
         (value_for_key snowflake_meta_data_column_name_of_yojson "MetaDataColumnName")
         _list path;
     content_column_name =
       option_of_yojson
         (value_for_key snowflake_content_column_name_of_yojson "ContentColumnName")
         _list path;
     snowflake_vpc_configuration =
       option_of_yojson
         (value_for_key snowflake_vpc_configuration_of_yojson "SnowflakeVpcConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     retry_options =
       option_of_yojson (value_for_key snowflake_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key snowflake_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key snowflake_buffering_hints_of_yojson "BufferingHints")
         _list path;
   }
    : snowflake_destination_description)

let http_endpoint_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key http_endpoint_url_of_yojson "Url") _list path;
     name = option_of_yojson (value_for_key http_endpoint_name_of_yojson "Name") _list path;
   }
    : http_endpoint_description)

let http_endpoint_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_configuration =
       option_of_yojson
         (value_for_key http_endpoint_description_of_yojson "EndpointConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key http_endpoint_buffering_hints_of_yojson "BufferingHints")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     request_configuration =
       option_of_yojson
         (value_for_key http_endpoint_request_configuration_of_yojson "RequestConfiguration")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     retry_options =
       option_of_yojson
         (value_for_key http_endpoint_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key http_endpoint_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : http_endpoint_destination_description)

let splunk_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hec_endpoint = option_of_yojson (value_for_key hec_endpoint_of_yojson "HECEndpoint") _list path;
     hec_endpoint_type =
       option_of_yojson (value_for_key hec_endpoint_type_of_yojson "HECEndpointType") _list path;
     hec_token = option_of_yojson (value_for_key hec_token_of_yojson "HECToken") _list path;
     hec_acknowledgment_timeout_in_seconds =
       option_of_yojson
         (value_for_key hec_acknowledgment_timeout_in_seconds_of_yojson
            "HECAcknowledgmentTimeoutInSeconds")
         _list path;
     retry_options =
       option_of_yojson (value_for_key splunk_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key splunk_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key splunk_buffering_hints_of_yojson "BufferingHints") _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : splunk_destination_description)

let elasticsearch_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     domain_ar_n =
       option_of_yojson (value_for_key elasticsearch_domain_ar_n_of_yojson "DomainARN") _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key elasticsearch_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name =
       option_of_yojson (value_for_key elasticsearch_index_name_of_yojson "IndexName") _list path;
     type_name =
       option_of_yojson (value_for_key elasticsearch_type_name_of_yojson "TypeName") _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key elasticsearch_index_rotation_period_of_yojson "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key elasticsearch_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key elasticsearch_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key elasticsearch_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     vpc_configuration_description =
       option_of_yojson
         (value_for_key vpc_configuration_description_of_yojson "VpcConfigurationDescription")
         _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : elasticsearch_destination_description)

let redshift_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     cluster_jdbcur_l = value_for_key cluster_jdbcur_l_of_yojson "ClusterJDBCURL" _list path;
     copy_command = value_for_key copy_command_of_yojson "CopyCommand" _list path;
     username = option_of_yojson (value_for_key username_of_yojson "Username") _list path;
     retry_options =
       option_of_yojson (value_for_key redshift_retry_options_of_yojson "RetryOptions") _list path;
     s3_destination_description =
       value_for_key s3_destination_description_of_yojson "S3DestinationDescription" _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key redshift_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3BackupDescription")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : redshift_destination_description)

let extended_s3_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     bucket_ar_n = value_for_key bucket_ar_n_of_yojson "BucketARN" _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints = value_for_key buffering_hints_of_yojson "BufferingHints" _list path;
     compression_format = value_for_key compression_format_of_yojson "CompressionFormat" _list path;
     encryption_configuration =
       value_for_key encryption_configuration_of_yojson "EncryptionConfiguration" _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3BackupDescription")
         _list path;
     data_format_conversion_configuration =
       option_of_yojson
         (value_for_key data_format_conversion_configuration_of_yojson
            "DataFormatConversionConfiguration")
         _list path;
     dynamic_partitioning_configuration =
       option_of_yojson
         (value_for_key dynamic_partitioning_configuration_of_yojson
            "DynamicPartitioningConfiguration")
         _list path;
     file_extension =
       option_of_yojson (value_for_key file_extension_of_yojson "FileExtension") _list path;
     custom_time_zone =
       option_of_yojson (value_for_key custom_time_zone_of_yojson "CustomTimeZone") _list path;
   }
    : extended_s3_destination_description)

let destination_id_of_yojson = string_of_yojson

let destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_id = value_for_key destination_id_of_yojson "DestinationId" _list path;
     s3_destination_description =
       option_of_yojson
         (value_for_key s3_destination_description_of_yojson "S3DestinationDescription")
         _list path;
     extended_s3_destination_description =
       option_of_yojson
         (value_for_key extended_s3_destination_description_of_yojson
            "ExtendedS3DestinationDescription")
         _list path;
     redshift_destination_description =
       option_of_yojson
         (value_for_key redshift_destination_description_of_yojson "RedshiftDestinationDescription")
         _list path;
     elasticsearch_destination_description =
       option_of_yojson
         (value_for_key elasticsearch_destination_description_of_yojson
            "ElasticsearchDestinationDescription")
         _list path;
     amazonopensearchservice_destination_description =
       option_of_yojson
         (value_for_key amazonopensearchservice_destination_description_of_yojson
            "AmazonopensearchserviceDestinationDescription")
         _list path;
     splunk_destination_description =
       option_of_yojson
         (value_for_key splunk_destination_description_of_yojson "SplunkDestinationDescription")
         _list path;
     http_endpoint_destination_description =
       option_of_yojson
         (value_for_key http_endpoint_destination_description_of_yojson
            "HttpEndpointDestinationDescription")
         _list path;
     snowflake_destination_description =
       option_of_yojson
         (value_for_key snowflake_destination_description_of_yojson
            "SnowflakeDestinationDescription")
         _list path;
     amazon_open_search_serverless_destination_description =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_destination_description_of_yojson
            "AmazonOpenSearchServerlessDestinationDescription")
         _list path;
     iceberg_destination_description =
       option_of_yojson
         (value_for_key iceberg_destination_description_of_yojson "IcebergDestinationDescription")
         _list path;
   }
    : destination_description)

let destination_description_list_of_yojson tree path =
  list_of_yojson destination_description_of_yojson tree path

let msk_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     msk_cluster_ar_n =
       option_of_yojson (value_for_key msk_cluster_ar_n_of_yojson "MSKClusterARN") _list path;
     topic_name = option_of_yojson (value_for_key topic_name_of_yojson "TopicName") _list path;
     authentication_configuration =
       option_of_yojson
         (value_for_key authentication_configuration_of_yojson "AuthenticationConfiguration")
         _list path;
     delivery_start_timestamp =
       option_of_yojson
         (value_for_key delivery_start_timestamp_of_yojson "DeliveryStartTimestamp")
         _list path;
     read_from_timestamp =
       option_of_yojson (value_for_key read_from_timestamp_of_yojson "ReadFromTimestamp") _list path;
   }
    : msk_source_description)

let kinesis_stream_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kinesis_stream_ar_n =
       option_of_yojson (value_for_key kinesis_stream_ar_n_of_yojson "KinesisStreamARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     delivery_start_timestamp =
       option_of_yojson
         (value_for_key delivery_start_timestamp_of_yojson "DeliveryStartTimestamp")
         _list path;
   }
    : kinesis_stream_source_description)

let direct_put_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     throughput_hint_in_m_bs =
       option_of_yojson
         (value_for_key throughput_hint_in_m_bs_of_yojson "ThroughputHintInMBs")
         _list path;
   }
    : direct_put_source_description)

let source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_put_source_description =
       option_of_yojson
         (value_for_key direct_put_source_description_of_yojson "DirectPutSourceDescription")
         _list path;
     kinesis_stream_source_description =
       option_of_yojson
         (value_for_key kinesis_stream_source_description_of_yojson "KinesisStreamSourceDescription")
         _list path;
     msk_source_description =
       option_of_yojson
         (value_for_key msk_source_description_of_yojson "MSKSourceDescription")
         _list path;
     database_source_description =
       option_of_yojson
         (value_for_key database_source_description_of_yojson "DatabaseSourceDescription")
         _list path;
   }
    : source_description)

let delivery_stream_version_id_of_yojson = string_of_yojson

let delivery_stream_encryption_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String "ENABLING_FAILED" -> ENABLING_FAILED
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "DISABLING_FAILED" -> DISABLING_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliveryStreamEncryptionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStreamEncryptionStatus")
     : delivery_stream_encryption_status)
    : delivery_stream_encryption_status)

let delivery_stream_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_ar_n =
       option_of_yojson (value_for_key awskms_key_arn_for_ss_e_of_yojson "KeyARN") _list path;
     key_type = option_of_yojson (value_for_key key_type_of_yojson "KeyType") _list path;
     status =
       option_of_yojson
         (value_for_key delivery_stream_encryption_status_of_yojson "Status")
         _list path;
     failure_description =
       option_of_yojson
         (value_for_key failure_description_of_yojson "FailureDescription")
         _list path;
   }
    : delivery_stream_encryption_configuration)

let delivery_stream_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATING_FAILED" -> CREATING_FAILED
    | `String "DELETING" -> DELETING
    | `String "DELETING_FAILED" -> DELETING_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliveryStreamStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStreamStatus")
     : delivery_stream_status)
    : delivery_stream_status)

let delivery_stream_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     delivery_stream_ar_n =
       value_for_key delivery_stream_ar_n_of_yojson "DeliveryStreamARN" _list path;
     delivery_stream_status =
       value_for_key delivery_stream_status_of_yojson "DeliveryStreamStatus" _list path;
     failure_description =
       option_of_yojson
         (value_for_key failure_description_of_yojson "FailureDescription")
         _list path;
     delivery_stream_encryption_configuration =
       option_of_yojson
         (value_for_key delivery_stream_encryption_configuration_of_yojson
            "DeliveryStreamEncryptionConfiguration")
         _list path;
     delivery_stream_type =
       value_for_key delivery_stream_type_of_yojson "DeliveryStreamType" _list path;
     version_id = value_for_key delivery_stream_version_id_of_yojson "VersionId" _list path;
     create_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreateTimestamp") _list path;
     last_update_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdateTimestamp") _list path;
     source = option_of_yojson (value_for_key source_description_of_yojson "Source") _list path;
     destinations = value_for_key destination_description_list_of_yojson "Destinations" _list path;
     has_more_destinations = value_for_key boolean_object_of_yojson "HasMoreDestinations" _list path;
   }
    : delivery_stream_description)

let delivery_stream_name_list_of_yojson tree path =
  list_of_yojson delivery_stream_name_of_yojson tree path

let describe_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_description =
       value_for_key delivery_stream_description_of_yojson "DeliveryStreamDescription" _list path;
   }
    : describe_delivery_stream_output)

let describe_delivery_stream_input_limit_of_yojson = int_of_yojson

let describe_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     limit =
       option_of_yojson
         (value_for_key describe_delivery_stream_input_limit_of_yojson "Limit")
         _list path;
     exclusive_start_destination_id =
       option_of_yojson
         (value_for_key destination_id_of_yojson "ExclusiveStartDestinationId")
         _list path;
   }
    : describe_delivery_stream_input)

let elasticsearch_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     domain_ar_n =
       option_of_yojson (value_for_key elasticsearch_domain_ar_n_of_yojson "DomainARN") _list path;
     cluster_endpoint =
       option_of_yojson
         (value_for_key elasticsearch_cluster_endpoint_of_yojson "ClusterEndpoint")
         _list path;
     index_name =
       option_of_yojson (value_for_key elasticsearch_index_name_of_yojson "IndexName") _list path;
     type_name =
       option_of_yojson (value_for_key elasticsearch_type_name_of_yojson "TypeName") _list path;
     index_rotation_period =
       option_of_yojson
         (value_for_key elasticsearch_index_rotation_period_of_yojson "IndexRotationPeriod")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key elasticsearch_buffering_hints_of_yojson "BufferingHints")
         _list path;
     retry_options =
       option_of_yojson
         (value_for_key elasticsearch_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     document_id_options =
       option_of_yojson (value_for_key document_id_options_of_yojson "DocumentIdOptions") _list path;
   }
    : elasticsearch_destination_update)

let extended_s3_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     bucket_ar_n = option_of_yojson (value_for_key bucket_ar_n_of_yojson "BucketARN") _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "Prefix") _list path;
     error_output_prefix =
       option_of_yojson (value_for_key error_output_prefix_of_yojson "ErrorOutputPrefix") _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     compression_format =
       option_of_yojson (value_for_key compression_format_of_yojson "CompressionFormat") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3BackupUpdate") _list path;
     data_format_conversion_configuration =
       option_of_yojson
         (value_for_key data_format_conversion_configuration_of_yojson
            "DataFormatConversionConfiguration")
         _list path;
     dynamic_partitioning_configuration =
       option_of_yojson
         (value_for_key dynamic_partitioning_configuration_of_yojson
            "DynamicPartitioningConfiguration")
         _list path;
     file_extension =
       option_of_yojson (value_for_key file_extension_of_yojson "FileExtension") _list path;
     custom_time_zone =
       option_of_yojson (value_for_key custom_time_zone_of_yojson "CustomTimeZone") _list path;
   }
    : extended_s3_destination_update)

let update_destination_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let iceberg_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_table_configuration_list =
       option_of_yojson
         (value_for_key destination_table_configuration_list_of_yojson
            "DestinationTableConfigurationList")
         _list path;
     schema_evolution_configuration =
       option_of_yojson
         (value_for_key schema_evolution_configuration_of_yojson "SchemaEvolutionConfiguration")
         _list path;
     table_creation_configuration =
       option_of_yojson
         (value_for_key table_creation_configuration_of_yojson "TableCreationConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key buffering_hints_of_yojson "BufferingHints") _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key iceberg_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     retry_options =
       option_of_yojson (value_for_key retry_options_of_yojson "RetryOptions") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     append_only = option_of_yojson (value_for_key boolean_object_of_yojson "AppendOnly") _list path;
     catalog_configuration =
       option_of_yojson
         (value_for_key catalog_configuration_of_yojson "CatalogConfiguration")
         _list path;
     s3_configuration =
       option_of_yojson
         (value_for_key s3_destination_configuration_of_yojson "S3Configuration")
         _list path;
   }
    : iceberg_destination_update)

let snowflake_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_url =
       option_of_yojson (value_for_key snowflake_account_url_of_yojson "AccountUrl") _list path;
     private_key =
       option_of_yojson (value_for_key snowflake_private_key_of_yojson "PrivateKey") _list path;
     key_passphrase =
       option_of_yojson
         (value_for_key snowflake_key_passphrase_of_yojson "KeyPassphrase")
         _list path;
     user = option_of_yojson (value_for_key snowflake_user_of_yojson "User") _list path;
     database = option_of_yojson (value_for_key snowflake_database_of_yojson "Database") _list path;
     schema = option_of_yojson (value_for_key snowflake_schema_of_yojson "Schema") _list path;
     table = option_of_yojson (value_for_key snowflake_table_of_yojson "Table") _list path;
     snowflake_role_configuration =
       option_of_yojson
         (value_for_key snowflake_role_configuration_of_yojson "SnowflakeRoleConfiguration")
         _list path;
     data_loading_option =
       option_of_yojson
         (value_for_key snowflake_data_loading_option_of_yojson "DataLoadingOption")
         _list path;
     meta_data_column_name =
       option_of_yojson
         (value_for_key snowflake_meta_data_column_name_of_yojson "MetaDataColumnName")
         _list path;
     content_column_name =
       option_of_yojson
         (value_for_key snowflake_content_column_name_of_yojson "ContentColumnName")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     retry_options =
       option_of_yojson (value_for_key snowflake_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key snowflake_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key snowflake_buffering_hints_of_yojson "BufferingHints")
         _list path;
   }
    : snowflake_destination_update)

let http_endpoint_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_configuration =
       option_of_yojson
         (value_for_key http_endpoint_configuration_of_yojson "EndpointConfiguration")
         _list path;
     buffering_hints =
       option_of_yojson
         (value_for_key http_endpoint_buffering_hints_of_yojson "BufferingHints")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     request_configuration =
       option_of_yojson
         (value_for_key http_endpoint_request_configuration_of_yojson "RequestConfiguration")
         _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     retry_options =
       option_of_yojson
         (value_for_key http_endpoint_retry_options_of_yojson "RetryOptions")
         _list path;
     s3_backup_mode =
       option_of_yojson
         (value_for_key http_endpoint_s3_backup_mode_of_yojson "S3BackupMode")
         _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : http_endpoint_destination_update)

let splunk_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hec_endpoint = option_of_yojson (value_for_key hec_endpoint_of_yojson "HECEndpoint") _list path;
     hec_endpoint_type =
       option_of_yojson (value_for_key hec_endpoint_type_of_yojson "HECEndpointType") _list path;
     hec_token = option_of_yojson (value_for_key hec_token_of_yojson "HECToken") _list path;
     hec_acknowledgment_timeout_in_seconds =
       option_of_yojson
         (value_for_key hec_acknowledgment_timeout_in_seconds_of_yojson
            "HECAcknowledgmentTimeoutInSeconds")
         _list path;
     retry_options =
       option_of_yojson (value_for_key splunk_retry_options_of_yojson "RetryOptions") _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key splunk_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     buffering_hints =
       option_of_yojson (value_for_key splunk_buffering_hints_of_yojson "BufferingHints") _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : splunk_destination_update)

let redshift_destination_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     cluster_jdbcur_l =
       option_of_yojson (value_for_key cluster_jdbcur_l_of_yojson "ClusterJDBCURL") _list path;
     copy_command = option_of_yojson (value_for_key copy_command_of_yojson "CopyCommand") _list path;
     username = option_of_yojson (value_for_key username_of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key password_of_yojson "Password") _list path;
     retry_options =
       option_of_yojson (value_for_key redshift_retry_options_of_yojson "RetryOptions") _list path;
     s3_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3Update") _list path;
     processing_configuration =
       option_of_yojson
         (value_for_key processing_configuration_of_yojson "ProcessingConfiguration")
         _list path;
     s3_backup_mode =
       option_of_yojson (value_for_key redshift_s3_backup_mode_of_yojson "S3BackupMode") _list path;
     s3_backup_update =
       option_of_yojson (value_for_key s3_destination_update_of_yojson "S3BackupUpdate") _list path;
     cloud_watch_logging_options =
       option_of_yojson
         (value_for_key cloud_watch_logging_options_of_yojson "CloudWatchLoggingOptions")
         _list path;
     secrets_manager_configuration =
       option_of_yojson
         (value_for_key secrets_manager_configuration_of_yojson "SecretsManagerConfiguration")
         _list path;
   }
    : redshift_destination_update)

let update_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     current_delivery_stream_version_id =
       value_for_key delivery_stream_version_id_of_yojson "CurrentDeliveryStreamVersionId" _list
         path;
     destination_id = value_for_key destination_id_of_yojson "DestinationId" _list path;
     s3_destination_update =
       option_of_yojson
         (value_for_key s3_destination_update_of_yojson "S3DestinationUpdate")
         _list path;
     extended_s3_destination_update =
       option_of_yojson
         (value_for_key extended_s3_destination_update_of_yojson "ExtendedS3DestinationUpdate")
         _list path;
     redshift_destination_update =
       option_of_yojson
         (value_for_key redshift_destination_update_of_yojson "RedshiftDestinationUpdate")
         _list path;
     elasticsearch_destination_update =
       option_of_yojson
         (value_for_key elasticsearch_destination_update_of_yojson "ElasticsearchDestinationUpdate")
         _list path;
     amazonopensearchservice_destination_update =
       option_of_yojson
         (value_for_key amazonopensearchservice_destination_update_of_yojson
            "AmazonopensearchserviceDestinationUpdate")
         _list path;
     splunk_destination_update =
       option_of_yojson
         (value_for_key splunk_destination_update_of_yojson "SplunkDestinationUpdate")
         _list path;
     http_endpoint_destination_update =
       option_of_yojson
         (value_for_key http_endpoint_destination_update_of_yojson "HttpEndpointDestinationUpdate")
         _list path;
     amazon_open_search_serverless_destination_update =
       option_of_yojson
         (value_for_key amazon_open_search_serverless_destination_update_of_yojson
            "AmazonOpenSearchServerlessDestinationUpdate")
         _list path;
     snowflake_destination_update =
       option_of_yojson
         (value_for_key snowflake_destination_update_of_yojson "SnowflakeDestinationUpdate")
         _list path;
     iceberg_destination_update =
       option_of_yojson
         (value_for_key iceberg_destination_update_of_yojson "IcebergDestinationUpdate")
         _list path;
   }
    : update_destination_input)

let untag_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_delivery_stream_input)

let tag_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     tags = value_for_key tag_delivery_stream_input_tag_list_of_yojson "Tags" _list path;
   }
    : tag_delivery_stream_input)

let stop_delivery_stream_encryption_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_delivery_stream_encryption_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
   }
    : stop_delivery_stream_encryption_input)

let start_delivery_stream_encryption_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_delivery_stream_encryption_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     delivery_stream_encryption_configuration_input =
       option_of_yojson
         (value_for_key delivery_stream_encryption_configuration_input_of_yojson
            "DeliveryStreamEncryptionConfigurationInput")
         _list path;
   }
    : start_delivery_stream_encryption_input)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : service_unavailable_exception)

let invalid_source_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : invalid_source_exception)

let put_response_record_id_of_yojson = string_of_yojson

let put_record_batch_response_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_id =
       option_of_yojson (value_for_key put_response_record_id_of_yojson "RecordId") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : put_record_batch_response_entry)

let put_record_batch_response_entry_list_of_yojson tree path =
  list_of_yojson put_record_batch_response_entry_of_yojson tree path

let put_record_batch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_put_count =
       value_for_key non_negative_integer_object_of_yojson "FailedPutCount" _list path;
     encrypted = option_of_yojson (value_for_key boolean_object_of_yojson "Encrypted") _list path;
     request_responses =
       value_for_key put_record_batch_response_entry_list_of_yojson "RequestResponses" _list path;
   }
    : put_record_batch_output)

let record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data = value_for_key data_of_yojson "Data" _list path } : record)

let put_record_batch_request_entry_list_of_yojson tree path =
  list_of_yojson record_of_yojson tree path

let put_record_batch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     records = value_for_key put_record_batch_request_entry_list_of_yojson "Records" _list path;
   }
    : put_record_batch_input)

let put_record_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_id = value_for_key put_response_record_id_of_yojson "RecordId" _list path;
     encrypted = option_of_yojson (value_for_key boolean_object_of_yojson "Encrypted") _list path;
   }
    : put_record_output)

let put_record_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     record = value_for_key record_of_yojson "Record" _list path;
   }
    : put_record_input)

let list_tags_for_delivery_stream_output_tag_list_of_yojson tree path =
  list_of_yojson tag_of_yojson tree path

let list_tags_for_delivery_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key list_tags_for_delivery_stream_output_tag_list_of_yojson "Tags" _list path;
     has_more_tags = value_for_key boolean_object_of_yojson "HasMoreTags" _list path;
   }
    : list_tags_for_delivery_stream_output)

let list_tags_for_delivery_stream_input_limit_of_yojson = int_of_yojson

let list_tags_for_delivery_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_name =
       value_for_key delivery_stream_name_of_yojson "DeliveryStreamName" _list path;
     exclusive_start_tag_key =
       option_of_yojson (value_for_key tag_key_of_yojson "ExclusiveStartTagKey") _list path;
     limit =
       option_of_yojson
         (value_for_key list_tags_for_delivery_stream_input_limit_of_yojson "Limit")
         _list path;
   }
    : list_tags_for_delivery_stream_input)

let list_delivery_streams_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_stream_names =
       value_for_key delivery_stream_name_list_of_yojson "DeliveryStreamNames" _list path;
     has_more_delivery_streams =
       value_for_key boolean_object_of_yojson "HasMoreDeliveryStreams" _list path;
   }
    : list_delivery_streams_output)

let list_delivery_streams_input_limit_of_yojson = int_of_yojson

let list_delivery_streams_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       option_of_yojson
         (value_for_key list_delivery_streams_input_limit_of_yojson "Limit")
         _list path;
     delivery_stream_type =
       option_of_yojson
         (value_for_key delivery_stream_type_of_yojson "DeliveryStreamType")
         _list path;
     exclusive_start_delivery_stream_name =
       option_of_yojson
         (value_for_key delivery_stream_name_of_yojson "ExclusiveStartDeliveryStreamName")
         _list path;
   }
    : list_delivery_streams_input)
