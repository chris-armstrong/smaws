type nonrec update_application_response = unit[@@ocaml.doc ""]
type nonrec application_name = string[@@ocaml.doc ""]
type nonrec application_version_id = int[@@ocaml.doc ""]
type nonrec id = string[@@ocaml.doc ""]
type nonrec in_app_stream_name = string[@@ocaml.doc ""]
type nonrec resource_ar_n = string[@@ocaml.doc ""]
type nonrec role_ar_n = string[@@ocaml.doc ""]
type nonrec input_lambda_processor_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "The ARN of the new IAM role that is used to access the AWS Lambda function.\n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the new {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess the records in the stream.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda} \n  \n   "]}
[@@ocaml.doc
  "Represents an update to the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor} that is used to preprocess the records in the stream.\n"]
type nonrec input_processing_configuration_update =
  {
  input_lambda_processor_update: input_lambda_processor_update
    [@ocaml.doc
      "Provides update information for an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor}.\n"]}
[@@ocaml.doc
  "Describes updates to an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration}. \n"]
type nonrec kinesis_streams_input_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.\n"]}
[@@ocaml.doc
  "When updating application input configuration, provides information about an Amazon Kinesis stream as the streaming source.\n"]
type nonrec kinesis_firehose_input_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery stream to read.\n"]}
[@@ocaml.doc
  "When updating application input configuration, provides information about an Amazon Kinesis Firehose delivery stream as the streaming source.\n"]
type nonrec record_format_type =
  | CSV [@ocaml.doc ""]
  | JSON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec record_row_path = string[@@ocaml.doc ""]
type nonrec json_mapping_parameters =
  {
  record_row_path: record_row_path
    [@ocaml.doc "Path to the top-level parent that contains the records.\n"]}
[@@ocaml.doc
  "Provides additional mapping information when JSON is the record format on the streaming source.\n"]
type nonrec record_row_delimiter = string[@@ocaml.doc ""]
type nonrec record_column_delimiter = string[@@ocaml.doc ""]
type nonrec csv_mapping_parameters =
  {
  record_column_delimiter: record_column_delimiter
    [@ocaml.doc
      "Column delimiter. For example, in a CSV format, a comma (\",\") is the typical column delimiter.\n"];
  record_row_delimiter: record_row_delimiter
    [@ocaml.doc
      "Row delimiter. For example, in a CSV format, {i '\\n'} is the typical row delimiter.\n"]}
[@@ocaml.doc
  "Provides additional mapping information when the record format uses delimiters, such as CSV. For example, the following sample records use CSV format, where the records use the {i '\\n'} as the row delimiter and a comma (\",\") as the column delimiter: \n\n  [\"name1\", \"address1\"] \n \n   [\"name2\", \"address2\"] \n  "]
type nonrec mapping_parameters =
  {
  csv_mapping_parameters: csv_mapping_parameters option
    [@ocaml.doc
      "Provides additional mapping information when the record format uses delimiters (for example, CSV).\n"];
  json_mapping_parameters: json_mapping_parameters option
    [@ocaml.doc
      "Provides additional mapping information when JSON is the record format on the streaming source.\n"]}
[@@ocaml.doc
  "When configuring application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"]
type nonrec record_format =
  {
  mapping_parameters: mapping_parameters option
    [@ocaml.doc
      "When configuring application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"];
  record_format_type: record_format_type
    [@ocaml.doc "The type of record format.\n"]}[@@ocaml.doc
                                                  " Describes the record format and relevant mapping information that should be applied to schematize the records on the stream. \n"]
type nonrec record_encoding = string[@@ocaml.doc ""]
type nonrec record_column_name = string[@@ocaml.doc ""]
type nonrec record_column_mapping = string[@@ocaml.doc ""]
type nonrec record_column_sql_type = string[@@ocaml.doc ""]
type nonrec record_column =
  {
  sql_type: record_column_sql_type
    [@ocaml.doc
      "Type of column created in the in-application input stream or reference table.\n"];
  mapping: record_column_mapping option
    [@ocaml.doc
      "Reference to the data element in the streaming input or the reference data source. This element is required if the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_RecordFormat.html#analytics-Type-RecordFormat-RecordFormatTypel}RecordFormatType} is [JSON].\n"];
  name: record_column_name
    [@ocaml.doc
      "Name of the column created in the in-application input stream or reference table.\n"]}
[@@ocaml.doc
  "Describes the mapping of each data element in the streaming source to the corresponding column in the in-application stream.\n\n Also used to describe the format of the reference data source.\n "]
type nonrec record_columns = record_column list[@@ocaml.doc ""]
type nonrec input_schema_update =
  {
  record_column_updates: record_columns option
    [@ocaml.doc
      "A list of [RecordColumn] objects. Each object describes the mapping of the streaming source element to the corresponding column in the in-application stream. \n"];
  record_encoding_update: record_encoding option
    [@ocaml.doc
      "Specifies the encoding of the records in the streaming source. For example, UTF-8.\n"];
  record_format_update: record_format option
    [@ocaml.doc
      "Specifies the format of the records on the streaming source.\n"]}
[@@ocaml.doc "Describes updates for the application's input schema.\n"]
type nonrec input_parallelism_count = int[@@ocaml.doc ""]
type nonrec input_parallelism_update =
  {
  count_update: input_parallelism_count option
    [@ocaml.doc
      "Number of in-application streams to create for the specified streaming source.\n"]}
[@@ocaml.doc "Provides updates to the parallelism count.\n"]
type nonrec input_update =
  {
  input_parallelism_update: input_parallelism_update option
    [@ocaml.doc
      "Describes the parallelism updates (the number in-application streams Amazon Kinesis Analytics creates for the specific streaming source).\n"];
  input_schema_update: input_schema_update option
    [@ocaml.doc
      "Describes the data format on the streaming source, and how record elements on the streaming source map to columns of the in-application stream that is created.\n"];
  kinesis_firehose_input_update: kinesis_firehose_input_update option
    [@ocaml.doc
      "If an Amazon Kinesis Firehose delivery stream is the streaming source to be updated, provides an updated stream ARN and IAM role ARN.\n"];
  kinesis_streams_input_update: kinesis_streams_input_update option
    [@ocaml.doc
      "If an Amazon Kinesis stream is the streaming source to be updated, provides an updated stream Amazon Resource Name (ARN) and IAM role ARN.\n"];
  input_processing_configuration_update:
    input_processing_configuration_update option
    [@ocaml.doc "Describes updates for an input processing configuration.\n"];
  name_prefix_update: in_app_stream_name option
    [@ocaml.doc
      "Name prefix for in-application streams that Amazon Kinesis Analytics creates for the specific streaming source.\n"];
  input_id: id
    [@ocaml.doc "Input ID of the application input to be updated.\n"]}
[@@ocaml.doc
  "Describes updates to a specific input configuration (identified by the [InputId] of an application). \n"]
type nonrec input_updates = input_update list[@@ocaml.doc ""]
type nonrec application_code = string[@@ocaml.doc ""]
type nonrec kinesis_streams_output_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to write the output.\n"]}
[@@ocaml.doc
  " When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis stream configured as the destination. \n"]
type nonrec kinesis_firehose_output_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream to write to.\n"]}
[@@ocaml.doc
  " When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis Firehose delivery stream configured as the destination. \n"]
type nonrec lambda_output_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on your behalf. You need to grant the necessary permissions to this role. \n"];
  resource_arn_update: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the destination Lambda function.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda} \n  \n   "]}
[@@ocaml.doc
  "When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an AWS Lambda function configured as the destination.\n"]
type nonrec destination_schema =
  {
  record_format_type: record_format_type
    [@ocaml.doc
      "Specifies the format of the records on the output stream.\n"]}
[@@ocaml.doc
  "Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}. \n"]
type nonrec output_update =
  {
  destination_schema_update: destination_schema option
    [@ocaml.doc
      "Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.\n"];
  lambda_output_update: lambda_output_update option
    [@ocaml.doc
      "Describes an AWS Lambda function as the destination for the output.\n"];
  kinesis_firehose_output_update: kinesis_firehose_output_update option
    [@ocaml.doc
      "Describes an Amazon Kinesis Firehose delivery stream as the destination for the output.\n"];
  kinesis_streams_output_update: kinesis_streams_output_update option
    [@ocaml.doc
      "Describes an Amazon Kinesis stream as the destination for the output.\n"];
  name_update: in_app_stream_name option
    [@ocaml.doc
      "If you want to specify a different in-application stream for this output configuration, use this field to specify the new in-application stream name.\n"];
  output_id: id
    [@ocaml.doc
      "Identifies the specific output configuration that you want to update.\n"]}
[@@ocaml.doc
  " Describes updates to the output configuration identified by the [OutputId]. \n"]
type nonrec output_updates = output_update list[@@ocaml.doc ""]
type nonrec in_app_table_name = string[@@ocaml.doc ""]
type nonrec bucket_ar_n = string[@@ocaml.doc ""]
type nonrec file_key = string[@@ocaml.doc ""]
type nonrec s3_reference_data_source_update =
  {
  reference_role_arn_update: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object and populate the in-application.\n"];
  file_key_update: file_key option [@ocaml.doc "Object key name.\n"];
  bucket_arn_update: bucket_ar_n option
    [@ocaml.doc "Amazon Resource Name (ARN) of the S3 bucket.\n"]}[@@ocaml.doc
                                                                    "Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.\n"]
type nonrec source_schema =
  {
  record_columns: record_columns
    [@ocaml.doc "A list of [RecordColumn] objects.\n"];
  record_encoding: record_encoding option
    [@ocaml.doc
      "Specifies the encoding of the records in the streaming source. For example, UTF-8.\n"];
  record_format: record_format
    [@ocaml.doc
      "Specifies the format of the records on the streaming source.\n"]}
[@@ocaml.doc
  "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"]
type nonrec reference_data_source_update =
  {
  reference_schema_update: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream. \n"];
  s3_reference_data_source_update: s3_reference_data_source_update option
    [@ocaml.doc
      "Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.\n"];
  table_name_update: in_app_table_name option
    [@ocaml.doc
      "In-application table name that is created by this update.\n"];
  reference_id: id
    [@ocaml.doc
      "ID of the reference data source being updated. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get this value.\n"]}
[@@ocaml.doc
  "When you update a reference data source configuration for an application, this object provides all the updated values (such as the source bucket name and object key name), the in-application table name that is created, and updated mapping information that maps the data in the Amazon S3 object to the in-application reference table that is created.\n"]
type nonrec reference_data_source_updates = reference_data_source_update list
[@@ocaml.doc ""]
type nonrec log_stream_ar_n = string[@@ocaml.doc ""]
type nonrec cloud_watch_logging_option_update =
  {
  role_arn_update: role_ar_n option
    [@ocaml.doc
      "IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role used must have the [PutLogEvents] policy action enabled.\n"];
  log_stream_arn_update: log_stream_ar_n option
    [@ocaml.doc
      "ARN of the CloudWatch log to receive application messages.\n"];
  cloud_watch_logging_option_id: id
    [@ocaml.doc "ID of the CloudWatch logging option to update\n"]}[@@ocaml.doc
                                                                    "Describes CloudWatch logging option updates.\n"]
type nonrec cloud_watch_logging_option_updates =
  cloud_watch_logging_option_update list[@@ocaml.doc ""]
type nonrec application_update =
  {
  cloud_watch_logging_option_updates:
    cloud_watch_logging_option_updates option
    [@ocaml.doc "Describes application CloudWatch logging option updates.\n"];
  reference_data_source_updates: reference_data_source_updates option
    [@ocaml.doc "Describes application reference data source updates.\n"];
  output_updates: output_updates option
    [@ocaml.doc "Describes application output configuration updates.\n"];
  application_code_update: application_code option
    [@ocaml.doc "Describes application code updates.\n"];
  input_updates: input_updates option
    [@ocaml.doc "Describes application input configuration updates.\n"]}
[@@ocaml.doc
  "Describes updates to apply to an existing Amazon Kinesis Analytics application.\n"]
type nonrec update_application_request =
  {
  application_update: application_update
    [@ocaml.doc "Describes application updates.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The current application version ID. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get this value.\n"];
  application_name: application_name
    [@ocaml.doc
      "Name of the Amazon Kinesis Analytics application to update.\n"]}
[@@ocaml.doc ""]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec unsupported_operation_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation. \n"]
type nonrec resource_not_found_exception =
  {
  message: error_message option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                    "Specified application can't be found.\n"]
type nonrec resource_in_use_exception =
  {
  message: error_message option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                    "Application is not available for this operation.\n"]
type nonrec invalid_argument_exception =
  {
  message: error_message option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                    "Specified input parameter value is invalid.\n"]
type nonrec concurrent_modification_exception =
  {
  message: error_message option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                    "Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time.\n"]
type nonrec code_validation_exception =
  {
  message: error_message option [@ocaml.doc "Test\n"]}[@@ocaml.doc
                                                        "User-provided application code (query) is invalid. This can be a simple syntax error.\n"]
type nonrec untag_resource_response = unit[@@ocaml.doc ""]
type nonrec kinesis_analytics_ar_n = string[@@ocaml.doc ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_keys = tag_key list[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: tag_keys
    [@ocaml.doc
      "A list of keys of tags to remove from the specified application.\n"];
  resource_ar_n: kinesis_analytics_ar_n
    [@ocaml.doc
      "The ARN of the Kinesis Analytics application from which to remove the tags.\n"]}
[@@ocaml.doc ""]
type nonrec too_many_tags_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Application created with too many tags, or too many tags added to an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50.\n"]
type nonrec raw_input_record = string[@@ocaml.doc ""]
type nonrec raw_input_records = raw_input_record list[@@ocaml.doc ""]
type nonrec processed_input_record = string[@@ocaml.doc ""]
type nonrec processed_input_records = processed_input_record list[@@ocaml.doc
                                                                   ""]
type nonrec unable_to_detect_schema_exception =
  {
  processed_input_records: processed_input_records option [@ocaml.doc ""];
  raw_input_records: raw_input_records option [@ocaml.doc ""];
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Data format is not valid. Amazon Kinesis Analytics is not able to detect schema for the given streaming source.\n"]
type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value option
    [@ocaml.doc "The value of the key-value tag. The value is optional.\n"];
  key: tag_key [@ocaml.doc "The key of the key-value tag.\n"]}[@@ocaml.doc
                                                                "A key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"]
type nonrec tags = tag list[@@ocaml.doc ""]
type nonrec tag_resource_response = unit[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tags
    [@ocaml.doc "The key-value tags to assign to the application.\n"];
  resource_ar_n: kinesis_analytics_ar_n
    [@ocaml.doc "The ARN of the application to assign the tags.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec stop_application_response = unit[@@ocaml.doc ""]
type nonrec stop_application_request =
  {
  application_name: application_name
    [@ocaml.doc "Name of the running application to stop.\n"]}[@@ocaml.doc
                                                                "\n"]
type nonrec start_application_response = unit[@@ocaml.doc ""]
type nonrec input_starting_position =
  | LAST_STOPPED_POINT [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
  | NOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec input_starting_position_configuration =
  {
  input_starting_position: input_starting_position option
    [@ocaml.doc
      "The starting position on the stream.\n\n {ul\n       {-   [NOW] - Start reading just after the most recent record in the stream, start at the request time stamp that the customer issued.\n           \n            }\n       {-   [TRIM_HORIZON] - Start reading at the last untrimmed record in the stream, which is the oldest record available in the stream. This option is not available for an Amazon Kinesis Firehose delivery stream.\n           \n            }\n       {-   [LAST_STOPPED_POINT] - Resume reading from where the application last stopped reading.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Describes the point at which the application reads from the streaming source.\n"]
type nonrec input_configuration =
  {
  input_starting_position_configuration:
    input_starting_position_configuration
    [@ocaml.doc
      "Point at which you want the application to start processing records from the streaming source.\n"];
  id: id
    [@ocaml.doc
      "Input source ID. You can get this ID by calling the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.\n"]}
[@@ocaml.doc
  "When you start your application, you provide this configuration, which identifies the input source and the point in the input source at which you want the application to start processing records.\n"]
type nonrec input_configurations = input_configuration list[@@ocaml.doc ""]
type nonrec start_application_request =
  {
  input_configurations: input_configurations
    [@ocaml.doc
      "Identifies the specific input, by ID, that the application starts consuming. Amazon Kinesis Analytics starts reading the streaming source associated with the input. You can also specify where in the streaming source you want Amazon Kinesis Analytics to start reading.\n"];
  application_name: application_name
    [@ocaml.doc "Name of the application.\n"]}[@@ocaml.doc "\n"]
type nonrec invalid_application_configuration_exception =
  {
  message: error_message option [@ocaml.doc "test\n"]}[@@ocaml.doc
                                                        "User-provided application configuration is not valid.\n"]
type nonrec service_unavailable_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The service is unavailable. Back off and retry the operation. \n"]
type nonrec s3_reference_data_source_description =
  {
  reference_role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf to populate the in-application reference table.\n"];
  file_key: file_key [@ocaml.doc "Amazon S3 object key name.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "Amazon Resource Name (ARN) of the S3 bucket.\n"]}[@@ocaml.doc
                                                                    "Provides the bucket name and object key name that stores the reference data.\n"]
type nonrec s3_reference_data_source =
  {
  reference_role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that the service can assume to read data on your behalf. This role must have permission for the [s3:GetObject] action on the object and trust policy that allows Amazon Kinesis Analytics service principal to assume this role.\n"];
  file_key: file_key
    [@ocaml.doc "Object key name containing reference data.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "Amazon Resource Name (ARN) of the S3 bucket.\n"]}[@@ocaml.doc
                                                                    "Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role Amazon Kinesis Analytics can assume to read this object on your behalf.\n\n An Amazon Kinesis Analytics application loads reference data only once. If the data changes, you call the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation to trigger reloading of data into your application.\n "]
type nonrec s3_configuration =
  {
  file_key: file_key
    [@ocaml.doc "The name of the object that contains the data.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "ARN of the S3 bucket that contains the data.\n"];
  role_ar_n: role_ar_n
    [@ocaml.doc "IAM ARN of the role used to access the data.\n"]}[@@ocaml.doc
                                                                    "Provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used to access the bucket, and the name of the Amazon S3 object that contains the data.\n"]
type nonrec resource_provisioned_throughput_exceeded_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Discovery failed to get a record from the streaming source because of the Amazon Kinesis Streams ProvisionedThroughputExceededException. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html}GetRecords} in the Amazon Kinesis Streams API Reference.\n"]
type nonrec reference_data_source_description =
  {
  reference_schema: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"];
  s3_reference_data_source_description: s3_reference_data_source_description
    [@ocaml.doc
      "Provides the S3 bucket name, the object key name that contains the reference data. It also provides the Amazon Resource Name (ARN) of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object and populate the in-application reference table.\n"];
  table_name: in_app_table_name
    [@ocaml.doc
      "The in-application table name created by the specific reference data source configuration.\n"];
  reference_id: id
    [@ocaml.doc
      "ID of the reference data source. This is the ID that Amazon Kinesis Analytics assigns when you add the reference data source to your application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource} operation.\n"]}
[@@ocaml.doc
  "Describes the reference data source configured for an application.\n"]
type nonrec reference_data_source_descriptions =
  reference_data_source_description list[@@ocaml.doc ""]
type nonrec reference_data_source =
  {
  reference_schema: source_schema
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"];
  s3_reference_data_source: s3_reference_data_source option
    [@ocaml.doc
      "Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role Amazon Kinesis Analytics can assume to read this object on your behalf. An Amazon Kinesis Analytics application loads reference data only once. If the data changes, you call the [UpdateApplication] operation to trigger reloading of data into your application. \n"];
  table_name: in_app_table_name
    [@ocaml.doc "Name of the in-application table to create.\n"]}[@@ocaml.doc
                                                                   "Describes the reference data source by providing the source information (S3 bucket name and object key name), the resulting in-application table name that is created, and the necessary schema to map the data elements in the Amazon S3 object to the in-application table.\n"]
type nonrec parsed_input_record_field = string[@@ocaml.doc ""]
type nonrec parsed_input_record = parsed_input_record_field list[@@ocaml.doc
                                                                  ""]
type nonrec parsed_input_records = parsed_input_record list[@@ocaml.doc ""]
type nonrec kinesis_streams_output =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "ARN of the destination Amazon Kinesis stream to write to.\n"]}
[@@ocaml.doc
  "When configuring application output, identifies an Amazon Kinesis stream as the destination. You provide the stream Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream on your behalf.\n"]
type nonrec kinesis_firehose_output =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "ARN of the destination Amazon Kinesis Firehose delivery stream to write to.\n"]}
[@@ocaml.doc
  "When configuring application output, identifies an Amazon Kinesis Firehose delivery stream as the destination. You provide the stream Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to the stream on your behalf.\n"]
type nonrec lambda_output =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on your behalf. You need to grant the necessary permissions to this role. \n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the destination Lambda function to write to.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda} \n  \n   "]}
[@@ocaml.doc
  "When configuring application output, identifies an AWS Lambda function as the destination. You provide the function Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the function on your behalf. \n"]
type nonrec output =
  {
  destination_schema: destination_schema
    [@ocaml.doc
      "Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.\n"];
  lambda_output: lambda_output option
    [@ocaml.doc "Identifies an AWS Lambda function as the destination.\n"];
  kinesis_firehose_output: kinesis_firehose_output option
    [@ocaml.doc
      "Identifies an Amazon Kinesis Firehose delivery stream as the destination.\n"];
  kinesis_streams_output: kinesis_streams_output option
    [@ocaml.doc "Identifies an Amazon Kinesis stream as the destination.\n"];
  name: in_app_stream_name
    [@ocaml.doc "Name of the in-application stream.\n"]}[@@ocaml.doc
                                                          " Describes application output configuration in which you identify an in-application stream and a destination where you want the in-application stream data to be written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream. \n\n \n \n  For limits on how many destinations an application can write and other limitations, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}. \n  "]
type nonrec outputs = output list[@@ocaml.doc ""]
type nonrec kinesis_streams_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc "Amazon Resource Name (ARN) of the Amazon Kinesis stream.\n"]}
[@@ocaml.doc
  " For an application output, describes the Amazon Kinesis stream configured as its destination. \n"]
type nonrec kinesis_firehose_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.\n"]}
[@@ocaml.doc
  " For an application output, describes the Amazon Kinesis Firehose delivery stream configured as its destination. \n"]
type nonrec lambda_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the destination Lambda function.\n"]}
[@@ocaml.doc
  "For an application output, describes the AWS Lambda function configured as its destination. \n"]
type nonrec output_description =
  {
  destination_schema: destination_schema option
    [@ocaml.doc "Data format used for writing data to the destination.\n"];
  lambda_output_description: lambda_output_description option
    [@ocaml.doc
      "Describes the AWS Lambda function configured as the destination where output is written.\n"];
  kinesis_firehose_output_description:
    kinesis_firehose_output_description option
    [@ocaml.doc
      "Describes the Amazon Kinesis Firehose delivery stream configured as the destination where output is written.\n"];
  kinesis_streams_output_description:
    kinesis_streams_output_description option
    [@ocaml.doc
      "Describes Amazon Kinesis stream configured as the destination where output is written.\n"];
  name: in_app_stream_name option
    [@ocaml.doc "Name of the in-application stream configured as output.\n"];
  output_id: id option
    [@ocaml.doc "A unique identifier for the output configuration.\n"]}
[@@ocaml.doc
  "Describes the application output configuration, which includes the in-application stream name and the destination where the stream data is written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream. \n"]
type nonrec output_descriptions = output_description list[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tags option
    [@ocaml.doc "The key-value tags assigned to the application.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: kinesis_analytics_ar_n
    [@ocaml.doc "The ARN of the application for which to retrieve tags.\n"]}
[@@ocaml.doc ""]
type nonrec application_status =
  | UPDATING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec application_summary =
  {
  application_status: application_status
    [@ocaml.doc "Status of the application.\n"];
  application_ar_n: resource_ar_n [@ocaml.doc "ARN of the application.\n"];
  application_name: application_name
    [@ocaml.doc "Name of the application.\n"]}[@@ocaml.doc
                                                " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.\n \n   Provides application summary information, including the application Amazon Resource Name (ARN), name, and status.\n   "]
type nonrec application_summaries = application_summary list[@@ocaml.doc ""]
type nonrec boolean_object = bool[@@ocaml.doc ""]
type nonrec list_applications_response =
  {
  has_more_applications: boolean_object
    [@ocaml.doc "Returns true if there are more applications to retrieve.\n"];
  application_summaries: application_summaries
    [@ocaml.doc "List of [ApplicationSummary] objects. \n"]}[@@ocaml.doc
                                                              "\n"]
type nonrec list_applications_input_limit = int[@@ocaml.doc ""]
type nonrec list_applications_request =
  {
  exclusive_start_application_name: application_name option
    [@ocaml.doc
      "Name of the application to start the list with. When using pagination to retrieve the list, you don't need to specify this parameter in the first request. However, in subsequent requests, you add the last application name from the previous response to get the next page of applications.\n"];
  limit: list_applications_input_limit option
    [@ocaml.doc "Maximum number of applications to list.\n"]}[@@ocaml.doc
                                                               "\n"]
type nonrec limit_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                    "Exceeded the number of applications allowed.\n"]
type nonrec kinesis_streams_input_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc "Amazon Resource Name (ARN) of the Amazon Kinesis stream.\n"]}
[@@ocaml.doc
  " Describes the Amazon Kinesis stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_streams_input =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.\n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc "ARN of the input Amazon Kinesis stream to read.\n"]}
[@@ocaml.doc
  " Identifies an Amazon Kinesis stream as the streaming source. You provide the stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"]
type nonrec kinesis_firehose_input_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics assumes to access the stream.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.\n"]}
[@@ocaml.doc
  " Describes the Amazon Kinesis Firehose delivery stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_firehose_input =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to make sure that the role has the necessary permissions to access the stream.\n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc "ARN of the input delivery stream.\n"]}[@@ocaml.doc
                                                         " Identifies an Amazon Kinesis Firehose delivery stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"]
type nonrec discover_input_schema_response =
  {
  raw_input_records: raw_input_records option
    [@ocaml.doc "Raw stream data that was sampled to infer the schema.\n"];
  processed_input_records: processed_input_records option
    [@ocaml.doc
      "Stream data that was modified by the processor specified in the [InputProcessingConfiguration] parameter.\n"];
  parsed_input_records: parsed_input_records option
    [@ocaml.doc
      "An array of elements, where each element corresponds to a row in a stream record (a stream record can have more than one row).\n"];
  input_schema: source_schema option
    [@ocaml.doc
      "Schema inferred from the streaming source. It identifies the format of the data in the streaming source and how each data element maps to corresponding columns in the in-application stream that you can create.\n"]}
[@@ocaml.doc "\n"]
type nonrec input_lambda_processor =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "The ARN of the IAM role that is used to access the AWS Lambda function.\n"];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The ARN of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that operates on records in the stream.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda} \n  \n   "]}
[@@ocaml.doc
  "An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda function. \n"]
type nonrec input_processing_configuration =
  {
  input_lambda_processor: input_lambda_processor
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor} that is used to preprocess the records in the stream before being processed by your application code.\n"]}
[@@ocaml.doc
  "Provides a description of a processor that is used to preprocess the records in the stream before being processed by your application code. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.\n"]
type nonrec discover_input_schema_request =
  {
  input_processing_configuration: input_processing_configuration option
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} to use to preprocess the records before discovering the schema of the records.\n"];
  s3_configuration: s3_configuration option
    [@ocaml.doc
      "Specify this parameter to discover a schema from data in an Amazon S3 object.\n"];
  input_starting_position_configuration:
    input_starting_position_configuration option
    [@ocaml.doc
      "Point at which you want Amazon Kinesis Analytics to start reading records from the specified streaming source discovery purposes.\n"];
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc "Amazon Resource Name (ARN) of the streaming source.\n"]}
[@@ocaml.doc ""]
type nonrec application_description = string[@@ocaml.doc ""]
type nonrec in_app_stream_names = in_app_stream_name list[@@ocaml.doc ""]
type nonrec input_lambda_processor_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that is used to access the AWS Lambda function.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc
      "The ARN of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess the records in the stream.\n"]}
[@@ocaml.doc
  "An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda expression.\n"]
type nonrec input_processing_configuration_description =
  {
  input_lambda_processor_description:
    input_lambda_processor_description option
    [@ocaml.doc
      "Provides configuration information about the associated {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessorDescription.html}InputLambdaProcessorDescription}.\n"]}
[@@ocaml.doc
  "Provides configuration information about an input processor. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.\n"]
type nonrec input_parallelism =
  {
  count: input_parallelism_count option
    [@ocaml.doc
      "Number of in-application streams to create. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}. \n"]}
[@@ocaml.doc
  "Describes the number of in-application streams to create for a given streaming source. For information about parallelism, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec input_description =
  {
  input_starting_position_configuration:
    input_starting_position_configuration option
    [@ocaml.doc
      "Point at which the application is configured to read from the input stream.\n"];
  input_parallelism: input_parallelism option
    [@ocaml.doc
      "Describes the configured parallelism (number of in-application streams mapped to the streaming source).\n"];
  input_schema: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created. \n"];
  kinesis_firehose_input_description:
    kinesis_firehose_input_description option
    [@ocaml.doc
      "If an Amazon Kinesis Firehose delivery stream is configured as a streaming source, provides the delivery stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"];
  kinesis_streams_input_description: kinesis_streams_input_description option
    [@ocaml.doc
      "If an Amazon Kinesis stream is configured as streaming source, provides Amazon Kinesis stream's Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"];
  input_processing_configuration_description:
    input_processing_configuration_description option
    [@ocaml.doc
      "The description of the preprocessor that executes on records in this input before the application's code is run.\n"];
  in_app_stream_names: in_app_stream_names option
    [@ocaml.doc
      "Returns the in-application stream names that are mapped to the stream source.\n"];
  name_prefix: in_app_stream_name option
    [@ocaml.doc "In-application name prefix.\n"];
  input_id: id option
    [@ocaml.doc
      "Input ID associated with the application input. This is the ID that Amazon Kinesis Analytics assigns to each input configuration you add to your application. \n"]}
[@@ocaml.doc
  "Describes the application input configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec input_descriptions = input_description list[@@ocaml.doc ""]
type nonrec cloud_watch_logging_option_description =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role used must have the [PutLogEvents] policy action enabled.\n"];
  log_stream_ar_n: log_stream_ar_n
    [@ocaml.doc
      "ARN of the CloudWatch log to receive application messages.\n"];
  cloud_watch_logging_option_id: id option
    [@ocaml.doc "ID of the CloudWatch logging option description.\n"]}
[@@ocaml.doc "Description of the CloudWatch logging option.\n"]
type nonrec cloud_watch_logging_option_descriptions =
  cloud_watch_logging_option_description list[@@ocaml.doc ""]
type nonrec application_detail =
  {
  application_version_id: application_version_id
    [@ocaml.doc "Provides the current application version.\n"];
  application_code: application_code option
    [@ocaml.doc
      "Returns the application code that you provided to perform data analysis on any of the in-application streams in your application.\n"];
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_descriptions option
    [@ocaml.doc
      "Describes the CloudWatch log streams that are configured to receive application messages. For more information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}. \n"];
  reference_data_source_descriptions:
    reference_data_source_descriptions option
    [@ocaml.doc
      "Describes reference data sources configured for the application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"];
  output_descriptions: output_descriptions option
    [@ocaml.doc
      "Describes the application output configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}. \n"];
  input_descriptions: input_descriptions option
    [@ocaml.doc
      "Describes the application input configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"];
  last_update_timestamp: timestamp option
    [@ocaml.doc "Time stamp when the application was last updated.\n"];
  create_timestamp: timestamp option
    [@ocaml.doc "Time stamp when the application version was created.\n"];
  application_status: application_status
    [@ocaml.doc "Status of the application.\n"];
  application_ar_n: resource_ar_n [@ocaml.doc "ARN of the application.\n"];
  application_description: application_description option
    [@ocaml.doc "Description of the application.\n"];
  application_name: application_name
    [@ocaml.doc "Name of the application.\n"]}[@@ocaml.doc
                                                " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.\n \n   Provides a description of the application, including the application Amazon Resource Name (ARN), status, latest version, and input and output configuration.\n   "]
type nonrec describe_application_response =
  {
  application_detail: application_detail
    [@ocaml.doc
      "Provides a description of the application, such as the application Amazon Resource Name (ARN), status, latest version, and input and output configuration details.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_application_request =
  {
  application_name: application_name
    [@ocaml.doc "Name of the application.\n"]}[@@ocaml.doc "\n"]
type nonrec delete_application_reference_data_source_response = unit[@@ocaml.doc
                                                                    ""]
type nonrec delete_application_reference_data_source_request =
  {
  reference_id: id
    [@ocaml.doc
      "ID of the reference data source. When you add a reference data source to your application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource}, Amazon Kinesis Analytics assigns an ID. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the reference ID. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Version of the application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc "Name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_output_response = unit[@@ocaml.doc ""]
type nonrec delete_application_output_request =
  {
  output_id: id
    [@ocaml.doc
      "The ID of the configuration to delete. Each output configuration that is added to the application, either when the application is created or later using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationOutput.html}AddApplicationOutput} operation, has a unique ID. You need to provide the ID to uniquely identify the output configuration that you want to delete from the application configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the specific [OutputId]. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Amazon Kinesis Analytics application version. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. \n"];
  application_name: application_name
    [@ocaml.doc "Amazon Kinesis Analytics application name.\n"]}[@@ocaml.doc
                                                                  "\n"]
type nonrec delete_application_input_processing_configuration_response = unit
[@@ocaml.doc ""]
type nonrec delete_application_input_processing_configuration_request =
  {
  input_id: id
    [@ocaml.doc
      "The ID of the input configuration from which to delete the input processing configuration. You can get a list of the input IDs for an application by using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc "The version ID of the Kinesis Analytics application.\n"];
  application_name: application_name
    [@ocaml.doc "The Kinesis Analytics application name.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_response = unit
[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_request =
  {
  cloud_watch_logging_option_id: id
    [@ocaml.doc
      "The [CloudWatchLoggingOptionId] of the CloudWatch logging option to delete. You can get the [CloudWatchLoggingOptionId] by using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc "The version ID of the Kinesis Analytics application.\n"];
  application_name: application_name
    [@ocaml.doc "The Kinesis Analytics application name.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_response = unit[@@ocaml.doc ""]
type nonrec delete_application_request =
  {
  create_timestamp: timestamp
    [@ocaml.doc
      " You can use the [DescribeApplication] operation to get this value. \n"];
  application_name: application_name
    [@ocaml.doc
      "Name of the Amazon Kinesis Analytics application to delete.\n"]}
[@@ocaml.doc "\n"]
type nonrec create_application_response =
  {
  application_summary: application_summary
    [@ocaml.doc
      "In response to your [CreateApplication] request, Amazon Kinesis Analytics returns a response with a summary of the application it created, including the application Amazon Resource Name (ARN), name, and status.\n"]}
[@@ocaml.doc "TBD\n"]
type nonrec input =
  {
  input_schema: source_schema
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created.\n\n Also used to describe the format of the reference data source.\n "];
  input_parallelism: input_parallelism option
    [@ocaml.doc
      "Describes the number of in-application streams to create. \n\n Data from your source is routed to these in-application input streams.\n \n   (see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.\n  "];
  kinesis_firehose_input: kinesis_firehose_input option
    [@ocaml.doc
      "If the streaming source is an Amazon Kinesis Firehose delivery stream, identifies the delivery stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.\n\n Note: Either [KinesisStreamsInput] or [KinesisFirehoseInput] is required.\n "];
  kinesis_streams_input: kinesis_streams_input option
    [@ocaml.doc
      "If the streaming source is an Amazon Kinesis stream, identifies the stream's Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.\n\n Note: Either [KinesisStreamsInput] or [KinesisFirehoseInput] is required.\n "];
  input_processing_configuration: input_processing_configuration option
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} for the input. An input processor transforms records as they are received from the stream, before the application's SQL code executes. Currently, the only input processing configuration available is {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor}.\n"];
  name_prefix: in_app_stream_name
    [@ocaml.doc
      "Name prefix to use when creating an in-application stream. Suppose that you specify a prefix \"MyInApplicationStream.\" Amazon Kinesis Analytics then creates one or more (as per the [InputParallelism] count you specified) in-application streams with names \"MyInApplicationStream_001,\" \"MyInApplicationStream_002,\" and so on. \n"]}
[@@ocaml.doc
  "When you configure the application input, you specify the streaming source, the in-application stream name that is created, and the mapping between the two. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec inputs = input list[@@ocaml.doc ""]
type nonrec cloud_watch_logging_option =
  {
  role_ar_n: role_ar_n
    [@ocaml.doc
      "IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role that is used must have the [PutLogEvents] policy action enabled.\n"];
  log_stream_ar_n: log_stream_ar_n
    [@ocaml.doc
      "ARN of the CloudWatch log to receive application messages.\n"]}
[@@ocaml.doc
  "Provides a description of CloudWatch logging options, including the log stream Amazon Resource Name (ARN) and the role ARN.\n"]
type nonrec cloud_watch_logging_options = cloud_watch_logging_option list
[@@ocaml.doc ""]
type nonrec create_application_request =
  {
  tags: tags option
    [@ocaml.doc
      "A list of one or more tags to assign to the application. A tag is a key-value pair that identifies an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"];
  application_code: application_code option
    [@ocaml.doc
      "One or more SQL statements that read input data, transform it, and generate output. For example, you can write a SQL statement that reads data from one in-application stream, generates a running average of the number of advertisement clicks by vendor, and insert resulting rows in another in-application stream using pumps. For more information about the typical pattern, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-app-code.html}Application Code}. \n\n You can provide such series of SQL statements, where output of one statement can be used as the input for the next statement. You store intermediate results by creating in-application streams and pumps.\n \n  Note that the application code must create the streams with names specified in the [Outputs]. For example, if your [Outputs] defines output streams named [ExampleOutputStream1] and [ExampleOutputStream2], then your application code must create these streams. \n  "];
  cloud_watch_logging_options: cloud_watch_logging_options option
    [@ocaml.doc
      "Use this parameter to configure a CloudWatch log stream to monitor application configuration errors. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}.\n"];
  outputs: outputs option
    [@ocaml.doc
      "You can configure application output to write data from any of the in-application streams to up to three destinations.\n\n These destinations can be Amazon Kinesis streams, Amazon Kinesis Firehose delivery streams, AWS Lambda destinations, or any combination of the three.\n \n  In the configuration, you specify the in-application stream name, the destination stream or Lambda function Amazon Resource Name (ARN), and the format to use when writing data. You must also provide an IAM role that Amazon Kinesis Analytics can assume to write to the destination stream or Lambda function on your behalf.\n  \n   In the output configuration, you also provide the output stream or Lambda function ARN. For stream destinations, you provide the format of data in the stream (for example, JSON, CSV). You also must provide an IAM role that Amazon Kinesis Analytics can assume to write to the stream or Lambda function on your behalf.\n   "];
  inputs: inputs option
    [@ocaml.doc
      "Use this parameter to configure the application input.\n\n You can configure your application to receive input from a single streaming source. In this configuration, you map this streaming source to an in-application stream that is created. Your application code can then query the in-application stream like a table (you can think of it as a constantly updating table).\n \n  For the streaming source, you provide its Amazon Resource Name (ARN) and format of data on the stream (for example, JSON, CSV, etc.). You also must provide an IAM role that Amazon Kinesis Analytics can assume to read this stream on your behalf.\n  \n   To create the in-application stream, you need to specify a schema to transform your data into a schematized version used in SQL. In the schema, you provide the necessary mapping of the data elements in the streaming source to record columns in the in-app stream.\n   "];
  application_description: application_description option
    [@ocaml.doc "Summary description of the application.\n"];
  application_name: application_name
    [@ocaml.doc
      "Name of your Amazon Kinesis Analytics application (for example, [sample-app]).\n"]}
[@@ocaml.doc "TBD\n"]
type nonrec add_application_reference_data_source_response = unit[@@ocaml.doc
                                                                   ""]
type nonrec add_application_reference_data_source_request =
  {
  reference_data_source: reference_data_source
    [@ocaml.doc
      "The reference data source can be an object in your Amazon S3 bucket. Amazon Kinesis Analytics reads the object and copies the data into the in-application table that is created. You provide an S3 bucket, object key name, and the resulting in-application table that is created. You must also provide an IAM role with the necessary permissions that Amazon Kinesis Analytics can assume to read the object from your S3 bucket on your behalf.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Version of the application for which you are adding the reference data source. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc "Name of an existing application.\n"]}[@@ocaml.doc "\n"]
type nonrec add_application_output_response = unit[@@ocaml.doc ""]
type nonrec add_application_output_request =
  {
  output: output
    [@ocaml.doc
      "An array of objects, each describing one output configuration. In the output configuration, you specify the name of an in-application stream, a destination (that is, an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery stream, or an AWS Lambda function), and record the formation to use when writing to the destination.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Version of the application to which you want to add the output configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. \n"];
  application_name: application_name
    [@ocaml.doc
      "Name of the application to which you want to add the output configuration.\n"]}
[@@ocaml.doc "\n"]
type nonrec add_application_input_processing_configuration_response = unit
[@@ocaml.doc ""]
type nonrec add_application_input_processing_configuration_request =
  {
  input_processing_configuration: input_processing_configuration
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} to add to the application.\n"];
  input_id: id
    [@ocaml.doc
      "The ID of the input configuration to add the input processing configuration to. You can get a list of the input IDs for an application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Version of the application to which you want to add the input processing configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc
      "Name of the application to which you want to add the input processing configuration.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_input_response = unit[@@ocaml.doc ""]
type nonrec add_application_input_request =
  {
  input: input
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_Input.html}Input} to add.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "Current version of your Amazon Kinesis Analytics application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to find the current application version.\n"];
  application_name: application_name
    [@ocaml.doc
      "Name of your existing Amazon Kinesis Analytics application to which you want to add the streaming source.\n"]}
[@@ocaml.doc "\n"]
type nonrec add_application_cloud_watch_logging_option_response = unit
[@@ocaml.doc ""]
type nonrec add_application_cloud_watch_logging_option_request =
  {
  cloud_watch_logging_option: cloud_watch_logging_option
    [@ocaml.doc
      "Provides the CloudWatch log stream Amazon Resource Name (ARN) and the IAM role ARN. Note: To write application messages to CloudWatch, the IAM role that is used must have the [PutLogEvents] policy action enabled.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc "The version ID of the Kinesis Analytics application.\n"];
  application_name: application_name
    [@ocaml.doc "The Kinesis Analytics application name.\n"]}[@@ocaml.doc ""]