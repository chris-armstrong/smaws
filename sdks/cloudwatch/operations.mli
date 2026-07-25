open Types

module ListAlarmMuteRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_alarm_mute_rules_input ->
    ( list_alarm_mute_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_alarm_mute_rules_input ->
    ( list_alarm_mute_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists alarm mute rules in your Amazon Web Services account and region.\n\n\
  \ You can filter the results by alarm name to find all mute rules targeting a specific alarm, or \
   by status to find rules that are scheduled, active, or expired.\n\
  \ \n\
  \  This operation supports pagination for accounts with many mute rules. Use the [MaxRecords] \
   and [NextToken] parameters to retrieve results in multiple calls.\n\
  \  \n\
  \    {b Permissions} \n\
  \   \n\
  \    To list mute rules, you need the [cloudwatch:ListAlarmMuteRules] permission.\n\
  \    "]

module ListDashboards : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dashboards_input ->
    ( list_dashboards_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dashboards_input ->
    ( list_dashboards_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the dashboards for your account. If you include [DashboardNamePrefix], only \
   those dashboards with names starting with the prefix are listed. Otherwise, all dashboards in \
   your account are listed. \n\n\
  \  [ListDashboards] returns up to 1000 results on one page. If there are more than 1000 \
   dashboards, you can call [ListDashboards] again and include the value you received for \
   [NextToken] in the first call, to receive the next 1000 results.\n\
  \ "]

module ListManagedInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_managed_insight_rules_input ->
    ( list_managed_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_managed_insight_rules_input ->
    ( list_managed_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list that contains the number of managed Contributor Insights rules in your account. \n"]

module ListMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metrics_input ->
    ( list_metrics_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metrics_input ->
    ( list_metrics_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the specified metrics. You can use the returned metrics with \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html}GetMetricData} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html}GetMetricStatistics} \
   to get statistical data.\n\n\
  \ Up to 500 results are returned for any one call. To retrieve additional results, use the \
   returned token with subsequent calls.\n\
  \ \n\
  \  After you create a metric, allow up to 15 minutes for the metric to appear. To see metric \
   statistics sooner, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html}GetMetricData} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html}GetMetricStatistics}.\n\
  \  \n\
  \   If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account and view metrics from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \   \n\
  \     [ListMetrics] doesn't return information about metrics if those metrics haven't reported \
   data in the past two weeks. To retrieve those metrics, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html}GetMetricData} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html}GetMetricStatistics}.\n\
  \    "]

module ListMetricStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidNextToken of invalid_next_token
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metric_streams_input ->
    ( list_metric_streams_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metric_streams_input ->
    ( list_metric_streams_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of metric streams in this account.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays the tags associated with a CloudWatch resource. Currently, alarms, dashboards, metric \
   streams and Contributor Insights rules support tagging.\n"]

module PutAlarmMuteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_alarm_mute_rule_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_alarm_mute_rule_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an alarm mute rule.\n\n\
  \ Alarm mute rules automatically mute alarm actions during predefined time windows. When a mute \
   rule is active, targeted alarms continue to evaluate metrics and transition between states, but \
   their configured actions (such as Amazon SNS notifications or Auto Scaling actions) are muted.\n\
  \ \n\
  \  You can create mute rules with recurring schedules using [cron] expressions or one-time mute \
   windows using [at] expressions. Each mute rule can target up to 100 specific alarms by name.\n\
  \  \n\
  \   If you specify a rule name that already exists, this operation updates the existing rule \
   with the new configuration.\n\
  \   \n\
  \     {b Permissions} \n\
  \    \n\
  \     To create or update a mute rule, you must have the [cloudwatch:PutAlarmMuteRule] \
   permission on two types of resources: the alarm mute rule resource itself, and each alarm that \
   the rule targets.\n\
  \     \n\
  \      For example, If you want to allow a user to create mute rules that target only specific \
   alarms named \"WebServerCPUAlarm\" and \"DatabaseConnectionAlarm\", you would create an IAM \
   policy with one statement granting [cloudwatch:PutAlarmMuteRule] on the alarm mute rule \
   resource ([arn:aws:cloudwatch:\\[REGION\\]:123456789012:alarm-mute-rule:*]), and another \
   statement granting [cloudwatch:PutAlarmMuteRule] on the targeted alarm resources \
   ([arn:aws:cloudwatch:\\[REGION\\]:123456789012:alarm:WebServerCPUAlarm] and \
   [arn:aws:cloudwatch:\\[REGION\\]:123456789012:alarm:DatabaseConnectionAlarm]).\n\
  \      \n\
  \       You can also use IAM policy conditions to allow targeting alarms based on resource tags. \
   For example, you can restrict users to create/update mute rules to only target alarms that have \
   a specific tag key-value pair, such as [Team=TeamA].\n\
  \       "]

module PutAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_anomaly_detector_input ->
    ( put_anomaly_detector_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_anomaly_detector_input ->
    ( put_anomaly_detector_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an anomaly detection model for a CloudWatch metric. You can use the model to display a \
   band of expected normal values when the metric is graphed.\n\n\
  \ If you have enabled unified cross-account observability, and this account is a monitoring \
   account, the metric can be in the same account or a source account. You can specify the account \
   ID in the object you specify in the [SingleMetricAnomalyDetector] parameter.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html}CloudWatch \
   Anomaly Detection}.\n\
  \  "]

module PutCompositeAlarm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_composite_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_composite_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a {i composite alarm}. When you create a composite alarm, you specify a rule \
   expression for the alarm that takes into account the alarm states of other alarms that you have \
   created. The composite alarm goes into ALARM state only if all conditions of the rule are met.\n\n\
  \ The alarms specified in a composite alarm's rule expression can include metric alarms and \
   other composite alarms. The rule expression of a composite alarm can include as many as 100 \
   underlying alarms. Any single alarm can be included in the rule expressions of as many as 150 \
   composite alarms.\n\
  \ \n\
  \  Using composite alarms can reduce alarm noise. You can create multiple metric alarms, and \
   also create a composite alarm and set up alerts only for the composite alarm. For example, you \
   could create a composite alarm that goes into ALARM state only when more than one of the \
   underlying metric alarms are in ALARM state.\n\
  \  \n\
  \   Composite alarms can take the following actions:\n\
  \   \n\
  \    {ul\n\
  \          {-  Notify Amazon SNS topics.\n\
  \              \n\
  \               }\n\
  \          {-  Invoke Lambda functions.\n\
  \              \n\
  \               }\n\
  \          {-  Create OpsItems in Systems Manager Ops Center.\n\
  \              \n\
  \               }\n\
  \          {-  Create incidents in Systems Manager Incident Manager.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    It is possible to create a loop or cycle of composite alarms, where composite alarm A \
   depends on composite alarm B, and composite alarm B also depends on composite alarm A. In this \
   scenario, you can't delete any composite alarm that is part of the cycle because there is \
   always still a composite alarm that depends on that alarm that you want to delete.\n\
  \    \n\
  \     To get out of such a situation, you must break the cycle by changing the rule of one of \
   the composite alarms in the cycle to remove a dependency that creates the cycle. The simplest \
   change to make to break a cycle is to change the [AlarmRule] of one of the alarms to [false]. \n\
  \     \n\
  \      Additionally, the evaluation of composite alarms stops if CloudWatch detects a cycle in \
   the evaluation path. \n\
  \      \n\
  \        When this operation creates an alarm, the alarm state is immediately set to \
   [INSUFFICIENT_DATA]. The alarm is then evaluated and its state is set appropriately. Any \
   actions associated with the new state are then executed. For a composite alarm, this initial \
   time after creation is the only time that the alarm can be in [INSUFFICIENT_DATA] state.\n\
  \        \n\
  \         When you update an existing alarm, its state is left unchanged, but the update \
   completely overwrites the previous configuration of the alarm.\n\
  \         \n\
  \          To use this operation, you must be signed on with the [cloudwatch:PutCompositeAlarm] \
   permission that is scoped to [*]. You can't create a composite alarms if your \
   [cloudwatch:PutCompositeAlarm] permission has a narrower scope.\n\
  \          \n\
  \           If you are an IAM user, you must have [iam:CreateServiceLinkedRole] to create a \
   composite alarm that has Systems Manager OpsItem actions.\n\
  \           "]

module PutDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConflictException of conflict_exception
    | `DashboardInvalidInputError of dashboard_invalid_input_error
    | `InternalServiceFault of internal_service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_dashboard_input ->
    ( put_dashboard_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `DashboardInvalidInputError of dashboard_invalid_input_error
      | `InternalServiceFault of internal_service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_dashboard_input ->
    ( put_dashboard_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `DashboardInvalidInputError of dashboard_invalid_input_error
      | `InternalServiceFault of internal_service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a dashboard if it does not already exist, or updates an existing dashboard. If you \
   update a dashboard, the entire contents are replaced with what you specify here.\n\n\
  \ All dashboards in your account are global, not region-specific.\n\
  \ \n\
  \  A simple way to create a dashboard using [PutDashboard] is to copy an existing dashboard. To \
   copy an existing dashboard using the console, you can load the dashboard and then use the \
   View/edit source command in the Actions menu to display the JSON block for that dashboard. \
   Another way to copy a dashboard is to use [GetDashboard], and then use the data returned within \
   [DashboardBody] as the template for the new dashboard when you call [PutDashboard].\n\
  \  \n\
  \   When you create a dashboard with [PutDashboard], a good practice is to add a text widget at \
   the top of the dashboard with a message that the dashboard was created by script and should not \
   be changed in the console. This message could also point console users to the location of the \
   [DashboardBody] script or the CloudFormation template used to create the dashboard.\n\
  \   "]

module PutInsightRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_insight_rule_input ->
    ( put_insight_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_insight_rule_input ->
    ( put_insight_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Contributor Insights rule. Rules evaluate log events in a CloudWatch Logs log group, \
   enabling you to find contributor data for the log events in that log group. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html}Using \
   Contributor Insights to Analyze High-Cardinality Data}.\n\n\
  \ If you create a rule, delete it, and then re-create it with the same name, historical data \
   from the first time the rule was created might not be available.\n\
  \ "]

module PutLogAlarm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceConflict of resource_conflict ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_log_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceConflict of resource_conflict ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_log_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceConflict of resource_conflict ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a log alarm. A log alarm evaluates the results of a CloudWatch Logs \
   scheduled query against the configured threshold and comparison operator to determine its \
   state.\n\n\
  \ When you create a log alarm, the operation creates a service-managed CloudWatch Logs scheduled \
   query that runs the query string you provide on the schedule you configure. Each scheduled \
   query execution returns one or more aggregated values determined by the \
   [AggregationExpression], and each aggregated value is compared against the alarm [Threshold] to \
   determine the alarm state. The alarm uses M-out-of-N evaluation: if [QueryResultsToAlarm] out \
   of the most recent [QueryResultsToEvaluate] query results breach the threshold, the alarm \
   transitions to [ALARM].\n\
  \ \n\
  \  Log alarms support the alarm states ([OK], [ALARM], [INSUFFICIENT_DATA]). Configure \
   transition actions using [OKActions], [AlarmActions], and [InsufficientDataActions].\n\
  \  \n\
  \   If you call this operation with the name of an existing log alarm, the operation replaces \
   the previous configuration of that alarm.\n\
  \   \n\
  \     {b Permissions} \n\
  \    \n\
  \     To create or update a log alarm, you must have the [cloudwatch:PutLogAlarm] permission. \
   The IAM role specified in [ScheduledQueryRoleARN] must grant the CloudWatch Alarms service \
   permission to execute scheduled queries on the specified log groups. If you set \
   [ActionLogLineCount], the role specified in [ActionLogLineRoleArn] must grant permission to \
   retrieve log events for inclusion in alarm notifications.\n\
  \     "]

module PutManagedInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_managed_insight_rules_input ->
    ( put_managed_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_managed_insight_rules_input ->
    ( put_managed_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a managed Contributor Insights rule for a specified Amazon Web Services resource. When \
   you enable a managed rule, you create a Contributor Insights rule that collects data from \
   Amazon Web Services services. You cannot edit these rules with [PutInsightRule]. The rules can \
   be enabled, disabled, and deleted using [EnableInsightRules], [DisableInsightRules], and \
   [DeleteInsightRules]. If a previously created managed rule is currently disabled, a subsequent \
   call to this API will re-enable it. Use [ListManagedInsightRules] to describe all available \
   rules. \n"]

module PutMetricAlarm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_metric_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_metric_alarm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `LimitExceededFault of limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an alarm and associates it with the specified metric, metric math \
   expression, anomaly detection model, Metrics Insights query, or PromQL query. For more \
   information about using a Metrics Insights query for an alarm, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html}Create \
   alarms on Metrics Insights queries}.\n\n\
  \ Alarms based on anomaly detection models cannot have Auto Scaling actions.\n\
  \ \n\
  \  When this operation creates an alarm, the alarm state is immediately set to \
   [INSUFFICIENT_DATA]. For PromQL alarms, the alarm state is instead immediately set to [OK]. The \
   alarm is then evaluated and its state is set appropriately. Any actions associated with the new \
   state are then executed.\n\
  \  \n\
  \   When you update an existing alarm, its state is left unchanged, but the update completely \
   overwrites the previous configuration of the alarm.\n\
  \   \n\
  \    If you are an IAM user, you must have Amazon EC2 permissions for some alarm operations:\n\
  \    \n\
  \     {ul\n\
  \           {-  The [iam:CreateServiceLinkedRole] permission for all alarms with EC2 actions\n\
  \               \n\
  \                }\n\
  \           {-  The [iam:CreateServiceLinkedRole] permissions to create an alarm with Systems \
   Manager OpsItem or response plan actions.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   The first time you create an alarm in the Amazon Web Services Management Console, the CLI, \
   or by using the PutMetricAlarm API, CloudWatch creates the necessary service-linked role for \
   you. The service-linked roles are called [AWSServiceRoleForCloudWatchEvents] and \
   [AWSServiceRoleForCloudWatchAlarms_ActionSSM]. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role}Amazon \
   Web Services service-linked role}.\n\
  \   \n\
  \    Each [PutMetricAlarm] action has a maximum uncompressed payload of 120 KB.\n\
  \    \n\
  \      {b Cross-account alarms} \n\
  \     \n\
  \      You can set an alarm on metrics in the current account, or in another account. To create \
   a cross-account alarm that watches a metric in a different account, you must have completed the \
   following pre-requisites:\n\
  \      \n\
  \       {ul\n\
  \             {-  The account where the metrics are located (the {i sharing account}) must \
   already have a sharing role named {b CloudWatch-CrossAccountSharingRole}. If it does not \
   already have this role, you must create it using the instructions in {b Set up a sharing \
   account} in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region} \
   Cross-account cross-Region CloudWatch console}. The policy for that role must grant access to \
   the ID of the account where you are creating the alarm. \n\
  \                 \n\
  \                  }\n\
  \             {-  The account where you are creating the alarm (the {i monitoring account}) must \
   already have a service-linked role named {b AWSServiceRoleForCloudWatchCrossAccount} to allow \
   CloudWatch to assume the sharing role in the sharing account. If it does not, you must create \
   it following the directions in {b Set up a monitoring account} in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region} \
   Cross-account cross-Region CloudWatch console}.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module PutMetricData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_metric_data_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_metric_data_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Publishes metric data to Amazon CloudWatch. CloudWatch associates the data with the specified \
   metric. If the specified metric does not exist, CloudWatch creates the metric. When CloudWatch \
   creates a metric, it can take up to fifteen minutes for the metric to appear in calls to \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}.\n\n\
  \ You can publish metrics with associated entity data (so that related telemetry can be found \
   and viewed together), or publish metric data by itself. To send entity data with your metrics, \
   use the [EntityMetricData] parameter. To send metrics without entity data, use the [MetricData] \
   parameter. The [EntityMetricData] structure includes [MetricData] structures for the metric \
   data.\n\
  \ \n\
  \  You can publish either individual values in the [Value] field, or arrays of values and the \
   number of times each value occurred during the period by using the [Values] and [Counts] fields \
   in the [MetricData] structure. Using the [Values] and [Counts] method enables you to publish up \
   to 150 values per metric with one [PutMetricData] request, and supports retrieving percentile \
   statistics on this data.\n\
  \  \n\
  \   Each [PutMetricData] request is limited to 1 MB in size for HTTP POST requests. You can send \
   a payload compressed by gzip. Each request is also limited to no more than 1000 different \
   metrics (across both the [MetricData] and [EntityMetricData] properties).\n\
  \   \n\
  \    Although the [Value] parameter accepts numbers of type [Double], CloudWatch rejects values \
   that are either too small or too large. Values must be in the range of -2^360 to 2^360. In \
   addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.\n\
  \    \n\
  \     You can use up to 30 dimensions per metric to further clarify what data the metric \
   collects. Each dimension consists of a Name and Value pair. For more information about \
   specifying dimensions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html}Publishing \
   Metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \     \n\
  \      You specify the time stamp to be associated with each data point. You can specify time \
   stamps that are as much as two weeks before the current date, and as much as 2 hours after the \
   current day and time.\n\
  \      \n\
  \       Data points with time stamps from 24 hours ago or longer can take at least 48 hours to \
   become available for \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html}GetMetricData} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html}GetMetricStatistics} \
   from the time they are submitted. Data points with time stamps between 3 and 24 hours ago can \
   take as much as 2 hours to become available for \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html}GetMetricData} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html}GetMetricStatistics}.\n\
  \       \n\
  \        CloudWatch needs raw data points to calculate percentile statistics. If you publish \
   data using a statistic set instead, you can only retrieve percentile statistics for this data \
   if one of the following conditions is true:\n\
  \        \n\
  \         {ul\n\
  \               {-  The [SampleCount] value of the statistic set is 1 and [Min], [Max], and \
   [Sum] are all equal.\n\
  \                   \n\
  \                    }\n\
  \               {-  The [Min] and [Max] are equal, and [Sum] is equal to [Min] multiplied by \
   [SampleCount].\n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \  "]

module PutMetricStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_metric_stream_input ->
    ( put_metric_stream_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_metric_stream_input ->
    ( put_metric_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a metric stream. Metric streams can automatically stream CloudWatch metrics \
   to Amazon Web Services destinations, including Amazon S3, and to many third-party solutions.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metric-Streams.html} \
   Using Metric Streams}.\n\
  \ \n\
  \  To create a metric stream, you must be signed in to an account that has the [iam:PassRole] \
   permission and either the [CloudWatchFullAccess] policy or the [cloudwatch:PutMetricStream] \
   permission.\n\
  \  \n\
  \   When you create or update a metric stream, you choose one of the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  Stream metrics from all metric namespaces in the account.\n\
  \              \n\
  \               }\n\
  \          {-  Stream metrics from all metric namespaces in the account, except for the \
   namespaces that you list in [ExcludeFilters].\n\
  \              \n\
  \               }\n\
  \          {-  Stream metrics from only the metric namespaces that you list in [IncludeFilters].\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   By default, a metric stream always sends the [MAX], [MIN], [SUM], and [SAMPLECOUNT] \
   statistics for each metric that is streamed. You can use the [StatisticsConfigurations] \
   parameter to have the metric stream send additional statistics in the stream. Streaming \
   additional statistics incurs additional costs. For more information, see \
   {{:https://aws.amazon.com/cloudwatch/pricing/}Amazon CloudWatch Pricing}. \n\
  \   \n\
  \    When you use [PutMetricStream] to create a new metric stream, the stream is created in the \
   [running] state. If you use it to update an existing stream, the state of the stream is not \
   changed.\n\
  \    \n\
  \     If you are using CloudWatch cross-account observability and you create a metric stream in \
   a monitoring account, you can choose whether to include metrics from source accounts in the \
   stream. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \     "]

module SetAlarmState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidFormatFault of invalid_format_fault
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_alarm_state_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidFormatFault of invalid_format_fault
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_alarm_state_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidFormatFault of invalid_format_fault
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Temporarily sets the state of an alarm for testing purposes. When the updated state differs \
   from the previous value, the action configured for the appropriate state is invoked. For \
   example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, \
   temporarily changing the alarm state to [ALARM] sends an SNS message.\n\n\
  \ Metric alarms returns to their actual state quickly, often within seconds. Because the metric \
   alarm state change happens quickly, it is typically only visible in the alarm's {b History} tab \
   in the Amazon CloudWatch console or through \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarmHistory.html}DescribeAlarmHistory}.\n\
  \ \n\
  \  If you use [SetAlarmState] on a composite alarm, the composite alarm is not guaranteed to \
   return to its actual state. It returns to its actual state only once any of its children alarms \
   change state. It is also reevaluated if you update its configuration.\n\
  \  \n\
  \   If an alarm triggers EC2 Auto Scaling policies or application Auto Scaling policies, you \
   must include information in the [StateReasonData] parameter to enable the policy to take the \
   correct action.\n\
  \   "]

module StartMetricStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metric_streams_input ->
    ( start_metric_streams_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metric_streams_input ->
    ( start_metric_streams_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the streaming of metrics for one or more of your metric streams.\n"]

module StartOTelEnrichment : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_o_tel_enrichment_input ->
    (start_o_tel_enrichment_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_o_tel_enrichment_input ->
    ( start_o_tel_enrichment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables enrichment and PromQL access for CloudWatch vended metrics for \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html}supported \
   Amazon Web Services resources} in the account. Once enabled, metrics that contain a resource \
   identifier dimension (for example, EC2 [CPUUtilization] with an [InstanceId] dimension) are \
   enriched with resource ARN and resource tag labels and become queryable using PromQL.\n\n\
  \ Before calling this operation, you must enable resource tags on telemetry for your account. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/EnableResourceTagsOnTelemetry.html}Enable \
   resource tags on telemetry}.\n\
  \ "]

module StopMetricStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_metric_streams_input ->
    ( stop_metric_streams_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_metric_streams_input ->
    ( stop_metric_streams_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the streaming of metrics for one or more of your metric streams.\n"]

module StopOTelEnrichment : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_o_tel_enrichment_input ->
    (stop_o_tel_enrichment_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_o_tel_enrichment_input ->
    ( stop_o_tel_enrichment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables enrichment and PromQL access for CloudWatch vended metrics for \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html}supported \
   Amazon Web Services resources} in the account. After disabling, these metrics are no longer \
   enriched with resource ARN and resource tag labels, and cannot be queried using PromQL.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns one or more tags (key-value pairs) to the specified CloudWatch resource. Currently, the \
   only CloudWatch resources that can be tagged are alarms, dashboards, metric streams and \
   Contributor Insights rules.\n\n\
  \ Tags can help you organize and categorize your resources. You can also use them to scope user \
   permissions by granting a user permission to access or change only resources with certain tag \
   values.\n\
  \ \n\
  \  Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as \
   strings of characters.\n\
  \  \n\
  \   You can use the [TagResource] action with an alarm that already has tags. If you specify a \
   new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. \
   If you specify a tag key that is already associated with the alarm, the new tag value that you \
   specify replaces the previous value for that tag.\n\
  \   \n\
  \    You can associate as many as 50 tags with a CloudWatch resource.\n\
  \    "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from the specified resource. Currently, alarms, dashboards, metric \
   streams and Contributor Insights rules support tagging.\n"]

module GetOTelEnrichment : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_o_tel_enrichment_input ->
    (get_o_tel_enrichment_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_o_tel_enrichment_input ->
    ( get_o_tel_enrichment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the current status of vended metric enrichment for the account, including whether \
   CloudWatch vended metrics are enriched with resource ARN and resource tag labels and queryable \
   using PromQL. For the list of supported resources, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html}Supported \
   Amazon Web Services infrastructure metrics}.\n"]

module GetMetricWidgetImage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_metric_widget_image_input ->
    (get_metric_widget_image_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_metric_widget_image_input ->
    ( get_metric_widget_image_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use the [GetMetricWidgetImage] API to retrieve a snapshot graph of one or more Amazon \
   CloudWatch metrics as a bitmap image. You can then embed this image into your services and \
   products, such as wiki pages, reports, and documents. You could also retrieve images regularly, \
   such as every minute, and create your own custom live dashboard.\n\n\
  \ The graph you retrieve can include all CloudWatch metric graph features, including metric math \
   and horizontal and vertical annotations.\n\
  \ \n\
  \  There is a limit of 20 transactions per second for this API. Each [GetMetricWidgetImage] \
   action has the following limits:\n\
  \  \n\
  \   {ul\n\
  \         {-  As many as 100 metrics in the graph.\n\
  \             \n\
  \              }\n\
  \         {-  Up to 100 KB uncompressed payload.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetMetricStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_metric_stream_input ->
    ( get_metric_stream_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_metric_stream_input ->
    ( get_metric_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the metric stream that you specify.\n"]

module GetMetricStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_metric_statistics_input ->
    ( get_metric_statistics_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_metric_statistics_input ->
    ( get_metric_statistics_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets statistics for the specified metric.\n\n\
  \ The maximum number of data points returned from a single call is 1,440. If you request more \
   than 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you \
   can narrow the specified time range and make multiple requests across adjacent time ranges, or \
   you can increase the specified period. Data points are not returned in chronological order.\n\
  \ \n\
  \  CloudWatch aggregates data points based on the length of the period that you specify. For \
   example, if you request statistics with a one-hour period, CloudWatch aggregates all data \
   points with time stamps that fall within each one-hour period. Therefore, the number of values \
   aggregated by CloudWatch is larger than the number of data points returned.\n\
  \  \n\
  \   CloudWatch needs raw data points to calculate percentile statistics. If you publish data \
   using a statistic set instead, you can only retrieve percentile statistics for this data if one \
   of the following conditions is true:\n\
  \   \n\
  \    {ul\n\
  \          {-  The SampleCount value of the statistic set is 1.\n\
  \              \n\
  \               }\n\
  \          {-  The Min and the Max values of the statistic set are equal.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Percentile statistics are not available for metrics when any of the metric values are \
   negative numbers.\n\
  \   \n\
  \    Amazon CloudWatch retains metric data as follows:\n\
  \    \n\
  \     {ul\n\
  \           {-  Data points with a period of less than 60 seconds are available for 3 hours. \
   These data points are high-resolution metrics and are available only for custom metrics that \
   have been defined with a [StorageResolution] of 1.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 60 seconds (1-minute) are available for 15 days.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 300 seconds (5-minute) are available for 63 days.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 3600 seconds (1 hour) are available for 455 days \
   (15 months).\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Data points that are initially published with a shorter period are aggregated together for \
   long-term storage. For example, if you collect data using a period of 1 minute, the data \
   remains available for 15 days with 1-minute resolution. After 15 days, this data is still \
   available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 \
   days, the data is further aggregated and is available with a resolution of 1 hour.\n\
  \   \n\
  \    CloudWatch started retaining 5-minute and 1-hour metric data as of July 9, 2016.\n\
  \    \n\
  \     For information about metrics and dimensions supported by Amazon Web Services services, \
   see the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html}Amazon \
   CloudWatch Metrics and Dimensions Reference} in the {i Amazon CloudWatch User Guide}.\n\
  \     "]

module GetMetricData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_metric_data_input ->
    ( get_metric_data_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_metric_data_input ->
    ( get_metric_data_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use the [GetMetricData] API to retrieve CloudWatch metric values. The operation can \
   also include a CloudWatch Metrics Insights query, and one or more metric math functions.\n\n\
  \ A [GetMetricData] operation that does not include a query can retrieve as many as 500 \
   different metrics in a single request, with a total of as many as 100,800 data points. You can \
   also optionally perform metric math expressions on the values of the returned statistics, to \
   create new time series that represent new insights into your data. For example, using Lambda \
   metrics, you could divide the Errors metric by the Invocations metric to get an error rate time \
   series. For more information about metric math expressions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax}Metric \
   Math Syntax and Functions} in the {i Amazon CloudWatch User Guide}.\n\
  \ \n\
  \  If you include a Metrics Insights query, each [GetMetricData] operation can include only one \
   query. But the same [GetMetricData] operation can also retrieve other metrics. Metrics Insights \
   queries can query only the most recent three hours of metric data. For more information about \
   Metrics Insights, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html}Query \
   your metrics with CloudWatch Metrics Insights}.\n\
  \  \n\
  \   Calls to the [GetMetricData] API have a different pricing structure than calls to \
   [GetMetricStatistics]. For more information about pricing, see \
   {{:https://aws.amazon.com/cloudwatch/pricing/}Amazon CloudWatch Pricing}.\n\
  \   \n\
  \    Amazon CloudWatch retains metric data as follows:\n\
  \    \n\
  \     {ul\n\
  \           {-  Data points with a period of less than 60 seconds are available for 3 hours. \
   These data points are high-resolution metrics and are available only for custom metrics that \
   have been defined with a [StorageResolution] of 1.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 60 seconds (1-minute) are available for 15 days.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 300 seconds (5-minute) are available for 63 days.\n\
  \               \n\
  \                }\n\
  \           {-  Data points with a period of 3600 seconds (1 hour) are available for 455 days \
   (15 months).\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Data points that are initially published with a shorter period are aggregated together for \
   long-term storage. For example, if you collect data using a period of 1 minute, the data \
   remains available for 15 days with 1-minute resolution. After 15 days, this data is still \
   available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 \
   days, the data is further aggregated and is available with a resolution of 1 hour.\n\
  \   \n\
  \    If you omit [Unit] in your request, all data that was collected with any unit is returned, \
   along with the corresponding units that were specified when the data was reported to \
   CloudWatch. If you specify a unit, the operation returns only data that was collected with that \
   unit specified. If you specify a unit that does not match the data collected, the results of \
   the operation are null. CloudWatch does not perform unit conversions.\n\
  \    \n\
  \      {b Using Metrics Insights queries with metric math} \n\
  \     \n\
  \      You can't mix a Metric Insights query and metric math syntax in the same expression, but \
   you can reference results from a Metrics Insights query within other Metric math expressions. A \
   Metrics Insights query without a {b GROUP BY} clause returns a single time-series (TS), and can \
   be used as input for a metric math expression that expects a single time series. A Metrics \
   Insights query with a {b GROUP BY} clause returns an array of time-series (TS\\[\\]), and can \
   be used as input for a metric math expression that expects an array of time series. \n\
  \      "]

module GetInsightRuleReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_insight_rule_report_input ->
    ( get_insight_rule_report_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_insight_rule_report_input ->
    ( get_insight_rule_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns the time series data collected by a Contributor Insights rule. The data \
   includes the identity and number of contributors to the log group.\n\n\
  \ You can also optionally return one or more statistics about each data point in the time \
   series. These statistics can include the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   [UniqueContributors] -- the number of unique contributors for each data point.\n\
  \            \n\
  \             }\n\
  \        {-   [MaxContributorValue] -- the value of the top contributor for each data point. The \
   identity of the contributor might change for each data point in the graph.\n\
  \            \n\
  \             If this rule aggregates by COUNT, the top contributor for each data point is the \
   contributor with the most occurrences in that period. If the rule aggregates by SUM, the top \
   contributor is the contributor with the highest sum in the log field specified by the rule's \
   [Value], during that period.\n\
  \             \n\
  \              }\n\
  \        {-   [SampleCount] -- the number of data points matched by the rule.\n\
  \            \n\
  \             }\n\
  \        {-   [Sum] -- the sum of the values from all contributors during the time period \
   represented by that data point.\n\
  \            \n\
  \             }\n\
  \        {-   [Minimum] -- the minimum value from a single observation during the time period \
   represented by that data point.\n\
  \            \n\
  \             }\n\
  \        {-   [Maximum] -- the maximum value from a single observation during the time period \
   represented by that data point.\n\
  \            \n\
  \             }\n\
  \        {-   [Average] -- the average value from all contributors during the time period \
   represented by that data point.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module GetDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dataset_input ->
    ( get_dataset_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dataset_input ->
    ( get_dataset_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified dataset. This includes its identifier, Amazon Resource \
   Name (ARN), and any customer managed Amazon Web Services Key Management Service (Amazon Web \
   Services KMS) key that is currently associated with it.\n\n\
  \ Only the [default] dataset is supported. The [default] dataset is implicit for every account \
   in every Region \226\128\148 you can call [GetDataset] for it without first creating it. If no \
   customer managed KMS key has been associated with the dataset, the response omits the \
   [KmsKeyArn] field, indicating that data is encrypted at rest using an Amazon Web Services owned \
   key managed by Amazon CloudWatch.\n\
  \ \n\
  \  To associate a customer managed KMS key with a dataset, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_AssociateDatasetKmsKey.html}AssociateDatasetKmsKey}. \
   To remove the association, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DisassociateDatasetKmsKey.html}DisassociateDatasetKmsKey}.\n\
  \  "]

module GetDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DashboardNotFoundError of dashboard_not_found_error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_input ->
    ( get_dashboard_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DashboardNotFoundError of dashboard_not_found_error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_input ->
    ( get_dashboard_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DashboardNotFoundError of dashboard_not_found_error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays the details of the dashboard that you specify.\n\n\
  \ To copy an existing dashboard, use [GetDashboard], and then use the data returned within \
   [DashboardBody] as the template for the new dashboard when you call [PutDashboard] to create \
   the copy.\n\
  \ "]

module GetAlarmMuteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_alarm_mute_rule_input ->
    ( get_alarm_mute_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_alarm_mute_rule_input ->
    ( get_alarm_mute_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details for a specific alarm mute rule.\n\n\
  \ This operation returns complete information about the mute rule, including its configuration, \
   status, targeted alarms, and metadata.\n\
  \ \n\
  \  The returned status indicates the current state of the mute rule:\n\
  \  \n\
  \   {ul\n\
  \         {-   {b SCHEDULED}: The mute rule is configured and will become active in the future\n\
  \             \n\
  \              }\n\
  \         {-   {b ACTIVE}: The mute rule is currently muting alarm actions\n\
  \             \n\
  \              }\n\
  \         {-   {b EXPIRED}: The mute rule has passed its expiration date and will no longer \
   become active\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Permissions} \n\
  \   \n\
  \    To retrieve details for a mute rule, you need the [cloudwatch:GetAlarmMuteRule] permission \
   on the alarm mute rule resource.\n\
  \    "]

module EnableInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_insight_rules_input ->
    ( enable_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_insight_rules_input ->
    ( enable_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the specified Contributor Insights rules. When rules are enabled, they immediately \
   begin analyzing log data.\n"]

module EnableAlarmActions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_alarm_actions_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_alarm_actions_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables the actions for the specified alarms.\n"]

module DisassociateDatasetKmsKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_dataset_kms_key_input ->
    ( disassociate_dataset_kms_key_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_dataset_kms_key_input ->
    ( disassociate_dataset_kms_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the customer managed Amazon Web Services Key Management Service (Amazon Web Services \
   KMS) key association from the specified dataset. After this operation completes, data that you \
   publish to the dataset is encrypted at rest using an Amazon Web Services owned key managed by \
   Amazon CloudWatch.\n\n\
  \ Only the [default] dataset is supported. To call this operation, the dataset must currently \
   have a customer managed KMS key associated with it. If the dataset has no associated KMS key, \
   the operation fails with [ResourceNotFoundException].\n\
  \ \n\
  \  Amazon CloudWatch performs a dry-run [kms:Decrypt] call on the key as part of this operation. \
   This verifies that the caller is authorized to use the currently associated key. The caller \
   must have [kms:Decrypt] permission on the currently associated key, and the key must be enabled \
   and accessible. If the key has been disabled or scheduled for deletion, you must first \
   re-enable or restore it before you can disassociate it from the dataset.\n\
  \  \n\
  \    Disassociating a KMS key from a dataset does not immediately remove the [kms:Decrypt] \
   requirement on data plane operations. For up to three hours after disassociation, callers must \
   continue to have [kms:Decrypt] permission on the previously associated key. Some data may still \
   be encrypted with that key during this window. After this enforcement window elapses, the \
   [kms:Decrypt] requirement is lifted.\n\
  \    \n\
  \      For more information about using customer managed keys with Amazon CloudWatch, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cmk-encryption.html}Encryption \
   at rest with customer managed keys} in the {i Amazon CloudWatch User Guide}.\n\
  \      "]

module DisableInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_insight_rules_input ->
    ( disable_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_insight_rules_input ->
    ( disable_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the specified Contributor Insights rules. When rules are disabled, they do not analyze \
   log groups and do not incur costs.\n"]

module DisableAlarmActions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_alarm_actions_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_alarm_actions_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm \
   actions do not execute when the alarm state changes.\n"]

module DescribeInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_insight_rules_input ->
    ( describe_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_insight_rules_input ->
    ( describe_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all the Contributor Insights rules in your account.\n\n\
  \ For more information about Contributor Insights, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html}Using \
   Contributor Insights to Analyze High-Cardinality Data}.\n\
  \ "]

module DescribeAnomalyDetectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidNextToken of invalid_next_token
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_anomaly_detectors_input ->
    ( describe_anomaly_detectors_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_anomaly_detectors_input ->
    ( describe_anomaly_detectors_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidNextToken of invalid_next_token
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the anomaly detection models that you have created in your account. For single metric \
   anomaly detectors, you can list all of the models in your account or filter the results to only \
   the models that are related to a certain namespace, metric name, or metric dimension. For \
   metric math anomaly detectors, you can list them by adding [METRIC_MATH] to the \
   [AnomalyDetectorTypes] array. This will return all metric math anomaly detectors in your \
   account.\n"]

module DescribeAlarmsForMetric : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_alarms_for_metric_input ->
    (describe_alarms_for_metric_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_alarms_for_metric_input ->
    ( describe_alarms_for_metric_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the alarms for the specified metric. To filter the results, specify a statistic, \
   period, or unit.\n\n\
  \ This operation retrieves only standard alarms that are based on the specified metric. It does \
   not return alarms based on math expressions that use the specified metric, or composite alarms \
   that use the specified metric.\n\
  \ "]

module DescribeAlarms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_alarms_input ->
    ( describe_alarms_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_alarms_input ->
    ( describe_alarms_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified alarms. You can filter the results by specifying a prefix for the alarm \
   name, the alarm state, or a prefix for any action.\n\n\
  \ To use this operation and return information about composite alarms, you must be signed on \
   with the [cloudwatch:DescribeAlarms] permission that is scoped to [*]. You can't return \
   information about composite alarms if your [cloudwatch:DescribeAlarms] permission has a \
   narrower scope.\n\
  \ "]

module DescribeAlarmHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_alarm_history_input ->
    ( describe_alarm_history_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_alarm_history_input ->
    ( describe_alarm_history_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the history for the specified alarm. You can filter the results by date range or item \
   type. If an alarm name is not specified, the histories for either all metric alarms or all \
   composite alarms are returned.\n\n\
  \ CloudWatch retains the history of an alarm even if you delete the alarm.\n\
  \ \n\
  \  To use this operation and return information about a composite alarm, you must be signed on \
   with the [cloudwatch:DescribeAlarmHistory] permission that is scoped to [*]. You can't return \
   information about composite alarms if your [cloudwatch:DescribeAlarmHistory] permission has a \
   narrower scope.\n\
  \  "]

module DescribeAlarmContributors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_alarm_contributors_input ->
    ( describe_alarm_contributors_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_alarm_contributors_input ->
    ( describe_alarm_contributors_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the information of the current alarm contributors that are in [ALARM] state. This \
   operation returns details about the individual time series that contribute to the alarm's state.\n"]

module DeleteMetricStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_stream_input ->
    ( delete_metric_stream_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_stream_input ->
    ( delete_metric_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Permanently deletes the metric stream that you specify.\n"]

module DeleteInsightRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_insight_rules_input ->
    ( delete_insight_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_insight_rules_input ->
    ( delete_insight_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Permanently deletes the specified Contributor Insights rules.\n\n\
  \ If you create a rule, delete it, and then re-create it with the same name, historical data \
   from the first time the rule was created might not be available.\n\
  \ "]

module DeleteDashboards : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConflictException of conflict_exception
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dashboards_input ->
    ( delete_dashboards_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dashboards_input ->
    ( delete_dashboards_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes all dashboards that you specify. You can specify up to 100 dashboards to delete. If \
   there is an error during this call, the operation attempts to delete as many dashboards as \
   possible.\n"]

module DeleteAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InternalServiceFault of internal_service_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingRequiredParameterException of missing_required_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_detector_input ->
    ( delete_anomaly_detector_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_detector_input ->
    ( delete_anomaly_detector_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InternalServiceFault of internal_service_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingRequiredParameterException of missing_required_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes the specified anomaly detection model from your account. For more information about \
   how to delete an anomaly detection model, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Anomaly_Detection_Alarm.html#Delete_Anomaly_Detection_Model}Deleting \
   an anomaly detection model} in the {i CloudWatch User Guide}. \n"]

module DeleteAlarms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceConflict of resource_conflict
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_alarms_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceConflict of resource_conflict
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_alarms_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceConflict of resource_conflict
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified alarms. You can delete up to 100 alarms in one operation. However, this \
   total can include no more than one composite alarm. For example, you could delete 99 metric \
   alarms and one composite alarms with one operation, but you can't delete two composite alarms \
   with one operation. Log alarms cannot be batch deleted.\n\n\
  \  If you specify any incorrect alarm names, the alarms you specify with correct names are still \
   deleted. Other syntax errors might result in no alarms being deleted. To confirm that alarms \
   were deleted successfully, you can use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarms.html}DescribeAlarms} \
   operation after using [DeleteAlarms].\n\
  \ \n\
  \   It is possible to create a loop or cycle of composite alarms, where composite alarm A \
   depends on composite alarm B, and composite alarm B also depends on composite alarm A. In this \
   scenario, you can't delete any composite alarm that is part of the cycle because there is \
   always still a composite alarm that depends on that alarm that you want to delete.\n\
  \   \n\
  \    To get out of such a situation, you must break the cycle by changing the rule of one of the \
   composite alarms in the cycle to remove a dependency that creates the cycle. The simplest \
   change to make to break a cycle is to change the [AlarmRule] of one of the alarms to [false]. \n\
  \    \n\
  \     Additionally, the evaluation of composite alarms stops if CloudWatch detects a cycle in \
   the evaluation path. \n\
  \     \n\
  \      "]

module DeleteAlarmMuteRule : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_alarm_mute_rule_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_alarm_mute_rule_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specific alarm mute rule.\n\n\
  \ When you delete a mute rule, any alarms that are currently being muted by that rule are \
   immediately unmuted. If those alarms are in an ALARM state, their configured actions will \
   trigger.\n\
  \ \n\
  \  This operation is idempotent. If you delete a mute rule that does not exist, the operation \
   succeeds without returning an error.\n\
  \  \n\
  \    {b Permissions} \n\
  \   \n\
  \    To delete a mute rule, you need the [cloudwatch:DeleteAlarmMuteRule] permission on the \
   alarm mute rule resource.\n\
  \    "]

module AssociateDatasetKmsKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConflictException of conflict_exception
    | `KmsAccessDeniedException of kms_access_denied_exception
    | `KmsKeyDisabledException of kms_key_disabled_exception
    | `KmsKeyNotFoundException of kms_key_not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_dataset_kms_key_input ->
    ( associate_dataset_kms_key_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `KmsAccessDeniedException of kms_access_denied_exception
      | `KmsKeyDisabledException of kms_key_disabled_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_dataset_kms_key_input ->
    ( associate_dataset_kms_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictException of conflict_exception
      | `KmsAccessDeniedException of kms_access_denied_exception
      | `KmsKeyDisabledException of kms_key_disabled_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Amazon Web Services Key Management Service (Amazon Web Services KMS) customer \
   managed key with the specified dataset. After this operation completes, all data published to \
   the dataset is encrypted at rest using the specified KMS key. Callers must have [kms:Decrypt] \
   permission on the key to read the encrypted data.\n\n\
  \ Only the [default] dataset is supported. The [default] dataset is implicit for every account \
   in every Region \226\128\148 you do not need to create it before calling this operation.\n\
  \ \n\
  \  You can call [AssociateDatasetKmsKey] on a dataset that is already associated with a KMS key \
   to replace the existing key with a different one. To replace a key, the caller must have \
   [kms:Decrypt] permission on both the current key and the new key.\n\
  \  \n\
  \   The KMS key that you specify must meet all of the following requirements:\n\
  \   \n\
  \    {ul\n\
  \          {-  It must be a symmetric encryption KMS key (key spec [SYMMETRIC_DEFAULT], key \
   usage [ENCRYPT_DECRYPT]). Asymmetric keys, HMAC keys, and key material types other than \
   [SYMMETRIC_DEFAULT] are not supported.\n\
  \              \n\
  \               }\n\
  \          {-  It must be enabled and not pending deletion.\n\
  \              \n\
  \               }\n\
  \          {-  Its key policy must grant the CloudWatch service principal \
   ([cloudwatch.amazonaws.com]) these permissions: [kms:DescribeKey], [kms:GenerateDataKey], \
   [kms:Encrypt], [kms:Decrypt], and [kms:ReEncrypt*]. Amazon CloudWatch requires these \
   permissions to manage the data on your behalf.\n\
  \              \n\
  \               }\n\
  \          {-  The calling principal must have [kms:Decrypt] permission on the key.\n\
  \              \n\
  \               }\n\
  \          {-  It must be specified as a fully qualified key ARN. Key IDs, aliases, and alias \
   ARNs are not accepted.\n\
  \              \n\
  \               }\n\
  \          {-  It must be in the same Amazon Web Services Region as the dataset.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Before completing the association, Amazon CloudWatch validates the key by performing a \
   series of dry-run KMS operations. Service-principal checks run first to verify that the key \
   policy grants the required access to Amazon CloudWatch. These checks include [kms:DescribeKey], \
   [kms:GenerateDataKey], [kms:Encrypt], [kms:Decrypt], and [kms:ReEncrypt*]. After those succeed, \
   a [kms:Decrypt] dry-run is run with the caller's credentials to verify that the calling \
   principal can use the key. When you are replacing an existing key, the caller's [kms:Decrypt] \
   dry-run is run on the current key first, and only then on the new key.\n\
  \   \n\
  \    If any of these checks fails, the operation fails and the existing key association (if any) \
   remains unchanged. Common failure causes include the key being disabled, the key policy not \
   granting the required permissions to Amazon CloudWatch, or the caller lacking [kms:Decrypt] \
   permission on the key.\n\
  \    \n\
  \     For more information about using customer managed keys with Amazon CloudWatch, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cmk-encryption.html}Encryption \
   at rest with customer managed keys} in the {i Amazon CloudWatch User Guide}.\n\
  \     "]
