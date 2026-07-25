open Types

let unit_of_xml _ = ()
let account_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let action_log_line_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let action_log_line_role_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let action_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let actions_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let actions_suppressed_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "WaitPeriod" -> WaitPeriod
   | "ExtensionPeriod" -> ExtensionPeriod
   | "Alarm" -> Alarm
   | _ -> failwith "unknown enum value"
    : actions_suppressed_by)

let actions_suppressed_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let aggregation_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let alarm_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let state_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let contributor_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> attribute_name_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> attribute_value_of_xml i) ()
      in
      (k, v))
    ()

let contributor_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_contributor_of_xml i =
  let r_contributor_id = ref None in
  let r_contributor_attributes = ref None in
  let r_state_reason = ref None in
  let r_state_transitioned_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ContributorId"; "ContributorAttributes"; "StateReason"; "StateTransitionedTimestamp" ]
    (fun tag _ ->
      match tag with
      | "ContributorId" ->
          r_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | "ContributorAttributes" ->
          r_contributor_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContributorAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     contributor_id = Smaws_Lib.Xml.Parse.required "ContributorId" (( ! ) r_contributor_id) i;
     contributor_attributes =
       Smaws_Lib.Xml.Parse.required "ContributorAttributes" (( ! ) r_contributor_attributes) i;
     state_reason = Smaws_Lib.Xml.Parse.required "StateReason" (( ! ) r_state_reason) i;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
   }
    : alarm_contributor)

let alarm_contributors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_contributor_of_xml i) ()

let alarm_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let history_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let history_summary_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let history_item_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ConfigurationUpdate" -> ConfigurationUpdate
   | "StateUpdate" -> StateUpdate
   | "Action" -> Action
   | "AlarmContributorStateUpdate" -> AlarmContributorStateUpdate
   | "AlarmContributorAction" -> AlarmContributorAction
   | _ -> failwith "unknown enum value"
    : history_item_type)

let alarm_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CompositeAlarm" -> CompositeAlarm
   | "MetricAlarm" -> MetricAlarm
   | "LogAlarm" -> LogAlarm
   | _ -> failwith "unknown enum value"
    : alarm_type)

let alarm_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_history_item_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_contributor_id = ref None in
  let r_alarm_type = ref None in
  let r_timestamp = ref None in
  let r_history_item_type = ref None in
  let r_history_summary = ref None in
  let r_history_data = ref None in
  let r_alarm_contributor_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmContributorId";
      "AlarmType";
      "Timestamp";
      "HistoryItemType";
      "HistorySummary";
      "HistoryData";
      "AlarmContributorAttributes";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmContributorId" ->
          r_alarm_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | "AlarmType" ->
          r_alarm_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmType" (fun i _ -> alarm_type_of_xml i) ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "HistoryItemType" ->
          r_history_item_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryItemType"
                 (fun i _ -> history_item_type_of_xml i)
                 ())
      | "HistorySummary" ->
          r_history_summary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistorySummary"
                 (fun i _ -> history_summary_of_xml i)
                 ())
      | "HistoryData" ->
          r_history_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryData"
                 (fun i _ -> history_data_of_xml i)
                 ())
      | "AlarmContributorAttributes" ->
          r_alarm_contributor_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributorAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = ( ! ) r_alarm_name;
     alarm_contributor_id = ( ! ) r_alarm_contributor_id;
     alarm_type = ( ! ) r_alarm_type;
     timestamp = ( ! ) r_timestamp;
     history_item_type = ( ! ) r_history_item_type;
     history_summary = ( ! ) r_history_summary;
     history_data = ( ! ) r_history_data;
     alarm_contributor_attributes = ( ! ) r_alarm_contributor_attributes;
   }
    : alarm_history_item)

let alarm_history_items_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_history_item_of_xml i) ()

let alarm_mute_rule_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SCHEDULED" -> SCHEDULED
   | "ACTIVE" -> ACTIVE
   | "EXPIRED" -> EXPIRED
   | _ -> failwith "unknown enum value"
    : alarm_mute_rule_status)

let alarm_mute_rule_statuses_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_mute_rule_status_of_xml i) ()

let mute_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_mute_rule_summary_of_xml i =
  let r_alarm_mute_rule_arn = ref None in
  let r_expire_date = ref None in
  let r_status = ref None in
  let r_mute_type = ref None in
  let r_last_updated_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AlarmMuteRuleArn"; "ExpireDate"; "Status"; "MuteType"; "LastUpdatedTimestamp" ] (fun tag _ ->
      match tag with
      | "AlarmMuteRuleArn" ->
          r_alarm_mute_rule_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleArn" (fun i _ -> arn_of_xml i) ())
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> alarm_mute_rule_status_of_xml i)
                 ())
      | "MuteType" ->
          r_mute_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MuteType" (fun i _ -> mute_type_of_xml i) ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_mute_rule_arn = ( ! ) r_alarm_mute_rule_arn;
     expire_date = ( ! ) r_expire_date;
     status = ( ! ) r_status;
     mute_type = ( ! ) r_mute_type;
     last_updated_timestamp = ( ! ) r_last_updated_timestamp;
   }
    : alarm_mute_rule_summary)

let alarm_mute_rule_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_mute_rule_summary_of_xml i) ()

let alarm_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ()

let recovery_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let pending_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let query_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_prom_ql_criteria_of_xml i =
  let r_query = ref None in
  let r_pending_period = ref None in
  let r_recovery_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Query"; "PendingPeriod"; "RecoveryPeriod" ]
    (fun tag _ ->
      match tag with
      | "Query" ->
          r_query :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Query" (fun i _ -> query_of_xml i) ())
      | "PendingPeriod" ->
          r_pending_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingPeriod"
                 (fun i _ -> pending_period_of_xml i)
                 ())
      | "RecoveryPeriod" ->
          r_recovery_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecoveryPeriod"
                 (fun i _ -> recovery_period_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     query = Smaws_Lib.Xml.Parse.required "Query" (( ! ) r_query) i;
     pending_period = ( ! ) r_pending_period;
     recovery_period = ( ! ) r_recovery_period;
   }
    : alarm_prom_ql_criteria)

let alarm_rule_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ()

let amazon_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let return_data_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metric_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let standard_unit_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Seconds" -> Seconds
   | "Microseconds" -> Microseconds
   | "Milliseconds" -> Milliseconds
   | "Bytes" -> Bytes
   | "Kilobytes" -> Kilobytes
   | "Megabytes" -> Megabytes
   | "Gigabytes" -> Gigabytes
   | "Terabytes" -> Terabytes
   | "Bits" -> Bits
   | "Kilobits" -> Kilobits
   | "Megabits" -> Megabits
   | "Gigabits" -> Gigabits
   | "Terabits" -> Terabits
   | "Percent" -> Percent
   | "Count" -> Count
   | "Bytes/Second" -> Bytes_Second
   | "Kilobytes/Second" -> Kilobytes_Second
   | "Megabytes/Second" -> Megabytes_Second
   | "Gigabytes/Second" -> Gigabytes_Second
   | "Terabytes/Second" -> Terabytes_Second
   | "Bits/Second" -> Bits_Second
   | "Kilobits/Second" -> Kilobits_Second
   | "Megabits/Second" -> Megabits_Second
   | "Gigabits/Second" -> Gigabits_Second
   | "Terabits/Second" -> Terabits_Second
   | "Count/Second" -> Count_Second
   | "None" -> None_
   | _ -> failwith "unknown enum value"
    : standard_unit)

let stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dimension_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> dimension_name_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> dimension_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : dimension)

let dimensions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ()

let metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Namespace"; "MetricName"; "Dimensions" ]
    (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
   }
    : metric)

let metric_stat_of_xml i =
  let r_metric = ref None in
  let r_period = ref None in
  let r_stat = ref None in
  let r_unit_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric"; "Period"; "Stat"; "Unit" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Stat" ->
          r_stat := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Stat" (fun i _ -> stat_of_xml i) ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     unit_ = ( ! ) r_unit_;
   }
    : metric_stat)

let metric_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_data_query_of_xml i =
  let r_id = ref None in
  let r_metric_stat = ref None in
  let r_expression = ref None in
  let r_label = ref None in
  let r_return_data = ref None in
  let r_period = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Id"; "MetricStat"; "Expression"; "Label"; "ReturnData"; "Period"; "AccountId" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> metric_id_of_xml i) ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> metric_stat_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> metric_expression_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> account_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
     metric_stat = ( ! ) r_metric_stat;
     expression = ( ! ) r_expression;
     label = ( ! ) r_label;
     return_data = ( ! ) r_return_data;
     period = ( ! ) r_period;
     account_id = ( ! ) r_account_id;
   }
    : metric_data_query)

let metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_query_of_xml i) ()

let metric_math_anomaly_detector_of_xml i =
  let r_metric_data_queries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricDataQueries" ] (fun tag _ ->
      match tag with
      | "MetricDataQueries" ->
          r_metric_data_queries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataQueries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric_data_queries = ( ! ) r_metric_data_queries } : metric_math_anomaly_detector)

let anomaly_detector_metric_stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let single_metric_anomaly_detector_of_xml i =
  let r_account_id = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_stat = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountId"; "Namespace"; "MetricName"; "Dimensions"; "Stat" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> account_id_of_xml i) ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_id = ( ! ) r_account_id;
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     stat = ( ! ) r_stat;
   }
    : single_metric_anomaly_detector)

let periodic_spikes_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metric_characteristics_of_xml i =
  let r_periodic_spikes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PeriodicSpikes" ] (fun tag _ ->
      match tag with
      | "PeriodicSpikes" ->
          r_periodic_spikes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PeriodicSpikes"
                 (fun i _ -> periodic_spikes_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ periodic_spikes = ( ! ) r_periodic_spikes } : metric_characteristics)

let anomaly_detector_state_value_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING_TRAINING" -> PENDING_TRAINING
   | "TRAINED_INSUFFICIENT_DATA" -> TRAINED_INSUFFICIENT_DATA
   | "TRAINED" -> TRAINED
   | _ -> failwith "unknown enum value"
    : anomaly_detector_state_value)

let anomaly_detector_metric_timezone_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let range_of_xml i =
  let r_start_time = ref None in
  let r_end_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StartTime"; "EndTime" ] (fun tag _ ->
      match tag with
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
   }
    : range)

let anomaly_detector_excluded_time_ranges_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> range_of_xml i) ()

let anomaly_detector_configuration_of_xml i =
  let r_excluded_time_ranges = ref None in
  let r_metric_timezone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExcludedTimeRanges"; "MetricTimezone" ]
    (fun tag _ ->
      match tag with
      | "ExcludedTimeRanges" ->
          r_excluded_time_ranges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedTimeRanges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> range_of_xml i) ())
                 ())
      | "MetricTimezone" ->
          r_metric_timezone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricTimezone"
                 (fun i _ -> anomaly_detector_metric_timezone_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     excluded_time_ranges = ( ! ) r_excluded_time_ranges;
     metric_timezone = ( ! ) r_metric_timezone;
   }
    : anomaly_detector_configuration)

let anomaly_detector_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_stat = ref None in
  let r_configuration = ref None in
  let r_state_value = ref None in
  let r_metric_characteristics = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_metric_math_anomaly_detector = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "MetricName";
      "Dimensions";
      "Stat";
      "Configuration";
      "StateValue";
      "MetricCharacteristics";
      "SingleMetricAnomalyDetector";
      "MetricMathAnomalyDetector";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> anomaly_detector_configuration_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> anomaly_detector_state_value_of_xml i)
                 ())
      | "MetricCharacteristics" ->
          r_metric_characteristics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricCharacteristics"
                 (fun i _ -> metric_characteristics_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     stat = ( ! ) r_stat;
     configuration = ( ! ) r_configuration;
     state_value = ( ! ) r_state_value;
     metric_characteristics = ( ! ) r_metric_characteristics;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
   }
    : anomaly_detector)

let anomaly_detector_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SINGLE_METRIC" -> SINGLE_METRIC
   | "METRIC_MATH" -> METRIC_MATH
   | _ -> failwith "unknown enum value"
    : anomaly_detector_type)

let anomaly_detector_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> anomaly_detector_type_of_xml i) ()

let anomaly_detectors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> anomaly_detector_of_xml i) ()

let fault_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_not_found_exception_of_xml i =
  let r_resource_type = ref None in
  let r_resource_id = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceType"; "ResourceId"; "Message" ]
    (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId"
                 (fun i _ -> resource_id_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> fault_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = ( ! ) r_resource_type;
     resource_id = ( ! ) r_resource_id;
     message = ( ! ) r_message;
   }
    : resource_not_found_exception)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let kms_key_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i }
    : kms_key_not_found_exception)

let kms_key_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i }
    : kms_key_disabled_exception)

let kms_access_denied_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i }
    : kms_access_denied_exception)

let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let conflict_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : conflict_exception)

let associate_dataset_kms_key_output_of_xml i = ()
let kms_key_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dataset_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let associate_dataset_kms_key_input_of_xml i =
  let r_dataset_identifier = ref None in
  let r_kms_key_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DatasetIdentifier"; "KmsKeyArn" ] (fun tag _ ->
      match tag with
      | "DatasetIdentifier" ->
          r_dataset_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetIdentifier"
                 (fun i _ -> dataset_identifier_of_xml i)
                 ())
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn" (fun i _ -> kms_key_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dataset_identifier =
       Smaws_Lib.Xml.Parse.required "DatasetIdentifier" (( ! ) r_dataset_identifier) i;
     kms_key_arn = Smaws_Lib.Xml.Parse.required "KmsKeyArn" (( ! ) r_kms_key_arn) i;
   }
    : associate_dataset_kms_key_input)

let aws_query_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let exception_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_resource_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partial_failure_of_xml i =
  let r_failure_resource = ref None in
  let r_exception_type = ref None in
  let r_failure_code = ref None in
  let r_failure_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "FailureResource"; "ExceptionType"; "FailureCode"; "FailureDescription" ] (fun tag _ ->
      match tag with
      | "FailureResource" ->
          r_failure_resource :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureResource"
                 (fun i _ -> failure_resource_of_xml i)
                 ())
      | "ExceptionType" ->
          r_exception_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExceptionType"
                 (fun i _ -> exception_type_of_xml i)
                 ())
      | "FailureCode" ->
          r_failure_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureCode"
                 (fun i _ -> failure_code_of_xml i)
                 ())
      | "FailureDescription" ->
          r_failure_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureDescription"
                 (fun i _ -> failure_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_resource = ( ! ) r_failure_resource;
     exception_type = ( ! ) r_exception_type;
     failure_code = ( ! ) r_failure_code;
     failure_description = ( ! ) r_failure_description;
   }
    : partial_failure)

let batch_failures_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> partial_failure_of_xml i) ()

let comparison_operator_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "GreaterThanOrEqualToThreshold" -> GreaterThanOrEqualToThreshold
   | "GreaterThanThreshold" -> GreaterThanThreshold
   | "LessThanThreshold" -> LessThanThreshold
   | "LessThanOrEqualToThreshold" -> LessThanOrEqualToThreshold
   | "LessThanLowerOrGreaterThanUpperThreshold" -> LessThanLowerOrGreaterThanUpperThreshold
   | "LessThanLowerThreshold" -> LessThanLowerThreshold
   | "GreaterThanUpperThreshold" -> GreaterThanUpperThreshold
   | _ -> failwith "unknown enum value"
    : comparison_operator)

let suppressor_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let state_value_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "OK" -> OK
   | "ALARM" -> ALARM
   | "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
   | _ -> failwith "unknown enum value"
    : state_value)

let state_reason_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

let composite_alarm_of_xml i =
  let r_actions_enabled = ref None in
  let r_alarm_actions = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_alarm_description = ref None in
  let r_alarm_name = ref None in
  let r_alarm_rule = ref None in
  let r_insufficient_data_actions = ref None in
  let r_ok_actions = ref None in
  let r_state_reason = ref None in
  let r_state_reason_data = ref None in
  let r_state_updated_timestamp = ref None in
  let r_state_value = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_actions_suppressed_by = ref None in
  let r_actions_suppressed_reason = ref None in
  let r_actions_suppressor = ref None in
  let r_actions_suppressor_wait_period = ref None in
  let r_actions_suppressor_extension_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionsEnabled";
      "AlarmActions";
      "AlarmArn";
      "AlarmConfigurationUpdatedTimestamp";
      "AlarmDescription";
      "AlarmName";
      "AlarmRule";
      "InsufficientDataActions";
      "OKActions";
      "StateReason";
      "StateReasonData";
      "StateUpdatedTimestamp";
      "StateValue";
      "StateTransitionedTimestamp";
      "ActionsSuppressedBy";
      "ActionsSuppressedReason";
      "ActionsSuppressor";
      "ActionsSuppressorWaitPeriod";
      "ActionsSuppressorExtensionPeriod";
    ] (fun tag _ ->
      match tag with
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmConfigurationUpdatedTimestamp" ->
          r_alarm_configuration_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmConfigurationUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmRule" ->
          r_alarm_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmRule" (fun i _ -> alarm_rule_of_xml i) ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ActionsSuppressedBy" ->
          r_actions_suppressed_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressedBy"
                 (fun i _ -> actions_suppressed_by_of_xml i)
                 ())
      | "ActionsSuppressedReason" ->
          r_actions_suppressed_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressedReason"
                 (fun i _ -> actions_suppressed_reason_of_xml i)
                 ())
      | "ActionsSuppressor" ->
          r_actions_suppressor :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressor"
                 (fun i _ -> alarm_arn_of_xml i)
                 ())
      | "ActionsSuppressorWaitPeriod" ->
          r_actions_suppressor_wait_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorWaitPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressorExtensionPeriod" ->
          r_actions_suppressor_extension_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorExtensionPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     actions_enabled = ( ! ) r_actions_enabled;
     alarm_actions = ( ! ) r_alarm_actions;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     alarm_description = ( ! ) r_alarm_description;
     alarm_name = ( ! ) r_alarm_name;
     alarm_rule = ( ! ) r_alarm_rule;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     ok_actions = ( ! ) r_ok_actions;
     state_reason = ( ! ) r_state_reason;
     state_reason_data = ( ! ) r_state_reason_data;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     state_value = ( ! ) r_state_value;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     actions_suppressed_by = ( ! ) r_actions_suppressed_by;
     actions_suppressed_reason = ( ! ) r_actions_suppressed_reason;
     actions_suppressor = ( ! ) r_actions_suppressor;
     actions_suppressor_wait_period = ( ! ) r_actions_suppressor_wait_period;
     actions_suppressor_extension_period = ( ! ) r_actions_suppressor_extension_period;
   }
    : composite_alarm)

let composite_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> composite_alarm_of_xml i) ()

let concurrent_modification_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> fault_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : concurrent_modification_exception)

let datapoint_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let counts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let dashboard_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dashboard_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let last_modified_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let dashboard_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dashboard_entry_of_xml i =
  let r_dashboard_name = ref None in
  let r_dashboard_arn = ref None in
  let r_last_modified = ref None in
  let r_size = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DashboardName"; "DashboardArn"; "LastModified"; "Size" ] (fun tag _ ->
      match tag with
      | "DashboardName" ->
          r_dashboard_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardName"
                 (fun i _ -> dashboard_name_of_xml i)
                 ())
      | "DashboardArn" ->
          r_dashboard_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardArn"
                 (fun i _ -> dashboard_arn_of_xml i)
                 ())
      | "LastModified" ->
          r_last_modified :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastModified"
                 (fun i _ -> last_modified_of_xml i)
                 ())
      | "Size" ->
          r_size := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Size" (fun i _ -> size_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dashboard_name = ( ! ) r_dashboard_name;
     dashboard_arn = ( ! ) r_dashboard_arn;
     last_modified = ( ! ) r_last_modified;
     size = ( ! ) r_size;
   }
    : dashboard_entry)

let dashboard_entries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dashboard_entry_of_xml i) ()

let dashboard_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let data_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dashboard_validation_message_of_xml i =
  let r_data_path = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataPath"; "Message" ] (fun tag _ ->
      match tag with
      | "DataPath" ->
          r_data_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataPath" (fun i _ -> data_path_of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_path = ( ! ) r_data_path; message = ( ! ) r_message } : dashboard_validation_message)

let dashboard_validation_messages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> dashboard_validation_message_of_xml i)
    ()

let dashboard_invalid_input_error_of_xml i =
  let r_message = ref None in
  let r_dashboard_validation_messages = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "dashboardValidationMessages" ]
    (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> dashboard_error_message_of_xml i)
                 ())
      | "dashboardValidationMessages" ->
          r_dashboard_validation_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "dashboardValidationMessages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_validation_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     dashboard_validation_messages = ( ! ) r_dashboard_validation_messages;
   }
    : dashboard_invalid_input_error)

let dashboard_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dashboard_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dashboard_name_of_xml i) ()

let dashboard_not_found_error_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> dashboard_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : dashboard_not_found_error)

let extended_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let datapoint_value_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> extended_statistic_of_xml i) ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> datapoint_value_of_xml i) ()
      in
      (k, v))
    ()

let datapoint_of_xml i =
  let r_timestamp = ref None in
  let r_sample_count = ref None in
  let r_average = ref None in
  let r_sum = ref None in
  let r_minimum = ref None in
  let r_maximum = ref None in
  let r_unit_ = ref None in
  let r_extended_statistics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Timestamp";
      "SampleCount";
      "Average";
      "Sum";
      "Minimum";
      "Maximum";
      "Unit";
      "ExtendedStatistics";
    ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Average" ->
          r_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Average"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum" (fun i _ -> datapoint_value_of_xml i) ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "ExtendedStatistics" ->
          r_extended_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> extended_statistic_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> datapoint_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = ( ! ) r_timestamp;
     sample_count = ( ! ) r_sample_count;
     average = ( ! ) r_average;
     sum = ( ! ) r_sum;
     minimum = ( ! ) r_minimum;
     maximum = ( ! ) r_maximum;
     unit_ = ( ! ) r_unit_;
     extended_statistics = ( ! ) r_extended_statistics;
   }
    : datapoint)

let datapoint_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_of_xml i) ()

let datapoints_to_alarm_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let dataset_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dataset_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delete_alarm_mute_rule_input_of_xml i =
  let r_alarm_mute_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmMuteRuleName" ] (fun tag _ ->
      match tag with
      | "AlarmMuteRuleName" ->
          r_alarm_mute_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleName"
                 (fun i _ -> name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_mute_rule_name =
       Smaws_Lib.Xml.Parse.required "AlarmMuteRuleName" (( ! ) r_alarm_mute_rule_name) i;
   }
    : delete_alarm_mute_rule_input)

let resource_not_found_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_not_found)

let resource_conflict_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_conflict)

let delete_alarms_input_of_xml i =
  let r_alarm_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmNames" ] (fun tag _ ->
      match tag with
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_names = Smaws_Lib.Xml.Parse.required "AlarmNames" (( ! ) r_alarm_names) i }
    : delete_alarms_input)

let missing_required_parameter_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> aws_query_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : missing_required_parameter_exception)

let invalid_parameter_value_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> aws_query_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_value_exception)

let invalid_parameter_combination_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> aws_query_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_combination_exception)

let internal_service_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> fault_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : internal_service_fault)

let delete_anomaly_detector_output_of_xml i = ()

let delete_anomaly_detector_input_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_stat = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_metric_math_anomaly_detector = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "MetricName";
      "Dimensions";
      "Stat";
      "SingleMetricAnomalyDetector";
      "MetricMathAnomalyDetector";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     stat = ( ! ) r_stat;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
   }
    : delete_anomaly_detector_input)

let delete_dashboards_output_of_xml i = ()

let delete_dashboards_input_of_xml i =
  let r_dashboard_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardNames" ] (fun tag _ ->
      match tag with
      | "DashboardNames" ->
          r_dashboard_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dashboard_names = Smaws_Lib.Xml.Parse.required "DashboardNames" (( ! ) r_dashboard_names) i }
    : delete_dashboards_input)

let delete_insight_rules_output_of_xml i =
  let r_failures = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Failures" ] (fun tag _ ->
      match tag with
      | "Failures" ->
          r_failures :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Failures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> partial_failure_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failures = ( ! ) r_failures } : delete_insight_rules_output)

let insight_rule_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_name_of_xml i) ()

let delete_insight_rules_input_of_xml i =
  let r_rule_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleNames" ] (fun tag _ ->
      match tag with
      | "RuleNames" ->
          r_rule_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_names = Smaws_Lib.Xml.Parse.required "RuleNames" (( ! ) r_rule_names) i }
    : delete_insight_rules_input)

let delete_metric_stream_output_of_xml i = ()
let metric_stream_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delete_metric_stream_input_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i } : delete_metric_stream_input)

let invalid_next_token_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_next_token)

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let describe_alarm_contributors_output_of_xml i =
  let r_alarm_contributors = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmContributors"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AlarmContributors" ->
          r_alarm_contributors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_contributor_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_contributors =
       Smaws_Lib.Xml.Parse.required "AlarmContributors" (( ! ) r_alarm_contributors) i;
     next_token = ( ! ) r_next_token;
   }
    : describe_alarm_contributors_output)

let describe_alarm_contributors_input_of_xml i =
  let r_alarm_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     next_token = ( ! ) r_next_token;
   }
    : describe_alarm_contributors_input)

let describe_alarm_history_output_of_xml i =
  let r_alarm_history_items = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmHistoryItems"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AlarmHistoryItems" ->
          r_alarm_history_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmHistoryItems"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_history_item_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_history_items = ( ! ) r_alarm_history_items; next_token = ( ! ) r_next_token }
    : describe_alarm_history_output)

let scan_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TimestampDescending" -> TIMESTAMP_DESCENDING
   | "TimestampAscending" -> TIMESTAMP_ASCENDING
   | _ -> failwith "unknown enum value"
    : scan_by)

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_alarm_history_input_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_contributor_id = ref None in
  let r_alarm_types = ref None in
  let r_history_item_type = ref None in
  let r_start_date = ref None in
  let r_end_date = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_scan_by = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmContributorId";
      "AlarmTypes";
      "HistoryItemType";
      "StartDate";
      "EndDate";
      "MaxRecords";
      "NextToken";
      "ScanBy";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmContributorId" ->
          r_alarm_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | "AlarmTypes" ->
          r_alarm_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ())
                 ())
      | "HistoryItemType" ->
          r_history_item_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryItemType"
                 (fun i _ -> history_item_type_of_xml i)
                 ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "EndDate" ->
          r_end_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndDate" (fun i _ -> timestamp_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ScanBy" ->
          r_scan_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanBy" (fun i _ -> scan_by_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = ( ! ) r_alarm_name;
     alarm_contributor_id = ( ! ) r_alarm_contributor_id;
     alarm_types = ( ! ) r_alarm_types;
     history_item_type = ( ! ) r_history_item_type;
     start_date = ( ! ) r_start_date;
     end_date = ( ! ) r_end_date;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     scan_by = ( ! ) r_scan_by;
   }
    : describe_alarm_history_input)

let evaluation_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PARTIAL_DATA" -> PARTIAL_DATA
   | "EVALUATION_FAILURE" -> EVALUATION_FAILURE
   | "EVALUATION_ERROR" -> EVALUATION_ERROR
   | _ -> failwith "unknown enum value"
    : evaluation_state)

let treat_missing_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let threshold_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let query_results_to_alarm_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let query_results_to_evaluate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let end_time_offset_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let start_time_offset_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let schedule_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let schedule_configuration_of_xml i =
  let r_schedule_expression = ref None in
  let r_start_time_offset = ref None in
  let r_end_time_offset = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ScheduleExpression"; "StartTimeOffset"; "EndTimeOffset" ] (fun tag _ ->
      match tag with
      | "ScheduleExpression" ->
          r_schedule_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleExpression"
                 (fun i _ -> schedule_expression_of_xml i)
                 ())
      | "StartTimeOffset" ->
          r_start_time_offset :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTimeOffset"
                 (fun i _ -> start_time_offset_of_xml i)
                 ())
      | "EndTimeOffset" ->
          r_end_time_offset :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimeOffset"
                 (fun i _ -> end_time_offset_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_expression =
       Smaws_Lib.Xml.Parse.required "ScheduleExpression" (( ! ) r_schedule_expression) i;
     start_time_offset = ( ! ) r_start_time_offset;
     end_time_offset = ( ! ) r_end_time_offset;
   }
    : schedule_configuration)

let log_group_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> amazon_resource_name_of_xml i) ()

let query_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let scheduled_query_configuration_of_xml i =
  let r_query_string = ref None in
  let r_log_group_identifiers = ref None in
  let r_query_ar_n = ref None in
  let r_scheduled_query_role_ar_n = ref None in
  let r_schedule_configuration = ref None in
  let r_aggregation_expression = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "QueryString";
      "LogGroupIdentifiers";
      "QueryARN";
      "ScheduledQueryRoleARN";
      "ScheduleConfiguration";
      "AggregationExpression";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "QueryString" ->
          r_query_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryString"
                 (fun i _ -> query_string_of_xml i)
                 ())
      | "LogGroupIdentifiers" ->
          r_log_group_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogGroupIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> amazon_resource_name_of_xml i)
                     ())
                 ())
      | "QueryARN" ->
          r_query_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ScheduledQueryRoleARN" ->
          r_scheduled_query_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryRoleARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ScheduleConfiguration" ->
          r_schedule_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleConfiguration"
                 (fun i _ -> schedule_configuration_of_xml i)
                 ())
      | "AggregationExpression" ->
          r_aggregation_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregationExpression"
                 (fun i _ -> aggregation_expression_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     query_string = Smaws_Lib.Xml.Parse.required "QueryString" (( ! ) r_query_string) i;
     log_group_identifiers = ( ! ) r_log_group_identifiers;
     query_ar_n = ( ! ) r_query_ar_n;
     scheduled_query_role_ar_n =
       Smaws_Lib.Xml.Parse.required "ScheduledQueryRoleARN" (( ! ) r_scheduled_query_role_ar_n) i;
     schedule_configuration =
       Smaws_Lib.Xml.Parse.required "ScheduleConfiguration" (( ! ) r_schedule_configuration) i;
     aggregation_expression =
       Smaws_Lib.Xml.Parse.required "AggregationExpression" (( ! ) r_aggregation_expression) i;
     tags = ( ! ) r_tags;
   }
    : scheduled_query_configuration)

let log_alarm_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_description = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_actions_enabled = ref None in
  let r_ok_actions = ref None in
  let r_alarm_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_state_value = ref None in
  let r_state_reason = ref None in
  let r_state_reason_data = ref None in
  let r_state_updated_timestamp = ref None in
  let r_scheduled_query_configuration = ref None in
  let r_query_results_to_evaluate = ref None in
  let r_query_results_to_alarm = ref None in
  let r_threshold = ref None in
  let r_comparison_operator = ref None in
  let r_treat_missing_data = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_evaluation_state = ref None in
  let r_action_log_line_count = ref None in
  let r_action_log_line_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmArn";
      "AlarmDescription";
      "AlarmConfigurationUpdatedTimestamp";
      "ActionsEnabled";
      "OKActions";
      "AlarmActions";
      "InsufficientDataActions";
      "StateValue";
      "StateReason";
      "StateReasonData";
      "StateUpdatedTimestamp";
      "ScheduledQueryConfiguration";
      "QueryResultsToEvaluate";
      "QueryResultsToAlarm";
      "Threshold";
      "ComparisonOperator";
      "TreatMissingData";
      "StateTransitionedTimestamp";
      "EvaluationState";
      "ActionLogLineCount";
      "ActionLogLineRoleArn";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "AlarmConfigurationUpdatedTimestamp" ->
          r_alarm_configuration_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmConfigurationUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ScheduledQueryConfiguration" ->
          r_scheduled_query_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryConfiguration"
                 (fun i _ -> scheduled_query_configuration_of_xml i)
                 ())
      | "QueryResultsToEvaluate" ->
          r_query_results_to_evaluate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToEvaluate"
                 (fun i _ -> query_results_to_evaluate_of_xml i)
                 ())
      | "QueryResultsToAlarm" ->
          r_query_results_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToAlarm"
                 (fun i _ -> query_results_to_alarm_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "EvaluationState" ->
          r_evaluation_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationState"
                 (fun i _ -> evaluation_state_of_xml i)
                 ())
      | "ActionLogLineCount" ->
          r_action_log_line_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineCount"
                 (fun i _ -> action_log_line_count_of_xml i)
                 ())
      | "ActionLogLineRoleArn" ->
          r_action_log_line_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineRoleArn"
                 (fun i _ -> action_log_line_role_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = ( ! ) r_alarm_name;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_description = ( ! ) r_alarm_description;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     actions_enabled = ( ! ) r_actions_enabled;
     ok_actions = ( ! ) r_ok_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     state_value = ( ! ) r_state_value;
     state_reason = ( ! ) r_state_reason;
     state_reason_data = ( ! ) r_state_reason_data;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     scheduled_query_configuration = ( ! ) r_scheduled_query_configuration;
     query_results_to_evaluate = ( ! ) r_query_results_to_evaluate;
     query_results_to_alarm = ( ! ) r_query_results_to_alarm;
     threshold = ( ! ) r_threshold;
     comparison_operator = ( ! ) r_comparison_operator;
     treat_missing_data = ( ! ) r_treat_missing_data;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     evaluation_state = ( ! ) r_evaluation_state;
     action_log_line_count = ( ! ) r_action_log_line_count;
     action_log_line_role_arn = ( ! ) r_action_log_line_role_arn;
   }
    : log_alarm)

let log_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> log_alarm_of_xml i) ()

let evaluation_interval_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let evaluation_criteria_of_xml i =
  let r_prom_ql_criteria = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PromQLCriteria" ] (fun tag _ ->
      match tag with
      | "PromQLCriteria" ->
          r_prom_ql_criteria :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromQLCriteria"
                 (fun i _ -> alarm_prom_ql_criteria_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_prom_ql_criteria with
   | Some v -> PromQLCriteria v
   | None -> failwith "no union member present in xml response"
    : evaluation_criteria)

let sliding_window_of_xml i = ()
let timezone_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let wall_clock_window_of_xml i =
  let r_timezone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timezone" ] (fun tag _ ->
      match tag with
      | "Timezone" ->
          r_timezone :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone" (fun i _ -> timezone_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ timezone = ( ! ) r_timezone } : wall_clock_window)

let evaluation_window_of_xml i =
  let r_wall_clock_window = ref None in
  let r_sliding_window = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "WallClockWindow"; "SlidingWindow" ] (fun tag _ ->
      match tag with
      | "WallClockWindow" ->
          r_wall_clock_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WallClockWindow"
                 (fun i _ -> wall_clock_window_of_xml i)
                 ())
      | "SlidingWindow" ->
          r_sliding_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SlidingWindow"
                 (fun i _ -> sliding_window_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_wall_clock_window with
   | Some v -> WallClockWindow v
   | None -> (
       match ( ! ) r_sliding_window with
       | Some v -> SlidingWindow v
       | None -> failwith "no union member present in xml response")
    : evaluation_window)

let evaluate_low_sample_count_percentile_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let evaluation_periods_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let statistic_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SampleCount" -> SampleCount
   | "Average" -> Average
   | "Sum" -> Sum
   | "Minimum" -> Minimum
   | "Maximum" -> Maximum
   | _ -> failwith "unknown enum value"
    : statistic)

let metric_alarm_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_description = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_actions_enabled = ref None in
  let r_ok_actions = ref None in
  let r_alarm_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_state_value = ref None in
  let r_state_reason = ref None in
  let r_state_reason_data = ref None in
  let r_state_updated_timestamp = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_statistic = ref None in
  let r_extended_statistic = ref None in
  let r_dimensions = ref None in
  let r_period = ref None in
  let r_unit_ = ref None in
  let r_evaluation_periods = ref None in
  let r_datapoints_to_alarm = ref None in
  let r_threshold = ref None in
  let r_comparison_operator = ref None in
  let r_treat_missing_data = ref None in
  let r_evaluate_low_sample_count_percentile = ref None in
  let r_metrics = ref None in
  let r_threshold_metric_id = ref None in
  let r_evaluation_state = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_evaluation_window = ref None in
  let r_evaluation_criteria = ref None in
  let r_evaluation_interval = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmArn";
      "AlarmDescription";
      "AlarmConfigurationUpdatedTimestamp";
      "ActionsEnabled";
      "OKActions";
      "AlarmActions";
      "InsufficientDataActions";
      "StateValue";
      "StateReason";
      "StateReasonData";
      "StateUpdatedTimestamp";
      "MetricName";
      "Namespace";
      "Statistic";
      "ExtendedStatistic";
      "Dimensions";
      "Period";
      "Unit";
      "EvaluationPeriods";
      "DatapointsToAlarm";
      "Threshold";
      "ComparisonOperator";
      "TreatMissingData";
      "EvaluateLowSampleCountPercentile";
      "Metrics";
      "ThresholdMetricId";
      "EvaluationState";
      "StateTransitionedTimestamp";
      "EvaluationWindow";
      "EvaluationCriteria";
      "EvaluationInterval";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "AlarmConfigurationUpdatedTimestamp" ->
          r_alarm_configuration_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmConfigurationUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "EvaluationPeriods" ->
          r_evaluation_periods :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationPeriods"
                 (fun i _ -> evaluation_periods_of_xml i)
                 ())
      | "DatapointsToAlarm" ->
          r_datapoints_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatapointsToAlarm"
                 (fun i _ -> datapoints_to_alarm_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "EvaluateLowSampleCountPercentile" ->
          r_evaluate_low_sample_count_percentile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluateLowSampleCountPercentile"
                 (fun i _ -> evaluate_low_sample_count_percentile_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | "ThresholdMetricId" ->
          r_threshold_metric_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThresholdMetricId"
                 (fun i _ -> metric_id_of_xml i)
                 ())
      | "EvaluationState" ->
          r_evaluation_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationState"
                 (fun i _ -> evaluation_state_of_xml i)
                 ())
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "EvaluationWindow" ->
          r_evaluation_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationWindow"
                 (fun i _ -> evaluation_window_of_xml i)
                 ())
      | "EvaluationCriteria" ->
          r_evaluation_criteria :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationCriteria"
                 (fun i _ -> evaluation_criteria_of_xml i)
                 ())
      | "EvaluationInterval" ->
          r_evaluation_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationInterval"
                 (fun i _ -> evaluation_interval_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = ( ! ) r_alarm_name;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_description = ( ! ) r_alarm_description;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     actions_enabled = ( ! ) r_actions_enabled;
     ok_actions = ( ! ) r_ok_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     state_value = ( ! ) r_state_value;
     state_reason = ( ! ) r_state_reason;
     state_reason_data = ( ! ) r_state_reason_data;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
     statistic = ( ! ) r_statistic;
     extended_statistic = ( ! ) r_extended_statistic;
     dimensions = ( ! ) r_dimensions;
     period = ( ! ) r_period;
     unit_ = ( ! ) r_unit_;
     evaluation_periods = ( ! ) r_evaluation_periods;
     datapoints_to_alarm = ( ! ) r_datapoints_to_alarm;
     threshold = ( ! ) r_threshold;
     comparison_operator = ( ! ) r_comparison_operator;
     treat_missing_data = ( ! ) r_treat_missing_data;
     evaluate_low_sample_count_percentile = ( ! ) r_evaluate_low_sample_count_percentile;
     metrics = ( ! ) r_metrics;
     threshold_metric_id = ( ! ) r_threshold_metric_id;
     evaluation_state = ( ! ) r_evaluation_state;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     evaluation_window = ( ! ) r_evaluation_window;
     evaluation_criteria = ( ! ) r_evaluation_criteria;
     evaluation_interval = ( ! ) r_evaluation_interval;
   }
    : metric_alarm)

let metric_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_alarm_of_xml i) ()

let describe_alarms_output_of_xml i =
  let r_composite_alarms = ref None in
  let r_metric_alarms = ref None in
  let r_log_alarms = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CompositeAlarms"; "MetricAlarms"; "LogAlarms"; "NextToken" ] (fun tag _ ->
      match tag with
      | "CompositeAlarms" ->
          r_composite_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CompositeAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> composite_alarm_of_xml i)
                     ())
                 ())
      | "MetricAlarms" ->
          r_metric_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_alarm_of_xml i)
                     ())
                 ())
      | "LogAlarms" ->
          r_log_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> log_alarm_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     composite_alarms = ( ! ) r_composite_alarms;
     metric_alarms = ( ! ) r_metric_alarms;
     log_alarms = ( ! ) r_log_alarms;
     next_token = ( ! ) r_next_token;
   }
    : describe_alarms_output)

let describe_alarms_input_of_xml i =
  let r_alarm_names = ref None in
  let r_alarm_name_prefix = ref None in
  let r_alarm_types = ref None in
  let r_children_of_alarm_name = ref None in
  let r_parents_of_alarm_name = ref None in
  let r_state_value = ref None in
  let r_action_prefix = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmNames";
      "AlarmNamePrefix";
      "AlarmTypes";
      "ChildrenOfAlarmName";
      "ParentsOfAlarmName";
      "StateValue";
      "ActionPrefix";
      "MaxRecords";
      "NextToken";
    ] (fun tag _ ->
      match tag with
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ())
                 ())
      | "AlarmNamePrefix" ->
          r_alarm_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNamePrefix"
                 (fun i _ -> alarm_name_prefix_of_xml i)
                 ())
      | "AlarmTypes" ->
          r_alarm_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ())
                 ())
      | "ChildrenOfAlarmName" ->
          r_children_of_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChildrenOfAlarmName"
                 (fun i _ -> alarm_name_of_xml i)
                 ())
      | "ParentsOfAlarmName" ->
          r_parents_of_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentsOfAlarmName"
                 (fun i _ -> alarm_name_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "ActionPrefix" ->
          r_action_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionPrefix"
                 (fun i _ -> action_prefix_of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_names = ( ! ) r_alarm_names;
     alarm_name_prefix = ( ! ) r_alarm_name_prefix;
     alarm_types = ( ! ) r_alarm_types;
     children_of_alarm_name = ( ! ) r_children_of_alarm_name;
     parents_of_alarm_name = ( ! ) r_parents_of_alarm_name;
     state_value = ( ! ) r_state_value;
     action_prefix = ( ! ) r_action_prefix;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_alarms_input)

let describe_alarms_for_metric_output_of_xml i =
  let r_metric_alarms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricAlarms" ] (fun tag _ ->
      match tag with
      | "MetricAlarms" ->
          r_metric_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_alarm_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric_alarms = ( ! ) r_metric_alarms } : describe_alarms_for_metric_output)

let describe_alarms_for_metric_input_of_xml i =
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_statistic = ref None in
  let r_extended_statistic = ref None in
  let r_dimensions = ref None in
  let r_period = ref None in
  let r_unit_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MetricName"; "Namespace"; "Statistic"; "ExtendedStatistic"; "Dimensions"; "Period"; "Unit" ]
    (fun tag _ ->
      match tag with
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     statistic = ( ! ) r_statistic;
     extended_statistic = ( ! ) r_extended_statistic;
     dimensions = ( ! ) r_dimensions;
     period = ( ! ) r_period;
     unit_ = ( ! ) r_unit_;
   }
    : describe_alarms_for_metric_input)

let describe_anomaly_detectors_output_of_xml i =
  let r_anomaly_detectors = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnomalyDetectors"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AnomalyDetectors" ->
          r_anomaly_detectors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnomalyDetectors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> anomaly_detector_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ anomaly_detectors = ( ! ) r_anomaly_detectors; next_token = ( ! ) r_next_token }
    : describe_anomaly_detectors_output)

let max_returned_results_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_anomaly_detectors_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_anomaly_detector_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "MaxResults"; "Namespace"; "MetricName"; "Dimensions"; "AnomalyDetectorTypes" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_returned_results_count_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "AnomalyDetectorTypes" ->
          r_anomaly_detector_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnomalyDetectorTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> anomaly_detector_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     anomaly_detector_types = ( ! ) r_anomaly_detector_types;
   }
    : describe_anomaly_detectors_input)

let insight_rule_on_transformed_logs_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_is_managed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_definition_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_schema_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_of_xml i =
  let r_name = ref None in
  let r_state = ref None in
  let r_schema = ref None in
  let r_definition = ref None in
  let r_managed_rule = ref None in
  let r_apply_on_transformed_logs = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Name"; "State"; "Schema"; "Definition"; "ManagedRule"; "ApplyOnTransformedLogs" ]
    (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | "Schema" ->
          r_schema :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Schema"
                 (fun i _ -> insight_rule_schema_of_xml i)
                 ())
      | "Definition" ->
          r_definition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Definition"
                 (fun i _ -> insight_rule_definition_of_xml i)
                 ())
      | "ManagedRule" ->
          r_managed_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedRule"
                 (fun i _ -> insight_rule_is_managed_of_xml i)
                 ())
      | "ApplyOnTransformedLogs" ->
          r_apply_on_transformed_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyOnTransformedLogs"
                 (fun i _ -> insight_rule_on_transformed_logs_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
     schema = Smaws_Lib.Xml.Parse.required "Schema" (( ! ) r_schema) i;
     definition = Smaws_Lib.Xml.Parse.required "Definition" (( ! ) r_definition) i;
     managed_rule = ( ! ) r_managed_rule;
     apply_on_transformed_logs = ( ! ) r_apply_on_transformed_logs;
   }
    : insight_rule)

let insight_rules_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_of_xml i) ()

let describe_insight_rules_output_of_xml i =
  let r_next_token = ref None in
  let r_insight_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "InsightRules" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "InsightRules" ->
          r_insight_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsightRules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; insight_rules = ( ! ) r_insight_rules }
    : describe_insight_rules_output)

let insight_rule_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_insight_rules_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> insight_rule_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_results = ( ! ) r_max_results }
    : describe_insight_rules_input)

let dimension_filter_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> dimension_name_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> dimension_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i; value = ( ! ) r_value }
    : dimension_filter)

let dimension_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_filter_of_xml i) ()

let disable_alarm_actions_input_of_xml i =
  let r_alarm_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmNames" ] (fun tag _ ->
      match tag with
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_names = Smaws_Lib.Xml.Parse.required "AlarmNames" (( ! ) r_alarm_names) i }
    : disable_alarm_actions_input)

let disable_insight_rules_output_of_xml i =
  let r_failures = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Failures" ] (fun tag _ ->
      match tag with
      | "Failures" ->
          r_failures :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Failures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> partial_failure_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failures = ( ! ) r_failures } : disable_insight_rules_output)

let disable_insight_rules_input_of_xml i =
  let r_rule_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleNames" ] (fun tag _ ->
      match tag with
      | "RuleNames" ->
          r_rule_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_names = Smaws_Lib.Xml.Parse.required "RuleNames" (( ! ) r_rule_names) i }
    : disable_insight_rules_input)

let disassociate_dataset_kms_key_output_of_xml i = ()

let disassociate_dataset_kms_key_input_of_xml i =
  let r_dataset_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DatasetIdentifier" ] (fun tag _ ->
      match tag with
      | "DatasetIdentifier" ->
          r_dataset_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetIdentifier"
                 (fun i _ -> dataset_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dataset_identifier =
       Smaws_Lib.Xml.Parse.required "DatasetIdentifier" (( ! ) r_dataset_identifier) i;
   }
    : disassociate_dataset_kms_key_input)

let duration_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let enable_alarm_actions_input_of_xml i =
  let r_alarm_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmNames" ] (fun tag _ ->
      match tag with
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_names = Smaws_Lib.Xml.Parse.required "AlarmNames" (( ! ) r_alarm_names) i }
    : enable_alarm_actions_input)

let limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> fault_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_exception)

let enable_insight_rules_output_of_xml i =
  let r_failures = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Failures" ] (fun tag _ ->
      match tag with
      | "Failures" ->
          r_failures :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Failures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> partial_failure_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failures = ( ! ) r_failures } : enable_insight_rules_output)

let enable_insight_rules_input_of_xml i =
  let r_rule_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleNames" ] (fun tag _ ->
      match tag with
      | "RuleNames" ->
          r_rule_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_names = Smaws_Lib.Xml.Parse.required "RuleNames" (( ! ) r_rule_names) i }
    : enable_insight_rules_input)

let entity_attributes_map_value_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let entity_attributes_map_key_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let entity_attributes_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> entity_attributes_map_key_string_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> entity_attributes_map_value_string_of_xml i)
          ()
      in
      (k, v))
    ()

let entity_key_attributes_map_value_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let entity_key_attributes_map_key_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let entity_key_attributes_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> entity_key_attributes_map_key_string_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> entity_key_attributes_map_value_string_of_xml i)
          ()
      in
      (k, v))
    ()

let entity_of_xml i =
  let r_key_attributes = ref None in
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KeyAttributes"; "Attributes" ] (fun tag _ ->
      match tag with
      | "KeyAttributes" ->
          r_key_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> entity_key_attributes_map_key_string_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> entity_key_attributes_map_value_string_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> entity_attributes_map_key_string_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> entity_attributes_map_value_string_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ key_attributes = ( ! ) r_key_attributes; attributes = ( ! ) r_attributes } : entity)

let storage_resolution_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let statistic_set_of_xml i =
  let r_sample_count = ref None in
  let r_sum = ref None in
  let r_minimum = ref None in
  let r_maximum = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SampleCount"; "Sum"; "Minimum"; "Maximum" ]
    (fun tag _ ->
      match tag with
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum" (fun i _ -> datapoint_value_of_xml i) ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sample_count = Smaws_Lib.Xml.Parse.required "SampleCount" (( ! ) r_sample_count) i;
     sum = Smaws_Lib.Xml.Parse.required "Sum" (( ! ) r_sum) i;
     minimum = Smaws_Lib.Xml.Parse.required "Minimum" (( ! ) r_minimum) i;
     maximum = Smaws_Lib.Xml.Parse.required "Maximum" (( ! ) r_maximum) i;
   }
    : statistic_set)

let metric_datum_of_xml i =
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_timestamp = ref None in
  let r_value = ref None in
  let r_statistic_values = ref None in
  let r_values = ref None in
  let r_counts = ref None in
  let r_unit_ = ref None in
  let r_storage_resolution = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricName";
      "Dimensions";
      "Timestamp";
      "Value";
      "StatisticValues";
      "Values";
      "Counts";
      "Unit";
      "StorageResolution";
    ] (fun tag _ ->
      match tag with
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> datapoint_value_of_xml i) ())
      | "StatisticValues" ->
          r_statistic_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatisticValues"
                 (fun i _ -> statistic_set_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> datapoint_value_of_xml i)
                     ())
                 ())
      | "Counts" ->
          r_counts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Counts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> datapoint_value_of_xml i)
                     ())
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "StorageResolution" ->
          r_storage_resolution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageResolution"
                 (fun i _ -> storage_resolution_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     dimensions = ( ! ) r_dimensions;
     timestamp = ( ! ) r_timestamp;
     value = ( ! ) r_value;
     statistic_values = ( ! ) r_statistic_values;
     values = ( ! ) r_values;
     counts = ( ! ) r_counts;
     unit_ = ( ! ) r_unit_;
     storage_resolution = ( ! ) r_storage_resolution;
   }
    : metric_datum)

let metric_data_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_datum_of_xml i) ()

let entity_metric_data_of_xml i =
  let r_entity = ref None in
  let r_metric_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Entity"; "MetricData" ] (fun tag _ ->
      match tag with
      | "Entity" ->
          r_entity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Entity" (fun i _ -> entity_of_xml i) ())
      | "MetricData" ->
          r_metric_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricData"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_datum_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ entity = ( ! ) r_entity; metric_data = ( ! ) r_metric_data } : entity_metric_data)

let entity_metric_data_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> entity_metric_data_of_xml i) ()

let expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let extended_statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> extended_statistic_of_xml i) ()

let mute_target_alarm_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> name_of_xml i) ()

let mute_targets_of_xml i =
  let r_alarm_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmNames" ] (fun tag _ ->
      match tag with
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_names = Smaws_Lib.Xml.Parse.required "AlarmNames" (( ! ) r_alarm_names) i }
    : mute_targets)

let schedule_of_xml i =
  let r_expression = ref None in
  let r_duration = ref None in
  let r_timezone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expression"; "Duration"; "Timezone" ]
    (fun tag _ ->
      match tag with
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression" (fun i _ -> expression_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> duration_of_xml i) ())
      | "Timezone" ->
          r_timezone :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone" (fun i _ -> timezone_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i;
     duration = Smaws_Lib.Xml.Parse.required "Duration" (( ! ) r_duration) i;
     timezone = ( ! ) r_timezone;
   }
    : schedule)

let rule_of_xml i =
  let r_schedule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Schedule" ] (fun tag _ ->
      match tag with
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> schedule_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ schedule = Smaws_Lib.Xml.Parse.required "Schedule" (( ! ) r_schedule) i } : rule)

let get_alarm_mute_rule_output_of_xml i =
  let r_name = ref None in
  let r_alarm_mute_rule_arn = ref None in
  let r_description = ref None in
  let r_rule = ref None in
  let r_mute_targets = ref None in
  let r_start_date = ref None in
  let r_expire_date = ref None in
  let r_status = ref None in
  let r_last_updated_timestamp = ref None in
  let r_mute_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Name";
      "AlarmMuteRuleArn";
      "Description";
      "Rule";
      "MuteTargets";
      "StartDate";
      "ExpireDate";
      "Status";
      "LastUpdatedTimestamp";
      "MuteType";
    ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | "AlarmMuteRuleArn" ->
          r_alarm_mute_rule_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleArn" (fun i _ -> arn_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "Rule" ->
          r_rule := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> rule_of_xml i) ())
      | "MuteTargets" ->
          r_mute_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MuteTargets"
                 (fun i _ -> mute_targets_of_xml i)
                 ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> alarm_mute_rule_status_of_xml i)
                 ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "MuteType" ->
          r_mute_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MuteType" (fun i _ -> mute_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = ( ! ) r_name;
     alarm_mute_rule_arn = ( ! ) r_alarm_mute_rule_arn;
     description = ( ! ) r_description;
     rule = ( ! ) r_rule;
     mute_targets = ( ! ) r_mute_targets;
     start_date = ( ! ) r_start_date;
     expire_date = ( ! ) r_expire_date;
     status = ( ! ) r_status;
     last_updated_timestamp = ( ! ) r_last_updated_timestamp;
     mute_type = ( ! ) r_mute_type;
   }
    : get_alarm_mute_rule_output)

let get_alarm_mute_rule_input_of_xml i =
  let r_alarm_mute_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmMuteRuleName" ] (fun tag _ ->
      match tag with
      | "AlarmMuteRuleName" ->
          r_alarm_mute_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleName"
                 (fun i _ -> name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_mute_rule_name =
       Smaws_Lib.Xml.Parse.required "AlarmMuteRuleName" (( ! ) r_alarm_mute_rule_name) i;
   }
    : get_alarm_mute_rule_input)

let get_dashboard_output_of_xml i =
  let r_dashboard_arn = ref None in
  let r_dashboard_body = ref None in
  let r_dashboard_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardArn"; "DashboardBody"; "DashboardName" ]
    (fun tag _ ->
      match tag with
      | "DashboardArn" ->
          r_dashboard_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardArn"
                 (fun i _ -> dashboard_arn_of_xml i)
                 ())
      | "DashboardBody" ->
          r_dashboard_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardBody"
                 (fun i _ -> dashboard_body_of_xml i)
                 ())
      | "DashboardName" ->
          r_dashboard_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardName"
                 (fun i _ -> dashboard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dashboard_arn = ( ! ) r_dashboard_arn;
     dashboard_body = ( ! ) r_dashboard_body;
     dashboard_name = ( ! ) r_dashboard_name;
   }
    : get_dashboard_output)

let get_dashboard_input_of_xml i =
  let r_dashboard_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardName" ] (fun tag _ ->
      match tag with
      | "DashboardName" ->
          r_dashboard_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardName"
                 (fun i _ -> dashboard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dashboard_name = Smaws_Lib.Xml.Parse.required "DashboardName" (( ! ) r_dashboard_name) i }
    : get_dashboard_input)

let get_dataset_output_of_xml i =
  let r_dataset_id = ref None in
  let r_arn = ref None in
  let r_kms_key_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DatasetId"; "Arn"; "KmsKeyArn" ] (fun tag _ ->
      match tag with
      | "DatasetId" ->
          r_dataset_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetId" (fun i _ -> dataset_id_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> dataset_arn_of_xml i) ())
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn" (fun i _ -> kms_key_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dataset_id = Smaws_Lib.Xml.Parse.required "DatasetId" (( ! ) r_dataset_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     kms_key_arn = ( ! ) r_kms_key_arn;
   }
    : get_dataset_output)

let get_dataset_input_of_xml i =
  let r_dataset_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DatasetIdentifier" ] (fun tag _ ->
      match tag with
      | "DatasetIdentifier" ->
          r_dataset_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetIdentifier"
                 (fun i _ -> dataset_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dataset_identifier =
       Smaws_Lib.Xml.Parse.required "DatasetIdentifier" (( ! ) r_dataset_identifier) i;
   }
    : get_dataset_input)

let insight_rule_unbound_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_metric_datapoint_of_xml i =
  let r_timestamp = ref None in
  let r_unique_contributors = ref None in
  let r_max_contributor_value = ref None in
  let r_sample_count = ref None in
  let r_average = ref None in
  let r_sum = ref None in
  let r_minimum = ref None in
  let r_maximum = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Timestamp";
      "UniqueContributors";
      "MaxContributorValue";
      "SampleCount";
      "Average";
      "Sum";
      "Minimum";
      "Maximum";
    ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "UniqueContributors" ->
          r_unique_contributors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UniqueContributors"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "MaxContributorValue" ->
          r_max_contributor_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxContributorValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Average" ->
          r_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Average"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     unique_contributors = ( ! ) r_unique_contributors;
     max_contributor_value = ( ! ) r_max_contributor_value;
     sample_count = ( ! ) r_sample_count;
     average = ( ! ) r_average;
     sum = ( ! ) r_sum;
     minimum = ( ! ) r_minimum;
     maximum = ( ! ) r_maximum;
   }
    : insight_rule_metric_datapoint)

let insight_rule_metric_datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_metric_datapoint_of_xml i)
    ()

let insight_rule_contributor_datapoint_of_xml i =
  let r_timestamp = ref None in
  let r_approximate_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timestamp"; "ApproximateValue" ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ApproximateValue" ->
          r_approximate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     approximate_value =
       Smaws_Lib.Xml.Parse.required "ApproximateValue" (( ! ) r_approximate_value) i;
   }
    : insight_rule_contributor_datapoint)

let insight_rule_contributor_datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_datapoint_of_xml i)
    ()

let insight_rule_contributor_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_contributor_keys_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_key_of_xml i)
    ()

let insight_rule_contributor_of_xml i =
  let r_keys = ref None in
  let r_approximate_aggregate_value = ref None in
  let r_datapoints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Keys"; "ApproximateAggregateValue"; "Datapoints" ]
    (fun tag _ ->
      match tag with
      | "Keys" ->
          r_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Keys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_key_of_xml i)
                     ())
                 ())
      | "ApproximateAggregateValue" ->
          r_approximate_aggregate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateAggregateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Datapoints" ->
          r_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Datapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_datapoint_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     keys = Smaws_Lib.Xml.Parse.required "Keys" (( ! ) r_keys) i;
     approximate_aggregate_value =
       Smaws_Lib.Xml.Parse.required "ApproximateAggregateValue"
         (( ! ) r_approximate_aggregate_value)
         i;
     datapoints = Smaws_Lib.Xml.Parse.required "Datapoints" (( ! ) r_datapoints) i;
   }
    : insight_rule_contributor)

let insight_rule_contributors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_contributor_of_xml i) ()

let insight_rule_unbound_long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_aggregation_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_contributor_key_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_contributor_key_labels_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_key_label_of_xml i)
    ()

let get_insight_rule_report_output_of_xml i =
  let r_key_labels = ref None in
  let r_aggregation_statistic = ref None in
  let r_aggregate_value = ref None in
  let r_approximate_unique_count = ref None in
  let r_contributors = ref None in
  let r_metric_datapoints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "KeyLabels";
      "AggregationStatistic";
      "AggregateValue";
      "ApproximateUniqueCount";
      "Contributors";
      "MetricDatapoints";
    ] (fun tag _ ->
      match tag with
      | "KeyLabels" ->
          r_key_labels :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyLabels"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_key_label_of_xml i)
                     ())
                 ())
      | "AggregationStatistic" ->
          r_aggregation_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregationStatistic"
                 (fun i _ -> insight_rule_aggregation_statistic_of_xml i)
                 ())
      | "AggregateValue" ->
          r_aggregate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "ApproximateUniqueCount" ->
          r_approximate_unique_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateUniqueCount"
                 (fun i _ -> insight_rule_unbound_long_of_xml i)
                 ())
      | "Contributors" ->
          r_contributors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Contributors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_of_xml i)
                     ())
                 ())
      | "MetricDatapoints" ->
          r_metric_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDatapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_metric_datapoint_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key_labels = ( ! ) r_key_labels;
     aggregation_statistic = ( ! ) r_aggregation_statistic;
     aggregate_value = ( ! ) r_aggregate_value;
     approximate_unique_count = ( ! ) r_approximate_unique_count;
     contributors = ( ! ) r_contributors;
     metric_datapoints = ( ! ) r_metric_datapoints;
   }
    : get_insight_rule_report_output)

let insight_rule_order_by_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_metric_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_metric_name_of_xml i) ()

let insight_rule_unbound_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_insight_rule_report_input_of_xml i =
  let r_rule_name = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_period = ref None in
  let r_max_contributor_count = ref None in
  let r_metrics = ref None in
  let r_order_by = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RuleName"; "StartTime"; "EndTime"; "Period"; "MaxContributorCount"; "Metrics"; "OrderBy" ]
    (fun tag _ ->
      match tag with
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "MaxContributorCount" ->
          r_max_contributor_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxContributorCount"
                 (fun i _ -> insight_rule_unbound_integer_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_metric_name_of_xml i)
                     ())
                 ())
      | "OrderBy" ->
          r_order_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderBy"
                 (fun i _ -> insight_rule_order_by_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     max_contributor_count = ( ! ) r_max_contributor_count;
     metrics = ( ! ) r_metrics;
     order_by = ( ! ) r_order_by;
   }
    : get_insight_rule_report_input)

let message_data_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_data_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let message_data_of_xml i =
  let r_code = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Value" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Code"
                 (fun i _ -> message_data_code_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> message_data_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; value = ( ! ) r_value } : message_data)

let metric_data_result_messages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> message_data_of_xml i) ()

let status_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Complete" -> COMPLETE
   | "InternalError" -> INTERNAL_ERROR
   | "PartialData" -> PARTIAL_DATA
   | "Forbidden" -> FORBIDDEN
   | _ -> failwith "unknown enum value"
    : status_code)

let timestamps_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_of_xml i) ()

let metric_data_result_of_xml i =
  let r_id = ref None in
  let r_label = ref None in
  let r_timestamps = ref None in
  let r_values = ref None in
  let r_status_code = ref None in
  let r_messages = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Id"; "Label"; "Timestamps"; "Values"; "StatusCode"; "Messages" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> metric_id_of_xml i) ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_of_xml i) ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> datapoint_value_of_xml i)
                     ())
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> status_code_of_xml i)
                 ())
      | "Messages" ->
          r_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Messages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_data_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     id = ( ! ) r_id;
     label = ( ! ) r_label;
     timestamps = ( ! ) r_timestamps;
     values = ( ! ) r_values;
     status_code = ( ! ) r_status_code;
     messages = ( ! ) r_messages;
   }
    : metric_data_result)

let metric_data_results_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_result_of_xml i) ()

let get_metric_data_output_of_xml i =
  let r_metric_data_results = ref None in
  let r_next_token = ref None in
  let r_messages = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricDataResults"; "NextToken"; "Messages" ]
    (fun tag _ ->
      match tag with
      | "MetricDataResults" ->
          r_metric_data_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_result_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Messages" ->
          r_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Messages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_data_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_data_results = ( ! ) r_metric_data_results;
     next_token = ( ! ) r_next_token;
     messages = ( ! ) r_messages;
   }
    : get_metric_data_output)

let get_metric_data_label_timezone_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let label_options_of_xml i =
  let r_timezone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timezone" ] (fun tag _ ->
      match tag with
      | "Timezone" ->
          r_timezone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone"
                 (fun i _ -> get_metric_data_label_timezone_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ timezone = ( ! ) r_timezone } : label_options)

let get_metric_data_max_datapoints_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_metric_data_input_of_xml i =
  let r_metric_data_queries = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_next_token = ref None in
  let r_scan_by = ref None in
  let r_max_datapoints = ref None in
  let r_label_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricDataQueries";
      "StartTime";
      "EndTime";
      "NextToken";
      "ScanBy";
      "MaxDatapoints";
      "LabelOptions";
    ] (fun tag _ ->
      match tag with
      | "MetricDataQueries" ->
          r_metric_data_queries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataQueries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ScanBy" ->
          r_scan_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanBy" (fun i _ -> scan_by_of_xml i) ())
      | "MaxDatapoints" ->
          r_max_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxDatapoints"
                 (fun i _ -> get_metric_data_max_datapoints_of_xml i)
                 ())
      | "LabelOptions" ->
          r_label_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LabelOptions"
                 (fun i _ -> label_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     next_token = ( ! ) r_next_token;
     scan_by = ( ! ) r_scan_by;
     max_datapoints = ( ! ) r_max_datapoints;
     label_options = ( ! ) r_label_options;
   }
    : get_metric_data_input)

let get_metric_statistics_output_of_xml i =
  let r_label = ref None in
  let r_datapoints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Label"; "Datapoints" ] (fun tag _ ->
      match tag with
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | "Datapoints" ->
          r_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Datapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ label = ( ! ) r_label; datapoints = ( ! ) r_datapoints } : get_metric_statistics_output)

let statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statistic_of_xml i) ()

let get_metric_statistics_input_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_period = ref None in
  let r_statistics = ref None in
  let r_extended_statistics = ref None in
  let r_unit_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "MetricName";
      "Dimensions";
      "StartTime";
      "EndTime";
      "Period";
      "Statistics";
      "ExtendedStatistics";
      "Unit";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Statistics" ->
          r_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statistic_of_xml i) ())
                 ())
      | "ExtendedStatistics" ->
          r_extended_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extended_statistic_of_xml i)
                     ())
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     dimensions = ( ! ) r_dimensions;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     statistics = ( ! ) r_statistics;
     extended_statistics = ( ! ) r_extended_statistics;
     unit_ = ( ! ) r_unit_;
   }
    : get_metric_statistics_input)

let include_linked_accounts_metrics_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metric_stream_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_stream_statistics_additional_statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_statistic_of_xml i) ()

let metric_stream_statistics_metric_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Namespace"; "MetricName" ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
   }
    : metric_stream_statistics_metric)

let metric_stream_statistics_include_metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> metric_stream_statistics_metric_of_xml i)
    ()

let metric_stream_statistics_configuration_of_xml i =
  let r_include_metrics = ref None in
  let r_additional_statistics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IncludeMetrics"; "AdditionalStatistics" ]
    (fun tag _ ->
      match tag with
      | "IncludeMetrics" ->
          r_include_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeMetrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistics_metric_of_xml i)
                     ())
                 ())
      | "AdditionalStatistics" ->
          r_additional_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalStatistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistic_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_metrics = Smaws_Lib.Xml.Parse.required "IncludeMetrics" (( ! ) r_include_metrics) i;
     additional_statistics =
       Smaws_Lib.Xml.Parse.required "AdditionalStatistics" (( ! ) r_additional_statistics) i;
   }
    : metric_stream_statistics_configuration)

let metric_stream_statistics_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> metric_stream_statistics_configuration_of_xml i)
    ()

let metric_stream_output_format_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "json" -> JSON
   | "opentelemetry0.7" -> OPEN_TELEMETRY_0_7
   | "opentelemetry1.0" -> OPEN_TELEMETRY_1_0
   | _ -> failwith "unknown enum value"
    : metric_stream_output_format)

let metric_stream_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_stream_filter_metric_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_name_of_xml i) ()

let metric_stream_filter_of_xml i =
  let r_namespace = ref None in
  let r_metric_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Namespace"; "MetricNames" ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricNames" ->
          r_metric_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ namespace = ( ! ) r_namespace; metric_names = ( ! ) r_metric_names } : metric_stream_filter)

let metric_stream_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_filter_of_xml i) ()

let get_metric_stream_output_of_xml i =
  let r_arn = ref None in
  let r_name = ref None in
  let r_include_filters = ref None in
  let r_exclude_filters = ref None in
  let r_firehose_arn = ref None in
  let r_role_arn = ref None in
  let r_state = ref None in
  let r_creation_date = ref None in
  let r_last_update_date = ref None in
  let r_output_format = ref None in
  let r_statistics_configurations = ref None in
  let r_include_linked_accounts_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Arn";
      "Name";
      "IncludeFilters";
      "ExcludeFilters";
      "FirehoseArn";
      "RoleArn";
      "State";
      "CreationDate";
      "LastUpdateDate";
      "OutputFormat";
      "StatisticsConfigurations";
      "IncludeLinkedAccountsMetrics";
    ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | "IncludeFilters" ->
          r_include_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "ExcludeFilters" ->
          r_exclude_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "RoleArn" ->
          r_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> metric_stream_state_of_xml i)
                 ())
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "LastUpdateDate" ->
          r_last_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdateDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | "StatisticsConfigurations" ->
          r_statistics_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatisticsConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistics_configuration_of_xml i)
                     ())
                 ())
      | "IncludeLinkedAccountsMetrics" ->
          r_include_linked_accounts_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccountsMetrics"
                 (fun i _ -> include_linked_accounts_metrics_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     name = ( ! ) r_name;
     include_filters = ( ! ) r_include_filters;
     exclude_filters = ( ! ) r_exclude_filters;
     firehose_arn = ( ! ) r_firehose_arn;
     role_arn = ( ! ) r_role_arn;
     state = ( ! ) r_state;
     creation_date = ( ! ) r_creation_date;
     last_update_date = ( ! ) r_last_update_date;
     output_format = ( ! ) r_output_format;
     statistics_configurations = ( ! ) r_statistics_configurations;
     include_linked_accounts_metrics = ( ! ) r_include_linked_accounts_metrics;
   }
    : get_metric_stream_output)

let get_metric_stream_input_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i } : get_metric_stream_input)

let metric_widget_image_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_metric_widget_image_output_of_xml i =
  let r_metric_widget_image = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricWidgetImage" ] (fun tag _ ->
      match tag with
      | "MetricWidgetImage" ->
          r_metric_widget_image :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricWidgetImage"
                 (fun i _ -> metric_widget_image_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric_widget_image = ( ! ) r_metric_widget_image } : get_metric_widget_image_output)

let output_format_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_widget_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_metric_widget_image_input_of_xml i =
  let r_metric_widget = ref None in
  let r_output_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricWidget"; "OutputFormat" ] (fun tag _ ->
      match tag with
      | "MetricWidget" ->
          r_metric_widget :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricWidget"
                 (fun i _ -> metric_widget_of_xml i)
                 ())
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> output_format_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_widget = Smaws_Lib.Xml.Parse.required "MetricWidget" (( ! ) r_metric_widget) i;
     output_format = ( ! ) r_output_format;
   }
    : get_metric_widget_image_input)

let o_tel_enrichment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Running" -> RUNNING | "Stopped" -> STOPPED | _ -> failwith "unknown enum value"
    : o_tel_enrichment_status)

let get_o_tel_enrichment_output_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> o_tel_enrichment_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i }
    : get_o_tel_enrichment_output)

let get_o_tel_enrichment_input_of_xml i = ()
let untag_resource_output_of_xml i = ()

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let untag_resource_input_of_xml i =
  let r_resource_ar_n = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceARN"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_resource_input)

let tag_resource_output_of_xml i = ()

let tag_resource_input_of_xml i =
  let r_resource_ar_n = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceARN"; "Tags" ] (fun tag _ ->
      match tag with
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_resource_input)

let stop_o_tel_enrichment_output_of_xml i = ()
let stop_o_tel_enrichment_input_of_xml i = ()
let stop_metric_streams_output_of_xml i = ()

let metric_stream_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_name_of_xml i) ()

let stop_metric_streams_input_of_xml i =
  let r_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Names" ] (fun tag _ ->
      match tag with
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ names = Smaws_Lib.Xml.Parse.required "Names" (( ! ) r_names) i } : stop_metric_streams_input)

let start_o_tel_enrichment_output_of_xml i = ()
let start_o_tel_enrichment_input_of_xml i = ()
let start_metric_streams_output_of_xml i = ()

let start_metric_streams_input_of_xml i =
  let r_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Names" ] (fun tag _ ->
      match tag with
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ names = Smaws_Lib.Xml.Parse.required "Names" (( ! ) r_names) i } : start_metric_streams_input)

let invalid_format_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_format_fault)

let set_alarm_state_input_of_xml i =
  let r_alarm_name = ref None in
  let r_state_value = ref None in
  let r_state_reason = ref None in
  let r_state_reason_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AlarmName"; "StateValue"; "StateReason"; "StateReasonData" ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     state_value = Smaws_Lib.Xml.Parse.required "StateValue" (( ! ) r_state_value) i;
     state_reason = Smaws_Lib.Xml.Parse.required "StateReason" (( ! ) r_state_reason) i;
     state_reason_data = ( ! ) r_state_reason_data;
   }
    : set_alarm_state_input)

let put_metric_stream_output_of_xml i =
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn } : put_metric_stream_output)

let put_metric_stream_input_of_xml i =
  let r_name = ref None in
  let r_include_filters = ref None in
  let r_exclude_filters = ref None in
  let r_firehose_arn = ref None in
  let r_role_arn = ref None in
  let r_output_format = ref None in
  let r_tags = ref None in
  let r_statistics_configurations = ref None in
  let r_include_linked_accounts_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Name";
      "IncludeFilters";
      "ExcludeFilters";
      "FirehoseArn";
      "RoleArn";
      "OutputFormat";
      "Tags";
      "StatisticsConfigurations";
      "IncludeLinkedAccountsMetrics";
    ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | "IncludeFilters" ->
          r_include_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "ExcludeFilters" ->
          r_exclude_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "RoleArn" ->
          r_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "StatisticsConfigurations" ->
          r_statistics_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatisticsConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistics_configuration_of_xml i)
                     ())
                 ())
      | "IncludeLinkedAccountsMetrics" ->
          r_include_linked_accounts_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccountsMetrics"
                 (fun i _ -> include_linked_accounts_metrics_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     include_filters = ( ! ) r_include_filters;
     exclude_filters = ( ! ) r_exclude_filters;
     firehose_arn = Smaws_Lib.Xml.Parse.required "FirehoseArn" (( ! ) r_firehose_arn) i;
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     output_format = Smaws_Lib.Xml.Parse.required "OutputFormat" (( ! ) r_output_format) i;
     tags = ( ! ) r_tags;
     statistics_configurations = ( ! ) r_statistics_configurations;
     include_linked_accounts_metrics = ( ! ) r_include_linked_accounts_metrics;
   }
    : put_metric_stream_input)

let strict_entity_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let put_metric_data_input_of_xml i =
  let r_namespace = ref None in
  let r_metric_data = ref None in
  let r_entity_metric_data = ref None in
  let r_strict_entity_validation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Namespace"; "MetricData"; "EntityMetricData"; "StrictEntityValidation" ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricData" ->
          r_metric_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricData"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_datum_of_xml i)
                     ())
                 ())
      | "EntityMetricData" ->
          r_entity_metric_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityMetricData"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> entity_metric_data_of_xml i)
                     ())
                 ())
      | "StrictEntityValidation" ->
          r_strict_entity_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StrictEntityValidation"
                 (fun i _ -> strict_entity_validation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     metric_data = ( ! ) r_metric_data;
     entity_metric_data = ( ! ) r_entity_metric_data;
     strict_entity_validation = ( ! ) r_strict_entity_validation;
   }
    : put_metric_data_input)

let limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_fault)

let put_metric_alarm_input_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_description = ref None in
  let r_actions_enabled = ref None in
  let r_ok_actions = ref None in
  let r_alarm_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_statistic = ref None in
  let r_extended_statistic = ref None in
  let r_dimensions = ref None in
  let r_period = ref None in
  let r_unit_ = ref None in
  let r_evaluation_periods = ref None in
  let r_datapoints_to_alarm = ref None in
  let r_threshold = ref None in
  let r_comparison_operator = ref None in
  let r_treat_missing_data = ref None in
  let r_evaluate_low_sample_count_percentile = ref None in
  let r_metrics = ref None in
  let r_tags = ref None in
  let r_threshold_metric_id = ref None in
  let r_evaluation_window = ref None in
  let r_evaluation_criteria = ref None in
  let r_evaluation_interval = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmDescription";
      "ActionsEnabled";
      "OKActions";
      "AlarmActions";
      "InsufficientDataActions";
      "MetricName";
      "Namespace";
      "Statistic";
      "ExtendedStatistic";
      "Dimensions";
      "Period";
      "Unit";
      "EvaluationPeriods";
      "DatapointsToAlarm";
      "Threshold";
      "ComparisonOperator";
      "TreatMissingData";
      "EvaluateLowSampleCountPercentile";
      "Metrics";
      "Tags";
      "ThresholdMetricId";
      "EvaluationWindow";
      "EvaluationCriteria";
      "EvaluationInterval";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "EvaluationPeriods" ->
          r_evaluation_periods :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationPeriods"
                 (fun i _ -> evaluation_periods_of_xml i)
                 ())
      | "DatapointsToAlarm" ->
          r_datapoints_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatapointsToAlarm"
                 (fun i _ -> datapoints_to_alarm_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "EvaluateLowSampleCountPercentile" ->
          r_evaluate_low_sample_count_percentile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluateLowSampleCountPercentile"
                 (fun i _ -> evaluate_low_sample_count_percentile_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ThresholdMetricId" ->
          r_threshold_metric_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThresholdMetricId"
                 (fun i _ -> metric_id_of_xml i)
                 ())
      | "EvaluationWindow" ->
          r_evaluation_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationWindow"
                 (fun i _ -> evaluation_window_of_xml i)
                 ())
      | "EvaluationCriteria" ->
          r_evaluation_criteria :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationCriteria"
                 (fun i _ -> evaluation_criteria_of_xml i)
                 ())
      | "EvaluationInterval" ->
          r_evaluation_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationInterval"
                 (fun i _ -> evaluation_interval_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     alarm_description = ( ! ) r_alarm_description;
     actions_enabled = ( ! ) r_actions_enabled;
     ok_actions = ( ! ) r_ok_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
     statistic = ( ! ) r_statistic;
     extended_statistic = ( ! ) r_extended_statistic;
     dimensions = ( ! ) r_dimensions;
     period = ( ! ) r_period;
     unit_ = ( ! ) r_unit_;
     evaluation_periods = ( ! ) r_evaluation_periods;
     datapoints_to_alarm = ( ! ) r_datapoints_to_alarm;
     threshold = ( ! ) r_threshold;
     comparison_operator = ( ! ) r_comparison_operator;
     treat_missing_data = ( ! ) r_treat_missing_data;
     evaluate_low_sample_count_percentile = ( ! ) r_evaluate_low_sample_count_percentile;
     metrics = ( ! ) r_metrics;
     tags = ( ! ) r_tags;
     threshold_metric_id = ( ! ) r_threshold_metric_id;
     evaluation_window = ( ! ) r_evaluation_window;
     evaluation_criteria = ( ! ) r_evaluation_criteria;
     evaluation_interval = ( ! ) r_evaluation_interval;
   }
    : put_metric_alarm_input)

let put_managed_insight_rules_output_of_xml i =
  let r_failures = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Failures" ] (fun tag _ ->
      match tag with
      | "Failures" ->
          r_failures :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Failures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> partial_failure_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failures = ( ! ) r_failures } : put_managed_insight_rules_output)

let template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let managed_rule_of_xml i =
  let r_template_name = ref None in
  let r_resource_ar_n = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "ResourceARN"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
     tags = ( ! ) r_tags;
   }
    : managed_rule)

let managed_rules_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_rule_of_xml i) ()

let put_managed_insight_rules_input_of_xml i =
  let r_managed_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ManagedRules" ] (fun tag _ ->
      match tag with
      | "ManagedRules" ->
          r_managed_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedRules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_rule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ managed_rules = Smaws_Lib.Xml.Parse.required "ManagedRules" (( ! ) r_managed_rules) i }
    : put_managed_insight_rules_input)

let put_log_alarm_input_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_description = ref None in
  let r_scheduled_query_configuration = ref None in
  let r_action_log_line_count = ref None in
  let r_action_log_line_role_arn = ref None in
  let r_actions_enabled = ref None in
  let r_ok_actions = ref None in
  let r_alarm_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_query_results_to_evaluate = ref None in
  let r_query_results_to_alarm = ref None in
  let r_threshold = ref None in
  let r_comparison_operator = ref None in
  let r_treat_missing_data = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmName";
      "AlarmDescription";
      "ScheduledQueryConfiguration";
      "ActionLogLineCount";
      "ActionLogLineRoleArn";
      "ActionsEnabled";
      "OKActions";
      "AlarmActions";
      "InsufficientDataActions";
      "QueryResultsToEvaluate";
      "QueryResultsToAlarm";
      "Threshold";
      "ComparisonOperator";
      "TreatMissingData";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "ScheduledQueryConfiguration" ->
          r_scheduled_query_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryConfiguration"
                 (fun i _ -> scheduled_query_configuration_of_xml i)
                 ())
      | "ActionLogLineCount" ->
          r_action_log_line_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineCount"
                 (fun i _ -> action_log_line_count_of_xml i)
                 ())
      | "ActionLogLineRoleArn" ->
          r_action_log_line_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineRoleArn"
                 (fun i _ -> action_log_line_role_arn_of_xml i)
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "QueryResultsToEvaluate" ->
          r_query_results_to_evaluate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToEvaluate"
                 (fun i _ -> query_results_to_evaluate_of_xml i)
                 ())
      | "QueryResultsToAlarm" ->
          r_query_results_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToAlarm"
                 (fun i _ -> query_results_to_alarm_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     alarm_description = ( ! ) r_alarm_description;
     scheduled_query_configuration =
       Smaws_Lib.Xml.Parse.required "ScheduledQueryConfiguration"
         (( ! ) r_scheduled_query_configuration)
         i;
     action_log_line_count = ( ! ) r_action_log_line_count;
     action_log_line_role_arn = ( ! ) r_action_log_line_role_arn;
     actions_enabled = ( ! ) r_actions_enabled;
     ok_actions = ( ! ) r_ok_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     query_results_to_evaluate =
       Smaws_Lib.Xml.Parse.required "QueryResultsToEvaluate" (( ! ) r_query_results_to_evaluate) i;
     query_results_to_alarm =
       Smaws_Lib.Xml.Parse.required "QueryResultsToAlarm" (( ! ) r_query_results_to_alarm) i;
     threshold = Smaws_Lib.Xml.Parse.required "Threshold" (( ! ) r_threshold) i;
     comparison_operator =
       Smaws_Lib.Xml.Parse.required "ComparisonOperator" (( ! ) r_comparison_operator) i;
     treat_missing_data = ( ! ) r_treat_missing_data;
     tags = ( ! ) r_tags;
   }
    : put_log_alarm_input)

let put_insight_rule_output_of_xml i = ()

let put_insight_rule_input_of_xml i =
  let r_rule_name = ref None in
  let r_rule_state = ref None in
  let r_rule_definition = ref None in
  let r_tags = ref None in
  let r_apply_on_transformed_logs = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RuleName"; "RuleState"; "RuleDefinition"; "Tags"; "ApplyOnTransformedLogs" ] (fun tag _ ->
      match tag with
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | "RuleState" ->
          r_rule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleState"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | "RuleDefinition" ->
          r_rule_definition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleDefinition"
                 (fun i _ -> insight_rule_definition_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ApplyOnTransformedLogs" ->
          r_apply_on_transformed_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyOnTransformedLogs"
                 (fun i _ -> insight_rule_on_transformed_logs_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     rule_state = ( ! ) r_rule_state;
     rule_definition = Smaws_Lib.Xml.Parse.required "RuleDefinition" (( ! ) r_rule_definition) i;
     tags = ( ! ) r_tags;
     apply_on_transformed_logs = ( ! ) r_apply_on_transformed_logs;
   }
    : put_insight_rule_input)

let put_dashboard_output_of_xml i =
  let r_dashboard_validation_messages = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardValidationMessages" ] (fun tag _ ->
      match tag with
      | "DashboardValidationMessages" ->
          r_dashboard_validation_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardValidationMessages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_validation_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dashboard_validation_messages = ( ! ) r_dashboard_validation_messages } : put_dashboard_output)

let put_dashboard_input_of_xml i =
  let r_dashboard_name = ref None in
  let r_dashboard_body = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardName"; "DashboardBody"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "DashboardName" ->
          r_dashboard_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardName"
                 (fun i _ -> dashboard_name_of_xml i)
                 ())
      | "DashboardBody" ->
          r_dashboard_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardBody"
                 (fun i _ -> dashboard_body_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dashboard_name = Smaws_Lib.Xml.Parse.required "DashboardName" (( ! ) r_dashboard_name) i;
     dashboard_body = Smaws_Lib.Xml.Parse.required "DashboardBody" (( ! ) r_dashboard_body) i;
     tags = ( ! ) r_tags;
   }
    : put_dashboard_input)

let put_composite_alarm_input_of_xml i =
  let r_actions_enabled = ref None in
  let r_alarm_actions = ref None in
  let r_alarm_description = ref None in
  let r_alarm_name = ref None in
  let r_alarm_rule = ref None in
  let r_insufficient_data_actions = ref None in
  let r_ok_actions = ref None in
  let r_tags = ref None in
  let r_actions_suppressor = ref None in
  let r_actions_suppressor_wait_period = ref None in
  let r_actions_suppressor_extension_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionsEnabled";
      "AlarmActions";
      "AlarmDescription";
      "AlarmName";
      "AlarmRule";
      "InsufficientDataActions";
      "OKActions";
      "Tags";
      "ActionsSuppressor";
      "ActionsSuppressorWaitPeriod";
      "ActionsSuppressorExtensionPeriod";
    ] (fun tag _ ->
      match tag with
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmDescription" ->
          r_alarm_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmDescription"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | "AlarmRule" ->
          r_alarm_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmRule" (fun i _ -> alarm_rule_of_xml i) ())
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ActionsSuppressor" ->
          r_actions_suppressor :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressor"
                 (fun i _ -> alarm_arn_of_xml i)
                 ())
      | "ActionsSuppressorWaitPeriod" ->
          r_actions_suppressor_wait_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorWaitPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressorExtensionPeriod" ->
          r_actions_suppressor_extension_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorExtensionPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     actions_enabled = ( ! ) r_actions_enabled;
     alarm_actions = ( ! ) r_alarm_actions;
     alarm_description = ( ! ) r_alarm_description;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     alarm_rule = Smaws_Lib.Xml.Parse.required "AlarmRule" (( ! ) r_alarm_rule) i;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     ok_actions = ( ! ) r_ok_actions;
     tags = ( ! ) r_tags;
     actions_suppressor = ( ! ) r_actions_suppressor;
     actions_suppressor_wait_period = ( ! ) r_actions_suppressor_wait_period;
     actions_suppressor_extension_period = ( ! ) r_actions_suppressor_extension_period;
   }
    : put_composite_alarm_input)

let put_anomaly_detector_output_of_xml i = ()

let put_anomaly_detector_input_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_stat = ref None in
  let r_configuration = ref None in
  let r_metric_characteristics = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_metric_math_anomaly_detector = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "MetricName";
      "Dimensions";
      "Stat";
      "Configuration";
      "MetricCharacteristics";
      "SingleMetricAnomalyDetector";
      "MetricMathAnomalyDetector";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> anomaly_detector_configuration_of_xml i)
                 ())
      | "MetricCharacteristics" ->
          r_metric_characteristics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricCharacteristics"
                 (fun i _ -> metric_characteristics_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     stat = ( ! ) r_stat;
     configuration = ( ! ) r_configuration;
     metric_characteristics = ( ! ) r_metric_characteristics;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
   }
    : put_anomaly_detector_input)

let put_alarm_mute_rule_input_of_xml i =
  let r_name = ref None in
  let r_description = ref None in
  let r_rule = ref None in
  let r_mute_targets = ref None in
  let r_tags = ref None in
  let r_start_date = ref None in
  let r_expire_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Name"; "Description"; "Rule"; "MuteTargets"; "Tags"; "StartDate"; "ExpireDate" ]
    (fun tag _ ->
      match tag with
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "Rule" ->
          r_rule := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> rule_of_xml i) ())
      | "MuteTargets" ->
          r_mute_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MuteTargets"
                 (fun i _ -> mute_targets_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     description = ( ! ) r_description;
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
     mute_targets = ( ! ) r_mute_targets;
     tags = ( ! ) r_tags;
     start_date = ( ! ) r_start_date;
     expire_date = ( ! ) r_expire_date;
   }
    : put_alarm_mute_rule_input)

let list_tags_for_resource_output_of_xml i =
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags } : list_tags_for_resource_output)

let list_tags_for_resource_input_of_xml i =
  let r_resource_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceARN" ] (fun tag _ ->
      match tag with
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i }
    : list_tags_for_resource_input)

let metric_stream_entry_of_xml i =
  let r_arn = ref None in
  let r_creation_date = ref None in
  let r_last_update_date = ref None in
  let r_name = ref None in
  let r_firehose_arn = ref None in
  let r_state = ref None in
  let r_output_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Arn"; "CreationDate"; "LastUpdateDate"; "Name"; "FirehoseArn"; "State"; "OutputFormat" ]
    (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "LastUpdateDate" ->
          r_last_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdateDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> metric_stream_state_of_xml i)
                 ())
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     creation_date = ( ! ) r_creation_date;
     last_update_date = ( ! ) r_last_update_date;
     name = ( ! ) r_name;
     firehose_arn = ( ! ) r_firehose_arn;
     state = ( ! ) r_state;
     output_format = ( ! ) r_output_format;
   }
    : metric_stream_entry)

let metric_stream_entries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_entry_of_xml i) ()

let list_metric_streams_output_of_xml i =
  let r_next_token = ref None in
  let r_entries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Entries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Entries" ->
          r_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Entries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; entries = ( ! ) r_entries } : list_metric_streams_output)

let list_metric_streams_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_metric_streams_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> list_metric_streams_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_results = ( ! ) r_max_results }
    : list_metric_streams_input)

let owning_accounts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_id_of_xml i) ()

let metrics_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_of_xml i) ()

let list_metrics_output_of_xml i =
  let r_metrics = ref None in
  let r_next_token = ref None in
  let r_owning_accounts = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metrics"; "NextToken"; "OwningAccounts" ]
    (fun tag _ ->
      match tag with
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "OwningAccounts" ->
          r_owning_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwningAccounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_id_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metrics = ( ! ) r_metrics;
     next_token = ( ! ) r_next_token;
     owning_accounts = ( ! ) r_owning_accounts;
   }
    : list_metrics_output)

let include_linked_accounts_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let recently_active_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PT3H" -> PT3H | _ -> failwith "unknown enum value" : recently_active)

let list_metrics_input_of_xml i =
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_dimensions = ref None in
  let r_next_token = ref None in
  let r_recently_active = ref None in
  let r_include_linked_accounts = ref None in
  let r_owning_account = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "MetricName";
      "Dimensions";
      "NextToken";
      "RecentlyActive";
      "IncludeLinkedAccounts";
      "OwningAccount";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dimension_filter_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "RecentlyActive" ->
          r_recently_active :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecentlyActive"
                 (fun i _ -> recently_active_of_xml i)
                 ())
      | "IncludeLinkedAccounts" ->
          r_include_linked_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccounts"
                 (fun i _ -> include_linked_accounts_of_xml i)
                 ())
      | "OwningAccount" ->
          r_owning_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwningAccount"
                 (fun i _ -> account_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     dimensions = ( ! ) r_dimensions;
     next_token = ( ! ) r_next_token;
     recently_active = ( ! ) r_recently_active;
     include_linked_accounts = ( ! ) r_include_linked_accounts;
     owning_account = ( ! ) r_owning_account;
   }
    : list_metrics_input)

let managed_rule_state_of_xml i =
  let r_rule_name = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleName"; "State" ] (fun tag _ ->
      match tag with
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
   }
    : managed_rule_state)

let managed_rule_description_of_xml i =
  let r_template_name = ref None in
  let r_resource_ar_n = ref None in
  let r_rule_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "ResourceARN"; "RuleState" ]
    (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "RuleState" ->
          r_rule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleState"
                 (fun i _ -> managed_rule_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = ( ! ) r_template_name;
     resource_ar_n = ( ! ) r_resource_ar_n;
     rule_state = ( ! ) r_rule_state;
   }
    : managed_rule_description)

let managed_rule_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_rule_description_of_xml i) ()

let list_managed_insight_rules_output_of_xml i =
  let r_managed_rules = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ManagedRules"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ManagedRules" ->
          r_managed_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedRules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_rule_description_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ managed_rules = ( ! ) r_managed_rules; next_token = ( ! ) r_next_token }
    : list_managed_insight_rules_output)

let list_managed_insight_rules_input_of_xml i =
  let r_resource_ar_n = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceARN"; "NextToken"; "MaxResults" ]
    (fun tag _ ->
      match tag with
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> insight_rule_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : list_managed_insight_rules_input)

let list_dashboards_output_of_xml i =
  let r_dashboard_entries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardEntries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "DashboardEntries" ->
          r_dashboard_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardEntries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_entry_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dashboard_entries = ( ! ) r_dashboard_entries; next_token = ( ! ) r_next_token }
    : list_dashboards_output)

let list_dashboards_input_of_xml i =
  let r_dashboard_name_prefix = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardNamePrefix"; "NextToken" ] (fun tag _ ->
      match tag with
      | "DashboardNamePrefix" ->
          r_dashboard_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardNamePrefix"
                 (fun i _ -> dashboard_name_prefix_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dashboard_name_prefix = ( ! ) r_dashboard_name_prefix; next_token = ( ! ) r_next_token }
    : list_dashboards_input)

let list_alarm_mute_rules_output_of_xml i =
  let r_alarm_mute_rule_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmMuteRuleSummaries"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "AlarmMuteRuleSummaries" ->
          r_alarm_mute_rule_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_mute_rule_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_mute_rule_summaries = ( ! ) r_alarm_mute_rule_summaries;
     next_token = ( ! ) r_next_token;
   }
    : list_alarm_mute_rules_output)

let list_alarm_mute_rules_input_of_xml i =
  let r_alarm_name = ref None in
  let r_statuses = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AlarmName"; "Statuses"; "MaxRecords"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> name_of_xml i) ())
      | "Statuses" ->
          r_statuses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statuses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_mute_rule_status_of_xml i)
                     ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_name = ( ! ) r_alarm_name;
     statuses = ( ! ) r_statuses;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : list_alarm_mute_rules_input)
