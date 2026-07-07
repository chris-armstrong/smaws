type nonrec with_key = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec value_key = string [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "One of the parameters for the request is not valid.\n"]

type nonrec user_identity = string [@@ocaml.doc ""]

type nonrec upper_case_string_with_keys = with_key list [@@ocaml.doc ""]

type nonrec upper_case_string = {
  with_keys : upper_case_string_with_keys;
      [@ocaml.doc "The array of containing the keys of the field to convert to uppercase.\n"]
}
[@@ocaml.doc
  "This processor converts a string field to uppercase.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString} \
   upperCaseString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec scheduled_query_name = string [@@ocaml.doc ""]

type nonrec scheduled_query_description = string [@@ocaml.doc ""]

type nonrec query_language = PPL [@ocaml.doc ""] | SQL [@ocaml.doc ""] | CWLI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_string = string [@@ocaml.doc ""]

type nonrec log_group_identifier = string [@@ocaml.doc ""]

type nonrec scheduled_query_log_group_identifiers = log_group_identifier list [@@ocaml.doc ""]

type nonrec schedule_expression = string [@@ocaml.doc ""]

type nonrec schedule_timezone = string [@@ocaml.doc ""]

type nonrec start_time_offset = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec end_time_offset = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec s3_configuration = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS encryption key. Must belong to the same Amazon \
         Web Services Region as the destination Amazon S3 bucket.\n"]
  owner_account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services accountId for the bucket owning account.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the IAM role that grants permissions to write query results to the specified \
         Amazon S3 destination.\n"]
  destination_identifier : s3_uri;
      [@ocaml.doc
        "The Amazon S3 URI where query results are delivered. Must be a valid S3 URI format.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon S3 destination where scheduled query results are delivered.\n"]

type nonrec destination_configuration = {
  s3_configuration : s3_configuration;
      [@ocaml.doc "Configuration for delivering query results to Amazon S3.\n"]
}
[@@ocaml.doc
  "Configuration for where to deliver scheduled query results. Specifies the destination type and \
   associated settings for result delivery.\n"]

type nonrec scheduled_query_state = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schedule_type = AWS_MANAGED [@ocaml.doc ""] | CUSTOMER_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec execution_status =
  | Timeout [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Complete [@ocaml.doc ""]
  | InvalidQuery [@ocaml.doc ""]
  | Running [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_scheduled_query_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was last updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was originally created.\n"]
  execution_role_arn : role_arn option;
      [@ocaml.doc "The execution role ARN of the updated scheduled query.\n"]
  schedule_end_time : timestamp option;
      [@ocaml.doc "The end time of the updated scheduled query.\n"]
  schedule_start_time : timestamp option;
      [@ocaml.doc "The start time of the updated scheduled query.\n"]
  last_execution_status : execution_status option;
      [@ocaml.doc "The status of the most recent execution of the updated scheduled query.\n"]
  last_triggered_time : timestamp option;
      [@ocaml.doc "The timestamp when the updated scheduled query was last executed.\n"]
  schedule_type : schedule_type option;
      [@ocaml.doc "The schedule type of the updated scheduled query.\n"]
  state : scheduled_query_state option; [@ocaml.doc "The state of the updated scheduled query.\n"]
  destination_configuration : destination_configuration option;
      [@ocaml.doc "The destination configuration of the updated scheduled query.\n"]
  end_time_offset : end_time_offset option;
      [@ocaml.doc "The end time offset in seconds of the updated scheduled query.\n"]
  start_time_offset : start_time_offset option;
      [@ocaml.doc "The time offset of the updated scheduled query.\n"]
  timezone : schedule_timezone option; [@ocaml.doc "The timezone of the updated scheduled query.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc "The cron expression of the updated scheduled query.\n"]
  log_group_identifiers : scheduled_query_log_group_identifiers option;
      [@ocaml.doc "The log groups queried by the updated scheduled query.\n"]
  query_string : query_string option;
      [@ocaml.doc "The query string of the updated scheduled query.\n"]
  query_language : query_language option;
      [@ocaml.doc "The query language of the updated scheduled query.\n"]
  description : scheduled_query_description option;
      [@ocaml.doc "The description of the updated scheduled query.\n"]
  name : scheduled_query_name option; [@ocaml.doc "The name of the updated scheduled query.\n"]
  scheduled_query_arn : arn option; [@ocaml.doc "The ARN of the updated scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_query_identifier = string [@@ocaml.doc ""]

type nonrec update_scheduled_query_request = {
  state : scheduled_query_state option; [@ocaml.doc "The updated state of the scheduled query.\n"]
  execution_role_arn : role_arn;
      [@ocaml.doc
        "The updated ARN of the IAM role that grants permissions to execute the query and deliver \
         results.\n"]
  schedule_end_time : timestamp option;
      [@ocaml.doc "The updated end time for the scheduled query in Unix epoch format.\n"]
  schedule_start_time : timestamp option;
      [@ocaml.doc "The updated start time for the scheduled query in Unix epoch format.\n"]
  destination_configuration : destination_configuration option;
      [@ocaml.doc "The updated configuration for where to deliver query results.\n"]
  end_time_offset : end_time_offset option;
      [@ocaml.doc
        "The updated time offset in seconds that defines the end of the lookback period for the \
         query.\n"]
  start_time_offset : start_time_offset option;
      [@ocaml.doc
        "The updated time offset in seconds that defines the lookback period for the query.\n"]
  timezone : schedule_timezone option;
      [@ocaml.doc "The updated timezone for evaluating the schedule expression.\n"]
  schedule_expression : schedule_expression;
      [@ocaml.doc "The updated cron expression that defines when the scheduled query runs.\n"]
  log_group_identifiers : scheduled_query_log_group_identifiers option;
      [@ocaml.doc "The updated array of log group names or ARNs to query.\n"]
  query_string : query_string; [@ocaml.doc "The updated query string to execute.\n"]
  query_language : query_language;
      [@ocaml.doc "The updated query language for the scheduled query.\n"]
  description : scheduled_query_description option;
      [@ocaml.doc "An updated description for the scheduled query.\n"]
  identifier : scheduled_query_identifier;
      [@ocaml.doc "The ARN or name of the scheduled query to update.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was throttled because of quota limits.\n"]

type nonrec resource_not_found_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource does not exist.\n"]

type nonrec internal_server_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal server error occurred while processing the request. This exception is returned when \
   the service encounters an unexpected condition that prevents it from fulfilling the request.\n"]

type nonrec conflict_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "This operation attempted to create a resource that already exists.\n"]

type nonrec access_denied_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient permissions to perform this action.\n"]

type nonrec update_lookup_table_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The time when the lookup table was last updated, expressed as the number of milliseconds \
         after [Jan 1, 1970 00:00:00 UTC].\n"]
  lookup_table_arn : arn option; [@ocaml.doc "The ARN of the lookup table that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec lookup_table_description = string [@@ocaml.doc ""]

type nonrec table_body = string [@@ocaml.doc ""]

type nonrec update_lookup_table_request = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ARN of the KMS key to use to encrypt the lookup table data. You can use this \
         parameter to add, update, or remove the KMS key. To remove the KMS key and use an Amazon \
         Web Services-owned key instead, specify an empty string.\n"]
  table_body : table_body;
      [@ocaml.doc
        "The new CSV content to replace the existing data. The first row must be a header row with \
         column names. The content must use UTF-8 encoding and not exceed 10 MB.\n"]
  description : lookup_table_description option;
      [@ocaml.doc "An updated description of the lookup table.\n"]
  lookup_table_arn : arn; [@ocaml.doc "The ARN of the lookup table to update.\n"]
}
[@@ocaml.doc ""]

type nonrec service_unavailable_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The service cannot complete the request.\n"]

type nonrec invalid_parameter_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "A parameter is specified incorrectly.\n"]

type nonrec anomaly_detector_arn = string [@@ocaml.doc ""]

type nonrec evaluation_frequency =
  | ONE_HOUR [@ocaml.doc ""]
  | THIRTY_MIN [@ocaml.doc ""]
  | FIFTEEN_MIN [@ocaml.doc ""]
  | TEN_MIN [@ocaml.doc ""]
  | FIVE_MIN [@ocaml.doc ""]
  | ONE_MIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_pattern = string [@@ocaml.doc ""]

type nonrec anomaly_visibility_time = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec update_log_anomaly_detector_request = {
  enabled : boolean_; [@ocaml.doc "Use this parameter to pause or restart the anomaly detector. \n"]
  anomaly_visibility_time : anomaly_visibility_time option;
      [@ocaml.doc
        "The number of days to use as the life cycle of anomalies. After this time, anomalies are \
         automatically baselined and the anomaly detector model will treat new occurrences of \
         similar event as normal. Therefore, if you do not correct the cause of an anomaly during \
         this time, it will be considered normal going forward and will not be detected.\n"]
  filter_pattern : filter_pattern option; [@ocaml.doc ""]
  evaluation_frequency : evaluation_frequency option;
      [@ocaml.doc
        "Specifies how often the anomaly detector runs and look for anomalies. Set this value \
         according to the frequency that the log group receives new logs. For example, if the log \
         group receives new log events every 10 minutes, then setting [evaluationFrequency] to \
         [FIFTEEN_MIN] might be appropriate.\n"]
  anomaly_detector_arn : anomaly_detector_arn;
      [@ocaml.doc "The ARN of the anomaly detector that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_aborted_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Multiple concurrent requests to update the same resource were in conflict.\n"]

type nonrec update_delivery_configuration_response = unit [@@ocaml.doc ""]

type nonrec delivery_id = string [@@ocaml.doc ""]

type nonrec field_header = string [@@ocaml.doc ""]

type nonrec record_fields = field_header list [@@ocaml.doc ""]

type nonrec field_delimiter = string [@@ocaml.doc ""]

type nonrec delivery_suffix_path = string [@@ocaml.doc ""]

type nonrec s3_delivery_configuration = {
  enable_hive_compatible_path : boolean_ option;
      [@ocaml.doc
        "This parameter causes the S3 objects that contain delivered logs to use a prefix \
         structure that allows for integration with Apache Hive.\n"]
  suffix_path : delivery_suffix_path option;
      [@ocaml.doc
        "This string allows re-configuring the S3 object prefix to contain either static or \
         variable sections. The valid variables to use in the suffix path will vary by each log \
         source. To find the values supported for the suffix path for each log source, use the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeConfigurationTemplates.html}DescribeConfigurationTemplates} \
         operation and check the [allowedSuffixPathFields] field in the response.\n"]
}
[@@ocaml.doc
  "This structure contains delivery configurations that apply only when the delivery destination \
   resource is an S3 bucket.\n"]

type nonrec update_delivery_configuration_request = {
  s3_delivery_configuration : s3_delivery_configuration option;
      [@ocaml.doc
        "This structure contains parameters that are valid only when the delivery's delivery \
         destination is an S3 bucket.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "The field delimiter to use between record fields when the final output format of a \
         delivery is in [Plain], [W3C], or [Raw] format.\n"]
  record_fields : record_fields option;
      [@ocaml.doc
        "The list of record fields to be delivered to the destination, in order. If the delivery's \
         log source has mandatory fields, they must be included in this list.\n"]
  id : delivery_id; [@ocaml.doc "The ID of the delivery to be updated by this request.\n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_id = string [@@ocaml.doc ""]

type nonrec pattern_id = string [@@ocaml.doc ""]

type nonrec suppression_type = INFINITE [@ocaml.doc ""] | LIMITED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec suppression_unit =
  | HOURS [@ocaml.doc ""]
  | MINUTES [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec suppression_period = {
  suppression_unit : suppression_unit option;
      [@ocaml.doc "Specifies whether the value of [value] is in seconds, minutes, or hours.\n"]
  value : integer option;
      [@ocaml.doc
        "Specifies the number of seconds, minutes or hours to suppress this anomaly. There is no \
         maximum.\n"]
}
[@@ocaml.doc
  "If you are suppressing an anomaly temporariliy, this structure defines how long the suppression \
   period is to be.\n"]

type nonrec baseline = bool [@@ocaml.doc ""]

type nonrec update_anomaly_request = {
  baseline : baseline option;
      [@ocaml.doc
        "Set this to [true] to prevent CloudWatch Logs from displaying this behavior as an anomaly \
         in the future. The behavior is then treated as baseline behavior. However, if similar but \
         more severe occurrences of this behavior occur in the future, those will still be \
         reported as anomalies. \n\n\
        \ The default is [false] \n\
        \ "]
  suppression_period : suppression_period option;
      [@ocaml.doc
        "If you are temporarily suppressing an anomaly or pattern, use this structure to specify \
         how long the suppression is to last.\n"]
  suppression_type : suppression_type option;
      [@ocaml.doc
        "Use this to specify whether the suppression to be temporary or infinite. If you specify \
         [LIMITED], you must also specify a [suppressionPeriod]. If you specify [INFINITE], any \
         value for [suppressionPeriod] is ignored. \n"]
  anomaly_detector_arn : anomaly_detector_arn;
      [@ocaml.doc "The ARN of the anomaly detector that this operation is to act on.\n"]
  pattern_id : pattern_id option;
      [@ocaml.doc
        "If you are suppressing or unsuppressing an pattern, specify its unique ID here. You can \
         find pattern IDs by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html}ListAnomalies} \
         operation.\n"]
  anomaly_id : anomaly_id option;
      [@ocaml.doc
        "If you are suppressing or unsuppressing an anomaly, specify its unique ID here. You can \
         find anomaly IDs by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html}ListAnomalies} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The list of tag keys to remove from the resource.\n"]
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs resource that you're removing tags from.\n\n\
        \ The ARN format of a log group is \n\
        \ {[\n\
        \ arn:aws:logs:{i Region}:{i account-id}:log-group:{i log-group-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a destination is \n\
        \  {[\n\
        \  arn:aws:logs:{i Region}:{i account-id}:destination:{i destination-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html}CloudWatch \
         Logs resources and operations}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec tag_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_log_group_request = {
  tags : tag_list;
      [@ocaml.doc "The tag keys. The corresponding tags are removed from the log group.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec unrecognized_client_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The most likely cause is an Amazon Web Services access key ID or secret key that's not valid.\n"]

type nonrec unmask = bool [@@ocaml.doc ""]

type nonrec key = string [@@ocaml.doc ""]

type nonrec type_ =
  | STRING [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec type_converter_entry = {
  type_ : type_;
      [@ocaml.doc
        "The type to convert the field value to. Valid values are [integer], [double], [string] \
         and [boolean].\n"]
  key : key; [@ocaml.doc "The key with the value that is to be converted to a different type.\n"]
}
[@@ocaml.doc
  "This object defines one value type that will be converted using the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter} \
   typeConverter} processor.\n"]

type nonrec type_converter_entries = type_converter_entry list [@@ocaml.doc ""]

type nonrec type_converter = {
  entries : type_converter_entries;
      [@ocaml.doc
        "An array of [TypeConverterEntry] objects, where each object contains the information \
         about one field to change the type of. \n"]
}
[@@ocaml.doc
  "Use this processor to convert a value type associated with the specified key to the specified \
   type. It's a casting processor that changes the types of the specified fields. Values can be \
   converted into one of the following datatypes: [integer], [double], [string] and [boolean]. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString} \
   trimString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec trim_string_with_keys = with_key list [@@ocaml.doc ""]

type nonrec trim_string = {
  with_keys : trim_string_with_keys;
      [@ocaml.doc "The array containing the keys of the fields to trim.\n"]
}
[@@ocaml.doc
  "Use this processor to remove leading and trailing whitespace.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString} \
   trimString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec query_id = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec scheduled_query_destination_type = S3 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec action_status =
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CLIENT_ERROR [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_query_destination = {
  error_message : string_ option; [@ocaml.doc "Error message if destination processing failed.\n"]
  processed_identifier : string_ option;
      [@ocaml.doc "The identifier of the processed result at the destination.\n"]
  status : action_status option; [@ocaml.doc "The processing status of the destination delivery.\n"]
  destination_identifier : string_ option;
      [@ocaml.doc "The identifier for the destination where results are delivered.\n"]
  destination_type : scheduled_query_destination_type option;
      [@ocaml.doc "The type of destination for query results.\n"]
}
[@@ocaml.doc
  "Information about a destination where scheduled query results are processed, including \
   processing status and any error messages.\n"]

type nonrec scheduled_query_destination_list = scheduled_query_destination list [@@ocaml.doc ""]

type nonrec trigger_history_record = {
  destinations : scheduled_query_destination_list option;
      [@ocaml.doc "Information about destination processing for this query execution.\n"]
  error_message : string_ option; [@ocaml.doc "Error message if the query execution failed.\n"]
  triggered_timestamp : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query execution was triggered.\n"]
  execution_status : execution_status option;
      [@ocaml.doc "The execution status of the scheduled query run.\n"]
  query_id : query_id option; [@ocaml.doc "The unique identifier for this query execution.\n"]
}
[@@ocaml.doc
  "A record of a scheduled query execution, including execution status, timestamp, and destination \
   processing results.\n"]

type nonrec trigger_history_record_list = trigger_history_record list [@@ocaml.doc ""]

type nonrec event_number = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec event_message = string [@@ocaml.doc ""]

type nonrec transformed_event_message = string [@@ocaml.doc ""]

type nonrec transformed_log_record = {
  transformed_event_message : transformed_event_message option;
      [@ocaml.doc "The log event message after being transformed.\n"]
  event_message : event_message option;
      [@ocaml.doc "The original log event message before it was transformed.\n"]
  event_number : event_number option; [@ocaml.doc "The event number.\n"]
}
[@@ocaml.doc
  "This structure contains information for one log event that has been processed by a log \
   transformer.\n"]

type nonrec transformed_logs = transformed_log_record list [@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  resource_name : amazon_resource_name option; [@ocaml.doc "The name of the resource.\n"]
  message : message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A resource can have no more than 50 tags.\n"]

type nonrec token_value = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec token_string = string [@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec to_key = string [@@ocaml.doc ""]

type nonrec time = string [@@ocaml.doc ""]

type nonrec test_transformer_response = {
  transformed_logs : transformed_logs option;
      [@ocaml.doc
        "An array where each member of the array includes both the original version and the \
         transformed version of one of the log events that you input.\n"]
}
[@@ocaml.doc ""]

type nonrec add_key_value = string [@@ocaml.doc ""]

type nonrec overwrite_if_exists = bool [@@ocaml.doc ""]

type nonrec add_key_entry = {
  overwrite_if_exists : overwrite_if_exists option;
      [@ocaml.doc
        "Specifies whether to overwrite the value if the key already exists in the log event. If \
         you omit this, the default is [false].\n"]
  value : add_key_value; [@ocaml.doc "The value of the new entry to be added to the log event\n"]
  key : key; [@ocaml.doc "The key of the new entry to be added to the log event\n"]
}
[@@ocaml.doc
  "This object defines one key that will be added with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKey} \
   addKeys} processor.\n"]

type nonrec add_key_entries = add_key_entry list [@@ocaml.doc ""]

type nonrec add_keys = {
  entries : add_key_entries;
      [@ocaml.doc
        "An array of objects, where each object contains the information about one key to add to \
         the log event. \n"]
}
[@@ocaml.doc
  "This processor adds new key-value pairs to the log event. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys} \
   addKeys} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec source = string [@@ocaml.doc ""]

type nonrec target = string [@@ocaml.doc ""]

type nonrec copy_value_entry = {
  overwrite_if_exists : overwrite_if_exists option;
      [@ocaml.doc
        "Specifies whether to overwrite the value if the destination key already exists. If you \
         omit this, the default is [false].\n"]
  target : target; [@ocaml.doc "The key of the field to copy the value to.\n"]
  source : source; [@ocaml.doc "The key to copy.\n"]
}
[@@ocaml.doc
  "This object defines one value to be copied with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copoyValue} \
   copyValue} processor.\n"]

type nonrec copy_value_entries = copy_value_entry list [@@ocaml.doc ""]

type nonrec copy_value = {
  entries : copy_value_entries;
      [@ocaml.doc
        "An array of [CopyValueEntry] objects, where each object contains the information about \
         one field value to copy. \n"]
}
[@@ocaml.doc
  "This processor copies values within a log event. You can also use this processor to add \
   metadata to log events by copying the values of the following metadata keys into the log \
   events: [@logGroupName], [@logGroupStream], [@accountId], [@regionName]. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue} \
   copyValue} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec quote_character = string [@@ocaml.doc ""]

type nonrec delimiter = string [@@ocaml.doc ""]

type nonrec column = string [@@ocaml.doc ""]

type nonrec columns = column list [@@ocaml.doc ""]

type nonrec destination_field = string [@@ocaml.doc ""]

type nonrec cs_v = {
  destination : destination_field option;
      [@ocaml.doc
        "The path to the parent field to put transformed key value pairs under. If you omit this \
         value, the key value pairs will be placed under the root node.\n"]
  source : source option;
      [@ocaml.doc
        "The path to the field in the log event that has the comma separated values to be parsed. \
         If you omit this value, the whole log message is processed.\n"]
  columns : columns option;
      [@ocaml.doc
        "An array of names to use for the columns in the transformed log event.\n\n\
        \ If you omit this, default column names ([\\[column_1, column_2 ...\\]]) are used.\n\
        \ "]
  delimiter : delimiter option;
      [@ocaml.doc
        "The character used to separate each column in the original comma-separated value log \
         event. If you omit this, the processor looks for the comma [,] character as the delimiter.\n"]
  quote_character : quote_character option;
      [@ocaml.doc
        "The character used used as a text qualifier for a single column of data. If you omit \
         this, the double quotation mark [\"] character is used.\n"]
}
[@@ocaml.doc
  "The [CSV] processor parses comma-separated values (CSV) from the log events into columns.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-csv} \
   csv} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec target_format = string [@@ocaml.doc ""]

type nonrec match_pattern = string [@@ocaml.doc ""]

type nonrec match_patterns = match_pattern list [@@ocaml.doc ""]

type nonrec source_timezone = string [@@ocaml.doc ""]

type nonrec target_timezone = string [@@ocaml.doc ""]

type nonrec locale = string [@@ocaml.doc ""]

type nonrec date_time_converter = {
  locale : locale option;
      [@ocaml.doc
        "The locale of the source field. If you omit this, the default of [locale.ROOT] is used.\n"]
  target_timezone : target_timezone option;
      [@ocaml.doc
        "The time zone of the target field. If you omit this, the default used is the UTC zone.\n"]
  source_timezone : source_timezone option;
      [@ocaml.doc
        "The time zone of the source field. If you omit this, the default used is the UTC zone.\n"]
  match_patterns : match_patterns;
      [@ocaml.doc "A list of patterns to match against the [source] field.\n"]
  target_format : target_format option;
      [@ocaml.doc
        "The datetime format to use for the converted data in the target field.\n\n\
        \ If you omit this, the default of [ yyyy-MM-dd'T'HH:mm:ss.SSS'Z] is used.\n\
        \ "]
  target : target; [@ocaml.doc "The JSON field to store the result in.\n"]
  source : source; [@ocaml.doc "The key to apply the date conversion to.\n"]
}
[@@ocaml.doc
  "This processor converts a datetime string into a format that you specify. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter} \
   datetimeConverter} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec delete_with_keys = with_key list [@@ocaml.doc ""]

type nonrec delete_keys = {
  with_keys : delete_with_keys; [@ocaml.doc "The list of keys to delete.\n"]
}
[@@ocaml.doc
  "This processor deletes entries from a log event. These entries are key-value pairs. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys} \
   deleteKeys} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec grok_match = string [@@ocaml.doc ""]

type nonrec grok = {
  match_ : grok_match;
      [@ocaml.doc
        "The grok pattern to match against the log event. For a list of supported grok patterns, \
         see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok}Supported \
         grok patterns}.\n"]
  source : source option;
      [@ocaml.doc
        "The path to the field in the log event that you want to parse. If you omit this value, \
         the whole log message is parsed.\n"]
}
[@@ocaml.doc
  "This processor uses pattern matching to parse and structure unstructured data. This processor \
   can also extract fields from log messages.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok}grok} \
   in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec flatten = bool [@@ocaml.doc ""]

type nonrec flattened_element = LAST [@ocaml.doc ""] | FIRST [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_to_map = {
  flattened_element : flattened_element option;
      [@ocaml.doc
        "If you set [flatten] to [true], use [flattenedElement] to specify which element, [first] \
         or [last], to keep. \n\n\
        \ You must specify this parameter if [flatten] is [true] \n\
        \ "]
  flatten : flatten option;
      [@ocaml.doc
        "A Boolean value to indicate whether the list will be flattened into single items. Specify \
         [true] to flatten the list. The default is [false] \n"]
  target : target option; [@ocaml.doc "The key of the field that will hold the generated map \n"]
  value_key : value_key option;
      [@ocaml.doc
        "If this is specified, the values that you specify in this parameter will be extracted \
         from the [source] objects and put into the values of the generated map. Otherwise, \
         original objects in the source list will be put into the values of the generated map.\n"]
  key : key; [@ocaml.doc "The key of the field to be extracted as keys in the generated map\n"]
  source : source;
      [@ocaml.doc
        "The key in the log event that has a list of objects that will be converted to a map.\n"]
}
[@@ocaml.doc
  "This processor takes a list of objects that contain key fields, and converts them into a map of \
   target keys.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Processors.html#CloudWatch-Logs-Transformation-listToMap} \
   listToMap} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec lower_case_string_with_keys = with_key list [@@ocaml.doc ""]

type nonrec lower_case_string = {
  with_keys : lower_case_string_with_keys;
      [@ocaml.doc "The array caontaining the keys of the fields to convert to lowercase.\n"]
}
[@@ocaml.doc
  "This processor converts a string to lowercase.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString} \
   lowerCaseString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec move_key_entry = {
  overwrite_if_exists : overwrite_if_exists option;
      [@ocaml.doc
        "Specifies whether to overwrite the value if the destination key already exists. If you \
         omit this, the default is [false].\n"]
  target : target; [@ocaml.doc "The key to move to.\n"]
  source : source; [@ocaml.doc "The key to move.\n"]
}
[@@ocaml.doc
  "This object defines one key that will be moved with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKey} \
   moveKey} processor.\n"]

type nonrec move_key_entries = move_key_entry list [@@ocaml.doc ""]

type nonrec move_keys = {
  entries : move_key_entries;
      [@ocaml.doc
        "An array of objects, where each object contains the information about one key to move. \n"]
}
[@@ocaml.doc
  "This processor moves a key from one field to another. The original key is deleted.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys} \
   moveKeys} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec parse_cloudfront = {
  source : source option;
      [@ocaml.doc
        "Omit this parameter and the whole log message will be processed by this processor. No \
         other value than [@message] is allowed for [source].\n"]
}
[@@ocaml.doc
  "This processor parses CloudFront vended logs, extract fields, and convert them into JSON \
   format. Encoded field values are decoded. Values that are integers and doubles are treated as \
   such. For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront} \
   parseCloudfront} \n\n\
  \ For more information about CloudFront log format, see \
   {{:https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html} \
   Configure and use standard logs (access logs)}.\n\
  \ \n\
  \  If you use this processor, it must be the first processor in your transformer.\n\
  \  "]

type nonrec parse_jso_n = {
  destination : destination_field option;
      [@ocaml.doc
        "The location to put the parsed key value pair into. If you omit this parameter, it is \
         placed under the root node.\n"]
  source : source option;
      [@ocaml.doc
        "Path to the field in the log event that will be parsed. Use dot notation to access child \
         fields. For example, [store.book] \n"]
}
[@@ocaml.doc
  "This processor parses log events that are in JSON format. It can extract JSON key-value pairs \
   and place them under a destination that you specify.\n\n\
  \ Additionally, because you must have at least one parse-type processor in a transformer, you \
   can use [ParseJSON] as that processor for JSON-format logs, so that you can also apply other \
   processors, such as mutate processors, to these logs.\n\
  \ \n\
  \  For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseJSON} \
   parseJSON} in the {i CloudWatch Logs User Guide}.\n\
  \  "]

type nonrec parser_field_delimiter = string [@@ocaml.doc ""]

type nonrec key_value_delimiter = string [@@ocaml.doc ""]

type nonrec key_prefix = string [@@ocaml.doc ""]

type nonrec non_match_value = string [@@ocaml.doc ""]

type nonrec parse_key_value = {
  overwrite_if_exists : overwrite_if_exists option;
      [@ocaml.doc
        "Specifies whether to overwrite the value if the destination key already exists. If you \
         omit this, the default is [false].\n"]
  non_match_value : non_match_value option;
      [@ocaml.doc
        "A value to insert into the value field in the result, when a key-value pair is not \
         successfully split.\n"]
  key_prefix : key_prefix option;
      [@ocaml.doc "If you want to add a prefix to all transformed keys, specify it here.\n"]
  key_value_delimiter : key_value_delimiter option;
      [@ocaml.doc
        "The delimiter string to use between the key and value in each pair in the transformed log \
         event.\n\n\
        \  If you omit this, the equal [=] character is used.\n\
        \ "]
  field_delimiter : parser_field_delimiter option;
      [@ocaml.doc
        "The field delimiter string that is used between key-value pairs in the original log \
         events. If you omit this, the ampersand [&] character is used.\n"]
  destination : destination_field option;
      [@ocaml.doc "The destination field to put the extracted key-value pairs into\n"]
  source : source option;
      [@ocaml.doc
        "Path to the field in the log event that will be parsed. Use dot notation to access child \
         fields. For example, [store.book] \n"]
}
[@@ocaml.doc
  "This processor parses a specified field in the original log event into key-value pairs. \n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue} \
   parseKeyValue} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec parse_route53 = {
  source : source option;
      [@ocaml.doc
        "Omit this parameter and the whole log message will be processed by this processor. No \
         other value than [@message] is allowed for [source].\n"]
}
[@@ocaml.doc
  "Use this processor to parse Route\194\16053 vended logs, extract fields, and and convert them \
   into a JSON format. This processor always processes the entire log event message. For more \
   information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseRoute53} \
   parseRoute53}.\n\n\
  \  If you use this processor, it must be the first processor in your transformer.\n\
  \  \n\
  \   "]

type nonrec event_source =
  | AWSWAF [@ocaml.doc ""]
  | EKS_AUDIT [@ocaml.doc ""]
  | VPC_FLOW [@ocaml.doc ""]
  | ROUTE53_RESOLVER [@ocaml.doc ""]
  | CLOUD_TRAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ocsf_version = V1_5 [@ocaml.doc ""] | V1_1 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec mapping_version = string [@@ocaml.doc ""]

type nonrec parse_to_ocs_f = {
  mapping_version : mapping_version option;
      [@ocaml.doc "The version of the OCSF mapping to use for parsing log data.\n"]
  ocsf_version : ocsf_version;
      [@ocaml.doc
        "Specify which version of the OCSF schema to use for the transformed log events.\n"]
  event_source : event_source;
      [@ocaml.doc
        "Specify the service or process that produces the log events that will be converted with \
         this processor.\n"]
  source : source option;
      [@ocaml.doc
        "The path to the field in the log event that you want to parse. If you omit this value, \
         the whole log message is parsed.\n"]
}
[@@ocaml.doc
  "This processor converts logs into {{:https://ocsf.io}Open Cybersecurity Schema Framework \
   (OCSF)} events.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseToOCSF}parseToOCSF} \
   in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec parse_postgres = {
  source : source option;
      [@ocaml.doc
        "Omit this parameter and the whole log message will be processed by this processor. No \
         other value than [@message] is allowed for [source].\n"]
}
[@@ocaml.doc
  "Use this processor to parse RDS for PostgreSQL vended logs, extract fields, and and convert \
   them into a JSON format. This processor always processes the entire log event message. For more \
   information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres} \
   parsePostGres}.\n\n\
  \ For more information about RDS for PostgreSQL log format, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.PostgreSQL.html#USER_LogAccess.Concepts.PostgreSQL.Log_Format.log-line-prefix} \
   RDS for PostgreSQL database log filesTCP flag sequence}.\n\
  \ \n\
  \   If you use this processor, it must be the first processor in your transformer.\n\
  \   \n\
  \    "]

type nonrec parse_vp_c = {
  source : source option;
      [@ocaml.doc
        "Omit this parameter and the whole log message will be processed by this processor. No \
         other value than [@message] is allowed for [source].\n"]
}
[@@ocaml.doc
  "Use this processor to parse Amazon VPC vended logs, extract fields, and and convert them into a \
   JSON format. This processor always processes the entire log event message.\n\n\
  \ This processor doesn't support custom log formats, such as NAT gateway logs. For more \
   information about custom log formats in Amazon VPC, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs-records-examples.html#flow-log-example-tcp-flag} \
   parseVPC} For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseVPC} \
   parseVPC}.\n\
  \ \n\
  \   If you use this processor, it must be the first processor in your transformer.\n\
  \   \n\
  \    "]

type nonrec parse_wa_f = {
  source : source option;
      [@ocaml.doc
        "Omit this parameter and the whole log message will be processed by this processor. No \
         other value than [@message] is allowed for [source].\n"]
}
[@@ocaml.doc
  "Use this processor to parse WAF vended logs, extract fields, and and convert them into a JSON \
   format. This processor always processes the entire log event message. For more information \
   about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres} \
   parseWAF}.\n\n\
  \ For more information about WAF log format, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-examples.html} Log examples \
   for web ACL traffic}.\n\
  \ \n\
  \   If you use this processor, it must be the first processor in your transformer.\n\
  \   \n\
  \    "]

type nonrec rename_to = string [@@ocaml.doc ""]

type nonrec rename_key_entry = {
  overwrite_if_exists : overwrite_if_exists option;
      [@ocaml.doc
        "Specifies whether to overwrite the existing value if the destination key already exists. \
         The default is [false] \n"]
  rename_to : rename_to; [@ocaml.doc "The string to use for the new key name\n"]
  key : key; [@ocaml.doc "The key to rename\n"]
}
[@@ocaml.doc
  "This object defines one key that will be renamed with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKey} \
   renameKey} processor.\n"]

type nonrec rename_key_entries = rename_key_entry list [@@ocaml.doc ""]

type nonrec rename_keys = {
  entries : rename_key_entries;
      [@ocaml.doc
        "An array of [RenameKeyEntry] objects, where each object contains the information about a \
         single key to rename. \n"]
}
[@@ocaml.doc
  "Use this processor to rename keys in a log event.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys} \
   renameKeys} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec split_string_delimiter = string [@@ocaml.doc ""]

type nonrec split_string_entry = {
  delimiter : split_string_delimiter;
      [@ocaml.doc "The separator characters to split the string entry on.\n"]
  source : source; [@ocaml.doc "The key of the field to split.\n"]
}
[@@ocaml.doc
  "This object defines one log field that will be split with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString} \
   splitString} processor.\n"]

type nonrec split_string_entries = split_string_entry list [@@ocaml.doc ""]

type nonrec split_string = {
  entries : split_string_entries;
      [@ocaml.doc
        "An array of [SplitStringEntry] objects, where each object contains the information about \
         one field to split. \n"]
}
[@@ocaml.doc
  "Use this processor to split a field into an array of strings using a delimiting character.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString} \
   splitString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec from_key = string [@@ocaml.doc ""]

type nonrec substitute_string_entry = {
  to_ : to_key; [@ocaml.doc "The string to be substituted for each match of [from] \n"]
  from_ : from_key;
      [@ocaml.doc
        "The regular expression string to be replaced. Special regex characters such as \\[ and \
         \\] must be escaped using \\\\ when using double quotes and with \\ when using single \
         quotes. For more information, see \
         {{:https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/regex/Pattern.html} \
         Class Pattern} on the Oracle web site.\n"]
  source : source; [@ocaml.doc "The key to modify\n"]
}
[@@ocaml.doc
  "This object defines one log field key that will be replaced using the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString} \
   substituteString} processor.\n"]

type nonrec substitute_string_entries = substitute_string_entry list [@@ocaml.doc ""]

type nonrec substitute_string = {
  entries : substitute_string_entries;
      [@ocaml.doc
        "An array of objects, where each object contains the information about one key to match \
         and replace. \n"]
}
[@@ocaml.doc
  "This processor matches a key\226\128\153s value against a regular expression and replaces all \
   matches with a replacement string.\n\n\
  \ For more information about this processor including examples, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString} \
   substituteString} in the {i CloudWatch Logs User Guide}.\n\
  \ "]

type nonrec processor = {
  upper_case_string : upper_case_string option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString} \
         upperCaseString} processor in your transformer.\n"]
  type_converter : type_converter option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter} \
         typeConverter} processor in your transformer.\n"]
  trim_string : trim_string option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString} \
         trimString} processor in your transformer.\n"]
  substitute_string : substitute_string option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString} \
         substituteString} processor in your transformer.\n"]
  split_string : split_string option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString} \
         splitString} processor in your transformer.\n"]
  rename_keys : rename_keys option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys} \
         renameKeys} processor in your transformer.\n"]
  parse_wa_f : parse_wa_f option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseWAF} \
         parseWAF} processor in your transformer.\n\n\
        \ If you use this processor, it must be the first processor in your transformer.\n\
        \ "]
  parse_vp_c : parse_vp_c option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseVPC} \
         parseVPC} processor in your transformer.\n\n\
        \ If you use this processor, it must be the first processor in your transformer.\n\
        \ "]
  parse_postgres : parse_postgres option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres} \
         parsePostGres} processor in your transformer.\n\n\
        \ If you use this processor, it must be the first processor in your transformer.\n\
        \ "]
  parse_to_ocs_f : parse_to_ocs_f option;
      [@ocaml.doc
        "Use this parameter to convert logs into Open Cybersecurity Schema (OCSF) format.\n"]
  parse_route53 : parse_route53 option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseRoute53} \
         parseRoute53} processor in your transformer.\n\n\
        \ If you use this processor, it must be the first processor in your transformer.\n\
        \ "]
  parse_key_value : parse_key_value option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue} \
         parseKeyValue} processor in your transformer.\n"]
  parse_jso_n : parse_jso_n option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseJSON} \
         parseJSON} processor in your transformer.\n"]
  parse_cloudfront : parse_cloudfront option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront} \
         parseCloudfront} processor in your transformer.\n\n\
        \ If you use this processor, it must be the first processor in your transformer.\n\
        \ "]
  move_keys : move_keys option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys} \
         moveKeys} processor in your transformer.\n"]
  lower_case_string : lower_case_string option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString} \
         lowerCaseString} processor in your transformer.\n"]
  list_to_map : list_to_map option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-listToMap} \
         listToMap} processor in your transformer.\n"]
  grok : grok option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-grok} \
         grok} processor in your transformer.\n"]
  delete_keys : delete_keys option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys} \
         deleteKeys} processor in your transformer.\n"]
  date_time_converter : date_time_converter option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter} \
         datetimeConverter} processor in your transformer.\n"]
  csv : cs_v option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-CSV} \
         CSV} processor in your transformer.\n"]
  copy_value : copy_value option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue} \
         copyValue} processor in your transformer.\n"]
  add_keys : add_keys option;
      [@ocaml.doc
        "Use this parameter to include the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys} \
         addKeys} processor in your transformer.\n"]
}
[@@ocaml.doc "This structure contains the information about one processor in a log transformer.\n"]

type nonrec processors = processor list [@@ocaml.doc ""]

type nonrec test_event_messages = event_message list [@@ocaml.doc ""]

type nonrec test_transformer_request = {
  log_event_messages : test_event_messages;
      [@ocaml.doc "An array of the raw log events that you want to use to test this transformer.\n"]
  transformer_config : processors;
      [@ocaml.doc
        "This structure contains the configuration of this log transformer that you want to test. \
         A log transformer is an array of processors, where each processor applies one type of \
         transformation to the log events that are ingested.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_operation_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation is not valid on the specified resource.\n"]

type nonrec extracted_values = (token * value) list [@@ocaml.doc ""]

type nonrec metric_filter_match_record = {
  extracted_values : extracted_values option;
      [@ocaml.doc "The values extracted from the event data by the filter.\n"]
  event_message : event_message option; [@ocaml.doc "The raw event data.\n"]
  event_number : event_number option; [@ocaml.doc "The event number.\n"]
}
[@@ocaml.doc "Represents a matched event.\n"]

type nonrec metric_filter_matches = metric_filter_match_record list [@@ocaml.doc ""]

type nonrec test_metric_filter_response = {
  matches : metric_filter_matches option; [@ocaml.doc "The matched events.\n"]
}
[@@ocaml.doc ""]

type nonrec test_metric_filter_request = {
  log_event_messages : test_event_messages; [@ocaml.doc "The log event messages to test.\n"]
  filter_pattern : filter_pattern; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec target_arn = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tags = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags; [@ocaml.doc "The list of key-value pairs to associate with the resource.\n"]
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the resource that you're adding tags to.\n\n\
        \ The ARN format of a log group is \n\
        \ {[\n\
        \ arn:aws:logs:{i Region}:{i account-id}:log-group:{i log-group-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a destination is \n\
        \  {[\n\
        \  arn:aws:logs:{i Region}:{i account-id}:destination:{i destination-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html}CloudWatch \
         Logs resources and operations}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec tag_log_group_request = {
  tags : tags; [@ocaml.doc "The key-value pairs to use for the tags.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_filter_key = string [@@ocaml.doc ""]

type nonrec tag_filter_value = string [@@ocaml.doc ""]

type nonrec tag_filter_values = tag_filter_value list [@@ocaml.doc ""]

type nonrec tag_filter = {
  values : tag_filter_values option;
      [@ocaml.doc
        "An optional list of tag values to filter on.\n\n\
        \ {ul\n\
        \       {-  If you specify a filter that contains more than one value for a key, the \
         response returns log groups that match any of the specified values for that key.\n\
        \           \n\
        \            }\n\
        \       {-  If you don't specify values, the response returns all log groups that are \
         tagged with that key, with any or no value.\n\
        \           \n\
        \            }\n\
        \       {-  Use [*] for wildcard matching. For example, [prod*] matches values that start \
         with [prod].\n\
        \           \n\
        \            }\n\
        \       {-  Use [!] as a prefix for negation. For example, [!prod] matches values that are \
         not [prod].\n\
        \           \n\
        \            }\n\
        \       {-  Exact matching and negation are case-sensitive. Wildcard matching is \
         case-insensitive.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  key : tag_filter_key; [@ocaml.doc "The tag key to filter on.\n"]
}
[@@ocaml.doc
  "A tag filter that specifies a tag key and optional tag values for filtering log groups by tags.\n"]

type nonrec tag_filters = tag_filter list [@@ocaml.doc ""]

type nonrec table_fields = string_ list [@@ocaml.doc ""]

type nonrec system_field = string [@@ocaml.doc ""]

type nonrec syslog_source_type = VPCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec log_group_arn = string [@@ocaml.doc ""]

type nonrec syslog_configuration = {
  created_at : timestamp option;
      [@ocaml.doc
        "The time when the syslog configuration was created, expressed as the number of \
         milliseconds after [Jan 1, 1970 00:00:00 UTC].\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "The ID of the VPC endpoint used for syslog ingestion.\n"]
  source_type : syslog_source_type option;
      [@ocaml.doc "The source type for the syslog configuration.\n"]
  log_group_arn : log_group_arn option;
      [@ocaml.doc "The ARN of the log group associated with this syslog configuration.\n"]
}
[@@ocaml.doc "Contains information about a syslog configuration associated with a log group.\n"]

type nonrec syslog_configurations = syslog_configuration list [@@ocaml.doc ""]

type nonrec suppression_state = UNSUPPRESSED [@ocaml.doc ""] | SUPPRESSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec success = bool [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec destination_arn = string [@@ocaml.doc ""]

type nonrec distribution = ByLogStream [@ocaml.doc ""] | Random [@ocaml.doc ""]
[@@ocaml.doc
  "The method used to distribute log data to the destination, which can be either random or \
   grouped by log stream.\n"]

type nonrec apply_on_transformed_logs = bool [@@ocaml.doc ""]

type nonrec field_selection_criteria = string [@@ocaml.doc ""]

type nonrec emit_system_fields = system_field list [@@ocaml.doc ""]

type nonrec subscription_filter = {
  emit_system_fields : emit_system_fields option;
      [@ocaml.doc
        "The list of system fields that are included in the log events sent to the subscription \
         destination. Returns the [emitSystemFields] value if it was specified when the \
         subscription filter was created.\n"]
  field_selection_criteria : field_selection_criteria option;
      [@ocaml.doc
        "The filter expression that specifies which log events are processed by this subscription \
         filter based on system fields. Returns the [fieldSelectionCriteria] value if it was \
         specified when the subscription filter was created.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the subscription filter, expressed as the number of milliseconds \
         after [Jan 1, 1970 00:00:00 UTC].\n"]
  apply_on_transformed_logs : apply_on_transformed_logs option;
      [@ocaml.doc
        "This parameter is valid only for log groups that have an active log transformer. For more \
         information about log transformers, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html}PutTransformer}.\n\n\
        \ If this value is [true], the subscription filter is applied on the transformed version \
         of the log events instead of the original ingested log events.\n\
        \ "]
  distribution : distribution option; [@ocaml.doc ""]
  role_arn : role_arn option; [@ocaml.doc "\n"]
  destination_arn : destination_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the destination.\n"]
  filter_pattern : filter_pattern option; [@ocaml.doc ""]
  log_group_name : log_group_name option; [@ocaml.doc "The name of the log group.\n"]
  filter_name : filter_name option; [@ocaml.doc "The name of the subscription filter.\n"]
}
[@@ocaml.doc "Represents a subscription filter.\n"]

type nonrec subscription_filters = subscription_filter list [@@ocaml.doc ""]

type nonrec stored_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec stop_query_response = {
  success : success option;
      [@ocaml.doc "This is true if the query was stopped by the [StopQuery] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_query_request = {
  query_id : query_id;
      [@ocaml.doc
        "The ID number of the query to stop. To find this ID number, use [DescribeQueries].\n"]
}
[@@ocaml.doc ""]

type nonrec stats_value = float [@@ocaml.doc ""]

type nonrec state = Baseline [@ocaml.doc ""] | Suppressed [@ocaml.doc ""] | Active [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_query_response = {
  query_id : query_id option; [@ocaml.doc "The unique ID of the query. \n"]
}
[@@ocaml.doc ""]

type nonrec log_group_names = log_group_name list [@@ocaml.doc ""]

type nonrec log_group_identifiers = log_group_identifier list [@@ocaml.doc ""]

type nonrec events_limit_start_query = int [@@ocaml.doc ""]

type nonrec start_query_request = {
  limit : events_limit_start_query option;
      [@ocaml.doc
        "The maximum number of log events to return from the query. The maximum limit is 100,000. \
         The maximum events returned in a single GetQueryResults API call is 10,000 log events per \
         request. You can retrieve up to 100,000 log event results from a query by paginating with \
         the [nextToken]. 100,000 limit is only supported for Logs Insights QL and is currently \
         not supported for PPL and SQL query languages.\n"]
  query_string : query_string;
      [@ocaml.doc
        "The query string to use. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html}CloudWatch \
         Logs Insights Query Syntax}.\n"]
  end_time : timestamp;
      [@ocaml.doc
        "The end of the time range to query. The range is inclusive, so the specified end time is \
         included in the query. Specified as epoch time, the number of seconds since [January 1,\n\
        \        1970, 00:00:00 UTC].\n"]
  start_time : timestamp;
      [@ocaml.doc
        "The beginning of the time range to query. The range is inclusive, so the specified start \
         time is included in the query. Specified as epoch time, the number of seconds since \
         [January 1, 1970, 00:00:00 UTC].\n"]
  log_group_identifiers : log_group_identifiers option;
      [@ocaml.doc
        "The list of log groups to query. You can include up to 50 log groups.\n\n\
        \ You can specify them by the log group name or ARN. If a log group that you're querying \
         is in a source account and you're using a monitoring account, you must specify the ARN of \
         the log group here. The query definition must also be defined in the monitoring account.\n\
        \ \n\
        \  If you specify an ARN, use the format arn:aws:logs:{i region}:{i \
         account-id}:log-group:{i log_group_name} Don't include an * at the end.\n\
        \  \n\
        \   A [StartQuery] operation must include exactly one of the following parameters: \
         [logGroupName], [logGroupNames], or [logGroupIdentifiers]. The exception is queries using \
         the OpenSearch Service SQL query language, where you specify the log group names inside \
         the [querystring] instead of here. \n\
        \   "]
  log_group_names : log_group_names option;
      [@ocaml.doc
        "The list of log groups to be queried. You can include up to 50 log groups.\n\n\
        \  A [StartQuery] operation must include exactly one of the following parameters: \
         [logGroupName], [logGroupNames], or [logGroupIdentifiers]. The exception is queries using \
         the OpenSearch Service SQL query language, where you specify the log group names inside \
         the [querystring] instead of here.\n\
        \  \n\
        \   "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The log group on which to perform the query.\n\n\
        \  A [StartQuery] operation must include exactly one of the following parameters: \
         [logGroupName], [logGroupNames], or [logGroupIdentifiers]. The exception is queries using \
         the OpenSearch Service SQL query language, where you specify the log group names inside \
         the [querystring] instead of here.\n\
        \  \n\
        \   "]
  query_language : query_language option;
      [@ocaml.doc
        "Specify the query language to use for this query. The options are Logs Insights QL, \
         OpenSearch PPL, and OpenSearch SQL. For more information about the query languages that \
         CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc ""]

type nonrec query_char_offset = int [@@ocaml.doc ""]

type nonrec query_compile_error_location = {
  end_char_offset : query_char_offset option; [@ocaml.doc "Reserved.\n"]
  start_char_offset : query_char_offset option; [@ocaml.doc "Reserved.\n"]
}
[@@ocaml.doc "Reserved.\n"]

type nonrec query_compile_error = {
  message : message option; [@ocaml.doc "Reserved.\n"]
  location : query_compile_error_location option; [@ocaml.doc "Reserved.\n"]
}
[@@ocaml.doc "Reserved.\n"]

type nonrec malformed_query_exception = {
  message : message option; [@ocaml.doc ""]
  query_compile_error : query_compile_error option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The query string is not valid. Details about this error are displayed in a [QueryCompileError] \
   object. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_QueryCompileError.html}QueryCompileError}.\n\n\
  \ For more information about valid query syntax, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html}CloudWatch \
   Logs Insights Query Syntax}.\n\
  \ "]

type nonrec limit_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "You have reached the maximum number of resources that can be created.\n"]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec session_id = string [@@ocaml.doc ""]

type nonrec start_live_tail_log_group_identifiers = log_group_identifier list [@@ocaml.doc ""]

type nonrec log_stream_name = string [@@ocaml.doc ""]

type nonrec input_log_stream_names = log_stream_name list [@@ocaml.doc ""]

type nonrec live_tail_session_start = {
  log_event_filter_pattern : filter_pattern option;
      [@ocaml.doc
        "An optional pattern to filter the results to include only log events that match the \
         pattern. For example, a filter pattern of [error 404] displays only log events that \
         include both [error] and [404].\n\n\
        \ For more information about filter pattern syntax, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html}Filter \
         and Pattern Syntax}.\n\
        \ "]
  log_stream_name_prefixes : input_log_stream_names option;
      [@ocaml.doc
        "If your StartLiveTail operation request included a [logStreamNamePrefixes] parameter that \
         filtered the session to only include log streams that have names that start with certain \
         prefixes, these prefixes are listed here.\n"]
  log_stream_names : input_log_stream_names option;
      [@ocaml.doc
        "If your StartLiveTail operation request included a [logStreamNames] parameter that \
         filtered the session to only include certain log streams, these streams are listed here.\n"]
  log_group_identifiers : start_live_tail_log_group_identifiers option;
      [@ocaml.doc
        "An array of the names and ARNs of the log groups included in this Live Tail session.\n"]
  session_id : session_id option;
      [@ocaml.doc
        "The unique ID generated by CloudWatch Logs to identify this Live Tail session.\n"]
  request_id : request_id option;
      [@ocaml.doc
        "The unique ID generated by CloudWatch Logs to identify this Live Tail session request.\n"]
}
[@@ocaml.doc
  "This object contains information about this Live Tail session, including the log groups \
   included and the log stream filters, if any.\n"]

type nonrec is_sampled = bool [@@ocaml.doc ""]

type nonrec live_tail_session_metadata = {
  sampled : is_sampled option;
      [@ocaml.doc
        "If this is [true], then more than 500 log events matched the request for this update, and \
         the [sessionResults] includes a sample of 500 of those events.\n\n\
        \ If this is [false], then 500 or fewer log events matched the request for this update, so \
         no sampling was necessary. In this case, the [sessionResults] array includes all log \
         events that matched your request during this time.\n\
        \ "]
}
[@@ocaml.doc
  "This object contains the metadata for one [LiveTailSessionUpdate] structure. It indicates \
   whether that update includes only a sample of 500 log events out of a larger number of ingested \
   log events, or if it contains all of the matching log events ingested during that second of \
   time.\n"]

type nonrec live_tail_session_log_event = {
  ingestion_time : timestamp option;
      [@ocaml.doc "The timestamp specifying when this log event was ingested into the log group.\n"]
  timestamp : timestamp option;
      [@ocaml.doc "The timestamp specifying when this log event was created.\n"]
  message : event_message option; [@ocaml.doc "The log event message text.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The name or ARN of the log group that ingested this log event.\n"]
  log_stream_name : log_stream_name option;
      [@ocaml.doc "The name of the log stream that ingested this log event.\n"]
}
[@@ocaml.doc
  "This object contains the information for one log event returned in a Live Tail stream.\n"]

type nonrec live_tail_session_results = live_tail_session_log_event list [@@ocaml.doc ""]

type nonrec live_tail_session_update = {
  session_results : live_tail_session_results option;
      [@ocaml.doc
        "An array, where each member of the array includes the information for one log event in \
         the Live Tail session.\n\n\
        \ A [sessionResults] array can include as many as 500 log events. If the number of log \
         events matching the request exceeds 500 per second, the log events are sampled down to \
         500 log events to be included in each [sessionUpdate] structure.\n\
        \ "]
  session_metadata : live_tail_session_metadata option;
      [@ocaml.doc "This object contains the session metadata for a Live Tail session.\n"]
}
[@@ocaml.doc "This object contains the log events and metadata for a Live Tail session.\n"]

type nonrec session_timeout_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is returned in a Live Tail stream when the Live Tail session times out. Live \
   Tail sessions time out after three hours.\n"]

type nonrec session_streaming_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is returned if an unknown error occurs during a Live Tail session.\n"]

type nonrec start_live_tail_response_stream =
  | SessionStreamingException of session_streaming_exception
      [@ocaml.doc "This exception is returned if an unknown error occurs.\n"]
  | SessionTimeoutException of session_timeout_exception
      [@ocaml.doc
        "This exception is returned in the stream when the Live Tail session times out. Live Tail \
         sessions time out after three hours.\n"]
  | SessionUpdate of live_tail_session_update
      [@ocaml.doc "This object contains the log events and session metadata.\n"]
  | SessionStart of live_tail_session_start
      [@ocaml.doc
        "This object contains information about this Live Tail session, including the log groups \
         included and the log stream filters, if any.\n"]
[@@ocaml.doc
  "This object includes the stream returned by your \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTail.html}StartLiveTail} \
   request.\n"]

type nonrec start_live_tail_response = {
  response_stream : start_live_tail_response_stream option;
      [@ocaml.doc
        "An object that includes the stream returned by your request. It can include both log \
         events and exceptions.\n"]
}
[@@ocaml.doc ""]

type nonrec start_live_tail_request = {
  log_event_filter_pattern : filter_pattern option;
      [@ocaml.doc
        "An optional pattern to use to filter the results to include only log events that match \
         the pattern. For example, a filter pattern of [error 404] causes only log events that \
         include both [error] and [404] to be included in the Live Tail stream.\n\n\
        \ Regular expression filter patterns are supported.\n\
        \ \n\
        \  For more information about filter pattern syntax, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html}Filter \
         and Pattern Syntax}.\n\
        \  "]
  log_stream_name_prefixes : input_log_stream_names option;
      [@ocaml.doc
        "If you specify this parameter, then only log events in the log streams that have names \
         that start with the prefixes that you specify here are included in the Live Tail \
         session.\n\n\
        \ If you specify this field, you can't also specify the [logStreamNames] field.\n\
        \ \n\
        \   You can specify this parameter only if you specify only one log group in \
         [logGroupIdentifiers].\n\
        \   \n\
        \    "]
  log_stream_names : input_log_stream_names option;
      [@ocaml.doc
        "If you specify this parameter, then only log events in the log streams that you specify \
         here are included in the Live Tail session.\n\n\
        \ If you specify this field, you can't also specify the [logStreamNamePrefixes] field.\n\
        \ \n\
        \   You can specify this parameter only if you specify only one log group in \
         [logGroupIdentifiers].\n\
        \   \n\
        \    "]
  log_group_identifiers : start_live_tail_log_group_identifiers;
      [@ocaml.doc
        "An array where each item in the array is a log group to include in the Live Tail session.\n\n\
        \ Specify each log group by its ARN. \n\
        \ \n\
        \  If you specify an ARN, the ARN can't end with an asterisk (*).\n\
        \  \n\
        \     You can include up to 10 log groups.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec start_from_head = bool [@@ocaml.doc ""]

type nonrec standard_unit =
  | None_ [@ocaml.doc ""]
  | CountSecond [@ocaml.doc ""]
  | TerabitsSecond [@ocaml.doc ""]
  | GigabitsSecond [@ocaml.doc ""]
  | MegabitsSecond [@ocaml.doc ""]
  | KilobitsSecond [@ocaml.doc ""]
  | BitsSecond [@ocaml.doc ""]
  | TerabytesSecond [@ocaml.doc ""]
  | GigabytesSecond [@ocaml.doc ""]
  | MegabytesSecond [@ocaml.doc ""]
  | KilobytesSecond [@ocaml.doc ""]
  | BytesSecond [@ocaml.doc ""]
  | Count [@ocaml.doc ""]
  | Percent [@ocaml.doc ""]
  | Terabits [@ocaml.doc ""]
  | Gigabits [@ocaml.doc ""]
  | Megabits [@ocaml.doc ""]
  | Kilobits [@ocaml.doc ""]
  | Bits [@ocaml.doc ""]
  | Terabytes [@ocaml.doc ""]
  | Gigabytes [@ocaml.doc ""]
  | Megabytes [@ocaml.doc ""]
  | Kilobytes [@ocaml.doc ""]
  | Bytes [@ocaml.doc ""]
  | Milliseconds [@ocaml.doc ""]
  | Microseconds [@ocaml.doc ""]
  | Seconds [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "This request exceeds a service quota.\n"]

type nonrec service = string [@@ocaml.doc ""]

type nonrec sequence_token = string [@@ocaml.doc ""]

type nonrec selection_criteria = string [@@ocaml.doc ""]

type nonrec log_stream_searched_completely = bool [@@ocaml.doc ""]

type nonrec searched_log_stream = {
  searched_completely : log_stream_searched_completely option;
      [@ocaml.doc "Indicates whether all the events in this log stream were searched.\n"]
  log_stream_name : log_stream_name option; [@ocaml.doc "The name of the log stream.\n"]
}
[@@ocaml.doc "Represents the search status of a log stream.\n"]

type nonrec searched_log_streams = searched_log_stream list [@@ocaml.doc ""]

type nonrec scope = ALL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scheduled_query_summary = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was last updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was created.\n"]
  destination_configuration : destination_configuration option;
      [@ocaml.doc "Configuration for where query results are delivered.\n"]
  timezone : schedule_timezone option;
      [@ocaml.doc "The timezone used for evaluating the schedule expression.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc "The cron expression that defines when the scheduled query runs.\n"]
  last_execution_status : execution_status option;
      [@ocaml.doc "The status of the most recent execution.\n"]
  last_triggered_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was last executed.\n"]
  schedule_type : schedule_type option;
      [@ocaml.doc
        "The schedule type of the scheduled query. Valid values are [CUSTOMER_MANAGED] and \
         [AWS_MANAGED].\n"]
  state : scheduled_query_state option; [@ocaml.doc "The current state of the scheduled query.\n"]
  name : scheduled_query_name option; [@ocaml.doc "The name of the scheduled query.\n"]
  scheduled_query_arn : arn option; [@ocaml.doc "The ARN of the scheduled query.\n"]
}
[@@ocaml.doc
  "Summary information about a scheduled query, including basic configuration and execution status.\n"]

type nonrec scheduled_query_summary_list = scheduled_query_summary list [@@ocaml.doc ""]

type nonrec s3_tables_datasource_name = string [@@ocaml.doc ""]

type nonrec s3_tables_datasource_type = string [@@ocaml.doc ""]

type nonrec s3_tables_integration = {
  datasource_type : s3_tables_datasource_type option;
      [@ocaml.doc "The type of the S3 Tables datasource.\n"]
  datasource_name : s3_tables_datasource_name option;
      [@ocaml.doc "The name of the S3 Tables datasource.\n"]
}
[@@ocaml.doc
  "Contains information about the S3 Tables integration configuration for a configuration template.\n"]

type nonrec s3_table_integration_source_identifier = string [@@ocaml.doc ""]

type nonrec data_source_name = string [@@ocaml.doc ""]

type nonrec data_source_type = string [@@ocaml.doc ""]

type nonrec data_source = {
  type_ : data_source_type option; [@ocaml.doc "The type of the data source.\n"]
  name : data_source_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc
  "Represents a data source that categorizes logs by originating service and log type, providing \
   service-based organization complementing traditional log groups.\n"]

type nonrec s3_table_integration_source_status =
  | DATA_SOURCE_DELETE_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_table_integration_source_status_reason = string [@@ocaml.doc ""]

type nonrec s3_table_integration_source = {
  parent_source_identifier : s3_table_integration_source_identifier option;
      [@ocaml.doc "The identifier of the parent data source for this association.\n"]
  created_time_stamp : timestamp option;
      [@ocaml.doc "The timestamp when the data source association was created.\n"]
  status_reason : s3_table_integration_source_status_reason option;
      [@ocaml.doc "Additional information about the status of the data source association.\n"]
  status : s3_table_integration_source_status option;
      [@ocaml.doc "The current status of the data source association.\n"]
  data_source : data_source option;
      [@ocaml.doc "The data source associated with the S3 Table Integration.\n"]
  identifier : s3_table_integration_source_identifier option;
      [@ocaml.doc "The unique identifier for this data source association.\n"]
}
[@@ocaml.doc
  "Represents a data source association with an S3 Table Integration, including its status and \
   metadata.\n"]

type nonrec s3_table_integration_sources = s3_table_integration_source list [@@ocaml.doc ""]

type nonrec field = string [@@ocaml.doc ""]

type nonrec result_field = {
  value : value option; [@ocaml.doc "The value of this field.\n"]
  field : field option; [@ocaml.doc "The log event field.\n"]
}
[@@ocaml.doc
  "Contains one field from one log event returned by a CloudWatch Logs Insights query, along with \
   the value of that field.\n\n\
  \ For more information about the fields that are generated by CloudWatch logs, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html}Supported \
   Logs and Discovered Fields}.\n\
  \ "]

type nonrec result_rows = result_field list [@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resource_types = resource_type list [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec policy_document = string [@@ocaml.doc ""]

type nonrec policy_scope = RESOURCE [@ocaml.doc ""] | ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec expected_revision_id = string [@@ocaml.doc ""]

type nonrec resource_policy = {
  revision_id : expected_revision_id option;
      [@ocaml.doc
        "The revision ID of the resource policy. Only populated for resource-scoped policies.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs resource to which the resource policy is attached. Only \
         populated for resource-scoped policies.\n"]
  policy_scope : policy_scope option;
      [@ocaml.doc "Specifies scope of the resource policy. Valid values are ACCOUNT or RESOURCE.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc
        "Timestamp showing when this policy was last updated, expressed as the number of \
         milliseconds after [Jan 1, 1970 00:00:00 UTC].\n"]
  policy_document : policy_document option; [@ocaml.doc "The details of the policy.\n"]
  policy_name : policy_name option; [@ocaml.doc "The name of the resource policy.\n"]
}
[@@ocaml.doc "A policy enabling one or more entities to put logs to a log group in this account.\n"]

type nonrec resource_policies = resource_policy list [@@ocaml.doc ""]

type nonrec resource_identifier = string [@@ocaml.doc ""]

type nonrec dashboard_viewer_principals = arn list [@@ocaml.doc ""]

type nonrec collection_retention_days = int [@@ocaml.doc ""]

type nonrec open_search_resource_config = {
  retention_days : collection_retention_days;
      [@ocaml.doc
        "Specify how many days that you want the data derived by OpenSearch Service to be retained \
         in the index that the dashboard refers to. This also sets the maximum time period that \
         you can choose when viewing data in the dashboard. Choosing a longer time frame will \
         incur additional costs. \n"]
  application_arn : arn option;
      [@ocaml.doc
        "If you want to use an existing OpenSearch Service application for your integration with \
         OpenSearch Service, specify it here. If you omit this, a new application will be created.\n"]
  dashboard_viewer_principals : dashboard_viewer_principals;
      [@ocaml.doc
        "Specify the ARNs of IAM roles and IAM users who you want to grant permission to for \
         viewing the dashboards.\n\n\
        \  In addition to specifying these users here, you must also grant them the {b \
         CloudWatchOpenSearchDashboardAccess} IAM policy. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-UserRoles.html}IAM \
         policies for users}.\n\
        \  \n\
        \   "]
  data_source_role_arn : arn;
      [@ocaml.doc
        "Specify the ARN of an IAM role that CloudWatch Logs will use to create the integration. \
         This role must have the permissions necessary to access the OpenSearch Service collection \
         to be able to create the dashboards. For more information about the permissions needed, \
         see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-CreateRole.html}Permissions \
         that the integration needs} in the CloudWatch Logs User Guide.\n"]
  kms_key_arn : arn option;
      [@ocaml.doc
        "To have the vended dashboard data encrypted with KMS instead of the CloudWatch Logs \
         default encryption method, specify the ARN of the KMS key that you want to use.\n"]
}
[@@ocaml.doc
  "This structure contains configuration details about an integration between CloudWatch Logs and \
   OpenSearch Service.\n"]

type nonrec resource_config =
  | OpenSearchResourceConfig of open_search_resource_config
      [@ocaml.doc
        "This structure contains configuration details about an integration between CloudWatch \
         Logs and OpenSearch Service.\n"]
[@@ocaml.doc
  "This structure contains configuration details about an integration between CloudWatch Logs and \
   another entity.\n"]

type nonrec resource_arns = arn list [@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource already exists.\n"]

type nonrec log_event_index = int [@@ocaml.doc ""]

type nonrec rejected_log_events_info = {
  expired_log_event_end_index : log_event_index option; [@ocaml.doc "The expired log events.\n"]
  too_old_log_event_end_index : log_event_index option;
      [@ocaml.doc "The index of the last log event that is too old. This field is exclusive.\n"]
  too_new_log_event_start_index : log_event_index option;
      [@ocaml.doc "The index of the first log event that is too new. This field is inclusive.\n"]
}
[@@ocaml.doc "Represents the rejected events.\n"]

type nonrec entity_rejection_error_type =
  | MISSING_REQUIRED_FIELDS [@ocaml.doc ""]
  | UNSUPPORTED_LOG_GROUP_TYPE [@ocaml.doc ""]
  | ENTITY_SIZE_TOO_LARGE [@ocaml.doc ""]
  | INVALID_ATTRIBUTES [@ocaml.doc ""]
  | INVALID_KEY_ATTRIBUTE [@ocaml.doc ""]
  | INVALID_TYPE_VALUE [@ocaml.doc ""]
  | INVALID_ENTITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rejected_entity_info = {
  error_type : entity_rejection_error_type;
      [@ocaml.doc
        "The type of error that caused the rejection of the entity when calling [PutLogEvents].\n"]
}
[@@ocaml.doc
  "If an entity is rejected when a [PutLogEvents] request was made, this includes details about \
   the reason for the rejection.\n"]

type nonrec records_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec record_field = {
  mandatory : boolean_ option;
      [@ocaml.doc
        "If this is [true], the record field must be present in the [recordFields] parameter \
         provided to a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration} \
         operation.\n"]
  name : field_header option;
      [@ocaml.doc
        "The name to use when specifying this record field in a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration} \
         operation. \n"]
}
[@@ocaml.doc
  "A structure that represents a valid record field header and whether it is mandatory.\n"]

type nonrec query_status =
  | Unknown [@ocaml.doc ""]
  | Timeout [@ocaml.doc ""]
  | Cancelled [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Complete [@ocaml.doc ""]
  | Running [@ocaml.doc ""]
  | Scheduled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_statistics = {
  log_groups_scanned : stats_value option;
      [@ocaml.doc "The number of log groups that were scanned by this query.\n"]
  estimated_bytes_skipped : stats_value option;
      [@ocaml.doc
        "An estimate of the number of bytes in the log events that were skipped when processing \
         this query, because the query contained an indexed field. Skipping these entries lowers \
         query costs and improves the query performance time. For more information about field \
         indexes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html}PutIndexPolicy}.\n"]
  bytes_scanned : stats_value option;
      [@ocaml.doc "The total number of bytes in the log events scanned during the query.\n"]
  estimated_records_skipped : stats_value option;
      [@ocaml.doc
        "An estimate of the number of log events that were skipped when processing this query, \
         because the query contained an indexed field. Skipping these entries lowers query costs \
         and improves the query performance time. For more information about field indexes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html}PutIndexPolicy}.\n"]
  records_scanned : stats_value option;
      [@ocaml.doc "The total number of log events scanned during the query.\n"]
  records_matched : stats_value option;
      [@ocaml.doc "The number of log events that matched the query string.\n"]
}
[@@ocaml.doc
  "Contains the number of log events scanned by the query, the number of log events that matched \
   the query criteria, and the total number of bytes in the log events that were scanned.\n\n\
  \ If the query involved log groups that have field index policies, the estimated number of \
   skipped log events and the total bytes of those skipped log events are included. Using field \
   indexes to skip log events in queries reduces scan volume and improves performance. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html}Create \
   field indexes to improve query performance and reduce scan volume}.\n\
  \ "]

type nonrec query_results = result_rows list [@@ocaml.doc ""]

type nonrec query_parameter_name = string [@@ocaml.doc ""]

type nonrec query_parameter_default_value = string [@@ocaml.doc ""]

type nonrec query_parameter_description = string [@@ocaml.doc ""]

type nonrec query_parameter = {
  description : query_parameter_description option;
      [@ocaml.doc
        "A description of the query parameter that explains its purpose or expected values.\n"]
  default_value : query_parameter_default_value option;
      [@ocaml.doc
        "The default value to use for this query parameter if no value is supplied at execution \
         time.\n"]
  name : query_parameter_name;
      [@ocaml.doc
        "The name of the query parameter. A query parameter name must start with a letter or \
         underscore, and contain only letters, digits, and underscores.\n"]
}
[@@ocaml.doc
  "This structure defines a query parameter for a saved CloudWatch Logs Insights query definition. \
   Query parameters are supported only for Logs Insights QL queries. They are placeholder \
   variables that you can reference in a query string using the [{{parameterName}}] syntax. Each \
   parameter can include a default value and a description.\n"]

type nonrec query_parameter_list = query_parameter list [@@ocaml.doc ""]

type nonrec query_list_max_results = int [@@ocaml.doc ""]

type nonrec query_duration = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec bytes_scanned_value = float [@@ocaml.doc ""]

type nonrec query_info = {
  user_identity : user_identity option; [@ocaml.doc "The ARN of the user who ran the query.\n"]
  bytes_scanned : bytes_scanned_value option;
      [@ocaml.doc
        "The total number of bytes scanned by the query. This indicates the cost associated with \
         the query.\n"]
  query_duration : query_duration option;
      [@ocaml.doc "The duration in milliseconds that the query took to execute.\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc "The name of the log group scanned by this query.\n"]
  create_time : timestamp option; [@ocaml.doc "The date and time that this query was created.\n"]
  status : query_status option;
      [@ocaml.doc
        "The status of this query. Possible values are [Cancelled], [Complete], [Failed], \
         [Running], [Scheduled], and [Unknown].\n"]
  query_string : query_string option; [@ocaml.doc "The query string used in this query.\n"]
  query_id : query_id option; [@ocaml.doc "The unique ID number of this query.\n"]
  query_language : query_language option;
      [@ocaml.doc
        "The query language used for this query. For more information about the query languages \
         that CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc
  "Information about one CloudWatch Logs Insights query that matches the request in a \
   [DescribeQueries] operation. \n"]

type nonrec query_info_list = query_info list [@@ocaml.doc ""]

type nonrec query_definition_string = string [@@ocaml.doc ""]

type nonrec query_definition_name = string [@@ocaml.doc ""]

type nonrec query_definition = {
  parameters : query_parameter_list option;
      [@ocaml.doc
        "If this query definition contains a list of query parameters that define placeholder \
         variables for the query string, that list appears here.\n"]
  log_group_names : log_group_names option;
      [@ocaml.doc
        "If this query definition contains a list of log groups that it is limited to, that list \
         appears here.\n"]
  last_modified : timestamp option;
      [@ocaml.doc "The date that the query definition was most recently modified.\n"]
  query_string : query_definition_string option;
      [@ocaml.doc
        "The query string to use for this definition. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html}CloudWatch \
         Logs Insights Query Syntax}.\n"]
  name : query_definition_name option; [@ocaml.doc "The name of the query definition.\n"]
  query_definition_id : query_id option; [@ocaml.doc "The unique ID of the query definition.\n"]
  query_language : query_language option;
      [@ocaml.doc
        "The query language used for this query. For more information about the query languages \
         that CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc
  "This structure contains details about a saved CloudWatch Logs Insights query definition.\n"]

type nonrec query_definition_list = query_definition list [@@ocaml.doc ""]

type nonrec put_transformer_request = {
  transformer_config : processors;
      [@ocaml.doc
        "This structure contains the configuration of this log transformer. A log transformer is \
         an array of processors, where each processor applies one type of transformation to the \
         log events that are ingested.\n"]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to create the transformer for. \n"]
}
[@@ocaml.doc ""]

type nonrec put_syslog_configuration_request = {
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "The ID of the VPC endpoint to use for syslog ingestion.\n"]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc "The name or ARN of the log group to associate with the syslog configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec put_subscription_filter_request = {
  emit_system_fields : emit_system_fields option;
      [@ocaml.doc
        "A list of system fields to include in the log events sent to the subscription \
         destination. Valid values are [@aws.account] and [@aws.region]. These fields provide \
         source information for centralized log data in the forwarded payload.\n"]
  field_selection_criteria : field_selection_criteria option;
      [@ocaml.doc
        "A filter expression that specifies which log events should be processed by this \
         subscription filter based on system fields such as source account and source region. Uses \
         selection criteria syntax with operators like [=], [!=], [AND], [OR], [IN], [NOT IN]. \
         Example: [@aws.region NOT IN \\[\"cn-north-1\"\\]] or [@aws.account = \"123456789012\" AND\n\
        \        @aws.region = \"us-east-1\"]. Maximum length: 2000 characters.\n"]
  apply_on_transformed_logs : apply_on_transformed_logs option;
      [@ocaml.doc
        "This parameter is valid only for log groups that have an active log transformer. For more \
         information about log transformers, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html}PutTransformer}.\n\n\
        \ If the log group uses either a log-group level or account-level transformer, and you \
         specify [true], the subscription filter will be applied on the transformed version of the \
         log events instead of the original ingested log events.\n\
        \ "]
  distribution : distribution option;
      [@ocaml.doc
        "The method used to distribute log data to the destination. By default, log data is \
         grouped by log stream, but the grouping can be set to random for a more even \
         distribution. This property is only applicable when the destination is an Amazon Kinesis \
         data stream. \n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log \
         events to the destination stream. You don't need to provide the ARN when you are working \
         with a logical destination for cross-account delivery.\n"]
  destination_arn : destination_arn;
      [@ocaml.doc
        "The ARN of the destination to deliver matching log events to. Currently, the supported \
         destinations are:\n\n\
        \ {ul\n\
        \       {-  An Amazon Kinesis stream belonging to the same account as the subscription \
         filter, for same-account delivery.\n\
        \           \n\
        \            }\n\
        \       {-  A logical destination (specified using an ARN) belonging to a different \
         account, for cross-account delivery.\n\
        \           \n\
        \            If you're setting up a cross-account subscription, the destination must have \
         an IAM policy associated with it. The IAM policy must allow the sender to send logs to \
         the destination. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html}PutDestinationPolicy}.\n\
        \            \n\
        \             }\n\
        \       {-  A Kinesis Data Firehose delivery stream belonging to the same account as the \
         subscription filter, for same-account delivery.\n\
        \           \n\
        \            }\n\
        \       {-  A Lambda function belonging to the same account as the subscription filter, \
         for same-account delivery.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  filter_pattern : filter_pattern;
      [@ocaml.doc "A filter pattern for subscribing to a filtered stream of log events.\n"]
  filter_name : filter_name;
      [@ocaml.doc
        "A name for the subscription filter. If you are updating an existing filter, you must \
         specify the correct name in [filterName]. To find the name of the filter currently \
         associated with a log group, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html}DescribeSubscriptionFilters}.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec days = int [@@ocaml.doc ""]

type nonrec put_retention_policy_request = {
  retention_in_days : days; [@ocaml.doc ""]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  revision_id : expected_revision_id option;
      [@ocaml.doc
        "The revision ID of the created or updated resource policy. Only returned for \
         resource-scoped policies.\n"]
  resource_policy : resource_policy option; [@ocaml.doc "The new policy.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  expected_revision_id : expected_revision_id option;
      [@ocaml.doc
        "The expected revision ID of the resource policy. Required when [resourceArn] is provided \
         to prevent concurrent modifications. Use [null] when creating a resource policy for the \
         first time.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs resource to which the resource policy needs to be added or \
         attached. Currently only supports LogGroup ARN.\n"]
  policy_document : policy_document option;
      [@ocaml.doc
        "Details of the new policy, including the identity of the principal that is enabled to put \
         logs to this account. This is formatted as a JSON string. This parameter is required.\n\n\
        \ The following example creates a resource policy enabling the Route 53 service to put DNS \
         query logs in to the specified log group. Replace [\"logArn\"] with the ARN of your \
         CloudWatch Logs resource, such as a log group or log stream.\n\
        \ \n\
        \  CloudWatch Logs also supports \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn}aws:SourceArn} \
         and \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount}aws:SourceAccount} \
         condition context keys.\n\
        \  \n\
        \   In the example resource policy, you would replace the value of [SourceArn] with the \
         resource making the call from Route\194\16053 to CloudWatch Logs. You would also replace \
         the value of [SourceAccount] with the Amazon Web Services account ID making that call.\n\
        \   \n\
        \    \n\
        \    \n\
        \      [{ \"Version\": \"2012-10-17\",\t\t \t \t  \"Statement\": \\[ { \"Sid\":\n\
        \        \"Route53LogsToCloudWatchLogs\", \"Effect\": \"Allow\", \"Principal\": { \
         \"Service\": \\[\n\
        \        \"route53.amazonaws.com\" \\] }, \"Action\": \"logs:PutLogEvents\", \"Resource\": \
         \"logArn\",\n\
        \        \"Condition\": { \"ArnLike\": { \"aws:SourceArn\": \"myRoute53ResourceArn\" }, \
         \"StringEquals\": {\n\
        \        \"aws:SourceAccount\": \"myAwsAccountId\" } } } \\] }] \n\
        \     "]
  policy_name : policy_name option;
      [@ocaml.doc "Name of the new policy. This parameter is required.\n"]
}
[@@ocaml.doc ""]

type nonrec put_query_definition_response = {
  query_definition_id : query_id option; [@ocaml.doc "The ID of the query definition.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec put_query_definition_request = {
  parameters : query_parameter_list option;
      [@ocaml.doc
        "Use this parameter to include specific query parameters as part of your query definition. \
         Query parameters are supported only for Logs Insights QL queries. Query parameters allow \
         you to use placeholder variables in your query string that are substituted with values at \
         execution time. Use the [{{parameterName}}] syntax in your query string to reference a \
         parameter.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Used as an idempotency token, to avoid returning an exception if the service receives the \
         same request twice because of a network error.\n"]
  query_string : query_definition_string;
      [@ocaml.doc
        "The query string to use for this definition. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html}CloudWatch \
         Logs Insights Query Syntax}.\n"]
  log_group_names : log_group_names option;
      [@ocaml.doc
        "Use this parameter to include specific log groups as part of your query definition. If \
         your query uses the OpenSearch Service query language, you specify the log group names \
         inside the [querystring] instead of here.\n\n\
        \ If you are updating an existing query definition for the Logs Insights QL or OpenSearch \
         Service PPL and you omit this parameter, then the updated definition will contain no log \
         groups.\n\
        \ "]
  query_definition_id : query_id option;
      [@ocaml.doc
        "If you are updating a query definition, use this parameter to specify the ID of the query \
         definition that you want to update. You can use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html}DescribeQueryDefinitions} \
         to retrieve the IDs of your saved query definitions.\n\n\
        \ If you are creating a query definition, do not specify this parameter. CloudWatch \
         generates a unique ID for the new query definition and include it in the response to this \
         operation.\n\
        \ "]
  name : query_definition_name;
      [@ocaml.doc
        "A name for the query definition. If you are saving numerous query definitions, we \
         recommend that you name them. This way, you can find the ones you want by using the first \
         part of the name as a filter in the [queryDefinitionNamePrefix] parameter of \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html}DescribeQueryDefinitions}.\n"]
  query_language : query_language option;
      [@ocaml.doc
        "Specify the query language to use for this query. The options are Logs Insights QL, \
         OpenSearch PPL, and OpenSearch SQL. For more information about the query languages that \
         CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_namespace = string [@@ocaml.doc ""]

type nonrec metric_value = string [@@ocaml.doc ""]

type nonrec default_value = float [@@ocaml.doc ""]

type nonrec dimensions_value = string [@@ocaml.doc ""]

type nonrec dimensions_key = string [@@ocaml.doc ""]

type nonrec dimensions = (dimensions_key * dimensions_value) list [@@ocaml.doc ""]

type nonrec metric_transformation = {
  unit_ : standard_unit option;
      [@ocaml.doc
        "The unit to assign to the metric. If you omit this, the unit is set as [None].\n"]
  dimensions : dimensions option;
      [@ocaml.doc
        "The fields to use as dimensions for the metric. One metric filter can include as many as \
         three dimensions.\n\n\
        \  Metrics extracted from log events are charged as custom metrics. To prevent unexpected \
         high charges, do not specify high-cardinality fields such as [IPAddress] or [requestID] \
         as dimensions. Each different value found for a dimension is treated as a separate metric \
         and accrues charges as a separate custom metric. \n\
        \  \n\
        \   CloudWatch Logs disables a metric filter if it generates 1000 different name/value \
         pairs for your specified dimensions within a certain amount of time. This helps to \
         prevent accidental high charges.\n\
        \   \n\
        \    You can also set up a billing alarm to alert you if your charges are higher than \
         expected. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html} \
         Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges}. \n\
        \    \n\
        \     "]
  default_value : default_value option;
      [@ocaml.doc
        "(Optional) The value to emit when a filter pattern does not match a log event. This value \
         can be null.\n"]
  metric_value : metric_value;
      [@ocaml.doc
        "The value to publish to the CloudWatch metric when a filter pattern matches a log event.\n"]
  metric_namespace : metric_namespace;
      [@ocaml.doc
        "A custom namespace to contain your metric in CloudWatch. Use namespaces to group together \
         metrics that are similar. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace}Namespaces}.\n"]
  metric_name : metric_name; [@ocaml.doc "The name of the CloudWatch metric.\n"]
}
[@@ocaml.doc
  "Indicates how to transform ingested log events to metric data in a CloudWatch metric.\n"]

type nonrec metric_transformations = metric_transformation list [@@ocaml.doc ""]

type nonrec put_metric_filter_request = {
  emit_system_field_dimensions : emit_system_fields option;
      [@ocaml.doc
        "A list of system fields to emit as additional dimensions in the generated metrics. Valid \
         values are [@aws.account] and [@aws.region]. These dimensions help identify the source of \
         centralized log data and count toward the total dimension limit for metric filters.\n"]
  field_selection_criteria : field_selection_criteria option;
      [@ocaml.doc
        "A filter expression that specifies which log events should be processed by this metric \
         filter based on system fields such as source account and source region. Uses selection \
         criteria syntax with operators like [=], [!=], [AND], [OR], [IN], [NOT IN]. Example: \
         [@aws.region =\n\
        \        \"us-east-1\"] or [@aws.account IN \\[\"123456789012\", \"987654321098\"\\]]. \
         Maximum length: 2000 characters.\n"]
  apply_on_transformed_logs : apply_on_transformed_logs option;
      [@ocaml.doc
        "This parameter is valid only for log groups that have an active log transformer. For more \
         information about log transformers, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html}PutTransformer}.\n\n\
        \ If the log group uses either a log-group level or account-level transformer, and you \
         specify [true], the metric filter will be applied on the transformed version of the log \
         events instead of the original ingested log events.\n\
        \ "]
  metric_transformations : metric_transformations;
      [@ocaml.doc "A collection of information that defines how metric data gets emitted.\n"]
  filter_pattern : filter_pattern;
      [@ocaml.doc "A filter pattern for extracting metric data out of ingested log events.\n"]
  filter_name : filter_name; [@ocaml.doc "A name for the metric filter.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec deletion_protection_enabled = bool [@@ocaml.doc ""]

type nonrec put_log_group_deletion_protection_request = {
  deletion_protection_enabled : deletion_protection_enabled;
      [@ocaml.doc
        "Whether to enable deletion protection.\n\n Type: Boolean\n \n  Required: Yes\n  "]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "The name or ARN of the log group.\n\n\
        \ Type: String\n\
        \ \n\
        \  Length Constraints: Minimum length of 1. Maximum length of 512.\n\
        \  \n\
        \   Pattern: [\\[\\.\\-_/#A-Za-z0-9\\]+] \n\
        \   \n\
        \    Required: Yes\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec put_log_events_response = {
  rejected_entity_info : rejected_entity_info option;
      [@ocaml.doc
        "Information about why the entity is rejected when calling [PutLogEvents]. Only returned \
         when the entity is rejected.\n\n\
        \  When the entity is rejected, the events may still be accepted.\n\
        \  \n\
        \   "]
  rejected_log_events_info : rejected_log_events_info option; [@ocaml.doc "The rejected events.\n"]
  next_sequence_token : sequence_token option;
      [@ocaml.doc
        "The next sequence token.\n\n\
        \  This field has been deprecated.\n\
        \  \n\
        \   The sequence token is now ignored in [PutLogEvents] actions. [PutLogEvents] actions \
         are always accepted even if the sequence token is not valid. You can use parallel \
         [PutLogEvents] actions on the same log stream and you do not need to wait for the \
         response of a previous [PutLogEvents] action to obtain the [nextSequenceToken] value.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec input_log_event = {
  message : event_message;
      [@ocaml.doc "The raw event message. Each log event can be no larger than 1 MB.\n"]
  timestamp : timestamp;
      [@ocaml.doc
        "The time the event occurred, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC].\n"]
}
[@@ocaml.doc
  "Represents a log event, which is a record of activity that was recorded by the application or \
   resource being monitored.\n"]

type nonrec input_log_events = input_log_event list [@@ocaml.doc ""]

type nonrec entity_key_attributes_value = string [@@ocaml.doc ""]

type nonrec entity_key_attributes_key = string [@@ocaml.doc ""]

type nonrec entity_key_attributes = (entity_key_attributes_key * entity_key_attributes_value) list
[@@ocaml.doc ""]

type nonrec entity_attributes_value = string [@@ocaml.doc ""]

type nonrec entity_attributes_key = string [@@ocaml.doc ""]

type nonrec entity_attributes = (entity_attributes_key * entity_attributes_value) list
[@@ocaml.doc ""]

type nonrec entity = {
  attributes : entity_attributes option;
      [@ocaml.doc
        "Additional attributes of the entity that are not used to specify the identity of the \
         entity. A list of key-value pairs.\n\n\
        \ For details about how to use the attributes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html}How \
         to add related information to telemetry} in the {i CloudWatch User Guide}.\n\
        \ "]
  key_attributes : entity_key_attributes option;
      [@ocaml.doc
        "The attributes of the entity which identify the specific entity, as a list of key-value \
         pairs. Entities with the same [keyAttributes] are considered to be the same entity.\n\n\
        \ There are five allowed attributes (key names): [Type], [ResourceType], [Identifier] \
         [Name], and [Environment].\n\
        \ \n\
        \  For details about how to use the key attributes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html}How \
         to add related information to telemetry} in the {i CloudWatch User Guide}.\n\
        \  "]
}
[@@ocaml.doc "The entity associated with the log events in a [PutLogEvents] call.\n"]

type nonrec put_log_events_request = {
  entity : entity option; [@ocaml.doc "The entity associated with the log events.\n"]
  sequence_token : sequence_token option;
      [@ocaml.doc
        "The sequence token obtained from the response of the previous [PutLogEvents] call.\n\n\
        \  The [sequenceToken] parameter is now ignored in [PutLogEvents] actions. [PutLogEvents] \
         actions are now accepted and never return [InvalidSequenceTokenException] or \
         [DataAlreadyAcceptedException] even if the sequence token is not valid.\n\
        \  \n\
        \   "]
  log_events : input_log_events; [@ocaml.doc "The log events.\n"]
  log_stream_name : log_stream_name; [@ocaml.doc "The name of the log stream.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_sequence_token_exception = {
  message : message option; [@ocaml.doc ""]
  expected_sequence_token : sequence_token option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The sequence token is not valid. You can get the correct sequence token in the \
   [expectedSequenceToken] field in the [InvalidSequenceTokenException] message. \n\n\
  \   [PutLogEvents] actions are now always accepted and never return \
   [InvalidSequenceTokenException] regardless of receiving an invalid sequence token. \n\
  \  \n\
  \   "]

type nonrec data_already_accepted_exception = {
  message : message option; [@ocaml.doc ""]
  expected_sequence_token : sequence_token option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The event was already logged.\n\n\
  \   [PutLogEvents] actions are now always accepted and never return \
   [DataAlreadyAcceptedException] regardless of whether a given batch of log events has already \
   been accepted. \n\
  \  \n\
  \   "]

type nonrec integration_name = string [@@ocaml.doc ""]

type nonrec integration_status =
  | FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec put_integration_response = {
  integration_status : integration_status option;
      [@ocaml.doc
        "The status of the integration that you just created.\n\n\
        \ After you create an integration, it takes a few minutes to complete. During this time, \
         you'll see the status as [PROVISIONING].\n\
        \ "]
  integration_name : integration_name option;
      [@ocaml.doc "The name of the integration that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_type = OPENSEARCH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec put_integration_request = {
  integration_type : integration_type;
      [@ocaml.doc "The type of integration. Currently, the only supported type is [OPENSEARCH].\n"]
  resource_config : resource_config;
      [@ocaml.doc
        "A structure that contains configuration information for the integration that you are \
         creating.\n"]
  integration_name : integration_name; [@ocaml.doc "A name for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec index_source = LOG_GROUP [@ocaml.doc ""] | ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec index_policy = {
  source : index_source option;
      [@ocaml.doc
        "This field indicates whether this is an account-level index policy or an index policy \
         that applies only to a single log group.\n"]
  policy_name : policy_name option;
      [@ocaml.doc
        "The name of this policy. Responses about log group-level field index policies don't have \
         this field, because those policies don't have names.\n"]
  policy_document : policy_document option;
      [@ocaml.doc "The policy document for this index policy, in JSON format.\n"]
  last_update_time : timestamp option;
      [@ocaml.doc "The date and time that this index policy was most recently updated.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The ARN of the log group that this index policy applies to.\n"]
}
[@@ocaml.doc "This structure contains information about one field index policy in this account.\n"]

type nonrec put_index_policy_response = {
  index_policy : index_policy option;
      [@ocaml.doc "The index policy that you just created or updated.\n"]
}
[@@ocaml.doc ""]

type nonrec put_index_policy_request = {
  policy_document : policy_document;
      [@ocaml.doc
        "The index policy document, in JSON format. The following is an example of an index policy \
         document that creates indexes with different types.\n\n\
        \  [\"policyDocument\": \"{\"Fields\": \\[ \"TransactionId\" \\], \"FieldsV2\": \
         {\"RequestId\":\n\
        \        {\"type\": \"FIELD_INDEX\"}, \"APIName\": {\"type\": \"FACET\"}, \"StatusCode\": \
         {\"type\":\n\
        \        \"FACET\"}}}\"] \n\
        \ \n\
        \  You can use [FieldsV2] to specify the type for each field. Supported types are \
         [FIELD_INDEX] and [FACET]. Field names within [Fields] and [FieldsV2] must be mutually \
         exclusive.\n\
        \  \n\
        \   The policy document must include at least one field index. For more information about \
         the fields that can be included and other restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax.html}Field \
         index syntax and quotas}.\n\
        \   "]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "Specify either the log group name or log group ARN to apply this field index policy to. \
         If you specify an ARN, use the format arn:aws:logs:{i region}:{i account-id}:log-group:{i \
         log_group_name} Don't include an * at the end.\n"]
}
[@@ocaml.doc ""]

type nonrec destination_name = string [@@ocaml.doc ""]

type nonrec access_policy = string [@@ocaml.doc ""]

type nonrec destination = {
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the destination, expressed as the number of milliseconds after Jan \
         1, 1970 00:00:00 UTC.\n"]
  arn : arn option; [@ocaml.doc "The ARN of this destination.\n"]
  access_policy : access_policy option;
      [@ocaml.doc
        "An IAM policy document that governs which Amazon Web Services accounts can create \
         subscription filters against this destination.\n"]
  role_arn : role_arn option;
      [@ocaml.doc "A role for impersonation, used when delivering log events to the target.\n"]
  target_arn : target_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the physical target where the log events are delivered \
         (for example, a Kinesis stream).\n"]
  destination_name : destination_name option; [@ocaml.doc "The name of the destination.\n"]
}
[@@ocaml.doc "Represents a cross-account destination that receives subscription log events.\n"]

type nonrec put_destination_response = {
  destination : destination option; [@ocaml.doc "The destination.\n"]
}
[@@ocaml.doc ""]

type nonrec put_destination_request = {
  tags : tags option;
      [@ocaml.doc
        "An optional list of key-value pairs to associate with the resource.\n\n\
        \ For more information about tagging, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources} \n\
        \ "]
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis \
         [PutRecord] operation on the destination stream.\n"]
  target_arn : target_arn;
      [@ocaml.doc "The ARN of an Amazon Kinesis stream to which to deliver matching log events.\n"]
  destination_name : destination_name; [@ocaml.doc "A name for the destination.\n"]
}
[@@ocaml.doc ""]

type nonrec force_update = bool [@@ocaml.doc ""]

type nonrec put_destination_policy_request = {
  force_update : force_update option;
      [@ocaml.doc
        "Specify true if you are updating an existing destination policy to grant permission to an \
         organization ID instead of granting permission to individual Amazon Web Services \
         accounts. Before you update a destination policy this way, you must first update the \
         subscription filters in the accounts that send logs to this destination. If you do not, \
         the subscription filters might stop working. By specifying [true] for [forceUpdate], you \
         are affirming that you have already updated the subscription filters. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html} \
         Updating an existing cross-account subscription} \n\n\
        \ If you omit this parameter, the default of [false] is used.\n\
        \ "]
  access_policy : access_policy;
      [@ocaml.doc
        "An IAM policy document that authorizes cross-account users to deliver their log events to \
         the associated destination. This can be up to 5120 bytes.\n"]
  destination_name : destination_name; [@ocaml.doc "A name for an existing destination.\n"]
}
[@@ocaml.doc ""]

type nonrec delivery_source_name = string [@@ocaml.doc ""]

type nonrec log_type = string [@@ocaml.doc ""]

type nonrec delivery_source_configuration_value = string [@@ocaml.doc ""]

type nonrec delivery_source_configuration_key = string [@@ocaml.doc ""]

type nonrec delivery_source_configuration =
  (delivery_source_configuration_key * delivery_source_configuration_value) list
[@@ocaml.doc ""]

type nonrec delivery_source_status = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_source_status_reason = RESOURCE_DELETED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec delivery_source = {
  status_reason : delivery_source_status_reason option;
      [@ocaml.doc
        "The reason for the status of the delivery source. A status reason of [RESOURCE_DELETED] \
         indicates that the resource associated with the delivery source has been deleted. Note: \
         This value is defined for selective log types.\n"]
  status : delivery_source_status option;
      [@ocaml.doc
        "The status of the delivery source. A delivery source can have the status [ACTIVE] or \
         [INACTIVE]. Note: This value is defined for selective log types.\n"]
  delivery_source_configuration : delivery_source_configuration option;
      [@ocaml.doc "The map of key-value pairs that configure the delivery source.\n"]
  tags : tags option; [@ocaml.doc "The tags that have been assigned to this delivery source.\n"]
  log_type : log_type option;
      [@ocaml.doc
        "The type of log that the source is sending. For valid values for this parameter, see the \
         documentation for the source service.\n"]
  service : service option; [@ocaml.doc "The Amazon Web Services service that is sending logs.\n"]
  resource_arns : resource_arns option;
      [@ocaml.doc
        "This array contains the ARN of the Amazon Web Services resource that sends logs and is \
         represented by this delivery source. Currently, only one ARN can be in the array.\n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies this delivery source.\n"]
  name : delivery_source_name option; [@ocaml.doc "The unique name of the delivery source.\n"]
}
[@@ocaml.doc
  "This structure contains information about one {i delivery source} in your account. A delivery \
   source is an Amazon Web Services resource that sends logs to an Amazon Web Services \
   destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose.\n\n\
  \ Only some Amazon Web Services services support being configured as a delivery source. These \
   services are listed as {b Supported \\[V2 Permissions\\]} in the table at \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
   logging from Amazon Web Services services.} \n\
  \ \n\
  \  To configure logs delivery between a supported Amazon Web Services service and a destination, \
   you must do the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  Create a delivery source, which is a logical object that represents the resource \
   that is actually sending the logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n\
  \             \n\
  \              }\n\
  \         {-  Create a {i delivery destination}, which is a logical object that represents the \
   actual delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html}PutDeliveryDestination}.\n\
  \             \n\
  \              }\n\
  \         {-  If you are delivering logs cross-account, you must use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy} \
   in the destination account to assign an IAM policy to the destination. This policy allows \
   delivery to that destination. \n\
  \             \n\
  \              }\n\
  \         {-  Create a {i delivery} by pairing exactly one delivery source and one delivery \
   destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can configure a single delivery source to send logs to multiple destinations by creating \
   multiple deliveries. You can also create multiple deliveries to configure multiple delivery \
   sources to send logs to the same delivery destination.\n\
  \   "]

type nonrec put_delivery_source_response = {
  delivery_source : delivery_source option;
      [@ocaml.doc
        "A structure containing information about the delivery source that was just created or \
         updated.\n"]
}
[@@ocaml.doc ""]

type nonrec put_delivery_source_request = {
  delivery_source_configuration : delivery_source_configuration option;
      [@ocaml.doc
        "A map of key-value pairs to configure the delivery source. Both keys and values must be \
         between 1 and 255 characters in length. For example, [{\"samplingRate\": \"50\"}].\n"]
  tags : tags option;
      [@ocaml.doc
        "An optional list of key-value pairs to associate with the resource.\n\n\
        \ For more information about tagging, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources} \n\
        \ "]
  log_type : log_type;
      [@ocaml.doc
        "Defines the type of log that the source is sending.\n\n\
        \ {ul\n\
        \       {-  For Amazon Bedrock Agents, the valid values are [APPLICATION_LOGS] and \
         [EVENT_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock Knowledge Bases, the valid value is [APPLICATION_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Runtime, the valid values are [APPLICATION_LOGS], \
         [USAGE_LOGS] and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Tools, the valid values are [APPLICATION_LOGS], \
         [USAGE_LOGS] and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Identity, the valid values are [APPLICATION_LOGS] \
         and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Memory, the valid values are [APPLICATION_LOGS] \
         and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Gateway, the valid values are [APPLICATION_LOGS] \
         and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Bedrock AgentCore Payments, the valid values are [APPLICATION_LOGS] \
         and [TRACES].\n\
        \           \n\
        \            }\n\
        \       {-  For CloudFront, the valid value is [ACCESS_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For DevOps Agent, the valid value is [APPLICATION_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon CodeWhisperer, the valid value is [EVENT_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Elemental MediaPackage, the valid values are [EGRESS_ACCESS_LOGS] and \
         [INGRESS_ACCESS_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Elemental MediaTailor, the valid values are [AD_DECISION_SERVER_LOGS], \
         [MANIFEST_SERVICE_LOGS], and [TRANSCODE_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon EKS Auto Mode, the valid values are [AUTO_MODE_BLOCK_STORAGE_LOGS], \
         [AUTO_MODE_COMPUTE_LOGS], [AUTO_MODE_IPAM_LOGS], and [AUTO_MODE_LOAD_BALANCING_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon EKS Capability Logs, the valid values are \
         [EKS_CAPABILITY_ACK_LOGS], [EKS_CAPABILITY_ARGOCD_APPLICATION_LOGS], \
         [EKS_CAPABILITY_ARGOCD_APPLICATIONSET_LOGS], [EKS_CAPABILITY_ARGOCD_COMMITSERVER_LOGS], \
         [EKS_CAPABILITY_ARGOCD_REPOSERVER_LOGS], [EKS_CAPABILITY_ARGOCD_SERVER_LOGS], and \
         [EKS_CAPABILITY_KRO_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Entity Resolution, the valid value is [WORKFLOW_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For IAM Identity Center, the valid value is [ERROR_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Network Firewall Proxy, the valid values are [ALERT_LOGS], [ALLOW_LOGS], \
         and [DENY_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Network Load Balancer, the valid value is [NLB_ACCESS_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For PCS, the valid values are [PCS_SCHEDULER_LOGS], [PCS_JOBCOMP_LOGS], and \
         [PCS_SCHEDULER_AUDIT_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Quick, the valid values are [AGENT_HOURS_LOGS], [CHAT_LOGS], \
         [FEEDBACK_LOGS], and [INDEX_USAGE_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Web Services RTB Fabric, the valid values is [APPLICATION_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Q, the valid values are [EVENT_LOGS] and [SYNC_JOB_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Web Services Security Hub CSPM, the valid value is \
         [SECURITY_FINDING_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon Web Services Security Hub, the valid value is \
         [SECURITY_FINDING_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon SES mail manager, the valid values are [APPLICATION_LOGS] and \
         [TRAFFIC_POLICY_DEBUG_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon WorkMail, the valid values are [ACCESS_CONTROL_LOGS], \
         [AUTHENTICATION_LOGS], [WORKMAIL_AVAILABILITY_PROVIDER_LOGS], \
         [WORKMAIL_MAILBOX_ACCESS_LOGS], and [WORKMAIL_PERSONAL_ACCESS_TOKEN_LOGS].\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon VPC Route Server, the valid value is [EVENT_LOGS].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_arn : arn;
      [@ocaml.doc
        "The ARN of the Amazon Web Services resource that is generating and sending logs. For \
         example, \
         [arn:aws:workmail:us-east-1:123456789012:organization/m-1234EXAMPLEabcd1234abcd1234abcd1234] \
         \n\n\
        \ For the [SECURITY_FINDING_LOGS] logType, use a wildcard ARN for the hub resource. For \
         Amazon Web Services Security Hub CSPM, use \
         [arn:aws:securityhub:us-east-1:111122223333:hub/*] and for Amazon Web Services Security \
         Hub, use [arn:aws:securityhub:us-east-1:111122223333:hubv2/*] \n\
        \ "]
  name : delivery_source_name;
      [@ocaml.doc
        "A name for this delivery source. This name must be unique for all delivery sources in \
         your account.\n"]
}
[@@ocaml.doc ""]

type nonrec delivery_destination_name = string [@@ocaml.doc ""]

type nonrec delivery_destination_type =
  | XRAY [@ocaml.doc ""]
  | FH [@ocaml.doc ""]
  | CWL [@ocaml.doc ""]
  | S3 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec output_format =
  | PARQUET [@ocaml.doc ""]
  | RAW [@ocaml.doc ""]
  | W3C [@ocaml.doc ""]
  | PLAIN [@ocaml.doc ""]
  | JSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_destination_configuration = {
  destination_resource_arn : arn;
      [@ocaml.doc
        "The ARN of the Amazon Web Services destination that this delivery destination represents. \
         That Amazon Web Services destination can be a log group in CloudWatch Logs, an Amazon S3 \
         bucket, or a delivery stream in Firehose.\n"]
}
[@@ocaml.doc "A structure that contains information about one logs delivery destination.\n"]

type nonrec delivery_destination = {
  tags : tags option;
      [@ocaml.doc "The tags that have been assigned to this delivery destination.\n"]
  delivery_destination_configuration : delivery_destination_configuration option;
      [@ocaml.doc
        "A structure that contains the ARN of the Amazon Web Services resource that will receive \
         the logs.\n"]
  output_format : output_format option;
      [@ocaml.doc "The format of the logs that are sent to this delivery destination. \n"]
  delivery_destination_type : delivery_destination_type option;
      [@ocaml.doc
        "Displays whether this delivery destination is CloudWatch Logs, Amazon S3, Firehose, or \
         X-Ray.\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies this delivery destination.\n"]
  name : delivery_destination_name option; [@ocaml.doc "The name of this delivery destination.\n"]
}
[@@ocaml.doc
  "This structure contains information about one {i delivery destination} in your account. A \
   delivery destination is an Amazon Web Services resource that represents an Amazon Web Services \
   service that logs can be sent to. CloudWatch Logs, Amazon S3, Firehose, and X-Ray are supported \
   as delivery destinations.\n\n\
  \ To configure logs delivery between a supported Amazon Web Services service and a destination, \
   you must do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Create a delivery source, which is a logical object that represents the resource \
   that is actually sending the logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n\
  \            \n\
  \             }\n\
  \        {-  Create a {i delivery destination}, which is a logical object that represents the \
   actual delivery destination. \n\
  \            \n\
  \             }\n\
  \        {-  If you are delivering logs cross-account, you must use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy} \
   in the destination account to assign an IAM policy to the destination. This policy allows \
   delivery to that destination. \n\
  \            \n\
  \             }\n\
  \        {-  Create a {i delivery} by pairing exactly one delivery source and one delivery \
   destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can configure a single delivery source to send logs to multiple destinations by creating \
   multiple deliveries. You can also create multiple deliveries to configure multiple delivery \
   sources to send logs to the same delivery destination.\n\
  \   "]

type nonrec put_delivery_destination_response = {
  delivery_destination : delivery_destination option;
      [@ocaml.doc
        "A structure containing information about the delivery destination that you just created \
         or updated.\n"]
}
[@@ocaml.doc ""]

type nonrec put_delivery_destination_request = {
  tags : tags option;
      [@ocaml.doc
        "An optional list of key-value pairs to associate with the resource.\n\n\
        \ For more information about tagging, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources} \n\
        \ "]
  delivery_destination_type : delivery_destination_type option;
      [@ocaml.doc
        "The type of delivery destination. This parameter specifies the target service where log \
         data will be delivered. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [S3] - Amazon S3 for long-term storage and analytics\n\
        \           \n\
        \            }\n\
        \       {-   [CWL] - CloudWatch Logs for centralized log management\n\
        \           \n\
        \            }\n\
        \       {-   [FH] - Amazon Kinesis Data Firehose for real-time data streaming\n\
        \           \n\
        \            }\n\
        \       {-   [XRAY] - Amazon Web Services X-Ray for distributed tracing and application \
         monitoring\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The delivery destination type determines the format and configuration options \
         available for log delivery.\n\
        \   "]
  delivery_destination_configuration : delivery_destination_configuration option;
      [@ocaml.doc
        "A structure that contains the ARN of the Amazon Web Services resource that will receive \
         the logs.\n\n\
        \   [deliveryDestinationConfiguration] is required for CloudWatch Logs, Amazon S3, \
         Firehose log delivery destinations and not required for X-Ray trace delivery \
         destinations. [deliveryDestinationType] is needed for X-Ray trace delivery destinations \
         but not required for other logs delivery destinations.\n\
        \  \n\
        \   "]
  output_format : output_format option;
      [@ocaml.doc "The format for the logs that this delivery destination will receive.\n"]
  name : delivery_destination_name;
      [@ocaml.doc
        "A name for this delivery destination. This name must be unique for all delivery \
         destinations in your account.\n"]
}
[@@ocaml.doc ""]

type nonrec delivery_destination_policy = string [@@ocaml.doc ""]

type nonrec policy = {
  delivery_destination_policy : delivery_destination_policy option;
      [@ocaml.doc "The contents of the delivery destination policy.\n"]
}
[@@ocaml.doc "A structure that contains information about one delivery destination policy.\n"]

type nonrec put_delivery_destination_policy_response = {
  policy : policy option; [@ocaml.doc "The contents of the policy that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec put_delivery_destination_policy_request = {
  delivery_destination_policy : delivery_destination_policy;
      [@ocaml.doc "The contents of the policy.\n"]
  delivery_destination_name : delivery_destination_name;
      [@ocaml.doc "The name of the delivery destination to assign this policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec data_protection_policy_document = string [@@ocaml.doc ""]

type nonrec put_data_protection_policy_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The date and time that this policy was most recently updated.\n"]
  policy_document : data_protection_policy_document option;
      [@ocaml.doc "The data protection policy used for this log group.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The log group name or ARN that you specified in your request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_data_protection_policy_request = {
  policy_document : data_protection_policy_document;
      [@ocaml.doc
        "Specify the data protection policy, in JSON.\n\n\
        \ This policy must include two JSON blocks:\n\
        \ \n\
        \  {ul\n\
        \        {-  The first block must include both a [DataIdentifer] array and an [Operation] \
         property with an [Audit] action. The [DataIdentifer] array lists the types of sensitive \
         data that you want to mask. For more information about the available options, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html}Types \
         of data that you can mask}.\n\
        \            \n\
        \             The [Operation] property with an [Audit] action is required to find the \
         sensitive data terms. This [Audit] action must contain a [FindingsDestination] object. \
         You can optionally use that [FindingsDestination] object to list one or more destinations \
         to send audit findings to. If you specify destinations such as log groups, Firehose \
         streams, and S3 buckets, they must already exist.\n\
        \             \n\
        \              }\n\
        \        {-  The second block must include both a [DataIdentifer] array and an [Operation] \
         property with an [Deidentify] action. The [DataIdentifer] array must exactly match the \
         [DataIdentifer] array in the first block of the policy.\n\
        \            \n\
        \             The [Operation] property with the [Deidentify] action is what actually masks \
         the data, and it must contain the [ \"MaskConfig\": {}] object. The [ \"MaskConfig\": {}] \
         object must be empty.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \   For an example data protection policy, see the {b Examples} section on this page.\n\
        \   \n\
        \     The contents of the two [DataIdentifer] arrays must match exactly.\n\
        \     \n\
        \       In addition to the two JSON blocks, the [policyDocument] can also include [Name], \
         [Description], and [Version] fields. The [Name] is used as a dimension when CloudWatch \
         Logs reports audit findings metrics to CloudWatch.\n\
        \       \n\
        \        The JSON specified in [policyDocument] can be up to 30,720 characters.\n\
        \        "]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc "Specify either the log group name or log group ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec bearer_token_authentication_enabled = bool [@@ocaml.doc ""]

type nonrec put_bearer_token_authentication_request = {
  bearer_token_authentication_enabled : bearer_token_authentication_enabled;
      [@ocaml.doc
        "Whether to enable bearer token authentication.\n\n Type: Boolean\n \n  Required: Yes\n  "]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "The name or ARN of the log group.\n\n\
        \ Type: String\n\
        \ \n\
        \  Length Constraints: Minimum length of 1. Maximum length of 512.\n\
        \  \n\
        \   Pattern: [\\[\\.\\-_/#A-Za-z0-9\\]+] \n\
        \   \n\
        \    Required: Yes\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec account_policy_document = string [@@ocaml.doc ""]

type nonrec policy_type =
  | METRIC_EXTRACTION_POLICY [@ocaml.doc ""]
  | TRANSFORMER_POLICY [@ocaml.doc ""]
  | FIELD_INDEX_POLICY [@ocaml.doc ""]
  | SUBSCRIPTION_FILTER_POLICY [@ocaml.doc ""]
  | DATA_PROTECTION_POLICY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_policy = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID that the policy applies to.\n"]
  selection_criteria : selection_criteria option;
      [@ocaml.doc "The log group selection criteria that is used for this policy.\n"]
  scope : scope option; [@ocaml.doc "The scope of the account policy.\n"]
  policy_type : policy_type option; [@ocaml.doc "The type of policy for this account policy.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The date and time that this policy was most recently updated.\n"]
  policy_document : account_policy_document option;
      [@ocaml.doc
        "The policy document for this account policy.\n\n\
        \ The JSON specified in [policyDocument] can be up to 30,720 characters.\n\
        \ "]
  policy_name : policy_name option; [@ocaml.doc "The name of the account policy.\n"]
}
[@@ocaml.doc "A structure that contains information about one CloudWatch Logs account policy.\n"]

type nonrec put_account_policy_response = {
  account_policy : account_policy option; [@ocaml.doc "The account policy that you created.\n"]
}
[@@ocaml.doc ""]

type nonrec put_account_policy_request = {
  selection_criteria : selection_criteria option;
      [@ocaml.doc
        "Use this parameter to apply the new policy to a subset of log groups in the account or a \
         data source name and type combination. \n\n\
        \ Specifying [selectionCriteria] is valid only when you specify \
         [SUBSCRIPTION_FILTER_POLICY], [FIELD_INDEX_POLICY] or [TRANSFORMER_POLICY]for \
         [policyType].\n\
        \ \n\
        \  {ul\n\
        \        {-  If [policyType] is [SUBSCRIPTION_FILTER_POLICY], the only supported \
         [selectionCriteria] filter is [LogGroupName NOT IN\n\
        \          \\[\\]] \n\
        \            \n\
        \             }\n\
        \        {-  If [policyType] is [TRANSFORMER_POLICY], the only supported \
         [selectionCriteria] filter is [LogGroupNamePrefix] \n\
        \            \n\
        \             }\n\
        \        {-  If [policyType] is [FIELD_INDEX_POLICY], the supported [selectionCriteria] \
         filters are:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [LogGroupNamePrefix] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [DataSourceName] AND [DataSourceType] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          When you specify [selectionCriteria] for a field index policy you can use \
         either [LogGroupNamePrefix] by itself or [DataSourceName] and [DataSourceType] together.\n\
        \          \n\
        \           }\n\
        \        }\n\
        \   The [selectionCriteria] string can be up to 25KB in length. The length is determined \
         by using its UTF-8 bytes.\n\
        \   \n\
        \    Using the [selectionCriteria] parameter with [SUBSCRIPTION_FILTER_POLICY] is useful \
         to help prevent infinite loops. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions-recursion-prevention.html}Log \
         recursion prevention}.\n\
        \    "]
  scope : scope option;
      [@ocaml.doc
        "Currently the only valid value for this parameter is [ALL], which specifies that the data \
         protection policy applies to all log groups in the account. If you omit this parameter, \
         the default of [ALL] is used.\n"]
  policy_type : policy_type; [@ocaml.doc "The type of policy that you're creating or updating.\n"]
  policy_document : account_policy_document;
      [@ocaml.doc
        "Specify the policy, in JSON.\n\n\
        \  {b Data protection policy} \n\
        \ \n\
        \  A data protection policy must include two JSON blocks:\n\
        \  \n\
        \   {ul\n\
        \         {-  The first block must include both a [DataIdentifer] array and an [Operation] \
         property with an [Audit] action. The [DataIdentifer] array lists the types of sensitive \
         data that you want to mask. For more information about the available options, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html}Types \
         of data that you can mask}.\n\
        \             \n\
        \              The [Operation] property with an [Audit] action is required to find the \
         sensitive data terms. This [Audit] action must contain a [FindingsDestination] object. \
         You can optionally use that [FindingsDestination] object to list one or more destinations \
         to send audit findings to. If you specify destinations such as log groups, Firehose \
         streams, and S3 buckets, they must already exist.\n\
        \              \n\
        \               }\n\
        \         {-  The second block must include both a [DataIdentifer] array and an \
         [Operation] property with an [Deidentify] action. The [DataIdentifer] array must exactly \
         match the [DataIdentifer] array in the first block of the policy.\n\
        \             \n\
        \              The [Operation] property with the [Deidentify] action is what actually \
         masks the data, and it must contain the [ \"MaskConfig\": {}] object. The [ \
         \"MaskConfig\": {}] object must be empty.\n\
        \              \n\
        \               }\n\
        \         }\n\
        \   For an example data protection policy, see the {b Examples} section on this page.\n\
        \   \n\
        \     The contents of the two [DataIdentifer] arrays must match exactly.\n\
        \     \n\
        \       In addition to the two JSON blocks, the [policyDocument] can also include [Name], \
         [Description], and [Version] fields. The [Name] is different than the operation's \
         [policyName] parameter, and is used as a dimension when CloudWatch Logs reports audit \
         findings metrics to CloudWatch.\n\
        \       \n\
        \        The JSON specified in [policyDocument] can be up to 30,720 characters long.\n\
        \        \n\
        \          {b Subscription filter policy} \n\
        \         \n\
        \          A subscription filter policy can include the following attributes in a JSON \
         block:\n\
        \          \n\
        \           {ul\n\
        \                 {-   {b DestinationArn} The ARN of the destination to deliver log events \
         to. Supported destinations are:\n\
        \                     \n\
        \                      {ul\n\
        \                            {-  An Kinesis Data Streams data stream in the same account \
         as the subscription policy, for same-account delivery.\n\
        \                                \n\
        \                                 }\n\
        \                            {-  An Firehose data stream in the same account as the \
         subscription policy, for same-account delivery.\n\
        \                                \n\
        \                                 }\n\
        \                            {-  A Lambda function in the same account as the subscription \
         policy, for same-account delivery.\n\
        \                                \n\
        \                                 }\n\
        \                            {-  A logical destination in a different account created with \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html}PutDestination}, \
         for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical \
         destinations.\n\
        \                                \n\
        \                                 }\n\
        \                            \n\
        \                  }\n\
        \                   }\n\
        \                 {-   {b RoleArn} The ARN of an IAM role that grants CloudWatch Logs \
         permissions to deliver ingested log events to the destination stream. You don't need to \
         provide the ARN when you are working with a logical destination for cross-account \
         delivery.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {b FilterPattern} A filter pattern for subscribing to a filtered \
         stream of log events.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {b Distribution} The method used to distribute log data to the \
         destination. By default, log data is grouped by log stream, but the grouping can be set \
         to [Random] for a more even distribution. This property is only applicable when the \
         destination is an Kinesis Data Streams data stream.\n\
        \                     \n\
        \                      }\n\
        \                 }\n\
        \    {b Transformer policy} \n\
        \   \n\
        \    A transformer policy must include one JSON block with the array of processors and \
         their configurations. For more information about available processors, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors} \
         Processors that you can use}. \n\
        \    \n\
        \      {b Field index policy} \n\
        \     \n\
        \      A field index filter policy can include the following attribute in a JSON block:\n\
        \      \n\
        \       {ul\n\
        \             {-   {b Fields} The array of field indexes to create.\n\
        \                 \n\
        \                  }\n\
        \             {-   {b FieldsV2} The object of field indexes to create along with it's type.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \   It must contain at least one field index.\n\
        \   \n\
        \    The following is an example of an index policy document that creates indexes with \
         different types.\n\
        \    \n\
        \      [\"policyDocument\": \"{ \\\"Fields\\\": \\[ \\\"TransactionId\\\" \\], \
         \\\"FieldsV2\\\":\n\
        \        {\\\"RequestId\\\": {\\\"type\\\": \\\"FIELD_INDEX\\\"}, \\\"APIName\\\": \
         {\\\"type\\\": \\\"FACET\\\"},\n\
        \        \\\"StatusCode\\\": {\\\"type\\\": \\\"FACET\\\"}}}\"] \n\
        \     \n\
        \      You can use [FieldsV2] to specify the type for each field. Supported types are \
         [FIELD_INDEX] and [FACET]. Field names within [Fields] and [FieldsV2] must be mutually \
         exclusive.\n\
        \      "]
  policy_name : policy_name;
      [@ocaml.doc
        "A name for the policy. This must be unique within the account and cannot start with [aws/].\n"]
}
[@@ocaml.doc ""]

type nonrec priority = string [@@ocaml.doc ""]

type nonrec percentage = int [@@ocaml.doc ""]

type nonrec dynamic_token_position = int [@@ocaml.doc ""]

type nonrec enumerations = (token_string * token_value) list [@@ocaml.doc ""]

type nonrec inferred_token_name = string [@@ocaml.doc ""]

type nonrec pattern_token = {
  inferred_token_name : inferred_token_name option;
      [@ocaml.doc
        "A name that CloudWatch Logs assigned to this dynamic token to make the pattern more \
         readable. The string part of the [inferredTokenName] gives you a clearer idea of the \
         content of this token. The number part of the [inferredTokenName] shows where in the \
         pattern this token appears, compared to other dynamic tokens. CloudWatch Logs assigns the \
         string part of the name based on analyzing the content of the log events that contain \
         it.\n\n\
        \ For example, an inferred token name of [IPAddress-3] means that the token represents an \
         IP address, and this token is the third dynamic token in the pattern.\n\
        \ "]
  enumerations : enumerations option;
      [@ocaml.doc
        "Contains the values found for a dynamic token, and the number of times each value was \
         found.\n"]
  token_string : token_string option;
      [@ocaml.doc
        "The string represented by this token. If this is a dynamic token, the value will be [<*>] \n"]
  is_dynamic : boolean_ option; [@ocaml.doc "Specifies whether this is a dynamic token.\n"]
  dynamic_token_position : dynamic_token_position option;
      [@ocaml.doc
        "For a dynamic token, this indicates where in the pattern that this token appears, related \
         to other dynamic tokens. The dynamic token that appears first has a value of [1], the one \
         that appears second is [2], and so on.\n"]
}
[@@ocaml.doc
  "A structure that contains information about one pattern token related to an anomaly.\n\n\
  \ For more information about patterns and tokens, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html}CreateLogAnomalyDetector}. \n\
  \ "]

type nonrec pattern_tokens = pattern_token list [@@ocaml.doc ""]

type nonrec pattern_string = string [@@ocaml.doc ""]

type nonrec pattern_regex = string [@@ocaml.doc ""]

type nonrec output_log_event = {
  ingestion_time : timestamp option;
      [@ocaml.doc
        "The time the event was ingested, expressed as the number of milliseconds after [Jan 1, \
         1970 00:00:00 UTC].\n"]
  message : event_message option; [@ocaml.doc "The data contained in the log event.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time the event occurred, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC].\n"]
}
[@@ocaml.doc "Represents a log event.\n"]

type nonrec output_log_events = output_log_event list [@@ocaml.doc ""]

type nonrec output_formats = output_format list [@@ocaml.doc ""]

type nonrec order_by = LastEventTime [@ocaml.doc ""] | LogStreamName [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec open_search_workspace_id = string [@@ocaml.doc ""]

type nonrec open_search_resource_status_type =
  | ERROR [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integration_status_message = string [@@ocaml.doc ""]

type nonrec open_search_resource_status = {
  status_message : integration_status_message option;
      [@ocaml.doc "A message with additional information about the status of this resource.\n"]
  status : open_search_resource_status_type option;
      [@ocaml.doc "The current status of this resource.\n"]
}
[@@ocaml.doc
  "This structure contains information about the status of an OpenSearch Service resource.\n"]

type nonrec open_search_workspace = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of an OpenSearch Service resource.\n"]
  workspace_id : open_search_workspace_id option; [@ocaml.doc "The ID of this workspace.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service workspace used for this \
   integration. An OpenSearch Service workspace is the collection of dashboards along with other \
   OpenSearch Service tools. This workspace was created automatically as part of the integration \
   setup. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html}Centralized \
   OpenSearch user interface (Dashboards) with OpenSearch Service}.\n"]

type nonrec open_search_policy_name = string [@@ocaml.doc ""]

type nonrec open_search_network_policy = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  policy_name : open_search_policy_name option; [@ocaml.doc "The name of the network policy.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service network policy used for this \
   integration. The network policy assigns network access settings to collections. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies}Network \
   policies} in the OpenSearch Service Developer Guide.\n"]

type nonrec open_search_lifecycle_policy = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  policy_name : open_search_policy_name option; [@ocaml.doc "The name of the lifecycle policy.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service data lifecycle policy used for \
   this integration. The lifecycle policy determines the lifespan of the data in the collection. \
   It was automatically created as part of the integration setup.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html}Using \
   data lifecycle policies with OpenSearch Service Serverless} in the OpenSearch Service Developer \
   Guide.\n\
  \ "]

type nonrec open_search_data_source_name = string [@@ocaml.doc ""]

type nonrec open_search_data_source = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  data_source_name : open_search_data_source_name option;
      [@ocaml.doc "The name of the OpenSearch Service data source.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service data source used for this \
   integration. This data source was created as part of the integration setup. An OpenSearch \
   Service data source defines the source and destination for OpenSearch Service queries. It \
   includes the role required to execute queries and write to collections.\n\n\
  \ For more information about OpenSearch Service data sources , see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html}Creating \
   OpenSearch Service data source integrations with Amazon S3.} \n\
  \ "]

type nonrec open_search_application_endpoint = string [@@ocaml.doc ""]

type nonrec open_search_application_id = string [@@ocaml.doc ""]

type nonrec open_search_application = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  application_id : open_search_application_id option; [@ocaml.doc "The ID of the application.\n"]
  application_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]
  application_endpoint : open_search_application_endpoint option;
      [@ocaml.doc "The endpoint of the application.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service application used for this \
   integration. An OpenSearch Service application is the web application created by the \
   integration with CloudWatch Logs. It hosts the vended logs dashboards.\n"]

type nonrec open_search_collection_endpoint = string [@@ocaml.doc ""]

type nonrec open_search_collection = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  collection_arn : arn option; [@ocaml.doc "The ARN of the collection.\n"]
  collection_endpoint : open_search_collection_endpoint option;
      [@ocaml.doc "The endpoint of the collection.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service collection used for this \
   integration. An OpenSearch Service collection is a logical grouping of one or more indexes that \
   represent an analytics workload. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html}Creating \
   and managing OpenSearch Service Serverless collections}.\n"]

type nonrec open_search_encryption_policy = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  policy_name : open_search_policy_name option; [@ocaml.doc "The name of the encryption policy.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service encryption policy used for \
   this integration. The encryption policy was created automatically when you created the \
   integration. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies}Encryption \
   policies} in the OpenSearch Service Developer Guide. \n"]

type nonrec open_search_data_access_policy = {
  status : open_search_resource_status option;
      [@ocaml.doc
        "This structure contains information about the status of this OpenSearch Service resource.\n"]
  policy_name : open_search_policy_name option; [@ocaml.doc "The name of the data access policy.\n"]
}
[@@ocaml.doc
  "This structure contains information about the OpenSearch Service data access policy used for \
   this integration. The access policy defines the access controls for the collection. This data \
   access policy was automatically created as part of the integration setup. For more information \
   about OpenSearch Service data access policies, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
   access control for Amazon OpenSearch Serverless} in the OpenSearch Service Developer Guide.\n"]

type nonrec open_search_integration_details = {
  lifecycle_policy : open_search_lifecycle_policy option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service data lifecycle policy \
         used for this integration. The lifecycle policy determines the lifespan of the data in \
         the collection. It was automatically created as part of the integration setup.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html}Using \
         data lifecycle policies with OpenSearch Service Serverless} in the OpenSearch Service \
         Developer Guide.\n\
        \ "]
  access_policy : open_search_data_access_policy option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service data access policy used \
         for this integration. The access policy defines the access controls for the collection. \
         This data access policy was automatically created as part of the integration setup. For \
         more information about OpenSearch Service data access policies, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
         access control for Amazon OpenSearch Serverless} in the OpenSearch Service Developer \
         Guide.\n"]
  network_policy : open_search_network_policy option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service network policy used for \
         this integration. The network policy assigns network access settings to collections. For \
         more information, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies}Network \
         policies} in the OpenSearch Service Developer Guide.\n"]
  encryption_policy : open_search_encryption_policy option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service encryption policy used \
         for this integration. The encryption policy was created automatically when you created \
         the integration. For more information, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies}Encryption \
         policies} in the OpenSearch Service Developer Guide. \n"]
  workspace : open_search_workspace option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service workspace used for this \
         integration. An OpenSearch Service workspace is the collection of dashboards along with \
         other OpenSearch Service tools. This workspace was created automatically as part of the \
         integration setup. For more information, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html}Centralized \
         OpenSearch user interface (Dashboards) with OpenSearch Service}.\n"]
  collection : open_search_collection option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service collection used for this \
         integration. This collection was created as part of the integration setup. An OpenSearch \
         Service collection is a logical grouping of one or more indexes that represent an \
         analytics workload. For more information, see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html}Creating \
         and managing OpenSearch Service Serverless collections}.\n"]
  application : open_search_application option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service application used for \
         this integration. An OpenSearch Service application is the web application that was \
         created by the integration with CloudWatch Logs. It hosts the vended logs dashboards.\n"]
  data_source : open_search_data_source option;
      [@ocaml.doc
        "This structure contains information about the OpenSearch Service data source used for \
         this integration. This data source was created as part of the integration setup. An \
         OpenSearch Service data source defines the source and destination for OpenSearch Service \
         queries. It includes the role required to execute queries and write to collections.\n\n\
        \ For more information about OpenSearch Service data sources , see \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html}Creating \
         OpenSearch Service data source integrations with Amazon S3.} \n\
        \ "]
}
[@@ocaml.doc
  "This structure contains complete information about one CloudWatch Logs integration. This \
   structure is returned by a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html}GetIntegration} \
   operation.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec metric_filter = {
  emit_system_field_dimensions : emit_system_fields option;
      [@ocaml.doc
        "The list of system fields that are emitted as additional dimensions in the generated \
         metrics. Returns the [emitSystemFieldDimensions] value if it was specified when the \
         metric filter was created.\n"]
  field_selection_criteria : field_selection_criteria option;
      [@ocaml.doc
        "The filter expression that specifies which log events are processed by this metric filter \
         based on system fields. Returns the [fieldSelectionCriteria] value if it was specified \
         when the metric filter was created.\n"]
  apply_on_transformed_logs : apply_on_transformed_logs option;
      [@ocaml.doc
        "This parameter is valid only for log groups that have an active log transformer. For more \
         information about log transformers, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html}PutTransformer}.\n\n\
        \ If this value is [true], the metric filter is applied on the transformed version of the \
         log events instead of the original ingested log events.\n\
        \ "]
  log_group_name : log_group_name option; [@ocaml.doc "The name of the log group.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the metric filter, expressed as the number of milliseconds after \
         [Jan 1, 1970 00:00:00 UTC].\n"]
  metric_transformations : metric_transformations option;
      [@ocaml.doc "The metric transformations.\n"]
  filter_pattern : filter_pattern option; [@ocaml.doc ""]
  filter_name : filter_name option; [@ocaml.doc "The name of the metric filter.\n"]
}
[@@ocaml.doc
  "Metric filters express how CloudWatch Logs would extract metric observations from ingested log \
   events and transform them into metric data in a CloudWatch metric.\n"]

type nonrec metric_filters = metric_filter list [@@ocaml.doc ""]

type nonrec lookup_table_name = string [@@ocaml.doc ""]

type nonrec lookup_table = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The ARN of the KMS key used to encrypt the lookup table data, if applicable.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The time when the lookup table was last updated, expressed as the number of milliseconds \
         after [Jan 1, 1970 00:00:00 UTC].\n"]
  size_bytes : stored_bytes option; [@ocaml.doc "The size of the lookup table in bytes.\n"]
  records_count : records_count option;
      [@ocaml.doc "The number of data rows in the lookup table, excluding the header row.\n"]
  table_fields : table_fields option;
      [@ocaml.doc "The column headers from the first row of the CSV file.\n"]
  description : lookup_table_description option;
      [@ocaml.doc "The description of the lookup table.\n"]
  lookup_table_name : lookup_table_name option; [@ocaml.doc "The name of the lookup table.\n"]
  lookup_table_arn : arn option; [@ocaml.doc "The ARN of the lookup table.\n"]
}
[@@ocaml.doc "Contains metadata about a lookup table returned by [DescribeLookupTables].\n"]

type nonrec lookup_tables = lookup_table list [@@ocaml.doc ""]

type nonrec list_tags_log_group_response = {
  tags : tags option; [@ocaml.doc "The tags for the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_log_group_request = {
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The list of tags associated with the requested resource.>\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the resource that you want to view tags for.\n\n\
        \ The ARN format of a log group is \n\
        \ {[\n\
        \ arn:aws:logs:{i Region}:{i account-id}:log-group:{i log-group-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a destination is \n\
        \  {[\n\
        \  arn:aws:logs:{i Region}:{i account-id}:destination:{i destination-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html}CloudWatch \
         Logs resources and operations}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec list_syslog_configurations_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. The token expires after 24 hours.\n"]
  syslog_configurations : syslog_configurations option;
      [@ocaml.doc "The list of syslog configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_syslog_configurations_max_results = int [@@ocaml.doc ""]

type nonrec list_syslog_configurations_request = {
  max_results : list_syslog_configurations_max_results option;
      [@ocaml.doc "The maximum number of syslog configurations to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. You received this token from a previous \
         call.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "The ID of the VPC endpoint to filter syslog configurations for.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The name or ARN of the log group to filter syslog configurations for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sources_for_s3_table_integration_response = {
  next_token : next_token option; [@ocaml.doc ""]
  sources : s3_table_integration_sources option;
      [@ocaml.doc "The list of data source associations for the specified S3 Table Integration.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sources_for_s3_table_integration_max_results = int [@@ocaml.doc ""]

type nonrec list_sources_for_s3_table_integration_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : list_sources_for_s3_table_integration_max_results option;
      [@ocaml.doc
        "The maximum number of associations to return in a single call. Valid range is 1 to 100.\n"]
  integration_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 Table Integration to list associations for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_scheduled_queries_response = {
  scheduled_queries : scheduled_query_summary_list option;
      [@ocaml.doc "An array of scheduled query summary information.\n"]
  next_token : next_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_scheduled_queries_max_results = int [@@ocaml.doc ""]

type nonrec list_scheduled_queries_request = {
  schedule_type : schedule_type option;
      [@ocaml.doc
        "Filter scheduled queries by schedule type. Valid values are [CUSTOMER_MANAGED] and \
         [AWS_MANAGED]. If not specified, scheduled queries of all schedule types are returned.\n"]
  state : scheduled_query_state option;
      [@ocaml.doc
        "Filter scheduled queries by state. Valid values are [ENABLED] and [DISABLED]. If not \
         specified, all scheduled queries are returned.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  max_results : list_scheduled_queries_max_results option;
      [@ocaml.doc "The maximum number of scheduled queries to return. Valid range is 1 to 1000.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_groups_for_query_response = {
  next_token : next_token option; [@ocaml.doc ""]
  log_group_identifiers : log_group_identifiers option;
      [@ocaml.doc
        "An array of the names and ARNs of the log groups that were processed in the query.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_groups_for_query_max_results = int [@@ocaml.doc ""]

type nonrec list_log_groups_for_query_request = {
  max_results : list_log_groups_for_query_max_results option;
      [@ocaml.doc "Limits the number of returned log groups to the specified number.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  query_id : query_id;
      [@ocaml.doc
        "The ID of the query to use. This query ID is from the response to your \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec log_group_class =
  | DELIVERY [@ocaml.doc ""]
  | INFREQUENT_ACCESS [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_group_summary = {
  log_group_class : log_group_class option;
      [@ocaml.doc
        "The log group class for this log group. For details about the features supported by each \
         log group class, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html}Log \
         classes} \n"]
  log_group_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the log group.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc "This structure contains information about one log group in your account.\n"]

type nonrec log_group_summaries = log_group_summary list [@@ocaml.doc ""]

type nonrec list_log_groups_response = {
  next_token : next_token option; [@ocaml.doc ""]
  log_groups : log_group_summaries option;
      [@ocaml.doc
        "An array of structures, where each structure contains the information about one log group.\n"]
}
[@@ocaml.doc ""]

type nonrec log_group_name_regex_pattern = string [@@ocaml.doc ""]

type nonrec include_linked_accounts = bool [@@ocaml.doc ""]

type nonrec account_ids = account_id list [@@ocaml.doc ""]

type nonrec list_limit = int [@@ocaml.doc ""]

type nonrec data_source_filter = {
  type_ : data_source_type option; [@ocaml.doc "The type pattern to filter data sources by.\n"]
  name : data_source_name; [@ocaml.doc "The name pattern to filter data sources by.\n"]
}
[@@ocaml.doc
  "Filter criteria for data sources, used to specify which data sources to include in operations \
   based on name and type.\n"]

type nonrec data_source_filters = data_source_filter list [@@ocaml.doc ""]

type nonrec field_index_name = string [@@ocaml.doc ""]

type nonrec field_index_names = field_index_name list [@@ocaml.doc ""]

type nonrec list_log_groups_request = {
  log_group_tags : tag_filters option;
      [@ocaml.doc
        "An array of tag filters to return only log groups that have specific tags. Multiple \
         filters are combined with AND logic.\n"]
  field_index_names : field_index_names option;
      [@ocaml.doc
        "An array of field index names to filter log groups that have specific field indexes. Only \
         log groups containing all specified field indexes are returned. You can specify 1 to 20 \
         field index names, each with 1 to 512 characters.\n"]
  data_sources : data_source_filters option;
      [@ocaml.doc
        "An array of data source filters to filter log groups by their associated data sources. \
         You can filter by data source name, type, or both. Multiple filters within the same \
         dimension are combined with OR logic, while filters across different dimensions are \
         combined with AND logic.\n"]
  limit : list_limit option;
      [@ocaml.doc
        "The maximum number of log groups to return. If you omit this parameter, the default is up \
         to 50 log groups.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  account_identifiers : account_ids option;
      [@ocaml.doc
        "When [includeLinkedAccounts] is set to [true], use this parameter to specify the list of \
         accounts to search. You can specify as many as 20 account IDs in the array.\n"]
  include_linked_accounts : include_linked_accounts option;
      [@ocaml.doc
        "If you are using a monitoring account, set this to [true] to have the operation return \
         log groups in the accounts listed in [accountIdentifiers].\n\n\
        \ If this parameter is set to [true] and [accountIdentifiers] contains a null value, the \
         operation returns all log groups in the monitoring account and all log groups in all \
         source accounts that are linked to the monitoring account. \n\
        \ \n\
        \  The default for this parameter is [false].\n\
        \  "]
  log_group_class : log_group_class option;
      [@ocaml.doc
        "Use this parameter to limit the results to only those log groups in the specified log \
         group class. If you omit this parameter, log groups of all classes can be returned.\n"]
  log_group_name_pattern : log_group_name_regex_pattern option;
      [@ocaml.doc
        "Use this parameter to limit the returned log groups to only those with names that match \
         the pattern that you specify. This parameter is a regular expression that can match \
         prefixes and substrings, and supports wildcard matching and matching multiple patterns, \
         as in the following examples. \n\n\
        \ {ul\n\
        \       {-  Use [^] to match log group names by prefix.\n\
        \           \n\
        \            }\n\
        \       {-  For a substring match, specify the string to match. All matches are case \
         sensitive\n\
        \           \n\
        \            }\n\
        \       {-  To match multiple patterns, separate them with a [|] as in the example \
         [^/aws/lambda|discovery] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can specify as many as five different regular expression patterns in this field, \
         each of which must be between 3 and 24 characters. You can include the [^] symbol as many \
         as five times, and include the [|] symbol as many as four times.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec detector_name = string [@@ocaml.doc ""]

type nonrec log_group_arn_list = log_group_arn list [@@ocaml.doc ""]

type nonrec anomaly_detector_status =
  | PAUSED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ANALYZING [@ocaml.doc ""]
  | TRAINING [@ocaml.doc ""]
  | INITIALIZING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec epoch_millis = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec anomaly_detector = {
  anomaly_visibility_time : anomaly_visibility_time option;
      [@ocaml.doc
        "The number of days used as the life cycle of anomalies. After this time, anomalies are \
         automatically baselined and the anomaly detector model will treat new occurrences of \
         similar event as normal. \n"]
  last_modified_time_stamp : epoch_millis option;
      [@ocaml.doc "The date and time when this anomaly detector was most recently modified.\n"]
  creation_time_stamp : epoch_millis option;
      [@ocaml.doc "The date and time when this anomaly detector was created.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The ARN of the KMS key assigned to this anomaly detector, if any.\n"]
  anomaly_detector_status : anomaly_detector_status option;
      [@ocaml.doc
        "Specifies the current status of the anomaly detector. To pause an anomaly detector, use \
         the [enabled] parameter in the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html}UpdateLogAnomalyDetector} \
         operation.\n"]
  filter_pattern : filter_pattern option; [@ocaml.doc ""]
  evaluation_frequency : evaluation_frequency option;
      [@ocaml.doc "Specifies how often the anomaly detector runs and look for anomalies.\n"]
  log_group_arn_list : log_group_arn_list option;
      [@ocaml.doc "A list of the ARNs of the log groups that this anomaly detector watches.\n"]
  detector_name : detector_name option; [@ocaml.doc "The name of the anomaly detector.\n"]
  anomaly_detector_arn : anomaly_detector_arn option;
      [@ocaml.doc "The ARN of the anomaly detector.\n"]
}
[@@ocaml.doc "Contains information about one anomaly detector in the account.\n"]

type nonrec anomaly_detectors = anomaly_detector list [@@ocaml.doc ""]

type nonrec list_log_anomaly_detectors_response = {
  next_token : next_token option; [@ocaml.doc ""]
  anomaly_detectors : anomaly_detectors option;
      [@ocaml.doc
        "An array of structures, where each structure in the array contains information about one \
         anomaly detector.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_anomaly_detectors_limit = int [@@ocaml.doc ""]

type nonrec list_log_anomaly_detectors_request = {
  next_token : next_token option; [@ocaml.doc ""]
  limit : list_log_anomaly_detectors_limit option;
      [@ocaml.doc
        "The maximum number of items to return. If you don't specify a value, the default maximum \
         value of 50 items is used.\n"]
  filter_log_group_arn : log_group_arn option;
      [@ocaml.doc
        "Use this to optionally filter the results to only include anomaly detectors that are \
         associated with the specified log group.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_summary = {
  integration_status : integration_status option;
      [@ocaml.doc "The current status of this integration.\n"]
  integration_type : integration_type option;
      [@ocaml.doc
        "The type of integration. Integrations with OpenSearch Service have the type [OPENSEARCH].\n"]
  integration_name : integration_name option; [@ocaml.doc "The name of this integration.\n"]
}
[@@ocaml.doc
  "This structure contains information about one CloudWatch Logs integration. This structure is \
   returned by a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html}ListIntegrations} \
   operation.\n"]

type nonrec integration_summaries = integration_summary list [@@ocaml.doc ""]

type nonrec list_integrations_response = {
  integration_summaries : integration_summaries option;
      [@ocaml.doc
        "An array, where each object in the array contains information about one CloudWatch Logs \
         integration in this account. \n"]
}
[@@ocaml.doc ""]

type nonrec integration_name_prefix = string [@@ocaml.doc ""]

type nonrec list_integrations_request = {
  integration_status : integration_status option;
      [@ocaml.doc
        "To limit the results to integrations with a certain status, specify that status here.\n"]
  integration_type : integration_type option;
      [@ocaml.doc
        "To limit the results to integrations of a certain type, specify that type here.\n"]
  integration_name_prefix : integration_name_prefix option;
      [@ocaml.doc
        "To limit the results to integrations that start with a certain name prefix, specify that \
         name prefix here.\n"]
}
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec histogram = (time * count) list [@@ocaml.doc ""]

type nonrec log_event = {
  message : event_message option; [@ocaml.doc "The message content of the log event.\n"]
  timestamp : timestamp option; [@ocaml.doc "The time stamp of the log event.\n"]
}
[@@ocaml.doc
  "This structure contains the information for one sample log event that is associated with an \
   anomaly found by a log anomaly detector.\n"]

type nonrec log_samples = log_event list [@@ocaml.doc ""]

type nonrec anomaly = {
  is_pattern_level_suppression : boolean_ option;
      [@ocaml.doc
        "If this anomaly is suppressed, this field is [true] if the suppression is because the \
         pattern is suppressed. If [false], then only this particular anomaly is suppressed.\n"]
  suppressed_until : epoch_millis option;
      [@ocaml.doc
        "If the anomaly is suppressed, this indicates when the suppression will end. If this value \
         is [0], the anomaly was suppressed with no expiration, with the [INFINITE] value.\n"]
  suppressed_date : epoch_millis option;
      [@ocaml.doc "If the anomaly is suppressed, this indicates when it was suppressed.\n"]
  suppressed : boolean_ option;
      [@ocaml.doc
        "Indicates whether this anomaly is currently suppressed. To suppress an anomaly, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html}UpdateAnomaly}.\n"]
  log_group_arn_list : log_group_arn_list;
      [@ocaml.doc
        "An array of ARNS of the log groups that contained log events considered to be part of \
         this anomaly.\n"]
  pattern_tokens : pattern_tokens;
      [@ocaml.doc
        "An array of structures where each structure contains information about one token that \
         makes up the pattern.\n"]
  log_samples : log_samples;
      [@ocaml.doc
        "An array of sample log event messages that are considered to be part of this anomaly.\n"]
  histogram : histogram;
      [@ocaml.doc
        "A map showing times when the anomaly detector ran, and the number of occurrences of this \
         anomaly that were detected at each of those runs. The times are specified in epoch time, \
         which is the number of seconds since [January 1, 1970, 00:00:00 UTC].\n"]
  state : state;
      [@ocaml.doc
        "Indicates the current state of this anomaly. If it is still being treated as an anomaly, \
         the value is [Active]. If you have suppressed this anomaly by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html}UpdateAnomaly} \
         operation, the value is [Suppressed]. If this behavior is now considered to be normal, \
         the value is [Baseline].\n"]
  active : boolean_; [@ocaml.doc "Specifies whether this anomaly is still ongoing.\n"]
  description : description;
      [@ocaml.doc
        "A human-readable description of the anomaly. This description is generated by CloudWatch \
         Logs.\n"]
  last_seen : epoch_millis;
      [@ocaml.doc
        "The date and time when the anomaly detector most recently saw this anomaly. It is \
         specified as epoch time, which is the number of seconds since [January 1, 1970, 00:00:00\n\
        \        UTC].\n"]
  first_seen : epoch_millis;
      [@ocaml.doc
        "The date and time when the anomaly detector first saw this anomaly. It is specified as \
         epoch time, which is the number of seconds since [January 1, 1970, 00:00:00\n\
        \      UTC].\n"]
  priority : priority option;
      [@ocaml.doc
        "The priority level of this anomaly, as determined by CloudWatch Logs. Priority is \
         computed based on log severity labels such as [FATAL] and [ERROR] and the amount of \
         deviation from the baseline. Possible values are [HIGH], [MEDIUM], and [LOW].\n"]
  pattern_regex : pattern_regex option;
      [@ocaml.doc "The pattern used to help identify this anomaly, in regular expression format.\n"]
  pattern_string : pattern_string;
      [@ocaml.doc "The pattern used to help identify this anomaly, in string format.\n"]
  anomaly_detector_arn : anomaly_detector_arn;
      [@ocaml.doc "The ARN of the anomaly detector that identified this anomaly.\n"]
  pattern_id : pattern_id;
      [@ocaml.doc "The ID of the pattern used to help identify this anomaly.\n"]
  anomaly_id : anomaly_id;
      [@ocaml.doc "The unique ID that CloudWatch Logs assigned to this anomaly.\n"]
}
[@@ocaml.doc
  "This structure represents one anomaly that has been found by a logs anomaly detector.\n\n\
  \ For more information about patterns and anomalies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html}CreateLogAnomalyDetector}. \n\
  \ "]

type nonrec anomalies = anomaly list [@@ocaml.doc ""]

type nonrec list_anomalies_response = {
  next_token : next_token option; [@ocaml.doc ""]
  anomalies : anomalies option;
      [@ocaml.doc
        "An array of structures, where each structure contains information about one anomaly that \
         a log anomaly detector has found.\n"]
}
[@@ocaml.doc ""]

type nonrec list_anomalies_limit = int [@@ocaml.doc ""]

type nonrec list_anomalies_request = {
  next_token : next_token option; [@ocaml.doc ""]
  limit : list_anomalies_limit option;
      [@ocaml.doc
        "The maximum number of items to return. If you don't specify a value, the default maximum \
         value of 50 items is used.\n"]
  suppression_state : suppression_state option;
      [@ocaml.doc
        "You can specify this parameter if you want to the operation to return only anomalies that \
         are currently either suppressed or unsuppressed.\n"]
  anomaly_detector_arn : anomaly_detector_arn option;
      [@ocaml.doc
        "Use this to optionally limit the results to only the anomalies found by a certain anomaly \
         detector.\n"]
}
[@@ocaml.doc ""]

type nonrec log_group_count = int [@@ocaml.doc ""]

type nonrec grouping_identifier_key = string [@@ocaml.doc ""]

type nonrec grouping_identifier_value = string [@@ocaml.doc ""]

type nonrec grouping_identifier = {
  value : grouping_identifier_value option;
      [@ocaml.doc
        "The value associated with the grouping characteristic. Examples are [amazon_vpc], [flow], \
         and [OCSF].\n"]
  key : grouping_identifier_key option;
      [@ocaml.doc
        "The key that identifies the grouping characteristic. The format of the key uses dot \
         notation. Examples are, [dataSource.Name], [dataSource.Type], and [dataSource.Format].\n"]
}
[@@ocaml.doc
  "A key-value pair that identifies how log groups are grouped in aggregate summaries.\n"]

type nonrec grouping_identifiers = grouping_identifier list [@@ocaml.doc ""]

type nonrec aggregate_log_group_summary = {
  grouping_identifiers : grouping_identifiers option;
      [@ocaml.doc
        "An array of key-value pairs that identify the data source characteristics used to group \
         the log groups.\n\n\
        \ The size and content of this array depends on the [groupBy] parameter specified in the \
         request.\n\
        \ "]
  log_group_count : log_group_count option;
      [@ocaml.doc "The number of log groups in this aggregate summary group.\n"]
}
[@@ocaml.doc
  "Contains an aggregate summary of log groups grouped by data source characteristics, including \
   the count of log groups and their grouping identifiers.\n"]

type nonrec aggregate_log_group_summaries = aggregate_log_group_summary list [@@ocaml.doc ""]

type nonrec list_aggregate_log_group_summaries_response = {
  next_token : next_token option; [@ocaml.doc ""]
  aggregate_log_group_summaries : aggregate_log_group_summaries option;
      [@ocaml.doc
        "The list of aggregate log group summaries grouped by the specified data source \
         characteristics.\n"]
}
[@@ocaml.doc ""]

type nonrec list_aggregate_log_group_summaries_group_by =
  | DATA_SOURCE_NAME_AND_TYPE [@ocaml.doc ""]
  | DATA_SOURCE_NAME_TYPE_AND_FORMAT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_log_groups_request_limit = int [@@ocaml.doc ""]

type nonrec list_aggregate_log_group_summaries_request = {
  limit : list_log_groups_request_limit option;
      [@ocaml.doc
        "The maximum number of aggregated summaries to return. If you omit this parameter, the \
         default is up to 50 aggregated summaries.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  group_by : list_aggregate_log_group_summaries_group_by;
      [@ocaml.doc "Specifies how to group the log groups in the summary.\n"]
  data_sources : data_source_filters option;
      [@ocaml.doc
        "Filters the results by data source characteristics to include only log groups associated \
         with the specified data sources.\n"]
  log_group_name_pattern : log_group_name_regex_pattern option;
      [@ocaml.doc
        "Use this parameter to limit the returned log groups to only those with names that match \
         the pattern that you specify. This parameter is a regular expression that can match \
         prefixes and substrings, and supports wildcard matching and matching multiple patterns, \
         as in the following examples. \n\n\
        \ {ul\n\
        \       {-  Use [^] to match log group names by prefix.\n\
        \           \n\
        \            }\n\
        \       {-  For a substring match, specify the string to match. All matches are case \
         sensitive\n\
        \           \n\
        \            }\n\
        \       {-  To match multiple patterns, separate them with a [|] as in the example \
         [^/aws/lambda|discovery] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can specify as many as five different regular expression patterns in this field, \
         each of which must be between 3 and 24 characters. You can include the [^] symbol as many \
         as five times, and include the [|] symbol as many as four times.\n\
        \   "]
  log_group_class : log_group_class option;
      [@ocaml.doc
        "Filters the results by log group class to include only log groups of the specified class.\n"]
  include_linked_accounts : include_linked_accounts option;
      [@ocaml.doc
        "If you are using a monitoring account, set this to [true] to have the operation return \
         log groups in the accounts listed in [accountIdentifiers].\n\n\
        \ If this parameter is set to [true] and [accountIdentifiers] contains a null value, the \
         operation returns all log groups in the monitoring account and all log groups in all \
         source accounts that are linked to the monitoring account. \n\
        \ \n\
        \  The default for this parameter is [false].\n\
        \  "]
  account_identifiers : account_ids option;
      [@ocaml.doc
        "When [includeLinkedAccounts] is set to [true], use this parameter to specify the list of \
         accounts to search. You can specify as many as 20 account IDs in the array.\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_response = {
  transformer_config : processors option;
      [@ocaml.doc "This sructure contains the configuration of the requested transformer.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc
        "The date and time when this transformer was most recently modified, expressed as the \
         number of milliseconds after Jan 1, 1970 00:00:00 UTC.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the transformer, expressed as the number of milliseconds after Jan \
         1, 1970 00:00:00 UTC.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The ARN of the log group that you specified in your request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_request = {
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to return transformer information for. If \
         the log group is in a source account and you are using a monitoring account, you must use \
         the log group ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_query_history_response = {
  next_token : next_token option; [@ocaml.doc ""]
  trigger_history : trigger_history_record_list option;
      [@ocaml.doc "An array of execution history records for the scheduled query.\n"]
  scheduled_query_arn : arn option; [@ocaml.doc "The ARN of the scheduled query.\n"]
  name : scheduled_query_name option; [@ocaml.doc "The name of the scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_status_list = execution_status list [@@ocaml.doc ""]

type nonrec get_scheduled_query_history_max_results = int [@@ocaml.doc ""]

type nonrec get_scheduled_query_history_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : get_scheduled_query_history_max_results option;
      [@ocaml.doc "The maximum number of history records to return. Valid range is 1 to 1000.\n"]
  execution_statuses : execution_status_list option;
      [@ocaml.doc
        "An array of execution statuses to filter the history results. Only executions with the \
         specified statuses are returned.\n"]
  end_time : timestamp; [@ocaml.doc "The end time for the history query in Unix epoch format.\n"]
  start_time : timestamp;
      [@ocaml.doc "The start time for the history query in Unix epoch format.\n"]
  identifier : scheduled_query_identifier;
      [@ocaml.doc "The ARN or name of the scheduled query to retrieve history for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_query_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was last updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was created.\n"]
  execution_role_arn : role_arn option;
      [@ocaml.doc "The ARN of the IAM role used to execute the query and deliver results.\n"]
  schedule_end_time : timestamp option;
      [@ocaml.doc "The end time for the scheduled query in Unix epoch format.\n"]
  schedule_start_time : timestamp option;
      [@ocaml.doc "The start time for the scheduled query in Unix epoch format.\n"]
  last_execution_status : execution_status option;
      [@ocaml.doc "The status of the most recent execution of the scheduled query.\n"]
  last_triggered_time : timestamp option;
      [@ocaml.doc "The timestamp when the scheduled query was last executed.\n"]
  schedule_type : schedule_type option;
      [@ocaml.doc
        "The schedule type of the scheduled query. Valid values are [CUSTOMER_MANAGED] and \
         [AWS_MANAGED].\n"]
  state : scheduled_query_state option; [@ocaml.doc "The current state of the scheduled query.\n"]
  destination_configuration : destination_configuration option;
      [@ocaml.doc "Configuration for where query results are delivered.\n"]
  end_time_offset : end_time_offset option;
      [@ocaml.doc
        "The time offset in seconds that defines the end of the lookback period for the query.\n"]
  start_time_offset : start_time_offset option;
      [@ocaml.doc "The time offset in seconds that defines the lookback period for the query.\n"]
  timezone : schedule_timezone option;
      [@ocaml.doc "The timezone used for evaluating the schedule expression.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc "The cron expression that defines when the scheduled query runs.\n"]
  log_group_identifiers : scheduled_query_log_group_identifiers option;
      [@ocaml.doc "The log groups queried by the scheduled query.\n"]
  query_string : query_string option;
      [@ocaml.doc "The query string executed by the scheduled query.\n"]
  query_language : query_language option;
      [@ocaml.doc "The query language used by the scheduled query.\n"]
  description : scheduled_query_description option;
      [@ocaml.doc "The description of the scheduled query.\n"]
  name : scheduled_query_name option; [@ocaml.doc "The name of the scheduled query.\n"]
  scheduled_query_arn : arn option; [@ocaml.doc "The ARN of the scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_query_request = {
  identifier : scheduled_query_identifier;
      [@ocaml.doc "The ARN or name of the scheduled query to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_key = string [@@ocaml.doc ""]

type nonrec get_query_results_next_token = string [@@ocaml.doc ""]

type nonrec get_query_results_response = {
  next_token : get_query_results_next_token option;
      [@ocaml.doc
        "If there are more log events remaining in the results, the response includes a \
         [nextToken]. You can use this token in a subsequent [GetQueryResults] request to get the \
         next set of results. You can retrieve up to 100,000 log event results from a query by \
         paginating with this token. This is only supported for Logs Insights QL and is currently \
         not supported for PPL and SQL query languages.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc
        "If you associated an KMS key with the CloudWatch Logs Insights query results in this \
         account, this field displays the ARN of the key that's used to encrypt the query results \
         when \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
         stores them.\n"]
  status : query_status option;
      [@ocaml.doc
        "The status of the most recent running of the query. Possible values are [Cancelled], \
         [Complete], [Failed], [Running], [Scheduled], [Timeout], and [Unknown].\n\n\
        \ Queries time out after 60 minutes of runtime. To avoid having your queries time out, \
         reduce the time range being searched or partition your query into a number of queries.\n\
        \ "]
  statistics : query_statistics option;
      [@ocaml.doc
        "Includes the number of log events scanned by the query, the number of log events that \
         matched the query criteria, and the total number of bytes in the scanned log events. \
         These values reflect the full raw results of the query.\n"]
  results : query_results option;
      [@ocaml.doc
        "The log events that matched the query criteria during the most recent time it ran.\n\n\
        \ The [results] value is an array of arrays. Each log event is one object in the top-level \
         array. Each of these log event objects is an array of [field]/[value] pairs.\n\
        \ "]
  query_language : query_language option;
      [@ocaml.doc
        "The query language used for this query. For more information about the query languages \
         that CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc ""]

type nonrec get_query_results_max_items = int [@@ocaml.doc ""]

type nonrec get_query_results_request = {
  max_items : get_query_results_max_items option;
      [@ocaml.doc
        "The maximum number of log events to return in the response. The maximum is 10,000 log \
         events per request. You can retrieve up to 100,000 log event results from a query by \
         paginating with the [nextToken].\n"]
  next_token : get_query_results_next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. The token expires after 1 hour.\n"]
  query_id : query_id; [@ocaml.doc "The ID number of the query.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lookup_table_response = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The ARN of the KMS key used to encrypt the lookup table data, if applicable.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The time when the lookup table was last updated, expressed as the number of milliseconds \
         after [Jan 1, 1970 00:00:00 UTC].\n"]
  size_bytes : stored_bytes option; [@ocaml.doc "The size of the lookup table in bytes.\n"]
  table_body : table_body option; [@ocaml.doc "The full CSV content of the lookup table.\n"]
  description : lookup_table_description option;
      [@ocaml.doc "The description of the lookup table.\n"]
  lookup_table_name : lookup_table_name option; [@ocaml.doc "The name of the lookup table.\n"]
  lookup_table_arn : arn option; [@ocaml.doc "The ARN of the lookup table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lookup_table_request = {
  lookup_table_arn : arn; [@ocaml.doc "The ARN of the lookup table to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec log_record = (field * value) list [@@ocaml.doc ""]

type nonrec get_log_record_response = {
  log_record : log_record option; [@ocaml.doc "The requested log event, as a JSON string.\n"]
}
[@@ocaml.doc ""]

type nonrec log_record_pointer = string [@@ocaml.doc ""]

type nonrec get_log_record_request = {
  unmask : unmask option;
      [@ocaml.doc
        "Specify [true] to display the log event fields with all sensitive data unmasked and \
         visible. The default is [false].\n\n\
        \ To use this operation with this parameter, you must be signed into an account with the \
         [logs:Unmask] permission.\n\
        \ "]
  log_record_pointer : log_record_pointer;
      [@ocaml.doc
        "The pointer corresponding to the log event record you want to retrieve. You get this from \
         the response of a [GetQueryResults] operation. In that response, the value of the [@ptr] \
         field for a log event is the value to use as [logRecordPointer] to retrieve that complete \
         log event record.\n"]
}
[@@ocaml.doc ""]

type nonrec data = bytes [@@ocaml.doc ""]

type nonrec fields_data = {
  data : data option;
      [@ocaml.doc
        "The actual log data content returned in the streaming response. This contains the fields \
         and values of the log event in a structured format that can be parsed and processed by \
         the client.\n"]
}
[@@ocaml.doc
  "A structure containing the extracted fields from a log event. These fields are extracted based \
   on the log format and can be used for structured querying and analysis.\n"]

type nonrec internal_streaming_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal error occurred during the streaming of log data. This exception is thrown when \
   there's an issue with the internal streaming mechanism used by the GetLogObject operation.\n"]

type nonrec get_log_object_response_stream =
  | InternalStreamingException of internal_streaming_exception
      [@ocaml.doc
        "An internal error occurred during the streaming of log data. This exception is thrown \
         when there's an issue with the internal streaming mechanism used by the GetLogObject \
         operation.\n"]
  | Fields of fields_data [@ocaml.doc ""]
[@@ocaml.doc
  "A stream of structured log data returned by the GetLogObject operation. This stream contains \
   log events with their associated metadata and extracted fields.\n"]

type nonrec get_log_object_response = {
  field_stream : get_log_object_response_stream option;
      [@ocaml.doc
        "A stream of structured log data returned by the GetLogObject operation. This stream \
         contains log events with their associated metadata and extracted fields.\n"]
}
[@@ocaml.doc "The response from the GetLogObject operation.\n"]

type nonrec log_object_pointer = string [@@ocaml.doc ""]

type nonrec get_log_object_request = {
  log_object_pointer : log_object_pointer;
      [@ocaml.doc
        "A pointer to the specific log object to retrieve. This is a required parameter that \
         uniquely identifies the log object within CloudWatch Logs. The pointer is typically \
         obtained from a previous query or filter operation.\n"]
  unmask : unmask option;
      [@ocaml.doc
        "A boolean flag that indicates whether to unmask sensitive log data. When set to true, any \
         masked or redacted data in the log object will be displayed in its original form. Default \
         is false.\n"]
}
[@@ocaml.doc "The parameters for the GetLogObject operation.\n"]

type nonrec log_group_field = {
  percent : percentage option;
      [@ocaml.doc "The percentage of log events queried that contained the field.\n"]
  name : field option; [@ocaml.doc "The name of a log field.\n"]
}
[@@ocaml.doc
  "The fields contained in log events found by a [GetLogGroupFields] operation, along with the \
   percentage of queried log events in which each field appears.\n"]

type nonrec log_group_field_list = log_group_field list [@@ocaml.doc ""]

type nonrec get_log_group_fields_response = {
  log_group_fields : log_group_field_list option;
      [@ocaml.doc
        "The array of fields found in the query. Each object in the array contains the name of the \
         field, along with the percentage of time it appeared in the log events that were queried.\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_group_fields_request = {
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to view. If the log group is in a source \
         account and you are using a monitoring account, you must specify the ARN.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
  time : timestamp option;
      [@ocaml.doc
        "The time to set as the center of the query. If you specify [time], the 8 minutes before \
         and 8 minutes after this time are searched. If you omit [time], the most recent 15 \
         minutes up to the current time are searched.\n\n\
        \ The [time] value is specified as epoch time, which is the number of seconds since \
         [January 1, 1970, 00:00:00 UTC].\n\
        \ "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group to search.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec log_field_name = string [@@ocaml.doc ""]

type nonrec data_type = string [@@ocaml.doc ""]

type log_field_type = {
  fields : log_fields_list option;
      [@ocaml.doc "For complex types, contains the nested field definitions.\n"]
  element : log_field_type option;
      [@ocaml.doc "For array or collection types, specifies the element type information.\n"]
  type_ : data_type option; [@ocaml.doc "The data type of the log field.\n"]
}
[@@ocaml.doc
  "Defines the data type structure for a log field, including the type, element information, and \
   nested fields for complex types.\n"]

and log_fields_list = log_fields_list_item list [@@ocaml.doc ""]

and log_fields_list_item = {
  log_field_type : log_field_type option;
      [@ocaml.doc "The data type information for the log field.\n"]
  log_field_name : log_field_name option; [@ocaml.doc "The name of the log field.\n"]
}
[@@ocaml.doc
  "Represents a log field with its name and data type information for a specific data source.\n"]

type nonrec get_log_fields_response = {
  log_fields : log_fields_list option;
      [@ocaml.doc
        "The list of log fields for the specified data source, including field names and their \
         data types.\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_fields_request = {
  data_source_type : data_source_type;
      [@ocaml.doc "The type of the data source to retrieve log fields for.\n"]
  data_source_name : data_source_name;
      [@ocaml.doc "The name of the data source to retrieve log fields for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_events_response = {
  next_backward_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items in the backward direction. The token expires after 24 \
         hours. This token is not null. If you have reached the end of the stream, it returns the \
         same token you passed in.\n"]
  next_forward_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items in the forward direction. The token expires after 24 \
         hours. If you have reached the end of the stream, it returns the same token you passed in.\n"]
  events : output_log_events option; [@ocaml.doc "The events.\n"]
}
[@@ocaml.doc ""]

type nonrec events_limit = int [@@ocaml.doc ""]

type nonrec get_log_events_request = {
  unmask : unmask option;
      [@ocaml.doc
        "Specify [true] to display the log event fields with all sensitive data unmasked and \
         visible. The default is [false].\n\n\
        \ To use this operation with this parameter, you must be signed into an account with the \
         [logs:Unmask] permission.\n\
        \ "]
  start_from_head : start_from_head option;
      [@ocaml.doc
        "If the value is true, the earliest log events are returned first. If the value is false, \
         the latest log events are returned first. The default value is false.\n\n\
        \ If you are using a previous [nextForwardToken] value as the [nextToken] in this \
         operation, you must specify [true] for [startFromHead].\n\
        \ "]
  limit : events_limit option;
      [@ocaml.doc
        "The maximum number of log events returned. If you don't specify a limit, the default is \
         as many log events as can fit in a response size of 1 MB (up to 10,000 log events).\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "The end of the time range, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC]. Events with a timestamp equal to or later than this time are \
         not included.\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "The start of the time range, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC]. Events with a timestamp equal to this time or later than this \
         time are included. Events with a timestamp earlier than this time are not included.\n"]
  log_stream_name : log_stream_name; [@ocaml.doc "The name of the log stream.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to view events from. If the log group is \
         in a source account and you are using a monitoring account, you must use the log group \
         ARN.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_log_anomaly_detector_response = {
  anomaly_visibility_time : anomaly_visibility_time option;
      [@ocaml.doc
        "The number of days used as the life cycle of anomalies. After this time, anomalies are \
         automatically baselined and the anomaly detector model will treat new occurrences of \
         similar event as normal. \n"]
  last_modified_time_stamp : epoch_millis option;
      [@ocaml.doc "The date and time when this anomaly detector was most recently modified.\n"]
  creation_time_stamp : epoch_millis option;
      [@ocaml.doc "The date and time when this anomaly detector was created.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The ARN of the KMS key assigned to this anomaly detector, if any.\n"]
  anomaly_detector_status : anomaly_detector_status option;
      [@ocaml.doc
        "Specifies whether the anomaly detector is currently active. To change its status, use the \
         [enabled] parameter in the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html}UpdateLogAnomalyDetector} \
         operation.\n"]
  filter_pattern : filter_pattern option; [@ocaml.doc ""]
  evaluation_frequency : evaluation_frequency option;
      [@ocaml.doc
        "Specifies how often the anomaly detector runs and look for anomalies. Set this value \
         according to the frequency that the log group receives new logs. For example, if the log \
         group receives new log events every 10 minutes, then setting [evaluationFrequency] to \
         [FIFTEEN_MIN] might be appropriate.\n"]
  log_group_arn_list : log_group_arn_list option;
      [@ocaml.doc
        "An array of structures, where each structure contains the ARN of a log group associated \
         with this anomaly detector.\n"]
  detector_name : detector_name option; [@ocaml.doc "The name of the log anomaly detector\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_anomaly_detector_request = {
  anomaly_detector_arn : anomaly_detector_arn;
      [@ocaml.doc
        "The ARN of the anomaly detector to retrieve information about. You can find the ARNs of \
         log anomaly detectors in your account by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html}ListLogAnomalyDetectors} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_details =
  | OpenSearchIntegrationDetails of open_search_integration_details
      [@ocaml.doc
        "This structure contains complete information about one integration between CloudWatch \
         Logs and OpenSearch Service.\n"]
[@@ocaml.doc
  "This structure contains information about the integration configuration. For an integration \
   with OpenSearch Service, this includes information about OpenSearch Service resources such as \
   the collection, the workspace, and policies.\n\n\
  \ This structure is returned by a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html}GetIntegration} \
   operation.\n\
  \ "]

type nonrec get_integration_response = {
  integration_details : integration_details option;
      [@ocaml.doc
        "A structure that contains information about the integration configuration. For an \
         integration with OpenSearch Service, this includes information about OpenSearch Service \
         resources such as the collection, the workspace, and policies.\n"]
  integration_status : integration_status option;
      [@ocaml.doc "The current status of this integration.\n"]
  integration_type : integration_type option;
      [@ocaml.doc
        "The type of integration. Integrations with OpenSearch Service have the type [OPENSEARCH].\n"]
  integration_name : integration_name option; [@ocaml.doc "The name of the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_integration_request = {
  integration_name : integration_name;
      [@ocaml.doc
        "The name of the integration that you want to find information about. To find the name of \
         your integration, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html}ListIntegrations} \n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_source_response = {
  delivery_source : delivery_source option;
      [@ocaml.doc "A structure containing information about the delivery source.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_source_request = {
  name : delivery_source_name;
      [@ocaml.doc "The name of the delivery source that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_destination_policy_response = {
  policy : policy option; [@ocaml.doc "The IAM policy for this delivery destination.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_destination_policy_request = {
  delivery_destination_name : delivery_destination_name;
      [@ocaml.doc "The name of the delivery destination that you want to retrieve the policy of.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_destination_response = {
  delivery_destination : delivery_destination option;
      [@ocaml.doc "A structure containing information about the delivery destination.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_destination_request = {
  name : delivery_destination_name;
      [@ocaml.doc "The name of the delivery destination that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec delivery = {
  tags : tags option; [@ocaml.doc "The tags that have been assigned to this delivery.\n"]
  s3_delivery_configuration : s3_delivery_configuration option;
      [@ocaml.doc
        "This structure contains delivery configurations that apply only when the delivery \
         destination resource is an S3 bucket.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "The field delimiter that is used between record fields when the final output format of a \
         delivery is in [Plain], [W3C], or [Raw] format.\n"]
  record_fields : record_fields option; [@ocaml.doc "The record fields used in this delivery.\n"]
  delivery_destination_type : delivery_destination_type option;
      [@ocaml.doc
        "Displays whether the delivery destination associated with this delivery is CloudWatch \
         Logs, Amazon S3, Firehose, or X-Ray.\n"]
  delivery_destination_arn : arn option;
      [@ocaml.doc "The ARN of the delivery destination that is associated with this delivery.\n"]
  delivery_source_name : delivery_source_name option;
      [@ocaml.doc "The name of the delivery source that is associated with this delivery.\n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies this delivery.\n"]
  id : delivery_id option;
      [@ocaml.doc "The unique ID that identifies this delivery in your account.\n"]
}
[@@ocaml.doc
  "This structure contains information about one {i delivery} in your account. \n\n\
  \ A delivery is a connection between a logical {i delivery source} and a logical {i delivery \
   destination}.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}.\n\
  \  \n\
  \   To update an existing delivery configuration, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration}.\n\
  \   "]

type nonrec get_delivery_response = {
  delivery : delivery option;
      [@ocaml.doc "A structure that contains information about the delivery.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delivery_request = {
  id : delivery_id; [@ocaml.doc "The ID of the delivery that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_protection_policy_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The date and time that this policy was most recently updated.\n"]
  policy_document : data_protection_policy_document option;
      [@ocaml.doc "The data protection policy document for this log group.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc "The log group name or ARN that you specified in your request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_protection_policy_request = {
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "The name or ARN of the log group that contains the data protection policy that you want \
         to see.\n"]
}
[@@ocaml.doc ""]

type nonrec event_id = string [@@ocaml.doc ""]

type nonrec filtered_log_event = {
  event_id : event_id option; [@ocaml.doc "The ID of the event.\n"]
  ingestion_time : timestamp option;
      [@ocaml.doc
        "The time the event was ingested, expressed as the number of milliseconds after [Jan 1, \
         1970 00:00:00 UTC].\n"]
  message : event_message option; [@ocaml.doc "The data contained in the log event.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time the event occurred, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC].\n"]
  log_stream_name : log_stream_name option;
      [@ocaml.doc "The name of the log stream to which this event belongs.\n"]
}
[@@ocaml.doc "Represents a matched event.\n"]

type nonrec filtered_log_events = filtered_log_event list [@@ocaml.doc ""]

type nonrec filter_log_events_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items in the sorting direction specified by the \
         [startFromHead] parameter in the first request. The token expires after 24 hours.\n\n\
        \ If the results don't include a [nextToken], then pagination is finished. \n\
        \ "]
  searched_log_streams : searched_log_streams option;
      [@ocaml.doc
        " {b Important} As of May 15, 2020, this parameter is no longer supported. This parameter \
         returns an empty list.\n\n\
        \ Indicates which log streams have been searched and whether each has been searched \
         completely.\n\
        \ "]
  events : filtered_log_events option; [@ocaml.doc "The matched events.\n"]
}
[@@ocaml.doc ""]

type nonrec interleaved = bool [@@ocaml.doc ""]

type nonrec filter_log_events_request = {
  unmask : unmask option;
      [@ocaml.doc
        "Specify [true] to display the log event fields with all sensitive data unmasked and \
         visible. The default is [false].\n\n\
        \ To use this operation with this parameter, you must be signed into an account with the \
         [logs:Unmask] permission.\n\
        \ "]
  interleaved : interleaved option;
      [@ocaml.doc
        "If the value is true, the operation attempts to provide responses that contain events \
         from multiple log streams within the log group, interleaved in a single response. If the \
         value is false, all the matched log events in the first log stream are searched first, \
         then those in the next log stream, and so on.\n\n\
        \  {b Important} As of June 17, 2019, this parameter is ignored and the value is assumed \
         to be true. The response from this operation always interleaves events from multiple log \
         streams within a log group.\n\
        \ "]
  start_from_head : start_from_head option;
      [@ocaml.doc
        "If the value is true, the earliest log events are returned first. If the value is false, \
         the latest log events are returned first. The default value is true.\n\n\
        \ The [startFromHead] parameter sets the sort direction on the first request. On \
         subsequent requests, the [nextToken] determines the sort direction. To continue \
         paginating in the same direction, provide the returned [nextToken]. If you provide both \
         [nextToken] and [startFromHead], the direction of the [nextToken] is used.\n\
        \ \n\
        \   Setting [startFromHead] to [false] is supported only when [startTime] is on or after \
         [Jan 1, 2024 00:00:00 UTC]. A request with [startFromHead] set to [false] and a \
         [startTime] before this date returns an [InvalidParameterException].\n\
        \   \n\
        \    "]
  limit : events_limit option;
      [@ocaml.doc "The maximum number of events to return. The default is 10,000 events.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of events to return. (You received this token from a previous \
         call.)\n"]
  filter_pattern : filter_pattern option;
      [@ocaml.doc
        "The filter pattern to use. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html}Filter \
         and Pattern Syntax}.\n\n\
        \ If not provided, all the events are matched.\n\
        \ "]
  end_time : timestamp option;
      [@ocaml.doc
        "The end of the time range, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC]. Events with a timestamp later than this time are not returned.\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "The start of the time range, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC]. Events with a timestamp before this time are not returned.\n"]
  log_stream_name_prefix : log_stream_name option;
      [@ocaml.doc
        "Filters the results to include only events from log streams that have names starting with \
         this prefix.\n\n\
        \ If you specify a value for both [logStreamNamePrefix] and [logStreamNames], the action \
         returns an [InvalidParameterException] error.\n\
        \ "]
  log_stream_names : input_log_stream_names option;
      [@ocaml.doc
        "Filters the results to only logs from the log streams in this list.\n\n\
        \ If you specify a value for both [logStreamNames] and [logStreamNamePrefix], the action \
         returns an [InvalidParameterException] error.\n\
        \ "]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to view log events from. If the log group \
         is in a source account and you are using a monitoring account, you must use the log group \
         ARN.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group to search.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec disassociate_source_from_s3_table_integration_response = {
  identifier : s3_table_integration_source_identifier option;
      [@ocaml.doc "The unique identifier of the association that was removed.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_source_from_s3_table_integration_request = {
  identifier : s3_table_integration_source_identifier;
      [@ocaml.doc
        "The unique identifier of the association to remove between the data source and S3 Table \
         Integration.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_kms_key_request = {
  resource_identifier : resource_identifier option;
      [@ocaml.doc
        "Specifies the target for this operation. You must specify one of the following:\n\n\
        \ {ul\n\
        \       {-  Specify the ARN of a log group to stop having CloudWatch Logs use the KMS key \
         to encrypt log events that are ingested and stored by that log group. After you run this \
         operation, CloudWatch Logs encrypts ingested log events with the default CloudWatch Logs \
         method. The log group ARN must be in the following format. Replace {i REGION} and {i \
         ACCOUNT_ID} with your Region and account ID.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            arn:aws:logs:{i REGION}:{i ACCOUNT_ID}:log-group:{i LOG_GROUP_NAME} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       {-  Specify the following ARN to stop using this key to encrypt the results of \
         future \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
         operations in this account. Replace {i REGION} and {i ACCOUNT_ID} with your Region and \
         account ID.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            arn:aws:logs:{i REGION}:{i ACCOUNT_ID}:query-result:*\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       }\n\
        \   In your [DisssociateKmsKey] operation, you must specify either the \
         [resourceIdentifier] parameter or the [logGroup] parameter, but you can't specify both.\n\
        \   "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group.\n\n\
        \ In your [DisassociateKmsKey] operation, you must specify either the [resourceIdentifier] \
         parameter or the [logGroup] parameter, but you can't specify both.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_subscription_filters_response = {
  next_token : next_token option; [@ocaml.doc ""]
  subscription_filters : subscription_filters option; [@ocaml.doc "The subscription filters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_limit = int [@@ocaml.doc ""]

type nonrec describe_subscription_filters_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default is up to \
         50 items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  filter_name_prefix : filter_name option;
      [@ocaml.doc
        "The prefix to match. If you don't specify a value, no prefix filter is applied.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policies_response = {
  next_token : next_token option; [@ocaml.doc ""]
  resource_policies : resource_policies option;
      [@ocaml.doc "The resource policies that exist in this account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policies_request = {
  policy_scope : policy_scope option;
      [@ocaml.doc
        "Specifies the scope of the resource policy. Valid values are [ACCOUNT] or [RESOURCE]. \
         When not specified, defaults to [ACCOUNT].\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs resource for which to query the resource policy.\n"]
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of resource policies to be displayed with one call of this API.\n"]
  next_token : next_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_query_definitions_response = {
  next_token : next_token option; [@ocaml.doc ""]
  query_definitions : query_definition_list option;
      [@ocaml.doc "The list of query definitions that match your request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_query_definitions_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : query_list_max_results option;
      [@ocaml.doc "Limits the number of returned query definitions to the specified number.\n"]
  query_definition_name_prefix : query_definition_name option;
      [@ocaml.doc
        "Use this parameter to filter your results to only the query definitions that have names \
         that start with the prefix you specify.\n"]
  query_language : query_language option;
      [@ocaml.doc
        "The query language used for this query. For more information about the query languages \
         that CloudWatch Logs supports, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html}Supported \
         query languages}.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_queries_response = {
  next_token : next_token option; [@ocaml.doc ""]
  queries : query_info_list option; [@ocaml.doc "The list of queries that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_queries_max_results = int [@@ocaml.doc ""]

type nonrec describe_queries_request = {
  query_language : query_language option;
      [@ocaml.doc
        "Limits the returned queries to only the queries that use the specified query language.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  max_results : describe_queries_max_results option;
      [@ocaml.doc "Limits the number of returned queries to the specified number.\n"]
  status : query_status option;
      [@ocaml.doc
        "Limits the returned queries to only those that have the specified status. Valid values \
         are [Cancelled], [Complete], [Failed], [Running], and [Scheduled].\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc "Limits the returned queries to only those for the specified log group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metric_filters_response = {
  next_token : next_token option; [@ocaml.doc ""]
  metric_filters : metric_filters option; [@ocaml.doc "The metric filters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metric_filters_request = {
  metric_namespace : metric_namespace option;
      [@ocaml.doc
        "Filters results to include only those in the specified namespace. If you include this \
         parameter in your request, you must also include the [metricName] parameter.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "Filters results to include only those with the specified metric name. If you include this \
         parameter in your request, you must also include the [metricNamespace] parameter.\n"]
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default is up to \
         50 items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  filter_name_prefix : filter_name option;
      [@ocaml.doc
        "The prefix to match. CloudWatch Logs uses the value that you set here only if you also \
         include the [logGroupName] parameter in your request.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_lookup_tables_response = {
  next_token : next_token option;
      [@ocaml.doc "The token to use when requesting the next set of items.\n"]
  lookup_tables : lookup_tables option;
      [@ocaml.doc
        "An array of structures, where each structure contains metadata about one lookup table.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_lookup_tables_max_results = int [@@ocaml.doc ""]

type nonrec describe_lookup_tables_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : describe_lookup_tables_max_results option;
      [@ocaml.doc
        "The maximum number of lookup tables to return in the response. The default value is 50 \
         and the maximum value is 100.\n"]
  lookup_table_name_prefix : lookup_table_name option;
      [@ocaml.doc
        "A prefix to filter lookup tables by name. Only tables whose names start with this prefix \
         are returned. If you don't specify a prefix, all tables in the account and Region are \
         returned.\n"]
}
[@@ocaml.doc ""]

type nonrec log_stream = {
  stored_bytes : stored_bytes option;
      [@ocaml.doc
        "The number of bytes stored.\n\n\
        \  {b Important:} As of June 17, 2019, this parameter is no longer supported for log \
         streams, and is always reported as zero. This change applies only to log streams. The \
         [storedBytes] parameter for log groups is not affected.\n\
        \ "]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the log stream.\n"]
  upload_sequence_token : sequence_token option;
      [@ocaml.doc
        "The sequence token.\n\n\
        \  The sequence token is now ignored in [PutLogEvents] actions. [PutLogEvents] actions are \
         always accepted regardless of receiving an invalid sequence token. You don't need to \
         obtain [uploadSequenceToken] to use a [PutLogEvents] action.\n\
        \  \n\
        \   "]
  last_ingestion_time : timestamp option;
      [@ocaml.doc
        "The ingestion time, expressed as the number of milliseconds after [Jan 1, 1970\n\
        \        00:00:00 UTC] The [lastIngestionTime] value updates on an eventual consistency \
         basis. It typically updates in less than an hour after ingestion, but in rare situations \
         might take longer.\n"]
  last_event_timestamp : timestamp option;
      [@ocaml.doc
        "The time of the most recent log event in the log stream in CloudWatch Logs. This number \
         is expressed as the number of milliseconds after [Jan 1, 1970 00:00:00 UTC]. The \
         [lastEventTime] value updates on an eventual consistency basis. It typically updates in \
         less than an hour from ingestion, but in rare situations might take longer.\n"]
  first_event_timestamp : timestamp option;
      [@ocaml.doc
        "The time of the first event, expressed as the number of milliseconds after [Jan 1,\n\
        \        1970 00:00:00 UTC].\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the stream, expressed as the number of milliseconds after [Jan 1, \
         1970 00:00:00 UTC].\n"]
  log_stream_name : log_stream_name option; [@ocaml.doc "The name of the log stream.\n"]
}
[@@ocaml.doc
  "Represents a log stream, which is a sequence of log events from a single emitter of logs.\n"]

type nonrec log_streams = log_stream list [@@ocaml.doc ""]

type nonrec describe_log_streams_response = {
  next_token : next_token option; [@ocaml.doc ""]
  log_streams : log_streams option; [@ocaml.doc "The log streams.\n"]
}
[@@ocaml.doc ""]

type nonrec descending = bool [@@ocaml.doc ""]

type nonrec describe_log_streams_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default is up to \
         50 items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  descending : descending option;
      [@ocaml.doc
        "If the value is true, results are returned in descending order. If the value is to false, \
         results are returned in ascending order. The default value is false.\n"]
  order_by : order_by option;
      [@ocaml.doc
        "If the value is [LogStreamName], the results are ordered by log stream name. If the value \
         is [LastEventTime], the results are ordered by the event time. The default value is \
         [LogStreamName].\n\n\
        \ If you order the results by event time, you cannot specify the [logStreamNamePrefix] \
         parameter.\n\
        \ \n\
        \   [lastEventTimestamp] represents the time of the most recent log event in the log \
         stream in CloudWatch Logs. This number is expressed as the number of milliseconds after \
         [Jan 1, 1970 00:00:00 UTC]. [lastEventTimestamp] updates on an eventual consistency \
         basis. It typically updates in less than an hour from ingestion, but in rare situations \
         might take longer.\n\
        \  "]
  log_stream_name_prefix : log_stream_name option;
      [@ocaml.doc
        "The prefix to match.\n\n\
        \ If [orderBy] is [LastEventTime], you cannot specify this parameter.\n\
        \ "]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to view. If the log group is in a source \
         account and you are using a monitoring account, you must use the log group ARN.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group.\n\n\
        \   You must include either [logGroupIdentifier] or [logGroupName], but not both. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec filter_count = int [@@ocaml.doc ""]

type nonrec data_protection_status =
  | DISABLED [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | ACTIVATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inherited_property = ACCOUNT_DATA_PROTECTION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec inherited_properties = inherited_property list [@@ocaml.doc ""]

type nonrec log_group = {
  bearer_token_authentication_enabled : bearer_token_authentication_enabled option;
      [@ocaml.doc
        "Indicates whether bearer token authentication is enabled for this log group. When \
         enabled, bearer token authentication is allowed on operations until it is explicitly \
         disabled.\n"]
  deletion_protection_enabled : deletion_protection_enabled option;
      [@ocaml.doc
        "Indicates whether deletion protection is enabled for this log group. When enabled, \
         deletion protection blocks all deletion operations until it is explicitly disabled.\n"]
  log_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the log group. This version of the ARN doesn't include \
         a trailing [:*] after the log group name. \n\n\
        \ Use this version to refer to the ARN in the following situations:\n\
        \ \n\
        \  {ul\n\
        \        {-  In the [logGroupIdentifier] input field in many CloudWatch Logs APIs.\n\
        \            \n\
        \             }\n\
        \        {-  In the [resourceArn] field in tagging APIs\n\
        \            \n\
        \             }\n\
        \        {-  In IAM policies, when specifying permissions for \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html}TagResource}, \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html}UntagResource}, \
         and \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  log_group_class : log_group_class option;
      [@ocaml.doc
        "This specifies the log group class for this log group. There are three classes:\n\n\
        \ {ul\n\
        \       {-  The [Standard] log class supports all CloudWatch Logs features.\n\
        \           \n\
        \            }\n\
        \       {-  The [Infrequent Access] log class supports a subset of CloudWatch Logs \
         features and incurs lower costs.\n\
        \           \n\
        \            }\n\
        \       {-  Use the [Delivery] log class only for delivering Lambda logs to store in \
         Amazon S3 or Amazon Data Firehose. Log events in log groups in the Delivery class are \
         kept in CloudWatch Logs for only one day. This log class doesn't offer rich CloudWatch \
         Logs capabilities such as CloudWatch Logs Insights queries.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For details about the features supported by the Standard and Infrequent Access \
         classes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html}Log \
         classes} \n\
        \   "]
  inherited_properties : inherited_properties option;
      [@ocaml.doc
        "Displays all the properties that this log group has inherited from account-level settings.\n"]
  data_protection_status : data_protection_status option;
      [@ocaml.doc
        "Displays whether this log group has a protection policy, or whether it had one in the \
         past. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html}PutDataProtectionPolicy}.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data.\n"]
  stored_bytes : stored_bytes option; [@ocaml.doc "The number of bytes stored.\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the log group. This version of the ARN includes a \
         trailing [:*] after the log group name. \n\n\
        \ Use this version to refer to the ARN in IAM policies when specifying permissions for \
         most API actions. The exception is when specifying permissions for \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html}TagResource}, \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html}UntagResource}, \
         and \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource}. \
         The permissions for those three actions require the ARN version that doesn't include a \
         trailing [:*].\n\
        \ "]
  metric_filter_count : filter_count option; [@ocaml.doc "The number of metric filters.\n"]
  retention_in_days : days option; [@ocaml.doc ""]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the log group, expressed as the number of milliseconds after Jan 1, \
         1970 00:00:00 UTC.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc "Represents a log group.\n"]

type nonrec log_groups = log_group list [@@ocaml.doc ""]

type nonrec describe_log_groups_response = {
  next_token : next_token option; [@ocaml.doc ""]
  log_groups : log_groups option;
      [@ocaml.doc
        "An array of structures, where each structure contains the information about one log group.\n"]
}
[@@ocaml.doc ""]

type nonrec log_group_name_pattern = string [@@ocaml.doc ""]

type nonrec describe_log_groups_log_group_identifiers = log_group_identifier list [@@ocaml.doc ""]

type nonrec describe_log_groups_request = {
  log_group_identifiers : describe_log_groups_log_group_identifiers option;
      [@ocaml.doc
        "Use this array to filter the list of log groups returned. If you specify this parameter, \
         the only other filter that you can choose to specify is [includeLinkedAccounts].\n\n\
        \ If you are using this operation in a monitoring account, you can specify the ARNs of log \
         groups in source accounts and in the monitoring account itself. If you are using this \
         operation in an account that is not a cross-account monitoring account, you can specify \
         only log group names in the same account as the operation.\n\
        \ "]
  log_group_class : log_group_class option;
      [@ocaml.doc
        "Use this parameter to limit the results to only those log groups in the specified log \
         group class. If you omit this parameter, log groups of all classes can be returned.\n\n\
        \ Specifies the log group class for this log group. There are three classes:\n\
        \ \n\
        \  {ul\n\
        \        {-  The [Standard] log class supports all CloudWatch Logs features.\n\
        \            \n\
        \             }\n\
        \        {-  The [Infrequent Access] log class supports a subset of CloudWatch Logs \
         features and incurs lower costs.\n\
        \            \n\
        \             }\n\
        \        {-  Use the [Delivery] log class only for delivering Lambda logs to store in \
         Amazon S3 or Amazon Data Firehose. Log events in log groups in the Delivery class are \
         kept in CloudWatch Logs for only one day. This log class doesn't offer rich CloudWatch \
         Logs capabilities such as CloudWatch Logs Insights queries.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For details about the features supported by each class, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html}Log \
         classes} \n\
        \   "]
  include_linked_accounts : include_linked_accounts option;
      [@ocaml.doc
        "If you are using a monitoring account, set this to [true] to have the operation return \
         log groups in the accounts listed in [accountIdentifiers].\n\n\
        \ If this parameter is set to [true] and [accountIdentifiers] contains a null value, the \
         operation returns all log groups in the monitoring account and all log groups in all \
         source accounts that are linked to the monitoring account. \n\
        \ \n\
        \  The default for this parameter is [false].\n\
        \  "]
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default is up to \
         50 items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  log_group_name_pattern : log_group_name_pattern option;
      [@ocaml.doc
        "If you specify a string for this parameter, the operation returns only log groups that \
         have names that match the string based on a case-sensitive substring search. For example, \
         if you specify [DataLogs], log groups named [DataLogs], [aws/DataLogs], and \
         [GroupDataLogs] would match, but [datalogs], [Data/log/s] and [Groupdata] would not \
         match.\n\n\
        \ If you specify [logGroupNamePattern] in your request, then only [arn], [creationTime], \
         and [logGroupName] are included in the response. \n\
        \ \n\
        \    [logGroupNamePattern] and [logGroupNamePrefix] are mutually exclusive. Only one of \
         these parameters can be passed. \n\
        \   \n\
        \    "]
  log_group_name_prefix : log_group_name option;
      [@ocaml.doc
        "The prefix to match.\n\n\
        \   [logGroupNamePrefix] and [logGroupNamePattern] are mutually exclusive. Only one of \
         these parameters can be passed. \n\
        \  \n\
        \   "]
  account_identifiers : account_ids option;
      [@ocaml.doc
        "When [includeLinkedAccounts] is set to [true], use this parameter to specify the list of \
         accounts to search. You can specify as many as 20 account IDs in the array. \n"]
}
[@@ocaml.doc ""]

type nonrec index_policies = index_policy list [@@ocaml.doc ""]

type nonrec describe_index_policies_response = {
  next_token : next_token option; [@ocaml.doc ""]
  index_policies : index_policies option;
      [@ocaml.doc "An array containing the field index policies.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_index_policies_log_group_identifiers = log_group_identifier list
[@@ocaml.doc ""]

type nonrec describe_index_policies_request = {
  next_token : next_token option; [@ocaml.doc ""]
  log_group_identifiers : describe_index_policies_log_group_identifiers;
      [@ocaml.doc
        "An array containing the name or ARN of the log group that you want to retrieve field \
         index policies for.\n"]
}
[@@ocaml.doc ""]

type nonrec import_id = string [@@ocaml.doc ""]

type nonrec import_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_statistics = {
  bytes_imported : stored_bytes option;
      [@ocaml.doc "The total number of bytes that have been imported to the managed log group.\n"]
}
[@@ocaml.doc "Statistics about the import progress\n"]

type nonrec import_filter = {
  end_event_time : timestamp option;
      [@ocaml.doc
        "The end of the time range for events to import, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
  start_event_time : timestamp option;
      [@ocaml.doc
        "The start of the time range for events to import, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
}
[@@ocaml.doc "The filter criteria used for import tasks\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec import = {
  error_message : error_message option; [@ocaml.doc "Error message related to any failed imports\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The timestamp when the import task was last updated, expressed as the number of \
         milliseconds after Jan 1, 1970 00:00:00 UTC.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The timestamp when the import task was created, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
  import_filter : import_filter option;
      [@ocaml.doc "The filter criteria used for this import task.\n"]
  import_statistics : import_statistics option;
      [@ocaml.doc "Statistics about the import progress\n"]
  import_destination_arn : arn option;
      [@ocaml.doc
        "The ARN of the managed CloudWatch Logs log group where the events are being imported to.\n"]
  import_status : import_status option;
      [@ocaml.doc
        "The current status of the import task. Valid values are IN_PROGRESS, CANCELLED, COMPLETED \
         and FAILED.\n"]
  import_source_arn : arn option;
      [@ocaml.doc "The ARN of the CloudTrail Lake Event Data Store being imported from.\n"]
  import_id : import_id option; [@ocaml.doc "The unique identifier of the import task.\n"]
}
[@@ocaml.doc "An import job to move data from CloudTrail Event Data Store to CloudWatch.\n"]

type nonrec import_list = import list [@@ocaml.doc ""]

type nonrec describe_import_tasks_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use when requesting the next set of results. Not present if there are no \
         additional results to retrieve.\n"]
  imports : import_list option;
      [@ocaml.doc "The list of import tasks that match the request filters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_import_tasks_request = {
  next_token : next_token option; [@ocaml.doc "The pagination token for the next set of results.\n"]
  limit : describe_limit option;
      [@ocaml.doc "The maximum number of import tasks to return in the response. Default: 50\n"]
  import_source_arn : arn option;
      [@ocaml.doc "Optional filter to list imports from a specific source\n"]
  import_status : import_status option;
      [@ocaml.doc
        "Optional filter to list imports by their status. Valid values are IN_PROGRESS, CANCELLED, \
         COMPLETED and FAILED.\n"]
  import_id : import_id option;
      [@ocaml.doc "Optional filter to describe a specific import task by its ID.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_id = string [@@ocaml.doc ""]

type nonrec import_batch = {
  error_message : error_message option;
      [@ocaml.doc
        "The error message if the batch failed to import. Only present when status is FAILED.\n"]
  status : import_status;
      [@ocaml.doc
        "The current status of the import batch. Valid values are IN_PROGRESS, CANCELLED, \
         COMPLETED and FAILED.\n"]
  batch_id : batch_id; [@ocaml.doc "The unique identifier of the import batch.\n"]
}
[@@ocaml.doc "A collection of events being imported to CloudWatch\n"]

type nonrec import_batch_list = import_batch list [@@ocaml.doc ""]

type nonrec describe_import_task_batches_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use when requesting the next set of results. Not present if there are no \
         additional results to retrieve.\n"]
  import_batches : import_batch_list option;
      [@ocaml.doc "The list of import batches that match the request filters.\n"]
  import_id : import_id option; [@ocaml.doc "The ID of the import task.\n"]
  import_source_arn : arn option; [@ocaml.doc "The ARN of the source being imported from.\n"]
}
[@@ocaml.doc ""]

type nonrec import_status_list = import_status list [@@ocaml.doc ""]

type nonrec describe_import_task_batches_request = {
  next_token : next_token option; [@ocaml.doc "The pagination token for the next set of results.\n"]
  limit : describe_limit option;
      [@ocaml.doc "The maximum number of import batches to return in the response. Default: 10\n"]
  batch_import_status : import_status_list option;
      [@ocaml.doc
        "Optional filter to list import batches by their status. Accepts multiple status values: \
         IN_PROGRESS, CANCELLED, COMPLETED and FAILED.\n"]
  import_id : import_id; [@ocaml.doc "The ID of the import task to get batch information for.\n"]
}
[@@ocaml.doc ""]

type nonrec index_type = FIELD_INDEX [@ocaml.doc ""] | FACET [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec field_index = {
  type_ : index_type option;
      [@ocaml.doc
        "The type of index. Specify [FACET] for facet-based indexing or [FIELD_INDEX] for \
         field-based indexing. This determines how the field is indexed and can be queried.\n"]
  last_event_time : timestamp option;
      [@ocaml.doc
        "The time and date of the most recent log event that matches this field index. \n"]
  first_event_time : timestamp option;
      [@ocaml.doc
        "The time and date of the earliest log event that matches this field index, after the \
         index policy that contains it was created. \n"]
  last_scan_time : timestamp option;
      [@ocaml.doc
        "The most recent time that CloudWatch Logs scanned ingested log events to search for this \
         field index to improve the speed of future CloudWatch Logs Insights queries that search \
         for this field index.\n"]
  field_index_name : field_index_name option;
      [@ocaml.doc "The string that this field index matches.\n"]
  log_group_identifier : log_group_identifier option;
      [@ocaml.doc
        "If this field index appears in an index policy that applies only to a single log group, \
         the ARN of that log group is displayed here.\n"]
}
[@@ocaml.doc
  "This structure describes one log event field that is used as an index in at least one index \
   policy in this account.\n"]

type nonrec field_indexes = field_index list [@@ocaml.doc ""]

type nonrec describe_field_indexes_response = {
  next_token : next_token option; [@ocaml.doc ""]
  field_indexes : field_indexes option;
      [@ocaml.doc "An array containing the field index information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_field_indexes_log_group_identifiers = log_group_identifier list
[@@ocaml.doc ""]

type nonrec describe_field_indexes_request = {
  next_token : next_token option; [@ocaml.doc ""]
  log_group_identifiers : describe_field_indexes_log_group_identifiers;
      [@ocaml.doc
        "An array containing the names or ARNs of the log groups that you want to retrieve field \
         indexes for.\n"]
}
[@@ocaml.doc ""]

type nonrec export_task_id = string [@@ocaml.doc ""]

type nonrec export_task_name = string [@@ocaml.doc ""]

type nonrec export_destination_bucket = string [@@ocaml.doc ""]

type nonrec export_destination_prefix = string [@@ocaml.doc ""]

type nonrec export_task_status_code =
  | RUNNING [@ocaml.doc ""]
  | PENDING_CANCEL [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec export_task_status_message = string [@@ocaml.doc ""]

type nonrec export_task_status = {
  message : export_task_status_message option;
      [@ocaml.doc "The status message related to the status code.\n"]
  code : export_task_status_code option; [@ocaml.doc "The status code of the export task.\n"]
}
[@@ocaml.doc "Represents the status of an export task.\n"]

type nonrec export_task_execution_info = {
  completion_time : timestamp option;
      [@ocaml.doc
        "The completion time of the export task, expressed as the number of milliseconds after \
         [Jan 1, 1970 00:00:00 UTC].\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The creation time of the export task, expressed as the number of milliseconds after [Jan \
         1, 1970 00:00:00 UTC].\n"]
}
[@@ocaml.doc "Represents the status of an export task.\n"]

type nonrec export_task = {
  execution_info : export_task_execution_info option;
      [@ocaml.doc "Execution information about the export task.\n"]
  status : export_task_status option; [@ocaml.doc "The status of the export task.\n"]
  destination_prefix : export_destination_prefix option;
      [@ocaml.doc
        "The prefix that was used as the start of Amazon S3 key for every object exported.\n"]
  destination : export_destination_bucket option;
      [@ocaml.doc "The name of the S3 bucket to which the log data was exported.\n"]
  to_ : timestamp option;
      [@ocaml.doc
        "The end time, expressed as the number of milliseconds after [Jan 1, 1970 00:00:00\n\
        \        UTC]. Events with a timestamp later than this time are not exported.\n"]
  from_ : timestamp option;
      [@ocaml.doc
        "The start time, expressed as the number of milliseconds after [Jan 1, 1970\n\
        \        00:00:00 UTC]. Events with a timestamp before this time are not exported.\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc "The name of the log group from which logs data was exported.\n"]
  task_name : export_task_name option; [@ocaml.doc "The name of the export task.\n"]
  task_id : export_task_id option; [@ocaml.doc "The ID of the export task.\n"]
}
[@@ocaml.doc "Represents an export task.\n"]

type nonrec export_tasks = export_task list [@@ocaml.doc ""]

type nonrec describe_export_tasks_response = {
  next_token : next_token option; [@ocaml.doc ""]
  export_tasks : export_tasks option; [@ocaml.doc "The export tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_export_tasks_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default is up to \
         50 items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  status_code : export_task_status_code option;
      [@ocaml.doc
        "The status code of the export task. Specifying a status code filters the results to zero \
         or more export tasks.\n"]
  task_id : export_task_id option;
      [@ocaml.doc
        "The ID of the export task. Specifying a task ID filters the results to one or zero export \
         tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec destinations = destination list [@@ocaml.doc ""]

type nonrec describe_destinations_response = {
  next_token : next_token option; [@ocaml.doc ""]
  destinations : destinations option; [@ocaml.doc "The destinations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_destinations_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "The maximum number of items returned. If you don't specify a value, the default maximum \
         value of 50 items is used.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  destination_name_prefix : destination_name option;
      [@ocaml.doc
        "The prefix to match. If you don't specify a value, no prefix filter is applied.\n"]
}
[@@ocaml.doc ""]

type nonrec delivery_sources = delivery_source list [@@ocaml.doc ""]

type nonrec describe_delivery_sources_response = {
  next_token : next_token option; [@ocaml.doc ""]
  delivery_sources : delivery_sources option;
      [@ocaml.doc
        "An array of structures. Each structure contains information about one delivery source in \
         the account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_delivery_sources_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "Optionally specify the maximum number of delivery sources to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delivery_destinations = delivery_destination list [@@ocaml.doc ""]

type nonrec describe_delivery_destinations_response = {
  next_token : next_token option; [@ocaml.doc ""]
  delivery_destinations : delivery_destinations option;
      [@ocaml.doc
        "An array of structures. Each structure contains information about one delivery \
         destination in the account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_delivery_destinations_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "Optionally specify the maximum number of delivery destinations to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec deliveries = delivery list [@@ocaml.doc ""]

type nonrec describe_deliveries_response = {
  next_token : next_token option; [@ocaml.doc ""]
  deliveries : deliveries option;
      [@ocaml.doc
        "An array of structures. Each structure contains information about one delivery in the \
         account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_deliveries_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "Optionally specify the maximum number of deliveries to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec configuration_template_delivery_config_values = {
  s3_delivery_configuration : s3_delivery_configuration option;
      [@ocaml.doc
        "The delivery parameters that are used when you create a delivery to a delivery \
         destination that is an S3 Bucket.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "The default field delimiter that is used in a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         operation when the field delimiter is not specified in that operation. The field \
         delimiter is used only when the final output delivery is in [Plain], [W3C], or [Raw] \
         format.\n"]
  record_fields : record_fields option;
      [@ocaml.doc
        "The default record fields that will be delivered when a list of record fields is not \
         provided in a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         operation.\n"]
}
[@@ocaml.doc
  "This structure contains the default values that are used for each configuration parameter when \
   you use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
   to create a deliver under the current service type, resource type, and log type.\n"]

type nonrec allowed_fields = record_field list [@@ocaml.doc ""]

type nonrec allowed_action_for_allow_vended_logs_delivery_for_resource = string [@@ocaml.doc ""]

type nonrec allowed_field_delimiters = field_delimiter list [@@ocaml.doc ""]

type nonrec delivery_source_configuration_schema_field = string [@@ocaml.doc ""]

type nonrec delivery_source_configuration_schema_value_type =
  | LONG [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | INT [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_source_configuration_supported_values =
  delivery_source_configuration_schema_field list
[@@ocaml.doc ""]

type nonrec delivery_source_configuration_numeric_value = float [@@ocaml.doc ""]

type nonrec delivery_source_configuration_schema = {
  max_value : delivery_source_configuration_numeric_value option;
      [@ocaml.doc
        "The maximum numeric value allowed for the configuration. This applies only when the \
         [valueType] is a numeric type.\n"]
  min_value : delivery_source_configuration_numeric_value option;
      [@ocaml.doc
        "The minimum numeric value allowed for the configuration. This applies only when the \
         [valueType] is a numeric type.\n"]
  supported_values : delivery_source_configuration_supported_values option;
      [@ocaml.doc
        "The list of allowed values for the configuration. Empty for free-form configuration.\n"]
  default_value : delivery_source_configuration_schema_field;
      [@ocaml.doc
        "The default value of the configuration that is used when a value is not specified in a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource} \
         request.\n"]
  value_type : delivery_source_configuration_schema_value_type;
      [@ocaml.doc
        "The data type of the configuration value. Valid values are [string], [boolean], [int], \
         [double], and [long].\n"]
  key_name : delivery_source_configuration_schema_field;
      [@ocaml.doc "The name of the configuration.\n"]
}
[@@ocaml.doc
  "A structure that describes a single configuration for a log type, including its name, value \
   type, default value, and the range of supported values.\n"]

type nonrec delivery_source_configuration_schemas = delivery_source_configuration_schema list
[@@ocaml.doc ""]

type nonrec configuration_template = {
  s3_tables_integration : s3_tables_integration option;
      [@ocaml.doc
        "The S3 Tables integration configuration for this configuration template, including the \
         datasource name and type.\n"]
  delivery_source_configuration : delivery_source_configuration_schemas option;
      [@ocaml.doc
        "The schema of the delivery source configuration that is available for this log type. Each \
         element describes a configuration that can be set when calling \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}, \
         including the configuration name, type, and default value.\n"]
  allowed_suffix_path_fields : record_fields option;
      [@ocaml.doc
        "The list of variable fields that can be used in the suffix path of a delivery that \
         delivers to an S3 bucket.\n"]
  allowed_field_delimiters : allowed_field_delimiters option;
      [@ocaml.doc
        "The valid values that a caller can use as field delimiters when calling \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration} \
         on a delivery that delivers in [Plain], [W3C], or [Raw] format.\n"]
  allowed_action_for_allow_vended_logs_delivery_for_resource :
    allowed_action_for_allow_vended_logs_delivery_for_resource option;
      [@ocaml.doc
        "The action permissions that a caller needs to have to be able to successfully create a \
         delivery source on the desired resource type when calling \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n"]
  allowed_output_formats : output_formats option;
      [@ocaml.doc
        "The list of delivery destination output formats that are supported by this log source.\n"]
  allowed_fields : allowed_fields option;
      [@ocaml.doc
        "The allowed fields that a caller can use in the [recordFields] parameter of a \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration} \
         operation.\n"]
  default_delivery_config_values : configuration_template_delivery_config_values option;
      [@ocaml.doc
        "A mapping that displays the default value of each property within a delivery's \
         configuration, if it is not specified in the request.\n"]
  delivery_destination_type : delivery_destination_type option;
      [@ocaml.doc
        "A string specifying which destination type this configuration template applies to.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "A string specifying which resource type this configuration template applies to.\n"]
  log_type : log_type option;
      [@ocaml.doc "A string specifying which log type this configuration template applies to.\n"]
  service : service option;
      [@ocaml.doc
        "A string specifying which service this configuration template applies to. For more \
         information about supported services see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enable \
         logging from Amazon Web Services services.}.\n"]
}
[@@ocaml.doc
  "A structure containing information about the deafult settings and available settings that you \
   can use to configure a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html}delivery} \
   or a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeliveryDestination.html}delivery \
   destination}.\n"]

type nonrec configuration_templates = configuration_template list [@@ocaml.doc ""]

type nonrec describe_configuration_templates_response = {
  next_token : next_token option; [@ocaml.doc ""]
  configuration_templates : configuration_templates option;
      [@ocaml.doc
        "An array of objects, where each object describes one configuration template that matches \
         the filters that you specified in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec log_types = log_type list [@@ocaml.doc ""]

type nonrec delivery_destination_types = delivery_destination_type list [@@ocaml.doc ""]

type nonrec describe_configuration_templates_request = {
  limit : describe_limit option;
      [@ocaml.doc
        "Use this parameter to limit the number of configuration templates that are returned in \
         the response.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  delivery_destination_types : delivery_destination_types option;
      [@ocaml.doc
        "Use this parameter to filter the response to include only the configuration templates \
         that apply to the delivery destination types that you specify here.\n"]
  resource_types : resource_types option;
      [@ocaml.doc
        "Use this parameter to filter the response to include only the configuration templates \
         that apply to the resource types that you specify here.\n"]
  log_types : log_types option;
      [@ocaml.doc
        "Use this parameter to filter the response to include only the configuration templates \
         that apply to the log types that you specify here.\n"]
  service : service option;
      [@ocaml.doc
        "Use this parameter to filter the response to include only the configuration templates \
         that apply to the Amazon Web Services service that you specify here.\n"]
}
[@@ocaml.doc ""]

type nonrec account_policies = account_policy list [@@ocaml.doc ""]

type nonrec describe_account_policies_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use when requesting the next set of items. The token expires after 24 hours.\n"]
  account_policies : account_policies option;
      [@ocaml.doc
        "An array of structures that contain information about the CloudWatch Logs account \
         policies that match the specified filters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_policies_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  account_identifiers : account_ids option;
      [@ocaml.doc
        "If you are using an account that is set up as a monitoring account for CloudWatch unified \
         cross-account observability, you can use this to specify the account ID of a source \
         account. If you do, the operation returns the account policy for the specified account. \
         Currently, you can specify only one account ID in this parameter.\n\n\
        \ If you omit this parameter, only the policy in the current account is returned.\n\
        \ "]
  policy_name : policy_name option;
      [@ocaml.doc
        "Use this parameter to limit the returned policies to only the policy with the name that \
         you specify.\n"]
  policy_type : policy_type;
      [@ocaml.doc
        "Use this parameter to limit the returned policies to only the policies that match the \
         policy type that you specify.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_transformer_request = {
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "Specify either the name or ARN of the log group to delete the transformer for. If the log \
         group is in a source account and you are using a monitoring account, you must use the log \
         group ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_syslog_configuration_request = {
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc
        "The ID of the VPC endpoint associated with the syslog configuration to delete.\n"]
  log_group_identifier : log_group_identifier;
      [@ocaml.doc "The name or ARN of the log group to remove the syslog configuration from.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_subscription_filter_request = {
  filter_name : filter_name; [@ocaml.doc "The name of the subscription filter.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_query_response = unit [@@ocaml.doc ""]

type nonrec delete_scheduled_query_request = {
  identifier : scheduled_query_identifier;
      [@ocaml.doc "The ARN or name of the scheduled query to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_retention_policy_request = {
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  expected_revision_id : expected_revision_id option;
      [@ocaml.doc
        "The expected revision ID of the resource policy. Required when deleting a resource-scoped \
         policy to prevent concurrent modifications.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs resource for which the resource policy needs to be deleted\n"]
  policy_name : policy_name option;
      [@ocaml.doc "The name of the policy to be revoked. This parameter is required.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_query_definition_response = {
  success : success option;
      [@ocaml.doc
        "A value of TRUE indicates that the operation succeeded. FALSE indicates that the \
         operation failed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_query_definition_request = {
  query_definition_id : query_id;
      [@ocaml.doc
        "The ID of the query definition that you want to delete. You can use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html}DescribeQueryDefinitions} \
         to retrieve the IDs of your saved query definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_metric_filter_request = {
  filter_name : filter_name; [@ocaml.doc "The name of the metric filter.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lookup_table_request = {
  lookup_table_arn : arn; [@ocaml.doc "The ARN of the lookup table to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_log_stream_request = {
  log_stream_name : log_stream_name; [@ocaml.doc "The name of the log stream.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_log_group_request = {
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_log_anomaly_detector_request = {
  anomaly_detector_arn : anomaly_detector_arn;
      [@ocaml.doc
        "The ARN of the anomaly detector to delete. You can find the ARNs of log anomaly detectors \
         in your account by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html}ListLogAnomalyDetectors} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_integration_response = unit [@@ocaml.doc ""]

type nonrec force = bool [@@ocaml.doc ""]

type nonrec delete_integration_request = {
  force : force option;
      [@ocaml.doc
        "Specify [true] to force the deletion of the integration even if vended logs dashboards \
         currently exist.\n\n\
        \ The default is [false].\n\
        \ "]
  integration_name : integration_name;
      [@ocaml.doc
        "The name of the integration to delete. To find the name of your integration, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html}ListIntegrations}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_index_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_index_policy_request = {
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "The log group to delete the index policy for. You can specify either the name or the ARN \
         of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_destination_request = {
  destination_name : destination_name; [@ocaml.doc "The name of the destination.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_delivery_source_request = {
  name : delivery_source_name;
      [@ocaml.doc "The name of the delivery source that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_delivery_destination_policy_request = {
  delivery_destination_name : delivery_destination_name;
      [@ocaml.doc "The name of the delivery destination that you want to delete the policy for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_delivery_destination_request = {
  name : delivery_destination_name;
      [@ocaml.doc
        "The name of the delivery destination that you want to delete. You can find a list of \
         delivery destination names by using the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveryDestinations.html}DescribeDeliveryDestinations} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_delivery_request = {
  id : delivery_id;
      [@ocaml.doc
        "The unique ID of the delivery to delete. You can find the ID of a delivery with the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html}DescribeDeliveries} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_protection_policy_request = {
  log_group_identifier : log_group_identifier;
      [@ocaml.doc
        "The name or ARN of the log group that you want to delete the data protection policy for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_policy_request = {
  policy_type : policy_type; [@ocaml.doc "The type of policy to delete.\n"]
  policy_name : policy_name; [@ocaml.doc "The name of the policy to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scheduled_query_response = {
  state : scheduled_query_state option; [@ocaml.doc "The current state of the scheduled query.\n"]
  scheduled_query_arn : arn option; [@ocaml.doc "The ARN of the created scheduled query.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scheduled_query_request = {
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs to associate with the scheduled query for resource management and cost \
         allocation.\n"]
  state : scheduled_query_state option;
      [@ocaml.doc
        "The initial state of the scheduled query. Valid values are [ENABLED] and [DISABLED]. \
         Default is [ENABLED].\n"]
  execution_role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the IAM role that grants permissions to execute the query and deliver results \
         to the specified destination. The role must have permissions to read from the specified \
         log groups and write to the destination.\n"]
  schedule_end_time : timestamp option;
      [@ocaml.doc
        "The end time for the scheduled query in Unix epoch format. The query will stop executing \
         after this time.\n"]
  schedule_start_time : timestamp option;
      [@ocaml.doc
        "The start time for the scheduled query in Unix epoch format. The query will not execute \
         before this time.\n"]
  destination_configuration : destination_configuration option;
      [@ocaml.doc
        "Configuration for where to deliver query results. Currently supports Amazon S3 \
         destinations for storing query output.\n"]
  end_time_offset : end_time_offset option;
      [@ocaml.doc
        "The time offset in seconds that defines the end of the lookback period for the query. \
         Together with [startTimeOffset], this determines the time window relative to the \
         execution time over which the query runs.\n"]
  start_time_offset : start_time_offset option;
      [@ocaml.doc
        "The time offset in seconds that defines the lookback period for the query. This \
         determines how far back in time the query searches from the execution time.\n"]
  timezone : schedule_timezone option;
      [@ocaml.doc
        "The timezone for evaluating the schedule expression. This determines when the scheduled \
         query executes relative to the specified timezone.\n"]
  schedule_expression : schedule_expression;
      [@ocaml.doc
        "A cron expression that defines when the scheduled query runs. The expression uses \
         standard cron syntax and supports minute-level precision. Maximum length is 256 \
         characters.\n"]
  log_group_identifiers : scheduled_query_log_group_identifiers option;
      [@ocaml.doc
        "An array of log group names or ARNs to query. You can specify between 1 and 50 log \
         groups. Log groups can be identified by name or full ARN.\n"]
  query_string : query_string;
      [@ocaml.doc
        "The query string to execute. This is the same query syntax used in CloudWatch Logs \
         Insights. Maximum length is 10,000 characters.\n"]
  query_language : query_language;
      [@ocaml.doc
        "The query language to use for the scheduled query. Valid values are [CWLI], [PPL], and \
         [SQL].\n"]
  description : scheduled_query_description option;
      [@ocaml.doc
        "An optional description for the scheduled query to help identify its purpose and \
         functionality.\n"]
  name : scheduled_query_name;
      [@ocaml.doc
        "The name of the scheduled query. The name must be unique within your account and region. \
         Length must be between 1 and 300 characters.\n"]
}
[@@ocaml.doc ""]

type nonrec create_lookup_table_response = {
  created_at : timestamp option;
      [@ocaml.doc
        "The time when the lookup table was created, expressed as the number of milliseconds after \
         [Jan 1, 1970 00:00:00 UTC].\n"]
  lookup_table_arn : arn option; [@ocaml.doc "The ARN of the lookup table that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_lookup_table_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the lookup table. You can associate as many \
         as 50 tags with a lookup table. Tags can help you organize and categorize your resources.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ARN of the KMS key to use to encrypt the lookup table data. If you don't specify a \
         key, the data is encrypted with an Amazon Web Services-owned key.\n"]
  table_body : table_body;
      [@ocaml.doc
        "The CSV content of the lookup table. The first row must be a header row with column \
         names. The content must use UTF-8 encoding and not exceed 10 MB.\n"]
  description : lookup_table_description option;
      [@ocaml.doc
        "A description of the lookup table. The description can be up to 1024 characters long.\n"]
  lookup_table_name : lookup_table_name;
      [@ocaml.doc
        "The name of the lookup table. The name must be unique within your account and Region. The \
         name can contain only alphanumeric characters and underscores, and can be up to 256 \
         characters long.\n"]
}
[@@ocaml.doc ""]

type nonrec create_log_stream_request = {
  log_stream_name : log_stream_name; [@ocaml.doc "The name of the log stream.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_log_group_request = {
  deletion_protection_enabled : deletion_protection_enabled option;
      [@ocaml.doc
        "Use this parameter to enable deletion protection for the new log group. When enabled on a \
         log group, deletion protection blocks all deletion operations until it is explicitly \
         disabled. By default log groups are created without deletion protection enabled.\n"]
  log_group_class : log_group_class option;
      [@ocaml.doc
        "Use this parameter to specify the log group class for this log group. There are three \
         classes:\n\n\
        \ {ul\n\
        \       {-  The [Standard] log class supports all CloudWatch Logs features.\n\
        \           \n\
        \            }\n\
        \       {-  The [Infrequent Access] log class supports a subset of CloudWatch Logs \
         features and incurs lower costs.\n\
        \           \n\
        \            }\n\
        \       {-  Use the [Delivery] log class only for delivering Lambda logs to store in \
         Amazon S3 or Amazon Data Firehose. Log events in log groups in the Delivery class are \
         kept in CloudWatch Logs for only one day. This log class doesn't offer rich CloudWatch \
         Logs capabilities such as CloudWatch Logs Insights queries.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you omit this parameter, the default of [STANDARD] is used.\n\
        \   \n\
        \     The value of [logGroupClass] can't be changed after a log group is created.\n\
        \     \n\
        \       For details about the features supported by each class, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html}Log \
         classes} \n\
        \       "]
  tags : tags option;
      [@ocaml.doc
        "The key-value pairs to use for the tags.\n\n\
        \ You can grant users access to certain log groups while preventing them from accessing \
         other log groups. To do so, tag your groups and use IAM policies that refer to those \
         tags. To assign tags when you create a log group, you must have either the \
         [logs:TagResource] or [logs:TagLogGroup] permission. For more information about tagging, \
         see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources}. For more information about using tags to control access, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Controlling access \
         to Amazon Web Services resources using tags}.\n\
        \ "]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms}Amazon \
         Resource Names}.\n"]
  log_group_name : log_group_name; [@ocaml.doc "A name for the log group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_log_anomaly_detector_response = {
  anomaly_detector_arn : anomaly_detector_arn option;
      [@ocaml.doc "The ARN of the log anomaly detector that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec detector_kms_key_arn = string [@@ocaml.doc ""]

type nonrec create_log_anomaly_detector_request = {
  tags : tags option;
      [@ocaml.doc
        "An optional list of key-value pairs to associate with the resource.\n\n\
        \ For more information about tagging, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources} \n\
        \ "]
  anomaly_visibility_time : anomaly_visibility_time option;
      [@ocaml.doc
        "The number of days to have visibility on an anomaly. After this time period has elapsed \
         for an anomaly, it will be automatically baselined and the anomaly detector will treat \
         new occurrences of a similar anomaly as normal. Therefore, if you do not correct the \
         cause of an anomaly during the time period specified in [anomalyVisibilityTime], it will \
         be considered normal going forward and will not be detected as an anomaly.\n"]
  kms_key_id : detector_kms_key_arn option;
      [@ocaml.doc
        "Optionally assigns a KMS key to secure this anomaly detector and its findings. If a key \
         is assigned, the anomalies found and the model used by this detector are encrypted at \
         rest with the key. If a key is assigned to an anomaly detector, a user must have \
         permissions for both this key and for the anomaly detector to retrieve information about \
         the anomalies that it finds.\n\n\
        \  Make sure the value provided is a valid KMS key ARN. For more information about using a \
         KMS key and to see the required IAM policy, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection-KMS.html}Use \
         a KMS key with an anomaly detector}.\n\
        \ "]
  filter_pattern : filter_pattern option;
      [@ocaml.doc
        "You can use this parameter to limit the anomaly detection model to examine only log \
         events that match the pattern you specify here. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html}Filter \
         and Pattern Syntax}.\n"]
  evaluation_frequency : evaluation_frequency option;
      [@ocaml.doc
        "Specifies how often the anomaly detector is to run and look for anomalies. Set this value \
         according to the frequency that the log group receives new logs. For example, if the log \
         group receives new log events every 10 minutes, then 15 minutes might be a good setting \
         for [evaluationFrequency] .\n"]
  detector_name : detector_name option; [@ocaml.doc "A name for this anomaly detector.\n"]
  log_group_arn_list : log_group_arn_list;
      [@ocaml.doc
        "An array containing the ARN of the log group that this anomaly detector will watch. You \
         can specify only one log group ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec create_import_task_response = {
  creation_time : timestamp option;
      [@ocaml.doc
        "The timestamp when the import task was created, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
  import_destination_arn : arn option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs log group created as the destination for the imported \
         events.\n"]
  import_id : import_id option; [@ocaml.doc "A unique identifier for the import task.\n"]
}
[@@ocaml.doc ""]

type nonrec create_import_task_request = {
  import_filter : import_filter option;
      [@ocaml.doc
        "Optional filters to constrain the import by CloudTrail event time. Times are specified in \
         Unix timestamp milliseconds. The range of data being imported must be within the \
         specified source's retention period.\n"]
  import_role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the IAM role that grants CloudWatch Logs permission to import from the \
         CloudTrail Lake Event Data Store.\n"]
  import_source_arn : arn; [@ocaml.doc "The ARN of the source to import from.\n"]
}
[@@ocaml.doc ""]

type nonrec create_export_task_response = {
  task_id : export_task_id option; [@ocaml.doc "The ID of the export task.\n"]
}
[@@ocaml.doc ""]

type nonrec create_export_task_request = {
  destination_prefix : export_destination_prefix option;
      [@ocaml.doc
        "The prefix used as the start of the key for every object exported. If you don't specify a \
         value, the default is [exportedlogs].\n\n\
        \ The length of this parameter must comply with the S3 object key name length limits. The \
         object key name is a sequence of Unicode characters with UTF-8 encoding, and can be up to \
         1,024 bytes.\n\
        \ "]
  destination : export_destination_bucket;
      [@ocaml.doc
        "The name of S3 bucket for the exported log data. The bucket must be in the same Amazon \
         Web Services Region.\n"]
  to_ : timestamp;
      [@ocaml.doc
        "The end time of the range for the request, expressed as the number of milliseconds after \
         [Jan 1, 1970 00:00:00 UTC]. Events with a timestamp later than this time are not \
         exported.\n\n\
        \ You must specify a time that is not earlier than when this log group was created.\n\
        \ "]
  from_ : timestamp;
      [@ocaml.doc
        "The start time of the range for the request, expressed as the number of milliseconds \
         after [Jan 1, 1970 00:00:00 UTC]. Events with a timestamp earlier than this time are not \
         exported.\n"]
  log_stream_name_prefix : log_stream_name option;
      [@ocaml.doc
        "Export only log streams that match the provided prefix. If you don't specify a value, no \
         prefix filter is applied.\n"]
  log_group_name : log_group_name; [@ocaml.doc "The name of the log group.\n"]
  task_name : export_task_name option; [@ocaml.doc "The name of the export task.\n"]
}
[@@ocaml.doc ""]

type nonrec create_delivery_response = {
  delivery : delivery option;
      [@ocaml.doc
        "A structure that contains information about the delivery that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_delivery_request = {
  tags : tags option;
      [@ocaml.doc
        "An optional list of key-value pairs to associate with the resource.\n\n\
        \ For more information about tagging, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
         Services resources} \n\
        \ "]
  s3_delivery_configuration : s3_delivery_configuration option;
      [@ocaml.doc
        "This structure contains parameters that are valid only when the delivery's delivery \
         destination is an S3 bucket.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "The field delimiter to use between record fields when the final output format of a \
         delivery is in [Plain], [W3C], or [Raw] format.\n"]
  record_fields : record_fields option;
      [@ocaml.doc
        "The list of record fields to be delivered to the destination, in order. If the delivery's \
         log source has mandatory fields, they must be included in this list.\n"]
  delivery_destination_arn : arn;
      [@ocaml.doc "The ARN of the delivery destination to use for this delivery.\n"]
  delivery_source_name : delivery_source_name;
      [@ocaml.doc "The name of the delivery source to use for this delivery.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_import_task_response = {
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The timestamp when the import task was cancelled, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The timestamp when the import task was created, expressed as the number of milliseconds \
         after Jan 1, 1970 00:00:00 UTC.\n"]
  import_status : import_status option;
      [@ocaml.doc "The final status of the import task. This will be set to CANCELLED.\n"]
  import_statistics : import_statistics option;
      [@ocaml.doc "Statistics about the import progress at the time of cancellation.\n"]
  import_id : import_id option; [@ocaml.doc "The ID of the cancelled import task.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_import_task_request = {
  import_id : import_id; [@ocaml.doc "The ID of the import task to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_export_task_request = {
  task_id : export_task_id; [@ocaml.doc "The ID of the export task.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_source_to_s3_table_integration_response = {
  identifier : s3_table_integration_source_identifier option;
      [@ocaml.doc
        "The unique identifier for the association between the data source and S3 Table Integration.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_source_to_s3_table_integration_request = {
  data_source : data_source;
      [@ocaml.doc
        "The data source to associate with the S3 Table Integration. Contains the name and type of \
         the data source.\n"]
  integration_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 Table Integration to associate the data source \
         with.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_kms_key_request = {
  resource_identifier : resource_identifier option;
      [@ocaml.doc
        "Specifies the target for this operation. You must specify one of the following:\n\n\
        \ {ul\n\
        \       {-  Specify the following ARN to have future \
         {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html}GetQueryResults} \
         operations in this account encrypt the results with the specified KMS key. Replace {i \
         REGION} and {i ACCOUNT_ID} with your Region and account ID.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            arn:aws:logs:{i REGION}:{i ACCOUNT_ID}:query-result:*\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       {-  Specify the ARN of a log group to have CloudWatch Logs use the KMS key to \
         encrypt log events that are ingested and stored by that log group. The log group ARN must \
         be in the following format. Replace {i REGION} and {i ACCOUNT_ID} with your Region and \
         account ID.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            arn:aws:logs:{i REGION}:{i ACCOUNT_ID}:log-group:{i LOG_GROUP_NAME} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       }\n\
        \   In your [AssociateKmsKey] operation, you must specify either the [resourceIdentifier] \
         parameter or the [logGroup] parameter, but you can't specify both.\n\
        \   "]
  kms_key_id : kms_key_id;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. This must \
         be a symmetric KMS key. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms}Amazon \
         Resource Names} and \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Using \
         Symmetric and Asymmetric Keys}.\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the log group.\n\n\
        \ In your [AssociateKmsKey] operation, you must specify either the [resourceIdentifier] \
         parameter or the [logGroup] parameter, but you can't specify both.\n\
        \ "]
}
[@@ocaml.doc ""]
