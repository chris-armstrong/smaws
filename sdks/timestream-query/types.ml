type nonrec service_error_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : service_error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have the necessary permissions to access the account settings.\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec sns_configuration = {
  topic_arn : amazon_resource_name;
      [@ocaml.doc "SNS topic ARN that the scheduled query status notifications will be sent to.\n"]
}
[@@ocaml.doc "Details on SNS that are required to send the notification.\n"]

type nonrec account_settings_notification_configuration = {
  sns_configuration : sns_configuration option; [@ocaml.doc ""]
  role_arn : amazon_resource_name;
      [@ocaml.doc
        "An Amazon Resource Name (ARN) that grants Timestream permission to publish notifications. \
         This field is only visible if SNS Topic is provided when updating the account settings.\n"]
}
[@@ocaml.doc "Configuration settings for notifications related to account settings.\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc " Invalid or malformed request. \n"]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was throttled due to excessive requests.\n"]

type nonrec invalid_endpoint_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested endpoint is invalid.\n"]

type nonrec internal_server_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An internal server error occurred while processing the request.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec cancel_query_response = {
  cancellation_message : string_ option;
      [@ocaml.doc
        " A [CancellationMessage] is returned when a [CancelQuery] request for the query specified \
         by [QueryId] has already been issued. \n"]
}
[@@ocaml.doc ""]

type nonrec query_id = string [@@ocaml.doc ""]

type nonrec cancel_query_request = {
  query_id : query_id;
      [@ocaml.doc
        " The ID of the query that needs to be cancelled. [QueryID] is returned as part of the \
         query result. \n"]
}
[@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec scalar_type =
  | VARCHAR [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | BIGINT [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | TIME [@ocaml.doc ""]
  | INTERVAL_DAY_TO_SECOND [@ocaml.doc ""]
  | INTERVAL_YEAR_TO_MONTH [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
[@@ocaml.doc ""]

type type_ = {
  scalar_type : scalar_type option;
      [@ocaml.doc
        "Indicates if the column is of type string, integer, Boolean, double, timestamp, date, \
         time. For more information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/supported-data-types.html}Supported \
         data types}.\n"]
  array_column_info : column_info option; [@ocaml.doc "Indicates if the column is an array.\n"]
  time_series_measure_value_column_info : column_info option;
      [@ocaml.doc "Indicates if the column is a timeseries data type.\n"]
  row_column_info : column_info_list option; [@ocaml.doc "Indicates if the column is a row.\n"]
}
[@@ocaml.doc
  "Contains the data type of a column in a query result set. The data type can be scalar or \
   complex. The supported scalar data types are integers, Boolean, string, double, timestamp, \
   date, time, and intervals. The supported complex data types are arrays, rows, and timeseries.\n"]

and column_info_list = column_info list [@@ocaml.doc ""]

and column_info = {
  name : string_ option;
      [@ocaml.doc
        " The name of the result set column. The name of the result set is available for columns \
         of all data types except for arrays. \n"]
  type_ : type_;
      [@ocaml.doc
        "The data type of the result set column. The data type can be a scalar or complex. Scalar \
         data types are integers, strings, doubles, Booleans, and others. Complex data types are \
         types such as arrays, rows, and others. \n"]
}
[@@ocaml.doc
  " Contains the metadata for query results such as the column names, data types, and other \
   attributes. \n"]

type nonrec compute_mode = ON_DEMAND [@ocaml.doc ""] | PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc " Unable to poll results for a cancelled query. \n"]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You have exceeded the service quota.\n"]

type nonrec create_scheduled_query_response = {
  arn : amazon_resource_name; [@ocaml.doc "ARN for the created scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_encryption_option = SSE_S3 [@ocaml.doc ""] | SSE_KMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_object_key_prefix = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec s3_configuration = {
  bucket_name : s3_bucket_name;
      [@ocaml.doc " Name of the S3 bucket under which error reports will be created.\n"]
  object_key_prefix : s3_object_key_prefix option;
      [@ocaml.doc
        " Prefix for the error report key. Timestream by default adds the following prefix to the \
         error report path. \n"]
  encryption_option : s3_encryption_option option;
      [@ocaml.doc
        " Encryption at rest options for the error reports. If no encryption option is specified, \
         Timestream will choose SSE_S3 as default. \n"]
}
[@@ocaml.doc "Details on S3 location for error reports that result from running a query. \n"]

type nonrec error_report_configuration = {
  s3_configuration : s3_configuration; [@ocaml.doc "The S3 configuration for the error reports.\n"]
}
[@@ocaml.doc "Configuration required for error reporting.\n"]

type nonrec string_value2048 = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag. Tag keys are case sensitive. \n"]
  value : tag_value;
      [@ocaml.doc "The value of the tag. Tag values are case sensitive and can be null. \n"]
}
[@@ocaml.doc
  "A tag is a label that you assign to a Timestream database and/or table. Each tag consists of a \
   key and an optional value, both of which you define. Tags enable you to categorize databases \
   and/or tables, for example, by purpose, owner, or environment. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec schema_name = string [@@ocaml.doc ""]

type nonrec scalar_measure_value_type =
  | BIGINT [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | VARCHAR [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec multi_measure_attribute_mapping = {
  source_column : schema_name;
      [@ocaml.doc "Source column from where the attribute value is to be read.\n"]
  target_multi_measure_attribute_name : schema_name option;
      [@ocaml.doc
        "Custom name to be used for attribute name in derived table. If not provided, source \
         column name would be used.\n"]
  measure_value_type : scalar_measure_value_type;
      [@ocaml.doc "Type of the attribute to be read from the source column.\n"]
}
[@@ocaml.doc "Attribute mapping for MULTI value measures.\n"]

type nonrec multi_measure_attribute_mapping_list = multi_measure_attribute_mapping list
[@@ocaml.doc ""]

type nonrec measure_value_type =
  | BIGINT [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | VARCHAR [@ocaml.doc ""]
  | MULTI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mixed_measure_mapping = {
  measure_name : schema_name option;
      [@ocaml.doc
        "Refers to the value of measure_name in a result row. This field is required if \
         MeasureNameColumn is provided.\n"]
  source_column : schema_name option;
      [@ocaml.doc
        "This field refers to the source column from which measure-value is to be read for result \
         materialization.\n"]
  target_measure_name : schema_name option;
      [@ocaml.doc
        "Target measure name to be used. If not provided, the target measure name by default would \
         be measure-name if provided, or sourceColumn otherwise. \n"]
  measure_value_type : measure_value_type;
      [@ocaml.doc
        "Type of the value that is to be read from sourceColumn. If the mapping is for MULTI, use \
         MeasureValueType.MULTI.\n"]
  multi_measure_attribute_mappings : multi_measure_attribute_mapping_list option;
      [@ocaml.doc
        "Required when measureValueType is MULTI. Attribute mappings for MULTI value measures.\n"]
}
[@@ocaml.doc
  "MixedMeasureMappings are mappings that can be used to ingest data into a mixture of narrow and \
   multi measures in the derived table.\n"]

type nonrec mixed_measure_mapping_list = mixed_measure_mapping list [@@ocaml.doc ""]

type nonrec multi_measure_mappings = {
  target_multi_measure_name : schema_name option;
      [@ocaml.doc
        "The name of the target multi-measure name in the derived table. This input is required \
         when measureNameColumn is not provided. If MeasureNameColumn is provided, then value from \
         that column will be used as multi-measure name.\n"]
  multi_measure_attribute_mappings : multi_measure_attribute_mapping_list;
      [@ocaml.doc
        "Required. Attribute mappings to be used for mapping query results to ingest data for \
         multi-measure attributes.\n"]
}
[@@ocaml.doc
  "Only one of MixedMeasureMappings or MultiMeasureMappings is to be provided. \
   MultiMeasureMappings can be used to ingest data as multi measures in the derived table.\n"]

type nonrec dimension_value_type = VARCHAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dimension_mapping = {
  name : schema_name; [@ocaml.doc "Column name from query result.\n"]
  dimension_value_type : dimension_value_type; [@ocaml.doc "Type for the dimension. \n"]
}
[@@ocaml.doc
  "This type is used to map column(s) from the query result to a dimension in the destination table.\n"]

type nonrec dimension_mapping_list = dimension_mapping list [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec timestream_configuration = {
  database_name : resource_name;
      [@ocaml.doc "Name of Timestream database to which the query result will be written.\n"]
  table_name : resource_name;
      [@ocaml.doc
        "Name of Timestream table that the query result will be written to. The table should be \
         within the same database that is provided in Timestream configuration.\n"]
  time_column : schema_name;
      [@ocaml.doc
        "Column from query result that should be used as the time column in destination table. \
         Column type for this should be TIMESTAMP.\n"]
  dimension_mappings : dimension_mapping_list;
      [@ocaml.doc
        " This is to allow mapping column(s) from the query result to the dimension in the \
         destination table. \n"]
  multi_measure_mappings : multi_measure_mappings option; [@ocaml.doc "Multi-measure mappings.\n"]
  mixed_measure_mappings : mixed_measure_mapping_list option;
      [@ocaml.doc "Specifies how to map measures to multi-measure records.\n"]
  measure_name_column : schema_name option; [@ocaml.doc "Name of the measure column.\n"]
}
[@@ocaml.doc
  " Configuration to write data into Timestream database and table. This configuration allows the \
   user to map the query result select columns into the destination table columns. \n"]

type nonrec target_configuration = {
  timestream_configuration : timestream_configuration;
      [@ocaml.doc "Configuration needed to write data into the Timestream database and table.\n"]
}
[@@ocaml.doc "Configuration used for writing the output of a query.\n"]

type nonrec notification_configuration = {
  sns_configuration : sns_configuration;
      [@ocaml.doc
        "Details about the Amazon Simple Notification Service (SNS) configuration. This field is \
         visible only when SNS Topic is provided when updating the account settings. \n"]
}
[@@ocaml.doc
  "Notification configuration for a scheduled query. A notification is sent by Timestream when a \
   scheduled query is created, its state is updated or when it is deleted. \n"]

type nonrec schedule_expression = string [@@ocaml.doc ""]

type nonrec schedule_configuration = {
  schedule_expression : schedule_expression;
      [@ocaml.doc
        "An expression that denotes when to trigger the scheduled query run. This can be a cron \
         expression or a rate expression. \n"]
}
[@@ocaml.doc "Configuration of the schedule of the query.\n"]

type nonrec query_string = string [@@ocaml.doc ""]

type nonrec scheduled_query_name = string [@@ocaml.doc ""]

type nonrec create_scheduled_query_request = {
  name : scheduled_query_name; [@ocaml.doc "Name of the scheduled query.\n"]
  query_string : query_string;
      [@ocaml.doc
        "The query string to run. Parameter names can be specified in the query string [@] \
         character followed by an identifier. The named Parameter [@scheduled_runtime] is reserved \
         and can be used in the query to get the time at which the query is scheduled to run.\n\n\
        \ The timestamp calculated according to the ScheduleConfiguration parameter, will be the \
         value of [@scheduled_runtime] paramater for each query run. For example, consider an \
         instance of a scheduled query executing on 2021-12-01 00:00:00. For this instance, the \
         [@scheduled_runtime] parameter is initialized to the timestamp 2021-12-01 00:00:00 when \
         invoking the query.\n\
        \ "]
  schedule_configuration : schedule_configuration;
      [@ocaml.doc "The schedule configuration for the query.\n"]
  notification_configuration : notification_configuration;
      [@ocaml.doc
        "Notification configuration for the scheduled query. A notification is sent by Timestream \
         when a query run finishes, when the state is updated or when you delete it. \n"]
  target_configuration : target_configuration option;
      [@ocaml.doc "Configuration used for writing the result of a query.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Using a ClientToken makes the call to CreateScheduledQuery idempotent, in other words, \
         making the same request repeatedly will produce the same result. Making multiple \
         identical CreateScheduledQuery requests has the same effect as making a single request. \n\n\
        \ {ul\n\
        \       {-   If CreateScheduledQuery is called without a [ClientToken], the Query SDK \
         generates a [ClientToken] on your behalf.\n\
        \           \n\
        \            }\n\
        \       {-   After 8 hours, any request with the same [ClientToken] is treated as a new \
         request. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduled_query_execution_role_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN for the IAM role that Timestream will assume when running the scheduled query. \n"]
  tags : tag_list option; [@ocaml.doc "A list of key-value pairs to label the scheduled query.\n"]
  kms_key_id : string_value2048 option;
      [@ocaml.doc
        "The Amazon KMS key used to encrypt the scheduled query resource, at-rest. If the Amazon \
         KMS key is not specified, the scheduled query resource will be encrypted with a \
         Timestream owned Amazon KMS key. To specify a KMS key, use the key ID, key ARN, alias \
         name, or alias ARN. When using an alias name, prefix the name with {i alias/} \n\n\
        \ If ErrorReportConfiguration uses [SSE_KMS] as encryption type, the same KmsKeyId is used \
         to encrypt the error report at rest.\n\
        \ "]
  error_report_configuration : error_report_configuration;
      [@ocaml.doc
        "Configuration for error reporting. Error reports will be generated when a problem is \
         encountered when writing the query results. \n"]
}
[@@ocaml.doc ""]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec timestamp = string [@@ocaml.doc ""]

type nonrec scalar_value = string [@@ocaml.doc ""]

type time_series_data_point_list = time_series_data_point list [@@ocaml.doc ""]

and time_series_data_point = {
  time : timestamp; [@ocaml.doc "The timestamp when the measure value was collected.\n"]
  value : datum; [@ocaml.doc "The measure value for the data point.\n"]
}
[@@ocaml.doc
  "The timeseries data type represents the values of a measure over time. A time series is an \
   array of rows of timestamps and measure values, with rows sorted in ascending order of time. A \
   TimeSeriesDataPoint is a single data point in the time series. It represents a tuple of (time, \
   measure value) in a time series. \n"]

and row = {
  data : datum_list; [@ocaml.doc "List of data points in a single row of the result set.\n"]
}
[@@ocaml.doc "Represents a single row in the query results.\n"]

and datum_list = datum list [@@ocaml.doc ""]

and datum = {
  scalar_value : scalar_value option;
      [@ocaml.doc
        " Indicates if the data point is a scalar value such as integer, string, double, or \
         Boolean. \n"]
  time_series_value : time_series_data_point_list option;
      [@ocaml.doc " Indicates if the data point is a timeseries data type. \n"]
  array_value : datum_list option; [@ocaml.doc " Indicates if the data point is an array. \n"]
  row_value : row option; [@ocaml.doc " Indicates if the data point is a row. \n"]
  null_value : nullable_boolean option; [@ocaml.doc " Indicates if the data point is null. \n"]
}
[@@ocaml.doc " Datum represents a single data point in a query result. \n"]

type nonrec resource_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
  scheduled_query_arn : amazon_resource_name option; [@ocaml.doc "The ARN of the scheduled query.\n"]
}
[@@ocaml.doc "The requested resource could not be found.\n"]

type nonrec delete_scheduled_query_request = {
  scheduled_query_arn : amazon_resource_name; [@ocaml.doc "The ARN of the scheduled query. \n"]
}
[@@ocaml.doc ""]

type nonrec last_update_status =
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_tc_u = int [@@ocaml.doc ""]

type nonrec last_update = {
  target_query_tc_u : query_tc_u option;
      [@ocaml.doc
        "The number of TimeStream Compute Units (TCUs) requested in the last account settings \
         update.\n"]
  status : last_update_status option;
      [@ocaml.doc
        "The status of the last update. Can be either [PENDING], [FAILED], or [SUCCEEDED].\n"]
  status_message : string_ option;
      [@ocaml.doc
        "Error message describing the last account settings update status, visible only if an \
         error occurred.\n"]
}
[@@ocaml.doc
  "Configuration object that contains the most recent account settings update, visible only if \
   settings have been updated previously.\n"]

type nonrec provisioned_capacity_response = {
  active_query_tc_u : query_tc_u option;
      [@ocaml.doc
        "The number of Timestream Compute Units (TCUs) provisioned in the account. This field is \
         only visible when the compute mode is [PROVISIONED].\n"]
  notification_configuration : account_settings_notification_configuration option;
      [@ocaml.doc
        "An object that contains settings for notifications that are sent whenever the provisioned \
         capacity settings are modified. This field is only visible when the compute mode is \
         [PROVISIONED].\n"]
  last_update : last_update option;
      [@ocaml.doc "Information about the last update to the provisioned capacity settings.\n"]
}
[@@ocaml.doc
  "The response to a request to update the provisioned capacity settings for querying data.\n"]

type nonrec query_compute_response = {
  compute_mode : compute_mode option;
      [@ocaml.doc
        "The mode in which Timestream Compute Units (TCUs) are allocated and utilized within an \
         account. Note that in the Asia Pacific (Mumbai) region, the API operation only recognizes \
         the value [PROVISIONED].\n"]
  provisioned_capacity : provisioned_capacity_response option;
      [@ocaml.doc
        "Configuration object that contains settings for provisioned Timestream Compute Units \
         (TCUs) in your account.\n"]
}
[@@ocaml.doc
  "The response to a request to retrieve or update the compute capacity settings for querying data.\n"]

type nonrec query_pricing_model = BYTES_SCANNED [@ocaml.doc ""] | COMPUTE_UNITS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_query_capacity = int [@@ocaml.doc ""]

type nonrec describe_account_settings_response = {
  max_query_tc_u : max_query_capacity option;
      [@ocaml.doc
        "The maximum number of \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/tcu.html}Timestream \
         compute units} (TCUs) the service will use at any point in time to serve your queries. To \
         run queries, you must set a minimum capacity of 4 TCU. You can set the maximum number of \
         TCU in multiples of 4, for example, 4, 8, 16, 32, and so on. This configuration is \
         applicable only for on-demand usage of (TCUs). \n"]
  query_pricing_model : query_pricing_model option;
      [@ocaml.doc
        "The pricing model for queries in your account.\n\n\
        \  The [QueryPricingModel] parameter is used by several Timestream operations; however, \
         the [UpdateAccountSettings] API operation doesn't recognize any values other than \
         [COMPUTE_UNITS].\n\
        \  \n\
        \   "]
  query_compute : query_compute_response option;
      [@ocaml.doc
        "An object that contains the usage settings for Timestream Compute Units (TCUs) in your \
         account for the query workload. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_settings_request = unit [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

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

type nonrec s3_object_key = string [@@ocaml.doc ""]

type nonrec s3_report_location = {
  bucket_name : s3_bucket_name option; [@ocaml.doc " S3 bucket name. \n"]
  object_key : s3_object_key option; [@ocaml.doc "S3 key. \n"]
}
[@@ocaml.doc " S3 report location for the scheduled query run.\n"]

type nonrec error_report_location = {
  s3_report_location : s3_report_location option;
      [@ocaml.doc "The S3 location where error reports are written.\n"]
}
[@@ocaml.doc "This contains the location of the error report for a single scheduled query call. \n"]

type nonrec query_temporal_range_max = {
  value : long option;
      [@ocaml.doc "The maximum duration in nanoseconds between the start and end of the query.\n"]
  table_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the table which is queried with the largest time range.\n"]
}
[@@ocaml.doc
  "Provides insights into the table with the most sub-optimal temporal pruning scanned by your \
   query.\n"]

type nonrec query_temporal_range = {
  max : query_temporal_range_max option;
      [@ocaml.doc
        "Encapsulates the following properties that provide insights into the most sub-optimal \
         performing table on the temporal axis:\n\n\
        \ {ul\n\
        \       {-   [Value] \226\128\147 The maximum duration in nanoseconds between the start \
         and end of the query.\n\
        \           \n\
        \            }\n\
        \       {-   [TableArn] \226\128\147 The Amazon Resource Name (ARN) of the table which is \
         queried with the largest time range.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides insights into the temporal range of the query, including the table with the largest \
   (max) time range.\n"]

type nonrec partition_key = string [@@ocaml.doc ""]

type nonrec partition_key_list = partition_key list [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec query_spatial_coverage_max = {
  value : double option; [@ocaml.doc "The maximum ratio of spatial coverage.\n"]
  table_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the table with the most sub-optimal spatial pruning.\n"]
  partition_key : partition_key_list option;
      [@ocaml.doc
        "The partition key used for partitioning, which can be a default [measure_name] or a \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/customer-defined-partition-keys.html}customer \
         defined partition key}.\n"]
}
[@@ocaml.doc
  "Provides insights into the table with the most sub-optimal spatial range scanned by your query.\n"]

type nonrec query_spatial_coverage = {
  max : query_spatial_coverage_max option;
      [@ocaml.doc
        "Provides insights into the spatial coverage of the executed query and the table with the \
         most inefficient spatial pruning.\n\n\
        \ {ul\n\
        \       {-   [Value] \226\128\147 The maximum ratio of spatial coverage.\n\
        \           \n\
        \            }\n\
        \       {-   [TableArn] \226\128\147 The Amazon Resource Name (ARN) of the table with \
         sub-optimal spatial pruning.\n\
        \           \n\
        \            }\n\
        \       {-   [PartitionKey] \226\128\147 The partition key used for partitioning, which \
         can be a default [measure_name] or a CDPK.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides insights into the spatial coverage of the query, including the table with sub-optimal \
   (max) spatial pruning. This information can help you identify areas for improvement in your \
   partitioning strategy to enhance spatial pruning\n\n\
  \ For example, you can do the following with the [QuerySpatialCoverage] information:\n\
  \ \n\
  \  {ul\n\
  \        {-  Add measure_name or use \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/customer-defined-partition-keys.html}customer-defined \
   partition key} (CDPK) predicates.\n\
  \            \n\
  \             }\n\
  \        {-  If you've already done the preceding action, remove functions around them or \
   clauses, such as [LIKE].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec scheduled_query_insights_response = {
  query_spatial_coverage : query_spatial_coverage option;
      [@ocaml.doc
        "Provides insights into the spatial coverage of the query, including the table with \
         sub-optimal (max) spatial pruning. This information can help you identify areas for \
         improvement in your partitioning strategy to enhance spatial pruning.\n"]
  query_temporal_range : query_temporal_range option;
      [@ocaml.doc
        "Provides insights into the temporal range of the query, including the table with the \
         largest (max) time range. Following are some of the potential options for optimizing \
         time-based pruning:\n\n\
        \ {ul\n\
        \       {-  Add missing time-predicates.\n\
        \           \n\
        \            }\n\
        \       {-  Remove functions around the time predicates.\n\
        \           \n\
        \            }\n\
        \       {-  Add time predicates to all the sub-queries.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  query_table_count : long option; [@ocaml.doc "Indicates the number of tables in the query.\n"]
  output_rows : long option;
      [@ocaml.doc
        "Indicates the total number of rows returned as part of the query result set. You can use \
         this data to validate if the number of rows in the result set have changed as part of the \
         query tuning exercise.\n"]
  output_bytes : long option;
      [@ocaml.doc
        "Indicates the size of query result set in bytes. You can use this data to validate if the \
         result set has changed as part of the query tuning exercise.\n"]
}
[@@ocaml.doc
  "Provides various insights and metrics related to the [ExecuteScheduledQueryRequest] that was \
   executed.\n"]

type nonrec execution_stats = {
  execution_time_in_millis : long option;
      [@ocaml.doc
        "Total time, measured in milliseconds, that was needed for the scheduled query run to \
         complete.\n"]
  data_writes : long option;
      [@ocaml.doc "Data writes metered for records ingested in a single scheduled query run.\n"]
  bytes_metered : long option; [@ocaml.doc "Bytes metered for a single scheduled query run.\n"]
  cumulative_bytes_scanned : long option;
      [@ocaml.doc "Bytes scanned for a single scheduled query run.\n"]
  records_ingested : long option;
      [@ocaml.doc "The number of records ingested for a single scheduled query run. \n"]
  query_result_rows : long option;
      [@ocaml.doc
        "Number of rows present in the output from running a query before ingestion to destination \
         data source.\n"]
}
[@@ocaml.doc "Statistics for a single scheduled query run.\n"]

type nonrec scheduled_query_run_status =
  | AUTO_TRIGGER_SUCCESS [@ocaml.doc ""]
  | AUTO_TRIGGER_FAILURE [@ocaml.doc ""]
  | MANUAL_TRIGGER_SUCCESS [@ocaml.doc ""]
  | MANUAL_TRIGGER_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec scheduled_query_run_summary = {
  invocation_time : time option;
      [@ocaml.doc
        "InvocationTime for this run. This is the time at which the query is scheduled to run. \
         Parameter [@scheduled_runtime] can be used in the query to get the value. \n"]
  trigger_time : time option; [@ocaml.doc "The actual time when the query was run.\n"]
  run_status : scheduled_query_run_status option;
      [@ocaml.doc "The status of a scheduled query run.\n"]
  execution_stats : execution_stats option; [@ocaml.doc "Runtime statistics for a scheduled run.\n"]
  query_insights_response : scheduled_query_insights_response option;
      [@ocaml.doc
        "Provides various insights and metrics related to the run summary of the scheduled query.\n"]
  error_report_location : error_report_location option;
      [@ocaml.doc "S3 location for error report.\n"]
  failure_reason : error_message option;
      [@ocaml.doc
        "Error message for the scheduled query in case of failure. You might have to look at the \
         error report to get more detailed error reasons. \n"]
}
[@@ocaml.doc "Run summary for the scheduled query\n"]

type nonrec scheduled_query_run_summary_list = scheduled_query_run_summary list [@@ocaml.doc ""]

type nonrec scheduled_query_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_query_description = {
  arn : amazon_resource_name; [@ocaml.doc "Scheduled query ARN.\n"]
  name : scheduled_query_name; [@ocaml.doc "Name of the scheduled query.\n"]
  query_string : query_string; [@ocaml.doc "The query to be run.\n"]
  creation_time : time option; [@ocaml.doc "Creation time of the scheduled query.\n"]
  state : scheduled_query_state; [@ocaml.doc "State of the scheduled query. \n"]
  previous_invocation_time : time option; [@ocaml.doc "Last time the query was run.\n"]
  next_invocation_time : time option;
      [@ocaml.doc "The next time the scheduled query is scheduled to run.\n"]
  schedule_configuration : schedule_configuration; [@ocaml.doc "Schedule configuration.\n"]
  notification_configuration : notification_configuration;
      [@ocaml.doc "Notification configuration.\n"]
  target_configuration : target_configuration option;
      [@ocaml.doc "Scheduled query target store configuration.\n"]
  scheduled_query_execution_role_arn : amazon_resource_name option;
      [@ocaml.doc "IAM role that Timestream uses to run the schedule query.\n"]
  kms_key_id : string_value2048 option;
      [@ocaml.doc "A customer provided KMS key used to encrypt the scheduled query resource.\n"]
  error_report_configuration : error_report_configuration option;
      [@ocaml.doc "Error-reporting configuration for the scheduled query.\n"]
  last_run_summary : scheduled_query_run_summary option;
      [@ocaml.doc "Runtime summary for the last scheduled query run. \n"]
  recently_failed_runs : scheduled_query_run_summary_list option;
      [@ocaml.doc "Runtime summary for the last five failed scheduled query runs.\n"]
}
[@@ocaml.doc "Structure that describes scheduled query.\n"]

type nonrec describe_scheduled_query_response = {
  scheduled_query : scheduled_query_description; [@ocaml.doc "The scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scheduled_query_request = {
  scheduled_query_arn : amazon_resource_name; [@ocaml.doc "The ARN of the scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_query_insights_mode =
  | ENABLED_WITH_RATE_CONTROL [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_query_insights = {
  mode : scheduled_query_insights_mode;
      [@ocaml.doc
        "Provides the following modes to enable [ScheduledQueryInsights]:\n\n\
        \ {ul\n\
        \       {-   [ENABLED_WITH_RATE_CONTROL] \226\128\147 Enables [ScheduledQueryInsights] for \
         the queries being processed. This mode also includes a rate control mechanism, which \
         limits the [QueryInsights] feature to 1 query per second (QPS).\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] \226\128\147 Disables [ScheduledQueryInsights].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Encapsulates settings for enabling [QueryInsights] on an [ExecuteScheduledQueryRequest].\n"]

type nonrec execute_scheduled_query_request = {
  scheduled_query_arn : amazon_resource_name; [@ocaml.doc "ARN of the scheduled query.\n"]
  invocation_time : time;
      [@ocaml.doc
        "The timestamp in UTC. Query will be run as if it was invoked at this timestamp. \n"]
  client_token : client_token option; [@ocaml.doc "Not used. \n"]
  query_insights : scheduled_query_insights option;
      [@ocaml.doc
        "Encapsulates settings for enabling [QueryInsights].\n\n\
        \ Enabling [QueryInsights] returns insights and metrics as a part of the Amazon SNS \
         notification for the query that you executed. You can use [QueryInsights] to tune your \
         query performance and cost.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec next_scheduled_queries_results_token = string [@@ocaml.doc ""]

type nonrec timestream_destination = {
  database_name : resource_name option; [@ocaml.doc "Timestream database name. \n"]
  table_name : resource_name option; [@ocaml.doc "Timestream table name. \n"]
}
[@@ocaml.doc "Destination for scheduled query.\n"]

type nonrec target_destination = {
  timestream_destination : timestream_destination option;
      [@ocaml.doc "Query result destination details for Timestream data source.\n"]
}
[@@ocaml.doc
  "Destination details to write data for a target data source. Current supported data source is \
   Timestream.\n"]

type nonrec scheduled_query = {
  arn : amazon_resource_name; [@ocaml.doc "The Amazon Resource Name.\n"]
  name : scheduled_query_name; [@ocaml.doc "The name of the scheduled query.\n"]
  creation_time : time option; [@ocaml.doc "The creation time of the scheduled query.\n"]
  state : scheduled_query_state; [@ocaml.doc "State of scheduled query. \n"]
  previous_invocation_time : time option;
      [@ocaml.doc "The last time the scheduled query was run.\n"]
  next_invocation_time : time option;
      [@ocaml.doc "The next time the scheduled query is to be run.\n"]
  error_report_configuration : error_report_configuration option;
      [@ocaml.doc "Configuration for scheduled query error reporting.\n"]
  target_destination : target_destination option;
      [@ocaml.doc "Target data source where final scheduled query result will be written.\n"]
  last_run_status : scheduled_query_run_status option;
      [@ocaml.doc "Status of the last scheduled query run.\n"]
}
[@@ocaml.doc "Scheduled Query\n"]

type nonrec scheduled_query_list = scheduled_query list [@@ocaml.doc ""]

type nonrec list_scheduled_queries_response = {
  scheduled_queries : scheduled_query_list; [@ocaml.doc "A list of scheduled queries.\n"]
  next_token : next_scheduled_queries_results_token option;
      [@ocaml.doc
        "A token to specify where to start paginating. This is the NextToken from a previously \
         truncated response.\n"]
}
[@@ocaml.doc ""]

type nonrec max_scheduled_queries_results = int [@@ocaml.doc ""]

type nonrec list_scheduled_queries_request = {
  max_results : max_scheduled_queries_results option;
      [@ocaml.doc
        "The maximum number of items to return in the output. If the total number of items \
         available is more than the value specified, a [NextToken] is provided in the output. To \
         resume pagination, provide the [NextToken] value as the argument to the subsequent call \
         to [ListScheduledQueriesRequest].\n"]
  next_token : next_scheduled_queries_results_token option;
      [@ocaml.doc " A pagination token to resume pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec next_tags_for_resource_results_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list; [@ocaml.doc "The tags currently associated with the Timestream resource. \n"]
  next_token : next_tags_for_resource_results_token option;
      [@ocaml.doc
        "A pagination token to resume pagination with a subsequent call to \
         [ListTagsForResourceResponse].\n"]
}
[@@ocaml.doc ""]

type nonrec max_tags_for_resource_result = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Timestream resource with tags to be listed. This value is an Amazon Resource Name \
         (ARN).\n"]
  max_results : max_tags_for_resource_result option;
      [@ocaml.doc "The maximum number of tags to return.\n"]
  next_token : next_tags_for_resource_results_token option;
      [@ocaml.doc "A pagination token to resume pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec max_query_results = int [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec parameter_mapping = {
  name : string_; [@ocaml.doc "Parameter name.\n"]
  type_ : type_; [@ocaml.doc ""]
}
[@@ocaml.doc "Mapping for named parameters.\n"]

type nonrec parameter_mapping_list = parameter_mapping list [@@ocaml.doc ""]

type nonrec select_column = {
  name : string_ option; [@ocaml.doc "Name of the column.\n"]
  type_ : type_ option; [@ocaml.doc ""]
  database_name : resource_name option; [@ocaml.doc " Database that has this column.\n"]
  table_name : resource_name option;
      [@ocaml.doc "Table within the database that has this column. \n"]
  aliased : nullable_boolean option;
      [@ocaml.doc "True, if the column name was aliased by the query. False otherwise.\n"]
}
[@@ocaml.doc "Details of the column that is returned by the query. \n"]

type nonrec select_column_list = select_column list [@@ocaml.doc ""]

type nonrec prepare_query_response = {
  query_string : query_string; [@ocaml.doc "The query string that you want prepare.\n"]
  columns : select_column_list;
      [@ocaml.doc "A list of SELECT clause columns of the submitted query string. \n"]
  parameters : parameter_mapping_list;
      [@ocaml.doc "A list of parameters used in the submitted query string. \n"]
}
[@@ocaml.doc ""]

type nonrec prepare_query_request = {
  query_string : query_string;
      [@ocaml.doc
        "The Timestream query string that you want to use as a prepared statement. Parameter names \
         can be specified in the query string [@] character followed by an identifier. \n"]
  validate_only : nullable_boolean option;
      [@ocaml.doc
        "By setting this value to [true], Timestream will only validate that the query string is a \
         valid Timestream query, and not store the prepared query for later use.\n"]
}
[@@ocaml.doc ""]

type nonrec provisioned_capacity_request = {
  target_query_tc_u : query_tc_u;
      [@ocaml.doc
        "The target compute capacity for querying data, specified in Timestream Compute Units \
         (TCUs).\n"]
  notification_configuration : account_settings_notification_configuration option;
      [@ocaml.doc
        "Configuration settings for notifications related to the provisioned capacity update.\n"]
}
[@@ocaml.doc "A request to update the provisioned capacity settings for querying data.\n"]

type nonrec query_execution_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc " Timestream was unable to run the query successfully. \n"]

type nonrec query_insights_response = {
  query_spatial_coverage : query_spatial_coverage option;
      [@ocaml.doc
        "Provides insights into the spatial coverage of the query, including the table with \
         sub-optimal (max) spatial pruning. This information can help you identify areas for \
         improvement in your partitioning strategy to enhance spatial pruning. \n"]
  query_temporal_range : query_temporal_range option;
      [@ocaml.doc
        "Provides insights into the temporal range of the query, including the table with the \
         largest (max) time range. Following are some of the potential options for optimizing \
         time-based pruning:\n\n\
        \ {ul\n\
        \       {-  Add missing time-predicates.\n\
        \           \n\
        \            }\n\
        \       {-  Remove functions around the time predicates.\n\
        \           \n\
        \            }\n\
        \       {-  Add time predicates to all the sub-queries.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  query_table_count : long option; [@ocaml.doc "Indicates the number of tables in the query.\n"]
  output_rows : long option;
      [@ocaml.doc
        "Indicates the total number of rows returned as part of the query result set. You can use \
         this data to validate if the number of rows in the result set have changed as part of the \
         query tuning exercise.\n"]
  output_bytes : long option;
      [@ocaml.doc
        "Indicates the size of query result set in bytes. You can use this data to validate if the \
         result set has changed as part of the query tuning exercise.\n"]
  unload_partition_count : long option;
      [@ocaml.doc "Indicates the partitions created by the [Unload] operation.\n"]
  unload_written_rows : long option;
      [@ocaml.doc "Indicates the rows written by the [Unload] query.\n"]
  unload_written_bytes : long option;
      [@ocaml.doc "Indicates the size, in bytes, written by the [Unload] operation.\n"]
}
[@@ocaml.doc "Provides various insights and metrics related to the query that you executed.\n"]

type nonrec query_status = {
  progress_percentage : double option;
      [@ocaml.doc "The progress of the query, expressed as a percentage.\n"]
  cumulative_bytes_scanned : long option;
      [@ocaml.doc
        "The amount of data scanned by the query in bytes. This is a cumulative sum and represents \
         the total amount of bytes scanned since the query was started. \n"]
  cumulative_bytes_metered : long option;
      [@ocaml.doc
        "The amount of data scanned by the query in bytes that you will be charged for. This is a \
         cumulative sum and represents the total amount of data that you will be charged for since \
         the query was started. The charge is applied only once and is either applied when the \
         query completes running or when the query is cancelled. \n"]
}
[@@ocaml.doc "Information about the status of the query, including progress and bytes scanned.\n"]

type nonrec row_list = row list [@@ocaml.doc ""]

type nonrec query_response = {
  query_id : query_id; [@ocaml.doc " A unique ID for the given query. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        " A pagination token that can be used again on a [Query] call to get the next set of \
         results. \n"]
  rows : row_list; [@ocaml.doc " The result set rows returned by the query. \n"]
  column_info : column_info_list;
      [@ocaml.doc " The column data types of the returned result set. \n"]
  query_status : query_status option;
      [@ocaml.doc
        "Information about the status of the query, including progress and bytes scanned.\n"]
  query_insights_response : query_insights_response option;
      [@ocaml.doc
        "Encapsulates [QueryInsights] containing insights and metrics related to the query that \
         you executed.\n"]
}
[@@ocaml.doc ""]

type nonrec query_insights_mode =
  | ENABLED_WITH_RATE_CONTROL [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_insights = {
  mode : query_insights_mode;
      [@ocaml.doc
        "Provides the following modes to enable [QueryInsights]:\n\n\
        \ {ul\n\
        \       {-   [ENABLED_WITH_RATE_CONTROL] \226\128\147 Enables [QueryInsights] for the \
         queries being processed. This mode also includes a rate control mechanism, which limits \
         the [QueryInsights] feature to 1 query per second (QPS).\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] \226\128\147 Disables [QueryInsights].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " [QueryInsights] is a performance tuning feature that helps you optimize your queries, reducing \
   costs and improving performance. With [QueryInsights], you can assess the pruning efficiency of \
   your queries and identify areas for improvement to enhance query performance. With \
   [QueryInsights], you can also analyze the effectiveness of your queries in terms of temporal \
   and spatial pruning, and identify opportunities to improve performance. Specifically, you can \
   evaluate how well your queries use time-based and partition key-based indexing strategies to \
   optimize data retrieval. To optimize query performance, it's essential that you fine-tune both \
   the temporal and spatial parameters that govern query execution.\n\n\
  \ The key metrics provided by [QueryInsights] are [QuerySpatialCoverage] and \
   [QueryTemporalRange]. [QuerySpatialCoverage] indicates how much of the spatial axis the query \
   scans, with lower values being more efficient. [QueryTemporalRange] shows the time range \
   scanned, with narrower ranges being more performant.\n\
  \ \n\
  \   {b Benefits of QueryInsights} \n\
  \  \n\
  \   The following are the key benefits of using [QueryInsights]:\n\
  \   \n\
  \    {ul\n\
  \          {-   {b Identifying inefficient queries} \226\128\147 [QueryInsights] provides \
   information on the time-based and attribute-based pruning of the tables accessed by the query. \
   This information helps you identify the tables that are sub-optimally accessed.\n\
  \              \n\
  \               }\n\
  \          {-   {b Optimizing your data model and partitioning} \226\128\147 You can use the \
   [QueryInsights] information to access and fine-tune your data model and partitioning strategy.\n\
  \              \n\
  \               }\n\
  \          {-   {b Tuning queries} \226\128\147 [QueryInsights] highlights opportunities to use \
   indexes more effectively.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    The maximum number of [Query] API requests you're allowed to make with [QueryInsights] \
   enabled is 1 query per second (QPS). If you exceed this query rate, it might result in \
   throttling.\n\
  \    \n\
  \     "]

type nonrec query_request = {
  query_string : query_string; [@ocaml.doc " The query to be run by Timestream. \n"]
  client_token : client_request_token option;
      [@ocaml.doc
        " Unique, case-sensitive string of up to 64 ASCII characters specified when a [Query] \
         request is made. Providing a [ClientToken] makes the call to [Query] {i idempotent}. This \
         means that running the same query repeatedly will produce the same result. In other \
         words, making multiple identical [Query] requests has the same effect as making a single \
         request. When using [ClientToken] in a query, note the following: \n\n\
        \ {ul\n\
        \       {-   If the Query API is instantiated without a [ClientToken], the Query SDK \
         generates a [ClientToken] on your behalf.\n\
        \           \n\
        \            }\n\
        \       {-  If the [Query] invocation only contains the [ClientToken] but does not include \
         a [NextToken], that invocation of [Query] is assumed to be a new query run.\n\
        \           \n\
        \            }\n\
        \       {-  If the invocation contains [NextToken], that particular invocation is assumed \
         to be a subsequent invocation of a prior call to the Query API, and a result set is \
         returned.\n\
        \           \n\
        \            }\n\
        \       {-   After 4 hours, any request with the same [ClientToken] is treated as a new \
         request. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : pagination_token option;
      [@ocaml.doc
        " A pagination token used to return a set of results. When the [Query] API is invoked \
         using [NextToken], that particular invocation is assumed to be a subsequent invocation of \
         a prior call to [Query], and a result set is returned. However, if the [Query] invocation \
         only contains the [ClientToken], that invocation of [Query] is assumed to be a new query \
         run. \n\n\
        \ Note the following when using NextToken in a query:\n\
        \ \n\
        \  {ul\n\
        \        {-  A pagination token can be used for up to five [Query] invocations, OR for a \
         duration of up to 1 hour \226\128\147 whichever comes first.\n\
        \            \n\
        \             }\n\
        \        {-  Using the same [NextToken] will return the same set of records. To keep \
         paginating through the result set, you must to use the most recent [nextToken].\n\
        \            \n\
        \             }\n\
        \        {-  Suppose a [Query] invocation returns two [NextToken] values, [TokenA] and \
         [TokenB]. If [TokenB] is used in a subsequent [Query] invocation, then [TokenA] is \
         invalidated and cannot be reused.\n\
        \            \n\
        \             }\n\
        \        {-  To request a previous result set from a query after pagination has begun, you \
         must re-invoke the Query API.\n\
        \            \n\
        \             }\n\
        \        {-  The latest [NextToken] should be used to paginate until [null] is returned, \
         at which point a new [NextToken] should be used.\n\
        \            \n\
        \             }\n\
        \        {-   If the IAM principal of the query initiator and the result reader are not \
         the same and/or the query initiator and the result reader do not have the same query \
         string in the query requests, the query will fail with an [Invalid\n\
        \                        pagination token] error. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  max_rows : max_query_results option;
      [@ocaml.doc
        " The total number of rows to be returned in the [Query] output. The initial run of \
         [Query] with a [MaxRows] value specified will return the result set of the query in two \
         cases: \n\n\
        \ {ul\n\
        \       {-  The size of the result is less than [1MB].\n\
        \           \n\
        \            }\n\
        \       {-  The number of rows in the result set is less than the value of [maxRows].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Otherwise, the initial invocation of [Query] only returns a [NextToken], which can \
         then be used in subsequent calls to fetch the result set. To resume pagination, provide \
         the [NextToken] value in the subsequent command.\n\
        \   \n\
        \    If the row size is large (e.g. a row has many columns), Timestream may return fewer \
         rows to keep the response size from exceeding the 1 MB limit. If [MaxRows] is not \
         provided, Timestream will send the necessary number of rows to meet the 1 MB limit.\n\
        \    "]
  query_insights : query_insights option;
      [@ocaml.doc
        "Encapsulates settings for enabling [QueryInsights].\n\n\
        \ Enabling [QueryInsights] returns insights and metrics in addition to query results for \
         the query that you executed. You can use [QueryInsights] to tune your query performance.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec query_compute_request = {
  compute_mode : compute_mode option;
      [@ocaml.doc
        "The mode in which Timestream Compute Units (TCUs) are allocated and utilized within an \
         account. Note that in the Asia Pacific (Mumbai) region, the API operation only recognizes \
         the value [PROVISIONED].\n"]
  provisioned_capacity : provisioned_capacity_request option;
      [@ocaml.doc
        "Configuration object that contains settings for provisioned Timestream Compute Units \
         (TCUs) in your account.\n"]
}
[@@ocaml.doc "A request to retrieve or update the compute capacity settings for querying data.\n"]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Identifies the Timestream resource to which tags should be added. This value is an Amazon \
         Resource Name (ARN).\n"]
  tags : tag_list; [@ocaml.doc "The tags to be assigned to the Timestream resource.\n"]
}
[@@ocaml.doc ""]

type nonrec update_scheduled_query_request = {
  scheduled_query_arn : amazon_resource_name; [@ocaml.doc "ARN of the scheuled query.\n"]
  state : scheduled_query_state; [@ocaml.doc "State of the scheduled query. \n"]
}
[@@ocaml.doc ""]

type nonrec update_account_settings_response = {
  max_query_tc_u : max_query_capacity option;
      [@ocaml.doc
        "The configured maximum number of compute units the service will use at any point in time \
         to serve your queries.\n"]
  query_pricing_model : query_pricing_model option;
      [@ocaml.doc "The pricing model for an account.\n"]
  query_compute : query_compute_response option;
      [@ocaml.doc "Confirms the updated account settings for querying data in your account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_account_settings_request = {
  max_query_tc_u : max_query_capacity option;
      [@ocaml.doc
        "The maximum number of compute units the service will use at any point in time to serve \
         your queries. To run queries, you must set a minimum capacity of 4 TCU. You can set the \
         maximum number of TCU in multiples of 4, for example, 4, 8, 16, 32, and so on. The \
         maximum value supported for [MaxQueryTCU] is 1000. To request an increase to this soft \
         limit, contact Amazon Web Services Support. For information about the default quota for \
         maxQueryTCU, see Default quotas. This configuration is applicable only for on-demand \
         usage of Timestream Compute Units (TCUs).\n\n\
        \ The maximum value supported for [MaxQueryTCU] is 1000. To request an increase to this \
         soft limit, contact Amazon Web Services Support. For information about the default quota \
         for [maxQueryTCU], see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.default}Default \
         quotas}.\n\
        \ "]
  query_pricing_model : query_pricing_model option;
      [@ocaml.doc
        "The pricing model for queries in an account.\n\n\
        \  The [QueryPricingModel] parameter is used by several Timestream operations; however, \
         the [UpdateAccountSettings] API operation doesn't recognize any values other than \
         [COMPUTE_UNITS].\n\
        \  \n\
        \   "]
  query_compute : query_compute_request option;
      [@ocaml.doc
        "Modifies the query compute settings configured in your account, including the query \
         pricing model and provisioned Timestream Compute Units (TCUs) in your account.\n\n\
        \  This API is idempotent, meaning that making the same request multiple times will have \
         the same effect as making the request once.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Timestream resource that the tags will be removed from. This value is an Amazon \
         Resource Name (ARN). \n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A list of tags keys. Existing tags of the resource whose keys are members of this list \
         will be removed from the Timestream resource. \n"]
}
[@@ocaml.doc ""]
