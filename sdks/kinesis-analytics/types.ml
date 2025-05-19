open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kinesisanalytics";
      endpointPrefix = "kinesisanalytics";
      version = "2015-08-14";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec update_application_response = unit
type nonrec input_lambda_processor_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        "Represents an update to the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor} that is used to preprocess the records in the stream.\n"]
type nonrec input_processing_configuration_update =
  {
  input_lambda_processor_update: input_lambda_processor_update }[@@ocaml.doc
                                                                  "Describes updates to an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration}. \n"]
type nonrec kinesis_streams_input_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        "When updating application input configuration, provides information about an Amazon Kinesis stream as the streaming source.\n"]
type nonrec kinesis_firehose_input_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        "When updating application input configuration, provides information about an Amazon Kinesis Firehose delivery stream as the streaming source.\n"]
type nonrec record_format_type =
  | CSV 
  | JSON [@@ocaml.doc ""]
type nonrec json_mapping_parameters = {
  record_row_path: string }[@@ocaml.doc
                             "Provides additional mapping information when JSON is the record format on the streaming source.\n"]
type nonrec csv_mapping_parameters =
  {
  record_column_delimiter: string ;
  record_row_delimiter: string }[@@ocaml.doc
                                  "Provides additional mapping information when the record format uses delimiters, such as CSV. For example, the following sample records use CSV format, where the records use the {i '\\n'} as the row delimiter and a comma (\",\") as the column delimiter: \n\n  [\"name1\", \"address1\"] \n \n   [\"name2\", \"address2\"] \n  "]
type nonrec mapping_parameters =
  {
  csv_mapping_parameters: csv_mapping_parameters option ;
  json_mapping_parameters: json_mapping_parameters option }[@@ocaml.doc
                                                             "When configuring application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"]
type nonrec record_format =
  {
  mapping_parameters: mapping_parameters option ;
  record_format_type: record_format_type }[@@ocaml.doc
                                            " Describes the record format and relevant mapping information that should be applied to schematize the records on the stream. \n"]
type nonrec record_column =
  {
  sql_type: string ;
  mapping: string option ;
  name: string }[@@ocaml.doc
                  "Describes the mapping of each data element in the streaming source to the corresponding column in the in-application stream.\n\n Also used to describe the format of the reference data source.\n "]
type nonrec input_schema_update =
  {
  record_column_updates: record_column list option ;
  record_encoding_update: string option ;
  record_format_update: record_format option }[@@ocaml.doc
                                                "Describes updates for the application's input schema.\n"]
type nonrec input_parallelism_update = {
  count_update: int option }[@@ocaml.doc
                              "Provides updates to the parallelism count.\n"]
type nonrec input_update =
  {
  input_parallelism_update: input_parallelism_update option ;
  input_schema_update: input_schema_update option ;
  kinesis_firehose_input_update: kinesis_firehose_input_update option ;
  kinesis_streams_input_update: kinesis_streams_input_update option ;
  input_processing_configuration_update:
    input_processing_configuration_update option ;
  name_prefix_update: string option ;
  input_id: string }[@@ocaml.doc
                      "Describes updates to a specific input configuration (identified by the [InputId] of an application). \n"]
type nonrec kinesis_streams_output_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        " When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis stream configured as the destination. \n"]
type nonrec kinesis_firehose_output_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        " When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis Firehose delivery stream configured as the destination. \n"]
type nonrec lambda_output_update =
  {
  role_arn_update: string option ;
  resource_arn_update: string option }[@@ocaml.doc
                                        "When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an AWS Lambda function configured as the destination.\n"]
type nonrec destination_schema = {
  record_format_type: record_format_type }[@@ocaml.doc
                                            "Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}. \n"]
type nonrec output_update =
  {
  destination_schema_update: destination_schema option ;
  lambda_output_update: lambda_output_update option ;
  kinesis_firehose_output_update: kinesis_firehose_output_update option ;
  kinesis_streams_output_update: kinesis_streams_output_update option ;
  name_update: string option ;
  output_id: string }[@@ocaml.doc
                       " Describes updates to the output configuration identified by the [OutputId]. \n"]
type nonrec s3_reference_data_source_update =
  {
  reference_role_arn_update: string option ;
  file_key_update: string option ;
  bucket_arn_update: string option }[@@ocaml.doc
                                      "Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.\n"]
type nonrec source_schema =
  {
  record_columns: record_column list ;
  record_encoding: string option ;
  record_format: record_format }[@@ocaml.doc
                                  "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"]
type nonrec reference_data_source_update =
  {
  reference_schema_update: source_schema option ;
  s3_reference_data_source_update: s3_reference_data_source_update option ;
  table_name_update: string option ;
  reference_id: string }[@@ocaml.doc
                          "When you update a reference data source configuration for an application, this object provides all the updated values (such as the source bucket name and object key name), the in-application table name that is created, and updated mapping information that maps the data in the Amazon S3 object to the in-application reference table that is created.\n"]
type nonrec cloud_watch_logging_option_update =
  {
  role_arn_update: string option ;
  log_stream_arn_update: string option ;
  cloud_watch_logging_option_id: string }[@@ocaml.doc
                                           "Describes CloudWatch logging option updates.\n"]
type nonrec application_update =
  {
  cloud_watch_logging_option_updates:
    cloud_watch_logging_option_update list option ;
  reference_data_source_updates: reference_data_source_update list option ;
  output_updates: output_update list option ;
  application_code_update: string option ;
  input_updates: input_update list option }[@@ocaml.doc
                                             "Describes updates to apply to an existing Amazon Kinesis Analytics application.\n"]
type nonrec update_application_request =
  {
  application_update: application_update ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation. \n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Specified application can't be found.\n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "Application is not available for this operation.\n"]
type nonrec invalid_argument_exception = {
  message: string option }[@@ocaml.doc
                            "Specified input parameter value is invalid.\n"]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            "Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time.\n"]
type nonrec code_validation_exception = {
  message: string option }[@@ocaml.doc
                            "User-provided application code (query) is invalid. This can be a simple syntax error.\n"]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec too_many_tags_exception = {
  message: string option }[@@ocaml.doc
                            "Application created with too many tags, or too many tags added to an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50.\n"]
type nonrec unable_to_detect_schema_exception =
  {
  processed_input_records: string list option ;
  raw_input_records: string list option ;
  message: string option }[@@ocaml.doc
                            "Data format is not valid. Amazon Kinesis Analytics is not able to detect schema for the given streaming source.\n"]
type nonrec tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "A key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec stop_application_response = unit
type nonrec stop_application_request = {
  application_name: string }[@@ocaml.doc "\n"]
type nonrec start_application_response = unit
type nonrec input_starting_position =
  | LAST_STOPPED_POINT 
  | TRIM_HORIZON 
  | NOW [@@ocaml.doc ""]
type nonrec input_starting_position_configuration =
  {
  input_starting_position: input_starting_position option }[@@ocaml.doc
                                                             "Describes the point at which the application reads from the streaming source.\n"]
type nonrec input_configuration =
  {
  input_starting_position_configuration:
    input_starting_position_configuration ;
  id: string }[@@ocaml.doc
                "When you start your application, you provide this configuration, which identifies the input source and the point in the input source at which you want the application to start processing records.\n"]
type nonrec start_application_request =
  {
  input_configurations: input_configuration list ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec invalid_application_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "User-provided application configuration is not valid.\n"]
type nonrec service_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "The service is unavailable. Back off and retry the operation. \n"]
type nonrec s3_reference_data_source_description =
  {
  reference_role_ar_n: string ;
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "Provides the bucket name and object key name that stores the reference data.\n"]
type nonrec s3_reference_data_source =
  {
  reference_role_ar_n: string ;
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role Amazon Kinesis Analytics can assume to read this object on your behalf.\n\n An Amazon Kinesis Analytics application loads reference data only once. If the data changes, you call the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation to trigger reloading of data into your application.\n "]
type nonrec s3_configuration =
  {
  file_key: string ;
  bucket_ar_n: string ;
  role_ar_n: string }[@@ocaml.doc
                       "Provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used to access the bucket, and the name of the Amazon S3 object that contains the data.\n"]
type nonrec resource_provisioned_throughput_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Discovery failed to get a record from the streaming source because of the Amazon Kinesis Streams ProvisionedThroughputExceededException. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html}GetRecords} in the Amazon Kinesis Streams API Reference.\n"]
type nonrec reference_data_source_description =
  {
  reference_schema: source_schema option ;
  s3_reference_data_source_description: s3_reference_data_source_description ;
  table_name: string ;
  reference_id: string }[@@ocaml.doc
                          "Describes the reference data source configured for an application.\n"]
type nonrec reference_data_source =
  {
  reference_schema: source_schema ;
  s3_reference_data_source: s3_reference_data_source option ;
  table_name: string }[@@ocaml.doc
                        "Describes the reference data source by providing the source information (S3 bucket name and object key name), the resulting in-application table name that is created, and the necessary schema to map the data elements in the Amazon S3 object to the in-application table.\n"]
type nonrec kinesis_streams_output =
  {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           "When configuring application output, identifies an Amazon Kinesis stream as the destination. You provide the stream Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream on your behalf.\n"]
type nonrec kinesis_firehose_output =
  {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           "When configuring application output, identifies an Amazon Kinesis Firehose delivery stream as the destination. You provide the stream Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to the stream on your behalf.\n"]
type nonrec lambda_output = {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           "When configuring application output, identifies an AWS Lambda function as the destination. You provide the function Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the function on your behalf. \n"]
type nonrec output =
  {
  destination_schema: destination_schema ;
  lambda_output: lambda_output option ;
  kinesis_firehose_output: kinesis_firehose_output option ;
  kinesis_streams_output: kinesis_streams_output option ;
  name: string }[@@ocaml.doc
                  " Describes application output configuration in which you identify an in-application stream and a destination where you want the in-application stream data to be written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream. \n\n \n \n  For limits on how many destinations an application can write and other limitations, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}. \n  "]
type nonrec kinesis_streams_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  " For an application output, describes the Amazon Kinesis stream configured as its destination. \n"]
type nonrec kinesis_firehose_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  " For an application output, describes the Amazon Kinesis Firehose delivery stream configured as its destination. \n"]
type nonrec lambda_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  "For an application output, describes the AWS Lambda function configured as its destination. \n"]
type nonrec output_description =
  {
  destination_schema: destination_schema option ;
  lambda_output_description: lambda_output_description option ;
  kinesis_firehose_output_description:
    kinesis_firehose_output_description option ;
  kinesis_streams_output_description:
    kinesis_streams_output_description option ;
  name: string option ;
  output_id: string option }[@@ocaml.doc
                              "Describes the application output configuration, which includes the in-application stream name and the destination where the stream data is written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream. \n"]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec application_status =
  | UPDATING 
  | RUNNING 
  | READY 
  | STOPPING 
  | STARTING 
  | DELETING [@@ocaml.doc ""]
type nonrec application_summary =
  {
  application_status: application_status ;
  application_ar_n: string ;
  application_name: string }[@@ocaml.doc
                              " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.\n \n   Provides application summary information, including the application Amazon Resource Name (ARN), name, and status.\n   "]
type nonrec list_applications_response =
  {
  has_more_applications: bool ;
  application_summaries: application_summary list }[@@ocaml.doc "\n"]
type nonrec list_applications_request =
  {
  exclusive_start_application_name: string option ;
  limit: int option }[@@ocaml.doc "\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Exceeded the number of applications allowed.\n"]
type nonrec kinesis_streams_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  " Describes the Amazon Kinesis stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_streams_input =
  {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           " Identifies an Amazon Kinesis stream as the streaming source. You provide the stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"]
type nonrec kinesis_firehose_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  " Describes the Amazon Kinesis Firehose delivery stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_firehose_input =
  {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           " Identifies an Amazon Kinesis Firehose delivery stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.\n"]
type nonrec discover_input_schema_response =
  {
  raw_input_records: string list option ;
  processed_input_records: string list option ;
  parsed_input_records: string list list option ;
  input_schema: source_schema option }[@@ocaml.doc "\n"]
type nonrec input_lambda_processor =
  {
  role_ar_n: string ;
  resource_ar_n: string }[@@ocaml.doc
                           "An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda function. \n"]
type nonrec input_processing_configuration =
  {
  input_lambda_processor: input_lambda_processor }[@@ocaml.doc
                                                    "Provides a description of a processor that is used to preprocess the records in the stream before being processed by your application code. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.\n"]
type nonrec discover_input_schema_request =
  {
  input_processing_configuration: input_processing_configuration option ;
  s3_configuration: s3_configuration option ;
  input_starting_position_configuration:
    input_starting_position_configuration option ;
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc ""]
type nonrec input_lambda_processor_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  "An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda expression.\n"]
type nonrec input_processing_configuration_description =
  {
  input_lambda_processor_description:
    input_lambda_processor_description option }[@@ocaml.doc
                                                 "Provides configuration information about an input processor. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.\n"]
type nonrec input_parallelism = {
  count: int option }[@@ocaml.doc
                       "Describes the number of in-application streams to create for a given streaming source. For information about parallelism, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec input_description =
  {
  input_starting_position_configuration:
    input_starting_position_configuration option ;
  input_parallelism: input_parallelism option ;
  input_schema: source_schema option ;
  kinesis_firehose_input_description:
    kinesis_firehose_input_description option ;
  kinesis_streams_input_description: kinesis_streams_input_description option ;
  input_processing_configuration_description:
    input_processing_configuration_description option ;
  in_app_stream_names: string list option ;
  name_prefix: string option ;
  input_id: string option }[@@ocaml.doc
                             "Describes the application input configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec cloud_watch_logging_option_description =
  {
  role_ar_n: string ;
  log_stream_ar_n: string ;
  cloud_watch_logging_option_id: string option }[@@ocaml.doc
                                                  "Description of the CloudWatch logging option.\n"]
type nonrec application_detail =
  {
  application_version_id: int ;
  application_code: string option ;
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  reference_data_source_descriptions:
    reference_data_source_description list option ;
  output_descriptions: output_description list option ;
  input_descriptions: input_description list option ;
  last_update_timestamp: CoreTypes.Timestamp.t option ;
  create_timestamp: CoreTypes.Timestamp.t option ;
  application_status: application_status ;
  application_ar_n: string ;
  application_description: string option ;
  application_name: string }[@@ocaml.doc
                              " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.\n \n   Provides a description of the application, including the application Amazon Resource Name (ARN), status, latest version, and input and output configuration.\n   "]
type nonrec describe_application_response =
  {
  application_detail: application_detail }[@@ocaml.doc "\n"]
type nonrec describe_application_request = {
  application_name: string }[@@ocaml.doc "\n"]
type nonrec delete_application_reference_data_source_response = unit
type nonrec delete_application_reference_data_source_request =
  {
  reference_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_output_response = unit
type nonrec delete_application_output_request =
  {
  output_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec delete_application_input_processing_configuration_response = unit
type nonrec delete_application_input_processing_configuration_request =
  {
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_response = unit
type nonrec delete_application_cloud_watch_logging_option_request =
  {
  cloud_watch_logging_option_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_response = unit
type nonrec delete_application_request =
  {
  create_timestamp: CoreTypes.Timestamp.t ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec create_application_response =
  {
  application_summary: application_summary }[@@ocaml.doc "TBD\n"]
type nonrec input =
  {
  input_schema: source_schema ;
  input_parallelism: input_parallelism option ;
  kinesis_firehose_input: kinesis_firehose_input option ;
  kinesis_streams_input: kinesis_streams_input option ;
  input_processing_configuration: input_processing_configuration option ;
  name_prefix: string }[@@ocaml.doc
                         "When you configure the application input, you specify the streaming source, the in-application stream name that is created, and the mapping between the two. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. \n"]
type nonrec cloud_watch_logging_option =
  {
  role_ar_n: string ;
  log_stream_ar_n: string }[@@ocaml.doc
                             "Provides a description of CloudWatch logging options, including the log stream Amazon Resource Name (ARN) and the role ARN.\n"]
type nonrec create_application_request =
  {
  tags: tag list option ;
  application_code: string option ;
  cloud_watch_logging_options: cloud_watch_logging_option list option ;
  outputs: output list option ;
  inputs: input list option ;
  application_description: string option ;
  application_name: string }[@@ocaml.doc "TBD\n"]
type nonrec add_application_reference_data_source_response = unit
type nonrec add_application_reference_data_source_request =
  {
  reference_data_source: reference_data_source ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec add_application_output_response = unit
type nonrec add_application_output_request =
  {
  output: output ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec add_application_input_processing_configuration_response = unit
type nonrec add_application_input_processing_configuration_request =
  {
  input_processing_configuration: input_processing_configuration ;
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_input_response = unit
type nonrec add_application_input_request =
  {
  input: input ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc "\n"]
type nonrec add_application_cloud_watch_logging_option_response = unit
type nonrec add_application_cloud_watch_logging_option_request =
  {
  cloud_watch_logging_option: cloud_watch_logging_option ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]