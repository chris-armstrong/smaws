open Types

let account_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let action_log_line_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let action_log_line_role_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let action_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let actions_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let actions_suppressed_by_to_query path (x : actions_suppressed_by) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | WaitPeriod -> "WaitPeriod"
    | ExtensionPeriod -> "ExtensionPeriod"
    | Alarm -> "Alarm")

let actions_suppressed_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let aggregation_expression_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let state_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let contributor_attributes_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" attribute_name_to_query
    attribute_value_to_query path pairs

let contributor_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_contributor_to_query path (x : alarm_contributor) =
  List.concat
    [
      contributor_id_to_query (List.append path [ "ContributorId" ]) x.contributor_id;
      contributor_attributes_to_query
        (List.append path [ "ContributorAttributes" ])
        x.contributor_attributes;
      state_reason_to_query (List.append path [ "StateReason" ]) x.state_reason;
      (match x.state_transitioned_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateTransitionedTimestamp" ]) v);
    ]

let alarm_contributors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_contributor_to_query path xs

let alarm_description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let history_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let history_summary_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let history_item_type_to_query path (x : history_item_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ConfigurationUpdate -> "ConfigurationUpdate"
    | StateUpdate -> "StateUpdate"
    | Action -> "Action"
    | AlarmContributorStateUpdate -> "AlarmContributorStateUpdate"
    | AlarmContributorAction -> "AlarmContributorAction")

let alarm_type_to_query path (x : alarm_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CompositeAlarm -> "CompositeAlarm"
    | MetricAlarm -> "MetricAlarm"
    | LogAlarm -> "LogAlarm")

let alarm_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_history_item_to_query path (x : alarm_history_item) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_contributor_id with
      | None -> []
      | Some v -> contributor_id_to_query (List.append path [ "AlarmContributorId" ]) v);
      (match x.alarm_type with
      | None -> []
      | Some v -> alarm_type_to_query (List.append path [ "AlarmType" ]) v);
      (match x.timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "Timestamp" ]) v);
      (match x.history_item_type with
      | None -> []
      | Some v -> history_item_type_to_query (List.append path [ "HistoryItemType" ]) v);
      (match x.history_summary with
      | None -> []
      | Some v -> history_summary_to_query (List.append path [ "HistorySummary" ]) v);
      (match x.history_data with
      | None -> []
      | Some v -> history_data_to_query (List.append path [ "HistoryData" ]) v);
      (match x.alarm_contributor_attributes with
      | None -> []
      | Some v ->
          contributor_attributes_to_query (List.append path [ "AlarmContributorAttributes" ]) v);
    ]

let alarm_history_items_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_history_item_to_query path xs

let alarm_mute_rule_status_to_query path (x : alarm_mute_rule_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SCHEDULED -> "SCHEDULED" | ACTIVE -> "ACTIVE" | EXPIRED -> "EXPIRED")

let alarm_mute_rule_statuses_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_mute_rule_status_to_query path
    xs

let mute_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_mute_rule_summary_to_query path (x : alarm_mute_rule_summary) =
  List.concat
    [
      (match x.alarm_mute_rule_arn with
      | None -> []
      | Some v -> arn_to_query (List.append path [ "AlarmMuteRuleArn" ]) v);
      (match x.expire_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "ExpireDate" ]) v);
      (match x.status with
      | None -> []
      | Some v -> alarm_mute_rule_status_to_query (List.append path [ "Status" ]) v);
      (match x.mute_type with
      | None -> []
      | Some v -> mute_type_to_query (List.append path [ "MuteType" ]) v);
      (match x.last_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdatedTimestamp" ]) v);
    ]

let alarm_mute_rule_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_mute_rule_summary_to_query
    path xs

let alarm_name_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_name_to_query path xs

let recovery_period_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let pending_period_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let query_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_prom_ql_criteria_to_query path (x : alarm_prom_ql_criteria) =
  List.concat
    [
      query_to_query (List.append path [ "Query" ]) x.query;
      (match x.pending_period with
      | None -> []
      | Some v -> pending_period_to_query (List.append path [ "PendingPeriod" ]) v);
      (match x.recovery_period with
      | None -> []
      | Some v -> recovery_period_to_query (List.append path [ "RecoveryPeriod" ]) v);
    ]

let alarm_rule_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alarm_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_type_to_query path xs

let amazon_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let period_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let return_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let metric_label_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let metric_expression_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let standard_unit_to_query path (x : standard_unit) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Seconds -> "Seconds"
    | Microseconds -> "Microseconds"
    | Milliseconds -> "Milliseconds"
    | Bytes -> "Bytes"
    | Kilobytes -> "Kilobytes"
    | Megabytes -> "Megabytes"
    | Gigabytes -> "Gigabytes"
    | Terabytes -> "Terabytes"
    | Bits -> "Bits"
    | Kilobits -> "Kilobits"
    | Megabits -> "Megabits"
    | Gigabits -> "Gigabits"
    | Terabits -> "Terabits"
    | Percent -> "Percent"
    | Count -> "Count"
    | Bytes_Second -> "Bytes/Second"
    | Kilobytes_Second -> "Kilobytes/Second"
    | Megabytes_Second -> "Megabytes/Second"
    | Gigabytes_Second -> "Gigabytes/Second"
    | Terabytes_Second -> "Terabytes/Second"
    | Bits_Second -> "Bits/Second"
    | Kilobits_Second -> "Kilobits/Second"
    | Megabits_Second -> "Megabits/Second"
    | Gigabits_Second -> "Gigabits/Second"
    | Terabits_Second -> "Terabits/Second"
    | Count_Second -> "Count/Second"
    | None_ -> "None")

let stat_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dimension_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dimension_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let dimension_to_query path (x : dimension) =
  List.concat
    [
      dimension_name_to_query (List.append path [ "Name" ]) x.name;
      dimension_value_to_query (List.append path [ "Value" ]) x.value;
    ]

let dimensions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dimension_to_query path xs

let metric_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let namespace_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_to_query path (x : metric) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
    ]

let metric_stat_to_query path (x : metric_stat) =
  List.concat
    [
      metric_to_query (List.append path [ "Metric" ]) x.metric;
      period_to_query (List.append path [ "Period" ]) x.period;
      stat_to_query (List.append path [ "Stat" ]) x.stat;
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
    ]

let metric_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_data_query_to_query path (x : metric_data_query) =
  List.concat
    [
      metric_id_to_query (List.append path [ "Id" ]) x.id;
      (match x.metric_stat with
      | None -> []
      | Some v -> metric_stat_to_query (List.append path [ "MetricStat" ]) v);
      (match x.expression with
      | None -> []
      | Some v -> metric_expression_to_query (List.append path [ "Expression" ]) v);
      (match x.label with
      | None -> []
      | Some v -> metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.return_data with
      | None -> []
      | Some v -> return_data_to_query (List.append path [ "ReturnData" ]) v);
      (match x.period with
      | None -> []
      | Some v -> period_to_query (List.append path [ "Period" ]) v);
      (match x.account_id with
      | None -> []
      | Some v -> account_id_to_query (List.append path [ "AccountId" ]) v);
    ]

let metric_data_queries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_data_query_to_query path xs

let metric_math_anomaly_detector_to_query path (x : metric_math_anomaly_detector) =
  List.concat
    [
      (match x.metric_data_queries with
      | None -> []
      | Some v -> metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) v);
    ]

let anomaly_detector_metric_stat_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let single_metric_anomaly_detector_to_query path (x : single_metric_anomaly_detector) =
  List.concat
    [
      (match x.account_id with
      | None -> []
      | Some v -> account_id_to_query (List.append path [ "AccountId" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.stat with
      | None -> []
      | Some v -> anomaly_detector_metric_stat_to_query (List.append path [ "Stat" ]) v);
    ]

let periodic_spikes_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let metric_characteristics_to_query path (x : metric_characteristics) =
  List.concat
    [
      (match x.periodic_spikes with
      | None -> []
      | Some v -> periodic_spikes_to_query (List.append path [ "PeriodicSpikes" ]) v);
    ]

let anomaly_detector_state_value_to_query path (x : anomaly_detector_state_value) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PENDING_TRAINING -> "PENDING_TRAINING"
    | TRAINED_INSUFFICIENT_DATA -> "TRAINED_INSUFFICIENT_DATA"
    | TRAINED -> "TRAINED")

let anomaly_detector_metric_timezone_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let range_to_query path (x : range) =
  List.concat
    [
      timestamp_to_query (List.append path [ "StartTime" ]) x.start_time;
      timestamp_to_query (List.append path [ "EndTime" ]) x.end_time;
    ]

let anomaly_detector_excluded_time_ranges_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" range_to_query path xs

let anomaly_detector_configuration_to_query path (x : anomaly_detector_configuration) =
  List.concat
    [
      (match x.excluded_time_ranges with
      | None -> []
      | Some v ->
          anomaly_detector_excluded_time_ranges_to_query
            (List.append path [ "ExcludedTimeRanges" ])
            v);
      (match x.metric_timezone with
      | None -> []
      | Some v ->
          anomaly_detector_metric_timezone_to_query (List.append path [ "MetricTimezone" ]) v);
    ]

let anomaly_detector_to_query path (x : anomaly_detector) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.stat with
      | None -> []
      | Some v -> anomaly_detector_metric_stat_to_query (List.append path [ "Stat" ]) v);
      (match x.configuration with
      | None -> []
      | Some v -> anomaly_detector_configuration_to_query (List.append path [ "Configuration" ]) v);
      (match x.state_value with
      | None -> []
      | Some v -> anomaly_detector_state_value_to_query (List.append path [ "StateValue" ]) v);
      (match x.metric_characteristics with
      | None -> []
      | Some v -> metric_characteristics_to_query (List.append path [ "MetricCharacteristics" ]) v);
      (match x.single_metric_anomaly_detector with
      | None -> []
      | Some v ->
          single_metric_anomaly_detector_to_query
            (List.append path [ "SingleMetricAnomalyDetector" ])
            v);
      (match x.metric_math_anomaly_detector with
      | None -> []
      | Some v ->
          metric_math_anomaly_detector_to_query (List.append path [ "MetricMathAnomalyDetector" ]) v);
    ]

let anomaly_detector_type_to_query path (x : anomaly_detector_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SINGLE_METRIC -> "SINGLE_METRIC" | METRIC_MATH -> "METRIC_MATH")

let anomaly_detector_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" anomaly_detector_type_to_query path
    xs

let anomaly_detectors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" anomaly_detector_to_query path xs

let fault_description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let resource_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let resource_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
      (match x.resource_id with
      | None -> []
      | Some v -> resource_id_to_query (List.append path [ "ResourceId" ]) v);
      (match x.message with
      | None -> []
      | Some v -> fault_description_to_query (List.append path [ "Message" ]) v);
    ]

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let kms_key_not_found_exception_to_query path (x : kms_key_not_found_exception) =
  List.concat [ string__to_query (List.append path [ "Message" ]) x.message ]

let kms_key_disabled_exception_to_query path (x : kms_key_disabled_exception) =
  List.concat [ string__to_query (List.append path [ "Message" ]) x.message ]

let kms_access_denied_exception_to_query path (x : kms_access_denied_exception) =
  List.concat [ string__to_query (List.append path [ "Message" ]) x.message ]

let error_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let conflict_exception_to_query path (x : conflict_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let associate_dataset_kms_key_output_to_query path _x = []
let kms_key_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dataset_identifier_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let associate_dataset_kms_key_input_to_query path (x : associate_dataset_kms_key_input) =
  List.concat
    [
      dataset_identifier_to_query (List.append path [ "DatasetIdentifier" ]) x.dataset_identifier;
      kms_key_arn_to_query (List.append path [ "KmsKeyArn" ]) x.kms_key_arn;
    ]

let aws_query_error_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let failure_description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let failure_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let exception_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let failure_resource_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partial_failure_to_query path (x : partial_failure) =
  List.concat
    [
      (match x.failure_resource with
      | None -> []
      | Some v -> failure_resource_to_query (List.append path [ "FailureResource" ]) v);
      (match x.exception_type with
      | None -> []
      | Some v -> exception_type_to_query (List.append path [ "ExceptionType" ]) v);
      (match x.failure_code with
      | None -> []
      | Some v -> failure_code_to_query (List.append path [ "FailureCode" ]) v);
      (match x.failure_description with
      | None -> []
      | Some v -> failure_description_to_query (List.append path [ "FailureDescription" ]) v);
    ]

let batch_failures_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" partial_failure_to_query path xs

let comparison_operator_to_query path (x : comparison_operator) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | GreaterThanOrEqualToThreshold -> "GreaterThanOrEqualToThreshold"
    | GreaterThanThreshold -> "GreaterThanThreshold"
    | LessThanThreshold -> "LessThanThreshold"
    | LessThanOrEqualToThreshold -> "LessThanOrEqualToThreshold"
    | LessThanLowerOrGreaterThanUpperThreshold -> "LessThanLowerOrGreaterThanUpperThreshold"
    | LessThanLowerThreshold -> "LessThanLowerThreshold"
    | GreaterThanUpperThreshold -> "GreaterThanUpperThreshold")

let suppressor_period_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let state_value_to_query path (x : state_value) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with OK -> "OK" | ALARM -> "ALARM" | INSUFFICIENT_DATA -> "INSUFFICIENT_DATA")

let state_reason_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let resource_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_to_query path xs

let composite_alarm_to_query path (x : composite_alarm) =
  List.concat
    [
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.alarm_arn with
      | None -> []
      | Some v -> alarm_arn_to_query (List.append path [ "AlarmArn" ]) v);
      (match x.alarm_configuration_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "AlarmConfigurationUpdatedTimestamp" ]) v);
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      (match x.alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_rule with
      | None -> []
      | Some v -> alarm_rule_to_query (List.append path [ "AlarmRule" ]) v);
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.state_reason with
      | None -> []
      | Some v -> state_reason_to_query (List.append path [ "StateReason" ]) v);
      (match x.state_reason_data with
      | None -> []
      | Some v -> state_reason_data_to_query (List.append path [ "StateReasonData" ]) v);
      (match x.state_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateUpdatedTimestamp" ]) v);
      (match x.state_value with
      | None -> []
      | Some v -> state_value_to_query (List.append path [ "StateValue" ]) v);
      (match x.state_transitioned_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateTransitionedTimestamp" ]) v);
      (match x.actions_suppressed_by with
      | None -> []
      | Some v -> actions_suppressed_by_to_query (List.append path [ "ActionsSuppressedBy" ]) v);
      (match x.actions_suppressed_reason with
      | None -> []
      | Some v ->
          actions_suppressed_reason_to_query (List.append path [ "ActionsSuppressedReason" ]) v);
      (match x.actions_suppressor with
      | None -> []
      | Some v -> alarm_arn_to_query (List.append path [ "ActionsSuppressor" ]) v);
      (match x.actions_suppressor_wait_period with
      | None -> []
      | Some v -> suppressor_period_to_query (List.append path [ "ActionsSuppressorWaitPeriod" ]) v);
      (match x.actions_suppressor_extension_period with
      | None -> []
      | Some v ->
          suppressor_period_to_query (List.append path [ "ActionsSuppressorExtensionPeriod" ]) v);
    ]

let composite_alarms_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" composite_alarm_to_query path xs

let concurrent_modification_exception_to_query path (x : concurrent_modification_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> fault_description_to_query (List.append path [ "Message" ]) v);
    ]

let datapoint_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let counts_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" datapoint_value_to_query path xs

let dashboard_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dashboard_body_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let last_modified_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let dashboard_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let dashboard_entry_to_query path (x : dashboard_entry) =
  List.concat
    [
      (match x.dashboard_name with
      | None -> []
      | Some v -> dashboard_name_to_query (List.append path [ "DashboardName" ]) v);
      (match x.dashboard_arn with
      | None -> []
      | Some v -> dashboard_arn_to_query (List.append path [ "DashboardArn" ]) v);
      (match x.last_modified with
      | None -> []
      | Some v -> last_modified_to_query (List.append path [ "LastModified" ]) v);
      (match x.size with None -> [] | Some v -> size_to_query (List.append path [ "Size" ]) v);
    ]

let dashboard_entries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dashboard_entry_to_query path xs

let dashboard_error_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let data_path_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let dashboard_validation_message_to_query path (x : dashboard_validation_message) =
  List.concat
    [
      (match x.data_path with
      | None -> []
      | Some v -> data_path_to_query (List.append path [ "DataPath" ]) v);
      (match x.message with
      | None -> []
      | Some v -> message_to_query (List.append path [ "Message" ]) v);
    ]

let dashboard_validation_messages_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    dashboard_validation_message_to_query path xs

let dashboard_invalid_input_error_to_query path (x : dashboard_invalid_input_error) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> dashboard_error_message_to_query (List.append path [ "message" ]) v);
      (match x.dashboard_validation_messages with
      | None -> []
      | Some v ->
          dashboard_validation_messages_to_query
            (List.append path [ "dashboardValidationMessages" ])
            v);
    ]

let dashboard_name_prefix_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let dashboard_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dashboard_name_to_query path xs

let dashboard_not_found_error_to_query path (x : dashboard_not_found_error) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> dashboard_error_message_to_query (List.append path [ "message" ]) v);
    ]

let extended_statistic_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let datapoint_value_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" extended_statistic_to_query
    datapoint_value_to_query path pairs

let datapoint_to_query path (x : datapoint) =
  List.concat
    [
      (match x.timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "Timestamp" ]) v);
      (match x.sample_count with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "SampleCount" ]) v);
      (match x.average with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "Average" ]) v);
      (match x.sum with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "Sum" ]) v);
      (match x.minimum with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "Minimum" ]) v);
      (match x.maximum with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "Maximum" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.extended_statistics with
      | None -> []
      | Some v -> datapoint_value_map_to_query (List.append path [ "ExtendedStatistics" ]) v);
    ]

let datapoint_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" datapoint_value_to_query path xs

let datapoints_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" datapoint_to_query path xs

let datapoints_to_alarm_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let dataset_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dataset_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delete_alarm_mute_rule_input_to_query path (x : delete_alarm_mute_rule_input) =
  List.concat [ name_to_query (List.append path [ "AlarmMuteRuleName" ]) x.alarm_mute_rule_name ]

let resource_not_found_to_query path (x : resource_not_found) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let resource_conflict_to_query path (x : resource_conflict) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_alarms_input_to_query path (x : delete_alarms_input) =
  List.concat [ alarm_names_to_query (List.append path [ "AlarmNames" ]) x.alarm_names ]

let missing_required_parameter_exception_to_query path (x : missing_required_parameter_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> aws_query_error_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_parameter_value_exception_to_query path (x : invalid_parameter_value_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> aws_query_error_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_parameter_combination_exception_to_query path
    (x : invalid_parameter_combination_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> aws_query_error_message_to_query (List.append path [ "message" ]) v);
    ]

let internal_service_fault_to_query path (x : internal_service_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> fault_description_to_query (List.append path [ "Message" ]) v);
    ]

let delete_anomaly_detector_output_to_query path _x = []

let delete_anomaly_detector_input_to_query path (x : delete_anomaly_detector_input) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.stat with
      | None -> []
      | Some v -> anomaly_detector_metric_stat_to_query (List.append path [ "Stat" ]) v);
      (match x.single_metric_anomaly_detector with
      | None -> []
      | Some v ->
          single_metric_anomaly_detector_to_query
            (List.append path [ "SingleMetricAnomalyDetector" ])
            v);
      (match x.metric_math_anomaly_detector with
      | None -> []
      | Some v ->
          metric_math_anomaly_detector_to_query (List.append path [ "MetricMathAnomalyDetector" ]) v);
    ]

let delete_dashboards_output_to_query path _x = []

let delete_dashboards_input_to_query path (x : delete_dashboards_input) =
  List.concat [ dashboard_names_to_query (List.append path [ "DashboardNames" ]) x.dashboard_names ]

let delete_insight_rules_output_to_query path (x : delete_insight_rules_output) =
  List.concat
    [
      (match x.failures with
      | None -> []
      | Some v -> batch_failures_to_query (List.append path [ "Failures" ]) v);
    ]

let insight_rule_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" insight_rule_name_to_query path xs

let delete_insight_rules_input_to_query path (x : delete_insight_rules_input) =
  List.concat [ insight_rule_names_to_query (List.append path [ "RuleNames" ]) x.rule_names ]

let delete_metric_stream_output_to_query path _x = []
let metric_stream_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delete_metric_stream_input_to_query path (x : delete_metric_stream_input) =
  List.concat [ metric_stream_name_to_query (List.append path [ "Name" ]) x.name ]

let invalid_next_token_to_query path (x : invalid_next_token) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let describe_alarm_contributors_output_to_query path (x : describe_alarm_contributors_output) =
  List.concat
    [
      alarm_contributors_to_query (List.append path [ "AlarmContributors" ]) x.alarm_contributors;
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_alarm_contributors_input_to_query path (x : describe_alarm_contributors_input) =
  List.concat
    [
      alarm_name_to_query (List.append path [ "AlarmName" ]) x.alarm_name;
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_alarm_history_output_to_query path (x : describe_alarm_history_output) =
  List.concat
    [
      (match x.alarm_history_items with
      | None -> []
      | Some v -> alarm_history_items_to_query (List.append path [ "AlarmHistoryItems" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let scan_by_to_query path (x : scan_by) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | TIMESTAMP_DESCENDING -> "TimestampDescending"
    | TIMESTAMP_ASCENDING -> "TimestampAscending")

let max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_alarm_history_input_to_query path (x : describe_alarm_history_input) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_contributor_id with
      | None -> []
      | Some v -> contributor_id_to_query (List.append path [ "AlarmContributorId" ]) v);
      (match x.alarm_types with
      | None -> []
      | Some v -> alarm_types_to_query (List.append path [ "AlarmTypes" ]) v);
      (match x.history_item_type with
      | None -> []
      | Some v -> history_item_type_to_query (List.append path [ "HistoryItemType" ]) v);
      (match x.start_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartDate" ]) v);
      (match x.end_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndDate" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.scan_by with
      | None -> []
      | Some v -> scan_by_to_query (List.append path [ "ScanBy" ]) v);
    ]

let evaluation_state_to_query path (x : evaluation_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PARTIAL_DATA -> "PARTIAL_DATA"
    | EVALUATION_FAILURE -> "EVALUATION_FAILURE"
    | EVALUATION_ERROR -> "EVALUATION_ERROR")

let treat_missing_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let threshold_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v
let query_results_to_alarm_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let query_results_to_evaluate_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_key_to_query (List.append path [ "Key" ]) x.key;
      tag_value_to_query (List.append path [ "Value" ]) x.value;
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let end_time_offset_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v
let start_time_offset_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v
let schedule_expression_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let schedule_configuration_to_query path (x : schedule_configuration) =
  List.concat
    [
      schedule_expression_to_query (List.append path [ "ScheduleExpression" ]) x.schedule_expression;
      (match x.start_time_offset with
      | None -> []
      | Some v -> start_time_offset_to_query (List.append path [ "StartTimeOffset" ]) v);
      (match x.end_time_offset with
      | None -> []
      | Some v -> end_time_offset_to_query (List.append path [ "EndTimeOffset" ]) v);
    ]

let log_group_identifiers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" amazon_resource_name_to_query path
    xs

let query_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let scheduled_query_configuration_to_query path (x : scheduled_query_configuration) =
  List.concat
    [
      query_string_to_query (List.append path [ "QueryString" ]) x.query_string;
      (match x.log_group_identifiers with
      | None -> []
      | Some v -> log_group_identifiers_to_query (List.append path [ "LogGroupIdentifiers" ]) v);
      (match x.query_ar_n with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "QueryARN" ]) v);
      amazon_resource_name_to_query
        (List.append path [ "ScheduledQueryRoleARN" ])
        x.scheduled_query_role_ar_n;
      schedule_configuration_to_query
        (List.append path [ "ScheduleConfiguration" ])
        x.schedule_configuration;
      aggregation_expression_to_query
        (List.append path [ "AggregationExpression" ])
        x.aggregation_expression;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let log_alarm_to_query path (x : log_alarm) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_arn with
      | None -> []
      | Some v -> alarm_arn_to_query (List.append path [ "AlarmArn" ]) v);
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      (match x.alarm_configuration_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "AlarmConfigurationUpdatedTimestamp" ]) v);
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      (match x.state_value with
      | None -> []
      | Some v -> state_value_to_query (List.append path [ "StateValue" ]) v);
      (match x.state_reason with
      | None -> []
      | Some v -> state_reason_to_query (List.append path [ "StateReason" ]) v);
      (match x.state_reason_data with
      | None -> []
      | Some v -> state_reason_data_to_query (List.append path [ "StateReasonData" ]) v);
      (match x.state_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateUpdatedTimestamp" ]) v);
      (match x.scheduled_query_configuration with
      | None -> []
      | Some v ->
          scheduled_query_configuration_to_query
            (List.append path [ "ScheduledQueryConfiguration" ])
            v);
      (match x.query_results_to_evaluate with
      | None -> []
      | Some v ->
          query_results_to_evaluate_to_query (List.append path [ "QueryResultsToEvaluate" ]) v);
      (match x.query_results_to_alarm with
      | None -> []
      | Some v -> query_results_to_alarm_to_query (List.append path [ "QueryResultsToAlarm" ]) v);
      (match x.threshold with
      | None -> []
      | Some v -> threshold_to_query (List.append path [ "Threshold" ]) v);
      (match x.comparison_operator with
      | None -> []
      | Some v -> comparison_operator_to_query (List.append path [ "ComparisonOperator" ]) v);
      (match x.treat_missing_data with
      | None -> []
      | Some v -> treat_missing_data_to_query (List.append path [ "TreatMissingData" ]) v);
      (match x.state_transitioned_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateTransitionedTimestamp" ]) v);
      (match x.evaluation_state with
      | None -> []
      | Some v -> evaluation_state_to_query (List.append path [ "EvaluationState" ]) v);
      (match x.action_log_line_count with
      | None -> []
      | Some v -> action_log_line_count_to_query (List.append path [ "ActionLogLineCount" ]) v);
      (match x.action_log_line_role_arn with
      | None -> []
      | Some v -> action_log_line_role_arn_to_query (List.append path [ "ActionLogLineRoleArn" ]) v);
    ]

let log_alarms_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" log_alarm_to_query path xs

let evaluation_interval_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let evaluation_criteria_to_query path (x : evaluation_criteria) =
  match x with
  | PromQLCriteria v -> alarm_prom_ql_criteria_to_query (List.append path [ "PromQLCriteria" ]) v

let sliding_window_to_query path _x = []
let timezone_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let wall_clock_window_to_query path (x : wall_clock_window) =
  List.concat
    [
      (match x.timezone with
      | None -> []
      | Some v -> timezone_to_query (List.append path [ "Timezone" ]) v);
    ]

let evaluation_window_to_query path (x : evaluation_window) =
  match x with
  | WallClockWindow v -> wall_clock_window_to_query (List.append path [ "WallClockWindow" ]) v
  | SlidingWindow v -> sliding_window_to_query (List.append path [ "SlidingWindow" ]) v

let evaluate_low_sample_count_percentile_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let evaluation_periods_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let statistic_to_query path (x : statistic) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SampleCount -> "SampleCount"
    | Average -> "Average"
    | Sum -> "Sum"
    | Minimum -> "Minimum"
    | Maximum -> "Maximum")

let metric_alarm_to_query path (x : metric_alarm) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_arn with
      | None -> []
      | Some v -> alarm_arn_to_query (List.append path [ "AlarmArn" ]) v);
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      (match x.alarm_configuration_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "AlarmConfigurationUpdatedTimestamp" ]) v);
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      (match x.state_value with
      | None -> []
      | Some v -> state_value_to_query (List.append path [ "StateValue" ]) v);
      (match x.state_reason with
      | None -> []
      | Some v -> state_reason_to_query (List.append path [ "StateReason" ]) v);
      (match x.state_reason_data with
      | None -> []
      | Some v -> state_reason_data_to_query (List.append path [ "StateReasonData" ]) v);
      (match x.state_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateUpdatedTimestamp" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.statistic with
      | None -> []
      | Some v -> statistic_to_query (List.append path [ "Statistic" ]) v);
      (match x.extended_statistic with
      | None -> []
      | Some v -> extended_statistic_to_query (List.append path [ "ExtendedStatistic" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.period with
      | None -> []
      | Some v -> period_to_query (List.append path [ "Period" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.evaluation_periods with
      | None -> []
      | Some v -> evaluation_periods_to_query (List.append path [ "EvaluationPeriods" ]) v);
      (match x.datapoints_to_alarm with
      | None -> []
      | Some v -> datapoints_to_alarm_to_query (List.append path [ "DatapointsToAlarm" ]) v);
      (match x.threshold with
      | None -> []
      | Some v -> threshold_to_query (List.append path [ "Threshold" ]) v);
      (match x.comparison_operator with
      | None -> []
      | Some v -> comparison_operator_to_query (List.append path [ "ComparisonOperator" ]) v);
      (match x.treat_missing_data with
      | None -> []
      | Some v -> treat_missing_data_to_query (List.append path [ "TreatMissingData" ]) v);
      (match x.evaluate_low_sample_count_percentile with
      | None -> []
      | Some v ->
          evaluate_low_sample_count_percentile_to_query
            (List.append path [ "EvaluateLowSampleCountPercentile" ])
            v);
      (match x.metrics with
      | None -> []
      | Some v -> metric_data_queries_to_query (List.append path [ "Metrics" ]) v);
      (match x.threshold_metric_id with
      | None -> []
      | Some v -> metric_id_to_query (List.append path [ "ThresholdMetricId" ]) v);
      (match x.evaluation_state with
      | None -> []
      | Some v -> evaluation_state_to_query (List.append path [ "EvaluationState" ]) v);
      (match x.state_transitioned_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StateTransitionedTimestamp" ]) v);
      (match x.evaluation_window with
      | None -> []
      | Some v -> evaluation_window_to_query (List.append path [ "EvaluationWindow" ]) v);
      (match x.evaluation_criteria with
      | None -> []
      | Some v -> evaluation_criteria_to_query (List.append path [ "EvaluationCriteria" ]) v);
      (match x.evaluation_interval with
      | None -> []
      | Some v -> evaluation_interval_to_query (List.append path [ "EvaluationInterval" ]) v);
    ]

let metric_alarms_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_alarm_to_query path xs

let describe_alarms_output_to_query path (x : describe_alarms_output) =
  List.concat
    [
      (match x.composite_alarms with
      | None -> []
      | Some v -> composite_alarms_to_query (List.append path [ "CompositeAlarms" ]) v);
      (match x.metric_alarms with
      | None -> []
      | Some v -> metric_alarms_to_query (List.append path [ "MetricAlarms" ]) v);
      (match x.log_alarms with
      | None -> []
      | Some v -> log_alarms_to_query (List.append path [ "LogAlarms" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_alarms_input_to_query path (x : describe_alarms_input) =
  List.concat
    [
      (match x.alarm_names with
      | None -> []
      | Some v -> alarm_names_to_query (List.append path [ "AlarmNames" ]) v);
      (match x.alarm_name_prefix with
      | None -> []
      | Some v -> alarm_name_prefix_to_query (List.append path [ "AlarmNamePrefix" ]) v);
      (match x.alarm_types with
      | None -> []
      | Some v -> alarm_types_to_query (List.append path [ "AlarmTypes" ]) v);
      (match x.children_of_alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "ChildrenOfAlarmName" ]) v);
      (match x.parents_of_alarm_name with
      | None -> []
      | Some v -> alarm_name_to_query (List.append path [ "ParentsOfAlarmName" ]) v);
      (match x.state_value with
      | None -> []
      | Some v -> state_value_to_query (List.append path [ "StateValue" ]) v);
      (match x.action_prefix with
      | None -> []
      | Some v -> action_prefix_to_query (List.append path [ "ActionPrefix" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_alarms_for_metric_output_to_query path (x : describe_alarms_for_metric_output) =
  List.concat
    [
      (match x.metric_alarms with
      | None -> []
      | Some v -> metric_alarms_to_query (List.append path [ "MetricAlarms" ]) v);
    ]

let describe_alarms_for_metric_input_to_query path (x : describe_alarms_for_metric_input) =
  List.concat
    [
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
      namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
      (match x.statistic with
      | None -> []
      | Some v -> statistic_to_query (List.append path [ "Statistic" ]) v);
      (match x.extended_statistic with
      | None -> []
      | Some v -> extended_statistic_to_query (List.append path [ "ExtendedStatistic" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.period with
      | None -> []
      | Some v -> period_to_query (List.append path [ "Period" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
    ]

let describe_anomaly_detectors_output_to_query path (x : describe_anomaly_detectors_output) =
  List.concat
    [
      (match x.anomaly_detectors with
      | None -> []
      | Some v -> anomaly_detectors_to_query (List.append path [ "AnomalyDetectors" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let max_returned_results_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_anomaly_detectors_input_to_query path (x : describe_anomaly_detectors_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_returned_results_count_to_query (List.append path [ "MaxResults" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.anomaly_detector_types with
      | None -> []
      | Some v -> anomaly_detector_types_to_query (List.append path [ "AnomalyDetectorTypes" ]) v);
    ]

let insight_rule_on_transformed_logs_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let insight_rule_is_managed_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let insight_rule_definition_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_schema_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let insight_rule_state_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_to_query path (x : insight_rule) =
  List.concat
    [
      insight_rule_name_to_query (List.append path [ "Name" ]) x.name;
      insight_rule_state_to_query (List.append path [ "State" ]) x.state;
      insight_rule_schema_to_query (List.append path [ "Schema" ]) x.schema;
      insight_rule_definition_to_query (List.append path [ "Definition" ]) x.definition;
      (match x.managed_rule with
      | None -> []
      | Some v -> insight_rule_is_managed_to_query (List.append path [ "ManagedRule" ]) v);
      (match x.apply_on_transformed_logs with
      | None -> []
      | Some v ->
          insight_rule_on_transformed_logs_to_query
            (List.append path [ "ApplyOnTransformedLogs" ])
            v);
    ]

let insight_rules_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" insight_rule_to_query path xs

let describe_insight_rules_output_to_query path (x : describe_insight_rules_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.insight_rules with
      | None -> []
      | Some v -> insight_rules_to_query (List.append path [ "InsightRules" ]) v);
    ]

let insight_rule_max_results_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_insight_rules_input_to_query path (x : describe_insight_rules_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> insight_rule_max_results_to_query (List.append path [ "MaxResults" ]) v);
    ]

let dimension_filter_to_query path (x : dimension_filter) =
  List.concat
    [
      dimension_name_to_query (List.append path [ "Name" ]) x.name;
      (match x.value with
      | None -> []
      | Some v -> dimension_value_to_query (List.append path [ "Value" ]) v);
    ]

let dimension_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dimension_filter_to_query path xs

let disable_alarm_actions_input_to_query path (x : disable_alarm_actions_input) =
  List.concat [ alarm_names_to_query (List.append path [ "AlarmNames" ]) x.alarm_names ]

let disable_insight_rules_output_to_query path (x : disable_insight_rules_output) =
  List.concat
    [
      (match x.failures with
      | None -> []
      | Some v -> batch_failures_to_query (List.append path [ "Failures" ]) v);
    ]

let disable_insight_rules_input_to_query path (x : disable_insight_rules_input) =
  List.concat [ insight_rule_names_to_query (List.append path [ "RuleNames" ]) x.rule_names ]

let disassociate_dataset_kms_key_output_to_query path _x = []

let disassociate_dataset_kms_key_input_to_query path (x : disassociate_dataset_kms_key_input) =
  List.concat
    [ dataset_identifier_to_query (List.append path [ "DatasetIdentifier" ]) x.dataset_identifier ]

let duration_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let enable_alarm_actions_input_to_query path (x : enable_alarm_actions_input) =
  List.concat [ alarm_names_to_query (List.append path [ "AlarmNames" ]) x.alarm_names ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> fault_description_to_query (List.append path [ "Message" ]) v);
    ]

let enable_insight_rules_output_to_query path (x : enable_insight_rules_output) =
  List.concat
    [
      (match x.failures with
      | None -> []
      | Some v -> batch_failures_to_query (List.append path [ "Failures" ]) v);
    ]

let enable_insight_rules_input_to_query path (x : enable_insight_rules_input) =
  List.concat [ insight_rule_names_to_query (List.append path [ "RuleNames" ]) x.rule_names ]

let entity_attributes_map_value_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_attributes_map_key_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    entity_attributes_map_key_string_to_query entity_attributes_map_value_string_to_query path pairs

let entity_key_attributes_map_value_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_key_attributes_map_key_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_key_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    entity_key_attributes_map_key_string_to_query entity_key_attributes_map_value_string_to_query
    path pairs

let entity_to_query path (x : entity) =
  List.concat
    [
      (match x.key_attributes with
      | None -> []
      | Some v -> entity_key_attributes_map_to_query (List.append path [ "KeyAttributes" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> entity_attributes_map_to_query (List.append path [ "Attributes" ]) v);
    ]

let storage_resolution_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" datapoint_value_to_query path xs

let statistic_set_to_query path (x : statistic_set) =
  List.concat
    [
      datapoint_value_to_query (List.append path [ "SampleCount" ]) x.sample_count;
      datapoint_value_to_query (List.append path [ "Sum" ]) x.sum;
      datapoint_value_to_query (List.append path [ "Minimum" ]) x.minimum;
      datapoint_value_to_query (List.append path [ "Maximum" ]) x.maximum;
    ]

let metric_datum_to_query path (x : metric_datum) =
  List.concat
    [
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "Timestamp" ]) v);
      (match x.value with
      | None -> []
      | Some v -> datapoint_value_to_query (List.append path [ "Value" ]) v);
      (match x.statistic_values with
      | None -> []
      | Some v -> statistic_set_to_query (List.append path [ "StatisticValues" ]) v);
      (match x.values with
      | None -> []
      | Some v -> values_to_query (List.append path [ "Values" ]) v);
      (match x.counts with
      | None -> []
      | Some v -> counts_to_query (List.append path [ "Counts" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.storage_resolution with
      | None -> []
      | Some v -> storage_resolution_to_query (List.append path [ "StorageResolution" ]) v);
    ]

let metric_data_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_datum_to_query path xs

let entity_metric_data_to_query path (x : entity_metric_data) =
  List.concat
    [
      (match x.entity with
      | None -> []
      | Some v -> entity_to_query (List.append path [ "Entity" ]) v);
      (match x.metric_data with
      | None -> []
      | Some v -> metric_data_to_query (List.append path [ "MetricData" ]) v);
    ]

let entity_metric_data_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" entity_metric_data_to_query path xs

let expression_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let extended_statistics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" extended_statistic_to_query path xs

let mute_target_alarm_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" name_to_query path xs

let mute_targets_to_query path (x : mute_targets) =
  List.concat
    [ mute_target_alarm_name_list_to_query (List.append path [ "AlarmNames" ]) x.alarm_names ]

let schedule_to_query path (x : schedule) =
  List.concat
    [
      expression_to_query (List.append path [ "Expression" ]) x.expression;
      duration_to_query (List.append path [ "Duration" ]) x.duration;
      (match x.timezone with
      | None -> []
      | Some v -> timezone_to_query (List.append path [ "Timezone" ]) v);
    ]

let rule_to_query path (x : rule) =
  List.concat [ schedule_to_query (List.append path [ "Schedule" ]) x.schedule ]

let get_alarm_mute_rule_output_to_query path (x : get_alarm_mute_rule_output) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> name_to_query (List.append path [ "Name" ]) v);
      (match x.alarm_mute_rule_arn with
      | None -> []
      | Some v -> arn_to_query (List.append path [ "AlarmMuteRuleArn" ]) v);
      (match x.description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "Description" ]) v);
      (match x.rule with None -> [] | Some v -> rule_to_query (List.append path [ "Rule" ]) v);
      (match x.mute_targets with
      | None -> []
      | Some v -> mute_targets_to_query (List.append path [ "MuteTargets" ]) v);
      (match x.start_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartDate" ]) v);
      (match x.expire_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "ExpireDate" ]) v);
      (match x.status with
      | None -> []
      | Some v -> alarm_mute_rule_status_to_query (List.append path [ "Status" ]) v);
      (match x.last_updated_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdatedTimestamp" ]) v);
      (match x.mute_type with
      | None -> []
      | Some v -> mute_type_to_query (List.append path [ "MuteType" ]) v);
    ]

let get_alarm_mute_rule_input_to_query path (x : get_alarm_mute_rule_input) =
  List.concat [ name_to_query (List.append path [ "AlarmMuteRuleName" ]) x.alarm_mute_rule_name ]

let get_dashboard_output_to_query path (x : get_dashboard_output) =
  List.concat
    [
      (match x.dashboard_arn with
      | None -> []
      | Some v -> dashboard_arn_to_query (List.append path [ "DashboardArn" ]) v);
      (match x.dashboard_body with
      | None -> []
      | Some v -> dashboard_body_to_query (List.append path [ "DashboardBody" ]) v);
      (match x.dashboard_name with
      | None -> []
      | Some v -> dashboard_name_to_query (List.append path [ "DashboardName" ]) v);
    ]

let get_dashboard_input_to_query path (x : get_dashboard_input) =
  List.concat [ dashboard_name_to_query (List.append path [ "DashboardName" ]) x.dashboard_name ]

let get_dataset_output_to_query path (x : get_dataset_output) =
  List.concat
    [
      dataset_id_to_query (List.append path [ "DatasetId" ]) x.dataset_id;
      dataset_arn_to_query (List.append path [ "Arn" ]) x.arn;
      (match x.kms_key_arn with
      | None -> []
      | Some v -> kms_key_arn_to_query (List.append path [ "KmsKeyArn" ]) v);
    ]

let get_dataset_input_to_query path (x : get_dataset_input) =
  List.concat
    [ dataset_identifier_to_query (List.append path [ "DatasetIdentifier" ]) x.dataset_identifier ]

let insight_rule_unbound_double_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let insight_rule_metric_datapoint_to_query path (x : insight_rule_metric_datapoint) =
  List.concat
    [
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      (match x.unique_contributors with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "UniqueContributors" ]) v);
      (match x.max_contributor_value with
      | None -> []
      | Some v ->
          insight_rule_unbound_double_to_query (List.append path [ "MaxContributorValue" ]) v);
      (match x.sample_count with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "SampleCount" ]) v);
      (match x.average with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "Average" ]) v);
      (match x.sum with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "Sum" ]) v);
      (match x.minimum with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "Minimum" ]) v);
      (match x.maximum with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "Maximum" ]) v);
    ]

let insight_rule_metric_datapoints_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    insight_rule_metric_datapoint_to_query path xs

let insight_rule_contributor_datapoint_to_query path (x : insight_rule_contributor_datapoint) =
  List.concat
    [
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      insight_rule_unbound_double_to_query
        (List.append path [ "ApproximateValue" ])
        x.approximate_value;
    ]

let insight_rule_contributor_datapoints_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    insight_rule_contributor_datapoint_to_query path xs

let insight_rule_contributor_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_contributor_keys_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    insight_rule_contributor_key_to_query path xs

let insight_rule_contributor_to_query path (x : insight_rule_contributor) =
  List.concat
    [
      insight_rule_contributor_keys_to_query (List.append path [ "Keys" ]) x.keys;
      insight_rule_unbound_double_to_query
        (List.append path [ "ApproximateAggregateValue" ])
        x.approximate_aggregate_value;
      insight_rule_contributor_datapoints_to_query (List.append path [ "Datapoints" ]) x.datapoints;
    ]

let insight_rule_contributors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" insight_rule_contributor_to_query
    path xs

let insight_rule_unbound_long_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let insight_rule_aggregation_statistic_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_contributor_key_label_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_contributor_key_labels_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    insight_rule_contributor_key_label_to_query path xs

let get_insight_rule_report_output_to_query path (x : get_insight_rule_report_output) =
  List.concat
    [
      (match x.key_labels with
      | None -> []
      | Some v -> insight_rule_contributor_key_labels_to_query (List.append path [ "KeyLabels" ]) v);
      (match x.aggregation_statistic with
      | None -> []
      | Some v ->
          insight_rule_aggregation_statistic_to_query
            (List.append path [ "AggregationStatistic" ])
            v);
      (match x.aggregate_value with
      | None -> []
      | Some v -> insight_rule_unbound_double_to_query (List.append path [ "AggregateValue" ]) v);
      (match x.approximate_unique_count with
      | None -> []
      | Some v ->
          insight_rule_unbound_long_to_query (List.append path [ "ApproximateUniqueCount" ]) v);
      (match x.contributors with
      | None -> []
      | Some v -> insight_rule_contributors_to_query (List.append path [ "Contributors" ]) v);
      (match x.metric_datapoints with
      | None -> []
      | Some v ->
          insight_rule_metric_datapoints_to_query (List.append path [ "MetricDatapoints" ]) v);
    ]

let insight_rule_order_by_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_metric_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let insight_rule_metric_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" insight_rule_metric_name_to_query
    path xs

let insight_rule_unbound_integer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let get_insight_rule_report_input_to_query path (x : get_insight_rule_report_input) =
  List.concat
    [
      insight_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      timestamp_to_query (List.append path [ "StartTime" ]) x.start_time;
      timestamp_to_query (List.append path [ "EndTime" ]) x.end_time;
      period_to_query (List.append path [ "Period" ]) x.period;
      (match x.max_contributor_count with
      | None -> []
      | Some v ->
          insight_rule_unbound_integer_to_query (List.append path [ "MaxContributorCount" ]) v);
      (match x.metrics with
      | None -> []
      | Some v -> insight_rule_metric_list_to_query (List.append path [ "Metrics" ]) v);
      (match x.order_by with
      | None -> []
      | Some v -> insight_rule_order_by_to_query (List.append path [ "OrderBy" ]) v);
    ]

let message_data_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_data_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let message_data_to_query path (x : message_data) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> message_data_code_to_query (List.append path [ "Code" ]) v);
      (match x.value with
      | None -> []
      | Some v -> message_data_value_to_query (List.append path [ "Value" ]) v);
    ]

let metric_data_result_messages_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" message_data_to_query path xs

let status_code_to_query path (x : status_code) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | COMPLETE -> "Complete"
    | INTERNAL_ERROR -> "InternalError"
    | PARTIAL_DATA -> "PartialData"
    | FORBIDDEN -> "Forbidden")

let timestamps_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" timestamp_to_query path xs

let metric_data_result_to_query path (x : metric_data_result) =
  List.concat
    [
      (match x.id with None -> [] | Some v -> metric_id_to_query (List.append path [ "Id" ]) v);
      (match x.label with
      | None -> []
      | Some v -> metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.timestamps with
      | None -> []
      | Some v -> timestamps_to_query (List.append path [ "Timestamps" ]) v);
      (match x.values with
      | None -> []
      | Some v -> datapoint_values_to_query (List.append path [ "Values" ]) v);
      (match x.status_code with
      | None -> []
      | Some v -> status_code_to_query (List.append path [ "StatusCode" ]) v);
      (match x.messages with
      | None -> []
      | Some v -> metric_data_result_messages_to_query (List.append path [ "Messages" ]) v);
    ]

let metric_data_results_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_data_result_to_query path xs

let get_metric_data_output_to_query path (x : get_metric_data_output) =
  List.concat
    [
      (match x.metric_data_results with
      | None -> []
      | Some v -> metric_data_results_to_query (List.append path [ "MetricDataResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.messages with
      | None -> []
      | Some v -> metric_data_result_messages_to_query (List.append path [ "Messages" ]) v);
    ]

let get_metric_data_label_timezone_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let label_options_to_query path (x : label_options) =
  List.concat
    [
      (match x.timezone with
      | None -> []
      | Some v -> get_metric_data_label_timezone_to_query (List.append path [ "Timezone" ]) v);
    ]

let get_metric_data_max_datapoints_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let get_metric_data_input_to_query path (x : get_metric_data_input) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
      timestamp_to_query (List.append path [ "StartTime" ]) x.start_time;
      timestamp_to_query (List.append path [ "EndTime" ]) x.end_time;
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.scan_by with
      | None -> []
      | Some v -> scan_by_to_query (List.append path [ "ScanBy" ]) v);
      (match x.max_datapoints with
      | None -> []
      | Some v -> get_metric_data_max_datapoints_to_query (List.append path [ "MaxDatapoints" ]) v);
      (match x.label_options with
      | None -> []
      | Some v -> label_options_to_query (List.append path [ "LabelOptions" ]) v);
    ]

let get_metric_statistics_output_to_query path (x : get_metric_statistics_output) =
  List.concat
    [
      (match x.label with
      | None -> []
      | Some v -> metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.datapoints with
      | None -> []
      | Some v -> datapoints_to_query (List.append path [ "Datapoints" ]) v);
    ]

let statistics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" statistic_to_query path xs

let get_metric_statistics_input_to_query path (x : get_metric_statistics_input) =
  List.concat
    [
      namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      timestamp_to_query (List.append path [ "StartTime" ]) x.start_time;
      timestamp_to_query (List.append path [ "EndTime" ]) x.end_time;
      period_to_query (List.append path [ "Period" ]) x.period;
      (match x.statistics with
      | None -> []
      | Some v -> statistics_to_query (List.append path [ "Statistics" ]) v);
      (match x.extended_statistics with
      | None -> []
      | Some v -> extended_statistics_to_query (List.append path [ "ExtendedStatistics" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
    ]

let include_linked_accounts_metrics_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let metric_stream_statistic_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_stream_statistics_additional_statistics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_stream_statistic_to_query
    path xs

let metric_stream_statistics_metric_to_query path (x : metric_stream_statistics_metric) =
  List.concat
    [
      namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
    ]

let metric_stream_statistics_include_metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    metric_stream_statistics_metric_to_query path xs

let metric_stream_statistics_configuration_to_query path
    (x : metric_stream_statistics_configuration) =
  List.concat
    [
      metric_stream_statistics_include_metrics_to_query
        (List.append path [ "IncludeMetrics" ])
        x.include_metrics;
      metric_stream_statistics_additional_statistics_to_query
        (List.append path [ "AdditionalStatistics" ])
        x.additional_statistics;
    ]

let metric_stream_statistics_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    metric_stream_statistics_configuration_to_query path xs

let metric_stream_output_format_to_query path (x : metric_stream_output_format) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | JSON -> "json"
    | OPEN_TELEMETRY_0_7 -> "opentelemetry0.7"
    | OPEN_TELEMETRY_1_0 -> "opentelemetry1.0")

let metric_stream_state_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_stream_filter_metric_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_name_to_query path xs

let metric_stream_filter_to_query path (x : metric_stream_filter) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_names with
      | None -> []
      | Some v -> metric_stream_filter_metric_names_to_query (List.append path [ "MetricNames" ]) v);
    ]

let metric_stream_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_stream_filter_to_query path
    xs

let get_metric_stream_output_to_query path (x : get_metric_stream_output) =
  List.concat
    [
      (match x.arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "Arn" ]) v);
      (match x.name with
      | None -> []
      | Some v -> metric_stream_name_to_query (List.append path [ "Name" ]) v);
      (match x.include_filters with
      | None -> []
      | Some v -> metric_stream_filters_to_query (List.append path [ "IncludeFilters" ]) v);
      (match x.exclude_filters with
      | None -> []
      | Some v -> metric_stream_filters_to_query (List.append path [ "ExcludeFilters" ]) v);
      (match x.firehose_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "FirehoseArn" ]) v);
      (match x.role_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "RoleArn" ]) v);
      (match x.state with
      | None -> []
      | Some v -> metric_stream_state_to_query (List.append path [ "State" ]) v);
      (match x.creation_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreationDate" ]) v);
      (match x.last_update_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdateDate" ]) v);
      (match x.output_format with
      | None -> []
      | Some v -> metric_stream_output_format_to_query (List.append path [ "OutputFormat" ]) v);
      (match x.statistics_configurations with
      | None -> []
      | Some v ->
          metric_stream_statistics_configurations_to_query
            (List.append path [ "StatisticsConfigurations" ])
            v);
      (match x.include_linked_accounts_metrics with
      | None -> []
      | Some v ->
          include_linked_accounts_metrics_to_query
            (List.append path [ "IncludeLinkedAccountsMetrics" ])
            v);
    ]

let get_metric_stream_input_to_query path (x : get_metric_stream_input) =
  List.concat [ metric_stream_name_to_query (List.append path [ "Name" ]) x.name ]

let metric_widget_image_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let get_metric_widget_image_output_to_query path (x : get_metric_widget_image_output) =
  List.concat
    [
      (match x.metric_widget_image with
      | None -> []
      | Some v -> metric_widget_image_to_query (List.append path [ "MetricWidgetImage" ]) v);
    ]

let output_format_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let metric_widget_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_metric_widget_image_input_to_query path (x : get_metric_widget_image_input) =
  List.concat
    [
      metric_widget_to_query (List.append path [ "MetricWidget" ]) x.metric_widget;
      (match x.output_format with
      | None -> []
      | Some v -> output_format_to_query (List.append path [ "OutputFormat" ]) v);
    ]

let o_tel_enrichment_status_to_query path (x : o_tel_enrichment_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RUNNING -> "Running" | STOPPED -> "Stopped")

let get_o_tel_enrichment_output_to_query path (x : get_o_tel_enrichment_output) =
  List.concat [ o_tel_enrichment_status_to_query (List.append path [ "Status" ]) x.status ]

let get_o_tel_enrichment_input_to_query path _x = []
let untag_resource_output_to_query path _x = []

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let untag_resource_input_to_query path (x : untag_resource_input) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) x.resource_ar_n;
      tag_key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
    ]

let tag_resource_output_to_query path _x = []

let tag_resource_input_to_query path (x : tag_resource_input) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) x.resource_ar_n;
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let stop_o_tel_enrichment_output_to_query path _x = []
let stop_o_tel_enrichment_input_to_query path _x = []
let stop_metric_streams_output_to_query path _x = []

let metric_stream_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_stream_name_to_query path xs

let stop_metric_streams_input_to_query path (x : stop_metric_streams_input) =
  List.concat [ metric_stream_names_to_query (List.append path [ "Names" ]) x.names ]

let start_o_tel_enrichment_output_to_query path _x = []
let start_o_tel_enrichment_input_to_query path _x = []
let start_metric_streams_output_to_query path _x = []

let start_metric_streams_input_to_query path (x : start_metric_streams_input) =
  List.concat [ metric_stream_names_to_query (List.append path [ "Names" ]) x.names ]

let invalid_format_fault_to_query path (x : invalid_format_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let set_alarm_state_input_to_query path (x : set_alarm_state_input) =
  List.concat
    [
      alarm_name_to_query (List.append path [ "AlarmName" ]) x.alarm_name;
      state_value_to_query (List.append path [ "StateValue" ]) x.state_value;
      state_reason_to_query (List.append path [ "StateReason" ]) x.state_reason;
      (match x.state_reason_data with
      | None -> []
      | Some v -> state_reason_data_to_query (List.append path [ "StateReasonData" ]) v);
    ]

let put_metric_stream_output_to_query path (x : put_metric_stream_output) =
  List.concat
    [
      (match x.arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "Arn" ]) v);
    ]

let put_metric_stream_input_to_query path (x : put_metric_stream_input) =
  List.concat
    [
      metric_stream_name_to_query (List.append path [ "Name" ]) x.name;
      (match x.include_filters with
      | None -> []
      | Some v -> metric_stream_filters_to_query (List.append path [ "IncludeFilters" ]) v);
      (match x.exclude_filters with
      | None -> []
      | Some v -> metric_stream_filters_to_query (List.append path [ "ExcludeFilters" ]) v);
      amazon_resource_name_to_query (List.append path [ "FirehoseArn" ]) x.firehose_arn;
      amazon_resource_name_to_query (List.append path [ "RoleArn" ]) x.role_arn;
      metric_stream_output_format_to_query (List.append path [ "OutputFormat" ]) x.output_format;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.statistics_configurations with
      | None -> []
      | Some v ->
          metric_stream_statistics_configurations_to_query
            (List.append path [ "StatisticsConfigurations" ])
            v);
      (match x.include_linked_accounts_metrics with
      | None -> []
      | Some v ->
          include_linked_accounts_metrics_to_query
            (List.append path [ "IncludeLinkedAccountsMetrics" ])
            v);
    ]

let strict_entity_validation_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let put_metric_data_input_to_query path (x : put_metric_data_input) =
  List.concat
    [
      namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
      (match x.metric_data with
      | None -> []
      | Some v -> metric_data_to_query (List.append path [ "MetricData" ]) v);
      (match x.entity_metric_data with
      | None -> []
      | Some v -> entity_metric_data_list_to_query (List.append path [ "EntityMetricData" ]) v);
      (match x.strict_entity_validation with
      | None -> []
      | Some v ->
          strict_entity_validation_to_query (List.append path [ "StrictEntityValidation" ]) v);
    ]

let limit_exceeded_fault_to_query path (x : limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let put_metric_alarm_input_to_query path (x : put_metric_alarm_input) =
  List.concat
    [
      alarm_name_to_query (List.append path [ "AlarmName" ]) x.alarm_name;
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.statistic with
      | None -> []
      | Some v -> statistic_to_query (List.append path [ "Statistic" ]) v);
      (match x.extended_statistic with
      | None -> []
      | Some v -> extended_statistic_to_query (List.append path [ "ExtendedStatistic" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.period with
      | None -> []
      | Some v -> period_to_query (List.append path [ "Period" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> standard_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.evaluation_periods with
      | None -> []
      | Some v -> evaluation_periods_to_query (List.append path [ "EvaluationPeriods" ]) v);
      (match x.datapoints_to_alarm with
      | None -> []
      | Some v -> datapoints_to_alarm_to_query (List.append path [ "DatapointsToAlarm" ]) v);
      (match x.threshold with
      | None -> []
      | Some v -> threshold_to_query (List.append path [ "Threshold" ]) v);
      (match x.comparison_operator with
      | None -> []
      | Some v -> comparison_operator_to_query (List.append path [ "ComparisonOperator" ]) v);
      (match x.treat_missing_data with
      | None -> []
      | Some v -> treat_missing_data_to_query (List.append path [ "TreatMissingData" ]) v);
      (match x.evaluate_low_sample_count_percentile with
      | None -> []
      | Some v ->
          evaluate_low_sample_count_percentile_to_query
            (List.append path [ "EvaluateLowSampleCountPercentile" ])
            v);
      (match x.metrics with
      | None -> []
      | Some v -> metric_data_queries_to_query (List.append path [ "Metrics" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.threshold_metric_id with
      | None -> []
      | Some v -> metric_id_to_query (List.append path [ "ThresholdMetricId" ]) v);
      (match x.evaluation_window with
      | None -> []
      | Some v -> evaluation_window_to_query (List.append path [ "EvaluationWindow" ]) v);
      (match x.evaluation_criteria with
      | None -> []
      | Some v -> evaluation_criteria_to_query (List.append path [ "EvaluationCriteria" ]) v);
      (match x.evaluation_interval with
      | None -> []
      | Some v -> evaluation_interval_to_query (List.append path [ "EvaluationInterval" ]) v);
    ]

let put_managed_insight_rules_output_to_query path (x : put_managed_insight_rules_output) =
  List.concat
    [
      (match x.failures with
      | None -> []
      | Some v -> batch_failures_to_query (List.append path [ "Failures" ]) v);
    ]

let template_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let managed_rule_to_query path (x : managed_rule) =
  List.concat
    [
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
      amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) x.resource_ar_n;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let managed_rules_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" managed_rule_to_query path xs

let put_managed_insight_rules_input_to_query path (x : put_managed_insight_rules_input) =
  List.concat [ managed_rules_to_query (List.append path [ "ManagedRules" ]) x.managed_rules ]

let put_log_alarm_input_to_query path (x : put_log_alarm_input) =
  List.concat
    [
      alarm_name_to_query (List.append path [ "AlarmName" ]) x.alarm_name;
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      scheduled_query_configuration_to_query
        (List.append path [ "ScheduledQueryConfiguration" ])
        x.scheduled_query_configuration;
      (match x.action_log_line_count with
      | None -> []
      | Some v -> action_log_line_count_to_query (List.append path [ "ActionLogLineCount" ]) v);
      (match x.action_log_line_role_arn with
      | None -> []
      | Some v -> action_log_line_role_arn_to_query (List.append path [ "ActionLogLineRoleArn" ]) v);
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      query_results_to_evaluate_to_query
        (List.append path [ "QueryResultsToEvaluate" ])
        x.query_results_to_evaluate;
      query_results_to_alarm_to_query
        (List.append path [ "QueryResultsToAlarm" ])
        x.query_results_to_alarm;
      threshold_to_query (List.append path [ "Threshold" ]) x.threshold;
      comparison_operator_to_query (List.append path [ "ComparisonOperator" ]) x.comparison_operator;
      (match x.treat_missing_data with
      | None -> []
      | Some v -> treat_missing_data_to_query (List.append path [ "TreatMissingData" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let put_insight_rule_output_to_query path _x = []

let put_insight_rule_input_to_query path (x : put_insight_rule_input) =
  List.concat
    [
      insight_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      (match x.rule_state with
      | None -> []
      | Some v -> insight_rule_state_to_query (List.append path [ "RuleState" ]) v);
      insight_rule_definition_to_query (List.append path [ "RuleDefinition" ]) x.rule_definition;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.apply_on_transformed_logs with
      | None -> []
      | Some v ->
          insight_rule_on_transformed_logs_to_query
            (List.append path [ "ApplyOnTransformedLogs" ])
            v);
    ]

let put_dashboard_output_to_query path (x : put_dashboard_output) =
  List.concat
    [
      (match x.dashboard_validation_messages with
      | None -> []
      | Some v ->
          dashboard_validation_messages_to_query
            (List.append path [ "DashboardValidationMessages" ])
            v);
    ]

let put_dashboard_input_to_query path (x : put_dashboard_input) =
  List.concat
    [
      dashboard_name_to_query (List.append path [ "DashboardName" ]) x.dashboard_name;
      dashboard_body_to_query (List.append path [ "DashboardBody" ]) x.dashboard_body;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let put_composite_alarm_input_to_query path (x : put_composite_alarm_input) =
  List.concat
    [
      (match x.actions_enabled with
      | None -> []
      | Some v -> actions_enabled_to_query (List.append path [ "ActionsEnabled" ]) v);
      (match x.alarm_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "AlarmActions" ]) v);
      (match x.alarm_description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "AlarmDescription" ]) v);
      alarm_name_to_query (List.append path [ "AlarmName" ]) x.alarm_name;
      alarm_rule_to_query (List.append path [ "AlarmRule" ]) x.alarm_rule;
      (match x.insufficient_data_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "InsufficientDataActions" ]) v);
      (match x.ok_actions with
      | None -> []
      | Some v -> resource_list_to_query (List.append path [ "OKActions" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.actions_suppressor with
      | None -> []
      | Some v -> alarm_arn_to_query (List.append path [ "ActionsSuppressor" ]) v);
      (match x.actions_suppressor_wait_period with
      | None -> []
      | Some v -> suppressor_period_to_query (List.append path [ "ActionsSuppressorWaitPeriod" ]) v);
      (match x.actions_suppressor_extension_period with
      | None -> []
      | Some v ->
          suppressor_period_to_query (List.append path [ "ActionsSuppressorExtensionPeriod" ]) v);
    ]

let put_anomaly_detector_output_to_query path _x = []

let put_anomaly_detector_input_to_query path (x : put_anomaly_detector_input) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.stat with
      | None -> []
      | Some v -> anomaly_detector_metric_stat_to_query (List.append path [ "Stat" ]) v);
      (match x.configuration with
      | None -> []
      | Some v -> anomaly_detector_configuration_to_query (List.append path [ "Configuration" ]) v);
      (match x.metric_characteristics with
      | None -> []
      | Some v -> metric_characteristics_to_query (List.append path [ "MetricCharacteristics" ]) v);
      (match x.single_metric_anomaly_detector with
      | None -> []
      | Some v ->
          single_metric_anomaly_detector_to_query
            (List.append path [ "SingleMetricAnomalyDetector" ])
            v);
      (match x.metric_math_anomaly_detector with
      | None -> []
      | Some v ->
          metric_math_anomaly_detector_to_query (List.append path [ "MetricMathAnomalyDetector" ]) v);
    ]

let put_alarm_mute_rule_input_to_query path (x : put_alarm_mute_rule_input) =
  List.concat
    [
      name_to_query (List.append path [ "Name" ]) x.name;
      (match x.description with
      | None -> []
      | Some v -> alarm_description_to_query (List.append path [ "Description" ]) v);
      rule_to_query (List.append path [ "Rule" ]) x.rule;
      (match x.mute_targets with
      | None -> []
      | Some v -> mute_targets_to_query (List.append path [ "MuteTargets" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.start_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartDate" ]) v);
      (match x.expire_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "ExpireDate" ]) v);
    ]

let list_tags_for_resource_output_to_query path (x : list_tags_for_resource_output) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let list_tags_for_resource_input_to_query path (x : list_tags_for_resource_input) =
  List.concat [ amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) x.resource_ar_n ]

let metric_stream_entry_to_query path (x : metric_stream_entry) =
  List.concat
    [
      (match x.arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "Arn" ]) v);
      (match x.creation_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreationDate" ]) v);
      (match x.last_update_date with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdateDate" ]) v);
      (match x.name with
      | None -> []
      | Some v -> metric_stream_name_to_query (List.append path [ "Name" ]) v);
      (match x.firehose_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "FirehoseArn" ]) v);
      (match x.state with
      | None -> []
      | Some v -> metric_stream_state_to_query (List.append path [ "State" ]) v);
      (match x.output_format with
      | None -> []
      | Some v -> metric_stream_output_format_to_query (List.append path [ "OutputFormat" ]) v);
    ]

let metric_stream_entries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_stream_entry_to_query path xs

let list_metric_streams_output_to_query path (x : list_metric_streams_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.entries with
      | None -> []
      | Some v -> metric_stream_entries_to_query (List.append path [ "Entries" ]) v);
    ]

let list_metric_streams_max_results_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_metric_streams_input_to_query path (x : list_metric_streams_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> list_metric_streams_max_results_to_query (List.append path [ "MaxResults" ]) v);
    ]

let owning_accounts_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" account_id_to_query path xs

let metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_to_query path xs

let list_metrics_output_to_query path (x : list_metrics_output) =
  List.concat
    [
      (match x.metrics with
      | None -> []
      | Some v -> metrics_to_query (List.append path [ "Metrics" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.owning_accounts with
      | None -> []
      | Some v -> owning_accounts_to_query (List.append path [ "OwningAccounts" ]) v);
    ]

let include_linked_accounts_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let recently_active_to_query path (x : recently_active) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with PT3H -> "PT3H")

let list_metrics_input_to_query path (x : list_metrics_input) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> dimension_filters_to_query (List.append path [ "Dimensions" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.recently_active with
      | None -> []
      | Some v -> recently_active_to_query (List.append path [ "RecentlyActive" ]) v);
      (match x.include_linked_accounts with
      | None -> []
      | Some v -> include_linked_accounts_to_query (List.append path [ "IncludeLinkedAccounts" ]) v);
      (match x.owning_account with
      | None -> []
      | Some v -> account_id_to_query (List.append path [ "OwningAccount" ]) v);
    ]

let managed_rule_state_to_query path (x : managed_rule_state) =
  List.concat
    [
      insight_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      insight_rule_state_to_query (List.append path [ "State" ]) x.state;
    ]

let managed_rule_description_to_query path (x : managed_rule_description) =
  List.concat
    [
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.resource_ar_n with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) v);
      (match x.rule_state with
      | None -> []
      | Some v -> managed_rule_state_to_query (List.append path [ "RuleState" ]) v);
    ]

let managed_rule_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" managed_rule_description_to_query
    path xs

let list_managed_insight_rules_output_to_query path (x : list_managed_insight_rules_output) =
  List.concat
    [
      (match x.managed_rules with
      | None -> []
      | Some v -> managed_rule_descriptions_to_query (List.append path [ "ManagedRules" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_managed_insight_rules_input_to_query path (x : list_managed_insight_rules_input) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "ResourceARN" ]) x.resource_ar_n;
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> insight_rule_max_results_to_query (List.append path [ "MaxResults" ]) v);
    ]

let list_dashboards_output_to_query path (x : list_dashboards_output) =
  List.concat
    [
      (match x.dashboard_entries with
      | None -> []
      | Some v -> dashboard_entries_to_query (List.append path [ "DashboardEntries" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_dashboards_input_to_query path (x : list_dashboards_input) =
  List.concat
    [
      (match x.dashboard_name_prefix with
      | None -> []
      | Some v -> dashboard_name_prefix_to_query (List.append path [ "DashboardNamePrefix" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_alarm_mute_rules_output_to_query path (x : list_alarm_mute_rules_output) =
  List.concat
    [
      (match x.alarm_mute_rule_summaries with
      | None -> []
      | Some v ->
          alarm_mute_rule_summaries_to_query (List.append path [ "AlarmMuteRuleSummaries" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_alarm_mute_rules_input_to_query path (x : list_alarm_mute_rules_input) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> name_to_query (List.append path [ "AlarmName" ]) v);
      (match x.statuses with
      | None -> []
      | Some v -> alarm_mute_rule_statuses_to_query (List.append path [ "Statuses" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]
