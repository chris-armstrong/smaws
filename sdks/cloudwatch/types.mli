type nonrec account_id = string [@@ocaml.doc ""]

type nonrec action_log_line_count = int [@@ocaml.doc ""]

type nonrec action_log_line_role_arn = string [@@ocaml.doc ""]

type nonrec action_prefix = string [@@ocaml.doc ""]

type nonrec actions_enabled = bool [@@ocaml.doc ""]

type nonrec actions_suppressed_by =
  | WaitPeriod [@ocaml.doc ""]
  | ExtensionPeriod [@ocaml.doc ""]
  | Alarm [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec actions_suppressed_reason = string [@@ocaml.doc ""]

type nonrec aggregation_expression = string [@@ocaml.doc ""]

type nonrec alarm_arn = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec state_reason = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec contributor_attributes = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec contributor_id = string [@@ocaml.doc ""]

type nonrec alarm_contributor = {
  contributor_id : contributor_id;
      [@ocaml.doc "The unique identifier for this alarm contributor.\n"]
  contributor_attributes : contributor_attributes;
      [@ocaml.doc
        "A map of attributes that describe the contributor, such as metric dimensions and other \
         identifying characteristics.\n"]
  state_reason : state_reason;
      [@ocaml.doc
        "An explanation for the contributor's current state, providing context about why it is in \
         its current condition.\n"]
  state_transitioned_timestamp : timestamp option;
      [@ocaml.doc "The timestamp when the contributor last transitioned to its current state.\n"]
}
[@@ocaml.doc
  "Represents an individual contributor to a multi-timeseries alarm, containing information about \
   a specific time series and its contribution to the alarm's state.\n"]

type nonrec alarm_contributors = alarm_contributor list [@@ocaml.doc ""]

type nonrec alarm_description = string [@@ocaml.doc ""]

type nonrec history_data = string [@@ocaml.doc ""]

type nonrec history_summary = string [@@ocaml.doc ""]

type nonrec history_item_type =
  | ConfigurationUpdate [@ocaml.doc ""]
  | StateUpdate [@ocaml.doc ""]
  | Action [@ocaml.doc ""]
  | AlarmContributorStateUpdate [@ocaml.doc ""]
  | AlarmContributorAction [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alarm_type =
  | CompositeAlarm [@ocaml.doc ""]
  | MetricAlarm [@ocaml.doc ""]
  | LogAlarm [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alarm_name = string [@@ocaml.doc ""]

type nonrec alarm_history_item = {
  alarm_name : alarm_name option; [@ocaml.doc "The descriptive name for the alarm.\n"]
  alarm_contributor_id : contributor_id option;
      [@ocaml.doc
        "The unique identifier of the alarm contributor associated with this history item, if \
         applicable.\n"]
  alarm_type : alarm_type option;
      [@ocaml.doc "The type of alarm, either metric alarm or composite alarm.\n"]
  timestamp : timestamp option; [@ocaml.doc "The time stamp for the alarm history item.\n"]
  history_item_type : history_item_type option; [@ocaml.doc "The type of alarm history item.\n"]
  history_summary : history_summary option;
      [@ocaml.doc "A summary of the alarm history, in text format.\n"]
  history_data : history_data option; [@ocaml.doc "Data about the alarm, in JSON format.\n"]
  alarm_contributor_attributes : contributor_attributes option;
      [@ocaml.doc
        "A map of attributes that describe the alarm contributor associated with this history \
         item, providing context about the contributor's characteristics at the time of the event.\n"]
}
[@@ocaml.doc "Represents the history of a specific alarm.\n"]

type nonrec alarm_history_items = alarm_history_item list [@@ocaml.doc ""]

type nonrec alarm_mute_rule_status =
  | SCHEDULED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alarm_mute_rule_statuses = alarm_mute_rule_status list [@@ocaml.doc ""]

type nonrec mute_type = string [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec alarm_mute_rule_summary = {
  alarm_mute_rule_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm mute rule.\n"]
  expire_date : timestamp option;
      [@ocaml.doc
        "The date and time when the mute rule expires and is no longer evaluated. This field is \
         only present if an expiration date was configured.\n"]
  status : alarm_mute_rule_status option;
      [@ocaml.doc
        "The current status of the alarm mute rule. Valid values are [SCHEDULED], [ACTIVE], or \
         [EXPIRED].\n"]
  mute_type : mute_type option;
      [@ocaml.doc
        "Indicates whether the mute rule is one-time or recurring. Valid values are [ONE_TIME] or \
         [RECURRING].\n"]
  last_updated_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the mute rule was last updated.\n"]
}
[@@ocaml.doc
  "Summary information about an alarm mute rule, including its name, status, and configuration \
   details.\n"]

type nonrec alarm_mute_rule_summaries = alarm_mute_rule_summary list [@@ocaml.doc ""]

type nonrec alarm_name_prefix = string [@@ocaml.doc ""]

type nonrec alarm_names = alarm_name list [@@ocaml.doc ""]

type nonrec recovery_period = int [@@ocaml.doc ""]

type nonrec pending_period = int [@@ocaml.doc ""]

type nonrec query = string [@@ocaml.doc ""]

type nonrec alarm_prom_ql_criteria = {
  query : query;
      [@ocaml.doc
        "The PromQL query that the alarm evaluates. The query must return a result of vector type. \
         Each entry in the vector result represents an alarm contributor.\n"]
  pending_period : pending_period option;
      [@ocaml.doc
        "The duration, in seconds, that a contributor must be continuously breaching before it \
         transitions to the [ALARM] state.\n"]
  recovery_period : recovery_period option;
      [@ocaml.doc
        "The duration, in seconds, that a contributor must continuously not be breaching before it \
         transitions back to the [OK] state.\n"]
}
[@@ocaml.doc
  "Contains the configuration that determines how a PromQL alarm evaluates its contributors, \
   including the query to run and the durations that define when contributors transition between \
   states.\n"]

type nonrec alarm_rule = string [@@ocaml.doc ""]

type nonrec alarm_types = alarm_type list [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec period = int [@@ocaml.doc ""]

type nonrec return_data = bool [@@ocaml.doc ""]

type nonrec metric_label = string [@@ocaml.doc ""]

type nonrec metric_expression = string [@@ocaml.doc ""]

type nonrec standard_unit =
  | Seconds [@ocaml.doc ""]
  | Microseconds [@ocaml.doc ""]
  | Milliseconds [@ocaml.doc ""]
  | Bytes [@ocaml.doc ""]
  | Kilobytes [@ocaml.doc ""]
  | Megabytes [@ocaml.doc ""]
  | Gigabytes [@ocaml.doc ""]
  | Terabytes [@ocaml.doc ""]
  | Bits [@ocaml.doc ""]
  | Kilobits [@ocaml.doc ""]
  | Megabits [@ocaml.doc ""]
  | Gigabits [@ocaml.doc ""]
  | Terabits [@ocaml.doc ""]
  | Percent [@ocaml.doc ""]
  | Count [@ocaml.doc ""]
  | Bytes_Second [@ocaml.doc ""]
  | Kilobytes_Second [@ocaml.doc ""]
  | Megabytes_Second [@ocaml.doc ""]
  | Gigabytes_Second [@ocaml.doc ""]
  | Terabytes_Second [@ocaml.doc ""]
  | Bits_Second [@ocaml.doc ""]
  | Kilobits_Second [@ocaml.doc ""]
  | Megabits_Second [@ocaml.doc ""]
  | Gigabits_Second [@ocaml.doc ""]
  | Terabits_Second [@ocaml.doc ""]
  | Count_Second [@ocaml.doc ""]
  | None_ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stat = string [@@ocaml.doc ""]

type nonrec dimension_value = string [@@ocaml.doc ""]

type nonrec dimension_name = string [@@ocaml.doc ""]

type nonrec dimension = {
  name : dimension_name;
      [@ocaml.doc
        "The name of the dimension. Dimension names must contain only ASCII characters, must \
         include at least one non-whitespace character, and cannot start with a colon ([:]). ASCII \
         control characters are not supported as part of dimension names.\n"]
  value : dimension_value;
      [@ocaml.doc
        "The value of the dimension. Dimension values must contain only ASCII characters and must \
         include at least one non-whitespace character. ASCII control characters are not supported \
         as part of dimension values.\n"]
}
[@@ocaml.doc
  "A dimension is a name/value pair that is part of the identity of a metric. Because dimensions \
   are part of the unique identifier for a metric, whenever you add a unique name/value pair to \
   one of your metrics, you are creating a new variation of that metric. For example, many Amazon \
   EC2 metrics publish [InstanceId] as a dimension name, and the actual instance ID as the value \
   for that dimension.\n\n\
  \ You can assign up to 30 dimensions to a metric.\n\
  \ "]

type nonrec dimensions = dimension list [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec namespace = string [@@ocaml.doc ""]

type nonrec metric = {
  namespace : namespace option; [@ocaml.doc "The namespace of the metric.\n"]
  metric_name : metric_name option;
      [@ocaml.doc "The name of the metric. This is a required field.\n"]
  dimensions : dimensions option; [@ocaml.doc "The dimensions for the metric.\n"]
}
[@@ocaml.doc "Represents a specific metric.\n"]

type nonrec metric_stat = {
  metric : metric;
      [@ocaml.doc "The metric to return, including the metric name, namespace, and dimensions.\n"]
  period : period;
      [@ocaml.doc
        "The granularity, in seconds, of the returned data points. For metrics with regular \
         resolution, a period can be as short as one minute (60 seconds) and must be a multiple of \
         60. For high-resolution metrics that are collected at intervals of less than one minute, \
         the period can be 1, 5, 10, 20, 30, 60, or any multiple of 60. High-resolution metrics \
         are those metrics stored by a [PutMetricData] call that includes a [StorageResolution] of \
         1 second.\n\n\
        \ If the [StartTime] parameter specifies a time stamp that is greater than 3 hours ago, \
         you must specify the period as follows or no data points in that time range is returned:\n\
        \ \n\
        \  {ul\n\
        \        {-  Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1 \
         minute).\n\
        \            \n\
        \             }\n\
        \        {-  Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5 \
         minutes).\n\
        \            \n\
        \             }\n\
        \        {-  Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  stat : stat;
      [@ocaml.doc
        "The statistic to return. It can include any CloudWatch statistic or extended statistic.\n"]
  unit_ : standard_unit option;
      [@ocaml.doc
        "When you are using a [Put] operation, this defines what unit you want to use when storing \
         the metric.\n\n\
        \ In a [Get] operation, if you omit [Unit] then all data that was collected with any unit \
         is returned, along with the corresponding units that were specified when the data was \
         reported to CloudWatch. If you specify a unit, the operation returns only data that was \
         collected with that unit specified. If you specify a unit that does not match the data \
         collected, the results of the operation are null. CloudWatch does not perform unit \
         conversions.\n\
        \ "]
}
[@@ocaml.doc
  "This structure defines the metric to be returned, along with the statistics, period, and units.\n"]

type nonrec metric_id = string [@@ocaml.doc ""]

type nonrec metric_data_query = {
  id : metric_id;
      [@ocaml.doc
        "A short name used to tie this object to the results in the response. This name must be \
         unique within a single call to [GetMetricData]. If you are performing math expressions on \
         this set of data, this name represents that data and can serve as a variable in the \
         mathematical expression. The valid characters are letters, numbers, and underscore. The \
         first character must be a lowercase letter.\n"]
  metric_stat : metric_stat option;
      [@ocaml.doc
        "The metric to be returned, along with statistics, period, and units. Use this parameter \
         only if this object is retrieving a metric and not performing a math expression on \
         returned data.\n\n\
        \ Within one MetricDataQuery object, you must specify either [Expression] or [MetricStat] \
         but not both.\n\
        \ "]
  expression : metric_expression option;
      [@ocaml.doc
        "This field can contain either a Metrics Insights query, or a metric math expression to be \
         performed on the returned data. For more information about Metrics Insights queries, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-metrics-insights-querylanguage}Metrics \
         Insights query components and syntax} in the {i Amazon CloudWatch User Guide}.\n\n\
        \ A math expression can use the [Id] of the other metrics or queries to refer to those \
         metrics, and can also use the [Id] of other expressions to use the result of those \
         expressions. For more information about metric math expressions, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax}Metric \
         Math Syntax and Functions} in the {i Amazon CloudWatch User Guide}.\n\
        \ \n\
        \  Within each MetricDataQuery object, you must specify either [Expression] or \
         [MetricStat] but not both.\n\
        \  "]
  label : metric_label option;
      [@ocaml.doc
        "A human-readable label for this metric or expression. This is especially useful if this \
         is an expression, so that you know what the value represents. If the metric or expression \
         is shown in a CloudWatch dashboard widget, the label is shown. If Label is omitted, \
         CloudWatch generates a default.\n\n\
        \ You can put dynamic expressions into a label, so that it is more descriptive. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/graph-dynamic-labels.html}Using \
         Dynamic Labels}.\n\
        \ "]
  return_data : return_data option;
      [@ocaml.doc
        "When used in [GetMetricData], this option indicates whether to return the timestamps and \
         raw data values of this metric. If you are performing this call just to do math \
         expressions and do not also need the raw data returned, you can specify [false]. If you \
         omit this, the default of [true] is used.\n\n\
        \ When used in [PutMetricAlarm], specify [true] for the one expression result to use as \
         the alarm. For all other metrics and expressions in the same [PutMetricAlarm] operation, \
         specify [ReturnData] as False.\n\
        \ "]
  period : period option;
      [@ocaml.doc
        "The granularity, in seconds, of the returned data points. For metrics with regular \
         resolution, a period can be as short as one minute (60 seconds) and must be a multiple of \
         60. For high-resolution metrics that are collected at intervals of less than one minute, \
         the period can be 1, 5, 10, 20, 30, 60, or any multiple of 60. High-resolution metrics \
         are those metrics stored by a [PutMetricData] operation that includes a \
         [StorageResolution of 1 second].\n"]
  account_id : account_id option;
      [@ocaml.doc
        "The ID of the account where the metrics are located.\n\n\
        \ If you are performing a [GetMetricData] operation in a monitoring account, use this to \
         specify which account to retrieve this metric from.\n\
        \ \n\
        \  If you are performing a [PutMetricAlarm] operation, use this to specify which account \
         contains the metric that the alarm is watching.\n\
        \  "]
}
[@@ocaml.doc
  "This structure is used in both [GetMetricData] and [PutMetricAlarm]. The supported use of this \
   structure is different for those two operations.\n\n\
  \ When used in [GetMetricData], it indicates the metric data to return, and whether this call is \
   just retrieving a batch set of data for one metric, or is performing a Metrics Insights query \
   or a math expression. A single [GetMetricData] call can include up to 500 [MetricDataQuery] \
   structures.\n\
  \ \n\
  \  When used in [PutMetricAlarm], it enables you to create an alarm based on a metric math \
   expression. Each [MetricDataQuery] in the array specifies either a metric to retrieve, or a \
   math expression to be performed on retrieved metrics. A single [PutMetricAlarm] call can \
   include up to 20 [MetricDataQuery] structures in the array. The 20 structures can include as \
   many as 10 structures that contain a [MetricStat] parameter to retrieve a metric, and as many \
   as 10 structures that contain the [Expression] parameter to perform a math expression. Of those \
   [Expression] structures, one must have [true] as the value for [ReturnData]. The result of this \
   expression is the value the alarm watches.\n\
  \  \n\
  \   Any expression used in a [PutMetricAlarm] operation must return a single time series. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax}Metric \
   Math Syntax and Functions} in the {i Amazon CloudWatch User Guide}.\n\
  \   \n\
  \    Some of the parameters of this structure also have different uses whether you are using \
   this structure in a [GetMetricData] operation or a [PutMetricAlarm] operation. These \
   differences are explained in the following parameter list.\n\
  \    "]

type nonrec metric_data_queries = metric_data_query list [@@ocaml.doc ""]

type nonrec metric_math_anomaly_detector = {
  metric_data_queries : metric_data_queries option;
      [@ocaml.doc
        "An array of metric data query structures that enables you to create an anomaly detector \
         based on the result of a metric math expression. Each item in [MetricDataQueries] gets a \
         metric or performs a math expression. One item in [MetricDataQueries] is the expression \
         that provides the time series that the anomaly detector uses as input. Designate the \
         expression by setting [ReturnData] to [true] for this object in the array. For all other \
         expressions and metrics, set [ReturnData] to [false]. The designated expression must \
         return a single time series.\n"]
}
[@@ocaml.doc
  "Indicates the CloudWatch math expression that provides the time series the anomaly detector \
   uses as input. The designated math expression must return a single time series.\n"]

type nonrec anomaly_detector_metric_stat = string [@@ocaml.doc ""]

type nonrec single_metric_anomaly_detector = {
  account_id : account_id option;
      [@ocaml.doc
        "If the CloudWatch metric that provides the time series that the anomaly detector uses as \
         input is in another account, specify that account ID here. If you omit this parameter, \
         the current account is used.\n"]
  namespace : namespace option;
      [@ocaml.doc "The namespace of the metric to create the anomaly detection model for.\n"]
  metric_name : metric_name option;
      [@ocaml.doc "The name of the metric to create the anomaly detection model for.\n"]
  dimensions : dimensions option;
      [@ocaml.doc "The metric dimensions to create the anomaly detection model for.\n"]
  stat : anomaly_detector_metric_stat option;
      [@ocaml.doc "The statistic to use for the metric and anomaly detection model.\n"]
}
[@@ocaml.doc
  "Designates the CloudWatch metric and statistic that provides the time series the anomaly \
   detector uses as input. If you have enabled unified cross-account observability, and this \
   account is a monitoring account, the metric can be in the same account or a source account.\n"]

type nonrec periodic_spikes = bool [@@ocaml.doc ""]

type nonrec metric_characteristics = {
  periodic_spikes : periodic_spikes option;
      [@ocaml.doc
        "Set this parameter to [true] if values for this metric consistently include spikes that \
         should not be considered to be anomalies. With this set to [true], CloudWatch will expect \
         to see spikes that occurred consistently during the model training period, and won't flag \
         future similar spikes as anomalies.\n"]
}
[@@ocaml.doc
  "This object includes parameters that you can use to provide information to CloudWatch to help \
   it build more accurate anomaly detection models.\n"]

type nonrec anomaly_detector_state_value =
  | PENDING_TRAINING [@ocaml.doc ""]
  | TRAINED_INSUFFICIENT_DATA [@ocaml.doc ""]
  | TRAINED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec anomaly_detector_metric_timezone = string [@@ocaml.doc ""]

type nonrec range = {
  start_time : timestamp;
      [@ocaml.doc
        "The start time of the range to exclude. The format is [yyyy-MM-dd'T'HH:mm:ss]. For \
         example, [2019-07-01T23:59:59].\n"]
  end_time : timestamp;
      [@ocaml.doc
        "The end time of the range to exclude. The format is [yyyy-MM-dd'T'HH:mm:ss]. For example, \
         [2019-07-01T23:59:59].\n"]
}
[@@ocaml.doc
  "Specifies one range of days or times to exclude from use for training an anomaly detection model.\n"]

type nonrec anomaly_detector_excluded_time_ranges = range list [@@ocaml.doc ""]

type nonrec anomaly_detector_configuration = {
  excluded_time_ranges : anomaly_detector_excluded_time_ranges option;
      [@ocaml.doc
        "An array of time ranges to exclude from use when the anomaly detection model is trained. \
         Use this to make sure that events that could cause unusual values for the metric, such as \
         deployments, aren't used when CloudWatch creates the model.\n"]
  metric_timezone : anomaly_detector_metric_timezone option;
      [@ocaml.doc
        "The time zone to use for the metric. This is useful to enable the model to automatically \
         account for daylight savings time changes if the metric is sensitive to such time \
         changes.\n\n\
        \ To specify a time zone, use the name of the time zone as specified in the standard tz \
         database. For more information, see {{:https://en.wikipedia.org/wiki/Tz_database}tz \
         database}.\n\
        \ "]
}
[@@ocaml.doc
  "The configuration specifies details about how the anomaly detection model is to be trained, \
   including time ranges to exclude from use for training the model and the time zone to use for \
   the metric.\n"]

type nonrec anomaly_detector = {
  namespace : namespace option;
      [@ocaml.doc "The namespace of the metric associated with the anomaly detection model.\n"]
  metric_name : metric_name option;
      [@ocaml.doc "The name of the metric associated with the anomaly detection model.\n"]
  dimensions : dimensions option;
      [@ocaml.doc "The metric dimensions associated with the anomaly detection model.\n"]
  stat : anomaly_detector_metric_stat option;
      [@ocaml.doc "The statistic associated with the anomaly detection model.\n"]
  configuration : anomaly_detector_configuration option;
      [@ocaml.doc
        "The configuration specifies details about how the anomaly detection model is to be \
         trained, including time ranges to exclude from use for training the model, and the time \
         zone to use for the metric.\n"]
  state_value : anomaly_detector_state_value option;
      [@ocaml.doc "The current status of the anomaly detector's training.\n"]
  metric_characteristics : metric_characteristics option;
      [@ocaml.doc
        "This object includes parameters that you can use to provide information about your metric \
         to CloudWatch to help it build more accurate anomaly detection models. Currently, it \
         includes the [PeriodicSpikes] parameter.\n"]
  single_metric_anomaly_detector : single_metric_anomaly_detector option;
      [@ocaml.doc "The CloudWatch metric and statistic for this anomaly detector.\n"]
  metric_math_anomaly_detector : metric_math_anomaly_detector option;
      [@ocaml.doc "The CloudWatch metric math expression for this anomaly detector.\n"]
}
[@@ocaml.doc
  "An anomaly detection model associated with a particular CloudWatch metric, statistic, or metric \
   math expression. You can use the model to display a band of expected, normal values when the \
   metric is graphed.\n\n\
  \ If you have enabled unified cross-account observability, and this account is a monitoring \
   account, the metric can be in the same account or a source account.\n\
  \ "]

type nonrec anomaly_detector_type = SINGLE_METRIC [@ocaml.doc ""] | METRIC_MATH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec anomaly_detector_types = anomaly_detector_type list [@@ocaml.doc ""]

type nonrec anomaly_detectors = anomaly_detector list [@@ocaml.doc ""]

type nonrec fault_description = string [@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  resource_type : resource_type option; [@ocaml.doc ""]
  resource_id : resource_id option; [@ocaml.doc ""]
  message : fault_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The named resource does not exist.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec kms_key_not_found_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified Amazon Web Services Key Management Service (Amazon Web Services KMS) key could \
   not be found. Verify that the key Amazon Resource Name (ARN) is correct, that the key exists, \
   and that it is in the same Amazon Web Services Region as the resource.\n"]

type nonrec kms_key_disabled_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified Amazon Web Services Key Management Service (Amazon Web Services KMS) key is \
   disabled or pending deletion. Re-enable the key (or restore it, if it is pending deletion) and \
   retry the operation.\n"]

type nonrec kms_access_denied_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation was denied because either the calling principal lacks the required Amazon Web \
   Services Key Management Service (Amazon Web Services KMS) permission on the key, or the key \
   policy does not grant Amazon CloudWatch the permissions it needs to use the key. Verify that \
   the caller has [kms:Decrypt] permission on the key, and that the key policy grants the \
   CloudWatch service principal the [kms:DescribeKey], [kms:GenerateDataKey], [kms:Encrypt], \
   [kms:Decrypt], and [kms:ReEncrypt*] permissions described in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_AssociateDatasetKmsKey.html}AssociateDatasetKmsKey}.\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "This operation attempted to create a resource that already exists.\n"]

type nonrec associate_dataset_kms_key_output = unit [@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec dataset_identifier = string [@@ocaml.doc ""]

type nonrec associate_dataset_kms_key_input = {
  dataset_identifier : dataset_identifier;
      [@ocaml.doc
        "Specifies the identifier of the dataset that you want to associate the KMS key with. For \
         the [default] dataset, you can specify either [default] or the full dataset Amazon \
         Resource Name (ARN) in the format \n\
         {[\n\
         arn:aws:cloudwatch:{i Region}:{i account-id}:dataset/default\n\
         ]}\n\
         .\n"]
  kms_key_arn : kms_key_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the customer managed KMS key to associate \
         with the dataset. The key must be a symmetric encryption KMS key ([SYMMETRIC_DEFAULT]) in \
         the same Amazon Web Services Region as the dataset.\n\n\
        \ The ARN must be in the format \n\
        \ {[\n\
        \ arn:aws:kms:{i Region}:{i account-id}:key/{i key-id} \n\
        \ ]}\n\
        \ . Key IDs, aliases, and alias ARNs are not accepted.\n\
        \ \n\
        \  For more information about KMS key ARNs, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}Key \
         ARN} in the {i Amazon Web Services Key Management Service Developer Guide}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec aws_query_error_message = string [@@ocaml.doc ""]

type nonrec failure_description = string [@@ocaml.doc ""]

type nonrec failure_code = string [@@ocaml.doc ""]

type nonrec exception_type = string [@@ocaml.doc ""]

type nonrec failure_resource = string [@@ocaml.doc ""]

type nonrec partial_failure = {
  failure_resource : failure_resource option;
      [@ocaml.doc "The specified rule that could not be deleted.\n"]
  exception_type : exception_type option; [@ocaml.doc "The type of error.\n"]
  failure_code : failure_code option; [@ocaml.doc "The code of the error.\n"]
  failure_description : failure_description option; [@ocaml.doc "A description of the error.\n"]
}
[@@ocaml.doc
  "This array is empty if the API operation was successful for all the rules specified in the \
   request. If the operation could not process one of the rules, the following data is returned \
   for each of those rules.\n"]

type nonrec batch_failures = partial_failure list [@@ocaml.doc ""]

type nonrec comparison_operator =
  | GreaterThanOrEqualToThreshold [@ocaml.doc ""]
  | GreaterThanThreshold [@ocaml.doc ""]
  | LessThanThreshold [@ocaml.doc ""]
  | LessThanOrEqualToThreshold [@ocaml.doc ""]
  | LessThanLowerOrGreaterThanUpperThreshold [@ocaml.doc ""]
  | LessThanLowerThreshold [@ocaml.doc ""]
  | GreaterThanUpperThreshold [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec suppressor_period = int [@@ocaml.doc ""]

type nonrec state_value =
  | OK [@ocaml.doc ""]
  | ALARM [@ocaml.doc ""]
  | INSUFFICIENT_DATA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec state_reason_data = string [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec resource_list = resource_name list [@@ocaml.doc ""]

type nonrec composite_alarm = {
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state.\n"]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the ALARM state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  alarm_arn : alarm_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"]
  alarm_configuration_updated_timestamp : timestamp option;
      [@ocaml.doc "The time stamp of the last update to the alarm configuration.\n"]
  alarm_description : alarm_description option; [@ocaml.doc "The description of the alarm.\n"]
  alarm_name : alarm_name option; [@ocaml.doc "The name of the alarm.\n"]
  alarm_rule : alarm_rule option;
      [@ocaml.doc "The rule that this alarm uses to evaluate its alarm state.\n"]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the INSUFFICIENT_DATA state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the OK state from any other state. \
         Each action is specified as an Amazon Resource Name (ARN).\n"]
  state_reason : state_reason option;
      [@ocaml.doc "An explanation for the alarm state, in text format.\n"]
  state_reason_data : state_reason_data option;
      [@ocaml.doc "An explanation for the alarm state, in JSON format.\n"]
  state_updated_timestamp : timestamp option;
      [@ocaml.doc
        "Tracks the timestamp of any state update, even if [StateValue] doesn't change.\n"]
  state_value : state_value option; [@ocaml.doc "The state value for the alarm.\n"]
  state_transitioned_timestamp : timestamp option;
      [@ocaml.doc " The timestamp of the last change to the alarm's [StateValue]. \n"]
  actions_suppressed_by : actions_suppressed_by option;
      [@ocaml.doc
        " When the value is [ALARM], it means that the actions are suppressed because the \
         suppressor alarm is in [ALARM] When the value is [WaitPeriod], it means that the actions \
         are suppressed because the composite alarm is waiting for the suppressor alarm to go into \
         into the [ALARM] state. The maximum waiting time is as specified in \
         [ActionsSuppressorWaitPeriod]. After this time, the composite alarm performs its actions. \
         When the value is [ExtensionPeriod], it means that the actions are suppressed because the \
         composite alarm is waiting after the suppressor alarm went out of the [ALARM] state. The \
         maximum waiting time is as specified in [ActionsSuppressorExtensionPeriod]. After this \
         time, the composite alarm performs its actions. \n"]
  actions_suppressed_reason : actions_suppressed_reason option;
      [@ocaml.doc " Captures the reason for action suppression. \n"]
  actions_suppressor : alarm_arn option;
      [@ocaml.doc
        " Actions will be suppressed if the suppressor alarm is in the [ALARM] state. \
         [ActionsSuppressor] can be an AlarmName or an Amazon Resource Name (ARN) from an existing \
         alarm. \n"]
  actions_suppressor_wait_period : suppressor_period option;
      [@ocaml.doc
        " The maximum time in seconds that the composite alarm waits for the suppressor alarm to \
         go into the [ALARM] state. After this time, the composite alarm performs its actions. \n\n\
        \   [WaitPeriod] is required only when [ActionsSuppressor] is specified. \n\
        \  \n\
        \   "]
  actions_suppressor_extension_period : suppressor_period option;
      [@ocaml.doc
        " The maximum time in seconds that the composite alarm waits after suppressor alarm goes \
         out of the [ALARM] state. After this time, the composite alarm performs its actions. \n\n\
        \   [ExtensionPeriod] is required only when [ActionsSuppressor] is specified. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The details about a composite alarm.\n"]

type nonrec composite_alarms = composite_alarm list [@@ocaml.doc ""]

type nonrec concurrent_modification_exception = {
  message : fault_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "More than one process tried to modify a resource at the same time.\n"]

type nonrec datapoint_value = float [@@ocaml.doc ""]

type nonrec counts = datapoint_value list [@@ocaml.doc ""]

type nonrec dashboard_arn = string [@@ocaml.doc ""]

type nonrec dashboard_body = string [@@ocaml.doc ""]

type nonrec size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec last_modified = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec dashboard_name = string [@@ocaml.doc ""]

type nonrec dashboard_entry = {
  dashboard_name : dashboard_name option; [@ocaml.doc "The name of the dashboard.\n"]
  dashboard_arn : dashboard_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dashboard.\n"]
  last_modified : last_modified option;
      [@ocaml.doc
        "The time stamp of when the dashboard was last modified, either by an API call or through \
         the console. This number is expressed as the number of milliseconds since Jan 1, 1970 \
         00:00:00 UTC.\n"]
  size : size option; [@ocaml.doc "The size of the dashboard, in bytes.\n"]
}
[@@ocaml.doc "Represents a specific dashboard.\n"]

type nonrec dashboard_entries = dashboard_entry list [@@ocaml.doc ""]

type nonrec dashboard_error_message = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec data_path = string [@@ocaml.doc ""]

type nonrec dashboard_validation_message = {
  data_path : data_path option; [@ocaml.doc "The data path related to the message.\n"]
  message : message option; [@ocaml.doc "A message describing the error or warning.\n"]
}
[@@ocaml.doc "An error or warning for the operation.\n"]

type nonrec dashboard_validation_messages = dashboard_validation_message list [@@ocaml.doc ""]

type nonrec dashboard_invalid_input_error = {
  message : dashboard_error_message option; [@ocaml.doc ""]
  dashboard_validation_messages : dashboard_validation_messages option; [@ocaml.doc ""]
}
[@@ocaml.doc "Some part of the dashboard data is invalid.\n"]

type nonrec dashboard_name_prefix = string [@@ocaml.doc ""]

type nonrec dashboard_names = dashboard_name list [@@ocaml.doc ""]

type nonrec dashboard_not_found_error = { message : dashboard_error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified dashboard does not exist.\n"]

type nonrec extended_statistic = string [@@ocaml.doc ""]

type nonrec datapoint_value_map = (extended_statistic * datapoint_value) list [@@ocaml.doc ""]

type nonrec datapoint = {
  timestamp : timestamp option; [@ocaml.doc "The time stamp used for the data point.\n"]
  sample_count : datapoint_value option;
      [@ocaml.doc
        "The number of metric values that contributed to the aggregate value of this data point.\n"]
  average : datapoint_value option;
      [@ocaml.doc "The average of the metric values that correspond to the data point.\n"]
  sum : datapoint_value option; [@ocaml.doc "The sum of the metric values for the data point.\n"]
  minimum : datapoint_value option; [@ocaml.doc "The minimum metric value for the data point.\n"]
  maximum : datapoint_value option; [@ocaml.doc "The maximum metric value for the data point.\n"]
  unit_ : standard_unit option; [@ocaml.doc "The standard unit for the data point.\n"]
  extended_statistics : datapoint_value_map option;
      [@ocaml.doc "The percentile statistic for the data point.\n"]
}
[@@ocaml.doc "Encapsulates the statistical data that CloudWatch computes from metric data.\n"]

type nonrec datapoint_values = datapoint_value list [@@ocaml.doc ""]

type nonrec datapoints = datapoint list [@@ocaml.doc ""]

type nonrec datapoints_to_alarm = int [@@ocaml.doc ""]

type nonrec dataset_arn = string [@@ocaml.doc ""]

type nonrec dataset_id = string [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec delete_alarm_mute_rule_input = {
  alarm_mute_rule_name : name; [@ocaml.doc "The name of the alarm mute rule to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found = { message : error_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The named resource does not exist.\n"]

type nonrec resource_conflict = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation could not be completed because the request conflicts with the current state of \
   the alarm or its underlying scheduled query resource.\n"]

type nonrec delete_alarms_input = {
  alarm_names : alarm_names;
      [@ocaml.doc "The alarms to be deleted. Do not enclose the alarm names in quote marks.\n"]
}
[@@ocaml.doc ""]

type nonrec missing_required_parameter_exception = {
  message : aws_query_error_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "An input parameter that is required is missing.\n"]

type nonrec invalid_parameter_value_exception = {
  message : aws_query_error_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "The value of an input parameter is bad or out-of-range.\n"]

type nonrec invalid_parameter_combination_exception = {
  message : aws_query_error_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "Parameters were used together that cannot be used together.\n"]

type nonrec internal_service_fault = { message : fault_description option [@ocaml.doc "\n"] }
[@@ocaml.doc "Request processing has failed due to some unknown error, exception, or failure.\n"]

type nonrec delete_anomaly_detector_output = unit [@@ocaml.doc ""]

type nonrec delete_anomaly_detector_input = {
  namespace : namespace option;
      [@ocaml.doc "The namespace associated with the anomaly detection model to delete.\n"]
  metric_name : metric_name option;
      [@ocaml.doc "The metric name associated with the anomaly detection model to delete.\n"]
  dimensions : dimensions option;
      [@ocaml.doc "The metric dimensions associated with the anomaly detection model to delete.\n"]
  stat : anomaly_detector_metric_stat option;
      [@ocaml.doc "The statistic associated with the anomaly detection model to delete.\n"]
  single_metric_anomaly_detector : single_metric_anomaly_detector option;
      [@ocaml.doc
        "A single metric anomaly detector to be deleted.\n\n\
        \ When using [SingleMetricAnomalyDetector], you cannot include the following parameters in \
         the same operation:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Dimensions],\n\
        \            \n\
        \             }\n\
        \        {-   [MetricName] \n\
        \            \n\
        \             }\n\
        \        {-   [Namespace] \n\
        \            \n\
        \             }\n\
        \        {-   [Stat] \n\
        \            \n\
        \             }\n\
        \        {-  the [MetricMathAnomalyDetector] parameters of [DeleteAnomalyDetectorInput] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Instead, specify the single metric anomaly detector attributes as part of the \
         [SingleMetricAnomalyDetector] property.\n\
        \   "]
  metric_math_anomaly_detector : metric_math_anomaly_detector option;
      [@ocaml.doc
        "The metric math anomaly detector to be deleted.\n\n\
        \ When using [MetricMathAnomalyDetector], you cannot include following parameters in the \
         same operation:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Dimensions],\n\
        \            \n\
        \             }\n\
        \        {-   [MetricName] \n\
        \            \n\
        \             }\n\
        \        {-   [Namespace] \n\
        \            \n\
        \             }\n\
        \        {-   [Stat] \n\
        \            \n\
        \             }\n\
        \        {-  the [SingleMetricAnomalyDetector] parameters of [DeleteAnomalyDetectorInput] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Instead, specify the metric math anomaly detector attributes as part of the \
         [MetricMathAnomalyDetector] property.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_dashboards_output = unit [@@ocaml.doc ""]

type nonrec delete_dashboards_input = {
  dashboard_names : dashboard_names;
      [@ocaml.doc "The dashboards to be deleted. This parameter is required.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_insight_rules_output = {
  failures : batch_failures option;
      [@ocaml.doc
        "An array listing the rules that could not be deleted. You cannot delete built-in rules.\n"]
}
[@@ocaml.doc ""]

type nonrec insight_rule_name = string [@@ocaml.doc ""]

type nonrec insight_rule_names = insight_rule_name list [@@ocaml.doc ""]

type nonrec delete_insight_rules_input = {
  rule_names : insight_rule_names;
      [@ocaml.doc
        "An array of the rule names to delete. If you need to find out the names of your rules, \
         use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html}DescribeInsightRules}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_metric_stream_output = unit [@@ocaml.doc ""]

type nonrec metric_stream_name = string [@@ocaml.doc ""]

type nonrec delete_metric_stream_input = {
  name : metric_stream_name; [@ocaml.doc "The name of the metric stream to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token = { message : error_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The next token specified is invalid.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec describe_alarm_contributors_output = {
  alarm_contributors : alarm_contributors;
      [@ocaml.doc
        "A list of alarm contributors that provide details about the individual time series \
         contributing to the alarm's state.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token that marks the start of the next batch of returned results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alarm_contributors_input = {
  alarm_name : alarm_name;
      [@ocaml.doc "The name of the alarm for which to retrieve contributor information.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to indicate that there is more data available.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alarm_history_output = {
  alarm_history_items : alarm_history_items option;
      [@ocaml.doc "The alarm histories, in JSON format.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token that marks the start of the next batch of returned results.\n"]
}
[@@ocaml.doc ""]

type nonrec scan_by = TIMESTAMP_DESCENDING [@ocaml.doc ""] | TIMESTAMP_ASCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_records = int [@@ocaml.doc ""]

type nonrec describe_alarm_history_input = {
  alarm_name : alarm_name option; [@ocaml.doc "The name of the alarm.\n"]
  alarm_contributor_id : contributor_id option;
      [@ocaml.doc
        "The unique identifier of a specific alarm contributor to filter the alarm history results.\n"]
  alarm_types : alarm_types option;
      [@ocaml.doc
        "Use this parameter to specify whether you want the operation to return metric alarms, \
         composite alarms, or log alarms. If you omit this parameter, only metric alarms are \
         returned.\n"]
  history_item_type : history_item_type option;
      [@ocaml.doc "The type of alarm histories to retrieve.\n"]
  start_date : timestamp option; [@ocaml.doc "The starting date to retrieve alarm history.\n"]
  end_date : timestamp option; [@ocaml.doc "The ending date to retrieve alarm history.\n"]
  max_records : max_records option;
      [@ocaml.doc "The maximum number of alarm history records to retrieve.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to indicate that there is more data available.\n"]
  scan_by : scan_by option;
      [@ocaml.doc
        "Specified whether to return the newest or oldest alarm history first. Specify \
         [TimestampDescending] to have the newest event history returned first, and specify \
         [TimestampAscending] to have the oldest history returned first.\n"]
}
[@@ocaml.doc ""]

type nonrec evaluation_state =
  | PARTIAL_DATA [@ocaml.doc ""]
  | EVALUATION_FAILURE [@ocaml.doc ""]
  | EVALUATION_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec treat_missing_data = string [@@ocaml.doc ""]

type nonrec threshold = float [@@ocaml.doc ""]

type nonrec query_results_to_alarm = int [@@ocaml.doc ""]

type nonrec query_results_to_evaluate = int [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "A string that you can use to assign a value. The combination of tag keys and values can \
         help you organize and categorize your resources.\n"]
  value : tag_value; [@ocaml.doc "The value for the specified tag key.\n"]
}
[@@ocaml.doc "A key-value pair associated with a CloudWatch resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec end_time_offset = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec start_time_offset = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec schedule_expression = string [@@ocaml.doc ""]

type nonrec schedule_configuration = {
  schedule_expression : schedule_expression;
      [@ocaml.doc
        "The schedule expression that defines how often the underlying CloudWatch Logs scheduled \
         query runs. Specify a [rate()] expression, for example [rate(5 minutes)].\n"]
  start_time_offset : start_time_offset option;
      [@ocaml.doc
        "The offset, in seconds, before the scheduled execution time at which the query time range \
         begins. For example, an offset of 360 (6 minutes) on a query running at 12:05:00 starts \
         the query time range at 11:59:00.\n"]
  end_time_offset : end_time_offset option;
      [@ocaml.doc
        "The offset, in seconds, before the scheduled execution time at which the query time range \
         ends. Must be non-negative and less than [StartTimeOffset]. The default is 0.\n"]
}
[@@ocaml.doc
  "Contains the schedule expression and time-range offsets that define when a scheduled query runs \
   and what time range each execution covers.\n"]

type nonrec log_group_identifiers = amazon_resource_name list [@@ocaml.doc ""]

type nonrec query_string = string [@@ocaml.doc ""]

type nonrec scheduled_query_configuration = {
  query_string : query_string;
      [@ocaml.doc
        "The CloudWatch Logs query to execute on each scheduled run. Length constraints: maximum \
         of 10,000 characters.\n"]
  log_group_identifiers : log_group_identifiers option;
      [@ocaml.doc
        "The log groups to query. Each entry can be a log group name or ARN. Use the ARN form when \
         querying log groups in a different account (for example, when running cross-account \
         queries from a monitoring account). The list must contain between 1 and 50 entries.\n"]
  query_ar_n : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the CloudWatch Logs scheduled query that the alarm \
         uses. This field is populated in [DescribeAlarms] responses.\n"]
  scheduled_query_role_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that CloudWatch assumes when executing the \
         scheduled query against the configured log groups.\n"]
  schedule_configuration : schedule_configuration;
      [@ocaml.doc
        "The schedule and time-range offset configuration for the underlying scheduled query.\n"]
  aggregation_expression : aggregation_expression;
      [@ocaml.doc
        "The expression that defines how to aggregate query results into one or more scalar values \
         for alarm evaluation. For example, [count(*)] or [avg(latency) by host | sort desc]. \
         Length constraints: minimum 1 character, maximum 2048 characters.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the underlying scheduled query resource.\n"]
}
[@@ocaml.doc "The configuration of the CloudWatch Logs scheduled query that backs a log alarm.\n"]

type nonrec log_alarm = {
  alarm_name : alarm_name option; [@ocaml.doc "The name of the alarm.\n"]
  alarm_arn : alarm_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"]
  alarm_description : alarm_description option; [@ocaml.doc "The description of the alarm.\n"]
  alarm_configuration_updated_timestamp : timestamp option;
      [@ocaml.doc "The time stamp of the last update to the alarm configuration.\n"]
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state.\n"]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [OK] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [ALARM] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [INSUFFICIENT_DATA] state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  state_value : state_value option; [@ocaml.doc "The state value for the alarm.\n"]
  state_reason : state_reason option;
      [@ocaml.doc "An explanation for the alarm state, in text format.\n"]
  state_reason_data : state_reason_data option;
      [@ocaml.doc "An explanation for the alarm state, in JSON format.\n"]
  state_updated_timestamp : timestamp option;
      [@ocaml.doc
        "The time stamp of the last update to the value of either the [StateValue] or \
         [EvaluationState] parameters.\n"]
  scheduled_query_configuration : scheduled_query_configuration option;
      [@ocaml.doc
        "The configuration of the underlying CloudWatch Logs scheduled query, including the query \
         string, log groups, schedule, aggregation expression, and the ARN of the managed \
         scheduled query.\n"]
  query_results_to_evaluate : query_results_to_evaluate option;
      [@ocaml.doc
        "The number of most recent scheduled query results that the alarm evaluates against the \
         threshold (the N in M-of-N evaluation).\n"]
  query_results_to_alarm : query_results_to_alarm option;
      [@ocaml.doc
        "The number of query results, out of the most recent [QueryResultsToEvaluate] results, \
         that must breach the threshold to trigger the alarm to transition to [ALARM] (the M in \
         M-of-N evaluation).\n"]
  threshold : threshold option;
      [@ocaml.doc "The value to compare with the aggregated query result.\n"]
  comparison_operator : comparison_operator option;
      [@ocaml.doc
        "The arithmetic operation to use when comparing the aggregated query result and the \
         threshold. The aggregated query result is used as the first operand.\n"]
  treat_missing_data : treat_missing_data option;
      [@ocaml.doc
        "How this alarm handles missing data points. Valid values are [breaching], [notBreaching], \
         [ignore], and [missing].\n"]
  state_transitioned_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the alarm's [StateValue] most recently changed.\n"]
  evaluation_state : evaluation_state option;
      [@ocaml.doc
        "If the value of this field is [EVALUATION_ERROR], it indicates configuration errors in \
         the alarm setup that require review and correction. Refer to the [StateReason] field of \
         the alarm for more details.\n\n\
        \ If the value of this field is [EVALUATION_FAILURE], it indicates temporary CloudWatch \
         issues. We recommend manual monitoring until the issue is resolved.\n\
        \ \n\
        \  If the value of this field is [PARTIAL_DATA], it indicates that the query returned the \
         maximum 500 contributor groups but more matched. The alarm evaluates the available \
         contributors, but results might be incomplete.\n\
        \  "]
  action_log_line_count : action_log_line_count option;
      [@ocaml.doc
        "The number of log lines from the most recent scheduled query execution that are included \
         in alarm action notifications. Valid range is 0 through 50. A value of 0 means no log \
         lines are included.\n"]
  action_log_line_role_arn : action_log_line_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that CloudWatch assumes to retrieve log \
         events for inclusion in alarm action notifications. Set when [ActionLogLineCount] is \
         greater than 0.\n"]
}
[@@ocaml.doc "The details about a log alarm.\n"]

type nonrec log_alarms = log_alarm list [@@ocaml.doc ""]

type nonrec evaluation_interval = int [@@ocaml.doc ""]

type nonrec evaluation_criteria =
  | PromQLCriteria of alarm_prom_ql_criteria
      [@ocaml.doc "The PromQL criteria for the alarm evaluation.\n"]
[@@ocaml.doc
  "The evaluation criteria for an alarm. This is a union type that currently supports \
   [PromQLCriteria].\n"]

type nonrec sliding_window = unit [@@ocaml.doc ""]

type nonrec timezone = string [@@ocaml.doc ""]

type nonrec wall_clock_window = {
  timezone : timezone option;
      [@ocaml.doc
        "The time zone to use when the alarm aligns the evaluation window to clock boundaries. You \
         can specify an IANA time zone name (for example, [America/New_York]), a fixed UTC offset \
         (for example, [+05:30]), or an offset-prefixed identifier (for example, [UTC+05:30]). The \
         offset must be aligned to a multiple of 5 minutes. If you don't specify a time zone, \
         CloudWatch uses [UTC].\n\n\
        \ The time zone affects window alignment for all periods, including periods of one hour or \
         shorter.\n\
        \ "]
}
[@@ocaml.doc
  "An evaluation window that aligns the evaluated range to fixed clock boundaries that match the \
   alarm's period, such as the top of the hour, midnight, or the start of the calendar week, \
   optionally in a specific time zone.\n\n\
  \ When you use a wall clock window, the alarm's period must be 1 minute (60 seconds), 5 minutes \
   (300 seconds), 1 hour (3,600 seconds), 1 day (86,400 seconds), or 1 week (604,800 seconds). \
   Other period values aren't supported with a wall clock window.\n\
  \ \n\
  \  Choose a wall clock window when your monitoring is tied to a business or calendar period, \
   such as daily reports, batch jobs, or backups, or when you want alarm evaluations to match the \
   periods shown on a metric dashboard.\n\
  \  "]

type nonrec evaluation_window =
  | WallClockWindow of wall_clock_window
      [@ocaml.doc
        "A wall clock window, which aligns the evaluated range to fixed clock boundaries that \
         match the alarm's period, such as the top of the hour, midnight, or the start of the \
         calendar week.\n"]
  | SlidingWindow of sliding_window
      [@ocaml.doc
        "A sliding window, which advances each time the alarm is evaluated, forming a rolling time \
         window. This is the default evaluation window.\n"]
[@@ocaml.doc
  "The evaluation window that an alarm uses to select the range of metric data that it evaluates \
   each time it runs. This is a union type. Set exactly one of its members, [SlidingWindow] or \
   [WallClockWindow]. If you don't set [EvaluationWindow], the alarm uses a [SlidingWindow] by \
   default.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-evaluation-window.html}Alarm \
   evaluation windows} in the {i CloudWatch User Guide}.\n\
  \ "]

type nonrec evaluate_low_sample_count_percentile = string [@@ocaml.doc ""]

type nonrec evaluation_periods = int [@@ocaml.doc ""]

type nonrec statistic =
  | SampleCount [@ocaml.doc ""]
  | Average [@ocaml.doc ""]
  | Sum [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""]
  | Maximum [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_alarm = {
  alarm_name : alarm_name option; [@ocaml.doc "The name of the alarm.\n"]
  alarm_arn : alarm_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"]
  alarm_description : alarm_description option; [@ocaml.doc "The description of the alarm.\n"]
  alarm_configuration_updated_timestamp : timestamp option;
      [@ocaml.doc "The time stamp of the last update to the alarm configuration.\n"]
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state.\n"]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [OK] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [ALARM] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [INSUFFICIENT_DATA] state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN).\n"]
  state_value : state_value option; [@ocaml.doc "The state value for the alarm.\n"]
  state_reason : state_reason option;
      [@ocaml.doc "An explanation for the alarm state, in text format.\n"]
  state_reason_data : state_reason_data option;
      [@ocaml.doc "An explanation for the alarm state, in JSON format.\n"]
  state_updated_timestamp : timestamp option;
      [@ocaml.doc
        "The time stamp of the last update to the value of either the [StateValue] or \
         [EvaluationState] parameters.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "The name of the metric associated with the alarm, if this is an alarm based on a single \
         metric.\n"]
  namespace : namespace option;
      [@ocaml.doc "The namespace of the metric associated with the alarm.\n"]
  statistic : statistic option;
      [@ocaml.doc
        "The statistic for the metric associated with the alarm, other than percentile. For \
         percentile statistics, use [ExtendedStatistic].\n"]
  extended_statistic : extended_statistic option;
      [@ocaml.doc
        "The percentile statistic for the metric associated with the alarm. Specify a value \
         between p0.0 and p100.\n"]
  dimensions : dimensions option;
      [@ocaml.doc "The dimensions for the metric associated with the alarm.\n"]
  period : period option;
      [@ocaml.doc "The period, in seconds, over which the statistic is applied.\n"]
  unit_ : standard_unit option; [@ocaml.doc "The unit of the metric associated with the alarm.\n"]
  evaluation_periods : evaluation_periods option;
      [@ocaml.doc "The number of periods over which data is compared to the specified threshold.\n"]
  datapoints_to_alarm : datapoints_to_alarm option;
      [@ocaml.doc "The number of data points that must be breaching to trigger the alarm.\n"]
  threshold : threshold option; [@ocaml.doc "The value to compare with the specified statistic.\n"]
  comparison_operator : comparison_operator option;
      [@ocaml.doc
        "The arithmetic operation to use when comparing the specified statistic and threshold. The \
         specified statistic value is used as the first operand.\n"]
  treat_missing_data : treat_missing_data option;
      [@ocaml.doc
        "Sets how this alarm is to handle missing data points. The valid values are [breaching], \
         [notBreaching], [ignore], and [missing]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data}Configuring \
         how CloudWatch alarms treat missing data}.\n\n\
        \ If this parameter is omitted, the default behavior of [missing] is used.\n\
        \ \n\
        \   This parameter is not applicable to PromQL alarms.\n\
        \   \n\
        \    "]
  evaluate_low_sample_count_percentile : evaluate_low_sample_count_percentile option;
      [@ocaml.doc
        "Used only for alarms based on percentiles. If [ignore], the alarm state does not change \
         during periods with too few data points to be statistically significant. If [evaluate] or \
         this parameter is not used, the alarm is always evaluated and possibly changes state no \
         matter how many data points are available.\n"]
  metrics : metric_data_queries option;
      [@ocaml.doc
        "An array of MetricDataQuery structures, used in an alarm based on a metric math \
         expression. Each structure either retrieves a metric or performs a math expression. One \
         item in the Metrics array is the math expression that the alarm watches. This expression \
         by designated by having [ReturnData] set to true.\n"]
  threshold_metric_id : metric_id option;
      [@ocaml.doc
        "In an alarm based on an anomaly detection model, this is the ID of the \
         [ANOMALY_DETECTION_BAND] function used as the threshold for the alarm.\n"]
  evaluation_state : evaluation_state option;
      [@ocaml.doc
        "If the value of this field is [PARTIAL_DATA], it indicates that not all the available \
         data was able to be retrieved due to quota limitations. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html}Create \
         alarms on Metrics Insights queries}.\n\n\
        \ If the value of this field is [EVALUATION_ERROR], it indicates configuration errors in \
         alarm setup that require review and correction. Refer to StateReason field of the alarm \
         for more details.\n\
        \ \n\
        \  If the value of this field is [EVALUATION_FAILURE], it indicates temporary CloudWatch \
         issues. We recommend manual monitoring until the issue is resolved \n\
        \  "]
  state_transitioned_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the alarm's [StateValue] most recently changed.\n"]
  evaluation_window : evaluation_window option;
      [@ocaml.doc
        "The evaluation window that the alarm uses to select the range of metric data that it \
         evaluates. This is either a sliding window or a wall clock window. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-evaluation-window.html}Alarm \
         evaluation windows} in the {i CloudWatch User Guide}.\n"]
  evaluation_criteria : evaluation_criteria option;
      [@ocaml.doc "The evaluation criteria for the alarm.\n"]
  evaluation_interval : evaluation_interval option;
      [@ocaml.doc "The frequency, in seconds, at which the alarm is evaluated.\n"]
}
[@@ocaml.doc "The details about a metric alarm.\n"]

type nonrec metric_alarms = metric_alarm list [@@ocaml.doc ""]

type nonrec describe_alarms_output = {
  composite_alarms : composite_alarms option;
      [@ocaml.doc "The information about any composite alarms returned by the operation.\n"]
  metric_alarms : metric_alarms option;
      [@ocaml.doc "The information about any metric alarms returned by the operation.\n"]
  log_alarms : log_alarms option;
      [@ocaml.doc "The information about any log alarms returned by the operation.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token that marks the start of the next batch of returned results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alarms_input = {
  alarm_names : alarm_names option;
      [@ocaml.doc "The names of the alarms to retrieve information about.\n"]
  alarm_name_prefix : alarm_name_prefix option;
      [@ocaml.doc
        "An alarm name prefix. If you specify this parameter, you receive information about all \
         alarms that have names that start with this prefix.\n\n\
        \ If this parameter is specified, you cannot specify [AlarmNames].\n\
        \ "]
  alarm_types : alarm_types option;
      [@ocaml.doc
        "Use this parameter to specify whether you want the operation to return metric alarms, \
         composite alarms, or log alarms. If you omit this parameter, only metric alarms are \
         returned, even if composite alarms or log alarms exist in the account.\n\n\
        \ For example, if you omit this parameter or specify [MetricAlarms], the operation returns \
         only a list of metric alarms. It does not return any composite alarms or log alarms, even \
         if they exist in the account.\n\
        \ \n\
        \  If you specify [CompositeAlarms], the operation returns only a list of composite \
         alarms, and does not return any metric alarms or log alarms.\n\
        \  \n\
        \   If you specify [LogAlarms], the operation returns only a list of log alarms, and does \
         not return any metric alarms or composite alarms.\n\
        \   "]
  children_of_alarm_name : alarm_name option;
      [@ocaml.doc
        "If you use this parameter and specify the name of a composite alarm, the operation \
         returns information about the \"children\" alarms of the alarm you specify. These are the \
         metric alarms and composite alarms referenced in the [AlarmRule] field of the composite \
         alarm that you specify in [ChildrenOfAlarmName]. Information about the composite alarm \
         that you name in [ChildrenOfAlarmName] is not returned.\n\n\
        \ If you specify [ChildrenOfAlarmName], you cannot specify any other parameters in the \
         request except for [MaxRecords] and [NextToken]. If you do so, you receive a validation \
         error.\n\
        \ \n\
        \   Only the [Alarm Name], [ARN], [StateValue] (OK/ALARM/INSUFFICIENT_DATA), and \
         [StateUpdatedTimestamp] information are returned by this operation when you use this \
         parameter. To get complete information about these alarms, perform another \
         [DescribeAlarms] operation and specify the parent alarm names in the [AlarmNames] \
         parameter.\n\
        \   \n\
        \    "]
  parents_of_alarm_name : alarm_name option;
      [@ocaml.doc
        "If you use this parameter and specify the name of a metric or composite alarm, the \
         operation returns information about the \"parent\" alarms of the alarm you specify. These \
         are the composite alarms that have [AlarmRule] parameters that reference the alarm named \
         in [ParentsOfAlarmName]. Information about the alarm that you specify in \
         [ParentsOfAlarmName] is not returned.\n\n\
        \ If you specify [ParentsOfAlarmName], you cannot specify any other parameters in the \
         request except for [MaxRecords] and [NextToken]. If you do so, you receive a validation \
         error.\n\
        \ \n\
        \   Only the Alarm Name and ARN are returned by this operation when you use this \
         parameter. To get complete information about these alarms, perform another \
         [DescribeAlarms] operation and specify the parent alarm names in the [AlarmNames] \
         parameter.\n\
        \   \n\
        \    "]
  state_value : state_value option;
      [@ocaml.doc
        "Specify this parameter to receive information only about alarms that are currently in the \
         state that you specify.\n"]
  action_prefix : action_prefix option;
      [@ocaml.doc
        "Use this parameter to filter the results of the operation to only those alarms that use a \
         certain alarm action. For example, you could specify the ARN of an SNS topic to find all \
         alarms that send notifications to that topic.\n"]
  max_records : max_records option;
      [@ocaml.doc "The maximum number of alarm descriptions to retrieve.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to indicate that there is more data available.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alarms_for_metric_output = {
  metric_alarms : metric_alarms option;
      [@ocaml.doc "The information for each alarm with the specified metric.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alarms_for_metric_input = {
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
  namespace : namespace; [@ocaml.doc "The namespace of the metric.\n"]
  statistic : statistic option;
      [@ocaml.doc
        "The statistic for the metric, other than percentiles. For percentile statistics, use \
         [ExtendedStatistics].\n"]
  extended_statistic : extended_statistic option;
      [@ocaml.doc
        "The percentile statistic for the metric. Specify a value between p0.0 and p100.\n"]
  dimensions : dimensions option;
      [@ocaml.doc
        "The dimensions associated with the metric. If the metric has any associated dimensions, \
         you must specify them in order for the call to succeed.\n"]
  period : period option;
      [@ocaml.doc "The period, in seconds, over which the statistic is applied.\n"]
  unit_ : standard_unit option; [@ocaml.doc "The unit for the metric.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_anomaly_detectors_output = {
  anomaly_detectors : anomaly_detectors option;
      [@ocaml.doc "The list of anomaly detection models returned by the operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token that you can use in a subsequent operation to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_returned_results_count = int [@@ocaml.doc ""]

type nonrec describe_anomaly_detectors_input = {
  next_token : next_token option;
      [@ocaml.doc
        "Use the token returned by the previous operation to request the next page of results.\n"]
  max_results : max_returned_results_count option;
      [@ocaml.doc
        "The maximum number of results to return in one operation. The maximum value that you can \
         specify is 100.\n\n\
        \ To retrieve the remaining results, make another call with the returned [NextToken] value. \n\
        \ "]
  namespace : namespace option;
      [@ocaml.doc
        "Limits the results to only the anomaly detection models that are associated with the \
         specified namespace.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "Limits the results to only the anomaly detection models that are associated with the \
         specified metric name. If there are multiple metrics with this name in different \
         namespaces that have anomaly detection models, they're all returned.\n"]
  dimensions : dimensions option;
      [@ocaml.doc
        "Limits the results to only the anomaly detection models that are associated with the \
         specified metric dimensions. If there are multiple metrics that have these dimensions and \
         have anomaly detection models associated, they're all returned.\n"]
  anomaly_detector_types : anomaly_detector_types option;
      [@ocaml.doc
        "The anomaly detector types to request when using [DescribeAnomalyDetectorsInput]. If \
         empty, defaults to [SINGLE_METRIC].\n"]
}
[@@ocaml.doc ""]

type nonrec insight_rule_on_transformed_logs = bool [@@ocaml.doc ""]

type nonrec insight_rule_is_managed = bool [@@ocaml.doc ""]

type nonrec insight_rule_definition = string [@@ocaml.doc ""]

type nonrec insight_rule_schema = string [@@ocaml.doc ""]

type nonrec insight_rule_state = string [@@ocaml.doc ""]

type nonrec insight_rule = {
  name : insight_rule_name; [@ocaml.doc "The name of the rule.\n"]
  state : insight_rule_state; [@ocaml.doc "Indicates whether the rule is enabled or disabled.\n"]
  schema : insight_rule_schema;
      [@ocaml.doc
        "For rules that you create, this is always [{\"Name\": \"CloudWatchLogRule\",\n\
        \                \"Version\": 1}]. For managed rules, this is [{\"Name\": \
         \"ServiceLogRule\",\n\
        \                \"Version\": 1}] \n"]
  definition : insight_rule_definition;
      [@ocaml.doc
        "The definition of the rule, as a JSON object. The definition contains the keywords used \
         to define contributors, the value to aggregate on if this rule returns a sum instead of a \
         count, and the filters. For details on the valid syntax, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html}Contributor \
         Insights Rule Syntax}.\n"]
  managed_rule : insight_rule_is_managed option;
      [@ocaml.doc " An optional built-in rule that Amazon Web Services manages. \n"]
  apply_on_transformed_logs : insight_rule_on_transformed_logs option;
      [@ocaml.doc
        "Displays whether the rule is evaluated on the transformed versions of logs, for log \
         groups that have \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html}Log \
         transformation} enabled. If this is [false], log events are evaluated before they are \
         transformed.\n"]
}
[@@ocaml.doc
  "This structure contains the definition for a Contributor Insights rule. For more information \
   about this rule, \
   see{{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html} \
   Using Constributor Insights to analyze high-cardinality data} in the {i Amazon CloudWatch User \
   Guide}.\n"]

type nonrec insight_rules = insight_rule list [@@ocaml.doc ""]

type nonrec describe_insight_rules_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If this parameter is present, it is a token that marks the start of the next batch of \
         returned results. \n"]
  insight_rules : insight_rules option; [@ocaml.doc "The rules returned by the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec insight_rule_max_results = int [@@ocaml.doc ""]

type nonrec describe_insight_rules_input = {
  next_token : next_token option;
      [@ocaml.doc
        "Include this value, if it was returned by the previous operation, to get the next set of \
         rules.\n"]
  max_results : insight_rule_max_results option;
      [@ocaml.doc
        "The maximum number of results to return in one operation. If you omit this parameter, the \
         default of 500 is used.\n"]
}
[@@ocaml.doc ""]

type nonrec dimension_filter = {
  name : dimension_name; [@ocaml.doc "The dimension name to be matched.\n"]
  value : dimension_value option; [@ocaml.doc "The value of the dimension to be matched.\n"]
}
[@@ocaml.doc "Represents filters for a dimension.\n"]

type nonrec dimension_filters = dimension_filter list [@@ocaml.doc ""]

type nonrec disable_alarm_actions_input = {
  alarm_names : alarm_names; [@ocaml.doc "The names of the alarms.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_insight_rules_output = {
  failures : batch_failures option;
      [@ocaml.doc
        "An array listing the rules that could not be disabled. You cannot disable built-in rules.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_insight_rules_input = {
  rule_names : insight_rule_names;
      [@ocaml.doc
        "An array of the rule names to disable. If you need to find out the names of your rules, \
         use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html}DescribeInsightRules}.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_dataset_kms_key_output = unit [@@ocaml.doc ""]

type nonrec disassociate_dataset_kms_key_input = {
  dataset_identifier : dataset_identifier;
      [@ocaml.doc
        "Specifies the identifier of the dataset from which to remove the KMS key association. For \
         the [default] dataset, you can specify either [default] or the full dataset Amazon \
         Resource Name (ARN) in the format \n\
         {[\n\
         arn:aws:cloudwatch:{i Region}:{i account-id}:dataset/default\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec duration = string [@@ocaml.doc ""]

type nonrec enable_alarm_actions_input = {
  alarm_names : alarm_names; [@ocaml.doc "The names of the alarms.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : fault_description option [@ocaml.doc ""] }
[@@ocaml.doc "The operation exceeded one or more limits.\n"]

type nonrec enable_insight_rules_output = {
  failures : batch_failures option;
      [@ocaml.doc
        "An array listing the rules that could not be enabled. You cannot disable or enable \
         built-in rules.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_insight_rules_input = {
  rule_names : insight_rule_names;
      [@ocaml.doc
        "An array of the rule names to enable. If you need to find out the names of your rules, \
         use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html}DescribeInsightRules}.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_attributes_map_value_string = string [@@ocaml.doc ""]

type nonrec entity_attributes_map_key_string = string [@@ocaml.doc ""]

type nonrec entity_attributes_map =
  (entity_attributes_map_key_string * entity_attributes_map_value_string) list
[@@ocaml.doc ""]

type nonrec entity_key_attributes_map_value_string = string [@@ocaml.doc ""]

type nonrec entity_key_attributes_map_key_string = string [@@ocaml.doc ""]

type nonrec entity_key_attributes_map =
  (entity_key_attributes_map_key_string * entity_key_attributes_map_value_string) list
[@@ocaml.doc ""]

type nonrec entity = {
  key_attributes : entity_key_attributes_map option;
      [@ocaml.doc
        "The attributes of the entity which identify the specific entity, as a list of key-value \
         pairs. Entities with the same [KeyAttributes] are considered to be the same entity. For \
         an entity to be valid, the [KeyAttributes] must exist and be formatted correctly.\n\n\
        \ There are five allowed attributes (key names): [Type], [ResourceType], [Identifier], \
         [Name], and [Environment].\n\
        \ \n\
        \  For details about how to use the key attributes to specify an entity, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html}How \
         to add related information to telemetry} in the {i CloudWatch User Guide}.\n\
        \  "]
  attributes : entity_attributes_map option;
      [@ocaml.doc
        "Additional attributes of the entity that are not used to specify the identity of the \
         entity. A list of key-value pairs.\n\n\
        \ For details about how to use the attributes, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html}How \
         to add related information to telemetry} in the {i CloudWatch User Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "An entity associated with metrics, to allow for finding related telemetry. An entity is \
   typically a resource or service within your system. For example, metrics from an Amazon EC2 \
   instance could be associated with that instance as the entity. Similarly, metrics from a \
   service that you own could be associated with that service as the entity.\n"]

type nonrec storage_resolution = int [@@ocaml.doc ""]

type nonrec values = datapoint_value list [@@ocaml.doc ""]

type nonrec statistic_set = {
  sample_count : datapoint_value; [@ocaml.doc "The number of samples used for the statistic set.\n"]
  sum : datapoint_value; [@ocaml.doc "The sum of values for the sample set.\n"]
  minimum : datapoint_value; [@ocaml.doc "The minimum value of the sample set.\n"]
  maximum : datapoint_value; [@ocaml.doc "The maximum value of the sample set.\n"]
}
[@@ocaml.doc "Represents a set of statistics that describes a specific metric. \n"]

type nonrec metric_datum = {
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
  dimensions : dimensions option; [@ocaml.doc "The dimensions associated with the metric. \n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time the metric data was received, expressed as the number of milliseconds since Jan \
         1, 1970 00:00:00 UTC.\n"]
  value : datapoint_value option;
      [@ocaml.doc
        "The value for the metric.\n\n\
        \ Although the parameter accepts numbers of type Double, CloudWatch rejects values that \
         are either too small or too large. Values must be in the range of -2^360 to 2^360. In \
         addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.\n\
        \ "]
  statistic_values : statistic_set option; [@ocaml.doc "The statistical values for the metric.\n"]
  values : values option;
      [@ocaml.doc
        "Array of numbers representing the values for the metric during the period. Each unique \
         value is listed just once in this array, and the corresponding number in the [Counts] \
         array specifies the number of times that value occurred during the period. You can \
         include up to 150 unique values in each [PutMetricData] action that specifies a [Values] \
         array.\n\n\
        \ Although the [Values] array accepts numbers of type [Double], CloudWatch rejects values \
         that are either too small or too large. Values must be in the range of -2^360 to 2^360. \
         In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.\n\
        \ "]
  counts : counts option;
      [@ocaml.doc
        "Array of numbers that is used along with the [Values] array. Each number in the [Count] \
         array is the number of times the corresponding value in the [Values] array occurred \
         during the period. \n\n\
        \ If you omit the [Counts] array, the default of 1 is used as the value for each count. If \
         you include a [Counts] array, it must include the same amount of values as the [Values] \
         array.\n\
        \ "]
  unit_ : standard_unit option;
      [@ocaml.doc
        "When you are using a [Put] operation, this defines what unit you want to use when storing \
         the metric.\n\n\
        \ In a [Get] operation, this displays the unit that is used for the metric.\n\
        \ "]
  storage_resolution : storage_resolution option;
      [@ocaml.doc
        "Valid values are 1 and 60. Setting this to 1 specifies this metric as a high-resolution \
         metric, so that CloudWatch stores the metric with sub-minute resolution down to one \
         second. Setting this to 60 specifies this metric as a regular-resolution metric, which \
         CloudWatch stores at 1-minute resolution. Currently, high resolution is available only \
         for custom metrics. For more information about high-resolution metrics, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics}High-Resolution \
         Metrics} in the {i Amazon CloudWatch User Guide}. \n\n\
        \ This field is optional, if you do not specify it the default of 60 is used.\n\
        \ "]
}
[@@ocaml.doc
  "Encapsulates the information sent to either create a metric or add new values to be aggregated \
   into an existing metric.\n"]

type nonrec metric_data = metric_datum list [@@ocaml.doc ""]

type nonrec entity_metric_data = {
  entity : entity option; [@ocaml.doc "The entity associated with the metrics.\n"]
  metric_data : metric_data option; [@ocaml.doc "The metric data.\n"]
}
[@@ocaml.doc
  "A set of metrics that are associated with an entity, such as a specific service or resource. \
   Contains the entity and the list of metric data associated with it.\n"]

type nonrec entity_metric_data_list = entity_metric_data list [@@ocaml.doc ""]

type nonrec expression = string [@@ocaml.doc ""]

type nonrec extended_statistics = extended_statistic list [@@ocaml.doc ""]

type nonrec mute_target_alarm_name_list = name list [@@ocaml.doc ""]

type nonrec mute_targets = {
  alarm_names : mute_target_alarm_name_list;
      [@ocaml.doc
        "The list of alarm names that this mute rule targets. You can specify up to 100 alarm \
         names.\n\n\
        \ Each alarm name must be between 1 and 255 characters in length. The alarm names must \
         match existing alarms in your Amazon Web Services account and region.\n\
        \ "]
}
[@@ocaml.doc
  "Specifies which alarms an alarm mute rule applies to.\n\n\
  \ You can target up to 100 specific alarms by name. When a mute rule is active, the targeted \
   alarms continue to evaluate metrics and transition between states, but their configured actions \
   are muted.\n\
  \ "]

type nonrec schedule = {
  expression : expression;
      [@ocaml.doc
        "The schedule expression that defines when the mute rule activates. The expression must be \
         between 1 and 256 characters in length.\n\n\
        \ You can use one of two expression formats:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Cron expressions} - For recurring mute windows. Format: [cron(Minutes \
         Hours Day-of-month Month\n\
        \                    Day-of-week)] \n\
        \            \n\
        \             Examples:\n\
        \             \n\
        \              {ul\n\
        \                    {-   [cron(0 2 * * *)] - Activates daily at 2:00 AM\n\
        \                        \n\
        \                         }\n\
        \                    {-   [cron(0 2 * * SUN)] - Activates every Sunday at 2:00 AM for \
         weekly system maintenance\n\
        \                        \n\
        \                         }\n\
        \                    {-   [cron(0 1 1 * *)] - Activates on the first day of each month at \
         1:00 AM for monthly database maintenance\n\
        \                        \n\
        \                         }\n\
        \                    {-   [cron(0 18 * * FRI)] - Activates every Friday at 6:00 PM\n\
        \                        \n\
        \                         }\n\
        \                    {-   [cron(0 23 * * *)] - Activates every day at 11:00 PM during \
         nightly backup operations\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \         }\n\
        \          The characters [*], [-], and [,] are supported in all fields. English names can \
         be used for the month (JAN-DEC) and day of week (SUN-SAT) fields.\n\
        \          \n\
        \           }\n\
        \        {-   {b At expressions} - For one-time mute windows. Format: \
         [at(yyyy-MM-ddThh:mm)] \n\
        \            \n\
        \             Examples:\n\
        \             \n\
        \              {ul\n\
        \                    {-   [at(2024-05-10T14:00)] - Activates once on May 10, 2024 at 2:00 \
         PM during an active incident response session\n\
        \                        \n\
        \                         }\n\
        \                    {-   [at(2024-12-23T00:00)] - Activates once on December 23, 2024 at \
         midnight during annual company shutdown\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  duration : duration;
      [@ocaml.doc
        "The length of time that alarms remain muted when the schedule activates. The duration \
         must be between 1 and 50 characters in length.\n\n\
        \ Specify the duration using ISO 8601 duration format with a minimum of 1 minute ([PT1M]) \
         and maximum of 15 days ([P15D]).\n\
        \ \n\
        \  Examples:\n\
        \  \n\
        \   {ul\n\
        \         {-   [PT4H] - 4 hours for weekly system maintenance\n\
        \             \n\
        \              }\n\
        \         {-   [P2DT12H] - 2 days and 12 hours for weekend muting from Friday 6:00 PM to \
         Monday 6:00 AM\n\
        \             \n\
        \              }\n\
        \         {-   [PT6H] - 6 hours for monthly database maintenance\n\
        \             \n\
        \              }\n\
        \         {-   [PT2H] - 2 hours for nightly backup operations\n\
        \             \n\
        \              }\n\
        \         {-   [P7D] - 7 days for annual company shutdown\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   The duration begins when the schedule expression time is reached. For recurring \
         schedules, the duration applies to each occurrence.\n\
        \   "]
  timezone : timezone option;
      [@ocaml.doc
        "The time zone to use when evaluating the schedule expression. The time zone must be \
         between 1 and 50 characters in length.\n\n\
        \ Specify the time zone using standard timezone identifiers (for example, \
         [America/New_York], [Europe/London], or [Asia/Tokyo]).\n\
        \ \n\
        \  If you don't specify a time zone, UTC is used by default. The time zone affects how \
         cron and at expressions are interpreted, as well as start and expire dates you specify\n\
        \  \n\
        \   Examples:\n\
        \   \n\
        \    {ul\n\
        \          {-   [America/New_York] - Eastern Time (US)\n\
        \              \n\
        \               }\n\
        \          {-   [America/Los_Angeles] - Pacific Time (US)\n\
        \              \n\
        \               }\n\
        \          {-   [Europe/London] - British Time\n\
        \              \n\
        \               }\n\
        \          {-   [Asia/Tokyo] - Japan Standard Time\n\
        \              \n\
        \               }\n\
        \          {-   [UTC] - Coordinated Universal Time\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  "Specifies when and how long an alarm mute rule is active.\n\n\
  \ The schedule uses either a cron expression for recurring mute windows or an at expression for \
   one-time mute windows. When the schedule activates, the mute rule mutes alarm actions for the \
   specified duration.\n\
  \ "]

type nonrec rule = {
  schedule : schedule;
      [@ocaml.doc
        "The schedule configuration that defines when the mute rule activates and how long it \
         remains active.\n"]
}
[@@ocaml.doc
  "Defines the schedule configuration for an alarm mute rule.\n\n\
  \ The rule contains a schedule that specifies when and how long alarms should be muted. The \
   schedule can be a recurring pattern using cron expressions or a one-time mute window using at \
   expressions.\n\
  \ "]

type nonrec get_alarm_mute_rule_output = {
  name : name option; [@ocaml.doc "The name of the alarm mute rule.\n"]
  alarm_mute_rule_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm mute rule.\n"]
  description : alarm_description option; [@ocaml.doc "The description of the alarm mute rule.\n"]
  rule : rule option;
      [@ocaml.doc "The configuration that defines when and how long alarms are muted.\n"]
  mute_targets : mute_targets option; [@ocaml.doc "Specifies which alarms this rule applies to.\n"]
  start_date : timestamp option;
      [@ocaml.doc
        "The date and time when the mute rule becomes active. If not set, the rule is active \
         immediately.\n"]
  expire_date : timestamp option;
      [@ocaml.doc "The date and time when the mute rule expires and is no longer evaluated.\n"]
  status : alarm_mute_rule_status option;
      [@ocaml.doc
        "The current status of the alarm mute rule. Valid values are [SCHEDULED], [ACTIVE], or \
         [EXPIRED].\n"]
  last_updated_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the mute rule was last updated.\n"]
  mute_type : mute_type option;
      [@ocaml.doc
        "Indicates whether the mute rule is one-time or recurring. Valid values are [ONE_TIME] or \
         [RECURRING].\n"]
}
[@@ocaml.doc ""]

type nonrec get_alarm_mute_rule_input = {
  alarm_mute_rule_name : name; [@ocaml.doc "The name of the alarm mute rule to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_output = {
  dashboard_arn : dashboard_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dashboard.\n"]
  dashboard_body : dashboard_body option;
      [@ocaml.doc
        "The detailed information about the dashboard, including what widgets are included and \
         their location on the dashboard. For more information about the [DashboardBody] syntax, \
         see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Dashboard-Body-Structure.html}Dashboard \
         Body Structure and Syntax}. \n"]
  dashboard_name : dashboard_name option; [@ocaml.doc "The name of the dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_input = {
  dashboard_name : dashboard_name; [@ocaml.doc "The name of the dashboard to be described.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dataset_output = {
  dataset_id : dataset_id; [@ocaml.doc "Returns the identifier of the dataset.\n"]
  arn : dataset_arn;
      [@ocaml.doc
        "Returns the Amazon Resource Name (ARN) of the dataset, in the format \n\
         {[\n\
         arn:aws:cloudwatch:{i Region}:{i account-id}:dataset/{i dataset-id} \n\
         ]}\n\
         .\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "Returns the Amazon Resource Name (ARN) of the customer managed Amazon Web Services KMS \
         key that is currently associated with the dataset, if any. If the dataset is not \
         associated with a customer managed KMS key, this field is not included in the response \
         and the dataset is encrypted at rest using an Amazon Web Services owned key.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dataset_input = {
  dataset_identifier : dataset_identifier;
      [@ocaml.doc
        "Specifies the identifier of the dataset to retrieve. For the [default] dataset, you can \
         specify either [default] or the full dataset Amazon Resource Name (ARN) in the format \n\
         {[\n\
         arn:aws:cloudwatch:{i Region}:{i account-id}:dataset/default\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec insight_rule_unbound_double = float [@@ocaml.doc ""]

type nonrec insight_rule_metric_datapoint = {
  timestamp : timestamp; [@ocaml.doc "The timestamp of the data point.\n"]
  unique_contributors : insight_rule_unbound_double option;
      [@ocaml.doc
        "The number of unique contributors who published data during this timestamp.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  max_contributor_value : insight_rule_unbound_double option;
      [@ocaml.doc
        "The maximum value provided by one contributor during this timestamp. Each timestamp is \
         evaluated separately, so the identity of the max contributor could be different for each \
         timestamp.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  sample_count : insight_rule_unbound_double option;
      [@ocaml.doc
        "The number of occurrences that matched the rule during this data point.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  average : insight_rule_unbound_double option;
      [@ocaml.doc
        "The average value from all contributors during the time period represented by that data \
         point.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  sum : insight_rule_unbound_double option;
      [@ocaml.doc
        "The sum of the values from all contributors during the time period represented by that \
         data point.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  minimum : insight_rule_unbound_double option;
      [@ocaml.doc
        "The minimum value from a single contributor during the time period represented by that \
         data point.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
  maximum : insight_rule_unbound_double option;
      [@ocaml.doc
        "The maximum value from a single occurence from a single contributor during the time \
         period represented by that data point.\n\n\
        \ This statistic is returned only if you included it in the [Metrics] array in your request.\n\
        \ "]
}
[@@ocaml.doc
  "One data point from the metric time series returned in a Contributor Insights rule report.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html}GetInsightRuleReport}.\n\
  \ "]

type nonrec insight_rule_metric_datapoints = insight_rule_metric_datapoint list [@@ocaml.doc ""]

type nonrec insight_rule_contributor_datapoint = {
  timestamp : timestamp; [@ocaml.doc "The timestamp of the data point.\n"]
  approximate_value : insight_rule_unbound_double;
      [@ocaml.doc "The approximate value that this contributor added during this timestamp.\n"]
}
[@@ocaml.doc
  "One data point related to one contributor.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html}GetInsightRuleReport} \
   and \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_InsightRuleContributor.html}InsightRuleContributor}.\n\
  \ "]

type nonrec insight_rule_contributor_datapoints = insight_rule_contributor_datapoint list
[@@ocaml.doc ""]

type nonrec insight_rule_contributor_key = string [@@ocaml.doc ""]

type nonrec insight_rule_contributor_keys = insight_rule_contributor_key list [@@ocaml.doc ""]

type nonrec insight_rule_contributor = {
  keys : insight_rule_contributor_keys;
      [@ocaml.doc
        "One of the log entry field keywords that is used to define contributors for this rule.\n"]
  approximate_aggregate_value : insight_rule_unbound_double;
      [@ocaml.doc "An approximation of the aggregate value that comes from this contributor.\n"]
  datapoints : insight_rule_contributor_datapoints;
      [@ocaml.doc
        "An array of the data points where this contributor is present. Only the data points when \
         this contributor appeared are included in the array.\n"]
}
[@@ocaml.doc
  "One of the unique contributors found by a Contributor Insights rule. If the rule contains \
   multiple keys, then a unique contributor is a unique combination of values from all the keys in \
   the rule.\n\n\
  \ If the rule contains a single key, then each unique contributor is each unique value for this \
   key.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html}GetInsightRuleReport}.\n\
  \  "]

type nonrec insight_rule_contributors = insight_rule_contributor list [@@ocaml.doc ""]

type nonrec insight_rule_unbound_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec insight_rule_aggregation_statistic = string [@@ocaml.doc ""]

type nonrec insight_rule_contributor_key_label = string [@@ocaml.doc ""]

type nonrec insight_rule_contributor_key_labels = insight_rule_contributor_key_label list
[@@ocaml.doc ""]

type nonrec get_insight_rule_report_output = {
  key_labels : insight_rule_contributor_key_labels option;
      [@ocaml.doc
        "An array of the strings used as the keys for this rule. The keys are the dimensions used \
         to classify contributors. If the rule contains more than one key, then each unique \
         combination of values for the keys is counted as a unique contributor.\n"]
  aggregation_statistic : insight_rule_aggregation_statistic option;
      [@ocaml.doc "Specifies whether this rule aggregates contributor data by COUNT or SUM.\n"]
  aggregate_value : insight_rule_unbound_double option;
      [@ocaml.doc "The sum of the values from all individual contributors that match the rule.\n"]
  approximate_unique_count : insight_rule_unbound_long option;
      [@ocaml.doc
        "An approximate count of the unique contributors found by this rule in this time period.\n"]
  contributors : insight_rule_contributors option;
      [@ocaml.doc
        "An array of the unique contributors found by this rule in this time period. If the rule \
         contains multiple keys, each combination of values for the keys counts as a unique \
         contributor.\n"]
  metric_datapoints : insight_rule_metric_datapoints option;
      [@ocaml.doc
        "A time series of metric data points that matches the time period in the rule request.\n"]
}
[@@ocaml.doc ""]

type nonrec insight_rule_order_by = string [@@ocaml.doc ""]

type nonrec insight_rule_metric_name = string [@@ocaml.doc ""]

type nonrec insight_rule_metric_list = insight_rule_metric_name list [@@ocaml.doc ""]

type nonrec insight_rule_unbound_integer = int [@@ocaml.doc ""]

type nonrec get_insight_rule_report_input = {
  rule_name : insight_rule_name;
      [@ocaml.doc "The name of the rule that you want to see data from.\n"]
  start_time : timestamp;
      [@ocaml.doc
        "The start time of the data to use in the report. When used in a raw HTTP Query API, it is \
         formatted as [yyyy-MM-dd'T'HH:mm:ss]. For example, [2019-07-01T23:59:59].\n"]
  end_time : timestamp;
      [@ocaml.doc
        "The end time of the data to use in the report. When used in a raw HTTP Query API, it is \
         formatted as [yyyy-MM-dd'T'HH:mm:ss]. For example, [2019-07-01T23:59:59].\n"]
  period : period;
      [@ocaml.doc
        "The period, in seconds, to use for the statistics in the [InsightRuleMetricDatapoint] \
         results.\n"]
  max_contributor_count : insight_rule_unbound_integer option;
      [@ocaml.doc
        "The maximum number of contributors to include in the report. The range is 1 to 100. If \
         you omit this, the default of 10 is used.\n"]
  metrics : insight_rule_metric_list option;
      [@ocaml.doc
        "Specifies which metrics to use for aggregation of contributor values for the report. You \
         can specify one or more of the following metrics:\n\n\
        \ {ul\n\
        \       {-   [UniqueContributors] -- the number of unique contributors for each data point.\n\
        \           \n\
        \            }\n\
        \       {-   [MaxContributorValue] -- the value of the top contributor for each data \
         point. The identity of the contributor might change for each data point in the graph.\n\
        \           \n\
        \            If this rule aggregates by COUNT, the top contributor for each data point is \
         the contributor with the most occurrences in that period. If the rule aggregates by SUM, \
         the top contributor is the contributor with the highest sum in the log field specified by \
         the rule's [Value], during that period.\n\
        \            \n\
        \             }\n\
        \       {-   [SampleCount] -- the number of data points matched by the rule.\n\
        \           \n\
        \            }\n\
        \       {-   [Sum] -- the sum of the values from all contributors during the time period \
         represented by that data point.\n\
        \           \n\
        \            }\n\
        \       {-   [Minimum] -- the minimum value from a single observation during the time \
         period represented by that data point.\n\
        \           \n\
        \            }\n\
        \       {-   [Maximum] -- the maximum value from a single observation during the time \
         period represented by that data point.\n\
        \           \n\
        \            }\n\
        \       {-   [Average] -- the average value from all contributors during the time period \
         represented by that data point.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  order_by : insight_rule_order_by option;
      [@ocaml.doc
        "Determines what statistic to use to rank the contributors. Valid values are [Sum] and \
         [Maximum].\n"]
}
[@@ocaml.doc ""]

type nonrec message_data_value = string [@@ocaml.doc ""]

type nonrec message_data_code = string [@@ocaml.doc ""]

type nonrec message_data = {
  code : message_data_code option;
      [@ocaml.doc "The error code or status code associated with the message.\n"]
  value : message_data_value option; [@ocaml.doc "The message text.\n"]
}
[@@ocaml.doc
  "A message returned by the [GetMetricData]API, including a code and a description.\n\n\
  \ If a cross-Region [GetMetricData] operation fails with a code of [Forbidden] and a value of \
   [Authentication too complex to retrieve\n\
  \                cross region data], you can correct the problem by running the [GetMetricData] \
   operation in the same Region where the metric data is.\n\
  \ "]

type nonrec metric_data_result_messages = message_data list [@@ocaml.doc ""]

type nonrec status_code =
  | COMPLETE [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
  | PARTIAL_DATA [@ocaml.doc ""]
  | FORBIDDEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamps = timestamp list [@@ocaml.doc ""]

type nonrec metric_data_result = {
  id : metric_id option; [@ocaml.doc "The short name you specified to represent this metric.\n"]
  label : metric_label option; [@ocaml.doc "The human-readable label associated with the data.\n"]
  timestamps : timestamps option;
      [@ocaml.doc
        "The timestamps for the data points, formatted in Unix timestamp format. The number of \
         timestamps always matches the number of values and the value for Timestamps\\[x\\] is \
         Values\\[x\\].\n"]
  values : datapoint_values option;
      [@ocaml.doc
        "The data points for the metric corresponding to [Timestamps]. The number of values always \
         matches the number of timestamps and the timestamp for Values\\[x\\] is Timestamps\\[x\\].\n"]
  status_code : status_code option;
      [@ocaml.doc
        "The status of the returned data. [Complete] indicates that all data points in the \
         requested time range were returned. [PartialData] means that an incomplete set of data \
         points were returned. You can use the [NextToken] value that was returned and repeat your \
         request to get more data points. [NextToken] is not returned if you are performing a math \
         expression. [InternalError] indicates that an error occurred. Retry your request using \
         [NextToken], if present.\n"]
  messages : metric_data_result_messages option;
      [@ocaml.doc "A list of messages with additional information about the data returned.\n"]
}
[@@ocaml.doc
  "A [GetMetricData] call returns an array of [MetricDataResult] structures. Each of these \
   structures includes the data points for that metric, along with the timestamps of those data \
   points and other identifying information.\n"]

type nonrec metric_data_results = metric_data_result list [@@ocaml.doc ""]

type nonrec get_metric_data_output = {
  metric_data_results : metric_data_results option;
      [@ocaml.doc
        "The metrics that are returned, including the metric name, namespace, and dimensions.\n"]
  next_token : next_token option;
      [@ocaml.doc "A token that marks the next batch of returned results.\n"]
  messages : metric_data_result_messages option;
      [@ocaml.doc
        "Contains a message about this [GetMetricData] operation, if the operation results in such \
         a message. An example of a message that might be returned is [Maximum number of allowed \
         metrics exceeded]. If there is a message, as much of the operation as possible is still \
         executed.\n\n\
        \ A message appears here only if it is related to the global [GetMetricData] operation. \
         Any message about a specific metric returned by the operation appears in the \
         [MetricDataResult] object returned for that metric.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_metric_data_label_timezone = string [@@ocaml.doc ""]

type nonrec label_options = {
  timezone : get_metric_data_label_timezone option;
      [@ocaml.doc
        "The time zone to use for metric data return in this operation. The format is [+] or [-] \
         followed by four digits. The first two digits indicate the number of hours ahead or \
         behind of UTC, and the final two digits are the number of minutes. For example, +0130 \
         indicates a time zone that is 1 hour and 30 minutes ahead of UTC. The default is +0000. \n"]
}
[@@ocaml.doc
  "This structure includes the [Timezone] parameter, which you can use to specify your time zone \
   so that the labels that are associated with returned metrics display the correct time for your \
   time zone. \n\n\
  \ The [Timezone] value affects a label only if you have a time-based dynamic expression in the \
   label. For more information about dynamic expressions in labels, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/graph-dynamic-labels.html}Using \
   Dynamic Labels}.\n\
  \ "]

type nonrec get_metric_data_max_datapoints = int [@@ocaml.doc ""]

type nonrec get_metric_data_input = {
  metric_data_queries : metric_data_queries;
      [@ocaml.doc
        "The metric queries to be returned. A single [GetMetricData] call can include as many as \
         500 [MetricDataQuery] structures. Each of these structures can specify either a metric to \
         retrieve, a Metrics Insights query, or a math expression to perform on retrieved data. \n"]
  start_time : timestamp;
      [@ocaml.doc
        "The time stamp indicating the earliest data to be returned.\n\n\
        \ The value specified is inclusive; results include data points with the specified time \
         stamp. \n\
        \ \n\
        \  CloudWatch rounds the specified time stamp as follows:\n\
        \  \n\
        \   {ul\n\
        \         {-  Start time less than 15 days ago - Round down to the nearest whole minute. \
         For example, 12:32:34 is rounded down to 12:32:00.\n\
        \             \n\
        \              }\n\
        \         {-  Start time between 15 and 63 days ago - Round down to the nearest 5-minute \
         clock interval. For example, 12:32:34 is rounded down to 12:30:00.\n\
        \             \n\
        \              }\n\
        \         {-  Start time greater than 63 days ago - Round down to the nearest 1-hour clock \
         interval. For example, 12:32:34 is rounded down to 12:00:00.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   If you set [Period] to 5, 10, 20, or 30, the start time of your request is rounded \
         down to the nearest time that corresponds to even 5-, 10-, 20-, or 30-second divisions of \
         a minute. For example, if you make a query at (HH:mm:ss) 01:05:23 for the previous \
         10-second period, the start time of your request is rounded down and you receive data \
         from 01:05:10 to 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of \
         data, using a period of 5 seconds, you receive data timestamped between 15:02:15 and \
         15:07:15. \n\
        \   \n\
        \    For better performance, specify [StartTime] and [EndTime] values that align with the \
         value of the metric's [Period] and sync up with the beginning and end of an hour. For \
         example, if the [Period] of a metric is 5 minutes, specifying 12:05 or 12:30 as \
         [StartTime] can get a faster response from CloudWatch than setting 12:07 or 12:29 as the \
         [StartTime].\n\
        \    "]
  end_time : timestamp;
      [@ocaml.doc
        "The time stamp indicating the latest data to be returned.\n\n\
        \ The value specified is exclusive; results include data points up to the specified time \
         stamp.\n\
        \ \n\
        \  For better performance, specify [StartTime] and [EndTime] values that align with the \
         value of the metric's [Period] and sync up with the beginning and end of an hour. For \
         example, if the [Period] of a metric is 5 minutes, specifying 12:05 or 12:30 as [EndTime] \
         can get a faster response from CloudWatch than setting 12:07 or 12:29 as the [EndTime].\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "Include this value, if it was returned by the previous [GetMetricData] operation, to get \
         the next set of data points.\n"]
  scan_by : scan_by option;
      [@ocaml.doc
        "The order in which data points should be returned. [TimestampDescending] returns the \
         newest data first and paginates when the [MaxDatapoints] limit is reached. \
         [TimestampAscending] returns the oldest data first and paginates when the [MaxDatapoints] \
         limit is reached.\n\n\
        \ If you omit this parameter, the default of [TimestampDescending] is used.\n\
        \ "]
  max_datapoints : get_metric_data_max_datapoints option;
      [@ocaml.doc
        "The maximum number of data points the request should return before paginating. If you \
         omit this, the default of 100,800 is used.\n"]
  label_options : label_options option;
      [@ocaml.doc
        "This structure includes the [Timezone] parameter, which you can use to specify your time \
         zone so that the labels of returned data display the correct time for your time zone. \n"]
}
[@@ocaml.doc ""]

type nonrec get_metric_statistics_output = {
  label : metric_label option; [@ocaml.doc "A label for the specified metric.\n"]
  datapoints : datapoints option; [@ocaml.doc "The data points for the specified metric.\n"]
}
[@@ocaml.doc ""]

type nonrec statistics = statistic list [@@ocaml.doc ""]

type nonrec get_metric_statistics_input = {
  namespace : namespace; [@ocaml.doc "The namespace of the metric, with or without spaces.\n"]
  metric_name : metric_name; [@ocaml.doc "The name of the metric, with or without spaces.\n"]
  dimensions : dimensions option;
      [@ocaml.doc
        "The dimensions. If the metric contains multiple dimensions, you must include a value for \
         each dimension. CloudWatch treats each unique combination of dimensions as a separate \
         metric. If a specific combination of dimensions was not published, you can't retrieve \
         statistics for it. You must specify the same dimensions that were used when the metrics \
         were created. For an example, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations}Dimension \
         Combinations} in the {i Amazon CloudWatch User Guide}. For more information about \
         specifying dimensions, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html}Publishing \
         Metrics} in the {i Amazon CloudWatch User Guide}.\n"]
  start_time : timestamp;
      [@ocaml.doc
        "The time stamp that determines the first data point to return. Start times are evaluated \
         relative to the time that CloudWatch receives the request.\n\n\
        \ The value specified is inclusive; results include data points with the specified time \
         stamp. In a raw HTTP query, the time stamp must be in ISO 8601 UTC format (for example, \
         2016-10-03T23:00:00Z).\n\
        \ \n\
        \  CloudWatch rounds the specified time stamp as follows:\n\
        \  \n\
        \   {ul\n\
        \         {-  Start time less than 15 days ago - Round down to the nearest whole minute. \
         For example, 12:32:34 is rounded down to 12:32:00.\n\
        \             \n\
        \              }\n\
        \         {-  Start time between 15 and 63 days ago - Round down to the nearest 5-minute \
         clock interval. For example, 12:32:34 is rounded down to 12:30:00.\n\
        \             \n\
        \              }\n\
        \         {-  Start time greater than 63 days ago - Round down to the nearest 1-hour clock \
         interval. For example, 12:32:34 is rounded down to 12:00:00.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   If you set [Period] to 5, 10, 20, or 30, the start time of your request is rounded \
         down to the nearest time that corresponds to even 5-, 10-, 20-, or 30-second divisions of \
         a minute. For example, if you make a query at (HH:mm:ss) 01:05:23 for the previous \
         10-second period, the start time of your request is rounded down and you receive data \
         from 01:05:10 to 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of \
         data, using a period of 5 seconds, you receive data timestamped between 15:02:15 and \
         15:07:15. \n\
        \   "]
  end_time : timestamp;
      [@ocaml.doc
        "The time stamp that determines the last data point to return.\n\n\
        \ The value specified is exclusive; results include data points up to the specified time \
         stamp. In a raw HTTP query, the time stamp must be in ISO 8601 UTC format (for example, \
         2016-10-10T23:00:00Z).\n\
        \ "]
  period : period;
      [@ocaml.doc
        "The granularity, in seconds, of the returned data points. For metrics with regular \
         resolution, a period can be as short as one minute (60 seconds) and must be a multiple of \
         60. For high-resolution metrics that are collected at intervals of less than one minute, \
         the period can be 1, 5, 10, 20, 30, 60, or any multiple of 60. High-resolution metrics \
         are those metrics stored by a [PutMetricData] call that includes a [StorageResolution] of \
         1 second.\n\n\
        \ If the [StartTime] parameter specifies a time stamp that is greater than 3 hours ago, \
         you must specify the period as follows or no data points in that time range is returned:\n\
        \ \n\
        \  {ul\n\
        \        {-  Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1 \
         minute).\n\
        \            \n\
        \             }\n\
        \        {-  Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5 \
         minutes).\n\
        \            \n\
        \             }\n\
        \        {-  Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  statistics : statistics option;
      [@ocaml.doc
        "The metric statistics, other than percentile. For percentile statistics, use \
         [ExtendedStatistics]. When calling [GetMetricStatistics], you must specify either \
         [Statistics] or [ExtendedStatistics], but not both.\n"]
  extended_statistics : extended_statistics option;
      [@ocaml.doc
        "The percentile statistics. Specify values between p0.0 and p100. When calling \
         [GetMetricStatistics], you must specify either [Statistics] or [ExtendedStatistics], but \
         not both. Percentile statistics are not available for metrics when any of the metric \
         values are negative numbers.\n"]
  unit_ : standard_unit option;
      [@ocaml.doc
        "The unit for a given metric. If you omit [Unit], all data that was collected with any \
         unit is returned, along with the corresponding units that were specified when the data \
         was reported to CloudWatch. If you specify a unit, the operation returns only data that \
         was collected with that unit specified. If you specify a unit that does not match the \
         data collected, the results of the operation are null. CloudWatch does not perform unit \
         conversions.\n"]
}
[@@ocaml.doc ""]

type nonrec include_linked_accounts_metrics = bool [@@ocaml.doc ""]

type nonrec metric_stream_statistic = string [@@ocaml.doc ""]

type nonrec metric_stream_statistics_additional_statistics = metric_stream_statistic list
[@@ocaml.doc ""]

type nonrec metric_stream_statistics_metric = {
  namespace : namespace; [@ocaml.doc "The namespace of the metric.\n"]
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
}
[@@ocaml.doc
  "This object contains the information for one metric that is to be streamed with additional \
   statistics.\n"]

type nonrec metric_stream_statistics_include_metrics = metric_stream_statistics_metric list
[@@ocaml.doc ""]

type nonrec metric_stream_statistics_configuration = {
  include_metrics : metric_stream_statistics_include_metrics;
      [@ocaml.doc
        "An array of metric name and namespace pairs that stream the additional statistics listed \
         in the value of the [AdditionalStatistics] parameter. There can be as many as 100 pairs \
         in the array.\n\n\
        \ All metrics that match the combination of metric name and namespace will be streamed \
         with the additional statistics, no matter their dimensions.\n\
        \ "]
  additional_statistics : metric_stream_statistics_additional_statistics;
      [@ocaml.doc
        "The list of additional statistics that are to be streamed for the metrics listed in the \
         [IncludeMetrics] array in this structure. This list can include as many as 20 \
         statistics.\n\n\
        \ If the [OutputFormat] for the stream is [opentelemetry1.0] or [opentelemetry0.7], the \
         only valid values are \n\
        \ {[\n\
        \ p{i ??} \n\
        \ ]}\n\
        \  percentile statistics such as [p90], [p99] and so on.\n\
        \ \n\
        \  If the [OutputFormat] for the stream is [json], the valid values include the \
         abbreviations for all of the statistics listed in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html} \
         CloudWatch statistics definitions}. For example, this includes [tm98, ] [wm90], \
         [PR(:300)], and so on.\n\
        \  "]
}
[@@ocaml.doc
  "By default, a metric stream always sends the [MAX], [MIN], [SUM], and [SAMPLECOUNT] statistics \
   for each metric that is streamed. This structure contains information for one metric that \
   includes additional statistics in the stream. For more information about statistics, see \
   CloudWatch, listed in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html} \
   CloudWatch statistics definitions}.\n"]

type nonrec metric_stream_statistics_configurations = metric_stream_statistics_configuration list
[@@ocaml.doc ""]

type nonrec metric_stream_output_format =
  | JSON [@ocaml.doc ""]
  | OPEN_TELEMETRY_0_7 [@ocaml.doc ""]
  | OPEN_TELEMETRY_1_0 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_stream_state = string [@@ocaml.doc ""]

type nonrec metric_stream_filter_metric_names = metric_name list [@@ocaml.doc ""]

type nonrec metric_stream_filter = {
  namespace : namespace option;
      [@ocaml.doc
        "The name of the metric namespace for this filter.\n\n\
        \ The namespace can contain only ASCII printable characters (ASCII range 32 through 126). \
         It must contain at least one non-whitespace character.\n\
        \ "]
  metric_names : metric_stream_filter_metric_names option;
      [@ocaml.doc
        "The names of the metrics to either include or exclude from the metric stream. \n\n\
        \ If you omit this parameter, all metrics in the namespace are included or excluded, \
         depending on whether this filter is specified as an exclude filter or an include filter.\n\
        \ \n\
        \  Each metric name can contain only ASCII printable characters (ASCII range 32 through \
         126). Each metric name must contain at least one non-whitespace character.\n\
        \  "]
}
[@@ocaml.doc
  "This structure contains a metric namespace and optionally, a list of metric names, to either \
   include in a metric stream or exclude from a metric stream.\n\n\
  \ A metric stream's filters can include up to 1000 total names. This limit applies to the sum of \
   namespace names and metric names in the filters. For example, this could include 10 metric \
   namespace filters with 99 metrics each, or 20 namespace filters with 49 metrics specified in \
   each filter.\n\
  \ "]

type nonrec metric_stream_filters = metric_stream_filter list [@@ocaml.doc ""]

type nonrec get_metric_stream_output = {
  arn : amazon_resource_name option; [@ocaml.doc "The ARN of the metric stream.\n"]
  name : metric_stream_name option; [@ocaml.doc "The name of the metric stream.\n"]
  include_filters : metric_stream_filters option;
      [@ocaml.doc
        "If this array of metric namespaces is present, then these namespaces are the only metric \
         namespaces that are streamed by this metric stream.\n"]
  exclude_filters : metric_stream_filters option;
      [@ocaml.doc
        "If this array of metric namespaces is present, then these namespaces are the only metric \
         namespaces that are not streamed by this metric stream. In this case, all other metric \
         namespaces in the account are streamed by this metric stream.\n"]
  firehose_arn : amazon_resource_name option;
      [@ocaml.doc
        "The ARN of the Amazon Kinesis Data Firehose delivery stream that is used by this metric \
         stream.\n"]
  role_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the IAM role that is used by this metric stream.\n"]
  state : metric_stream_state option;
      [@ocaml.doc
        "The state of the metric stream. The possible values are [running] and [stopped].\n"]
  creation_date : timestamp option; [@ocaml.doc "The date that the metric stream was created.\n"]
  last_update_date : timestamp option;
      [@ocaml.doc "The date of the most recent update to the metric stream's configuration.\n"]
  output_format : metric_stream_output_format option;
      [@ocaml.doc
        "The output format for the stream. Valid values are [json], [opentelemetry1.0], and \
         [opentelemetry0.7]. For more information about metric stream output formats, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html}Metric \
         streams output formats}.\n"]
  statistics_configurations : metric_stream_statistics_configurations option;
      [@ocaml.doc
        "Each entry in this array displays information about one or more metrics that include \
         additional statistics in the metric stream. For more information about the additional \
         statistics, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html} \
         CloudWatch statistics definitions}. \n"]
  include_linked_accounts_metrics : include_linked_accounts_metrics option;
      [@ocaml.doc
        "If this is [true] and this metric stream is in a monitoring account, then the stream \
         includes metrics from source accounts that the monitoring account is linked to.\n"]
}
[@@ocaml.doc ""]

type nonrec get_metric_stream_input = {
  name : metric_stream_name;
      [@ocaml.doc "The name of the metric stream to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec metric_widget_image = bytes [@@ocaml.doc ""]

type nonrec get_metric_widget_image_output = {
  metric_widget_image : metric_widget_image option;
      [@ocaml.doc
        "The image of the graph, in the output format specified. The output is base64-encoded.\n"]
}
[@@ocaml.doc ""]

type nonrec output_format = string [@@ocaml.doc ""]

type nonrec metric_widget = string [@@ocaml.doc ""]

type nonrec get_metric_widget_image_input = {
  metric_widget : metric_widget;
      [@ocaml.doc
        "A JSON string that defines the bitmap graph to be retrieved. The string includes the \
         metrics to include in the graph, statistics, annotations, title, axis limits, and so on. \
         You can include only one [MetricWidget] parameter in each [GetMetricWidgetImage] call.\n\n\
        \ For more information about the syntax of [MetricWidget] see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metric-Widget-Structure.html}GetMetricWidgetImage: \
         Metric Widget Structure and Syntax}.\n\
        \ \n\
        \  If any metric on the graph could not load all the requested data points, an orange \
         triangle with an exclamation point appears next to the graph legend.\n\
        \  "]
  output_format : output_format option;
      [@ocaml.doc
        "The format of the resulting image. Only PNG images are supported.\n\n\
        \ The default is [png]. If you specify [png], the API returns an HTTP response with the \
         content-type set to [text/xml]. The image data is in a [MetricWidgetImage] field. For \
         example:\n\
        \ \n\
        \   \n\
        \  {[\n\
        \   >\n\
        \  ]}\n\
        \   \n\
        \  \n\
        \    \n\
        \   {[\n\
        \    \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     \n\
        \    {[\n\
        \     \n\
        \    ]}\n\
        \     \n\
        \    \n\
        \      [ iVBORw0KGgoAAAANSUhEUgAAAlgAAAGQEAYAAAAip...] \n\
        \     \n\
        \       [ ] \n\
        \      \n\
        \        [ ] \n\
        \       \n\
        \         \n\
        \        {[\n\
        \         \n\
        \        ]}\n\
        \         \n\
        \        \n\
        \          \n\
        \         {[\n\
        \          6f0d4192-4d42-11e8-82c1-f539a07e0e3b\n\
        \         ]}\n\
        \          \n\
        \         \n\
        \           [ ] \n\
        \          \n\
        \             \n\
        \           \n\
        \            The [image/png] setting is intended only for custom HTTP requests. For most \
         use cases, and all actions using an Amazon Web Services SDK, you should use [png]. If you \
         specify [image/png], the HTTP response has a content-type set to [image/png], and the \
         body of the response is a PNG image.\n\
        \            "]
}
[@@ocaml.doc ""]

type nonrec o_tel_enrichment_status = RUNNING [@ocaml.doc ""] | STOPPED [@ocaml.doc ""]
[@@ocaml.doc "The status of OTel enrichment for the account.\n"]

type nonrec get_o_tel_enrichment_output = {
  status : o_tel_enrichment_status;
      [@ocaml.doc
        "The status of OTel enrichment for the account. Valid values are [Running] (enrichment is \
         enabled) and [Stopped] (enrichment is disabled).\n"]
}
[@@ocaml.doc ""]

type nonrec get_o_tel_enrichment_input = unit [@@ocaml.doc ""]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the CloudWatch resource that you're removing tags from.\n\n\
        \ The ARN format of an alarm is \n\
        \ {[\n\
        \ arn:aws:cloudwatch:{i Region}:{i account-id}:alarm:{i alarm-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a Contributor Insights rule is \n\
        \  {[\n\
        \  arn:aws:cloudwatch:{i Region}:{i account-id}:insight-rule/{i insight-rule-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   The ARN format of a dashboard is \n\
        \   {[\n\
        \   arn:aws:cloudwatch::{i account-id}:dashboard/{i dashboard-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \    The ARN format of a metric stream is \n\
        \    {[\n\
        \    arn:aws:cloudwatch:{i Region}:{i account-id}:metric-stream/{i metric-stream-name} \n\
        \    ]}\n\
        \     \n\
        \    \n\
        \     For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies} \
         Resource Types Defined by Amazon CloudWatch} in the {i Amazon Web Services General \
         Reference}.\n\
        \     "]
  tag_keys : tag_key_list; [@ocaml.doc "The list of tag keys to remove from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the CloudWatch resource that you're adding tags to.\n\n\
        \ The ARN format of an alarm is \n\
        \ {[\n\
        \ arn:aws:cloudwatch:{i Region}:{i account-id}:alarm:{i alarm-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a Contributor Insights rule is \n\
        \  {[\n\
        \  arn:aws:cloudwatch:{i Region}:{i account-id}:insight-rule/{i insight-rule-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   The ARN format of a dashboard is \n\
        \   {[\n\
        \   arn:aws:cloudwatch::{i account-id}:dashboard/{i dashboard-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \    The ARN format of a metric stream is \n\
        \    {[\n\
        \    arn:aws:cloudwatch:{i Region}:{i account-id}:metric-stream/{i metric-stream-name} \n\
        \    ]}\n\
        \     \n\
        \    \n\
        \     For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies} \
         Resource Types Defined by Amazon CloudWatch} in the {i Amazon Web Services General \
         Reference}.\n\
        \     "]
  tags : tag_list; [@ocaml.doc "The list of key-value pairs to associate with the alarm.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_o_tel_enrichment_output = unit [@@ocaml.doc ""]

type nonrec stop_o_tel_enrichment_input = unit [@@ocaml.doc ""]

type nonrec stop_metric_streams_output = unit [@@ocaml.doc ""]

type nonrec metric_stream_names = metric_stream_name list [@@ocaml.doc ""]

type nonrec stop_metric_streams_input = {
  names : metric_stream_names;
      [@ocaml.doc
        "The array of the names of metric streams to stop streaming.\n\n\
        \ This is an \"all or nothing\" operation. If you do not have permission to access all of \
         the metric streams that you list here, then none of the streams that you list in the \
         operation will stop streaming.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec start_o_tel_enrichment_output = unit [@@ocaml.doc ""]

type nonrec start_o_tel_enrichment_input = unit [@@ocaml.doc ""]

type nonrec start_metric_streams_output = unit [@@ocaml.doc ""]

type nonrec start_metric_streams_input = {
  names : metric_stream_names;
      [@ocaml.doc
        "The array of the names of metric streams to start streaming.\n\n\
        \ This is an \"all or nothing\" operation. If you do not have permission to access all of \
         the metric streams that you list here, then none of the streams that you list in the \
         operation will start streaming.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_format_fault = { message : error_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "Data was not syntactically valid JSON.\n"]

type nonrec set_alarm_state_input = {
  alarm_name : alarm_name; [@ocaml.doc "The name of the alarm.\n"]
  state_value : state_value; [@ocaml.doc "The value of the state.\n"]
  state_reason : state_reason;
      [@ocaml.doc "The reason that this alarm is set to this specific state, in text format.\n"]
  state_reason_data : state_reason_data option;
      [@ocaml.doc
        "The reason that this alarm is set to this specific state, in JSON format.\n\n\
        \ For SNS or EC2 alarm actions, this is just informational. But for EC2 Auto Scaling or \
         application Auto Scaling alarm actions, the Auto Scaling policy uses the information in \
         this field to take the correct action.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_metric_stream_output = {
  arn : amazon_resource_name option; [@ocaml.doc "The ARN of the metric stream.\n"]
}
[@@ocaml.doc ""]

type nonrec put_metric_stream_input = {
  name : metric_stream_name;
      [@ocaml.doc
        "If you are creating a new metric stream, this is the name for the new stream. The name \
         must be different than the names of other metric streams in this account and Region.\n\n\
        \ If you are updating a metric stream, specify the name of that stream here.\n\
        \ \n\
        \  Valid characters are A-Z, a-z, 0-9, \"-\" and \"_\".\n\
        \  "]
  include_filters : metric_stream_filters option;
      [@ocaml.doc
        "If you specify this parameter, the stream sends only the metrics from the metric \
         namespaces that you specify here.\n\n\
        \ You cannot include [IncludeFilters] and [ExcludeFilters] in the same operation.\n\
        \ "]
  exclude_filters : metric_stream_filters option;
      [@ocaml.doc
        "If you specify this parameter, the stream sends metrics from all metric namespaces except \
         for the namespaces that you specify here.\n\n\
        \ You cannot include [ExcludeFilters] and [IncludeFilters] in the same operation.\n\
        \ "]
  firehose_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the Amazon Kinesis Data Firehose delivery stream to use for this metric \
         stream. This Amazon Kinesis Data Firehose delivery stream must already exist and must be \
         in the same account as the metric stream.\n"]
  role_arn : amazon_resource_name;
      [@ocaml.doc
        "The ARN of an IAM role that this metric stream will use to access Amazon Kinesis Data \
         Firehose resources. This IAM role must already exist and must be in the same account as \
         the metric stream. This IAM role must include the following permissions:\n\n\
        \ {ul\n\
        \       {-  firehose:PutRecord\n\
        \           \n\
        \            }\n\
        \       {-  firehose:PutRecordBatch\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  output_format : metric_stream_output_format;
      [@ocaml.doc
        "The output format for the stream. Valid values are [json], [opentelemetry1.0], and \
         [opentelemetry0.7]. For more information about metric stream output formats, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html} \
         Metric streams output formats}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the metric stream. You can associate as many \
         as 50 tags with a metric stream.\n\n\
        \ Tags can help you organize and categorize your resources. You can also use them to scope \
         user permissions by granting a user permission to access or change only resources with \
         certain tag values.\n\
        \ \n\
        \  You can use this parameter only when you are creating a new metric stream. If you are \
         using this operation to update an existing metric stream, any tags you specify in this \
         parameter are ignored. To change the tags of an existing metric stream, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}TagResource} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
        \  "]
  statistics_configurations : metric_stream_statistics_configurations option;
      [@ocaml.doc
        "By default, a metric stream always sends the [MAX], [MIN], [SUM], and [SAMPLECOUNT] \
         statistics for each metric that is streamed. You can use this parameter to have the \
         metric stream also send additional statistics in the stream. This array can have up to \
         100 members.\n\n\
        \ For each entry in this array, you specify one or more metrics and the list of additional \
         statistics to stream for those metrics. The additional statistics that you can stream \
         depend on the stream's [OutputFormat]. If the [OutputFormat] is [json], you can stream \
         any additional statistic that is supported by CloudWatch, listed in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html} \
         CloudWatch statistics definitions}. If the [OutputFormat] is [opentelemetry1.0] or \
         [opentelemetry0.7], you can stream percentile statistics such as p95, p99.9, and so on.\n\
        \ "]
  include_linked_accounts_metrics : include_linked_accounts_metrics option;
      [@ocaml.doc
        "If you are creating a metric stream in a monitoring account, specify [true] to include \
         metrics from source accounts in the metric stream.\n"]
}
[@@ocaml.doc ""]

type nonrec strict_entity_validation = bool [@@ocaml.doc ""]

type nonrec put_metric_data_input = {
  namespace : namespace;
      [@ocaml.doc
        "The namespace for the metric data. You can use ASCII characters for the namespace, except \
         for control characters which are not supported.\n\n\
        \ To avoid conflicts with Amazon Web Services service namespaces, you should not specify a \
         namespace that begins with [AWS/] \n\
        \ "]
  metric_data : metric_data option;
      [@ocaml.doc
        "The data for the metrics. Use this parameter if your metrics do not contain associated \
         entities. The array can include no more than 1000 metrics per call.\n\n\
        \ The limit of metrics allowed, 1000, is the sum of both [EntityMetricData] and \
         [MetricData] metrics.\n\
        \ "]
  entity_metric_data : entity_metric_data_list option;
      [@ocaml.doc
        "Data for metrics that contain associated entity information. You can include up to two \
         [EntityMetricData] objects, each of which can contain a single [Entity] and associated \
         metrics.\n\n\
        \ The limit of metrics allowed, 1000, is the sum of both [EntityMetricData] and \
         [MetricData] metrics.\n\
        \ "]
  strict_entity_validation : strict_entity_validation option;
      [@ocaml.doc
        "Whether to accept valid metric data when an invalid entity is sent.\n\n\
        \ {ul\n\
        \       {-  When set to [true]: Any validation error (for entity or metric data) will fail \
         the entire request, and no data will be ingested. The failed operation will return a 400 \
         result with the error.\n\
        \           \n\
        \            }\n\
        \       {-  When set to [false]: Validation errors in the entity will not associate the \
         metric with the entity, but the metric data will still be accepted and ingested. \
         Validation errors in the metric data will fail the entire request, and no data will be \
         ingested.\n\
        \           \n\
        \            In the case of an invalid entity, the operation will return a [200] status, \
         but an additional response header will contain information about the validation errors. \
         The new header, [X-Amzn-Failure-Message] is an enumeration of the following values:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [InvalidEntity] - The provided entity is invalid.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [InvalidKeyAttributes] - The provided [KeyAttributes] of an \
         entity is invalid.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [InvalidAttributes] - The provided [Attributes] of an entity is \
         invalid.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [InvalidTypeValue] - The provided [Type] in the [KeyAttributes] \
         of an entity is invalid.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [EntitySizeTooLarge] - The number of [EntityMetricData] objects \
         allowed is 2.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [MissingRequiredFields] - There are missing required fields in \
         the [KeyAttributes] for the provided [Type].\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         For details of the requirements for specifying an entity, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html}How \
         to add related information to telemetry} in the {i CloudWatch User Guide}.\n\
        \         \n\
        \          }\n\
        \       }\n\
        \   This parameter is {i required} when [EntityMetricData] is included.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_fault = { message : error_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The quota for alarms for this customer has already been reached.\n"]

type nonrec put_metric_alarm_input = {
  alarm_name : alarm_name;
      [@ocaml.doc
        "The name for the alarm. This name must be unique within the Region.\n\n\
        \ The name must contain only UTF-8 characters, and can't contain ASCII control characters\n\
        \ "]
  alarm_description : alarm_description option; [@ocaml.doc "The description for the alarm.\n"]
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state. The \
         default is [TRUE].\n"]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to an [OK] state from any other state. \
         Each action is specified as an Amazon Resource Name (ARN). Valid values:\n\n\
        \  {b EC2 actions:} \n\
        \ \n\
        \  {ul\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:stop\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:terminate\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:reboot\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:recover\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Stop/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Terminate/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Reboot/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Recover/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b Autoscaling action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:autoscaling:{i region}:{i account-id}:scalingPolicy:{i \
         policy-id}:autoScalingGroupName/{i group-friendly-name}:policyName/{i \
         policy-friendly-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Lambda actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-  Invoke the latest version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a specific version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a function by using an alias Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SNS notification action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SSM integration actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm:{i region}:{i account-id}:opsitem:{i severity}#CATEGORY={i \
         category-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm-incidents::{i account-id}:responseplan/{i response-plan-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [ALARM] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN). Valid values:\n\n\
        \  {b EC2 actions:} \n\
        \ \n\
        \  {ul\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:stop\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:terminate\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:reboot\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:recover\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Stop/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Terminate/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Reboot/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Recover/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b Autoscaling action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:autoscaling:{i region}:{i account-id}:scalingPolicy:{i \
         policy-id}:autoScalingGroupName/{i group-friendly-name}:policyName/{i \
         policy-friendly-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Lambda actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-  Invoke the latest version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a specific version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a function by using an alias Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SNS notification action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SSM integration actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm:{i region}:{i account-id}:opsitem:{i severity}#CATEGORY={i \
         category-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm-incidents::{i account-id}:responseplan/{i response-plan-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Start a Amazon Q Developer operational investigation} \n\
        \   \n\
        \     \n\
        \    {[\n\
        \    arn:aws:aiops:{i region}:{i account-id}:investigation-group:{i investigation-group-id} \n\
        \    ]}\n\
        \     \n\
        \    "]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [INSUFFICIENT_DATA] state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN). Valid \
         values:\n\n\
        \  {b EC2 actions:} \n\
        \ \n\
        \  {ul\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:stop\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:terminate\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:reboot\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:automate:{i region}:ec2:recover\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Stop/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Terminate/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Reboot/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            arn:aws:swf:{i region}:{i \
         account-id}:action/actions/AWS_EC2.InstanceId.Recover/1.0\n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b Autoscaling action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:autoscaling:{i region}:{i account-id}:scalingPolicy:{i \
         policy-id}:autoScalingGroupName/{i group-friendly-name}:policyName/{i \
         policy-friendly-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Lambda actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-  Invoke the latest version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a specific version of a Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-  Invoke a function by using an alias Lambda function: \n\
        \              {[\n\
        \              arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SNS notification action:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b SSM integration actions:} \n\
        \   \n\
        \    {ul\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm:{i region}:{i account-id}:opsitem:{i severity}#CATEGORY={i \
         category-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          {-   \n\
        \              {[\n\
        \              arn:aws:ssm-incidents::{i account-id}:responseplan/{i response-plan-name} \n\
        \              ]}\n\
        \               \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  metric_name : metric_name option;
      [@ocaml.doc
        "The name for the metric associated with the alarm. For each [PutMetricAlarm] operation, \
         you must specify either [MetricName], a [Metrics] array, or an [EvaluationCriteria].\n\n\
        \ If you are creating an alarm based on a math expression, you cannot specify this \
         parameter, or any of the [Namespace], [Dimensions], [Period], [Unit], [Statistic], or \
         [ExtendedStatistic] parameters. Instead, you specify all this information in the \
         [Metrics] array.\n\
        \ "]
  namespace : namespace option;
      [@ocaml.doc "The namespace for the metric associated specified in [MetricName].\n"]
  statistic : statistic option;
      [@ocaml.doc
        "The statistic for the metric specified in [MetricName], other than percentile. For \
         percentile statistics, use [ExtendedStatistic]. When you call [PutMetricAlarm] and \
         specify a [MetricName], you must specify either [Statistic] or [ExtendedStatistic,] but \
         not both.\n"]
  extended_statistic : extended_statistic option;
      [@ocaml.doc
        "The extended statistic for the metric specified in [MetricName]. When you call \
         [PutMetricAlarm] and specify a [MetricName], you must specify either [Statistic] or \
         [ExtendedStatistic] but not both.\n\n\
        \ If you specify [ExtendedStatistic], the following are valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [p90] \n\
        \            \n\
        \             }\n\
        \        {-   [tm90] \n\
        \            \n\
        \             }\n\
        \        {-   [tc90] \n\
        \            \n\
        \             }\n\
        \        {-   [ts90] \n\
        \            \n\
        \             }\n\
        \        {-   [wm90] \n\
        \            \n\
        \             }\n\
        \        {-   [IQM] \n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            PR({i n}:{i m})\n\
        \            ]}\n\
        \             where n and m are values of the metric\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            TC({i X}%:{i X}%)\n\
        \            ]}\n\
        \             where X is between 10 and 90 inclusive.\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            TM({i X}%:{i X}%)\n\
        \            ]}\n\
        \             where X is between 10 and 90 inclusive.\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            TS({i X}%:{i X}%)\n\
        \            ]}\n\
        \             where X is between 10 and 90 inclusive.\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            WM({i X}%:{i X}%)\n\
        \            ]}\n\
        \             where X is between 10 and 90 inclusive.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about these extended statistics, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html}CloudWatch \
         statistics definitions}.\n\
        \   "]
  dimensions : dimensions option;
      [@ocaml.doc "The dimensions for the metric specified in [MetricName].\n"]
  period : period option;
      [@ocaml.doc
        "The length, in seconds, used each time the metric specified in [MetricName] is evaluated. \
         Valid values are 10, 20, 30, and any multiple of 60.\n\n\
        \  [Period] is required for alarms based on static thresholds. If you are creating an \
         alarm based on a metric math expression, you specify the period for each metric within \
         the objects in the [Metrics] array.\n\
        \ \n\
        \  Be sure to specify 10, 20, or 30 only for metrics that are stored by a [PutMetricData] \
         call with a [StorageResolution] of 1. If you specify a period of 10, 20, or 30 for a \
         metric that does not have sub-minute resolution, the alarm still attempts to gather data \
         at the period rate that you specify. In this case, it does not receive data for the \
         attempts that do not correspond to a one-minute data resolution, and the alarm might \
         often lapse into INSUFFICENT_DATA status. Specifying 10, 20, or 30 also sets this alarm \
         as a high-resolution alarm, which has a higher charge than other alarms. For more \
         information about pricing, see {{:https://aws.amazon.com/cloudwatch/pricing/}Amazon \
         CloudWatch Pricing}.\n\
        \  \n\
        \   An alarm's total current evaluation period can be no longer than seven days, so \
         [Period] multiplied by [EvaluationPeriods] can't be more than 604,800 seconds. For alarms \
         with a period of less than one hour (3,600 seconds), the total evaluation period can't be \
         longer than one day (86,400 seconds).\n\
        \   "]
  unit_ : standard_unit option;
      [@ocaml.doc
        "The unit of measure for the statistic. For example, the units for the Amazon EC2 \
         NetworkIn metric are Bytes because NetworkIn tracks the number of bytes that an instance \
         receives on all network interfaces. You can also specify a unit when you create a custom \
         metric. Units help provide conceptual meaning to your data. Metric data points that \
         specify a unit of measure, such as Percent, are aggregated separately. If you are \
         creating an alarm based on a metric math expression, you can specify the unit for each \
         metric (if needed) within the objects in the [Metrics] array.\n\n\
        \ If you don't specify [Unit], CloudWatch retrieves all unit types that have been \
         published for the metric and attempts to evaluate the alarm. Usually, metrics are \
         published with only one unit, so the alarm works as intended.\n\
        \ \n\
        \  However, if the metric is published with multiple types of units and you don't specify \
         a unit, the alarm's behavior is not defined and it behaves unpredictably.\n\
        \  \n\
        \   We recommend omitting [Unit] so that you don't inadvertently specify an incorrect unit \
         that is not published for this metric. Doing so causes the alarm to be stuck in the \
         [INSUFFICIENT DATA] state.\n\
        \   "]
  evaluation_periods : evaluation_periods option;
      [@ocaml.doc
        "The number of periods over which data is compared to the specified threshold. If you are \
         setting an alarm that requires that a number of consecutive data points be breaching to \
         trigger the alarm, this value specifies that number. If you are setting an \"M out of N\" \
         alarm, this value is the N.\n"]
  datapoints_to_alarm : datapoints_to_alarm option;
      [@ocaml.doc
        "The number of data points that must be breaching to trigger the alarm. This is used only \
         if you are setting an \"M out of N\" alarm. In that case, this value is the M. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation}Evaluating \
         an Alarm} in the {i Amazon CloudWatch User Guide}.\n"]
  threshold : threshold option;
      [@ocaml.doc
        "The value against which the specified statistic is compared.\n\n\
        \ This parameter is required for alarms based on static thresholds, but should not be used \
         for alarms based on anomaly detection models.\n\
        \ "]
  comparison_operator : comparison_operator option;
      [@ocaml.doc
        " The arithmetic operation to use when comparing the specified statistic and threshold. \
         The specified statistic value is used as the first operand.\n\n\
        \ The values [LessThanLowerOrGreaterThanUpperThreshold], [LessThanLowerThreshold], and \
         [GreaterThanUpperThreshold] are used only for alarms based on anomaly detection models.\n\
        \ "]
  treat_missing_data : treat_missing_data option;
      [@ocaml.doc
        " Sets how this alarm is to handle missing data points. If [TreatMissingData] is omitted, \
         the default behavior of [missing] is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data}Configuring \
         How CloudWatch Alarms Treats Missing Data}.\n\n\
        \ Valid Values: [breaching | notBreaching | ignore | missing] \n\
        \ \n\
        \   Alarms that evaluate metrics in the [AWS/DynamoDB] namespace always [ignore] missing \
         data even if you choose a different option for [TreatMissingData]. When an [AWS/DynamoDB] \
         metric has missing data, alarms that evaluate that metric remain in their current state.\n\
        \   \n\
        \      This parameter is not applicable to PromQL alarms.\n\
        \      \n\
        \       "]
  evaluate_low_sample_count_percentile : evaluate_low_sample_count_percentile option;
      [@ocaml.doc
        " Used only for alarms based on percentiles. If you specify [ignore], the alarm state does \
         not change during periods with too few data points to be statistically significant. If \
         you specify [evaluate] or omit this parameter, the alarm is always evaluated and possibly \
         changes state no matter how many data points are available. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#percentiles-with-low-samples}Percentile-Based \
         CloudWatch Alarms and Low Data Samples}.\n\n\
        \ Valid Values: [evaluate | ignore] \n\
        \ "]
  metrics : metric_data_queries option;
      [@ocaml.doc
        "An array of [MetricDataQuery] structures that enable you to create an alarm based on the \
         result of a metric math expression. For each [PutMetricAlarm] operation, you must specify \
         either [MetricName], a [Metrics] array, or an [EvaluationCriteria].\n\n\
        \ Each item in the [Metrics] array either retrieves a metric or performs a math expression.\n\
        \ \n\
        \  One item in the [Metrics] array is the expression that the alarm watches. You designate \
         this expression by setting [ReturnData] to true for this object in the array. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDataQuery.html}MetricDataQuery}.\n\
        \  \n\
        \   If you use the [Metrics] parameter, you cannot include the [Namespace], [MetricName], \
         [Dimensions], [Period], [Unit], [Statistic], or [ExtendedStatistic] parameters of \
         [PutMetricAlarm] in the same operation. Instead, you retrieve the metrics you are using \
         in your math expression as part of the [Metrics] array.\n\
        \   "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the alarm. You can associate as many as 50 \
         tags with an alarm. To be able to associate tags with the alarm when you create the \
         alarm, you must have the [cloudwatch:TagResource] permission.\n\n\
        \ Tags can help you organize and categorize your resources. You can also use them to scope \
         user permissions by granting a user permission to access or change only resources with \
         certain tag values.\n\
        \ \n\
        \  If you are using this operation to update an existing alarm, any tags you specify in \
         this parameter are ignored. To change the tags of an existing alarm, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}TagResource} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
        \  \n\
        \   To use this field to set tags for an alarm when you create it, you must be signed on \
         with both the [cloudwatch:PutMetricAlarm] and [cloudwatch:TagResource] permissions.\n\
        \   "]
  threshold_metric_id : metric_id option;
      [@ocaml.doc
        "If this is an alarm based on an anomaly detection model, make this value match the ID of \
         the [ANOMALY_DETECTION_BAND] function.\n\n\
        \ For an example of how to use this parameter, see the {b Anomaly Detection Model Alarm} \
         example on this page.\n\
        \ \n\
        \  If your alarm uses this parameter, it cannot have Auto Scaling actions.\n\
        \  "]
  evaluation_window : evaluation_window option;
      [@ocaml.doc
        "The evaluation window that the alarm uses to select the range of metric data that it \
         evaluates. Specify either a sliding window or a wall clock window. If you omit this \
         parameter, the alarm uses a sliding window.\n\n\
        \ A sliding window advances each time the alarm is evaluated, forming a rolling time \
         window. A wall clock window aligns the evaluated range to fixed clock boundaries, such as \
         the top of the hour or the start of the day.\n\
        \ \n\
        \  You can use [EvaluationWindow] with any type of metric alarm except alarms that are \
         based on a PromQL query.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-evaluation-window.html}Alarm \
         evaluation windows} in the {i CloudWatch User Guide}.\n\
        \   "]
  evaluation_criteria : evaluation_criteria option;
      [@ocaml.doc
        "The evaluation criteria for the alarm. For each [PutMetricAlarm] operation, you must \
         specify either [MetricName], a [Metrics] array, or an [EvaluationCriteria].\n\n\
        \ If you use the [EvaluationCriteria] parameter, you cannot include the [Namespace], \
         [MetricName], [Dimensions], [Period], [Unit], [Statistic], [ExtendedStatistic], \
         [Metrics], [Threshold], [ComparisonOperator], [ThresholdMetricId], [EvaluationPeriods], \
         or [DatapointsToAlarm] parameters of [PutMetricAlarm] in the same operation. Instead, all \
         evaluation parameters are defined within this structure.\n\
        \ \n\
        \  For an example of how to use this parameter, see the {b PromQL alarm} example on this \
         page.\n\
        \  "]
  evaluation_interval : evaluation_interval option;
      [@ocaml.doc
        "The frequency, in seconds, at which the alarm is evaluated. Valid values are 10, 20, 30, \
         and any multiple of 60.\n\n\
        \ This parameter is required for alarms that use [EvaluationCriteria], and cannot be \
         specified for alarms configured with [MetricName] or [Metrics].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_managed_insight_rules_output = {
  failures : batch_failures option;
      [@ocaml.doc " An array that lists the rules that could not be enabled. \n"]
}
[@@ocaml.doc ""]

type nonrec template_name = string [@@ocaml.doc ""]

type nonrec managed_rule = {
  template_name : template_name;
      [@ocaml.doc
        " The template name for the managed Contributor Insights rule, as returned by \
         [ListManagedInsightRules]. \n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        " The ARN of an Amazon Web Services resource that has managed Contributor Insights rules. \n"]
  tags : tag_list option;
      [@ocaml.doc
        " A list of key-value pairs that you can associate with a managed Contributor Insights \
         rule. You can associate as many as 50 tags with a rule. Tags can help you organize and \
         categorize your resources. You also can use them to scope user permissions by granting a \
         user permission to access or change only the resources that have certain tag values. To \
         associate tags with a rule, you must have the [cloudwatch:TagResource] permission in \
         addition to the [cloudwatch:PutInsightRule] permission. If you are using this operation \
         to update an existing Contributor Insights rule, any tags that you specify in this \
         parameter are ignored. To change the tags of an existing rule, use [TagResource]. \n"]
}
[@@ocaml.doc
  " Contains the information that's required to enable a managed Contributor Insights rule for an \
   Amazon Web Services resource. \n"]

type nonrec managed_rules = managed_rule list [@@ocaml.doc ""]

type nonrec put_managed_insight_rules_input = {
  managed_rules : managed_rules; [@ocaml.doc " A list of [ManagedRules] to enable. \n"]
}
[@@ocaml.doc ""]

type nonrec put_log_alarm_input = {
  alarm_name : alarm_name;
      [@ocaml.doc
        "The name for the alarm. This name must be unique within the Amazon Web Services account \
         and Region.\n"]
  alarm_description : alarm_description option; [@ocaml.doc "The description for the alarm.\n"]
  scheduled_query_configuration : scheduled_query_configuration;
      [@ocaml.doc
        "The configuration of the underlying CloudWatch Logs scheduled query that this alarm \
         evaluates, including the query string, log groups, schedule, and aggregation expression.\n"]
  action_log_line_count : action_log_line_count option;
      [@ocaml.doc
        "The number of log lines from the most recent scheduled query execution to include in \
         alarm action notifications. Valid range is 0 through 50. The default is 0, which means no \
         log lines are included.\n"]
  action_log_line_role_arn : action_log_line_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudWatch assumes to retrieve log \
         events for inclusion in alarm action notifications. Required when [ActionLogLineCount] is \
         greater than 0.\n"]
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state. The \
         default is [true].\n"]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [OK] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values:\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [ALARM] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values:\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b Systems Manager actions:} \n\
        \   \n\
        \     \n\
        \    {[\n\
        \    arn:aws:ssm:{i region}:{i account-id}:opsitem:{i severity} \n\
        \    ]}\n\
        \     \n\
        \    "]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [INSUFFICIENT_DATA] state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values:\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  query_results_to_evaluate : query_results_to_evaluate;
      [@ocaml.doc
        "The number of most recent scheduled query results to evaluate against the threshold (the \
         N in M-of-N evaluation). Valid range is 1 through 100.\n"]
  query_results_to_alarm : query_results_to_alarm;
      [@ocaml.doc
        "The number of query results, out of the most recent [QueryResultsToEvaluate] results, \
         that must breach the threshold to trigger the alarm to transition to [ALARM] (the M in \
         M-of-N evaluation). Must be less than or equal to [QueryResultsToEvaluate].\n"]
  threshold : threshold; [@ocaml.doc "The value to compare with the aggregated query result.\n"]
  comparison_operator : comparison_operator;
      [@ocaml.doc
        "The arithmetic operation to use when comparing the aggregated query result and the \
         threshold. The aggregated query result is used as the first operand. Valid values are \
         [GreaterThanThreshold], [GreaterThanOrEqualToThreshold], [LessThanThreshold], and \
         [LessThanOrEqualToThreshold].\n"]
  treat_missing_data : treat_missing_data option;
      [@ocaml.doc
        "Sets how this alarm is to handle missing data points. Valid values are [breaching], \
         [notBreaching], [ignore], and [missing]. If this parameter is omitted, the default \
         behavior of [missing] is used.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the alarm. You can use tags to categorize and \
         manage your alarms.\n"]
}
[@@ocaml.doc ""]

type nonrec put_insight_rule_output = unit [@@ocaml.doc ""]

type nonrec put_insight_rule_input = {
  rule_name : insight_rule_name; [@ocaml.doc "A unique name for the rule.\n"]
  rule_state : insight_rule_state option;
      [@ocaml.doc "The state of the rule. Valid values are ENABLED and DISABLED.\n"]
  rule_definition : insight_rule_definition;
      [@ocaml.doc
        "The definition of the rule, as a JSON object. For details on the valid syntax, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html}Contributor \
         Insights Rule Syntax}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the Contributor Insights rule. You can \
         associate as many as 50 tags with a rule.\n\n\
        \ Tags can help you organize and categorize your resources. You can also use them to scope \
         user permissions, by granting a user permission to access or change only the resources \
         that have certain tag values.\n\
        \ \n\
        \  To be able to associate tags with a rule, you must have the [cloudwatch:TagResource] \
         permission in addition to the [cloudwatch:PutInsightRule] permission.\n\
        \  \n\
        \   If you are using this operation to update an existing Contributor Insights rule, any \
         tags you specify in this parameter are ignored. To change the tags of an existing rule, \
         use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}TagResource}.\n\
        \   "]
  apply_on_transformed_logs : insight_rule_on_transformed_logs option;
      [@ocaml.doc
        "Specify [true] to have this rule evaluate log events after they have been transformed by \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html}Log \
         transformation}. If you specify [true], then the log events in log groups that have \
         transformers will be evaluated by Contributor Insights after being transformed. Log \
         groups that don't have transformers will still have their original log events evaluated \
         by Contributor Insights.\n\n\
        \ The default is [false] \n\
        \ \n\
        \   If a log group has a transformer, and transformation fails for some log events, those \
         log events won't be evaluated by Contributor Insights. For information about \
         investigating log transformation failures, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Transformation-Errors-Metrics.html}Transformation \
         metrics and errors}.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec put_dashboard_output = {
  dashboard_validation_messages : dashboard_validation_messages option;
      [@ocaml.doc
        "If the input for [PutDashboard] was correct and the dashboard was successfully created or \
         modified, this result is empty.\n\n\
        \ If this result includes only warning messages, then the input was valid enough for the \
         dashboard to be created or modified, but some elements of the dashboard might not render.\n\
        \ \n\
        \  If this result includes error messages, the input was not valid and the operation failed.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec put_dashboard_input = {
  dashboard_name : dashboard_name;
      [@ocaml.doc
        "The name of the dashboard. If a dashboard with this name already exists, this call \
         modifies that dashboard, replacing its current contents. Otherwise, a new dashboard is \
         created. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, \"-\", and \
         \"_\". This parameter is required.\n"]
  dashboard_body : dashboard_body;
      [@ocaml.doc
        "The detailed information about the dashboard in JSON format, including the widgets to \
         include and their location on the dashboard. This parameter is required.\n\n\
        \ For more information about the syntax, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Dashboard-Body-Structure.html}Dashboard \
         Body Structure and Syntax}.\n\
        \ "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the dashboard. You can associate as many as \
         50 tags with a dashboard.\n\n\
        \ Tags can help you organize and categorize your dashboards. You can also use them to \
         scope user permissions by granting a user permission to access or change only dashboards \
         with certain tag values.\n\
        \ \n\
        \  You can use this parameter only when creating a new dashboard. If you specify [Tags] \
         when updating an existing dashboard, the tag updates are ignored. To add or update tags \
         on an existing dashboard, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}TagResource}. \
         To remove tags, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec put_composite_alarm_input = {
  actions_enabled : actions_enabled option;
      [@ocaml.doc
        "Indicates whether actions should be executed during any changes to the alarm state of the \
         composite alarm. The default is [TRUE].\n"]
  alarm_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [ALARM] state from any other \
         state. Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values: \\]\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b Systems Manager actions:} \n\
        \   \n\
        \     \n\
        \    {[\n\
        \    arn:aws:ssm:{i region}:{i account-id}:opsitem:{i severity} \n\
        \    ]}\n\
        \     \n\
        \    \n\
        \      {b Start a Amazon Q Developer operational investigation} \n\
        \     \n\
        \       \n\
        \      {[\n\
        \      arn:aws:aiops:{i region}:{i account-id}:investigation-group:{i \
         investigation-group-id} \n\
        \      ]}\n\
        \       \n\
        \      "]
  alarm_description : alarm_description option;
      [@ocaml.doc "The description for the composite alarm.\n"]
  alarm_name : alarm_name;
      [@ocaml.doc "The name for the composite alarm. This name must be unique within the Region.\n"]
  alarm_rule : alarm_rule;
      [@ocaml.doc
        "An expression that specifies which other alarms are to be evaluated to determine this \
         composite alarm's state. For each alarm that you reference, you designate a function that \
         specifies whether that alarm needs to be in ALARM state, OK state, or INSUFFICIENT_DATA \
         state. You can use operators (AND, OR and NOT) to combine multiple functions in a single \
         expression. You can use parenthesis to logically group the functions in your expression.\n\n\
        \ You can use either alarm names or ARNs to reference the other alarms that are to be \
         evaluated.\n\
        \ \n\
        \  Functions can include the following:\n\
        \  \n\
        \   {ul\n\
        \         {-   \n\
        \             {[\n\
        \             ALARM(\"{i alarm-name} or {i alarm-ARN}\")\n\
        \             ]}\n\
        \              is TRUE if the named alarm is in ALARM state.\n\
        \             \n\
        \              }\n\
        \         {-   \n\
        \             {[\n\
        \             OK(\"{i alarm-name} or {i alarm-ARN}\")\n\
        \             ]}\n\
        \              is TRUE if the named alarm is in OK state.\n\
        \             \n\
        \              }\n\
        \         {-   \n\
        \             {[\n\
        \             INSUFFICIENT_DATA(\"{i alarm-name} or {i alarm-ARN}\")\n\
        \             ]}\n\
        \              is TRUE if the named alarm is in INSUFFICIENT_DATA state.\n\
        \             \n\
        \              }\n\
        \         {-   [TRUE] always evaluates to TRUE.\n\
        \             \n\
        \              }\n\
        \         {-   [FALSE] always evaluates to FALSE.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   TRUE and FALSE are useful for testing a complex [AlarmRule] structure, and for testing \
         your alarm actions.\n\
        \   \n\
        \    Alarm names specified in [AlarmRule] can be surrounded with double-quotes (\"), but \
         do not have to be.\n\
        \    \n\
        \     The following are some examples of [AlarmRule]:\n\
        \     \n\
        \      {ul\n\
        \            {-   [ALARM(CPUUtilizationTooHigh) AND ALARM(DiskReadOpsTooHigh)] specifies \
         that the composite alarm goes into ALARM state only if both CPUUtilizationTooHigh and \
         DiskReadOpsTooHigh alarms are in ALARM state.\n\
        \                \n\
        \                 }\n\
        \            {-   [ALARM(CPUUtilizationTooHigh) AND NOT ALARM(DeploymentInProgress)] \
         specifies that the alarm goes to ALARM state if CPUUtilizationTooHigh is in ALARM state \
         and DeploymentInProgress is not in ALARM state. This example reduces alarm noise during a \
         known deployment window.\n\
        \                \n\
        \                 }\n\
        \            {-   [(ALARM(CPUUtilizationTooHigh) OR ALARM(DiskReadOpsTooHigh)) AND\n\
        \                        OK(NetworkOutTooHigh)] goes into ALARM state if \
         CPUUtilizationTooHigh OR DiskReadOpsTooHigh is in ALARM state, and if NetworkOutTooHigh \
         is in OK state. This provides another example of using a composite alarm to prevent \
         noise. This rule ensures that you are not notified with an alarm action on high CPU or \
         disk usage if a known network problem is also occurring.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   The [AlarmRule] can specify as many as 100 \"children\" alarms. The [AlarmRule] \
         expression can have as many as 500 elements. Elements are child alarms, TRUE or FALSE \
         statements, and parentheses.\n\
        \   "]
  insufficient_data_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to the [INSUFFICIENT_DATA] state from \
         any other state. Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values: \\]\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  ok_actions : resource_list option;
      [@ocaml.doc
        "The actions to execute when this alarm transitions to an [OK] state from any other state. \
         Each action is specified as an Amazon Resource Name (ARN).\n\n\
        \ Valid Values: \\]\n\
        \ \n\
        \   {b Amazon SNS actions:} \n\
        \  \n\
        \    \n\
        \   {[\n\
        \   arn:aws:sns:{i region}:{i account-id}:{i sns-topic-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \     {b Lambda actions:} \n\
        \    \n\
        \     {ul\n\
        \           {-  Invoke the latest version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a specific version of a Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         version-number} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-  Invoke a function by using an alias Lambda function: \n\
        \               {[\n\
        \               arn:aws:lambda:{i region}:{i account-id}:function:{i function-name}:{i \
         alias-name} \n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the alarm. You can associate as many as 50 \
         tags with an alarm. To be able to associate tags with the alarm when you create the \
         alarm, you must have the [cloudwatch:TagResource] permission.\n\n\
        \ Tags can help you organize and categorize your resources. You can also use them to scope \
         user permissions by granting a user permission to access or change only resources with \
         certain tag values.\n\
        \ \n\
        \  If you are using this operation to update an existing alarm, any tags you specify in \
         this parameter are ignored. To change the tags of an existing alarm, use \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}TagResource} \
         or \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
        \  "]
  actions_suppressor : alarm_arn option;
      [@ocaml.doc
        " Actions will be suppressed if the suppressor alarm is in the [ALARM] state. \
         [ActionsSuppressor] can be an AlarmName or an Amazon Resource Name (ARN) from an existing \
         alarm. \n"]
  actions_suppressor_wait_period : suppressor_period option;
      [@ocaml.doc
        " The maximum time in seconds that the composite alarm waits for the suppressor alarm to \
         go into the [ALARM] state. After this time, the composite alarm performs its actions. \n\n\
        \   [WaitPeriod] is required only when [ActionsSuppressor] is specified. \n\
        \  \n\
        \   "]
  actions_suppressor_extension_period : suppressor_period option;
      [@ocaml.doc
        " The maximum time in seconds that the composite alarm waits after suppressor alarm goes \
         out of the [ALARM] state. After this time, the composite alarm performs its actions. \n\n\
        \   [ExtensionPeriod] is required only when [ActionsSuppressor] is specified. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_anomaly_detector_output = unit [@@ocaml.doc ""]

type nonrec put_anomaly_detector_input = {
  namespace : namespace option;
      [@ocaml.doc "The namespace of the metric to create the anomaly detection model for.\n"]
  metric_name : metric_name option;
      [@ocaml.doc "The name of the metric to create the anomaly detection model for.\n"]
  dimensions : dimensions option;
      [@ocaml.doc "The metric dimensions to create the anomaly detection model for.\n"]
  stat : anomaly_detector_metric_stat option;
      [@ocaml.doc "The statistic to use for the metric and the anomaly detection model.\n"]
  configuration : anomaly_detector_configuration option;
      [@ocaml.doc
        "The configuration specifies details about how the anomaly detection model is to be \
         trained, including time ranges to exclude when training and updating the model. You can \
         specify as many as 10 time ranges.\n\n\
        \ The configuration can also include the time zone to use for the metric.\n\
        \ "]
  metric_characteristics : metric_characteristics option;
      [@ocaml.doc
        "Use this object to include parameters to provide information about your metric to \
         CloudWatch to help it build more accurate anomaly detection models. Currently, it \
         includes the [PeriodicSpikes] parameter.\n"]
  single_metric_anomaly_detector : single_metric_anomaly_detector option;
      [@ocaml.doc
        "A single metric anomaly detector to be created.\n\n\
        \ When using [SingleMetricAnomalyDetector], you cannot include the following parameters in \
         the same operation:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Dimensions] \n\
        \            \n\
        \             }\n\
        \        {-   [MetricName] \n\
        \            \n\
        \             }\n\
        \        {-   [Namespace] \n\
        \            \n\
        \             }\n\
        \        {-   [Stat] \n\
        \            \n\
        \             }\n\
        \        {-  the [MetricMathAnomalyDetector] parameters of [PutAnomalyDetectorInput] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Instead, specify the single metric anomaly detector attributes as part of the property \
         [SingleMetricAnomalyDetector].\n\
        \   "]
  metric_math_anomaly_detector : metric_math_anomaly_detector option;
      [@ocaml.doc
        "The metric math anomaly detector to be created.\n\n\
        \ When using [MetricMathAnomalyDetector], you cannot include the following parameters in \
         the same operation:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Dimensions] \n\
        \            \n\
        \             }\n\
        \        {-   [MetricName] \n\
        \            \n\
        \             }\n\
        \        {-   [Namespace] \n\
        \            \n\
        \             }\n\
        \        {-   [Stat] \n\
        \            \n\
        \             }\n\
        \        {-  the [SingleMetricAnomalyDetector] parameters of [PutAnomalyDetectorInput] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Instead, specify the metric math anomaly detector attributes as part of the property \
         [MetricMathAnomalyDetector].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_alarm_mute_rule_input = {
  name : name;
      [@ocaml.doc
        "The name of the alarm mute rule. This name must be unique within your Amazon Web Services \
         account and region.\n"]
  description : alarm_description option;
      [@ocaml.doc "A description of the alarm mute rule that helps you identify its purpose.\n"]
  rule : rule;
      [@ocaml.doc "The configuration that defines when and how long alarms should be muted.\n"]
  mute_targets : mute_targets option; [@ocaml.doc "Specifies which alarms this rule applies to.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs to associate with the alarm mute rule. You can use tags to \
         categorize and manage your mute rules.\n"]
  start_date : timestamp option;
      [@ocaml.doc
        "The date and time after which the mute rule takes effect, specified as a timestamp in ISO \
         8601 format (for example, [2026-04-15T08:00:00Z]). If not specified, the mute rule takes \
         effect immediately upon creation and the mutes are applied as per the schedule expression.\n"]
  expire_date : timestamp option;
      [@ocaml.doc
        "The date and time when the mute rule expires and is no longer evaluated, specified as a \
         timestamp in ISO 8601 format (for example, [2026-12-31T23:59:59Z]). After this time, the \
         rule status becomes EXPIRED and will no longer mute the targeted alarms.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_list option;
      [@ocaml.doc "The list of tag keys and values associated with the resource you specified.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the CloudWatch resource that you want to view tags for.\n\n\
        \ The ARN format of an alarm is \n\
        \ {[\n\
        \ arn:aws:cloudwatch:{i Region}:{i account-id}:alarm:{i alarm-name} \n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The ARN format of a Contributor Insights rule is \n\
        \  {[\n\
        \  arn:aws:cloudwatch:{i Region}:{i account-id}:insight-rule/{i insight-rule-name} \n\
        \  ]}\n\
        \   \n\
        \  \n\
        \   The ARN format of a dashboard is \n\
        \   {[\n\
        \   arn:aws:cloudwatch::{i account-id}:dashboard/{i dashboard-name} \n\
        \   ]}\n\
        \    \n\
        \   \n\
        \    The ARN format of a metric stream is \n\
        \    {[\n\
        \    arn:aws:cloudwatch:{i Region}:{i account-id}:metric-stream/{i metric-stream-name} \n\
        \    ]}\n\
        \     \n\
        \    \n\
        \     For more information about ARN format, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies} \
         Resource Types Defined by Amazon CloudWatch} in the {i Amazon Web Services General \
         Reference}.\n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec metric_stream_entry = {
  arn : amazon_resource_name option; [@ocaml.doc "The ARN of the metric stream.\n"]
  creation_date : timestamp option;
      [@ocaml.doc "The date that the metric stream was originally created.\n"]
  last_update_date : timestamp option;
      [@ocaml.doc
        "The date that the configuration of this metric stream was most recently updated.\n"]
  name : metric_stream_name option; [@ocaml.doc "The name of the metric stream.\n"]
  firehose_arn : amazon_resource_name option;
      [@ocaml.doc
        "The ARN of the Kinesis Firehose devlivery stream that is used for this metric stream.\n"]
  state : metric_stream_state option;
      [@ocaml.doc "The current state of this stream. Valid values are [running] and [stopped].\n"]
  output_format : metric_stream_output_format option;
      [@ocaml.doc
        "The output format of this metric stream. Valid values are [json], [opentelemetry1.0], and \
         [opentelemetry0.7].\n"]
}
[@@ocaml.doc "This structure contains the configuration information about one metric stream.\n"]

type nonrec metric_stream_entries = metric_stream_entry list [@@ocaml.doc ""]

type nonrec list_metric_streams_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token that marks the start of the next batch of returned results. You can use this \
         token in a subsequent operation to get the next batch of results.\n"]
  entries : metric_stream_entries option; [@ocaml.doc "The array of metric stream information.\n"]
}
[@@ocaml.doc ""]

type nonrec list_metric_streams_max_results = int [@@ocaml.doc ""]

type nonrec list_metric_streams_input = {
  next_token : next_token option;
      [@ocaml.doc
        "Include this value, if it was returned by the previous call, to get the next set of \
         metric streams.\n"]
  max_results : list_metric_streams_max_results option;
      [@ocaml.doc "The maximum number of results to return in one operation.\n"]
}
[@@ocaml.doc ""]

type nonrec owning_accounts = account_id list [@@ocaml.doc ""]

type nonrec metrics = metric list [@@ocaml.doc ""]

type nonrec list_metrics_output = {
  metrics : metrics option; [@ocaml.doc "The metrics that match your request. \n"]
  next_token : next_token option;
      [@ocaml.doc "The token that marks the start of the next batch of returned results. \n"]
  owning_accounts : owning_accounts option;
      [@ocaml.doc
        "If you are using this operation in a monitoring account, this array contains the account \
         IDs of the source accounts where the metrics in the returned data are from.\n\n\
        \ This field is a 1:1 mapping between each metric that is returned and the ID of the \
         owning account.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec include_linked_accounts = bool [@@ocaml.doc ""]

type nonrec recently_active = PT3H [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_metrics_input = {
  namespace : namespace option;
      [@ocaml.doc
        "The metric namespace to filter against. Only the namespace that matches exactly will be \
         returned.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "The name of the metric to filter against. Only the metrics with names that match exactly \
         will be returned.\n"]
  dimensions : dimension_filters option;
      [@ocaml.doc
        "The dimensions to filter against. Only the dimension with names that match exactly will \
         be returned. If you specify one dimension name and a metric has that dimension and also \
         other dimensions, it will be returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to indicate that there is more data available.\n"]
  recently_active : recently_active option;
      [@ocaml.doc
        "To filter the results to show only metrics that have had data points published in the \
         past three hours, specify this parameter with a value of [PT3H]. This is the only valid \
         value for this parameter.\n\n\
        \ The results that are returned are an approximation of the value you specify. There is a \
         low probability that the returned results include metrics with last published data as \
         much as 50 minutes more than the specified time interval.\n\
        \ "]
  include_linked_accounts : include_linked_accounts option;
      [@ocaml.doc
        "If you are using this operation in a monitoring account, specify [true] to include \
         metrics from source accounts in the returned data.\n\n\
        \ The default is [false].\n\
        \ "]
  owning_account : account_id option;
      [@ocaml.doc
        "When you use this operation in a monitoring account, use this field to return metrics \
         only from one source account. To do so, specify that source account ID in this field, and \
         also specify [true] for [IncludeLinkedAccounts].\n"]
}
[@@ocaml.doc ""]

type nonrec managed_rule_state = {
  rule_name : insight_rule_name;
      [@ocaml.doc
        " The name of the Contributor Insights rule that contains data for the specified Amazon \
         Web Services resource. \n"]
  state : insight_rule_state; [@ocaml.doc " Indicates whether the rule is enabled or disabled. \n"]
}
[@@ocaml.doc " The status of a managed Contributor Insights rule. \n"]

type nonrec managed_rule_description = {
  template_name : template_name option;
      [@ocaml.doc
        " The template name for the managed rule. Used to enable managed rules using \
         [PutManagedInsightRules]. \n"]
  resource_ar_n : amazon_resource_name option;
      [@ocaml.doc
        " If a managed rule is enabled, this is the ARN for the related Amazon Web Services \
         resource. \n"]
  rule_state : managed_rule_state option;
      [@ocaml.doc
        " Describes the state of a managed rule. If present, it contains information about the \
         Contributor Insights rule that contains information about the related Amazon Web Services \
         resource. \n"]
}
[@@ocaml.doc
  " Contains information about managed Contributor Insights rules, as returned by \
   [ListManagedInsightRules]. \n"]

type nonrec managed_rule_descriptions = managed_rule_description list [@@ocaml.doc ""]

type nonrec list_managed_insight_rules_output = {
  managed_rules : managed_rule_descriptions option;
      [@ocaml.doc
        " The managed rules that are available for the specified Amazon Web Services resource. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " Include this value to get the next set of rules if the value was returned by the \
         previous operation. \n"]
}
[@@ocaml.doc ""]

type nonrec list_managed_insight_rules_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        " The ARN of an Amazon Web Services resource that has managed Contributor Insights rules. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " Include this value to get the next set of rules if the value was returned by the \
         previous operation. \n"]
  max_results : insight_rule_max_results option;
      [@ocaml.doc
        " The maximum number of results to return in one operation. If you omit this parameter, \
         the default number is used. The default number is [100]. \n"]
}
[@@ocaml.doc ""]

type nonrec list_dashboards_output = {
  dashboard_entries : dashboard_entries option; [@ocaml.doc "The list of matching dashboards.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token that marks the start of the next batch of returned results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dashboards_input = {
  dashboard_name_prefix : dashboard_name_prefix option;
      [@ocaml.doc
        "If you specify this parameter, only the dashboards with names starting with the specified \
         string are listed. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, \
         \".\", \"-\", and \"_\". \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to indicate that there is more data available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_alarm_mute_rules_output = {
  alarm_mute_rule_summaries : alarm_mute_rule_summaries option;
      [@ocaml.doc "A list of alarm mute rule summaries.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use when requesting the next set of results. If this field is absent, there \
         are no more results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec list_alarm_mute_rules_input = {
  alarm_name : name option;
      [@ocaml.doc "Filter results to show only mute rules that target the specified alarm name.\n"]
  statuses : alarm_mute_rule_statuses option;
      [@ocaml.doc
        "Filter results to show only mute rules with the specified statuses. Valid values are \
         [SCHEDULED], [ACTIVE], or [EXPIRED].\n"]
  max_records : max_records option;
      [@ocaml.doc "The maximum number of mute rules to return in one call. The default is 50.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned from a previous call to indicate where to continue retrieving results.\n"]
}
[@@ocaml.doc ""]
