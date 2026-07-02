type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec service_type = DOCDB [@ocaml.doc ""] | RDS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The metadata assigned to an Amazon RDS Performance Insights resource consisting of a \
         key-value pair.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon RDS Performance Insights resource that the tags are added to. This value is an \
         Amazon Resource Name (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing} \
         Constructing an RDS Amazon Resource Name (ARN)}.\n"]
  service_type : service_type;
      [@ocaml.doc
        "List the tags for the Amazon Web Services service for which Performance Insights returns \
         metrics. Valid value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec error_string = string [@@ocaml.doc ""]

type nonrec not_authorized_exception = { message : error_string option [@ocaml.doc ""] }
[@@ocaml.doc "The user is not authorized to perform this request.\n"]

type nonrec invalid_argument_exception = { message : error_string option [@ocaml.doc ""] }
[@@ocaml.doc "One of the arguments provided is invalid for this request.\n"]

type nonrec internal_service_error = { message : error_string option [@ocaml.doc ""] }
[@@ocaml.doc "The request failed due to an unknown error.\n"]

type nonrec text_format = MARKDOWN [@ocaml.doc ""] | PLAIN_TEXT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "A value is the optional value of the tag. The string value can be from 1 to 256 Unicode \
         characters in length and can't be prefixed with [aws:] or [rds:]. The string can only \
         contain only the set of Unicode letters, digits, white-space, '_', '.', ':', '/', '=', \
         '+', '-', '\\@' (Java regex: \
         \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\@\\]*)$\").\n"]
  key : tag_key;
      [@ocaml.doc
        "A key is the required name of the tag. The string value can be from 1 to 128 Unicode \
         characters in length and can't be prefixed with [aws:] or [rds:]. The string can only \
         contain only the set of Unicode letters, digits, white-space, '_', '.', ':', '/', '=', \
         '+', '-', '\\@' (Java regex: [\"^(\\[\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@\\]*)$\"]).\n"]
}
[@@ocaml.doc "Metadata assigned to an Amazon RDS resource consisting of a key-value pair.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "The metadata assigned to an Amazon RDS resource consisting of a key-value pair.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon RDS Performance Insights resource that the tags are added to. This value is an \
         Amazon Resource Name (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing} \
         Constructing an RDS Amazon Resource Name (ARN)}.\n"]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics. Valid \
         value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec severity = HIGH [@ocaml.doc ""] | MEDIUM [@ocaml.doc ""] | LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sanitized_string = string [@@ocaml.doc ""]

type nonrec sanitized_string_list = sanitized_string list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec response_resource_metric = {
  unit_ : string_ option; [@ocaml.doc "The unit of the metric.\n"]
  description : description option; [@ocaml.doc "The description of the metric.\n"]
  metric : string_ option; [@ocaml.doc "The full name of the metric.\n"]
}
[@@ocaml.doc "An object that contains the full name, description, and unit of a metric. \n"]

type nonrec response_resource_metric_list = response_resource_metric list [@@ocaml.doc ""]

type nonrec request_string = string [@@ocaml.doc ""]

type nonrec dimension_map = (request_string * request_string) list [@@ocaml.doc ""]

type nonrec response_resource_metric_key = {
  dimensions : dimension_map option; [@ocaml.doc "The valid dimensions for the metric.\n"]
  metric : string_;
      [@ocaml.doc
        "The name of a Performance Insights metric to be measured.\n\n\
        \ Valid values for [Metric] are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db.load.avg] - A scaled representation of the number of active sessions for \
         the database engine.\n\
        \            \n\
        \             }\n\
        \        {-   [db.sampledload.avg] - The raw number of active sessions for the database \
         engine.\n\
        \            \n\
        \             }\n\
        \        {-  The counter metrics listed in \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance \
         Insights operating system counters} in the {i Amazon Aurora User Guide}.\n\
        \            \n\
        \             }\n\
        \        {-  The counter metrics listed in \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance \
         Insights operating system counters} in the {i Amazon RDS User Guide}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If the number of active sessions is less than an internal Performance Insights \
         threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of \
         active sessions is greater than the internal threshold, Performance Insights samples the \
         active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] \
         showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use \
         cases, you can query [db.load.avg] only. \n\
        \   "]
}
[@@ocaml.doc
  "An object describing a Performance Insights metric and one or more dimensions for that metric.\n"]

type nonrec response_partition_key = {
  dimensions : dimension_map;
      [@ocaml.doc "A dimension map that contains the dimensions for this partition.\n"]
}
[@@ocaml.doc
  "If [PartitionBy] was specified in a [DescribeDimensionKeys] request, the dimensions are \
   returned in an array. Each element in the array specifies one dimension. \n"]

type nonrec response_partition_key_list = response_partition_key list [@@ocaml.doc ""]

type nonrec requested_dimension_list = sanitized_string list [@@ocaml.doc ""]

type nonrec markdown_string = string [@@ocaml.doc ""]

type nonrec recommendation = {
  recommendation_description : markdown_string option;
      [@ocaml.doc
        "The recommendation details to help resolve the performance issue. For example, \
         [Investigate the following SQLs that contributed to 100% of the total DBLoad during that \
         time period: sql-id] \n"]
  recommendation_id : string_ option; [@ocaml.doc "The unique identifier for the recommendation.\n"]
}
[@@ocaml.doc "The list of recommendations for the insight.\n"]

type nonrec recommendation_list = recommendation list [@@ocaml.doc ""]

type nonrec period_alignment = START_TIME [@ocaml.doc ""] | END_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "The metadata assigned to an Amazon RDS resource consisting of a key-value pair.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Lists all the tags for the Amazon RDS Performance Insights resource. This value is an \
         Amazon Resource Name (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing} \
         Constructing an RDS Amazon Resource Name (ARN)}.\n"]
  service_type : service_type;
      [@ocaml.doc
        "List the tags for the Amazon Web Services service for which Performance Insights returns \
         metrics. Valid value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec iso_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec analysis_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec analysis_report_summary = {
  tags : tag_list option; [@ocaml.doc "List of all the tags added to the analysis report.\n"]
  status : analysis_status option; [@ocaml.doc "The status of the analysis report.\n"]
  end_time : iso_timestamp option; [@ocaml.doc "The end time of the analysis in the report.\n"]
  start_time : iso_timestamp option; [@ocaml.doc "The start time of the analysis in the report.\n"]
  create_time : iso_timestamp option; [@ocaml.doc "The time you created the analysis report.\n"]
  analysis_report_id : string_ option; [@ocaml.doc "The name of the analysis report.\n"]
}
[@@ocaml.doc "Retrieves the details of the performance analysis report.\n"]

type nonrec analysis_report_summary_list = analysis_report_summary list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_performance_analysis_reports_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxResults].\n"]
  analysis_reports : analysis_report_summary_list option;
      [@ocaml.doc
        "List of reports including the report identifier, start and end time, creation time, and \
         status.\n"]
}
[@@ocaml.doc ""]

type nonrec identifier_string = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec list_performance_analysis_reports_request = {
  list_tags : boolean_ option;
      [@ocaml.doc "Specifies whether or not to include the list of tags in the response.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more items exist than the \
         specified [MaxResults] value, a pagination token is included in the response so that the \
         remaining results can be retrieved. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxResults].\n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. In the console, the \
         identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the \
         identifier is returned as [DbiResourceId].\n\n\
        \ To use a DB instance as a data source, specify its [DbiResourceId] value. For example, \
         specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].\n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics. Valid \
         value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec list_available_resource_metrics_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token that indicates the response didn\226\128\153t return all available \
         records because [MaxRecords] was specified in the previous request. To get the remaining \
         records, specify [NextToken] in a separate request with this value. \n"]
  metrics : response_resource_metric_list option;
      [@ocaml.doc
        "An array of metrics available to query. Each array element contains the full name, \
         description, and unit of the metric. \n"]
}
[@@ocaml.doc ""]

type nonrec metric_type_list = sanitized_string list [@@ocaml.doc ""]

type nonrec list_available_resource_metrics_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return. If the [MaxRecords] value is less than the number \
         of existing items, the response includes a pagination token. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords]. \n"]
  metric_types : metric_type_list;
      [@ocaml.doc
        "The types of metrics to return in the response. Valid values in the array include the \
         following:\n\n\
        \ {ul\n\
        \       {-   [os] (OS counter metrics) - All engines\n\
        \           \n\
        \            }\n\
        \       {-   [db] (DB load metrics) - All engines except for Amazon DocumentDB\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql.stats] (per-SQL metrics) - All engines except for Amazon DocumentDB\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql_tokenized.stats] (per-SQL digest metrics) - All engines except for \
         Amazon DocumentDB\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique within an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. To use an Amazon RDS \
         DB instance as a data source, specify its [DbiResourceId] value. For example, specify \
         [db-ABCDEFGHIJKLMNOPQRSTU1VWZ]. \n"]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec dimension_detail = {
  identifier : string_ option; [@ocaml.doc "The identifier of a dimension.\n"]
}
[@@ocaml.doc "The information about a dimension.\n"]

type nonrec dimension_detail_list = dimension_detail list [@@ocaml.doc ""]

type nonrec dimension_group_detail = {
  dimensions : dimension_detail_list option;
      [@ocaml.doc "The dimensions within a dimension group.\n"]
  group : string_ option; [@ocaml.doc "The name of the dimension group.\n"]
}
[@@ocaml.doc "Information about dimensions within a dimension group.\n"]

type nonrec dimension_group_detail_list = dimension_group_detail list [@@ocaml.doc ""]

type nonrec metric_dimension_groups = {
  groups : dimension_group_detail_list option;
      [@ocaml.doc "The available dimension groups for a metric type.\n"]
  metric : string_ option;
      [@ocaml.doc "The metric type to which the dimension information belongs.\n"]
}
[@@ocaml.doc "The available dimension information for a metric type.\n"]

type nonrec metric_dimensions_list = metric_dimension_groups list [@@ocaml.doc ""]

type nonrec list_available_resource_dimensions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords].\n"]
  metric_dimensions : metric_dimensions_list option;
      [@ocaml.doc "The dimension information returned for requested metric types.\n"]
}
[@@ocaml.doc ""]

type nonrec dimensions_metric_list = sanitized_string list [@@ocaml.doc ""]

type nonrec fine_grained_action =
  | GET_RESOURCE_METRICS [@ocaml.doc ""]
  | GET_DIMENSION_KEY_DETAILS [@ocaml.doc ""]
  | DESCRIBE_DIMENSION_KEYS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authorized_actions_list = fine_grained_action list [@@ocaml.doc ""]

type nonrec list_available_resource_dimensions_request = {
  authorized_actions : authorized_actions_list option;
      [@ocaml.doc
        "The actions to discover the dimensions you are authorized to access. If you specify \
         multiple actions, then the response will contain the dimensions common for all the \
         actions.\n\n\
        \ When you don't specify this request parameter or provide an empty list, the response \
         contains all the available dimensions for the target database engine whether or not you \
         are authorized to access them.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords]. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more items exist than the \
         specified [MaxRecords] value, a pagination token is included in the response so that the \
         remaining results can be retrieved.\n"]
  metrics : dimensions_metric_list;
      [@ocaml.doc
        "The types of metrics for which to retrieve dimensions. Valid values include [db.load].\n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique within an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. To use an Amazon RDS \
         DB instance as a data source, specify its [DbiResourceId] value. For example, specify \
         [db-ABCDEFGHIJKLMNOPQRSTU1VWZ]. \n"]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec data_point = {
  value : double; [@ocaml.doc "The actual value associated with a particular [Timestamp].\n"]
  timestamp : iso_timestamp;
      [@ocaml.doc "The time, in epoch format, associated with a particular [Value].\n"]
}
[@@ocaml.doc
  "A timestamp, and a single numerical value, which together represent a measurement at a \
   particular point in time.\n"]

type nonrec data_points_list = data_point list [@@ocaml.doc ""]

type nonrec metric_key_data_points = {
  data_points : data_points_list option;
      [@ocaml.doc
        "An array of timestamp-value pairs, representing measurements over a period of time.\n"]
  key : response_resource_metric_key option;
      [@ocaml.doc "The dimensions to which the data points apply.\n"]
}
[@@ocaml.doc
  "A time-ordered series of data points, corresponding to a dimension of a Performance Insights \
   metric.\n"]

type nonrec metric_key_data_points_list = metric_key_data_points list [@@ocaml.doc ""]

type nonrec get_resource_metrics_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords]. \n"]
  metric_list : metric_key_data_points_list option;
      [@ocaml.doc
        "An array of metric results, where each array element contains all of the data points for \
         a particular dimension.\n"]
  identifier : string_ option;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. In the console, the \
         identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the \
         identifier is returned as [DbiResourceId].\n"]
  aligned_end_time : iso_timestamp option;
      [@ocaml.doc
        "The end time for the returned metrics, after alignment to a granular boundary (as \
         specified by [PeriodInSeconds]). [AlignedEndTime] will be greater than or equal to the \
         value of the user-specified [Endtime].\n"]
  aligned_start_time : iso_timestamp option;
      [@ocaml.doc
        "The start time for the returned metrics, after alignment to a granular boundary (as \
         specified by [PeriodInSeconds]). [AlignedStartTime] will be less than or equal to the \
         value of the user-specified [StartTime].\n"]
}
[@@ocaml.doc ""]

type nonrec limit = int [@@ocaml.doc ""]

type nonrec dimension_group = {
  limit : limit option;
      [@ocaml.doc "The maximum number of items to fetch for this dimension group.\n"]
  dimensions : sanitized_string_list option;
      [@ocaml.doc
        "A list of specific dimensions from a dimension group. If this parameter is not present, \
         then it signifies that all of the dimensions in the group were requested, or are present \
         in the response.\n\n\
        \ Valid values for elements in the [Dimensions] array are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db.application.name] - The name of the application that is connected to the \
         database. Valid values are as follows: \n\
        \            \n\
        \             {ul\n\
        \                   {-  Aurora PostgreSQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon RDS PostgreSQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon DocumentDB\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [db.blocking_sql.id] - The ID for each of the SQL queries blocking the most \
         DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.blocking_sql.sql] - The SQL text for each of the SQL queries blocking \
         the most DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.blocking_session.id] - The ID for each of the sessions blocking the most \
         DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.blocking_object.id] - The ID for each of the object resources acquired \
         by other sessions that are blocking the most DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.blocking_object.type] - The object type for each of the object resources \
         acquired by other sessions that are blocking the most DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.blocking_object.value] - The value for each of the object resources \
         acquired by other sessions that are blocking the most DB load.\n\
        \            \n\
        \             }\n\
        \        {-   [db.host.id] - The host ID of the connected client (all engines).\n\
        \            \n\
        \             }\n\
        \        {-   [db.host.name] - The host name of the connected client (all engines).\n\
        \            \n\
        \             }\n\
        \        {-   [db.name] - The name of the database to which the client is connected. Valid \
         values are as follows:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Aurora PostgreSQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon RDS PostgreSQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Aurora MySQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon RDS MySQL\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon RDS MariaDB\n\
        \                       \n\
        \                        }\n\
        \                   {-  Amazon DocumentDB\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [db.query.id] - The query ID generated by Performance Insights (only Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.query.db_id] - The query ID generated by the database (only Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.query.statement] - The text of the query that is being run (only Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.query.tokenized_id] \n\
        \            \n\
        \             }\n\
        \        {-   [db.query.tokenized.id] - The query digest ID generated by Performance \
         Insights (only Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.query.tokenized.db_id] - The query digest ID generated by Performance \
         Insights (only Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.query.tokenized.statement] - The text of the query digest (only Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.session_type.name] - The type of the current session (only Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql.id] - The hash of the full, non-tokenized SQL statement generated by \
         Performance Insights (all engines except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql.db_id] - Either the SQL ID generated by the database engine, or a \
         value generated by Performance Insights that begins with [pi-] (all engines except Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql.statement] - The full text of the SQL statement that is running, as \
         in [SELECT * FROM employees] (all engines except Amazon DocumentDB)\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql.tokenized_id] - The hash of the SQL digest generated by Performance \
         Insights (all engines except Amazon DocumentDB). The [db.sql.tokenized_id] dimension \
         fetches the value of the [db.sql_tokenized.id] dimension. Amazon RDS returns \
         [db.sql.tokenized_id] from the [db.sql] dimension group. \n\
        \            \n\
        \             }\n\
        \        {-   [db.sql_tokenized.id] - The hash of the SQL digest generated by Performance \
         Insights (all engines except Amazon DocumentDB). In the console, [db.sql_tokenized.id] is \
         called the Support ID because Amazon Web Services Support can look at this data to help \
         you troubleshoot database issues.\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql_tokenized.db_id] - Either the native database ID used to refer to \
         the SQL statement, or a synthetic ID such as [pi-2372568224] that Performance Insights \
         generates if the native database ID isn't available (all engines except Amazon \
         DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.sql_tokenized.statement] - The text of the SQL digest, as in [SELECT * \
         FROM employees WHERE employee_id =\n\
        \                        ?] (all engines except Amazon DocumentDB)\n\
        \            \n\
        \             }\n\
        \        {-   [db.user.id] - The ID of the user logged in to the database (all engines \
         except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.user.name] - The name of the user logged in to the database (all engines \
         except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.wait_event.name] - The event for which the backend is waiting (all \
         engines except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.wait_event.type] - The type of event for which the backend is waiting \
         (all engines except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.wait_event_type.name] - The name of the event type for which the backend \
         is waiting (all engines except Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        {-   [db.wait_state.name] - The event for which the backend is waiting (only \
         Amazon DocumentDB).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  group : sanitized_string;
      [@ocaml.doc
        "The name of the dimension group. Valid values are as follows:\n\n\
        \ {ul\n\
        \       {-   [db] - The name of the database to which the client is connected. The \
         following values are permitted:\n\
        \           \n\
        \            {ul\n\
        \                  {-  Aurora PostgreSQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon RDS PostgreSQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Aurora MySQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon RDS MySQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon RDS MariaDB\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon DocumentDB\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [db.application] - The name of the application that is connected to the \
         database. The following values are permitted:\n\
        \           \n\
        \            {ul\n\
        \                  {-  Aurora PostgreSQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon RDS PostgreSQL\n\
        \                      \n\
        \                       }\n\
        \                  {-  Amazon DocumentDB\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [db.blocking_sql] - The SQL queries blocking the most DB load.\n\
        \           \n\
        \            }\n\
        \       {-   [db.blocking_session] - The sessions blocking the most DB load.\n\
        \           \n\
        \            }\n\
        \       {-   [db.blocking_object] - The object resources acquired by other sessions that \
         are blocking the most DB load.\n\
        \           \n\
        \            }\n\
        \       {-   [db.host] - The host name of the connected client (all engines).\n\
        \           \n\
        \            }\n\
        \       {-   [db.plans] - The execution plans for the query (only Aurora PostgreSQL).\n\
        \           \n\
        \            }\n\
        \       {-   [db.query] - The query that is currently running (only Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.query_tokenized] - The digest query (only Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.session_type] - The type of the current session (only Aurora PostgreSQL \
         and RDS PostgreSQL).\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql] - The text of the SQL statement that is currently running (all \
         engines except Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql_tokenized] - The SQL digest (all engines except Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.user] - The user logged in to the database (all engines except Amazon \
         DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.wait_event] - The event for which the database backend is waiting (all \
         engines except Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.wait_event_type] - The type of event for which the database backend is \
         waiting (all engines except Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       {-   [db.wait_state] - The event for which the database backend is waiting (only \
         Amazon DocumentDB).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A logical grouping of Performance Insights metrics for a related subject area. For example, the \
   [db.sql] dimension group consists of the following dimensions:\n\n\
  \ {ul\n\
  \       {-   [db.sql.id] - The hash of a running SQL statement, generated by Performance Insights.\n\
  \           \n\
  \            }\n\
  \       {-   [db.sql.db_id] - Either the SQL ID generated by the database engine, or a value \
   generated by Performance Insights that begins with [pi-].\n\
  \           \n\
  \            }\n\
  \       {-   [db.sql.statement] - The full text of the SQL statement that is running, for \
   example, [SELECT * FROM\n\
  \                        employees].\n\
  \           \n\
  \            }\n\
  \       {-   [db.sql_tokenized.id] - The hash of the SQL digest generated by Performance Insights.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Each response element returns a maximum of 500 bytes. For larger elements, such as SQL \
   statements, only the first 500 bytes are returned.\n\
  \    \n\
  \     "]

type nonrec metric_query_filter_map = (sanitized_string * request_string) list [@@ocaml.doc ""]

type nonrec metric_query = {
  filter : metric_query_filter_map option;
      [@ocaml.doc
        "One or more filters to apply in the request. Restrictions:\n\n\
        \ {ul\n\
        \       {-  Any number of filters by the same dimension, as specified in the [GroupBy] \
         parameter.\n\
        \           \n\
        \            }\n\
        \       {-  A single filter for any other dimension in this dimension group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [db.sql.db_id] filter isn't available for RDS for SQL Server DB instances.\n\
        \    \n\
        \     "]
  group_by : dimension_group option;
      [@ocaml.doc
        "A specification for how to aggregate the data points from a query result. You must \
         specify a valid dimension group. Performance Insights will return all of the dimensions \
         within that group, unless you provide the names of specific dimensions within that group. \
         You can also request that Performance Insights return a limited number of values for a \
         dimension.\n"]
  metric : sanitized_string;
      [@ocaml.doc
        "The name of a Performance Insights metric to be measured.\n\n\
        \ Valid values for [Metric] are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db.load.avg] - A scaled representation of the number of active sessions for \
         the database engine.\n\
        \            \n\
        \             }\n\
        \        {-   [db.sampledload.avg] - The raw number of active sessions for the database \
         engine.\n\
        \            \n\
        \             }\n\
        \        {-  The counter metrics listed in \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance \
         Insights operating system counters} in the {i Amazon Aurora User Guide}.\n\
        \            \n\
        \             }\n\
        \        {-  The counter metrics listed in \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance \
         Insights operating system counters} in the {i Amazon RDS User Guide}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If the number of active sessions is less than an internal Performance Insights \
         threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of \
         active sessions is greater than the internal threshold, Performance Insights samples the \
         active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] \
         showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use \
         cases, you can query [db.load.avg] only.\n\
        \   "]
}
[@@ocaml.doc
  "A single query to be processed. You must provide the metric to query and append an aggregate \
   function to the metric. For example, to find the average for the metric [db.load] you must use \
   [db.load.avg]. Valid values for aggregate functions include [.avg], [.min], [.max], and [.sum]. \
   If no other parameters are specified, Performance Insights returns all data points for the \
   specified metric. Optionally, you can request that the data points be aggregated by dimension \
   group ([GroupBy]), and return only those data points that match your criteria ([Filter]).\n"]

type nonrec metric_query_list = metric_query list [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec get_resource_metrics_request = {
  period_alignment : period_alignment option;
      [@ocaml.doc
        "The returned timestamp which is the start or end time of the time periods. The default \
         value is [END_TIME].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords].\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return in the response.\n"]
  period_in_seconds : integer option;
      [@ocaml.doc
        "The granularity, in seconds, of the data points returned from Performance Insights. A \
         period can be as short as one second, or as long as one day (86400 seconds). Valid values \
         are:\n\n\
        \ {ul\n\
        \       {-   [1] (one second)\n\
        \           \n\
        \            }\n\
        \       {-   [60] (one minute)\n\
        \           \n\
        \            }\n\
        \       {-   [300] (five minutes)\n\
        \           \n\
        \            }\n\
        \       {-   [3600] (one hour)\n\
        \           \n\
        \            }\n\
        \       {-   [86400] (twenty-four hours)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't specify [PeriodInSeconds], then Performance Insights will choose a value \
         for you, with a goal of returning roughly 100-200 data points in the response.\n\
        \   "]
  end_time : iso_timestamp;
      [@ocaml.doc
        "The date and time specifying the end of the requested time series query range. The value \
         specified is {i exclusive}. Thus, the command returns data points less than (but not \
         equal to) [EndTime].\n\n\
        \ The value for [EndTime] must be later than the value for [StartTime].\n\
        \ "]
  start_time : iso_timestamp;
      [@ocaml.doc
        "The date and time specifying the beginning of the requested time series query range. You \
         can't specify a [StartTime] that is earlier than 7 days ago. By default, Performance \
         Insights has 7 days of retention, but you can extend this range up to 2 years. The value \
         specified is {i inclusive}. Thus, the command returns data points equal to or greater \
         than [StartTime].\n\n\
        \ The value for [StartTime] must be earlier than the value for [EndTime].\n\
        \ "]
  metric_queries : metric_query_list;
      [@ocaml.doc
        "An array of one or more queries to perform. Each query must specify a Performance \
         Insights metric and specify an aggregate function, and you can provide filtering \
         criteria. You must append the aggregate function to the metric. For example, to find the \
         average for the metric [db.load] you must use [db.load.avg]. Valid values for aggregate \
         functions include [.avg], [.min], [.max], and [.sum].\n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. In the console, the \
         identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the \
         identifier is returned as [DbiResourceId].\n\n\
        \ To use a DB instance as a data source, specify its [DbiResourceId] value. For example, \
         specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].\n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics. Valid \
         values are as follows:\n\n\
        \ {ul\n\
        \       {-   [RDS] \n\
        \           \n\
        \            }\n\
        \       {-   [DOCDB] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec feature_status =
  | UNKNOWN [@ocaml.doc ""]
  | DISABLED_PENDING_REBOOT [@ocaml.doc ""]
  | ENABLED_PENDING_REBOOT [@ocaml.doc ""]
  | UNSUPPORTED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec feature_metadata = {
  status : feature_status option;
      [@ocaml.doc
        "The status of the feature on the DB instance. Possible values include the following:\n\n\
        \ {ul\n\
        \       {-   [ENABLED] - The feature is enabled on the instance.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - The feature is disabled on the instance.\n\
        \           \n\
        \            }\n\
        \       {-   [UNSUPPORTED] - The feature isn't supported on the instance.\n\
        \           \n\
        \            }\n\
        \       {-   [ENABLED_PENDING_REBOOT] - The feature is enabled on the instance but \
         requires a reboot to take effect.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED_PENDING_REBOOT] - The feature is disabled on the instance but \
         requires a reboot to take effect.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN] - The feature status couldn't be determined.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The metadata for a feature. For example, the metadata might indicate that a feature is turned \
   on or off on a specific DB instance.\n"]

type nonrec feature_metadata_map = (string_ * feature_metadata) list [@@ocaml.doc ""]

type nonrec get_resource_metadata_response = {
  features : feature_metadata_map option;
      [@ocaml.doc
        "The metadata for different features. For example, the metadata might indicate that a \
         feature is turned on or off on a specific DB instance.\n"]
  identifier : string_ option;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. To use a DB instance \
         as a data source, specify its [DbiResourceId] value. For example, specify \
         [db-ABCDEFGHIJKLMNOPQRSTU1VW2X]. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_metadata_request = {
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. To use a DB instance \
         as a data source, specify its [DbiResourceId] value. For example, specify \
         [db-ABCDEFGHIJKLMNOPQRSTU1VW2X]. \n"]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec analysis_report_id = string [@@ocaml.doc ""]

type nonrec context_type = CONTEXTUAL [@ocaml.doc ""] | CAUSAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec descriptive_string = string [@@ocaml.doc ""]

type nonrec descriptive_map = (descriptive_string * descriptive_string) list [@@ocaml.doc ""]

type nonrec performance_insights_metric = {
  value : double option;
      [@ocaml.doc "The value of the metric. For example, [9] for [db.load.avg].\n"]
  filter : descriptive_map option; [@ocaml.doc "The filter for the Performance Insights metric.\n"]
  dimensions : descriptive_map option;
      [@ocaml.doc "A dimension map that contains the dimensions for this partition.\n"]
  display_name : descriptive_string option; [@ocaml.doc "The Performance Insights metric name.\n"]
  metric : descriptive_string option; [@ocaml.doc "The Performance Insights metric.\n"]
}
[@@ocaml.doc
  "This data type helps to determine Performance Insights metric to render for the insight.\n"]

type nonrec data = {
  performance_insights_metric : performance_insights_metric option;
      [@ocaml.doc
        "This field determines the Performance Insights metric to render for the insight. The \
         [name] field refers to a Performance Insights metric. \n"]
}
[@@ocaml.doc
  "List of data objects which provide details about source metrics. This field can be used to \
   determine the PI metric to render for the insight. This data type also includes static values \
   for the metrics for the Insight that were calculated and included in text and annotations on \
   the DB load chart.\n"]

type nonrec data_list = data list [@@ocaml.doc ""]

type insight = {
  baseline_data : data_list option;
      [@ocaml.doc
        " Metric names and values from the timeframe used as baseline to generate the insight.\n"]
  insight_data : data_list option;
      [@ocaml.doc
        "List of data objects containing metrics and references from the time range while \
         generating the insight.\n"]
  recommendations : recommendation_list option;
      [@ocaml.doc
        "List of recommendations for the insight. For example, [Investigate the following SQLs \
         that contributed \n\
        \                to 100% of the total DBLoad during that time period: sql-id].\n"]
  description : markdown_string option;
      [@ocaml.doc
        "Description of the insight. For example: [A high severity Insight found between 02:00 to \
         02:30,\n\
        \                where there was an unusually high DB load 600x above baseline. \n\
        \                Likely performance impact].\n"]
  supporting_insights : insight_list option;
      [@ocaml.doc "List of supporting insights that provide additional factors for the insight.\n"]
  severity : severity option;
      [@ocaml.doc "The severity of the insight. The values are: [Low], [Medium], or [High].\n"]
  end_time : iso_timestamp option;
      [@ocaml.doc "The end time of the insight. For example, [2018-10-30T00:00:00Z].\n"]
  start_time : iso_timestamp option;
      [@ocaml.doc "The start time of the insight. For example, [2018-10-30T00:00:00Z].\n"]
  context : context_type option;
      [@ocaml.doc "Indicates if the insight is causal or correlated insight.\n"]
  insight_type : string_ option;
      [@ocaml.doc
        "The type of insight. For example, [HighDBLoad], [HighCPU], or [DominatingSQLs].\n"]
  insight_id : string_;
      [@ocaml.doc
        "The unique identifier for the insight. For example, [insight-12345678901234567].\n"]
}
[@@ocaml.doc "Retrieves the list of performance issues which are identified.\n"]

and insight_list = insight list [@@ocaml.doc ""]

type nonrec analysis_report = {
  insights : insight_list option;
      [@ocaml.doc "The list of identified insights in the analysis report.\n"]
  status : analysis_status option; [@ocaml.doc "The status of the created analysis report.\n"]
  end_time : iso_timestamp option; [@ocaml.doc "The analysis end time in the report.\n"]
  start_time : iso_timestamp option; [@ocaml.doc "The analysis start time in the report.\n"]
  create_time : iso_timestamp option; [@ocaml.doc "The time you created the analysis report.\n"]
  service_type : service_type option;
      [@ocaml.doc
        "List the tags for the Amazon Web Services service for which Performance Insights returns \
         metrics. Valid values are as follows:\n\n\
        \ {ul\n\
        \       {-   [RDS] \n\
        \           \n\
        \            }\n\
        \       {-   [DOCDB] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  identifier : identifier_string option;
      [@ocaml.doc "The unique identifier of the analysis report.\n"]
  analysis_report_id : analysis_report_id; [@ocaml.doc "The name of the analysis report.\n"]
}
[@@ocaml.doc
  "Retrieves the summary of the performance analysis report created for a time period.\n"]

type nonrec get_performance_analysis_report_response = {
  analysis_report : analysis_report option;
      [@ocaml.doc "The summary of the performance analysis report created for a time period.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_language = EN_US [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec get_performance_analysis_report_request = {
  accept_language : accept_language option;
      [@ocaml.doc "The text language in the report. The default language is [EN_US] (English). \n"]
  text_format : text_format option;
      [@ocaml.doc
        "Indicates the text format in the report. The options are [PLAIN_TEXT] or [MARKDOWN]. The \
         default value is [plain text].\n"]
  analysis_report_id : analysis_report_id;
      [@ocaml.doc
        "A unique identifier of the created analysis report. For example, \
         [report-12345678901234567] \n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. In the console, the \
         identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the \
         identifier is returned as [DbiResourceId].\n\n\
        \ To use a DB instance as a data source, specify its [DbiResourceId] value. For example, \
         specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].\n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights will return metrics. Valid \
         value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec detail_status =
  | UNAVAILABLE [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dimension_key_detail = {
  status : detail_status option;
      [@ocaml.doc
        "The status of the dimension detail data. Possible values include the following:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The dimension detail data is ready to be retrieved.\n\
        \           \n\
        \            }\n\
        \       {-   [PROCESSING] - The dimension detail data isn't ready to be retrieved because \
         more processing time is required. If the requested detail data has the status \
         [PROCESSING], Performance Insights returns the truncated query.\n\
        \           \n\
        \            }\n\
        \       {-   [UNAVAILABLE] - The dimension detail data could not be collected successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dimension : string_ option;
      [@ocaml.doc
        "The full name of the dimension. The full name includes the group name and key name. The \
         following values are valid:\n\n\
        \ {ul\n\
        \       {-   [db.query.statement] (Amazon DocumentDB)\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql.statement] (Amazon RDS and Aurora)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  value : string_ option;
      [@ocaml.doc
        "The value of the dimension detail data. Depending on the return status, this value is \
         either the full or truncated SQL query for the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [db.query.statement] (Amazon DocumentDB)\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql.statement] (Amazon RDS and Aurora)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "An object that describes the details for a specified dimension.\n"]

type nonrec dimension_key_detail_list = dimension_key_detail list [@@ocaml.doc ""]

type nonrec get_dimension_key_details_response = {
  dimensions : dimension_key_detail_list option;
      [@ocaml.doc "The details for the requested dimensions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dimension_key_details_request = {
  requested_dimensions : requested_dimension_list option;
      [@ocaml.doc
        "A list of dimensions to retrieve the detail data for within the given dimension group. If \
         you don't specify this parameter, Performance Insights returns all dimension data within \
         the specified dimension group. Specify dimension names for the following dimension \
         groups:\n\n\
        \ {ul\n\
        \       {-   [db.execution_plan] - Specify the dimension name [db.execution_plan.raw_plan] \
         or the short dimension name [raw_plan] (Amazon RDS and Aurora only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.lock_snapshot] - Specify the dimension name [db.lock_snapshot.lock_trees] \
         or the short dimension name [lock_trees]. (Aurora only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql] - Specify either the full dimension name [db.sql.statement] or the \
         short dimension name [statement] (Aurora and RDS only).\n\
        \           \n\
        \            }\n\
        \       {-   [db.query] - Specify either the full dimension name [db.query.statement] or \
         the short dimension name [statement] (DocumentDB only).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  group_identifier : request_string;
      [@ocaml.doc
        "The ID of the dimension group from which to retrieve dimension details. For dimension \
         group [db.sql], the group ID is [db.sql.id]. The following group ID values are valid:\n\n\
        \ {ul\n\
        \       {-   [db.execution_plan.id] for dimension group [db.execution_plan] (Aurora and \
         RDS only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql.id] for dimension group [db.sql] (Aurora and RDS only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.query.id] for dimension group [db.query] (DocumentDB only)\n\
        \           \n\
        \            }\n\
        \       {-  For the dimension group [db.lock_snapshot], the [GroupIdentifier] is the epoch \
         timestamp when Performance Insights captured the snapshot, in seconds. You can retrieve \
         this value with the [GetResourceMetrics] operation for a 1 second period.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  group : request_string;
      [@ocaml.doc
        "The name of the dimension group. Performance Insights searches the specified group for \
         the dimension group ID. The following group name values are valid:\n\n\
        \ {ul\n\
        \       {-   [db.execution_plan] (Amazon RDS and Aurora only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.lock_snapshot] (Aurora only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.query] (Amazon DocumentDB only)\n\
        \           \n\
        \            }\n\
        \       {-   [db.sql] (Amazon RDS and Aurora only)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  identifier : identifier_string;
      [@ocaml.doc
        "The ID for a data source from which to gather dimension data. This ID must be immutable \
         and unique within an Amazon Web Services Region. When a DB instance is the data source, \
         specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X]. \n"]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights returns data. The only \
         valid value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec additional_metrics_map = (request_string * double) list [@@ocaml.doc ""]

type nonrec metric_values_list = double list [@@ocaml.doc ""]

type nonrec dimension_key_description = {
  partitions : metric_values_list option;
      [@ocaml.doc
        "If [PartitionBy] was specified, [PartitionKeys] contains the dimensions that were.\n"]
  additional_metrics : additional_metrics_map option;
      [@ocaml.doc "A map that contains the value for each additional metric.\n"]
  total : double option;
      [@ocaml.doc
        "The aggregated metric value for the dimensions, over the requested time range.\n"]
  dimensions : dimension_map option;
      [@ocaml.doc "A map of name-value pairs for the dimensions in the group.\n"]
}
[@@ocaml.doc
  "An object that includes the requested dimension key values and aggregated metric values within \
   a dimension group.\n"]

type nonrec dimension_key_description_list = dimension_key_description list [@@ocaml.doc ""]

type nonrec describe_dimension_keys_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token that indicates the response didn\226\128\153t return all available \
         records because [MaxRecords] was specified in the previous request. To get the remaining \
         records, specify [NextToken] in a separate request with this value. \n"]
  keys : dimension_key_description_list option;
      [@ocaml.doc "The dimension keys that were requested.\n"]
  partition_keys : response_partition_key_list option;
      [@ocaml.doc
        "If [PartitionBy] was present in the request, [PartitionKeys] contains the breakdown of \
         dimension keys by the specified partitions. \n"]
  aligned_end_time : iso_timestamp option;
      [@ocaml.doc
        "The end time for the returned dimension keys, after alignment to a granular boundary (as \
         specified by [PeriodInSeconds]). [AlignedEndTime] will be greater than or equal to the \
         value of the user-specified [Endtime]. \n"]
  aligned_start_time : iso_timestamp option;
      [@ocaml.doc
        "The start time for the returned dimension keys, after alignment to a granular boundary \
         (as specified by [PeriodInSeconds]). [AlignedStartTime] will be less than or equal to the \
         value of the user-specified [StartTime]. \n"]
}
[@@ocaml.doc ""]

type nonrec additional_metrics_list = sanitized_string list [@@ocaml.doc ""]

type nonrec describe_dimension_keys_request = {
  next_token : next_token option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the token, up to the value specified \
         by [MaxRecords].\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more items exist than the \
         specified [MaxRecords] value, a pagination token is included in the response so that the \
         remaining results can be retrieved. \n"]
  filter : metric_query_filter_map option;
      [@ocaml.doc
        "One or more filters to apply in the request. Restrictions:\n\n\
        \ {ul\n\
        \       {-  Any number of filters by the same dimension, as specified in the [GroupBy] or \
         [Partition] parameters.\n\
        \           \n\
        \            }\n\
        \       {-  A single filter for any other dimension in this dimension group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [db.sql.db_id] filter isn't available for RDS for SQL Server DB instances.\n\
        \    \n\
        \     "]
  partition_by : dimension_group option;
      [@ocaml.doc
        "For each dimension specified in [GroupBy], specify a secondary dimension to further \
         subdivide the partition keys in the response. \n"]
  additional_metrics : additional_metrics_list option;
      [@ocaml.doc
        "Additional metrics for the top [N] dimension keys. If the specified dimension group in \
         the [GroupBy] parameter is [db.sql_tokenized], you can specify per-SQL metrics to get the \
         values for the top [N] SQL digests. The response syntax is as follows: \n\
         {[\n\
         \"AdditionalMetrics\" : \\{ \"{i string}\" : \"{i string}\" \\}\n\
         ]}\n\
         .\n\n\
        \ The only supported statistic function is [.avg].\n\
        \ "]
  group_by : dimension_group;
      [@ocaml.doc
        "A specification for how to aggregate the data points from a query result. You must \
         specify a valid dimension group. Performance Insights returns all dimensions within this \
         group, unless you provide the names of specific dimensions within this group. You can \
         also request that Performance Insights return a limited number of values for a dimension. \n"]
  period_in_seconds : integer option;
      [@ocaml.doc
        "The granularity, in seconds, of the data points returned from Performance Insights. A \
         period can be as short as one second, or as long as one day (86400 seconds). Valid values \
         are: \n\n\
        \ {ul\n\
        \       {-   [1] (one second)\n\
        \           \n\
        \            }\n\
        \       {-   [60] (one minute)\n\
        \           \n\
        \            }\n\
        \       {-   [300] (five minutes)\n\
        \           \n\
        \            }\n\
        \       {-   [3600] (one hour)\n\
        \           \n\
        \            }\n\
        \       {-   [86400] (twenty-four hours)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't specify [PeriodInSeconds], then Performance Insights chooses a value for \
         you, with a goal of returning roughly 100-200 data points in the response. \n\
        \   "]
  metric : request_string;
      [@ocaml.doc
        "The name of a Performance Insights metric to be measured.\n\n\
        \ Valid values for [Metric] are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db.load.avg] - A scaled representation of the number of active sessions for \
         the database engine. \n\
        \            \n\
        \             }\n\
        \        {-   [db.sampledload.avg] - The raw number of active sessions for the database \
         engine. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If the number of active sessions is less than an internal Performance Insights \
         threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of \
         active sessions is greater than the internal threshold, Performance Insights samples the \
         active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] \
         showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use \
         cases, you can query [db.load.avg] only. \n\
        \   "]
  end_time : iso_timestamp;
      [@ocaml.doc
        "The date and time specifying the end of the requested time series data. The value \
         specified is {i exclusive}, which means that data points less than (but not equal to) \
         [EndTime] are returned.\n\n\
        \ The value for [EndTime] must be later than the value for [StartTime].\n\
        \ "]
  start_time : iso_timestamp;
      [@ocaml.doc
        "The date and time specifying the beginning of the requested time series data. You must \
         specify a [StartTime] within the past 7 days. The value specified is {i inclusive}, which \
         means that data points equal to or greater than [StartTime] are returned. \n\n\
        \ The value for [StartTime] must be earlier than the value for [EndTime]. \n\
        \ "]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable, Amazon Web Services Region-unique identifier for a data source. Performance \
         Insights gathers metrics from this data source.\n\n\
        \ To use an Amazon RDS instance as a data source, you specify its [DbiResourceId] value. \
         For example, specify [db-FAIHNTYBKTGAUSUZQYPDS2GW4A]. \n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights will return metrics. Valid \
         values are as follows:\n\n\
        \ {ul\n\
        \       {-   [RDS] \n\
        \           \n\
        \            }\n\
        \       {-   [DOCDB] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_performance_analysis_report_response = unit [@@ocaml.doc ""]

type nonrec delete_performance_analysis_report_request = {
  analysis_report_id : analysis_report_id;
      [@ocaml.doc "The unique identifier of the analysis report for deletion.\n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable identifier for a data source that is unique for an Amazon Web Services \
         Region. Performance Insights gathers metrics from this data source. In the console, the \
         identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the \
         identifier is returned as [DbiResourceId].\n\n\
        \ To use a DB instance as a data source, specify its [DbiResourceId] value. For example, \
         specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].\n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights will return metrics. Valid \
         value is [RDS].\n"]
}
[@@ocaml.doc ""]

type nonrec create_performance_analysis_report_response = {
  analysis_report_id : analysis_report_id option;
      [@ocaml.doc "A unique identifier for the created analysis report.\n"]
}
[@@ocaml.doc ""]

type nonrec create_performance_analysis_report_request = {
  tags : tag_list option;
      [@ocaml.doc "The metadata assigned to the analysis report consisting of a key-value pair.\n"]
  end_time : iso_timestamp; [@ocaml.doc "The end time defined for the analysis report.\n"]
  start_time : iso_timestamp; [@ocaml.doc "The start time defined for the analysis report.\n"]
  identifier : identifier_string;
      [@ocaml.doc
        "An immutable, Amazon Web Services Region-unique identifier for a data source. Performance \
         Insights gathers metrics from this data source.\n\n\
        \ To use an Amazon RDS instance as a data source, you specify its [DbiResourceId] value. \
         For example, specify [db-ADECBTYHKTSAUMUZQYPDS2GW4A].\n\
        \ "]
  service_type : service_type;
      [@ocaml.doc
        "The Amazon Web Services service for which Performance Insights will return metrics. Valid \
         value is [RDS].\n"]
}
[@@ocaml.doc ""]
