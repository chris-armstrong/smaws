open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kinesisanalytics";
      endpointPrefix = "kinesisanalytics";
      version = "2018-05-23";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec log_level =
  | DEBUG 
  | ERROR 
  | WARN 
  | INFO [@@ocaml.doc ""]
type nonrec zeppelin_monitoring_configuration_update =
  {
  log_level_update: log_level }[@@ocaml.doc
                                 "Updates to the monitoring configuration for Apache Zeppelin within a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec zeppelin_monitoring_configuration_description =
  {
  log_level: log_level option }[@@ocaml.doc
                                 "The monitoring configuration for Apache Zeppelin within a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec zeppelin_monitoring_configuration = {
  log_level: log_level }[@@ocaml.doc
                          "Describes configuration parameters for Amazon CloudWatch logging for a Managed Service for Apache Flink Studio notebook. For more information about CloudWatch logging, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html}Monitoring}.\n"]
type nonrec glue_data_catalog_configuration_update =
  {
  database_arn_update: string }[@@ocaml.doc
                                 "Updates to the configuration of the Glue Data Catalog that you use for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec catalog_configuration_update =
  {
  glue_data_catalog_configuration_update:
    glue_data_catalog_configuration_update }[@@ocaml.doc
                                              "Updates to the configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec s3_content_base_location_update =
  {
  base_path_update: string option ;
  bucket_arn_update: string option }[@@ocaml.doc
                                      "The information required to update the S3 base location that holds the application.\n"]
type nonrec deploy_as_application_configuration_update =
  {
  s3_content_location_update: s3_content_base_location_update option }
[@@ocaml.doc
  "Updates to the configuration information required to deploy an Amazon Data Analytics Studio notebook as an application with durable state.\n"]
type nonrec artifact_type =
  | DEPENDENCY_JAR 
  | UDF [@@ocaml.doc ""]
type nonrec s3_content_location =
  {
  object_version: string option ;
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "For a Managed Service for Apache Flink application provides a description of an Amazon S3 object, including the Amazon Resource Name (ARN) of the S3 bucket, the name of the Amazon S3 object that contains the data, and the version number of the Amazon S3 object that contains the data. \n"]
type nonrec maven_reference =
  {
  version: string ;
  artifact_id: string ;
  group_id: string }[@@ocaml.doc
                      "The information required to specify a Maven reference. You can use Maven references to specify dependency JAR files.\n"]
type nonrec custom_artifact_configuration =
  {
  maven_reference: maven_reference option ;
  s3_content_location: s3_content_location option ;
  artifact_type: artifact_type }[@@ocaml.doc
                                  "Specifies dependency JARs, as well as JAR files that contain user-defined functions (UDF).\n"]
type nonrec zeppelin_application_configuration_update =
  {
  custom_artifacts_configuration_update:
    custom_artifact_configuration list option ;
  deploy_as_application_configuration_update:
    deploy_as_application_configuration_update option ;
  catalog_configuration_update: catalog_configuration_update option ;
  monitoring_configuration_update:
    zeppelin_monitoring_configuration_update option }[@@ocaml.doc
                                                       "Updates to the configuration of Managed Service for Apache Flink Studio notebook.\n"]
type nonrec glue_data_catalog_configuration_description =
  {
  database_ar_n: string }[@@ocaml.doc
                           "The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API transforms that you write in an application.\n"]
type nonrec catalog_configuration_description =
  {
  glue_data_catalog_configuration_description:
    glue_data_catalog_configuration_description }[@@ocaml.doc
                                                   "The configuration parameters for the default Amazon Glue database. You use this database for Apache Flink SQL queries and table API transforms that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec s3_content_base_location_description =
  {
  base_path: string option ;
  bucket_ar_n: string }[@@ocaml.doc
                         "The description of the S3 base location that holds the application.\n"]
type nonrec deploy_as_application_configuration_description =
  {
  s3_content_location_description: s3_content_base_location_description }
[@@ocaml.doc
  "The configuration information required to deploy an Amazon Data Analytics Studio notebook as an application with durable state.\n"]
type nonrec custom_artifact_configuration_description =
  {
  maven_reference_description: maven_reference option ;
  s3_content_location_description: s3_content_location option ;
  artifact_type: artifact_type option }[@@ocaml.doc
                                         "Specifies a dependency JAR or a JAR of user-defined functions.\n"]
type nonrec zeppelin_application_configuration_description =
  {
  custom_artifacts_configuration_description:
    custom_artifact_configuration_description list option ;
  deploy_as_application_configuration_description:
    deploy_as_application_configuration_description option ;
  catalog_configuration_description: catalog_configuration_description option ;
  monitoring_configuration_description:
    zeppelin_monitoring_configuration_description }[@@ocaml.doc
                                                     "The configuration of a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec glue_data_catalog_configuration = {
  database_ar_n: string }[@@ocaml.doc
                           "The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API transforms that you write in an application.\n"]
type nonrec catalog_configuration =
  {
  glue_data_catalog_configuration: glue_data_catalog_configuration }[@@ocaml.doc
                                                                    "The configuration parameters for the default Amazon Glue database. You use this database for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec s3_content_base_location =
  {
  base_path: string option ;
  bucket_ar_n: string }[@@ocaml.doc
                         "The S3 bucket that holds the application information.\n"]
type nonrec deploy_as_application_configuration =
  {
  s3_content_location: s3_content_base_location }[@@ocaml.doc
                                                   "The information required to deploy a Managed Service for Apache Flink Studio notebook as an application with durable state.\n"]
type nonrec zeppelin_application_configuration =
  {
  custom_artifacts_configuration: custom_artifact_configuration list option ;
  deploy_as_application_configuration:
    deploy_as_application_configuration option ;
  catalog_configuration: catalog_configuration option ;
  monitoring_configuration: zeppelin_monitoring_configuration option }
[@@ocaml.doc
  "The configuration of a Managed Service for Apache Flink Studio notebook.\n"]
type nonrec vpc_configuration =
  {
  security_group_ids: string list ;
  subnet_ids: string list }[@@ocaml.doc
                             "Describes the parameters of a VPC used by the application.\n"]
type nonrec vpc_configuration_update =
  {
  security_group_id_updates: string list option ;
  subnet_id_updates: string list option ;
  vpc_configuration_id: string }[@@ocaml.doc
                                  "Describes updates to the VPC configuration used by the application.\n"]
type nonrec vpc_configuration_description =
  {
  security_group_ids: string list ;
  subnet_ids: string list ;
  vpc_id: string ;
  vpc_configuration_id: string }[@@ocaml.doc
                                  "Describes the parameters of a VPC used by the application.\n"]
type nonrec url_type =
  | ZEPPELIN_UI_URL 
  | FLINK_DASHBOARD_URL [@@ocaml.doc ""]
type nonrec runtime_environment =
  | FLINK_1_18 
  | ZEPPELIN_FLINK_3_0 
  | FLINK_1_15 
  | ZEPPELIN_FLINK_2_0 
  | FLINK_1_13 
  | FLINK_1_11 
  | ZEPPELIN_FLINK_1_0 
  | FLINK_1_8 
  | FLINK_1_6 
  | SQL_1_0 [@@ocaml.doc ""]
type nonrec application_status =
  | ROLLED_BACK 
  | MAINTENANCE 
  | ROLLING_BACK 
  | FORCE_STOPPING 
  | AUTOSCALING 
  | UPDATING 
  | RUNNING 
  | READY 
  | STOPPING 
  | STARTING 
  | DELETING [@@ocaml.doc ""]
type nonrec input_lambda_processor_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application, an object that contains the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to preprocess records in the stream.\n"]
type nonrec input_processing_configuration_description =
  {
  input_lambda_processor_description:
    input_lambda_processor_description option }[@@ocaml.doc
                                                 "For a SQL-based Kinesis Data Analytics application, provides the configuration information about an input processor. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]
type nonrec kinesis_streams_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application, describes the Kinesis data stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec kinesis_firehose_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "Describes the Amazon Kinesis Data Firehose delivery stream that is configured as the streaming source in the application input configuration. \n"]
type nonrec record_format_type =
  | CSV 
  | JSON [@@ocaml.doc ""]
type nonrec json_mapping_parameters = {
  record_row_path: string }[@@ocaml.doc
                             "For a SQL-based Kinesis Data Analytics application, provides additional mapping information when JSON is the record format on the streaming source.\n"]
type nonrec csv_mapping_parameters =
  {
  record_column_delimiter: string ;
  record_row_delimiter: string }[@@ocaml.doc
                                  "For a SQL-based Kinesis Data Analytics application, provides additional mapping information when the record format uses delimiters, such as CSV. For example, the following sample records use CSV format, where the records use the {i '\\n'} as the row delimiter and a comma (\",\") as the column delimiter: \n\n  [\"name1\", \"address1\"] \n \n   [\"name2\", \"address2\"] \n  "]
type nonrec mapping_parameters =
  {
  csv_mapping_parameters: csv_mapping_parameters option ;
  json_mapping_parameters: json_mapping_parameters option }[@@ocaml.doc
                                                             "When you configure a SQL-based Kinesis Data Analytics application's input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.\n"]
type nonrec record_format =
  {
  mapping_parameters: mapping_parameters option ;
  record_format_type: record_format_type }[@@ocaml.doc
                                            " For a SQL-based Kinesis Data Analytics application, describes the record format and relevant mapping information that should be applied to schematize the records on the stream. \n"]
type nonrec record_column =
  {
  sql_type: string ;
  mapping: string option ;
  name: string }[@@ocaml.doc
                  "For a SQL-based Kinesis Data Analytics application, describes the mapping of each data element in the streaming source to the corresponding column in the in-application stream.\n\n Also used to describe the format of the reference data source.\n "]
type nonrec source_schema =
  {
  record_columns: record_column list ;
  record_encoding: string option ;
  record_format: record_format }[@@ocaml.doc
                                  "For a SQL-based Kinesis Data Analytics application, describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream. \n"]
type nonrec input_parallelism = {
  count: int option }[@@ocaml.doc
                       "For a SQL-based Kinesis Data Analytics application, describes the number of in-application streams to create for a given streaming source. \n"]
type nonrec input_starting_position =
  | LAST_STOPPED_POINT 
  | TRIM_HORIZON 
  | NOW [@@ocaml.doc ""]
type nonrec input_starting_position_configuration =
  {
  input_starting_position: input_starting_position option }[@@ocaml.doc
                                                             "Describes the point at which the application reads from the streaming source.\n"]
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
                             "Describes the application input configuration for a SQL-based Kinesis Data Analytics application. \n"]
type nonrec kinesis_streams_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "For an SQL-based Kinesis Data Analytics application's output, describes the Kinesis data stream that is configured as its destination. \n"]
type nonrec kinesis_firehose_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application's output, describes the Kinesis Data Firehose delivery stream that is configured as its destination.\n"]
type nonrec lambda_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application's output, describes the Amazon Lambda function that is configured as its destination. \n"]
type nonrec destination_schema = {
  record_format_type: record_format_type }[@@ocaml.doc
                                            "Describes the data format when records are written to the destination in a SQL-based Kinesis Data Analytics application. \n"]
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
                              "For a SQL-based Kinesis Data Analytics application, describes the application output configuration, which includes the in-application stream name and the destination where the stream data is written. The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream. \n"]
type nonrec s3_reference_data_source_description =
  {
  reference_role_ar_n: string option ;
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "For a SQL-based Kinesis Data Analytics application, provides the bucket name and object key name that stores the reference data.\n"]
type nonrec reference_data_source_description =
  {
  reference_schema: source_schema option ;
  s3_reference_data_source_description: s3_reference_data_source_description ;
  table_name: string ;
  reference_id: string }[@@ocaml.doc
                          "For a SQL-based Kinesis Data Analytics application, describes the reference data source configured for an application.\n"]
type nonrec sql_application_configuration_description =
  {
  reference_data_source_descriptions:
    reference_data_source_description list option ;
  output_descriptions: output_description list option ;
  input_descriptions: input_description list option }[@@ocaml.doc
                                                       "Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec code_content_type =
  | ZIPFILE 
  | PLAINTEXT [@@ocaml.doc ""]
type nonrec s3_application_code_location_description =
  {
  object_version: string option ;
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "Describes the location of an application's code stored in an S3 bucket.\n"]
type nonrec code_content_description =
  {
  s3_application_code_location_description:
    s3_application_code_location_description option ;
  code_size: int option ;
  code_m_d5: string option ;
  text_content: string option }[@@ocaml.doc
                                 "Describes details about the code of a Managed Service for Apache Flink application.\n"]
type nonrec application_code_configuration_description =
  {
  code_content_description: code_content_description option ;
  code_content_type: code_content_type }[@@ocaml.doc
                                          "Describes code configuration for an application.\n"]
type nonrec application_restore_type =
  | RESTORE_FROM_CUSTOM_SNAPSHOT 
  | RESTORE_FROM_LATEST_SNAPSHOT 
  | SKIP_RESTORE_FROM_SNAPSHOT [@@ocaml.doc ""]
type nonrec application_restore_configuration =
  {
  snapshot_name: string option ;
  application_restore_type: application_restore_type }[@@ocaml.doc
                                                        "Specifies the method and snapshot to use when restarting an application using previously saved application state.\n"]
type nonrec flink_run_configuration =
  {
  allow_non_restored_state: bool option }[@@ocaml.doc
                                           "Describes the starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec run_configuration_description =
  {
  flink_run_configuration_description: flink_run_configuration option ;
  application_restore_configuration_description:
    application_restore_configuration option }[@@ocaml.doc
                                                "Describes the starting properties for a Managed Service for Apache Flink application.\n"]
type nonrec configuration_type =
  | CUSTOM 
  | DEFAULT [@@ocaml.doc ""]
type nonrec checkpoint_configuration_description =
  {
  min_pause_between_checkpoints: int option ;
  checkpoint_interval: int option ;
  checkpointing_enabled: bool option ;
  configuration_type: configuration_type option }[@@ocaml.doc
                                                   "Describes checkpointing parameters for a Managed Service for Apache Flink application.\n"]
type nonrec metrics_level =
  | PARALLELISM 
  | OPERATOR 
  | TASK 
  | APPLICATION [@@ocaml.doc ""]
type nonrec monitoring_configuration_description =
  {
  log_level: log_level option ;
  metrics_level: metrics_level option ;
  configuration_type: configuration_type option }[@@ocaml.doc
                                                   "Describes configuration parameters for CloudWatch logging for an application.\n"]
type nonrec parallelism_configuration_description =
  {
  auto_scaling_enabled: bool option ;
  current_parallelism: int option ;
  parallelism_per_kp_u: int option ;
  parallelism: int option ;
  configuration_type: configuration_type option }[@@ocaml.doc
                                                   "Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks simultaneously.\n"]
type nonrec flink_application_configuration_description =
  {
  job_plan_description: string option ;
  parallelism_configuration_description:
    parallelism_configuration_description option ;
  monitoring_configuration_description:
    monitoring_configuration_description option ;
  checkpoint_configuration_description:
    checkpoint_configuration_description option }[@@ocaml.doc
                                                   "Describes configuration parameters for a Managed Service for Apache Flink application.\n"]
type nonrec property_map = (string * string) list[@@ocaml.doc ""]
type nonrec property_group =
  {
  property_map: property_map ;
  property_group_id: string }[@@ocaml.doc
                               "Property key-value pairs passed into an application.\n"]
type nonrec environment_property_descriptions =
  {
  property_group_descriptions: property_group list option }[@@ocaml.doc
                                                             "Describes the execution properties for an Apache Flink runtime.\n"]
type nonrec application_snapshot_configuration_description =
  {
  snapshots_enabled: bool }[@@ocaml.doc
                             "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_configuration_description =
  {
  zeppelin_application_configuration_description:
    zeppelin_application_configuration_description option ;
  vpc_configuration_descriptions: vpc_configuration_description list option ;
  application_snapshot_configuration_description:
    application_snapshot_configuration_description option ;
  environment_property_descriptions: environment_property_descriptions option ;
  flink_application_configuration_description:
    flink_application_configuration_description option ;
  run_configuration_description: run_configuration_description option ;
  application_code_configuration_description:
    application_code_configuration_description option ;
  sql_application_configuration_description:
    sql_application_configuration_description option }[@@ocaml.doc
                                                        "Describes details about the application code and starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec cloud_watch_logging_option_description =
  {
  role_ar_n: string option ;
  log_stream_ar_n: string ;
  cloud_watch_logging_option_id: string option }[@@ocaml.doc
                                                  "Describes the Amazon CloudWatch logging option.\n"]
type nonrec application_maintenance_configuration_description =
  {
  application_maintenance_window_end_time: string ;
  application_maintenance_window_start_time: string }[@@ocaml.doc
                                                       "The details of the maintenance configuration for the application.\n"]
type nonrec application_mode =
  | INTERACTIVE 
  | STREAMING [@@ocaml.doc ""]
type nonrec application_detail =
  {
  application_mode: application_mode option ;
  application_version_rolled_back_to: int option ;
  conditional_token: string option ;
  application_version_rolled_back_from: int option ;
  application_version_updated_from: int option ;
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option ;
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_configuration_description:
    application_configuration_description option ;
  last_update_timestamp: CoreTypes.Timestamp.t option ;
  create_timestamp: CoreTypes.Timestamp.t option ;
  application_version_id: int ;
  application_status: application_status ;
  service_execution_role: string option ;
  runtime_environment: runtime_environment ;
  application_name: string ;
  application_description: string option ;
  application_ar_n: string }[@@ocaml.doc
                              "Describes the application, including the application Amazon Resource Name (ARN), status, latest version, and input and output configurations.\n"]
type nonrec update_application_response =
  {
  application_detail: application_detail }[@@ocaml.doc ""]
type nonrec input_lambda_processor_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "For a SQL-based Kinesis Data Analytics application, represents an update to the [InputLambdaProcessor] that is used to preprocess the records in the stream.\n"]
type nonrec input_processing_configuration_update =
  {
  input_lambda_processor_update: input_lambda_processor_update }[@@ocaml.doc
                                                                  "For a SQL-based Kinesis Data Analytics application, describes updates to an [InputProcessingConfiguration].\n"]
type nonrec kinesis_streams_input_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "When you update the input configuration for a SQL-based Kinesis Data Analytics application, provides information about a Kinesis stream as the streaming source.\n"]
type nonrec kinesis_firehose_input_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "For a SQL-based Kinesis Data Analytics application, when updating application input configuration, provides information about a Kinesis Data Firehose delivery stream as the streaming source.\n"]
type nonrec input_schema_update =
  {
  record_column_updates: record_column list option ;
  record_encoding_update: string option ;
  record_format_update: record_format option }[@@ocaml.doc
                                                "Describes updates for an SQL-based Kinesis Data Analytics application's input schema.\n"]
type nonrec input_parallelism_update = {
  count_update: int }[@@ocaml.doc
                       "For a SQL-based Kinesis Data Analytics application, provides updates to the parallelism count.\n"]
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
                      "For a SQL-based Kinesis Data Analytics application, describes updates to a specific input configuration (identified by the [InputId] of an application). \n"]
type nonrec kinesis_streams_output_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "When you update a SQL-based Kinesis Data Analytics application's output configuration using the [UpdateApplication] operation, provides information about a Kinesis data stream that is configured as the destination.\n"]
type nonrec kinesis_firehose_output_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "For a SQL-based Kinesis Data Analytics application, when updating an output configuration using the [UpdateApplication] operation, provides information about a Kinesis Data Firehose delivery stream that is configured as the destination.\n"]
type nonrec lambda_output_update = {
  resource_arn_update: string }[@@ocaml.doc
                                 "When you update an SQL-based Kinesis Data Analytics application's output configuration using the [UpdateApplication] operation, provides information about an Amazon Lambda function that is configured as the destination.\n"]
type nonrec output_update =
  {
  destination_schema_update: destination_schema option ;
  lambda_output_update: lambda_output_update option ;
  kinesis_firehose_output_update: kinesis_firehose_output_update option ;
  kinesis_streams_output_update: kinesis_streams_output_update option ;
  name_update: string option ;
  output_id: string }[@@ocaml.doc
                       " For a SQL-based Kinesis Data Analytics application, describes updates to the output configuration identified by the [OutputId]. \n"]
type nonrec s3_reference_data_source_update =
  {
  file_key_update: string option ;
  bucket_arn_update: string option }[@@ocaml.doc
                                      "For a SQL-based Kinesis Data Analytics application, describes the Amazon S3 bucket name and object key name for an in-application reference table. \n"]
type nonrec reference_data_source_update =
  {
  reference_schema_update: source_schema option ;
  s3_reference_data_source_update: s3_reference_data_source_update option ;
  table_name_update: string option ;
  reference_id: string }[@@ocaml.doc
                          "When you update a reference data source configuration for a SQL-based Kinesis Data Analytics application, this object provides all the updated values (such as the source bucket name and object key name), the in-application table name that is created, and updated mapping information that maps the data in the Amazon S3 object to the in-application reference table that is created.\n"]
type nonrec sql_application_configuration_update =
  {
  reference_data_source_updates: reference_data_source_update list option ;
  output_updates: output_update list option ;
  input_updates: input_update list option }[@@ocaml.doc
                                             "Describes updates to the input streams, destination streams, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec s3_content_location_update =
  {
  object_version_update: string option ;
  file_key_update: string option ;
  bucket_arn_update: string option }[@@ocaml.doc
                                      "Describes an update for the Amazon S3 code content location for an application.\n"]
type nonrec code_content_update =
  {
  s3_content_location_update: s3_content_location_update option ;
  zip_file_content_update: bytes option ;
  text_content_update: string option }[@@ocaml.doc
                                        "Describes an update to the code of an application. Not supported for Apache Zeppelin.\n"]
type nonrec application_code_configuration_update =
  {
  code_content_update: code_content_update option ;
  code_content_type_update: code_content_type option }[@@ocaml.doc
                                                        "Describes code configuration updates for an application. This is supported for a Managed Service for Apache Flink application or a SQL-based Kinesis Data Analytics application.\n"]
type nonrec checkpoint_configuration_update =
  {
  min_pause_between_checkpoints_update: int option ;
  checkpoint_interval_update: int option ;
  checkpointing_enabled_update: bool option ;
  configuration_type_update: configuration_type option }[@@ocaml.doc
                                                          "Describes updates to the checkpointing parameters for a Managed Service for Apache Flink application.\n"]
type nonrec monitoring_configuration_update =
  {
  log_level_update: log_level option ;
  metrics_level_update: metrics_level option ;
  configuration_type_update: configuration_type option }[@@ocaml.doc
                                                          "Describes updates to configuration parameters for Amazon CloudWatch logging for an application.\n"]
type nonrec parallelism_configuration_update =
  {
  auto_scaling_enabled_update: bool option ;
  parallelism_per_kpu_update: int option ;
  parallelism_update: int option ;
  configuration_type_update: configuration_type option }[@@ocaml.doc
                                                          "Describes updates to parameters for how an application executes multiple tasks simultaneously.\n"]
type nonrec flink_application_configuration_update =
  {
  parallelism_configuration_update: parallelism_configuration_update option ;
  monitoring_configuration_update: monitoring_configuration_update option ;
  checkpoint_configuration_update: checkpoint_configuration_update option }
[@@ocaml.doc
  "Describes updates to the configuration parameters for a Managed Service for Apache Flink application.\n"]
type nonrec environment_property_updates =
  {
  property_groups: property_group list }[@@ocaml.doc
                                          "Describes updates to the execution property groups for a Managed Service for Apache Flink application or a Studio notebook.\n"]
type nonrec application_snapshot_configuration_update =
  {
  snapshots_enabled_update: bool }[@@ocaml.doc
                                    "Describes updates to whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_configuration_update =
  {
  zeppelin_application_configuration_update:
    zeppelin_application_configuration_update option ;
  vpc_configuration_updates: vpc_configuration_update list option ;
  application_snapshot_configuration_update:
    application_snapshot_configuration_update option ;
  environment_property_updates: environment_property_updates option ;
  flink_application_configuration_update:
    flink_application_configuration_update option ;
  application_code_configuration_update:
    application_code_configuration_update option ;
  sql_application_configuration_update:
    sql_application_configuration_update option }[@@ocaml.doc
                                                   "Describes updates to an application's configuration.\n"]
type nonrec run_configuration_update =
  {
  application_restore_configuration: application_restore_configuration option ;
  flink_run_configuration: flink_run_configuration option }[@@ocaml.doc
                                                             "Describes the updates to the starting parameters for a Managed Service for Apache Flink application.\n"]
type nonrec cloud_watch_logging_option_update =
  {
  log_stream_arn_update: string option ;
  cloud_watch_logging_option_id: string }[@@ocaml.doc
                                           "Describes the Amazon CloudWatch logging option updates.\n"]
type nonrec update_application_request =
  {
  runtime_environment_update: runtime_environment option ;
  conditional_token: string option ;
  cloud_watch_logging_option_updates:
    cloud_watch_logging_option_update list option ;
  run_configuration_update: run_configuration_update option ;
  service_execution_role_update: string option ;
  application_configuration_update: application_configuration_update option ;
  current_application_version_id: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec update_application_maintenance_configuration_response =
  {
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec application_maintenance_configuration_update =
  {
  application_maintenance_window_start_time_update: string }[@@ocaml.doc
                                                              "Describes the updated maintenance configuration for the application.\n"]
type nonrec update_application_maintenance_configuration_request =
  {
  application_maintenance_configuration_update:
    application_maintenance_configuration_update ;
  application_name: string }[@@ocaml.doc ""]
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation. \n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Specified application can't be found.\n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The application is not available for this operation.\n"]
type nonrec invalid_argument_exception = {
  message: string option }[@@ocaml.doc
                            "The specified input parameter value is not valid.\n"]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            "Exception thrown as a result of concurrent modifications to an application. This error can be the result of attempting to modify an application without using the current application ID.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The number of allowed resources has been exceeded.\n"]
type nonrec invalid_request_exception = {
  message: string option }[@@ocaml.doc
                            "The request JSON is not valid for the operation.\n"]
type nonrec invalid_application_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The user-provided application configuration is not valid.\n"]
type nonrec code_validation_exception = {
  message: string option }[@@ocaml.doc
                            "The user-provided application code (query) is not valid. This can be a simple syntax error.\n"]
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
                            "The data format is not valid. Kinesis Data Analytics cannot detect the schema for the given streaming source.\n"]
type nonrec tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "A key-value pair (the value is optional) that you can define and assign to Amazon resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec stop_application_response = unit
type nonrec stop_application_request =
  {
  force: bool option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec start_application_response = unit
type nonrec sql_run_configuration =
  {
  input_starting_position_configuration:
    input_starting_position_configuration ;
  input_id: string }[@@ocaml.doc
                      "Describes the starting parameters for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec run_configuration =
  {
  application_restore_configuration: application_restore_configuration option ;
  sql_run_configurations: sql_run_configuration list option ;
  flink_run_configuration: flink_run_configuration option }[@@ocaml.doc
                                                             "Describes the starting parameters for an Managed Service for Apache Flink application.\n"]
type nonrec start_application_request =
  {
  run_configuration: run_configuration option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec input_lambda_processor = {
  resource_ar_n: string }[@@ocaml.doc
                           "An object that contains the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to preprocess records in the stream in a SQL-based Kinesis Data Analytics application. \n"]
type nonrec input_processing_configuration =
  {
  input_lambda_processor: input_lambda_processor }[@@ocaml.doc
                                                    "For a SQL-based Kinesis Data Analytics application, describes a processor that is used to preprocess the records in the stream before being processed by your application code. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]
type nonrec kinesis_streams_input = {
  resource_ar_n: string }[@@ocaml.doc
                           " Identifies a Kinesis data stream as the streaming source. You provide the stream's Amazon Resource Name (ARN).\n"]
type nonrec kinesis_firehose_input = {
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application, identifies a Kinesis Data Firehose delivery stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN).\n"]
type nonrec input =
  {
  input_schema: source_schema ;
  input_parallelism: input_parallelism option ;
  kinesis_firehose_input: kinesis_firehose_input option ;
  kinesis_streams_input: kinesis_streams_input option ;
  input_processing_configuration: input_processing_configuration option ;
  name_prefix: string }[@@ocaml.doc
                         "When you configure the application input for a SQL-based Kinesis Data Analytics application, you specify the streaming source, the in-application stream name that is created, and the mapping between the two. \n"]
type nonrec kinesis_streams_output = {
  resource_ar_n: string }[@@ocaml.doc
                           "When you configure a SQL-based Kinesis Data Analytics application's output, identifies a Kinesis data stream as the destination. You provide the stream Amazon Resource Name (ARN). \n"]
type nonrec kinesis_firehose_output = {
  resource_ar_n: string }[@@ocaml.doc
                           "For a SQL-based Kinesis Data Analytics application, when configuring application output, identifies a Kinesis Data Firehose delivery stream as the destination. You provide the stream Amazon Resource Name (ARN) of the delivery stream. \n"]
type nonrec lambda_output = {
  resource_ar_n: string }[@@ocaml.doc
                           "When you configure a SQL-based Kinesis Data Analytics application's output, identifies an Amazon Lambda function as the destination. You provide the function Amazon Resource Name (ARN) of the Lambda function. \n"]
type nonrec output =
  {
  destination_schema: destination_schema ;
  lambda_output: lambda_output option ;
  kinesis_firehose_output: kinesis_firehose_output option ;
  kinesis_streams_output: kinesis_streams_output option ;
  name: string }[@@ocaml.doc
                  " Describes a SQL-based Kinesis Data Analytics application's output configuration, in which you identify an in-application stream and a destination where you want the in-application stream data to be written. The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream. \n\n \n "]
type nonrec s3_reference_data_source =
  {
  file_key: string option ;
  bucket_ar_n: string option }[@@ocaml.doc
                                "For a SQL-based Kinesis Data Analytics application, identifies the Amazon S3 bucket and object that contains the reference data.\n\n A SQL-based Kinesis Data Analytics application loads reference data only once. If the data changes, you call the [UpdateApplication] operation to trigger reloading of data into your application. \n "]
type nonrec reference_data_source =
  {
  reference_schema: source_schema ;
  s3_reference_data_source: s3_reference_data_source option ;
  table_name: string }[@@ocaml.doc
                        "For a SQL-based Kinesis Data Analytics application, describes the reference data source by providing the source information (Amazon S3 bucket name and object key name), the resulting in-application table name that is created, and the necessary schema to map the data elements in the Amazon S3 object to the in-application table.\n"]
type nonrec sql_application_configuration =
  {
  reference_data_sources: reference_data_source list option ;
  outputs: output list option ;
  inputs: input list option }[@@ocaml.doc
                               "Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics application.\n"]
type nonrec snapshot_status =
  | FAILED 
  | DELETING 
  | READY 
  | CREATING [@@ocaml.doc ""]
type nonrec snapshot_details =
  {
  runtime_environment: runtime_environment option ;
  snapshot_creation_timestamp: CoreTypes.Timestamp.t option ;
  application_version_id: int ;
  snapshot_status: snapshot_status ;
  snapshot_name: string }[@@ocaml.doc
                           "Provides details about a snapshot of application state.\n"]
type nonrec service_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "The service cannot complete the request.\n"]
type nonrec s3_configuration = {
  file_key: string ;
  bucket_ar_n: string }[@@ocaml.doc
                         "For a SQL-based Kinesis Data Analytics application, provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the S3 bucket and the name of the Amazon S3 object that contains the data.\n"]
type nonrec rollback_application_response =
  {
  application_detail: application_detail }[@@ocaml.doc ""]
type nonrec rollback_application_request =
  {
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec resource_provisioned_throughput_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Discovery failed to get a record from the streaming source because of the Kinesis Streams [ProvisionedThroughputExceededException]. For more information, see {{:http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html}GetRecords} in the Amazon Kinesis Streams API Reference.\n"]
type nonrec parallelism_configuration =
  {
  auto_scaling_enabled: bool option ;
  parallelism_per_kp_u: int option ;
  parallelism: int option ;
  configuration_type: configuration_type }[@@ocaml.doc
                                            "Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks simultaneously. For more information about parallelism, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.18/dev/parallel.html}Parallel Execution} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.18/}Apache Flink Documentation}.\n"]
type nonrec monitoring_configuration =
  {
  log_level: log_level option ;
  metrics_level: metrics_level option ;
  configuration_type: configuration_type }[@@ocaml.doc
                                            "Describes configuration parameters for Amazon CloudWatch logging for an application. For more information about CloudWatch logging, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html}Monitoring}.\n"]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec application_summary =
  {
  application_mode: application_mode option ;
  runtime_environment: runtime_environment ;
  application_version_id: int ;
  application_status: application_status ;
  application_ar_n: string ;
  application_name: string }[@@ocaml.doc
                              "Provides application summary information, including the application Amazon Resource Name (ARN), name, and status.\n"]
type nonrec list_applications_response =
  {
  next_token: string option ;
  application_summaries: application_summary list }[@@ocaml.doc ""]
type nonrec list_applications_request =
  {
  next_token: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec application_version_summary =
  {
  application_status: application_status ;
  application_version_id: int }[@@ocaml.doc
                                 "The summary of the application version.\n"]
type nonrec list_application_versions_response =
  {
  next_token: string option ;
  application_version_summaries: application_version_summary list option }
[@@ocaml.doc ""]
type nonrec list_application_versions_request =
  {
  next_token: string option ;
  limit: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec list_application_snapshots_response =
  {
  next_token: string option ;
  snapshot_summaries: snapshot_details list option }[@@ocaml.doc ""]
type nonrec list_application_snapshots_request =
  {
  next_token: string option ;
  limit: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec discover_input_schema_response =
  {
  raw_input_records: string list option ;
  processed_input_records: string list option ;
  parsed_input_records: string list list option ;
  input_schema: source_schema option }[@@ocaml.doc ""]
type nonrec discover_input_schema_request =
  {
  input_processing_configuration: input_processing_configuration option ;
  s3_configuration: s3_configuration option ;
  input_starting_position_configuration:
    input_starting_position_configuration option ;
  service_execution_role: string ;
  resource_ar_n: string option }[@@ocaml.doc ""]
type nonrec describe_application_version_response =
  {
  application_version_detail: application_detail option }[@@ocaml.doc ""]
type nonrec describe_application_version_request =
  {
  application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec describe_application_snapshot_response =
  {
  snapshot_details: snapshot_details }[@@ocaml.doc ""]
type nonrec describe_application_snapshot_request =
  {
  snapshot_name: string ;
  application_name: string }[@@ocaml.doc ""]
type nonrec describe_application_response =
  {
  application_detail: application_detail }[@@ocaml.doc ""]
type nonrec describe_application_request =
  {
  include_additional_details: bool option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_vpc_configuration_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_application_vpc_configuration_request =
  {
  conditional_token: string option ;
  vpc_configuration_id: string ;
  current_application_version_id: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_snapshot_response = unit
type nonrec delete_application_snapshot_request =
  {
  snapshot_creation_timestamp: CoreTypes.Timestamp.t ;
  snapshot_name: string ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_reference_data_source_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_application_reference_data_source_request =
  {
  reference_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_output_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_application_output_request =
  {
  output_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_input_processing_configuration_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_application_input_processing_configuration_request =
  {
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_response =
  {
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_application_cloud_watch_logging_option_request =
  {
  conditional_token: string option ;
  cloud_watch_logging_option_id: string ;
  current_application_version_id: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec delete_application_response = unit
type nonrec delete_application_request =
  {
  create_timestamp: CoreTypes.Timestamp.t ;
  application_name: string }[@@ocaml.doc ""]
type nonrec create_application_snapshot_response = unit
type nonrec create_application_snapshot_request =
  {
  snapshot_name: string ;
  application_name: string }[@@ocaml.doc ""]
type nonrec create_application_presigned_url_response =
  {
  authorized_url: string option }[@@ocaml.doc ""]
type nonrec create_application_presigned_url_request =
  {
  session_expiration_duration_in_seconds: int option ;
  url_type: url_type ;
  application_name: string }[@@ocaml.doc ""]
type nonrec create_application_response =
  {
  application_detail: application_detail }[@@ocaml.doc ""]
type nonrec checkpoint_configuration =
  {
  min_pause_between_checkpoints: int option ;
  checkpoint_interval: int option ;
  checkpointing_enabled: bool option ;
  configuration_type: configuration_type }[@@ocaml.doc
                                            "Describes an application's checkpointing configuration. Checkpointing is the process of persisting application state for fault tolerance. For more information, see {{:https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing} Checkpoints for Fault Tolerance} in the {{:https://nightlies.apache.org/flink/flink-docs-release-1.18/}Apache Flink Documentation}.\n"]
type nonrec flink_application_configuration =
  {
  parallelism_configuration: parallelism_configuration option ;
  monitoring_configuration: monitoring_configuration option ;
  checkpoint_configuration: checkpoint_configuration option }[@@ocaml.doc
                                                               "Describes configuration parameters for a Managed Service for Apache Flink application or a Studio notebook.\n"]
type nonrec environment_properties = {
  property_groups: property_group list }[@@ocaml.doc
                                          "Describes execution properties for a Managed Service for Apache Flink application.\n"]
type nonrec code_content =
  {
  s3_content_location: s3_content_location option ;
  zip_file_content: bytes option ;
  text_content: string option }[@@ocaml.doc
                                 "Specifies either the application code, or the location of the application code, for a Managed Service for Apache Flink application. \n"]
type nonrec application_code_configuration =
  {
  code_content_type: code_content_type ;
  code_content: code_content option }[@@ocaml.doc
                                       "Describes code configuration for an application.\n"]
type nonrec application_snapshot_configuration = {
  snapshots_enabled: bool }[@@ocaml.doc
                             "Describes whether snapshots are enabled for a Managed Service for Apache Flink application.\n"]
type nonrec application_configuration =
  {
  zeppelin_application_configuration:
    zeppelin_application_configuration option ;
  vpc_configurations: vpc_configuration list option ;
  application_snapshot_configuration:
    application_snapshot_configuration option ;
  application_code_configuration: application_code_configuration option ;
  environment_properties: environment_properties option ;
  flink_application_configuration: flink_application_configuration option ;
  sql_application_configuration: sql_application_configuration option }
[@@ocaml.doc
  "Specifies the creation parameters for a Managed Service for Apache Flink application.\n"]
type nonrec cloud_watch_logging_option = {
  log_stream_ar_n: string }[@@ocaml.doc
                             "Provides a description of Amazon CloudWatch logging options, including the log stream Amazon Resource Name (ARN). \n"]
type nonrec create_application_request =
  {
  application_mode: application_mode option ;
  tags: tag list option ;
  cloud_watch_logging_options: cloud_watch_logging_option list option ;
  application_configuration: application_configuration option ;
  service_execution_role: string ;
  runtime_environment: runtime_environment ;
  application_description: string option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_vpc_configuration_response =
  {
  vpc_configuration_description: vpc_configuration_description option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_vpc_configuration_request =
  {
  conditional_token: string option ;
  vpc_configuration: vpc_configuration ;
  current_application_version_id: int option ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_reference_data_source_response =
  {
  reference_data_source_descriptions:
    reference_data_source_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_reference_data_source_request =
  {
  reference_data_source: reference_data_source ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_output_response =
  {
  output_descriptions: output_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_output_request =
  {
  output: output ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_input_processing_configuration_response =
  {
  input_processing_configuration_description:
    input_processing_configuration_description option ;
  input_id: string option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_input_processing_configuration_request =
  {
  input_processing_configuration: input_processing_configuration ;
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_input_response =
  {
  input_descriptions: input_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_input_request =
  {
  input: input ;
  current_application_version_id: int ;
  application_name: string }[@@ocaml.doc ""]
type nonrec add_application_cloud_watch_logging_option_response =
  {
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }[@@ocaml.doc ""]
type nonrec add_application_cloud_watch_logging_option_request =
  {
  conditional_token: string option ;
  cloud_watch_logging_option: cloud_watch_logging_option ;
  current_application_version_id: int option ;
  application_name: string }[@@ocaml.doc ""]