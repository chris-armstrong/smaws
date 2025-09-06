type nonrec zip_file_content = bytes[@@ocaml.doc ""]
type nonrec log_level =
  | DEBUG [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | WARN [@ocaml.doc ""]
  | INFO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec zeppelin_monitoring_configuration_update =
  {
  log_level_update: log_level
    [@ocaml.doc
      "Updates to the logging level for Apache Zeppelin within a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "Updates to the monitoring configuration for Apache Zeppelin within a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec zeppelin_monitoring_configuration_description =
  {
  log_level: log_level option
    [@ocaml.doc
      "Describes the verbosity of the CloudWatch Logs for an application.\n"]}
[@@ocaml.doc
  "The monitoring configuration for Apache Zeppelin within a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec zeppelin_monitoring_configuration =
  {
  log_level: log_level
    [@ocaml.doc "The verbosity of the CloudWatch Logs for an application.\n"]}
[@@ocaml.doc
  "Describes configuration parameters for Amazon CloudWatch logging for a Managed Service for Apache Flink Studio notebook. For more information about CloudWatch logging, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html}Monitoring}.\n"]
type nonrec database_ar_n = string[@@ocaml.doc ""]
type nonrec glue_data_catalog_configuration_update =
  {
  database_arn_update: database_ar_n
    [@ocaml.doc "The updated Amazon Resource Name (ARN) of the database.\n"]}
[@@ocaml.doc
  "Updates to the configuration of the Glue Data Catalog that you use for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec catalog_configuration_update =
  {
  glue_data_catalog_configuration_update:
    glue_data_catalog_configuration_update
    [@ocaml.doc
      "Updates to the configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "Updates to the configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec bucket_ar_n = string[@@ocaml.doc ""]
type nonrec base_path = string[@@ocaml.doc ""]
type nonrec s3_content_base_location_update =
  {
  base_path_update: base_path option
    [@ocaml.doc "The updated S3 bucket path.\n"];
  bucket_arn_update: bucket_ar_n option
    [@ocaml.doc "The updated Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc
  "The information required to update the S3 base location that holds the application.\n"]
type nonrec deploy_as_application_configuration_update =
  {
  s3_content_location_update: s3_content_base_location_update option
    [@ocaml.doc
      "Updates to the location that holds the data required to specify an Amazon Data Analytics application.\n"]}
[@@ocaml.doc
  "Updates to the configuration information required to deploy an Amazon Data Analytics Studio notebook as an application with durable state.\n"]
type nonrec artifact_type =
  | DEPENDENCY_JAR [@ocaml.doc ""]
  | UDF [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec file_key = string[@@ocaml.doc ""]
type nonrec object_version = string[@@ocaml.doc ""]
type nonrec s3_content_location =
  {
  object_version: object_version option
    [@ocaml.doc
      "The version of the object containing the application code.\n"];
  file_key: file_key
    [@ocaml.doc
      "The file key for the object containing the application code.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the S3 bucket containing the application code.\n"]}
[@@ocaml.doc
  "For a Managed Service for Apache Flink application provides a description of an Amazon S3 object, including the Amazon Resource Name (ARN) of the S3 bucket, the name of the Amazon S3 object that contains the data, and the version number of the Amazon S3 object that contains the data. \n"]
type nonrec maven_group_id = string[@@ocaml.doc ""]
type nonrec maven_artifact_id = string[@@ocaml.doc ""]
type nonrec maven_version = string[@@ocaml.doc ""]
type nonrec maven_reference =
  {
  version: maven_version [@ocaml.doc "The version of the Maven reference.\n"];
  artifact_id: maven_artifact_id
    [@ocaml.doc "The artifact ID of the Maven reference.\n"];
  group_id: maven_group_id
    [@ocaml.doc "The group ID of the Maven reference.\n"]}[@@ocaml.doc
                                                            "The information required to specify a Maven reference. You can use Maven references to specify dependency JAR files.\n"]
type nonrec custom_artifact_configuration =
  {
  maven_reference: maven_reference option
    [@ocaml.doc
      "The parameters required to fully specify a Maven reference.\n"];
  s3_content_location: s3_content_location option [@ocaml.doc ""];
  artifact_type: artifact_type
    [@ocaml.doc
      " [UDF] stands for user-defined functions. This type of artifact must be in an S3 bucket. A [DEPENDENCY_JAR] can be in either Maven or an S3 bucket.\n"]}
[@@ocaml.doc
  "Specifies dependency JARs, as well as JAR files that contain user-defined functions (UDF).\n"]
type nonrec custom_artifacts_configuration_list =
  custom_artifact_configuration list[@@ocaml.doc ""]
type nonrec zeppelin_application_configuration_update =
  {
  custom_artifacts_configuration_update:
    custom_artifacts_configuration_list option
    [@ocaml.doc
      "Updates to the customer artifacts. Custom artifacts are dependency JAR files and user-defined functions (UDF).\n"];
  deploy_as_application_configuration_update:
    deploy_as_application_configuration_update option [@ocaml.doc ""];
  catalog_configuration_update: catalog_configuration_update option
    [@ocaml.doc
      "Updates to the configuration of the Amazon Glue Data Catalog that is associated with the Managed Service for Apache Flink Studio notebook.\n"];
  monitoring_configuration_update:
    zeppelin_monitoring_configuration_update option
    [@ocaml.doc
      "Updates to the monitoring configuration of a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "Updates to the configuration of Managed Service for Apache Flink Studio notebook.\n"]
type nonrec glue_data_catalog_configuration_description =
  {
  database_ar_n: database_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the database.\n"]}
[@@ocaml.doc
  "The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API transforms that you write in an application.\n"]
type nonrec catalog_configuration_description =
  {
  glue_data_catalog_configuration_description:
    glue_data_catalog_configuration_description
    [@ocaml.doc
      "The configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "The configuration parameters for the default Amazon Glue database. You use this database for Apache Flink SQL queries and table API transforms that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec s3_content_base_location_description =
  {
  base_path: base_path option
    [@ocaml.doc "The base path for the S3 bucket.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc
  "The description of the S3 base location that holds the application.\n"]
type nonrec deploy_as_application_configuration_description =
  {
  s3_content_location_description: s3_content_base_location_description
    [@ocaml.doc
      "The location that holds the data required to specify an Amazon Data Analytics application.\n"]}
[@@ocaml.doc
  "The configuration information required to deploy an Amazon Data Analytics Studio notebook as an application with durable state.\n"]
type nonrec custom_artifact_configuration_description =
  {
  maven_reference_description: maven_reference option
    [@ocaml.doc
      "The parameters that are required to specify a Maven dependency.\n"];
  s3_content_location_description: s3_content_location option [@ocaml.doc ""];
  artifact_type: artifact_type option
    [@ocaml.doc
      " [UDF] stands for user-defined functions. This type of artifact must be in an S3 bucket. A [DEPENDENCY_JAR] can be in either Maven or an S3 bucket.\n"]}
[@@ocaml.doc
  "Specifies a dependency JAR or a JAR of user-defined functions.\n"]
type nonrec custom_artifacts_configuration_description_list =
  custom_artifact_configuration_description list[@@ocaml.doc ""]
type nonrec zeppelin_application_configuration_description =
  {
  custom_artifacts_configuration_description:
    custom_artifacts_configuration_description_list option
    [@ocaml.doc
      "Custom artifacts are dependency JARs and user-defined functions (UDF).\n"];
  deploy_as_application_configuration_description:
    deploy_as_application_configuration_description option
    [@ocaml.doc
      "The parameters required to deploy a Managed Service for Apache Flink Studio notebook as an application with durable state.\n"];
  catalog_configuration_description: catalog_configuration_description option
    [@ocaml.doc
      "The Amazon Glue Data Catalog that is associated with the Managed Service for Apache Flink Studio notebook.\n"];
  monitoring_configuration_description:
    zeppelin_monitoring_configuration_description
    [@ocaml.doc
      "The monitoring configuration of a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "The configuration of a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec glue_data_catalog_configuration =
  {
  database_ar_n: database_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the database.\n"]}
[@@ocaml.doc
  "The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API transforms that you write in an application.\n"]
type nonrec catalog_configuration =
  {
  glue_data_catalog_configuration: glue_data_catalog_configuration
    [@ocaml.doc
      "The configuration parameters for the default Amazon Glue database. You use this database for Apache Flink SQL queries and table API transforms that you write in a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "The configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec s3_content_base_location =
  {
  base_path: base_path option
    [@ocaml.doc "The base path for the S3 bucket.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc "The S3 bucket that holds the application information.\n"]
type nonrec deploy_as_application_configuration =
  {
  s3_content_location: s3_content_base_location
    [@ocaml.doc
      "The description of an Amazon S3 object that contains the Amazon Data Analytics application, including the Amazon Resource Name (ARN) of the S3 bucket, the name of the Amazon S3 object that contains the data, and the version number of the Amazon S3 object that contains the data. \n"]}
[@@ocaml.doc
  "The information required to deploy a Managed Service for Apache Flink Studio notebook as an application with durable state.\n"]
type nonrec zeppelin_application_configuration =
  {
  custom_artifacts_configuration: custom_artifacts_configuration_list option
    [@ocaml.doc
      "Custom artifacts are dependency JARs and user-defined functions (UDF).\n"];
  deploy_as_application_configuration:
    deploy_as_application_configuration option
    [@ocaml.doc
      "The information required to deploy a Managed Service for Apache Flink Studio notebook as an application with durable state.\n"];
  catalog_configuration: catalog_configuration option
    [@ocaml.doc
      "The Amazon Glue Data Catalog that you use in queries in a Managed Service for Apache Flink Studio notebook.\n"];
  monitoring_configuration: zeppelin_monitoring_configuration option
    [@ocaml.doc
      "The monitoring configuration of a Managed Service for Apache Flink Studio notebook.\n"]}
[@@ocaml.doc
  "The configuration of a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec vpc_id = string[@@ocaml.doc ""]
type nonrec subnet_id = string[@@ocaml.doc ""]
type nonrec subnet_ids = subnet_id list[@@ocaml.doc ""]
type nonrec security_group_id = string[@@ocaml.doc ""]
type nonrec security_group_ids = security_group_id list[@@ocaml.doc ""]
type nonrec vpc_configuration =
  {
  security_group_ids: security_group_ids
    [@ocaml.doc
      "The array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html}SecurityGroup} IDs used by the VPC configuration.\n"];
  subnet_ids: subnet_ids
    [@ocaml.doc
      "The array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html}Subnet} IDs used by the VPC configuration.\n"]}
[@@ocaml.doc "Describes the parameters of a VPC used by the application.\n"]
type nonrec vpc_configurations = vpc_configuration list[@@ocaml.doc ""]
type nonrec id = string[@@ocaml.doc ""]
type nonrec vpc_configuration_update =
  {
  security_group_id_updates: security_group_ids option
    [@ocaml.doc
      "Describes updates to the array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html}SecurityGroup} IDs used by the VPC configuration.\n"];
  subnet_id_updates: subnet_ids option
    [@ocaml.doc
      "Describes updates to the array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html}Subnet} IDs used by the VPC configuration.\n"];
  vpc_configuration_id: id
    [@ocaml.doc "Describes an update to the ID of the VPC configuration.\n"]}
[@@ocaml.doc
  "Describes updates to the VPC configuration used by the application.\n"]
type nonrec vpc_configuration_updates = vpc_configuration_update list
[@@ocaml.doc ""]
type nonrec vpc_configuration_description =
  {
  security_group_ids: security_group_ids
    [@ocaml.doc
      "The array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html}SecurityGroup} IDs used by the VPC configuration.\n"];
  subnet_ids: subnet_ids
    [@ocaml.doc
      "The array of {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html}Subnet} IDs used by the VPC configuration.\n"];
  vpc_id: vpc_id [@ocaml.doc "The ID of the associated VPC.\n"];
  vpc_configuration_id: id [@ocaml.doc "The ID of the VPC configuration.\n"]}
[@@ocaml.doc "Describes the parameters of a VPC used by the application.\n"]
type nonrec vpc_configuration_descriptions =
  vpc_configuration_description list[@@ocaml.doc ""]
type nonrec url_type =
  | ZEPPELIN_UI_URL [@ocaml.doc ""]
  | FLINK_DASHBOARD_URL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_ar_n = string[@@ocaml.doc ""]
type nonrec application_description = string[@@ocaml.doc ""]
type nonrec application_name = string[@@ocaml.doc ""]
type nonrec runtime_environment =
  | FLINK_1_20 [@ocaml.doc ""]
  | FLINK_1_19 [@ocaml.doc ""]
  | FLINK_1_18 [@ocaml.doc ""]
  | ZEPPELIN_FLINK_3_0 [@ocaml.doc ""]
  | FLINK_1_15 [@ocaml.doc ""]
  | ZEPPELIN_FLINK_2_0 [@ocaml.doc ""]
  | FLINK_1_13 [@ocaml.doc ""]
  | FLINK_1_11 [@ocaml.doc ""]
  | ZEPPELIN_FLINK_1_0 [@ocaml.doc ""]
  | FLINK_1_8 [@ocaml.doc ""]
  | FLINK_1_6 [@ocaml.doc ""]
  | SQL_1_0 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec role_ar_n = string[@@ocaml.doc ""]
type nonrec application_status =
  | ROLLED_BACK [@ocaml.doc ""]
  | MAINTENANCE [@ocaml.doc ""]
  | ROLLING_BACK [@ocaml.doc ""]
  | FORCE_STOPPING [@ocaml.doc ""]
  | AUTOSCALING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec application_version_id = int[@@ocaml.doc ""]
type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec in_app_stream_name = string[@@ocaml.doc ""]
type nonrec in_app_stream_names = in_app_stream_name list[@@ocaml.doc ""]
type nonrec input_lambda_processor_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that is used to access the Amazon Lambda function.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The ARN of the Amazon Lambda function that is used to preprocess the records in the stream.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: Amazon Lambda} \n  \n   "]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, an object that contains the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to preprocess records in the stream.\n"]
type nonrec input_processing_configuration_description =
  {
  input_lambda_processor_description:
    input_lambda_processor_description option
    [@ocaml.doc
      "Provides configuration information about the associated [InputLambdaProcessorDescription] \n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides the configuration information about an input processor. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]
type nonrec kinesis_streams_input_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis data stream.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the Kinesis data stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_firehose_input_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics assumes to access the stream.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the delivery stream.\n"]}
[@@ocaml.doc
  "Describes the Amazon Kinesis Data Firehose delivery stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec record_format_type =
  | CSV [@ocaml.doc ""]
  | JSON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec record_row_path = string[@@ocaml.doc ""]
type nonrec json_mapping_parameters =
  {
  record_row_path: record_row_path
    [@ocaml.doc
      "The path to the top-level parent that contains the records.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides additional mapping information when JSON is the record format on the streaming source.\n"]
type nonrec record_row_delimiter = string[@@ocaml.doc ""]
type nonrec record_column_delimiter = string[@@ocaml.doc ""]
type nonrec csv_mapping_parameters =
  {
  record_column_delimiter: record_column_delimiter
    [@ocaml.doc
      "The column delimiter. For example, in a CSV format, a comma (\",\") is the typical column delimiter.\n"];
  record_row_delimiter: record_row_delimiter
    [@ocaml.doc
      "The row delimiter. For example, in a CSV format, {i '\\n'} is the typical row delimiter.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides additional mapping information when the record format uses delimiters, such as CSV. For example, the following sample records use CSV format, where the records use the {i '\\n'} as the row delimiter and a comma (\",\") as the column delimiter: \n\n  [\"name1\", \"address1\"] \n \n   [\"name2\", \"address2\"] \n  "]
type nonrec mapping_parameters =
  {
  csv_mapping_parameters: csv_mapping_parameters option
    [@ocaml.doc
      "Provides additional mapping information when the record format uses delimiters (for example, CSV).\n"];
  json_mapping_parameters: json_mapping_parameters option
    [@ocaml.doc
      "Provides additional mapping information when JSON is the record format on the streaming source.\n"]}
[@@ocaml.doc
  "When you configure a SQL-based Kinesis Data Analytics application's input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"]
type nonrec record_format =
  {
  mapping_parameters: mapping_parameters option
    [@ocaml.doc
      "When you configure application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"];
  record_format_type: record_format_type
    [@ocaml.doc "The type of record format.\n"]}[@@ocaml.doc
                                                  " For a SQL-based Kinesis Data Analytics application, describes the record format and relevant mapping information that should be applied to schematize the records on the stream. \n"]
type nonrec record_encoding = string[@@ocaml.doc ""]
type nonrec record_column_name = string[@@ocaml.doc ""]
type nonrec record_column_mapping = string[@@ocaml.doc ""]
type nonrec record_column_sql_type = string[@@ocaml.doc ""]
type nonrec record_column =
  {
  sql_type: record_column_sql_type
    [@ocaml.doc
      "The type of column created in the in-application input stream or reference table.\n"];
  mapping: record_column_mapping option
    [@ocaml.doc
      "A reference to the data element in the streaming input or the reference data source.\n"];
  name: record_column_name
    [@ocaml.doc
      "The name of the column that is created in the in-application input stream or reference table.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the mapping of each data element in the streaming source to the corresponding column in the in-application stream.\n\n Also used to describe the format of the reference data source.\n "]
type nonrec record_columns = record_column list[@@ocaml.doc ""]
type nonrec source_schema =
  {
  record_columns: record_columns
    [@ocaml.doc "A list of [RecordColumn] objects. \n"];
  record_encoding: record_encoding option
    [@ocaml.doc
      "Specifies the encoding of the records in the streaming source. For example, UTF-8.\n"];
  record_format: record_format
    [@ocaml.doc
      "Specifies the format of the records on the streaming source.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream. \n"]
type nonrec input_parallelism_count = int[@@ocaml.doc ""]
type nonrec input_parallelism =
  {
  count: input_parallelism_count option
    [@ocaml.doc "The number of in-application streams to create.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the number of in-application streams to create for a given streaming source. \n"]
type nonrec input_starting_position =
  | LAST_STOPPED_POINT [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
  | NOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec input_starting_position_configuration =
  {
  input_starting_position: input_starting_position option
    [@ocaml.doc
      "The starting position on the stream.\n\n {ul\n       {-   [NOW] - Start reading just after the most recent record in the stream, and start at the request timestamp that the customer issued.\n           \n            }\n       {-   [TRIM_HORIZON] - Start reading at the last untrimmed record in the stream, which is the oldest record available in the stream. This option is not available for an Amazon Kinesis Data Firehose delivery stream.\n           \n            }\n       {-   [LAST_STOPPED_POINT] - Resume reading from where the application last stopped reading.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Describes the point at which the application reads from the streaming source.\n"]
type nonrec input_description =
  {
  input_starting_position_configuration:
    input_starting_position_configuration option
    [@ocaml.doc
      "The point at which the application is configured to read from the input stream.\n"];
  input_parallelism: input_parallelism option
    [@ocaml.doc
      "Describes the configured parallelism (number of in-application streams mapped to the streaming source). \n"];
  input_schema: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created. \n"];
  kinesis_firehose_input_description:
    kinesis_firehose_input_description option
    [@ocaml.doc
      "If a Kinesis Data Firehose delivery stream is configured as a streaming source, provides the delivery stream's ARN. \n"];
  kinesis_streams_input_description: kinesis_streams_input_description option
    [@ocaml.doc
      "If a Kinesis data stream is configured as a streaming source, provides the Kinesis data stream's Amazon Resource Name (ARN). \n"];
  input_processing_configuration_description:
    input_processing_configuration_description option
    [@ocaml.doc
      "The description of the preprocessor that executes on records in this input before the application's code is run. \n"];
  in_app_stream_names: in_app_stream_names option
    [@ocaml.doc
      "Returns the in-application stream names that are mapped to the stream source. \n"];
  name_prefix: in_app_stream_name option
    [@ocaml.doc "The in-application name prefix.\n"];
  input_id: id option
    [@ocaml.doc
      "The input ID that is associated with the application input. This is the ID that Kinesis Data Analytics assigns to each input configuration that you add to your application. \n"]}
[@@ocaml.doc
  "Describes the application input configuration for a SQL-based Kinesis Data Analytics application. \n"]
type nonrec input_descriptions = input_description list[@@ocaml.doc ""]
type nonrec kinesis_streams_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis data stream.\n"]}
[@@ocaml.doc
  "For an SQL-based Kinesis Data Analytics application's output, describes the Kinesis data stream that is configured as its destination. \n"]
type nonrec kinesis_firehose_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the delivery stream.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application's output, describes the Kinesis Data Firehose delivery stream that is configured as its destination.\n"]
type nonrec lambda_output_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics can assume to write to the destination function.\n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the destination Lambda function.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application's output, describes the Amazon Lambda function that is configured as its destination. \n"]
type nonrec destination_schema =
  {
  record_format_type: record_format_type
    [@ocaml.doc
      "Specifies the format of the records on the output stream.\n"]}
[@@ocaml.doc
  "Describes the data format when records are written to the destination in a SQL-based Kinesis Data Analytics application. \n"]
type nonrec output_description =
  {
  destination_schema: destination_schema option
    [@ocaml.doc
      "The data format used for writing data to the destination.\n"];
  lambda_output_description: lambda_output_description option
    [@ocaml.doc
      "Describes the Lambda function that is configured as the destination where output is written.\n"];
  kinesis_firehose_output_description:
    kinesis_firehose_output_description option
    [@ocaml.doc
      "Describes the Kinesis Data Firehose delivery stream that is configured as the destination where output is written.\n"];
  kinesis_streams_output_description:
    kinesis_streams_output_description option
    [@ocaml.doc
      "Describes the Kinesis data stream that is configured as the destination where output is written.\n"];
  name: in_app_stream_name option
    [@ocaml.doc
      "The name of the in-application stream that is configured as output.\n"];
  output_id: id option
    [@ocaml.doc "A unique identifier for the output configuration.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the application output configuration, which includes the in-application stream name and the destination where the stream data is written. The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream. \n"]
type nonrec output_descriptions = output_description list[@@ocaml.doc ""]
type nonrec in_app_table_name = string[@@ocaml.doc ""]
type nonrec s3_reference_data_source_description =
  {
  reference_role_ar_n: role_ar_n option
    [@ocaml.doc
      "The ARN of the IAM role that Kinesis Data Analytics can assume to read the Amazon S3 object on your behalf to populate the in-application reference table. \n\n  Provided for backward compatibility. Applications that are created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  file_key: file_key [@ocaml.doc "Amazon S3 object key name.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides the bucket name and object key name that stores the reference data.\n"]
type nonrec reference_data_source_description =
  {
  reference_schema: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"];
  s3_reference_data_source_description: s3_reference_data_source_description
    [@ocaml.doc
      "Provides the Amazon S3 bucket name, the object key name that contains the reference data. \n"];
  table_name: in_app_table_name
    [@ocaml.doc
      "The in-application table name created by the specific reference data source configuration.\n"];
  reference_id: id
    [@ocaml.doc
      "The ID of the reference data source. This is the ID that Kinesis Data Analytics assigns when you add the reference data source to your application using the [CreateApplication] or [UpdateApplication] operation.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the reference data source configured for an application.\n"]
type nonrec reference_data_source_descriptions =
  reference_data_source_description list[@@ocaml.doc ""]
type nonrec sql_application_configuration_description =
  {
  reference_data_source_descriptions:
    reference_data_source_descriptions option
    [@ocaml.doc
      "The array of [ReferenceDataSourceDescription] objects describing the reference data sources used by the application.\n"];
  output_descriptions: output_descriptions option
    [@ocaml.doc
      "The array of [OutputDescription] objects describing the destination streams used by the application.\n"];
  input_descriptions: input_descriptions option
    [@ocaml.doc
      "The array of [InputDescription] objects describing the input streams used by the application.\n"]}
[@@ocaml.doc
  "Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec code_content_type =
  | ZIPFILE [@ocaml.doc ""]
  | PLAINTEXT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec text_content = string[@@ocaml.doc ""]
type nonrec code_m_d5 = string[@@ocaml.doc ""]
type nonrec code_size = int[@@ocaml.doc ""]
type nonrec s3_application_code_location_description =
  {
  object_version: object_version option
    [@ocaml.doc
      "The version of the object containing the application code.\n"];
  file_key: file_key
    [@ocaml.doc
      "The file key for the object containing the application code.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the S3 bucket containing the application code.\n"]}
[@@ocaml.doc
  "Describes the location of an application's code stored in an S3 bucket.\n"]
type nonrec code_content_description =
  {
  s3_application_code_location_description:
    s3_application_code_location_description option
    [@ocaml.doc
      "The S3 bucket Amazon Resource Name (ARN), file key, and object version of the application code stored in Amazon S3.\n"];
  code_size: code_size option
    [@ocaml.doc
      "The size in bytes of the application code. Can be used to validate zip-format code.\n"];
  code_m_d5: code_m_d5 option
    [@ocaml.doc
      "The checksum that can be used to validate zip-format code.\n"];
  text_content: text_content option [@ocaml.doc "The text-format code\n"]}
[@@ocaml.doc
  "Describes details about the code of a Managed Service for Apache Flink application.\n"]
type nonrec application_code_configuration_description =
  {
  code_content_description: code_content_description option
    [@ocaml.doc
      "Describes details about the location and format of the application code.\n"];
  code_content_type: code_content_type
    [@ocaml.doc
      "Specifies whether the code content is in text or zip format.\n"]}
[@@ocaml.doc "Describes code configuration for an application.\n"]
type nonrec application_restore_type =
  | RESTORE_FROM_CUSTOM_SNAPSHOT [@ocaml.doc ""]
  | RESTORE_FROM_LATEST_SNAPSHOT [@ocaml.doc ""]
  | SKIP_RESTORE_FROM_SNAPSHOT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec snapshot_name = string[@@ocaml.doc ""]
type nonrec application_restore_configuration =
  {
  snapshot_name: snapshot_name option
    [@ocaml.doc
      "The identifier of an existing snapshot of application state to use to restart an application. The application uses this value if [RESTORE_FROM_CUSTOM_SNAPSHOT] is specified for the [ApplicationRestoreType].\n"];
  application_restore_type: application_restore_type
    [@ocaml.doc "Specifies how the application should be restored.\n"]}
[@@ocaml.doc
  "Specifies the method and snapshot to use when restarting an application using previously saved application state.\n"]
type nonrec boolean_object = bool[@@ocaml.doc ""]
type nonrec flink_run_configuration =
  {
  allow_non_restored_state: boolean_object option
    [@ocaml.doc
      "When restoring from a snapshot, specifies whether the runtime is allowed to skip a state that cannot be mapped to the new program. This will happen if the program is updated between snapshots to remove stateful parameters, and state data in the snapshot no longer corresponds to valid application data. For more information, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/docs/ops/state/savepoints/#allowing-non-restored-state} Allowing Non-Restored State} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink documentation}.\n\n  This value defaults to [false]. If you update your application without specifying this parameter, [AllowNonRestoredState] will be set to [false], even if it was previously set to [true].\n  \n   "]}
[@@ocaml.doc
  "Describes the starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec run_configuration_description =
  {
  flink_run_configuration_description: flink_run_configuration option
    [@ocaml.doc ""];
  application_restore_configuration_description:
    application_restore_configuration option
    [@ocaml.doc
      "Describes the restore behavior of a restarting application.\n"]}
[@@ocaml.doc
  "Describes the starting properties for a Managed Service for Apache Flink application.\n"]
type nonrec configuration_type =
  | CUSTOM [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec checkpoint_interval = int[@@ocaml.doc ""]
type nonrec min_pause_between_checkpoints = int[@@ocaml.doc ""]
type nonrec checkpoint_configuration_description =
  {
  min_pause_between_checkpoints: min_pause_between_checkpoints option
    [@ocaml.doc
      "Describes the minimum time in milliseconds after a checkpoint operation completes that a new checkpoint operation can start. \n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [MinPauseBetweenCheckpoints] value of 5000, even if this value is set using this API or in application code.\n  \n   "];
  checkpoint_interval: checkpoint_interval option
    [@ocaml.doc
      "Describes the interval in milliseconds between checkpoint operations. \n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointInterval] value of 60000, even if this value is set to another value using this API or in application code.\n  \n   "];
  checkpointing_enabled: boolean_object option
    [@ocaml.doc
      "Describes whether checkpointing is enabled for a Managed Service for Apache Flink application.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointingEnabled] value of [true], even if this value is set to another value using this API or in application code.\n  \n   "];
  configuration_type: configuration_type option
    [@ocaml.doc
      "Describes whether the application uses the default checkpointing behavior in Managed Service for Apache Flink. \n\n  If this value is set to [DEFAULT], the application will use the following values, even if they are set to other values using APIs or application code:\n  \n   {ul\n         {-   {b CheckpointingEnabled:} true\n             \n              }\n         {-   {b CheckpointInterval:} 60000\n             \n              }\n         {-   {b MinPauseBetweenCheckpoints:} 5000\n             \n              }\n         }\n   "]}
[@@ocaml.doc
  "Describes checkpointing parameters for a Managed Service for Apache Flink application.\n"]
type nonrec metrics_level =
  | PARALLELISM [@ocaml.doc ""]
  | OPERATOR [@ocaml.doc ""]
  | TASK [@ocaml.doc ""]
  | APPLICATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec monitoring_configuration_description =
  {
  log_level: log_level option
    [@ocaml.doc
      "Describes the verbosity of the CloudWatch Logs for an application.\n"];
  metrics_level: metrics_level option
    [@ocaml.doc
      "Describes the granularity of the CloudWatch Logs for an application.\n"];
  configuration_type: configuration_type option
    [@ocaml.doc
      "Describes whether to use the default CloudWatch logging configuration for an application.\n"]}
[@@ocaml.doc
  "Describes configuration parameters for CloudWatch logging for an application.\n"]
type nonrec parallelism = int[@@ocaml.doc ""]
type nonrec parallelism_per_kp_u = int[@@ocaml.doc ""]
type nonrec parallelism_configuration_description =
  {
  auto_scaling_enabled: boolean_object option
    [@ocaml.doc
      "Describes whether the Managed Service for Apache Flink service can increase the parallelism of the application in response to increased throughput.\n"];
  current_parallelism: parallelism option
    [@ocaml.doc
      "Describes the current number of parallel tasks that a Managed Service for Apache Flink application can perform. If [AutoScalingEnabled] is set to True, Managed Service for Apache Flink can increase this value in response to application load. The service can increase this value up to the maximum parallelism, which is [ParalellismPerKPU] times the maximum KPUs for the application. The maximum KPUs for an application is 32 by default, and can be increased by requesting a limit increase. If application load is reduced, the service can reduce the [CurrentParallelism] value down to the [Parallelism] setting.\n"];
  parallelism_per_kp_u: parallelism_per_kp_u option
    [@ocaml.doc
      "Describes the number of parallel tasks that a Managed Service for Apache Flink application can perform per Kinesis Processing Unit (KPU) used by the application.\n"];
  parallelism: parallelism option
    [@ocaml.doc
      "Describes the initial number of parallel tasks that a Managed Service for Apache Flink application can perform. If [AutoScalingEnabled] is set to True, then Managed Service for Apache Flink can increase the [CurrentParallelism] value in response to application load. The service can increase [CurrentParallelism] up to the maximum parallelism, which is [ParalellismPerKPU] times the maximum KPUs for the application. The maximum KPUs for an application is 32 by default, and can be increased by requesting a limit increase. If application load is reduced, the service can reduce the [CurrentParallelism] value down to the [Parallelism] setting.\n"];
  configuration_type: configuration_type option
    [@ocaml.doc
      "Describes whether the application uses the default parallelism for the Managed Service for Apache Flink service. \n"]}
[@@ocaml.doc
  "Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks simultaneously.\n"]
type nonrec job_plan_description = string[@@ocaml.doc ""]
type nonrec flink_application_configuration_description =
  {
  job_plan_description: job_plan_description option
    [@ocaml.doc
      "The job plan for an application. For more information about the job plan, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/internals/job_scheduling.html}Jobs and Scheduling} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink Documentation}. To retrieve the job plan for the application, use the [DescribeApplicationRequest$IncludeAdditionalDetails] parameter of the [DescribeApplication] operation.\n"];
  parallelism_configuration_description:
    parallelism_configuration_description option
    [@ocaml.doc
      "Describes parameters for how an application executes multiple tasks simultaneously.\n"];
  monitoring_configuration_description:
    monitoring_configuration_description option
    [@ocaml.doc
      "Describes configuration parameters for Amazon CloudWatch logging for an application.\n"];
  checkpoint_configuration_description:
    checkpoint_configuration_description option
    [@ocaml.doc
      "Describes an application's checkpointing configuration. Checkpointing is the process of persisting application state for fault tolerance.\n"]}
[@@ocaml.doc
  "Describes configuration parameters for a Managed Service for Apache Flink application.\n"]
type nonrec property_value = string[@@ocaml.doc ""]
type nonrec property_key = string[@@ocaml.doc ""]
type nonrec property_map = (property_key * property_value) list[@@ocaml.doc
                                                                 ""]
type nonrec property_group =
  {
  property_map: property_map
    [@ocaml.doc
      "Describes the value of an application execution property key-value pair.\n"];
  property_group_id: id
    [@ocaml.doc
      "Describes the key of an application execution property key-value pair.\n"]}
[@@ocaml.doc "Property key-value pairs passed into an application.\n"]
type nonrec property_groups = property_group list[@@ocaml.doc ""]
type nonrec environment_property_descriptions =
  {
  property_group_descriptions: property_groups option
    [@ocaml.doc "Describes the execution property groups.\n"]}[@@ocaml.doc
                                                                "Describes the execution properties for an Apache Flink runtime.\n"]
type nonrec application_snapshot_configuration_description =
  {
  snapshots_enabled: boolean_object
    [@ocaml.doc
      "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc
  "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_system_rollback_configuration_description =
  {
  rollback_enabled: boolean_object
    [@ocaml.doc
      "Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application"]}
[@@ocaml.doc
  "Describes system rollback configuration for a Managed Service for Apache Flink application"]
type nonrec application_configuration_description =
  {
  zeppelin_application_configuration_description:
    zeppelin_application_configuration_description option
    [@ocaml.doc
      "The configuration parameters for a Managed Service for Apache Flink Studio notebook.\n"];
  vpc_configuration_descriptions: vpc_configuration_descriptions option
    [@ocaml.doc
      "The array of descriptions of VPC configurations available to the application.\n"];
  application_system_rollback_configuration_description:
    application_system_rollback_configuration_description option
    [@ocaml.doc ""];
  application_snapshot_configuration_description:
    application_snapshot_configuration_description option
    [@ocaml.doc
      "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"];
  environment_property_descriptions: environment_property_descriptions option
    [@ocaml.doc
      "Describes execution properties for a Managed Service for Apache Flink application.\n"];
  flink_application_configuration_description:
    flink_application_configuration_description option
    [@ocaml.doc
      "The details about a Managed Service for Apache Flink application.\n"];
  run_configuration_description: run_configuration_description option
    [@ocaml.doc
      "The details about the starting properties for a Managed Service for Apache Flink application.\n"];
  application_code_configuration_description:
    application_code_configuration_description option
    [@ocaml.doc
      "The details about the application code for a Managed Service for Apache Flink application.\n"];
  sql_application_configuration_description:
    sql_application_configuration_description option
    [@ocaml.doc
      "The details about inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]}
[@@ocaml.doc
  "Describes details about the application code and starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec log_stream_ar_n = string[@@ocaml.doc ""]
type nonrec cloud_watch_logging_option_description =
  {
  role_ar_n: role_ar_n option
    [@ocaml.doc
      "The IAM ARN of the role to use to send application messages. \n\n  Provided for backward compatibility. Applications created with the current API version have an application-level service execution role rather than a resource-level role.\n  \n   "];
  log_stream_ar_n: log_stream_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the CloudWatch log to receive application messages.\n"];
  cloud_watch_logging_option_id: id option
    [@ocaml.doc "The ID of the CloudWatch logging option description.\n"]}
[@@ocaml.doc "Describes the Amazon CloudWatch logging option.\n"]
type nonrec cloud_watch_logging_option_descriptions =
  cloud_watch_logging_option_description list[@@ocaml.doc ""]
type nonrec application_maintenance_window_start_time = string[@@ocaml.doc
                                                                ""]
type nonrec application_maintenance_window_end_time = string[@@ocaml.doc ""]
type nonrec application_maintenance_configuration_description =
  {
  application_maintenance_window_end_time:
    application_maintenance_window_end_time
    [@ocaml.doc "The end time for the maintenance window.\n"];
  application_maintenance_window_start_time:
    application_maintenance_window_start_time
    [@ocaml.doc "The start time for the maintenance window.\n"]}[@@ocaml.doc
                                                                  "The details of the maintenance configuration for the application.\n"]
type nonrec conditional_token = string[@@ocaml.doc ""]
type nonrec application_mode =
  | INTERACTIVE [@ocaml.doc ""]
  | STREAMING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec application_detail =
  {
  application_mode: application_mode option
    [@ocaml.doc
      "To create a Managed Service for Apache Flink Studio notebook, you must set the mode to [INTERACTIVE]. However, for a Managed Service for Apache Flink application, the mode is optional.\n"];
  application_version_rolled_back_to: application_version_id option
    [@ocaml.doc
      "The version to which you want to roll back the application.\n"];
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates.\n"];
  application_version_create_timestamp: timestamp option
    [@ocaml.doc
      "The current timestamp when the application version was created."];
  application_version_rolled_back_from: application_version_id option
    [@ocaml.doc
      "If you reverted the application using [RollbackApplication], the application version when [RollbackApplication] was called.\n"];
  application_version_updated_from: application_version_id option
    [@ocaml.doc
      "The previous application version before the latest application update. [RollbackApplication] reverts the application to this version.\n"];
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option
    [@ocaml.doc
      "The details of the maintenance configuration for the application.\n"];
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_descriptions option
    [@ocaml.doc
      "Describes the application Amazon CloudWatch logging options.\n"];
  application_configuration_description:
    application_configuration_description option
    [@ocaml.doc
      "Describes details about the application code and starting parameters for a Managed Service for Apache Flink application.\n"];
  last_update_timestamp: timestamp option
    [@ocaml.doc
      "The current timestamp when the application was last updated.\n"];
  create_timestamp: timestamp option
    [@ocaml.doc "The current timestamp when the application was created.\n"];
  application_version_id: application_version_id
    [@ocaml.doc
      "Provides the current application version. Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update the application.\n"];
  application_status: application_status
    [@ocaml.doc "The status of the application.\n"];
  service_execution_role: role_ar_n option
    [@ocaml.doc
      "Specifies the IAM role that the application uses to access external resources.\n"];
  runtime_environment: runtime_environment
    [@ocaml.doc "The runtime environment for the application.\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"];
  application_description: application_description option
    [@ocaml.doc "The description of the application.\n"];
  application_ar_n: resource_ar_n
    [@ocaml.doc "The ARN of the application.\n"]}[@@ocaml.doc
                                                   "Describes the application, including the application Amazon Resource Name (ARN), status, latest version, and input and output configurations.\n"]
type nonrec operation_id = string[@@ocaml.doc ""]
type nonrec update_application_response =
  {
  operation_id: operation_id option
    [@ocaml.doc "Operation ID for tracking UpdateApplication request"];
  application_detail: application_detail
    [@ocaml.doc "Describes application updates.\n"]}[@@ocaml.doc ""]
type nonrec input_lambda_processor_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the new Amazon Lambda function that is used to preprocess the records in the stream.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: Amazon Lambda} \n  \n   "]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, represents an update to the [InputLambdaProcessor] that is used to preprocess the records in the stream.\n"]
type nonrec input_processing_configuration_update =
  {
  input_lambda_processor_update: input_lambda_processor_update
    [@ocaml.doc
      "Provides update information for an [InputLambdaProcessor].\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes updates to an [InputProcessingConfiguration].\n"]
type nonrec kinesis_streams_input_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the input Kinesis data stream to read.\n"]}
[@@ocaml.doc
  "When you update the input configuration for a SQL-based Kinesis Data Analytics application, provides information about a Kinesis stream as the streaming source.\n"]
type nonrec kinesis_firehose_input_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the input delivery stream to read.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, when updating application input configuration, provides information about a Kinesis Data Firehose delivery stream as the streaming source.\n"]
type nonrec input_schema_update =
  {
  record_column_updates: record_columns option
    [@ocaml.doc
      "A list of [RecordColumn] objects. Each object describes the mapping of the streaming source element to the corresponding column in the in-application stream.\n"];
  record_encoding_update: record_encoding option
    [@ocaml.doc
      "Specifies the encoding of the records in the streaming source; for example, UTF-8.\n"];
  record_format_update: record_format option
    [@ocaml.doc
      "Specifies the format of the records on the streaming source.\n"]}
[@@ocaml.doc
  "Describes updates for an SQL-based Kinesis Data Analytics application's input schema.\n"]
type nonrec input_parallelism_update =
  {
  count_update: input_parallelism_count
    [@ocaml.doc
      "The number of in-application streams to create for the specified streaming source.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides updates to the parallelism count.\n"]
type nonrec input_update =
  {
  input_parallelism_update: input_parallelism_update option
    [@ocaml.doc
      "Describes the parallelism updates (the number of in-application streams Kinesis Data Analytics creates for the specific streaming source).\n"];
  input_schema_update: input_schema_update option
    [@ocaml.doc
      "Describes the data format on the streaming source, and how record elements on the streaming source map to columns of the in-application stream that is created.\n"];
  kinesis_firehose_input_update: kinesis_firehose_input_update option
    [@ocaml.doc
      "If a Kinesis Data Firehose delivery stream is the streaming source to be updated, provides an updated stream ARN.\n"];
  kinesis_streams_input_update: kinesis_streams_input_update option
    [@ocaml.doc
      "If a Kinesis data stream is the streaming source to be updated, provides an updated stream Amazon Resource Name (ARN).\n"];
  input_processing_configuration_update:
    input_processing_configuration_update option
    [@ocaml.doc "Describes updates to an [InputProcessingConfiguration].\n"];
  name_prefix_update: in_app_stream_name option
    [@ocaml.doc
      "The name prefix for in-application streams that Kinesis Data Analytics creates for the specific streaming source.\n"];
  input_id: id
    [@ocaml.doc "The input ID of the application input to be updated.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes updates to a specific input configuration (identified by the [InputId] of an application). \n"]
type nonrec input_updates = input_update list[@@ocaml.doc ""]
type nonrec kinesis_streams_output_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis data stream where you want to write the output.\n"]}
[@@ocaml.doc
  "When you update a SQL-based Kinesis Data Analytics application's output configuration using the [UpdateApplication] operation, provides information about a Kinesis data stream that is configured as the destination.\n"]
type nonrec kinesis_firehose_output_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the delivery stream to write to. \n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, when updating an output configuration using the [UpdateApplication] operation, provides information about a Kinesis Data Firehose delivery stream that is configured as the destination.\n"]
type nonrec lambda_output_update =
  {
  resource_arn_update: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the destination Amazon Lambda function.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: Amazon Lambda} \n  \n   "]}
[@@ocaml.doc
  "When you update an SQL-based Kinesis Data Analytics application's output configuration using the [UpdateApplication] operation, provides information about an Amazon Lambda function that is configured as the destination.\n"]
type nonrec output_update =
  {
  destination_schema_update: destination_schema option
    [@ocaml.doc
      "Describes the data format when records are written to the destination. \n"];
  lambda_output_update: lambda_output_update option
    [@ocaml.doc
      "Describes an Amazon Lambda function as the destination for the output.\n"];
  kinesis_firehose_output_update: kinesis_firehose_output_update option
    [@ocaml.doc
      "Describes a Kinesis Data Firehose delivery stream as the destination for the output.\n"];
  kinesis_streams_output_update: kinesis_streams_output_update option
    [@ocaml.doc
      "Describes a Kinesis data stream as the destination for the output.\n"];
  name_update: in_app_stream_name option
    [@ocaml.doc
      "If you want to specify a different in-application stream for this output configuration, use this field to specify the new in-application stream name.\n"];
  output_id: id
    [@ocaml.doc
      "Identifies the specific output configuration that you want to update.\n"]}
[@@ocaml.doc
  " For a SQL-based Kinesis Data Analytics application, describes updates to the output configuration identified by the [OutputId]. \n"]
type nonrec output_updates = output_update list[@@ocaml.doc ""]
type nonrec s3_reference_data_source_update =
  {
  file_key_update: file_key option [@ocaml.doc "The object key name.\n"];
  bucket_arn_update: bucket_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the Amazon S3 bucket name and object key name for an in-application reference table. \n"]
type nonrec reference_data_source_update =
  {
  reference_schema_update: source_schema option
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream. \n"];
  s3_reference_data_source_update: s3_reference_data_source_update option
    [@ocaml.doc
      "Describes the S3 bucket name, object key name, and IAM role that Kinesis Data Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.\n"];
  table_name_update: in_app_table_name option
    [@ocaml.doc
      "The in-application table name that is created by this update.\n"];
  reference_id: id
    [@ocaml.doc
      "The ID of the reference data source that is being updated. You can use the [DescribeApplication] operation to get this value.\n"]}
[@@ocaml.doc
  "When you update a reference data source configuration for a SQL-based Kinesis Data Analytics application, this object provides all the updated values (such as the source bucket name and object key name), the in-application table name that is created, and updated mapping information that maps the data in the Amazon S3 object to the in-application reference table that is created.\n"]
type nonrec reference_data_source_updates = reference_data_source_update list
[@@ocaml.doc ""]
type nonrec sql_application_configuration_update =
  {
  reference_data_source_updates: reference_data_source_updates option
    [@ocaml.doc
      "The array of [ReferenceDataSourceUpdate] objects describing the new reference data sources used by the application.\n"];
  output_updates: output_updates option
    [@ocaml.doc
      "The array of [OutputUpdate] objects describing the new destination streams used by the application.\n"];
  input_updates: input_updates option
    [@ocaml.doc
      "The array of [InputUpdate] objects describing the new input streams used by the application.\n"]}
[@@ocaml.doc
  "Describes updates to the input streams, destination streams, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec s3_content_location_update =
  {
  object_version_update: object_version option
    [@ocaml.doc
      "The new version of the object containing the application code.\n"];
  file_key_update: file_key option
    [@ocaml.doc
      "The new file key for the object containing the application code.\n"];
  bucket_arn_update: bucket_ar_n option
    [@ocaml.doc
      "The new Amazon Resource Name (ARN) for the S3 bucket containing the application code.\n"]}
[@@ocaml.doc
  "Describes an update for the Amazon S3 code content location for an application.\n"]
type nonrec code_content_update =
  {
  s3_content_location_update: s3_content_location_update option
    [@ocaml.doc
      "Describes an update to the location of code for an application.\n"];
  zip_file_content_update: zip_file_content option
    [@ocaml.doc
      "Describes an update to the zipped code for an application.\n"];
  text_content_update: text_content option
    [@ocaml.doc "Describes an update to the text code for an application.\n"]}
[@@ocaml.doc
  "Describes an update to the code of an application. Not supported for Apache Zeppelin.\n"]
type nonrec application_code_configuration_update =
  {
  code_content_update: code_content_update option
    [@ocaml.doc "Describes updates to the code content of an application.\n"];
  code_content_type_update: code_content_type option
    [@ocaml.doc "Describes updates to the code content type.\n"]}[@@ocaml.doc
                                                                   "Describes code configuration updates for an application. This is supported for a Managed Service for Apache Flink application or a SQL-based Kinesis Data Analytics application.\n"]
type nonrec checkpoint_configuration_update =
  {
  min_pause_between_checkpoints_update: min_pause_between_checkpoints option
    [@ocaml.doc
      "Describes updates to the minimum time in milliseconds after a checkpoint operation completes that a new checkpoint operation can start.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [MinPauseBetweenCheckpoints] value of 5000, even if this value is set using this API or in application code.\n  \n   "];
  checkpoint_interval_update: checkpoint_interval option
    [@ocaml.doc
      "Describes updates to the interval in milliseconds between checkpoint operations.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointInterval] value of 60000, even if this value is set to another value using this API or in application code.\n  \n   "];
  checkpointing_enabled_update: boolean_object option
    [@ocaml.doc
      "Describes updates to whether checkpointing is enabled for an application.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointingEnabled] value of [true], even if this value is set to another value using this API or in application code.\n  \n   "];
  configuration_type_update: configuration_type option
    [@ocaml.doc
      "Describes updates to whether the application uses the default checkpointing behavior of Managed Service for Apache Flink. You must set this property to [CUSTOM] in order to set the [CheckpointingEnabled], [CheckpointInterval], or [MinPauseBetweenCheckpoints] parameters. \n\n  If this value is set to [DEFAULT], the application will use the following values, even if they are set to other values using APIs or application code:\n  \n   {ul\n         {-   {b CheckpointingEnabled:} true\n             \n              }\n         {-   {b CheckpointInterval:} 60000\n             \n              }\n         {-   {b MinPauseBetweenCheckpoints:} 5000\n             \n              }\n         }\n   "]}
[@@ocaml.doc
  "Describes updates to the checkpointing parameters for a Managed Service for Apache Flink application.\n"]
type nonrec monitoring_configuration_update =
  {
  log_level_update: log_level option
    [@ocaml.doc
      "Describes updates to the verbosity of the CloudWatch Logs for an application.\n"];
  metrics_level_update: metrics_level option
    [@ocaml.doc
      "Describes updates to the granularity of the CloudWatch Logs for an application. The [Parallelism] level is not recommended for applications with a Parallelism over 64 due to excessive costs.\n"];
  configuration_type_update: configuration_type option
    [@ocaml.doc
      "Describes updates to whether to use the default CloudWatch logging configuration for an application. You must set this property to [CUSTOM] in order to set the [LogLevel] or [MetricsLevel] parameters.\n"]}
[@@ocaml.doc
  "Describes updates to configuration parameters for Amazon CloudWatch logging for an application.\n"]
type nonrec parallelism_configuration_update =
  {
  auto_scaling_enabled_update: boolean_object option
    [@ocaml.doc
      "Describes updates to whether the Managed Service for Apache Flink service can increase the parallelism of a Managed Service for Apache Flink application in response to increased throughput.\n"];
  parallelism_per_kpu_update: parallelism_per_kp_u option
    [@ocaml.doc
      "Describes updates to the number of parallel tasks an application can perform per Kinesis Processing Unit (KPU) used by the application.\n"];
  parallelism_update: parallelism option
    [@ocaml.doc
      "Describes updates to the initial number of parallel tasks an application can perform. If [AutoScalingEnabled] is set to True, then Managed Service for Apache Flink can increase the [CurrentParallelism] value in response to application load. The service can increase [CurrentParallelism] up to the maximum parallelism, which is [ParalellismPerKPU] times the maximum KPUs for the application. The maximum KPUs for an application is 32 by default, and can be increased by requesting a limit increase. If application load is reduced, the service will reduce [CurrentParallelism] down to the [Parallelism] setting.\n"];
  configuration_type_update: configuration_type option
    [@ocaml.doc
      "Describes updates to whether the application uses the default parallelism for the Managed Service for Apache Flink service, or if a custom parallelism is used. You must set this property to [CUSTOM] in order to change your application's [AutoScalingEnabled], [Parallelism], or [ParallelismPerKPU] properties.\n"]}
[@@ocaml.doc
  "Describes updates to parameters for how an application executes multiple tasks simultaneously.\n"]
type nonrec flink_application_configuration_update =
  {
  parallelism_configuration_update: parallelism_configuration_update option
    [@ocaml.doc
      "Describes updates to the parameters for how an application executes multiple tasks simultaneously.\n"];
  monitoring_configuration_update: monitoring_configuration_update option
    [@ocaml.doc
      "Describes updates to the configuration parameters for Amazon CloudWatch logging for an application.\n"];
  checkpoint_configuration_update: checkpoint_configuration_update option
    [@ocaml.doc
      "Describes updates to an application's checkpointing configuration. Checkpointing is the process of persisting application state for fault tolerance.\n"]}
[@@ocaml.doc
  "Describes updates to the configuration parameters for a Managed Service for Apache Flink application.\n"]
type nonrec environment_property_updates =
  {
  property_groups: property_groups
    [@ocaml.doc "Describes updates to the execution property groups.\n"]}
[@@ocaml.doc
  "Describes updates to the execution property groups for a Managed Service for Apache Flink application or a Studio notebook.\n"]
type nonrec application_snapshot_configuration_update =
  {
  snapshots_enabled_update: boolean_object
    [@ocaml.doc
      "Describes updates to whether snapshots are enabled for an application.\n"]}
[@@ocaml.doc
  "Describes updates to whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_system_rollback_configuration_update =
  {
  rollback_enabled_update: boolean_object
    [@ocaml.doc
      "Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application"]}
[@@ocaml.doc
  "Describes system rollback configuration for a Managed Service for Apache Flink application"]
type nonrec application_configuration_update =
  {
  zeppelin_application_configuration_update:
    zeppelin_application_configuration_update option
    [@ocaml.doc
      "Updates to the configuration of a Managed Service for Apache Flink Studio notebook.\n"];
  vpc_configuration_updates: vpc_configuration_updates option
    [@ocaml.doc
      "Updates to the array of descriptions of VPC configurations available to the application.\n"];
  application_system_rollback_configuration_update:
    application_system_rollback_configuration_update option [@ocaml.doc ""];
  application_snapshot_configuration_update:
    application_snapshot_configuration_update option
    [@ocaml.doc
      "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"];
  environment_property_updates: environment_property_updates option
    [@ocaml.doc
      "Describes updates to the environment properties for a Managed Service for Apache Flink application.\n"];
  flink_application_configuration_update:
    flink_application_configuration_update option
    [@ocaml.doc
      "Describes updates to a Managed Service for Apache Flink application's configuration.\n"];
  application_code_configuration_update:
    application_code_configuration_update option
    [@ocaml.doc
      "Describes updates to an application's code configuration.\n"];
  sql_application_configuration_update:
    sql_application_configuration_update option
    [@ocaml.doc
      "Describes updates to a SQL-based Kinesis Data Analytics application's configuration.\n"]}
[@@ocaml.doc "Describes updates to an application's configuration.\n"]
type nonrec run_configuration_update =
  {
  application_restore_configuration: application_restore_configuration option
    [@ocaml.doc
      "Describes updates to the restore behavior of a restarting application.\n"];
  flink_run_configuration: flink_run_configuration option
    [@ocaml.doc
      "Describes the starting parameters for a Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc
  "Describes the updates to the starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec cloud_watch_logging_option_update =
  {
  log_stream_arn_update: log_stream_ar_n option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the CloudWatch log to receive application messages.\n"];
  cloud_watch_logging_option_id: id
    [@ocaml.doc "The ID of the CloudWatch logging option to update\n"]}
[@@ocaml.doc "Describes the Amazon CloudWatch logging option updates.\n"]
type nonrec cloud_watch_logging_option_updates =
  cloud_watch_logging_option_update list[@@ocaml.doc ""]
type nonrec update_application_request =
  {
  runtime_environment_update: runtime_environment option
    [@ocaml.doc
      "Updates the Managed Service for Apache Flink runtime environment used to run your code. To avoid issues you must:\n\n {ul\n       {-  Ensure your new jar and dependencies are compatible with the new runtime selected.\n           \n            }\n       {-  Ensure your new code's state is compatible with the snapshot from which your application will start\n           \n            }\n       }\n  "];
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You get the application's current [ConditionalToken] using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  cloud_watch_logging_option_updates:
    cloud_watch_logging_option_updates option
    [@ocaml.doc
      "Describes application Amazon CloudWatch logging option updates. You can only update existing CloudWatch logging options with this action. To add a new CloudWatch logging option, use [AddApplicationCloudWatchLoggingOption].\n"];
  run_configuration_update: run_configuration_update option
    [@ocaml.doc
      "Describes updates to the application's starting parameters.\n"];
  service_execution_role_update: role_ar_n option
    [@ocaml.doc "Describes updates to the service execution role.\n"];
  application_configuration_update: application_configuration_update option
    [@ocaml.doc "Describes application configuration updates.\n"];
  current_application_version_id: application_version_id option
    [@ocaml.doc
      "The current application version ID. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken].You can retrieve the application version ID using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application to update.\n"]}[@@ocaml.doc ""]
type nonrec update_application_maintenance_configuration_response =
  {
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option
    [@ocaml.doc
      "The application maintenance configuration description after the update.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]}
[@@ocaml.doc ""]
type nonrec application_maintenance_configuration_update =
  {
  application_maintenance_window_start_time_update:
    application_maintenance_window_start_time
    [@ocaml.doc "The updated start time for the maintenance window.\n"]}
[@@ocaml.doc
  "Describes the updated maintenance configuration for the application.\n"]
type nonrec update_application_maintenance_configuration_request =
  {
  application_maintenance_configuration_update:
    application_maintenance_configuration_update
    [@ocaml.doc
      "Describes the application maintenance configuration update.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of the application for which you want to update the maintenance configuration.\n"]}
[@@ocaml.doc ""]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec unsupported_operation_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation. \n"]
type nonrec resource_not_found_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Specified application can't be found.\n"]
type nonrec resource_in_use_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The application is not available for this operation.\n"]
type nonrec invalid_argument_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The specified input parameter value is not valid.\n"]
type nonrec concurrent_modification_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Exception thrown as a result of concurrent modifications to an application. This error can be the result of attempting to modify an application without using the current application ID.\n"]
type nonrec limit_exceeded_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The number of allowed resources has been exceeded.\n"]
type nonrec invalid_request_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The request JSON is not valid for the operation.\n"]
type nonrec invalid_application_configuration_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The user-provided application configuration is not valid.\n"]
type nonrec code_validation_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The user-provided application code (query) is not valid. This can be a simple syntax error.\n"]
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
      "The ARN of the Managed Service for Apache Flink application from which to remove the tags.\n"]}
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
  processed_input_records: processed_input_records option
    [@ocaml.doc
      "Stream data that was modified by the processor specified in the [InputProcessingConfiguration] parameter. \n"];
  raw_input_records: raw_input_records option
    [@ocaml.doc "Raw stream data that was sampled to infer the schema.\n"];
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The data format is not valid. Kinesis Data Analytics cannot detect the schema for the given streaming source.\n"]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value option
    [@ocaml.doc "The value of the key-value tag. The value is optional.\n"];
  key: tag_key [@ocaml.doc "The key of the key-value tag.\n"]}[@@ocaml.doc
                                                                "A key-value pair (the value is optional) that you can define and assign to Amazon resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]
type nonrec tags = tag list[@@ocaml.doc ""]
type nonrec tag_resource_response = unit[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tags
    [@ocaml.doc "The key-value tags to assign to the application.\n"];
  resource_ar_n: kinesis_analytics_ar_n
    [@ocaml.doc "The ARN of the application to assign the tags.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec stop_application_response =
  {
  operation_id: operation_id option
    [@ocaml.doc "Operation ID for tracking StopApplication request"]}
[@@ocaml.doc ""]
type nonrec stop_application_request =
  {
  force: boolean_object option
    [@ocaml.doc
      "Set to [true] to force the application to stop. If you set [Force] to [true], Managed Service for Apache Flink stops the application without taking a snapshot. \n\n  Force-stopping your application may lead to data loss or duplication. To prevent data loss or duplicate processing of data during application restarts, we recommend you to take frequent snapshots of your application.\n  \n    You can only force stop a Managed Service for Apache Flink application. You can't force stop a SQL-based Kinesis Data Analytics application.\n    \n     The application must be in the [STARTING], [UPDATING], [STOPPING], [AUTOSCALING], or [RUNNING] status. \n     "];
  application_name: application_name
    [@ocaml.doc "The name of the running application to stop.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec start_application_response =
  {
  operation_id: operation_id option
    [@ocaml.doc "Operation ID for tracking StartApplication request"]}
[@@ocaml.doc ""]
type nonrec sql_run_configuration =
  {
  input_starting_position_configuration:
    input_starting_position_configuration
    [@ocaml.doc
      "The point at which you want the application to start processing records from the streaming source. \n"];
  input_id: id
    [@ocaml.doc
      "The input source ID. You can get this ID by calling the [DescribeApplication] operation. \n"]}
[@@ocaml.doc
  "Describes the starting parameters for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec sql_run_configurations = sql_run_configuration list[@@ocaml.doc
                                                                 ""]
type nonrec run_configuration =
  {
  application_restore_configuration: application_restore_configuration option
    [@ocaml.doc
      "Describes the restore behavior of a restarting application.\n"];
  sql_run_configurations: sql_run_configurations option
    [@ocaml.doc
      "Describes the starting parameters for a SQL-based Kinesis Data Analytics application application.\n"];
  flink_run_configuration: flink_run_configuration option
    [@ocaml.doc
      "Describes the starting parameters for a Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc
  "Describes the starting parameters for an Managed Service for Apache Flink application.\n"]
type nonrec start_application_request =
  {
  run_configuration: run_configuration option
    [@ocaml.doc
      "Identifies the run configuration (start parameters) of a Managed Service for Apache Flink application.\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc ""]
type nonrec input_lambda_processor =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The ARN of the Amazon Lambda function that operates on records in the stream.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: Amazon Lambda} \n  \n   "]}
[@@ocaml.doc
  "An object that contains the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to preprocess records in the stream in a SQL-based Kinesis Data Analytics application. \n"]
type nonrec input_processing_configuration =
  {
  input_lambda_processor: input_lambda_processor
    [@ocaml.doc
      "The [InputLambdaProcessor] that is used to preprocess the records in the stream before being processed by your application code.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes a processor that is used to preprocess the records in the stream before being processed by your application code. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]
type nonrec kinesis_streams_input =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc "The ARN of the input Kinesis data stream to read.\n"]}
[@@ocaml.doc
  " Identifies a Kinesis data stream as the streaming source. You provide the stream's Amazon Resource Name (ARN).\n"]
type nonrec kinesis_firehose_input =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc "The Amazon Resource Name (ARN) of the delivery stream.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, identifies a Kinesis Data Firehose delivery stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN).\n"]
type nonrec input =
  {
  input_schema: source_schema
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created.\n\n Also used to describe the format of the reference data source.\n "];
  input_parallelism: input_parallelism option
    [@ocaml.doc
      "Describes the number of in-application streams to create. \n"];
  kinesis_firehose_input: kinesis_firehose_input option
    [@ocaml.doc
      "If the streaming source is an Amazon Kinesis Data Firehose delivery stream, identifies the delivery stream's ARN.\n"];
  kinesis_streams_input: kinesis_streams_input option
    [@ocaml.doc
      "If the streaming source is an Amazon Kinesis data stream, identifies the stream's Amazon Resource Name (ARN). \n"];
  input_processing_configuration: input_processing_configuration option
    [@ocaml.doc
      "The [InputProcessingConfiguration] for the input. An input processor transforms records as they are received from the stream, before the application's SQL code executes. Currently, the only input processing configuration available is [InputLambdaProcessor]. \n"];
  name_prefix: in_app_stream_name
    [@ocaml.doc
      "The name prefix to use when creating an in-application stream. Suppose that you specify a prefix \"[MyInApplicationStream].\" Kinesis Data Analytics then creates one or more (as per the [InputParallelism] count you specified) in-application streams with the names \"[MyInApplicationStream_001],\" \"[MyInApplicationStream_002],\" and so on. \n"]}
[@@ocaml.doc
  "When you configure the application input for a SQL-based Kinesis Data Analytics application, you specify the streaming source, the in-application stream name that is created, and the mapping between the two. \n"]
type nonrec inputs = input list[@@ocaml.doc ""]
type nonrec kinesis_streams_output =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The ARN of the destination Kinesis data stream to write to.\n"]}
[@@ocaml.doc
  "When you configure a SQL-based Kinesis Data Analytics application's output, identifies a Kinesis data stream as the destination. You provide the stream Amazon Resource Name (ARN). \n"]
type nonrec kinesis_firehose_output =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc "The ARN of the destination delivery stream to write to.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, when configuring application output, identifies a Kinesis Data Firehose delivery stream as the destination. You provide the stream Amazon Resource Name (ARN) of the delivery stream. \n"]
type nonrec lambda_output =
  {
  resource_ar_n: resource_ar_n
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the destination Lambda function to write to.\n\n  To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: Amazon Lambda} \n  \n   "]}
[@@ocaml.doc
  "When you configure a SQL-based Kinesis Data Analytics application's output, identifies an Amazon Lambda function as the destination. You provide the function Amazon Resource Name (ARN) of the Lambda function. \n"]
type nonrec output =
  {
  destination_schema: destination_schema
    [@ocaml.doc
      "Describes the data format when records are written to the destination. \n"];
  lambda_output: lambda_output option
    [@ocaml.doc "Identifies an Amazon Lambda function as the destination.\n"];
  kinesis_firehose_output: kinesis_firehose_output option
    [@ocaml.doc
      "Identifies a Kinesis Data Firehose delivery stream as the destination.\n"];
  kinesis_streams_output: kinesis_streams_output option
    [@ocaml.doc "Identifies a Kinesis data stream as the destination.\n"];
  name: in_app_stream_name
    [@ocaml.doc "The name of the in-application stream.\n"]}[@@ocaml.doc
                                                              " Describes a SQL-based Kinesis Data Analytics application's output configuration, in which you identify an in-application stream and a destination where you want the in-application stream data to be written. The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream. \n\n \n "]
type nonrec outputs = output list[@@ocaml.doc ""]
type nonrec s3_reference_data_source =
  {
  file_key: file_key option
    [@ocaml.doc "The object key name containing the reference data.\n"];
  bucket_ar_n: bucket_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the S3 bucket.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, identifies the Amazon S3 bucket and object that contains the reference data.\n\n A SQL-based Kinesis Data Analytics application loads reference data only once. If the data changes, you call the [UpdateApplication] operation to trigger reloading of data into your application. \n "]
type nonrec reference_data_source =
  {
  reference_schema: source_schema
    [@ocaml.doc
      "Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.\n"];
  s3_reference_data_source: s3_reference_data_source option
    [@ocaml.doc
      "Identifies the S3 bucket and object that contains the reference data. A SQL-based Kinesis Data Analytics application loads reference data only once. If the data changes, you call the [UpdateApplication] operation to trigger reloading of data into your application. \n"];
  table_name: in_app_table_name
    [@ocaml.doc "The name of the in-application table to create.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, describes the reference data source by providing the source information (Amazon S3 bucket name and object key name), the resulting in-application table name that is created, and the necessary schema to map the data elements in the Amazon S3 object to the in-application table.\n"]
type nonrec reference_data_sources = reference_data_source list[@@ocaml.doc
                                                                 ""]
type nonrec sql_application_configuration =
  {
  reference_data_sources: reference_data_sources option
    [@ocaml.doc
      "The array of [ReferenceDataSource] objects describing the reference data sources used by the application.\n"];
  outputs: outputs option
    [@ocaml.doc
      "The array of [Output] objects describing the destination streams used by the application.\n"];
  inputs: inputs option
    [@ocaml.doc
      "The array of [Input] objects describing the input streams used by the application.\n"]}
[@@ocaml.doc
  "Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec snapshot_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec snapshot_details =
  {
  runtime_environment: runtime_environment option
    [@ocaml.doc "The Flink Runtime for the application snapshot.\n"];
  snapshot_creation_timestamp: timestamp option
    [@ocaml.doc "The timestamp of the application snapshot.\n"];
  application_version_id: application_version_id
    [@ocaml.doc
      "The current application version ID when the snapshot was created.\n"];
  snapshot_status: snapshot_status
    [@ocaml.doc "The status of the application snapshot.\n"];
  snapshot_name: snapshot_name
    [@ocaml.doc "The identifier for the application snapshot.\n"]}[@@ocaml.doc
                                                                    "Provides details about a snapshot of application state.\n"]
type nonrec snapshot_summaries = snapshot_details list[@@ocaml.doc ""]
type nonrec session_expiration_duration_in_seconds = int[@@ocaml.doc ""]
type nonrec service_unavailable_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The service cannot complete the request.\n"]
type nonrec s3_configuration =
  {
  file_key: file_key
    [@ocaml.doc "The name of the object that contains the data.\n"];
  bucket_ar_n: bucket_ar_n
    [@ocaml.doc "The ARN of the S3 bucket that contains the data.\n"]}
[@@ocaml.doc
  "For a SQL-based Kinesis Data Analytics application, provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the S3 bucket and the name of the Amazon S3 object that contains the data.\n"]
type nonrec rollback_application_response =
  {
  operation_id: operation_id option
    [@ocaml.doc "Operation ID for tracking RollbackApplication request"];
  application_detail: application_detail [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec rollback_application_request =
  {
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The current application version ID. You can retrieve the application version ID using [DescribeApplication].\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc ""]
type nonrec resource_provisioned_throughput_exceeded_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Discovery failed to get a record from the streaming source because of the Kinesis Streams [ProvisionedThroughputExceededException]. For more information, see {{:http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html}GetRecords} in the Amazon Kinesis Streams API Reference.\n"]
type nonrec parsed_input_record_field = string[@@ocaml.doc ""]
type nonrec parsed_input_record = parsed_input_record_field list[@@ocaml.doc
                                                                  ""]
type nonrec parsed_input_records = parsed_input_record list[@@ocaml.doc ""]
type nonrec parallelism_configuration =
  {
  auto_scaling_enabled: boolean_object option
    [@ocaml.doc
      "Describes whether the Managed Service for Apache Flink service can increase the parallelism of the application in response to increased throughput.\n"];
  parallelism_per_kp_u: parallelism_per_kp_u option
    [@ocaml.doc
      "Describes the number of parallel tasks that a Managed Service for Apache Flink application can perform per Kinesis Processing Unit (KPU) used by the application. For more information about KPUs, see {{:http://aws.amazon.com/kinesis/data-analytics/pricing/}Amazon Managed Service for Apache Flink Pricing}.\n"];
  parallelism: parallelism option
    [@ocaml.doc
      "Describes the initial number of parallel tasks that a Managed Service for Apache Flink application can perform. If [AutoScalingEnabled] is set to True, Managed Service for Apache Flink increases the [CurrentParallelism] value in response to application load. The service can increase the [CurrentParallelism] value up to the maximum parallelism, which is [ParalellismPerKPU] times the maximum KPUs for the application. The maximum KPUs for an application is 32 by default, and can be increased by requesting a limit increase. If application load is reduced, the service can reduce the [CurrentParallelism] value down to the [Parallelism] setting.\n"];
  configuration_type: configuration_type
    [@ocaml.doc
      "Describes whether the application uses the default parallelism for the Managed Service for Apache Flink service. You must set this property to [CUSTOM] in order to change your application's [AutoScalingEnabled], [Parallelism], or [ParallelismPerKPU] properties.\n"]}
[@@ocaml.doc
  "Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks simultaneously. For more information about parallelism, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/dev/parallel.html}Parallel Execution} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink Documentation}.\n"]
type nonrec operation_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc
                                 "Status of the operation performed on an application"]
type nonrec error_string = string[@@ocaml.doc ""]
type nonrec error_info = {
  error_string: error_string option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Provides a description of the operation failure error"]
type nonrec operation_failure_details =
  {
  error_info: error_info option [@ocaml.doc ""];
  rollback_operation_id: operation_id option
    [@ocaml.doc
      "Provides the operation ID of a system-rollback operation executed due to failure in the current operation"]}
[@@ocaml.doc "Provides a description of the operation failure"]
type nonrec operation = string[@@ocaml.doc ""]
type nonrec next_token = string[@@ocaml.doc ""]
type nonrec monitoring_configuration =
  {
  log_level: log_level option
    [@ocaml.doc
      "Describes the verbosity of the CloudWatch Logs for an application.\n"];
  metrics_level: metrics_level option
    [@ocaml.doc
      "Describes the granularity of the CloudWatch Logs for an application. The [Parallelism] level is not recommended for applications with a Parallelism over 64 due to excessive costs.\n"];
  configuration_type: configuration_type
    [@ocaml.doc
      "Describes whether to use the default CloudWatch logging configuration for an application. You must set this property to [CUSTOM] in order to set the [LogLevel] or [MetricsLevel] parameters.\n"]}
[@@ocaml.doc
  "Describes configuration parameters for Amazon CloudWatch logging for an application. For more information about CloudWatch logging, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html}Monitoring}.\n"]
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
type nonrec list_snapshots_input_limit = int[@@ocaml.doc ""]
type nonrec application_summary =
  {
  application_mode: application_mode option
    [@ocaml.doc
      "For a Managed Service for Apache Flink application, the mode is [STREAMING]. For a Managed Service for Apache Flink Studio notebook, it is [INTERACTIVE].\n"];
  runtime_environment: runtime_environment
    [@ocaml.doc "The runtime environment for the application.\n"];
  application_version_id: application_version_id
    [@ocaml.doc "Provides the current application version.\n"];
  application_status: application_status
    [@ocaml.doc "The status of the application.\n"];
  application_ar_n: resource_ar_n
    [@ocaml.doc "The ARN of the application.\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc
                                                    "Provides application summary information, including the application Amazon Resource Name (ARN), name, and status.\n"]
type nonrec application_summaries = application_summary list[@@ocaml.doc ""]
type nonrec list_applications_response =
  {
  next_token: application_name option
    [@ocaml.doc
      "The pagination token for the next set of results, or [null] if there are no additional results. Pass this token into a subsequent command to retrieve the next set of items For more information about pagination, see {{:https://docs.aws.amazon.com/cli/latest/userguide/pagination.html}Using the Amazon Command Line Interface's Pagination Options}.\n"];
  application_summaries: application_summaries
    [@ocaml.doc "A list of [ApplicationSummary] objects.\n"]}[@@ocaml.doc ""]
type nonrec list_applications_input_limit = int[@@ocaml.doc ""]
type nonrec list_applications_request =
  {
  next_token: application_name option
    [@ocaml.doc
      "If a previous command returned a pagination token, pass it into this value to retrieve the next set of results. For more information about pagination, see {{:https://docs.aws.amazon.com/cli/latest/userguide/pagination.html}Using the Amazon Command Line Interface's Pagination Options}.\n"];
  limit: list_applications_input_limit option
    [@ocaml.doc "The maximum number of applications to list.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec application_version_summary =
  {
  application_status: application_status
    [@ocaml.doc "The status of the application.\n"];
  application_version_id: application_version_id
    [@ocaml.doc
      "The ID of the application version. Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update the application.\n"]}
[@@ocaml.doc "The summary of the application version.\n"]
type nonrec application_version_summaries = application_version_summary list
[@@ocaml.doc ""]
type nonrec list_application_versions_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The pagination token for the next set of results, or [null] if there are no additional results. To retrieve the next set of items, pass this token into a subsequent invocation of this operation. For more information about pagination, see {{:https://docs.aws.amazon.com/cli/latest/userguide/pagination.html}Using the Amazon Command Line Interface's Pagination Options}.\n"];
  application_version_summaries: application_version_summaries option
    [@ocaml.doc
      "A list of the application versions and the associated configuration summaries. The list includes application versions that were rolled back.\n\n To get the complete description of a specific application version, invoke the [DescribeApplicationVersion] operation.\n "]}
[@@ocaml.doc ""]
type nonrec list_application_versions_input_limit = int[@@ocaml.doc ""]
type nonrec list_application_versions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "If a previous invocation of this operation returned a pagination token, pass it into this value to retrieve the next set of results. For more information about pagination, see {{:https://docs.aws.amazon.com/cli/latest/userguide/pagination.html}Using the Amazon Command Line Interface's Pagination Options}.\n"];
  limit: list_application_versions_input_limit option
    [@ocaml.doc
      "The maximum number of versions to list in this invocation of the operation.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of the application for which you want to list all versions.\n"]}
[@@ocaml.doc ""]
type nonrec list_application_snapshots_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of results, or [null] if there are no additional results.\n"];
  snapshot_summaries: snapshot_summaries option
    [@ocaml.doc
      "A collection of objects containing information about the application snapshots.\n"]}
[@@ocaml.doc ""]
type nonrec list_application_snapshots_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "Use this parameter if you receive a [NextToken] response in a previous request that indicates that there is more output available. Set it to the value of the previous call's [NextToken] response to indicate where the output should continue from. \n"];
  limit: list_snapshots_input_limit option
    [@ocaml.doc "The maximum number of application snapshots to list.\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec application_operation_info =
  {
  operation_status: operation_status option [@ocaml.doc ""];
  end_time: timestamp option
    [@ocaml.doc
      "The timestamp at which the operation finished for the application"];
  start_time: timestamp option
    [@ocaml.doc "The timestamp at which the operation was created"];
  operation_id: operation_id option [@ocaml.doc ""];
  operation: operation option [@ocaml.doc ""]}[@@ocaml.doc
                                                "Provides a description of the operation, such as the type and status of operation"]
type nonrec application_operation_info_list = application_operation_info list
[@@ocaml.doc ""]
type nonrec list_application_operations_response =
  {
  next_token: next_token option [@ocaml.doc ""];
  application_operation_info_list: application_operation_info_list option
    [@ocaml.doc ""]}[@@ocaml.doc
                      "Response with the list of operations for an application"]
type nonrec list_application_operations_input_limit = int[@@ocaml.doc ""]
type nonrec list_application_operations_request =
  {
  operation_status: operation_status option [@ocaml.doc ""];
  operation: operation option [@ocaml.doc ""];
  next_token: next_token option [@ocaml.doc ""];
  limit: list_application_operations_input_limit option [@ocaml.doc ""];
  application_name: application_name [@ocaml.doc ""]}[@@ocaml.doc
                                                       "Request to list operations performed on an application"]
type nonrec discover_input_schema_response =
  {
  raw_input_records: raw_input_records option
    [@ocaml.doc
      "The raw stream data that was sampled to infer the schema.\n"];
  processed_input_records: processed_input_records option
    [@ocaml.doc
      "The stream data that was modified by the processor specified in the [InputProcessingConfiguration] parameter.\n"];
  parsed_input_records: parsed_input_records option
    [@ocaml.doc
      "An array of elements, where each element corresponds to a row in a stream record (a stream record can have more than one row).\n"];
  input_schema: source_schema option
    [@ocaml.doc
      "The schema inferred from the streaming source. It identifies the format of the data in the streaming source and how each data element maps to corresponding columns in the in-application stream that you can create.\n"]}
[@@ocaml.doc ""]
type nonrec discover_input_schema_request =
  {
  input_processing_configuration: input_processing_configuration option
    [@ocaml.doc
      "The [InputProcessingConfiguration] to use to preprocess the records before discovering the schema of the records.\n"];
  s3_configuration: s3_configuration option
    [@ocaml.doc
      "Specify this parameter to discover a schema from data in an Amazon S3 object.\n"];
  input_starting_position_configuration:
    input_starting_position_configuration option
    [@ocaml.doc
      "The point at which you want Kinesis Data Analytics to start reading records from the specified streaming source for discovery purposes.\n"];
  service_execution_role: role_ar_n
    [@ocaml.doc
      "The ARN of the role that is used to access the streaming source.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the streaming source.\n"]}
[@@ocaml.doc ""]
type nonrec describe_application_version_response =
  {
  application_version_detail: application_detail option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec describe_application_version_request =
  {
  application_version_id: application_version_id
    [@ocaml.doc
      "The ID of the application version for which you want to get the description.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of the application for which you want to get the version description.\n"]}
[@@ocaml.doc ""]
type nonrec describe_application_snapshot_response =
  {
  snapshot_details: snapshot_details
    [@ocaml.doc
      "An object containing information about the application snapshot.\n"]}
[@@ocaml.doc ""]
type nonrec describe_application_snapshot_request =
  {
  snapshot_name: snapshot_name
    [@ocaml.doc
      "The identifier of an application snapshot. You can retrieve this value using .\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec application_version_change_details =
  {
  application_version_updated_to: application_version_id
    [@ocaml.doc
      "The operation execution resulted in the transition to the following version of the application"];
  application_version_updated_from: application_version_id
    [@ocaml.doc
      "The operation was performed on this version of the application"]}
[@@ocaml.doc
  "Contains information about the application version changes due to an operation"]
type nonrec application_operation_info_details =
  {
  operation_failure_details: operation_failure_details option [@ocaml.doc ""];
  application_version_change_details:
    application_version_change_details option [@ocaml.doc ""];
  operation_status: operation_status [@ocaml.doc ""];
  end_time: timestamp
    [@ocaml.doc
      "The timestamp at which the operation finished for the application"];
  start_time: timestamp
    [@ocaml.doc "The timestamp at which the operation was created"];
  operation: operation [@ocaml.doc ""]}[@@ocaml.doc
                                         "Provides a description of the operation, such as the operation-type and status"]
type nonrec describe_application_operation_response =
  {
  application_operation_info_details:
    application_operation_info_details option [@ocaml.doc ""]}[@@ocaml.doc
                                                                "Provides details of the operation corresponding to the operation-ID on a Managed Service for Apache Flink application"]
type nonrec describe_application_operation_request =
  {
  operation_id: operation_id [@ocaml.doc ""];
  application_name: application_name [@ocaml.doc ""]}[@@ocaml.doc
                                                       "Request for information about a specific operation performed on a Managed Service for Apache Flink application"]
type nonrec describe_application_response =
  {
  application_detail: application_detail
    [@ocaml.doc
      "Provides a description of the application, such as the application's Amazon Resource Name (ARN), status, and latest version.\n"]}
[@@ocaml.doc ""]
type nonrec describe_application_request =
  {
  include_additional_details: boolean_object option
    [@ocaml.doc
      "Displays verbose information about a Managed Service for Apache Flink application, including the application's job plan.\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_vpc_configuration_response =
  {
  operation_id: operation_id option
    [@ocaml.doc
      "Operation ID for tracking DeleteApplicationVpcConfiguration request"];
  application_version_id: application_version_id option
    [@ocaml.doc "The updated version ID of the application.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc
      "The ARN of the Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc ""]
type nonrec delete_application_vpc_configuration_request =
  {
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You get the application's current [ConditionalToken] using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  vpc_configuration_id: id
    [@ocaml.doc "The ID of the VPC configuration to delete.\n"];
  current_application_version_id: application_version_id option
    [@ocaml.doc
      "The current application version ID. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You can retrieve the application version ID using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_snapshot_response = unit[@@ocaml.doc ""]
type nonrec delete_application_snapshot_request =
  {
  snapshot_creation_timestamp: timestamp
    [@ocaml.doc
      "The creation timestamp of the application snapshot to delete. You can retrieve this value using or .\n"];
  snapshot_name: snapshot_name
    [@ocaml.doc "The identifier for the snapshot delete.\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_reference_data_source_response =
  {
  application_version_id: application_version_id option
    [@ocaml.doc "The updated version ID of the application.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec delete_application_reference_data_source_request =
  {
  reference_id: id
    [@ocaml.doc
      "The ID of the reference data source. When you add a reference data source to your application using the [AddApplicationReferenceDataSource], Kinesis Data Analytics assigns an ID. You can use the [DescribeApplication] operation to get the reference ID. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The current application version. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_output_response =
  {
  application_version_id: application_version_id option
    [@ocaml.doc "The current application version ID.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec delete_application_output_request =
  {
  output_id: id
    [@ocaml.doc
      "The ID of the configuration to delete. Each output configuration that is added to the application (either when the application is created or later) using the [AddApplicationOutput] operation has a unique ID. You need to provide the ID to uniquely identify the output configuration that you want to delete from the application configuration. You can use the [DescribeApplication] operation to get the specific [OutputId]. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The application version. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. \n"];
  application_name: application_name [@ocaml.doc "The application name.\n"]}
[@@ocaml.doc ""]
type nonrec delete_application_input_processing_configuration_response =
  {
  application_version_id: application_version_id option
    [@ocaml.doc "The current application version ID.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]}
[@@ocaml.doc ""]
type nonrec delete_application_input_processing_configuration_request =
  {
  input_id: id
    [@ocaml.doc
      "The ID of the input configuration from which to delete the input processing configuration. You can get a list of the input IDs for an application by using the [DescribeApplication] operation.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The application version. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. \n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_response =
  {
  operation_id: operation_id option
    [@ocaml.doc
      "Operation ID for tracking DeleteApplicationCloudWatchLoggingOption request"];
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_descriptions option
    [@ocaml.doc
      "The descriptions of the remaining CloudWatch logging options for the application.\n"];
  application_version_id: application_version_id option
    [@ocaml.doc
      "The version ID of the application. Kinesis Data Analytics updates the [ApplicationVersionId] each time you change the CloudWatch logging options.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application's Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_application_cloud_watch_logging_option_request =
  {
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You get the application's current [ConditionalToken] using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  cloud_watch_logging_option_id: id
    [@ocaml.doc
      "The [CloudWatchLoggingOptionId] of the Amazon CloudWatch logging option to delete. You can get the [CloudWatchLoggingOptionId] by using the [DescribeApplication] operation. \n"];
  current_application_version_id: application_version_id option
    [@ocaml.doc
      "The version ID of the application. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You can retrieve the application version ID using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  application_name: application_name [@ocaml.doc "The application name.\n"]}
[@@ocaml.doc ""]
type nonrec delete_application_response = unit[@@ocaml.doc ""]
type nonrec delete_application_request =
  {
  create_timestamp: timestamp
    [@ocaml.doc
      "Use the [DescribeApplication] operation to get this value.\n"];
  application_name: application_name
    [@ocaml.doc "The name of the application to delete.\n"]}[@@ocaml.doc ""]
type nonrec create_application_snapshot_response = unit[@@ocaml.doc ""]
type nonrec create_application_snapshot_request =
  {
  snapshot_name: snapshot_name
    [@ocaml.doc "An identifier for the application snapshot.\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application\n"]}[@@ocaml.doc ""]
type nonrec authorized_url = string[@@ocaml.doc ""]
type nonrec create_application_presigned_url_response =
  {
  authorized_url: authorized_url option
    [@ocaml.doc "The URL of the extension.\n"]}[@@ocaml.doc ""]
type nonrec create_application_presigned_url_request =
  {
  session_expiration_duration_in_seconds:
    session_expiration_duration_in_seconds option
    [@ocaml.doc
      "The duration in seconds for which the returned URL will be valid.\n"];
  url_type: url_type
    [@ocaml.doc
      "The type of the extension for which to create and return a URL. Currently, the only valid extension URL type is [FLINK_DASHBOARD_URL]. \n"];
  application_name: application_name
    [@ocaml.doc "The name of the application.\n"]}[@@ocaml.doc ""]
type nonrec create_application_response =
  {
  application_detail: application_detail
    [@ocaml.doc
      "In response to your [CreateApplication] request, Managed Service for Apache Flink returns a response with details of the application it created.\n"]}
[@@ocaml.doc ""]
type nonrec checkpoint_configuration =
  {
  min_pause_between_checkpoints: min_pause_between_checkpoints option
    [@ocaml.doc
      "Describes the minimum time in milliseconds after a checkpoint operation completes that a new checkpoint operation can start. If a checkpoint operation takes longer than the [CheckpointInterval], the application otherwise performs continual checkpoint operations. For more information, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/docs/ops/state/large_state_tuning/#tuning-checkpointing} Tuning Checkpointing} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink Documentation}.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [MinPauseBetweenCheckpoints] value of 5000, even if this value is set using this API or in application code.\n  \n   "];
  checkpoint_interval: checkpoint_interval option
    [@ocaml.doc
      "Describes the interval in milliseconds between checkpoint operations. \n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointInterval] value of 60000, even if this value is set to another value using this API or in application code.\n  \n   "];
  checkpointing_enabled: boolean_object option
    [@ocaml.doc
      "Describes whether checkpointing is enabled for a Managed Service for Apache Flink application.\n\n  If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the application will use a [CheckpointingEnabled] value of [true], even if this value is set to another value using this API or in application code.\n  \n   "];
  configuration_type: configuration_type
    [@ocaml.doc
      "Describes whether the application uses Managed Service for Apache Flink' default checkpointing behavior. You must set this property to [CUSTOM] in order to set the [CheckpointingEnabled], [CheckpointInterval], or [MinPauseBetweenCheckpoints] parameters.\n\n  If this value is set to [DEFAULT], the application will use the following values, even if they are set to other values using APIs or application code:\n  \n   {ul\n         {-   {b CheckpointingEnabled:} true\n             \n              }\n         {-   {b CheckpointInterval:} 60000\n             \n              }\n         {-   {b MinPauseBetweenCheckpoints:} 5000\n             \n              }\n         }\n   "]}
[@@ocaml.doc
  "Describes an application's checkpointing configuration. Checkpointing is the process of persisting application state for fault tolerance. For more information, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing} Checkpoints for Fault Tolerance} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink Documentation}.\n"]
type nonrec flink_application_configuration =
  {
  parallelism_configuration: parallelism_configuration option
    [@ocaml.doc
      "Describes parameters for how an application executes multiple tasks simultaneously.\n"];
  monitoring_configuration: monitoring_configuration option
    [@ocaml.doc
      "Describes configuration parameters for Amazon CloudWatch logging for an application.\n"];
  checkpoint_configuration: checkpoint_configuration option
    [@ocaml.doc
      "Describes an application's checkpointing configuration. Checkpointing is the process of persisting application state for fault tolerance. For more information, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing} Checkpoints for Fault Tolerance} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.19/}Apache Flink Documentation}. \n"]}
[@@ocaml.doc
  "Describes configuration parameters for a Managed Service for Apache Flink application or a Studio notebook.\n"]
type nonrec environment_properties =
  {
  property_groups: property_groups
    [@ocaml.doc "Describes the execution property groups.\n"]}[@@ocaml.doc
                                                                "Describes execution properties for a Managed Service for Apache Flink application.\n"]
type nonrec code_content =
  {
  s3_content_location: s3_content_location option
    [@ocaml.doc
      "Information about the Amazon S3 bucket that contains the application code.\n"];
  zip_file_content: zip_file_content option
    [@ocaml.doc
      "The zip-format code for a Managed Service for Apache Flink application.\n"];
  text_content: text_content option
    [@ocaml.doc
      "The text-format code for a Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc
  "Specifies either the application code, or the location of the application code, for a Managed Service for Apache Flink application. \n"]
type nonrec application_code_configuration =
  {
  code_content_type: code_content_type
    [@ocaml.doc
      "Specifies whether the code content is in text or zip format.\n"];
  code_content: code_content option
    [@ocaml.doc "The location and type of the application code.\n"]}[@@ocaml.doc
                                                                    "Describes code configuration for an application.\n"]
type nonrec application_snapshot_configuration =
  {
  snapshots_enabled: boolean_object
    [@ocaml.doc
      "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]}
[@@ocaml.doc
  "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_system_rollback_configuration =
  {
  rollback_enabled: boolean_object
    [@ocaml.doc
      "Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application"]}
[@@ocaml.doc
  "Describes system rollback configuration for a Managed Service for Apache Flink application"]
type nonrec application_configuration =
  {
  zeppelin_application_configuration:
    zeppelin_application_configuration option
    [@ocaml.doc
      "The configuration parameters for a Managed Service for Apache Flink Studio notebook.\n"];
  vpc_configurations: vpc_configurations option
    [@ocaml.doc
      "The array of descriptions of VPC configurations available to the application.\n"];
  application_system_rollback_configuration:
    application_system_rollback_configuration option [@ocaml.doc ""];
  application_snapshot_configuration:
    application_snapshot_configuration option
    [@ocaml.doc
      "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"];
  application_code_configuration: application_code_configuration option
    [@ocaml.doc
      "The code location and type parameters for a Managed Service for Apache Flink application.\n"];
  environment_properties: environment_properties option
    [@ocaml.doc
      "Describes execution properties for a Managed Service for Apache Flink application.\n"];
  flink_application_configuration: flink_application_configuration option
    [@ocaml.doc
      "The creation and update parameters for a Managed Service for Apache Flink application.\n"];
  sql_application_configuration: sql_application_configuration option
    [@ocaml.doc
      "The creation and update parameters for a SQL-based Kinesis Data Analytics application.\n"]}
[@@ocaml.doc
  "Specifies the creation parameters for a Managed Service for Apache Flink application.\n"]
type nonrec cloud_watch_logging_option =
  {
  log_stream_ar_n: log_stream_ar_n
    [@ocaml.doc
      "The ARN of the CloudWatch log to receive application messages.\n"]}
[@@ocaml.doc
  "Provides a description of Amazon CloudWatch logging options, including the log stream Amazon Resource Name (ARN). \n"]
type nonrec cloud_watch_logging_options = cloud_watch_logging_option list
[@@ocaml.doc ""]
type nonrec create_application_request =
  {
  application_mode: application_mode option
    [@ocaml.doc
      "Use the [STREAMING] mode to create a Managed Service for Apache Flink application. To create a Managed Service for Apache Flink Studio notebook, use the [INTERACTIVE] mode.\n"];
  tags: tags option
    [@ocaml.doc
      "A list of one or more tags to assign to the application. A tag is a key-value pair that identifies an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"];
  cloud_watch_logging_options: cloud_watch_logging_options option
    [@ocaml.doc
      "Use this parameter to configure an Amazon CloudWatch log stream to monitor application configuration errors. \n"];
  application_configuration: application_configuration option
    [@ocaml.doc "Use this parameter to configure the application.\n"];
  service_execution_role: role_ar_n
    [@ocaml.doc
      "The IAM role used by the application to access Kinesis data streams, Kinesis Data Firehose delivery streams, Amazon S3 objects, and other external resources.\n"];
  runtime_environment: runtime_environment
    [@ocaml.doc "The runtime environment for the application.\n"];
  application_description: application_description option
    [@ocaml.doc "A summary description of the application.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of your application (for example, [sample-app]).\n"]}
[@@ocaml.doc ""]
type nonrec add_application_vpc_configuration_response =
  {
  operation_id: operation_id option
    [@ocaml.doc
      "Operation ID for tracking AddApplicationVpcConfiguration request"];
  vpc_configuration_description: vpc_configuration_description option
    [@ocaml.doc "The parameters of the new VPC configuration.\n"];
  application_version_id: application_version_id option
    [@ocaml.doc
      "Provides the current application version. Managed Service for Apache Flink updates the ApplicationVersionId each time you update the application.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The ARN of the application.\n"]}[@@ocaml.doc ""]
type nonrec add_application_vpc_configuration_request =
  {
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates. You must provide the [ApplicationVersionID] or the [ConditionalToken]. You get the application's current [ConditionalToken] using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  vpc_configuration: vpc_configuration
    [@ocaml.doc "Description of the VPC to add to the application.\n"];
  current_application_version_id: application_version_id option
    [@ocaml.doc
      "The version of the application to which you want to add the VPC configuration. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec add_application_reference_data_source_response =
  {
  reference_data_source_descriptions:
    reference_data_source_descriptions option
    [@ocaml.doc
      "Describes reference data sources configured for the application. \n"];
  application_version_id: application_version_id option
    [@ocaml.doc
      "The updated application version ID. Kinesis Data Analytics increments this ID when the application is updated.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec add_application_reference_data_source_request =
  {
  reference_data_source: reference_data_source
    [@ocaml.doc
      "The reference data source can be an object in your Amazon S3 bucket. Kinesis Data Analytics reads the object and copies the data into the in-application table that is created. You provide an S3 bucket, object key name, and the resulting in-application table that is created. \n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The version of the application for which you are adding the reference data source. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc "The name of an existing application.\n"]}[@@ocaml.doc ""]
type nonrec add_application_output_response =
  {
  output_descriptions: output_descriptions option
    [@ocaml.doc
      "Describes the application output configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}. \n"];
  application_version_id: application_version_id option
    [@ocaml.doc
      "The updated application version ID. Kinesis Data Analytics increments this ID when the application is updated.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec add_application_output_request =
  {
  output: output
    [@ocaml.doc
      "An array of objects, each describing one output configuration. In the output configuration, you specify the name of an in-application stream, a destination (that is, a Kinesis data stream, a Kinesis Data Firehose delivery stream, or an Amazon Lambda function), and record the formation to use when writing to the destination.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The version of the application to which you want to add the output configuration. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned. \n"];
  application_name: application_name
    [@ocaml.doc
      "The name of the application to which you want to add the output configuration.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_input_processing_configuration_response =
  {
  input_processing_configuration_description:
    input_processing_configuration_description option
    [@ocaml.doc
      "The description of the preprocessor that executes on records in this input before the application's code is run.\n"];
  input_id: id option
    [@ocaml.doc
      "The input ID that is associated with the application input. This is the ID that Kinesis Data Analytics assigns to each input configuration that you add to your application.\n"];
  application_version_id: application_version_id option
    [@ocaml.doc "Provides the current application version. \n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_input_processing_configuration_request =
  {
  input_processing_configuration: input_processing_configuration
    [@ocaml.doc
      "The [InputProcessingConfiguration] to add to the application.\n"];
  input_id: id
    [@ocaml.doc
      "The ID of the input configuration to add the input processing configuration to. You can get a list of the input IDs for an application using the [DescribeApplication] operation.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The version of the application to which you want to add the input processing configuration. You can use the [DescribeApplication] operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of the application to which you want to add the input processing configuration.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_input_response =
  {
  input_descriptions: input_descriptions option
    [@ocaml.doc "Describes the application input configuration. \n"];
  application_version_id: application_version_id option
    [@ocaml.doc "Provides the current application version.\n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_input_request =
  {
  input: input [@ocaml.doc "The [Input] to add.\n"];
  current_application_version_id: application_version_id
    [@ocaml.doc
      "The current version of your application. You must provide the [ApplicationVersionID] or the [ConditionalToken].You can use the [DescribeApplication] operation to find the current application version.\n"];
  application_name: application_name
    [@ocaml.doc
      "The name of your existing application to which you want to add the streaming source.\n"]}
[@@ocaml.doc ""]
type nonrec add_application_cloud_watch_logging_option_response =
  {
  operation_id: operation_id option
    [@ocaml.doc
      "Operation ID for tracking AddApplicationCloudWatchLoggingOption request"];
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_descriptions option
    [@ocaml.doc
      "The descriptions of the current CloudWatch logging options for the SQL-based Kinesis Data Analytics application.\n"];
  application_version_id: application_version_id option
    [@ocaml.doc
      "The new version ID of the SQL-based Kinesis Data Analytics application. Kinesis Data Analytics updates the [ApplicationVersionId] each time you change the CloudWatch logging options. \n"];
  application_ar_n: resource_ar_n option
    [@ocaml.doc "The application's ARN.\n"]}[@@ocaml.doc ""]
type nonrec add_application_cloud_watch_logging_option_request =
  {
  conditional_token: conditional_token option
    [@ocaml.doc
      "A value you use to implement strong concurrency for application updates. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken]. You get the application's current [ConditionalToken] using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  cloud_watch_logging_option: cloud_watch_logging_option
    [@ocaml.doc
      "Provides the Amazon CloudWatch log stream Amazon Resource Name (ARN). \n"];
  current_application_version_id: application_version_id option
    [@ocaml.doc
      "The version ID of the SQL-based Kinesis Data Analytics application. You must provide the [CurrentApplicationVersionId] or the [ConditionalToken].You can retrieve the application version ID using [DescribeApplication]. For better concurrency support, use the [ConditionalToken] parameter instead of [CurrentApplicationVersionId].\n"];
  application_name: application_name
    [@ocaml.doc "The Kinesis Data Analytics application name.\n"]}[@@ocaml.doc
                                                                    ""]