type nonrec error_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "You are not authorized to perform this action.\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec batch_load_data_format = CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec batch_load_progress_report = {
  records_processed : long option; [@ocaml.doc "\n"]
  records_ingested : long option; [@ocaml.doc "\n"]
  parse_failures : long option; [@ocaml.doc "\n"]
  record_ingestion_failures : long option; [@ocaml.doc "\n"]
  file_failures : long option; [@ocaml.doc "\n"]
  bytes_metered : long option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "Details about the progress of a batch load task.\n"]

type nonrec batch_load_status =
  | CREATED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | PROGRESS_STOPPED [@ocaml.doc ""]
  | PENDING_RESUME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec batch_load_task_id = string [@@ocaml.doc ""]

type nonrec batch_load_task = {
  task_id : batch_load_task_id option; [@ocaml.doc "The ID of the batch load task.\n"]
  task_status : batch_load_status option; [@ocaml.doc "Status of the batch load task.\n"]
  database_name : resource_name option;
      [@ocaml.doc "Database name for the database into which a batch load task loads data.\n"]
  table_name : resource_name option;
      [@ocaml.doc "Table name for the table into which a batch load task loads data.\n"]
  creation_time : date option;
      [@ocaml.doc "The time when the Timestream batch load task was created.\n"]
  last_updated_time : date option;
      [@ocaml.doc "The time when the Timestream batch load task was last updated.\n"]
  resumable_until : date option; [@ocaml.doc " \n"]
}
[@@ocaml.doc "Details about a batch load task.\n"]

type nonrec record_version = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec s3_object_key = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec data_model_s3_configuration = {
  bucket_name : s3_bucket_name option; [@ocaml.doc "\n"]
  object_key : s3_object_key option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec string_value256 = string [@@ocaml.doc ""]

type nonrec scalar_measure_value_type =
  | DOUBLE [@ocaml.doc ""]
  | BIGINT [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | VARCHAR [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schema_name = string [@@ocaml.doc ""]

type nonrec multi_measure_attribute_mapping = {
  source_column : schema_name; [@ocaml.doc "\n"]
  target_multi_measure_attribute_name : schema_name option; [@ocaml.doc "\n"]
  measure_value_type : scalar_measure_value_type option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec multi_measure_attribute_mapping_list = multi_measure_attribute_mapping list
[@@ocaml.doc ""]

type nonrec measure_value_type =
  | DOUBLE [@ocaml.doc ""]
  | BIGINT [@ocaml.doc ""]
  | VARCHAR [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | MULTI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mixed_measure_mapping = {
  measure_name : schema_name option; [@ocaml.doc "\n"]
  source_column : schema_name option; [@ocaml.doc "\n"]
  target_measure_name : schema_name option; [@ocaml.doc "\n"]
  measure_value_type : measure_value_type; [@ocaml.doc "\n"]
  multi_measure_attribute_mappings : multi_measure_attribute_mapping_list option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec mixed_measure_mapping_list = mixed_measure_mapping list [@@ocaml.doc ""]

type nonrec multi_measure_mappings = {
  target_multi_measure_name : schema_name option; [@ocaml.doc "\n"]
  multi_measure_attribute_mappings : multi_measure_attribute_mapping_list; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec dimension_mapping = {
  source_column : schema_name option; [@ocaml.doc "\n"]
  destination_column : schema_name option; [@ocaml.doc " \n"]
}
[@@ocaml.doc "\n"]

type nonrec dimension_mappings = dimension_mapping list [@@ocaml.doc ""]

type nonrec time_unit =
  | MILLISECONDS [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
  | MICROSECONDS [@ocaml.doc ""]
  | NANOSECONDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_model = {
  time_column : string_value256 option; [@ocaml.doc "Source column to be mapped to time.\n"]
  time_unit : time_unit option;
      [@ocaml.doc
        " The granularity of the timestamp unit. It indicates if the time value is in seconds, \
         milliseconds, nanoseconds, or other supported values. Default is [MILLISECONDS]. \n"]
  dimension_mappings : dimension_mappings;
      [@ocaml.doc "Source to target mappings for dimensions.\n"]
  multi_measure_mappings : multi_measure_mappings option;
      [@ocaml.doc "Source to target mappings for multi-measure records.\n"]
  mixed_measure_mappings : mixed_measure_mapping_list option;
      [@ocaml.doc "Source to target mappings for measures.\n"]
  measure_name_column : string_value256 option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "Data model for a batch load task.\n"]

type nonrec data_model_configuration = {
  data_model : data_model option; [@ocaml.doc "\n"]
  data_model_s3_configuration : data_model_s3_configuration option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec string_value2048 = string [@@ocaml.doc ""]

type nonrec s3_encryption_option = SSE_S3 [@ocaml.doc ""] | SSE_KMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_object_key_prefix = string [@@ocaml.doc ""]

type nonrec report_s3_configuration = {
  bucket_name : s3_bucket_name; [@ocaml.doc "\n"]
  object_key_prefix : s3_object_key_prefix option; [@ocaml.doc "\n"]
  encryption_option : s3_encryption_option option; [@ocaml.doc "\n"]
  kms_key_id : string_value2048 option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec report_configuration = {
  report_s3_configuration : report_s3_configuration option;
      [@ocaml.doc
        "Configuration of an S3 location to write error reports and events for a batch load.\n"]
}
[@@ocaml.doc
  "Report configuration for a batch load task. This contains details about where error reports are \
   stored.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec string_value1 = string [@@ocaml.doc ""]

type nonrec csv_configuration = {
  column_separator : string_value1 option;
      [@ocaml.doc
        "Column separator can be one of comma (','), pipe ('|), semicolon (';'), tab('/t'), or \
         blank space (' '). \n"]
  escape_char : string_value1 option; [@ocaml.doc "Escape character can be one of \n"]
  quote_char : string_value1 option; [@ocaml.doc "Can be single quote (') or double quote (\").\n"]
  null_value : string_value256 option; [@ocaml.doc "Can be blank space (' ').\n"]
  trim_white_space : boolean_ option;
      [@ocaml.doc "Specifies to trim leading and trailing white space.\n"]
}
[@@ocaml.doc
  "A delimited data format where the column separator can be a comma and the record separator is a \
   newline character.\n"]

type nonrec data_source_s3_configuration = {
  bucket_name : s3_bucket_name; [@ocaml.doc "The bucket name of the customer S3 bucket.\n"]
  object_key_prefix : s3_object_key option; [@ocaml.doc " \n"]
}
[@@ocaml.doc " \n"]

type nonrec data_source_configuration = {
  data_source_s3_configuration : data_source_s3_configuration;
      [@ocaml.doc "Configuration of an S3 location for a file which contains data to load.\n"]
  csv_configuration : csv_configuration option; [@ocaml.doc ""]
  data_format : batch_load_data_format; [@ocaml.doc "This is currently CSV.\n"]
}
[@@ocaml.doc "Defines configuration details about the data source.\n"]

type nonrec batch_load_task_description = {
  task_id : batch_load_task_id option; [@ocaml.doc "The ID of the batch load task.\n"]
  error_message : string_value2048 option; [@ocaml.doc "\n"]
  data_source_configuration : data_source_configuration option;
      [@ocaml.doc "Configuration details about the data source for a batch load task.\n"]
  progress_report : batch_load_progress_report option; [@ocaml.doc "\n"]
  report_configuration : report_configuration option;
      [@ocaml.doc
        "Report configuration for a batch load task. This contains details about where error \
         reports are stored.\n"]
  data_model_configuration : data_model_configuration option;
      [@ocaml.doc
        "Data model configuration for a batch load task. This contains details about where a data \
         model for a batch load task is stored.\n"]
  target_database_name : resource_name option; [@ocaml.doc "\n"]
  target_table_name : resource_name option; [@ocaml.doc "\n"]
  task_status : batch_load_status option; [@ocaml.doc "Status of the batch load task.\n"]
  record_version : record_version option; [@ocaml.doc "\n"]
  creation_time : date option;
      [@ocaml.doc "The time when the Timestream batch load task was created.\n"]
  last_updated_time : date option;
      [@ocaml.doc "The time when the Timestream batch load task was last updated.\n"]
  resumable_until : date option; [@ocaml.doc " \n"]
}
[@@ocaml.doc "Details about a batch load task.\n"]

type nonrec batch_load_task_list = batch_load_task list [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec conflict_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  "Timestream was unable to process this request because it contains resource that already exists.\n"]

type nonrec validation_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc " An invalid or malformed request.\n"]

type nonrec throttling_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  " Too many requests were made by a user and they exceeded the service quotas. The request was \
   throttled.\n"]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc " The instance quota of resource exceeded for this account.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation tried to access a nonexistent resource. The resource might not be specified \
   correctly, or its status might not be ACTIVE.\n"]

type nonrec invalid_endpoint_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested endpoint was not valid.\n"]

type nonrec internal_server_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  " Timestream was unable to fully process this request because of an internal server error.\n"]

type nonrec create_batch_load_task_response = {
  task_id : batch_load_task_id; [@ocaml.doc "The ID of the batch load task.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_create_api_name = string [@@ocaml.doc ""]

type nonrec create_batch_load_task_request = {
  client_token : client_request_token option; [@ocaml.doc "\n"]
  data_model_configuration : data_model_configuration option; [@ocaml.doc ""]
  data_source_configuration : data_source_configuration;
      [@ocaml.doc "Defines configuration details about the data source for a batch load task.\n"]
  report_configuration : report_configuration; [@ocaml.doc ""]
  target_database_name : resource_create_api_name;
      [@ocaml.doc "Target Timestream database for a batch load task.\n"]
  target_table_name : resource_create_api_name;
      [@ocaml.doc "Target Timestream table for a batch load task.\n"]
  record_version : record_version option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec database = {
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name that uniquely identifies this database.\n"]
  database_name : resource_name option; [@ocaml.doc "The name of the Timestream database.\n"]
  table_count : long option;
      [@ocaml.doc "The total number of tables found within a Timestream database. \n"]
  kms_key_id : string_value2048 option;
      [@ocaml.doc
        "The identifier of the KMS key used to encrypt the data stored in the database.\n"]
  creation_time : date option;
      [@ocaml.doc "The time when the database was created, calculated from the Unix epoch time.\n"]
  last_updated_time : date option; [@ocaml.doc " The last time that this database was updated. \n"]
}
[@@ocaml.doc
  "A top-level container for a table. Databases and tables are the fundamental management concepts \
   in Amazon Timestream. All tables in a database are encrypted with the same KMS key.\n"]

type nonrec create_database_response = {
  database : database option; [@ocaml.doc "The newly created Timestream database.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc " The key of the tag. Tag keys are case sensitive. \n"]
  value : tag_value;
      [@ocaml.doc " The value of the tag. Tag values are case-sensitive and can be null. \n"]
}
[@@ocaml.doc
  " A tag is a label that you assign to a Timestream database and/or table. Each tag consists of a \
   key and an optional value, both of which you define. With tags, you can categorize databases \
   and/or tables, for example, by purpose, owner, or environment. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_database_request = {
  database_name : resource_create_api_name; [@ocaml.doc "The name of the Timestream database.\n"]
  kms_key_id : string_value2048 option;
      [@ocaml.doc
        "The KMS key for the database. If the KMS key is not specified, the database will be \
         encrypted with a Timestream managed KMS key located in your account. For more \
         information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed keys}.\n"]
  tags : tag_list option; [@ocaml.doc " A list of key-value pairs to label the table. \n"]
}
[@@ocaml.doc ""]

type nonrec partition_key_enforcement_level = REQUIRED [@ocaml.doc ""] | OPTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partition_key_type = DIMENSION [@ocaml.doc ""] | MEASURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partition_key = {
  type_ : partition_key_type;
      [@ocaml.doc
        " The type of the partition key. Options are DIMENSION (dimension key) and MEASURE \
         (measure key). \n"]
  name : schema_name option; [@ocaml.doc " The name of the attribute used for a dimension key. \n"]
  enforcement_in_record : partition_key_enforcement_level option;
      [@ocaml.doc
        " The level of enforcement for the specification of a dimension key in ingested records. \
         Options are REQUIRED (dimension key must be specified) and OPTIONAL (dimension key does \
         not have to be specified). \n"]
}
[@@ocaml.doc
  " An attribute used in partitioning data in a table. A dimension key partitions data using the \
   values of the dimension specified by the dimension-name as partition key, while a measure key \
   partitions data using measure names (values of the 'measure_name' column). \n"]

type nonrec partition_key_list = partition_key list [@@ocaml.doc ""]

type nonrec schema = {
  composite_partition_key : partition_key_list option;
      [@ocaml.doc
        "A non-empty list of partition keys defining the attributes used to partition the table \
         data. The order of the list determines the partition hierarchy. The name and type of each \
         partition key as well as the partition key order cannot be changed after the table is \
         created. However, the enforcement level of each partition key can be changed. \n"]
}
[@@ocaml.doc " A Schema specifies the expected data model of the table. \n"]

type nonrec s3_configuration = {
  bucket_name : s3_bucket_name option; [@ocaml.doc "The bucket name of the customer S3 bucket.\n"]
  object_key_prefix : s3_object_key_prefix option;
      [@ocaml.doc "The object key preview for the customer S3 location.\n"]
  encryption_option : s3_encryption_option option;
      [@ocaml.doc
        "The encryption option for the customer S3 location. Options are S3 server-side encryption \
         with an S3 managed key or Amazon Web Services managed key.\n"]
  kms_key_id : string_value2048 option;
      [@ocaml.doc
        "The KMS key ID for the customer S3 location when encrypting with an Amazon Web Services \
         managed key.\n"]
}
[@@ocaml.doc "The configuration that specifies an S3 location.\n"]

type nonrec magnetic_store_rejected_data_location = {
  s3_configuration : s3_configuration option;
      [@ocaml.doc
        "Configuration of an S3 location to write error reports for records rejected, \
         asynchronously, during magnetic store writes.\n"]
}
[@@ocaml.doc
  "The location to write error reports for records rejected, asynchronously, during magnetic store \
   writes.\n"]

type nonrec magnetic_store_write_properties = {
  enable_magnetic_store_writes : boolean_; [@ocaml.doc "A flag to enable magnetic store writes.\n"]
  magnetic_store_rejected_data_location : magnetic_store_rejected_data_location option;
      [@ocaml.doc
        "The location to write error reports for records rejected asynchronously during magnetic \
         store writes.\n"]
}
[@@ocaml.doc "The set of properties on a table for configuring magnetic store writes.\n"]

type nonrec magnetic_store_retention_period_in_days = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec memory_store_retention_period_in_hours = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec retention_properties = {
  memory_store_retention_period_in_hours : memory_store_retention_period_in_hours;
      [@ocaml.doc "The duration for which data must be stored in the memory store. \n"]
  magnetic_store_retention_period_in_days : magnetic_store_retention_period_in_days;
      [@ocaml.doc "The duration for which data must be stored in the magnetic store. \n"]
}
[@@ocaml.doc
  "Retention properties contain the duration for which your time-series data must be stored in the \
   magnetic store and the memory store. \n"]

type nonrec table_status =
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | RESTORING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table = {
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name that uniquely identifies this table.\n"]
  table_name : resource_name option; [@ocaml.doc "The name of the Timestream table.\n"]
  database_name : resource_name option;
      [@ocaml.doc "The name of the Timestream database that contains this table.\n"]
  table_status : table_status option;
      [@ocaml.doc
        "The current state of the table:\n\n\
        \ {ul\n\
        \       {-   [DELETING] - The table is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] - The table is ready for use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retention_properties : retention_properties option;
      [@ocaml.doc "The retention duration for the memory store and magnetic store.\n"]
  creation_time : date option; [@ocaml.doc "The time when the Timestream table was created. \n"]
  last_updated_time : date option;
      [@ocaml.doc "The time when the Timestream table was last updated.\n"]
  magnetic_store_write_properties : magnetic_store_write_properties option;
      [@ocaml.doc "Contains properties to set on the table when enabling magnetic store writes.\n"]
  schema : schema option; [@ocaml.doc " The schema of the table. \n"]
}
[@@ocaml.doc
  "Represents a database table in Timestream. Tables contain one or more related time series. You \
   can modify the retention duration of the memory store and the magnetic store for a table. \n"]

type nonrec create_table_response = {
  table : table option; [@ocaml.doc "The newly created Timestream table.\n"]
}
[@@ocaml.doc ""]

type nonrec create_table_request = {
  database_name : resource_create_api_name; [@ocaml.doc "The name of the Timestream database.\n"]
  table_name : resource_create_api_name; [@ocaml.doc "The name of the Timestream table.\n"]
  retention_properties : retention_properties option;
      [@ocaml.doc
        "The duration for which your time-series data must be stored in the memory store and the \
         magnetic store.\n"]
  tags : tag_list option; [@ocaml.doc " A list of key-value pairs to label the table. \n"]
  magnetic_store_write_properties : magnetic_store_write_properties option;
      [@ocaml.doc "Contains properties to set on the table when enabling magnetic store writes.\n"]
  schema : schema option; [@ocaml.doc " The schema of the table. \n"]
}
[@@ocaml.doc ""]

type nonrec database_list = database list [@@ocaml.doc ""]

type nonrec delete_database_request = {
  database_name : resource_name; [@ocaml.doc "The name of the Timestream database to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_table_request = {
  database_name : resource_name;
      [@ocaml.doc "The name of the database where the Timestream database is to be deleted.\n"]
  table_name : resource_name; [@ocaml.doc "The name of the Timestream table to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_batch_load_task_response = {
  batch_load_task_description : batch_load_task_description;
      [@ocaml.doc "Description of the batch load task.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_batch_load_task_request = {
  task_id : batch_load_task_id; [@ocaml.doc "The ID of the batch load task.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_database_response = {
  database : database option; [@ocaml.doc "The name of the Timestream table.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_database_request = {
  database_name : resource_name; [@ocaml.doc "The name of the Timestream database.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint = {
  address : string_; [@ocaml.doc "An endpoint address.\n"]
  cache_period_in_minutes : long; [@ocaml.doc "The TTL for the endpoint, in minutes.\n"]
}
[@@ocaml.doc
  "Represents an available endpoint against which to make API calls against, as well as the TTL \
   for that endpoint.\n"]

type nonrec endpoints = endpoint list [@@ocaml.doc ""]

type nonrec describe_endpoints_response = {
  endpoints : endpoints;
      [@ocaml.doc "An [Endpoints] object is returned when a [DescribeEndpoints] request is made.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoints_request = unit [@@ocaml.doc ""]

type nonrec describe_table_response = {
  table : table option; [@ocaml.doc "The Timestream table.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_table_request = {
  database_name : resource_name; [@ocaml.doc "The name of the Timestream database.\n"]
  table_name : resource_name; [@ocaml.doc "The name of the Timestream table.\n"]
}
[@@ocaml.doc ""]

type nonrec dimension_value_type = VARCHAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec schema_value = string [@@ocaml.doc ""]

type nonrec dimension = {
  name : schema_name;
      [@ocaml.doc
        " Dimension represents the metadata attributes of the time series. For example, the name \
         and Availability Zone of an EC2 instance or the name of the manufacturer of a wind \
         turbine are dimensions. \n\n\
        \ For constraints on dimension names, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.naming}Naming \
         Constraints}.\n\
        \ "]
  value : schema_value; [@ocaml.doc "The value of the dimension.\n"]
  dimension_value_type : dimension_value_type option;
      [@ocaml.doc "The data type of the dimension for the time-series data point.\n"]
}
[@@ocaml.doc
  "Represents the metadata attributes of the time series. For example, the name and Availability \
   Zone of an EC2 instance or the name of the manufacturer of a wind turbine are dimensions. \n"]

type nonrec dimensions = dimension list [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec list_batch_load_tasks_response = {
  next_token : string_ option;
      [@ocaml.doc
        "A token to specify where to start paginating. Provide the next ListBatchLoadTasksRequest.\n"]
  batch_load_tasks : batch_load_task_list option; [@ocaml.doc "A list of batch load task details.\n"]
}
[@@ocaml.doc ""]

type nonrec page_limit = int [@@ocaml.doc ""]

type nonrec list_batch_load_tasks_request = {
  next_token : string_ option;
      [@ocaml.doc
        "A token to specify where to start paginating. This is the NextToken from a previously \
         truncated response.\n"]
  max_results : page_limit option;
      [@ocaml.doc
        "The total number of items to return in the output. If the total number of items available \
         is more than the value specified, a NextToken is provided in the output. To resume \
         pagination, provide the NextToken value as argument of a subsequent API invocation.\n"]
  task_status : batch_load_status option; [@ocaml.doc "Status of the batch load task.\n"]
}
[@@ocaml.doc ""]

type nonrec list_databases_response = {
  databases : database_list option; [@ocaml.doc "A list of database names.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token. This parameter is returned when the response is truncated.\n"]
}
[@@ocaml.doc ""]

type nonrec pagination_limit = int [@@ocaml.doc ""]

type nonrec list_databases_request = {
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the NextToken value as argument of a \
         subsequent API invocation.\n"]
  max_results : pagination_limit option;
      [@ocaml.doc
        "The total number of items to return in the output. If the total number of items available \
         is more than the value specified, a NextToken is provided in the output. To resume \
         pagination, provide the NextToken value as argument of a subsequent API invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec table_list = table list [@@ocaml.doc ""]

type nonrec list_tables_response = {
  tables : table_list option; [@ocaml.doc "A list of tables.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "A token to specify where to start paginating. This is the NextToken from a previously \
         truncated response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tables_request = {
  database_name : resource_name option; [@ocaml.doc "The name of the Timestream database.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the NextToken value as argument of a \
         subsequent API invocation.\n"]
  max_results : pagination_limit option;
      [@ocaml.doc
        "The total number of items to return in the output. If the total number of items available \
         is more than the value specified, a NextToken is provided in the output. To resume \
         pagination, provide the NextToken value as argument of a subsequent API invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc " The tags currently associated with the Timestream resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        " The Timestream resource with tags to be listed. This value is an Amazon Resource Name \
         (ARN). \n"]
}
[@@ocaml.doc ""]

type nonrec measure_value = {
  name : schema_name;
      [@ocaml.doc
        " The name of the MeasureValue. \n\n\
        \  For constraints on MeasureValue names, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.naming} \
         Naming Constraints} in the Amazon Timestream Developer Guide.\n\
        \ "]
  value : string_value2048;
      [@ocaml.doc
        " The value for the MeasureValue. For information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/writes.html#writes.data-types}Data \
         types}.\n"]
  type_ : measure_value_type;
      [@ocaml.doc "Contains the data type of the MeasureValue for the time-series data point.\n"]
}
[@@ocaml.doc
  " Represents the data attribute of the time series. For example, the CPU utilization of an EC2 \
   instance or the RPM of a wind turbine are measures. MeasureValue has both name and value. \n\n\
  \  MeasureValue is only allowed for type [MULTI]. Using [MULTI] type, you can pass multiple data \
   attributes associated with the same time series in a single record \n\
  \ "]

type nonrec measure_values = measure_value list [@@ocaml.doc ""]

type nonrec record = {
  dimensions : dimensions option;
      [@ocaml.doc "Contains the list of dimensions for time-series data points.\n"]
  measure_name : schema_name option;
      [@ocaml.doc
        "Measure represents the data attribute of the time series. For example, the CPU \
         utilization of an EC2 instance or the RPM of a wind turbine are measures. \n"]
  measure_value : string_value2048 option;
      [@ocaml.doc " Contains the measure value for the time-series data point. \n"]
  measure_value_type : measure_value_type option;
      [@ocaml.doc
        " Contains the data type of the measure value for the time-series data point. Default type \
         is [DOUBLE]. For more information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/writes.html#writes.data-types}Data \
         types}.\n"]
  time : string_value256 option;
      [@ocaml.doc
        " Contains the time at which the measure value for the data point was collected. The time \
         value plus the unit provides the time elapsed since the epoch. For example, if the time \
         value is [12345] and the unit is [ms], then [12345 ms] have elapsed since the epoch. \n"]
  time_unit : time_unit option;
      [@ocaml.doc
        " The granularity of the timestamp unit. It indicates if the time value is in seconds, \
         milliseconds, nanoseconds, or other supported values. Default is [MILLISECONDS]. \n"]
  version : record_version option;
      [@ocaml.doc
        "64-bit attribute used for record updates. Write requests for duplicate data with a higher \
         version number will update the existing measure value and version. In cases where the \
         measure value is the same, [Version] will still be updated. Default value is [1].\n\n\
        \   [Version] must be [1] or greater, or you will receive a [ValidationException] error.\n\
        \  \n\
        \   "]
  measure_values : measure_values option;
      [@ocaml.doc
        " Contains the list of MeasureValue for time-series data points. \n\n\
        \  This is only allowed for type [MULTI]. For scalar values, use [MeasureValue] attribute \
         of the record directly. \n\
        \ "]
}
[@@ocaml.doc
  "Represents a time-series data point being written into Timestream. Each record contains an \
   array of dimensions. Dimensions represent the metadata attributes of a time-series data point, \
   such as the instance name or Availability Zone of an EC2 instance. A record also contains the \
   measure name, which is the name of the measure being collected (for example, the CPU \
   utilization of an EC2 instance). Additionally, a record contains the measure value and the \
   value type, which is the data type of the measure value. Also, the record contains the \
   timestamp of when the measure was collected and the timestamp unit, which represents the \
   granularity of the timestamp. \n\n\
  \  Records have a [Version] field, which is a 64-bit [long] that you can use for updating data \
   points. Writes of a duplicate record with the same dimension, timestamp, and measure name but \
   different measure value will only succeed if the [Version] attribute of the record in the write \
   request is higher than that of the existing record. Timestream defaults to a [Version] of [1] \
   for records without the [Version] field. \n\
  \ "]

type nonrec record_index = int [@@ocaml.doc ""]

type nonrec records = record list [@@ocaml.doc ""]

type nonrec records_ingested = {
  total : integer option; [@ocaml.doc "Total count of successfully ingested records.\n"]
  memory_store : integer option; [@ocaml.doc "Count of records ingested into the memory store.\n"]
  magnetic_store : integer option;
      [@ocaml.doc "Count of records ingested into the magnetic store.\n"]
}
[@@ocaml.doc "Information on the records ingested by this request.\n"]

type nonrec rejected_record = {
  record_index : record_index option;
      [@ocaml.doc
        " The index of the record in the input request for WriteRecords. Indexes begin with 0. \n"]
  reason : error_message option;
      [@ocaml.doc
        " The reason why a record was not successfully inserted into Timestream. Possible causes \
         of failure include: \n\n\
        \ {ul\n\
        \       {-  Records with duplicate data where there are multiple records with the same \
         dimensions, timestamps, and measure names but: \n\
        \           \n\
        \            {ul\n\
        \                  {-  Measure values are different\n\
        \                      \n\
        \                       }\n\
        \                  {-  Version is not present in the request, {i or} the value of version \
         in the new record is equal to or lower than the existing value\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         If Timestream rejects data for this case, the [ExistingVersion] field in the \
         [RejectedRecords] response will indicate the current record\226\128\153s version. To \
         force an update, you can resend the request with a version for the record set to a value \
         greater than the [ExistingVersion].\n\
        \         \n\
        \          }\n\
        \       {-   Records with timestamps that lie outside the retention duration of the memory \
         store. \n\
        \           \n\
        \             When the retention window is updated, you will receive a [RejectedRecords] \
         exception if you immediately try to ingest data within the new window. To avoid a \
         [RejectedRecords] exception, wait until the duration of the new window to ingest new \
         data. For further information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/best-practices.html#configuration} \
         Best Practices for Configuring Timestream} and \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/storage.html}the \
         explanation of how storage works in Timestream}.\n\
        \             \n\
        \               }\n\
        \       {-   Records with dimensions or measures that exceed the Timestream defined limits. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Access \
         Management} in the Timestream Developer Guide. \n\
        \   "]
  existing_version : record_version option;
      [@ocaml.doc
        "The existing version of the record. This value is populated in scenarios where an \
         identical record exists with a higher version than the version in the write request.\n"]
}
[@@ocaml.doc
  " Represents records that were not successfully inserted into Timestream due to data validation \
   issues that must be resolved before reinserting time-series data into the system. \n"]

type nonrec rejected_records = rejected_record list [@@ocaml.doc ""]

type nonrec rejected_records_exception = {
  message : error_message option; [@ocaml.doc ""]
  rejected_records : rejected_records option; [@ocaml.doc " \n"]
}
[@@ocaml.doc
  " WriteRecords would throw this exception in the following cases: \n\n\
  \ {ul\n\
  \       {-  Records with duplicate data where there are multiple records with the same \
   dimensions, timestamps, and measure names but: \n\
  \           \n\
  \            {ul\n\
  \                  {-  Measure values are different\n\
  \                      \n\
  \                       }\n\
  \                  {-  Version is not present in the request {i or} the value of version in the \
   new record is equal to or lower than the existing value\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \          In this case, if Timestream rejects data, the [ExistingVersion] field in the \
   [RejectedRecords] response will indicate the current record\226\128\153s version. To force an \
   update, you can resend the request with a version for the record set to a value greater than \
   the [ExistingVersion].\n\
  \         \n\
  \          }\n\
  \       {-   Records with timestamps that lie outside the retention duration of the memory store. \n\
  \           \n\
  \            }\n\
  \       {-   Records with dimensions or measures that exceed the Timestream defined limits. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Quotas} in the \
   Amazon Timestream Developer Guide. \n\
  \   "]

type nonrec resume_batch_load_task_response = unit [@@ocaml.doc ""]

type nonrec resume_batch_load_task_request = {
  task_id : batch_load_task_id; [@ocaml.doc "The ID of the batch load task to resume.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        " Identifies the Timestream resource to which tags should be added. This value is an \
         Amazon Resource Name (ARN). \n"]
  tags : tag_list; [@ocaml.doc " The tags to be assigned to the Timestream resource. \n"]
}
[@@ocaml.doc ""]

type nonrec write_records_response = {
  records_ingested : records_ingested option;
      [@ocaml.doc "Information on the records ingested by this request.\n"]
}
[@@ocaml.doc ""]

type nonrec write_records_request = {
  database_name : resource_name; [@ocaml.doc "The name of the Timestream database.\n"]
  table_name : resource_name; [@ocaml.doc "The name of the Timestream table.\n"]
  common_attributes : record option;
      [@ocaml.doc
        "A record that contains the common measure, dimension, time, and version attributes shared \
         across all the records in the request. The measure and dimension attributes specified \
         will be merged with the measure and dimension attributes in the records object when the \
         data is written into Timestream. Dimensions may not overlap, or a [ValidationException] \
         will be thrown. In other words, a record must contain dimensions with unique names. \n"]
  records : records;
      [@ocaml.doc
        "An array of records that contain the unique measure, dimension, time, and version \
         attributes for each time-series data point. \n"]
}
[@@ocaml.doc ""]

type nonrec update_table_response = {
  table : table option; [@ocaml.doc "The updated Timestream table.\n"]
}
[@@ocaml.doc ""]

type nonrec update_table_request = {
  database_name : resource_name; [@ocaml.doc "The name of the Timestream database.\n"]
  table_name : resource_name; [@ocaml.doc "The name of the Timestream table.\n"]
  retention_properties : retention_properties option;
      [@ocaml.doc "The retention duration of the memory store and the magnetic store.\n"]
  magnetic_store_write_properties : magnetic_store_write_properties option;
      [@ocaml.doc "Contains properties to set on the table when enabling magnetic store writes.\n"]
  schema : schema option; [@ocaml.doc " The schema of the table. \n"]
}
[@@ocaml.doc ""]

type nonrec update_database_response = { database : database option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec update_database_request = {
  database_name : resource_name; [@ocaml.doc " The name of the database. \n"]
  kms_key_id : string_value2048;
      [@ocaml.doc
        " The identifier of the new KMS key ([KmsKeyId]) to be used to encrypt the data stored in \
         the database. If the [KmsKeyId] currently registered with the database is the same as the \
         [KmsKeyId] in the request, there will not be any update. \n\n\
        \ You can specify the [KmsKeyId] using any of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n\
        \            \n\
        \             }\n\
        \        {-  Key ARN: \
         [arn:aws:kms:us-east-1:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [alias/ExampleAlias] \n\
        \            \n\
        \             }\n\
        \        {-  Alias ARN: [arn:aws:kms:us-east-1:111122223333:alias/ExampleAlias] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        " The Timestream resource that the tags will be removed from. This value is an Amazon \
         Resource Name (ARN). \n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        " A list of tags keys. Existing tags of the resource whose keys are members of this list \
         will be removed from the Timestream resource. \n"]
}
[@@ocaml.doc ""]
