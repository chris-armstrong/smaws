open Types

let unit_of_xml _ = ()
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

let datapoint_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let untag_resource_output_of_xml i = ()
let amazon_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let untag_resource_input_of_xml i =
  let r_tag_keys = ref None in
  let r_resource_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagKeys"; "ResourceARN" ] (fun tag _ ->
      match tag with
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
   }
    : untag_resource_input)

let resource_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let fault_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_not_found_exception_of_xml i =
  let r_message = ref None in
  let r_resource_id = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "ResourceId"; "ResourceType" ]
    (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> fault_description_of_xml i)
                 ())
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId"
                 (fun i _ -> resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     resource_id = ( ! ) r_resource_id;
     resource_type = ( ! ) r_resource_type;
   }
    : resource_not_found_exception)

let aws_query_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let treat_missing_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let timestamps_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_of_xml i) ()

let threshold_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_resource_output_of_xml i = ()

let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
   }
    : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let tag_resource_input_of_xml i =
  let r_tags = ref None in
  let r_resource_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceARN" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
   }
    : tag_resource_input)

let suppressor_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let strict_entity_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let storage_resolution_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stop_o_tel_enrichment_output_of_xml i = ()
let stop_o_tel_enrichment_input_of_xml i = ()
let stop_metric_streams_output_of_xml i = ()
let metric_stream_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let status_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Forbidden" -> FORBIDDEN
   | "PartialData" -> PARTIAL_DATA
   | "InternalError" -> INTERNAL_ERROR
   | "Complete" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : status_code)

let statistic_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Maximum" -> Maximum
   | "Minimum" -> Minimum
   | "Sum" -> Sum
   | "Average" -> Average
   | "SampleCount" -> SampleCount
   | _ -> failwith "unknown enum value"
    : statistic)

let statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statistic_of_xml i) ()

let statistic_set_of_xml i =
  let r_maximum = ref None in
  let r_minimum = ref None in
  let r_sum = ref None in
  let r_sample_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Maximum"; "Minimum"; "Sum"; "SampleCount" ]
    (fun tag _ ->
      match tag with
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum" (fun i _ -> datapoint_value_of_xml i) ())
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maximum = Smaws_Lib.Xml.Parse.required "Maximum" (( ! ) r_maximum) i;
     minimum = Smaws_Lib.Xml.Parse.required "Minimum" (( ! ) r_minimum) i;
     sum = Smaws_Lib.Xml.Parse.required "Sum" (( ! ) r_sum) i;
     sample_count = Smaws_Lib.Xml.Parse.required "SampleCount" (( ! ) r_sample_count) i;
   }
    : statistic_set)

let state_value_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
   | "ALARM" -> ALARM
   | "OK" -> OK
   | _ -> failwith "unknown enum value"
    : state_value)

let state_reason_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let state_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let start_time_offset_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

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

let standard_unit_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "None" -> None_
   | "Count/Second" -> Count_Second
   | "Terabits/Second" -> Terabits_Second
   | "Gigabits/Second" -> Gigabits_Second
   | "Megabits/Second" -> Megabits_Second
   | "Kilobits/Second" -> Kilobits_Second
   | "Bits/Second" -> Bits_Second
   | "Terabytes/Second" -> Terabytes_Second
   | "Gigabytes/Second" -> Gigabytes_Second
   | "Megabytes/Second" -> Megabytes_Second
   | "Kilobytes/Second" -> Kilobytes_Second
   | "Bytes/Second" -> Bytes_Second
   | "Count" -> Count
   | "Percent" -> Percent
   | "Terabits" -> Terabits
   | "Gigabits" -> Gigabits
   | "Megabits" -> Megabits
   | "Kilobits" -> Kilobits
   | "Bits" -> Bits
   | "Terabytes" -> Terabytes
   | "Gigabytes" -> Gigabytes
   | "Megabytes" -> Megabytes
   | "Kilobytes" -> Kilobytes
   | "Bytes" -> Bytes
   | "Milliseconds" -> Milliseconds
   | "Microseconds" -> Microseconds
   | "Seconds" -> Seconds
   | _ -> failwith "unknown enum value"
    : standard_unit)

let sliding_window_of_xml i = ()

let size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let account_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dimension_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> dimension_value_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> dimension_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : dimension)

let dimensions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ()

let anomaly_detector_metric_stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let single_metric_anomaly_detector_of_xml i =
  let r_stat = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Stat"; "Dimensions"; "MetricName"; "Namespace"; "AccountId" ] (fun tag _ ->
      match tag with
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> account_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stat = ( ! ) r_stat;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
     account_id = ( ! ) r_account_id;
   }
    : single_metric_anomaly_detector)

let alarm_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let set_alarm_state_input_of_xml i =
  let r_state_reason_data = ref None in
  let r_state_reason = ref None in
  let r_state_value = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StateReasonData"; "StateReason"; "StateValue"; "AlarmName" ] (fun tag _ ->
      match tag with
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     state_reason_data = ( ! ) r_state_reason_data;
     state_reason = Smaws_Lib.Xml.Parse.required "StateReason" (( ! ) r_state_reason) i;
     state_value = Smaws_Lib.Xml.Parse.required "StateValue" (( ! ) r_state_value) i;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
   }
    : set_alarm_state_input)

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

let query_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let log_group_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> amazon_resource_name_of_xml i) ()

let schedule_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let end_time_offset_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let schedule_configuration_of_xml i =
  let r_end_time_offset = ref None in
  let r_start_time_offset = ref None in
  let r_schedule_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EndTimeOffset"; "StartTimeOffset"; "ScheduleExpression" ] (fun tag _ ->
      match tag with
      | "EndTimeOffset" ->
          r_end_time_offset :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimeOffset"
                 (fun i _ -> end_time_offset_of_xml i)
                 ())
      | "StartTimeOffset" ->
          r_start_time_offset :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTimeOffset"
                 (fun i _ -> start_time_offset_of_xml i)
                 ())
      | "ScheduleExpression" ->
          r_schedule_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleExpression"
                 (fun i _ -> schedule_expression_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     end_time_offset = ( ! ) r_end_time_offset;
     start_time_offset = ( ! ) r_start_time_offset;
     schedule_expression =
       Smaws_Lib.Xml.Parse.required "ScheduleExpression" (( ! ) r_schedule_expression) i;
   }
    : schedule_configuration)

let aggregation_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let scheduled_query_configuration_of_xml i =
  let r_tags = ref None in
  let r_aggregation_expression = ref None in
  let r_schedule_configuration = ref None in
  let r_scheduled_query_role_ar_n = ref None in
  let r_query_ar_n = ref None in
  let r_log_group_identifiers = ref None in
  let r_query_string = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "AggregationExpression";
      "ScheduleConfiguration";
      "ScheduledQueryRoleARN";
      "QueryARN";
      "LogGroupIdentifiers";
      "QueryString";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AggregationExpression" ->
          r_aggregation_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregationExpression"
                 (fun i _ -> aggregation_expression_of_xml i)
                 ())
      | "ScheduleConfiguration" ->
          r_schedule_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleConfiguration"
                 (fun i _ -> schedule_configuration_of_xml i)
                 ())
      | "ScheduledQueryRoleARN" ->
          r_scheduled_query_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryRoleARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "QueryARN" ->
          r_query_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
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
      | "QueryString" ->
          r_query_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryString"
                 (fun i _ -> query_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     aggregation_expression =
       Smaws_Lib.Xml.Parse.required "AggregationExpression" (( ! ) r_aggregation_expression) i;
     schedule_configuration =
       Smaws_Lib.Xml.Parse.required "ScheduleConfiguration" (( ! ) r_schedule_configuration) i;
     scheduled_query_role_ar_n =
       Smaws_Lib.Xml.Parse.required "ScheduledQueryRoleARN" (( ! ) r_scheduled_query_role_ar_n) i;
     query_ar_n = ( ! ) r_query_ar_n;
     log_group_identifiers = ( ! ) r_log_group_identifiers;
     query_string = Smaws_Lib.Xml.Parse.required "QueryString" (( ! ) r_query_string) i;
   }
    : scheduled_query_configuration)

let expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let duration_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let schedule_of_xml i =
  let r_timezone = ref None in
  let r_duration = ref None in
  let r_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timezone"; "Duration"; "Expression" ]
    (fun tag _ ->
      match tag with
      | "Timezone" ->
          r_timezone :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone" (fun i _ -> timezone_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> duration_of_xml i) ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression" (fun i _ -> expression_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timezone = ( ! ) r_timezone;
     duration = Smaws_Lib.Xml.Parse.required "Duration" (( ! ) r_duration) i;
     expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i;
   }
    : schedule)

let scan_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TimestampAscending" -> TIMESTAMP_ASCENDING
   | "TimestampDescending" -> TIMESTAMP_DESCENDING
   | _ -> failwith "unknown enum value"
    : scan_by)

let rule_of_xml i =
  let r_schedule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Schedule" ] (fun tag _ ->
      match tag with
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> schedule_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ schedule = Smaws_Lib.Xml.Parse.required "Schedule" (( ! ) r_schedule) i } : rule)

let return_data_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

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

let recovery_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let recently_active_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PT3H" -> PT3H | _ -> failwith "unknown enum value" : recently_active)

let range_of_xml i =
  let r_end_time = ref None in
  let r_start_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndTime"; "StartTime" ] (fun tag _ ->
      match tag with
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
   }
    : range)

let query_results_to_evaluate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let query_results_to_alarm_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let query_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let metric_stream_filter_metric_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_name_of_xml i) ()

let metric_stream_filter_of_xml i =
  let r_metric_names = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricNames"; "Namespace" ] (fun tag _ ->
      match tag with
      | "MetricNames" ->
          r_metric_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_name_of_xml i)
                     ())
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric_names = ( ! ) r_metric_names; namespace = ( ! ) r_namespace } : metric_stream_filter)

let metric_stream_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_filter_of_xml i) ()

let metric_stream_output_format_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "opentelemetry1.0" -> OPEN_TELEMETRY_1_0
   | "opentelemetry0.7" -> OPEN_TELEMETRY_0_7
   | "json" -> JSON
   | _ -> failwith "unknown enum value"
    : metric_stream_output_format)

let metric_stream_statistics_metric_of_xml i =
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricName"; "Namespace" ] (fun tag _ ->
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
   }
    : metric_stream_statistics_metric)

let metric_stream_statistics_include_metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> metric_stream_statistics_metric_of_xml i)
    ()

let metric_stream_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_stream_statistics_additional_statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_statistic_of_xml i) ()

let metric_stream_statistics_configuration_of_xml i =
  let r_additional_statistics = ref None in
  let r_include_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdditionalStatistics"; "IncludeMetrics" ]
    (fun tag _ ->
      match tag with
      | "AdditionalStatistics" ->
          r_additional_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalStatistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistic_of_xml i)
                     ())
                 ())
      | "IncludeMetrics" ->
          r_include_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeMetrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_statistics_metric_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     additional_statistics =
       Smaws_Lib.Xml.Parse.required "AdditionalStatistics" (( ! ) r_additional_statistics) i;
     include_metrics = Smaws_Lib.Xml.Parse.required "IncludeMetrics" (( ! ) r_include_metrics) i;
   }
    : metric_stream_statistics_configuration)

let metric_stream_statistics_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> metric_stream_statistics_configuration_of_xml i)
    ()

let include_linked_accounts_metrics_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let put_metric_stream_input_of_xml i =
  let r_include_linked_accounts_metrics = ref None in
  let r_statistics_configurations = ref None in
  let r_tags = ref None in
  let r_output_format = ref None in
  let r_role_arn = ref None in
  let r_firehose_arn = ref None in
  let r_exclude_filters = ref None in
  let r_include_filters = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IncludeLinkedAccountsMetrics";
      "StatisticsConfigurations";
      "Tags";
      "OutputFormat";
      "RoleArn";
      "FirehoseArn";
      "ExcludeFilters";
      "IncludeFilters";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "IncludeLinkedAccountsMetrics" ->
          r_include_linked_accounts_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccountsMetrics"
                 (fun i _ -> include_linked_accounts_metrics_of_xml i)
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | "RoleArn" ->
          r_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
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
      | "IncludeFilters" ->
          r_include_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_linked_accounts_metrics = ( ! ) r_include_linked_accounts_metrics;
     statistics_configurations = ( ! ) r_statistics_configurations;
     tags = ( ! ) r_tags;
     output_format = Smaws_Lib.Xml.Parse.required "OutputFormat" (( ! ) r_output_format) i;
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     firehose_arn = Smaws_Lib.Xml.Parse.required "FirehoseArn" (( ! ) r_firehose_arn) i;
     exclude_filters = ( ! ) r_exclude_filters;
     include_filters = ( ! ) r_include_filters;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : put_metric_stream_input)

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

let counts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let metric_datum_of_xml i =
  let r_storage_resolution = ref None in
  let r_unit_ = ref None in
  let r_counts = ref None in
  let r_values = ref None in
  let r_statistic_values = ref None in
  let r_value = ref None in
  let r_timestamp = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StorageResolution";
      "Unit";
      "Counts";
      "Values";
      "StatisticValues";
      "Value";
      "Timestamp";
      "Dimensions";
      "MetricName";
    ] (fun tag _ ->
      match tag with
      | "StorageResolution" ->
          r_storage_resolution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageResolution"
                 (fun i _ -> storage_resolution_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Counts" ->
          r_counts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Counts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> datapoint_value_of_xml i)
                     ())
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
      | "StatisticValues" ->
          r_statistic_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatisticValues"
                 (fun i _ -> statistic_set_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> datapoint_value_of_xml i) ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     storage_resolution = ( ! ) r_storage_resolution;
     unit_ = ( ! ) r_unit_;
     counts = ( ! ) r_counts;
     values = ( ! ) r_values;
     statistic_values = ( ! ) r_statistic_values;
     value = ( ! ) r_value;
     timestamp = ( ! ) r_timestamp;
     dimensions = ( ! ) r_dimensions;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
   }
    : metric_datum)

let metric_data_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_datum_of_xml i) ()

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

let entity_of_xml i =
  let r_attributes = ref None in
  let r_key_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "KeyAttributes" ] (fun tag _ ->
      match tag with
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes; key_attributes = ( ! ) r_key_attributes } : entity)

let entity_metric_data_of_xml i =
  let r_metric_data = ref None in
  let r_entity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricData"; "Entity" ] (fun tag _ ->
      match tag with
      | "MetricData" ->
          r_metric_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricData"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_datum_of_xml i)
                     ())
                 ())
      | "Entity" ->
          r_entity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Entity" (fun i _ -> entity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric_data = ( ! ) r_metric_data; entity = ( ! ) r_entity } : entity_metric_data)

let entity_metric_data_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> entity_metric_data_of_xml i) ()

let put_metric_data_input_of_xml i =
  let r_strict_entity_validation = ref None in
  let r_entity_metric_data = ref None in
  let r_metric_data = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StrictEntityValidation"; "EntityMetricData"; "MetricData"; "Namespace" ] (fun tag _ ->
      match tag with
      | "StrictEntityValidation" ->
          r_strict_entity_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StrictEntityValidation"
                 (fun i _ -> strict_entity_validation_of_xml i)
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
      | "MetricData" ->
          r_metric_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricData"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_datum_of_xml i)
                     ())
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace" (fun i _ -> namespace_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     strict_entity_validation = ( ! ) r_strict_entity_validation;
     entity_metric_data = ( ! ) r_entity_metric_data;
     metric_data = ( ! ) r_metric_data;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
   }
    : put_metric_data_input)

let alarm_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let actions_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let extended_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let evaluation_periods_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let datapoints_to_alarm_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let comparison_operator_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "GreaterThanUpperThreshold" -> GreaterThanUpperThreshold
   | "LessThanLowerThreshold" -> LessThanLowerThreshold
   | "LessThanLowerOrGreaterThanUpperThreshold" -> LessThanLowerOrGreaterThanUpperThreshold
   | "LessThanOrEqualToThreshold" -> LessThanOrEqualToThreshold
   | "LessThanThreshold" -> LessThanThreshold
   | "GreaterThanThreshold" -> GreaterThanThreshold
   | "GreaterThanOrEqualToThreshold" -> GreaterThanOrEqualToThreshold
   | _ -> failwith "unknown enum value"
    : comparison_operator)

let evaluate_low_sample_count_percentile_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_of_xml i =
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Dimensions"; "MetricName"; "Namespace" ]
    (fun tag _ ->
      match tag with
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
   }
    : metric)

let metric_stat_of_xml i =
  let r_unit_ = ref None in
  let r_stat = ref None in
  let r_period = ref None in
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Unit"; "Stat"; "Period"; "Metric" ] (fun tag _ ->
      match tag with
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Stat" ->
          r_stat := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Stat" (fun i _ -> stat_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     unit_ = ( ! ) r_unit_;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
   }
    : metric_stat)

let metric_expression_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_data_query_of_xml i =
  let r_account_id = ref None in
  let r_period = ref None in
  let r_return_data = ref None in
  let r_label = ref None in
  let r_expression = ref None in
  let r_metric_stat = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountId"; "Period"; "ReturnData"; "Label"; "Expression"; "MetricStat"; "Id" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> account_id_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> metric_expression_of_xml i)
                 ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> metric_stat_of_xml i)
                 ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> metric_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_id = ( ! ) r_account_id;
     period = ( ! ) r_period;
     return_data = ( ! ) r_return_data;
     label = ( ! ) r_label;
     expression = ( ! ) r_expression;
     metric_stat = ( ! ) r_metric_stat;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : metric_data_query)

let metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_query_of_xml i) ()

let evaluation_window_of_xml i =
  let r_sliding_window = ref None in
  let r_wall_clock_window = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SlidingWindow"; "WallClockWindow" ] (fun tag _ ->
      match tag with
      | "SlidingWindow" ->
          r_sliding_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SlidingWindow"
                 (fun i _ -> sliding_window_of_xml i)
                 ())
      | "WallClockWindow" ->
          r_wall_clock_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WallClockWindow"
                 (fun i _ -> wall_clock_window_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_sliding_window with
   | Some v -> SlidingWindow v
   | None -> (
       match ( ! ) r_wall_clock_window with
       | Some v -> WallClockWindow v
       | None -> failwith "no union member present in xml response")
    : evaluation_window)

let pending_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let alarm_prom_ql_criteria_of_xml i =
  let r_recovery_period = ref None in
  let r_pending_period = ref None in
  let r_query = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RecoveryPeriod"; "PendingPeriod"; "Query" ]
    (fun tag _ ->
      match tag with
      | "RecoveryPeriod" ->
          r_recovery_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecoveryPeriod"
                 (fun i _ -> recovery_period_of_xml i)
                 ())
      | "PendingPeriod" ->
          r_pending_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingPeriod"
                 (fun i _ -> pending_period_of_xml i)
                 ())
      | "Query" ->
          r_query :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Query" (fun i _ -> query_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recovery_period = ( ! ) r_recovery_period;
     pending_period = ( ! ) r_pending_period;
     query = Smaws_Lib.Xml.Parse.required "Query" (( ! ) r_query) i;
   }
    : alarm_prom_ql_criteria)

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

let evaluation_interval_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let put_metric_alarm_input_of_xml i =
  let r_evaluation_interval = ref None in
  let r_evaluation_criteria = ref None in
  let r_evaluation_window = ref None in
  let r_threshold_metric_id = ref None in
  let r_tags = ref None in
  let r_metrics = ref None in
  let r_evaluate_low_sample_count_percentile = ref None in
  let r_treat_missing_data = ref None in
  let r_comparison_operator = ref None in
  let r_threshold = ref None in
  let r_datapoints_to_alarm = ref None in
  let r_evaluation_periods = ref None in
  let r_unit_ = ref None in
  let r_period = ref None in
  let r_dimensions = ref None in
  let r_extended_statistic = ref None in
  let r_statistic = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_actions = ref None in
  let r_ok_actions = ref None in
  let r_actions_enabled = ref None in
  let r_alarm_description = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EvaluationInterval";
      "EvaluationCriteria";
      "EvaluationWindow";
      "ThresholdMetricId";
      "Tags";
      "Metrics";
      "EvaluateLowSampleCountPercentile";
      "TreatMissingData";
      "ComparisonOperator";
      "Threshold";
      "DatapointsToAlarm";
      "EvaluationPeriods";
      "Unit";
      "Period";
      "Dimensions";
      "ExtendedStatistic";
      "Statistic";
      "Namespace";
      "MetricName";
      "InsufficientDataActions";
      "AlarmActions";
      "OKActions";
      "ActionsEnabled";
      "AlarmDescription";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
      | "EvaluationInterval" ->
          r_evaluation_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationInterval"
                 (fun i _ -> evaluation_interval_of_xml i)
                 ())
      | "EvaluationCriteria" ->
          r_evaluation_criteria :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationCriteria"
                 (fun i _ -> evaluation_criteria_of_xml i)
                 ())
      | "EvaluationWindow" ->
          r_evaluation_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationWindow"
                 (fun i _ -> evaluation_window_of_xml i)
                 ())
      | "ThresholdMetricId" ->
          r_threshold_metric_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThresholdMetricId"
                 (fun i _ -> metric_id_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
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
      | "EvaluateLowSampleCountPercentile" ->
          r_evaluate_low_sample_count_percentile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluateLowSampleCountPercentile"
                 (fun i _ -> evaluate_low_sample_count_percentile_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "DatapointsToAlarm" ->
          r_datapoints_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatapointsToAlarm"
                 (fun i _ -> datapoints_to_alarm_of_xml i)
                 ())
      | "EvaluationPeriods" ->
          r_evaluation_periods :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationPeriods"
                 (fun i _ -> evaluation_periods_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
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
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
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
      | "OKActions" ->
          r_ok_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OKActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     evaluation_interval = ( ! ) r_evaluation_interval;
     evaluation_criteria = ( ! ) r_evaluation_criteria;
     evaluation_window = ( ! ) r_evaluation_window;
     threshold_metric_id = ( ! ) r_threshold_metric_id;
     tags = ( ! ) r_tags;
     metrics = ( ! ) r_metrics;
     evaluate_low_sample_count_percentile = ( ! ) r_evaluate_low_sample_count_percentile;
     treat_missing_data = ( ! ) r_treat_missing_data;
     comparison_operator = ( ! ) r_comparison_operator;
     threshold = ( ! ) r_threshold;
     datapoints_to_alarm = ( ! ) r_datapoints_to_alarm;
     evaluation_periods = ( ! ) r_evaluation_periods;
     unit_ = ( ! ) r_unit_;
     period = ( ! ) r_period;
     dimensions = ( ! ) r_dimensions;
     extended_statistic = ( ! ) r_extended_statistic;
     statistic = ( ! ) r_statistic;
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     ok_actions = ( ! ) r_ok_actions;
     actions_enabled = ( ! ) r_actions_enabled;
     alarm_description = ( ! ) r_alarm_description;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
   }
    : put_metric_alarm_input)

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

let failure_resource_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let exception_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partial_failure_of_xml i =
  let r_failure_description = ref None in
  let r_failure_code = ref None in
  let r_exception_type = ref None in
  let r_failure_resource = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "FailureDescription"; "FailureCode"; "ExceptionType"; "FailureResource" ] (fun tag _ ->
      match tag with
      | "FailureDescription" ->
          r_failure_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureDescription"
                 (fun i _ -> failure_description_of_xml i)
                 ())
      | "FailureCode" ->
          r_failure_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureCode"
                 (fun i _ -> failure_code_of_xml i)
                 ())
      | "ExceptionType" ->
          r_exception_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExceptionType"
                 (fun i _ -> exception_type_of_xml i)
                 ())
      | "FailureResource" ->
          r_failure_resource :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureResource"
                 (fun i _ -> failure_resource_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_description = ( ! ) r_failure_description;
     failure_code = ( ! ) r_failure_code;
     exception_type = ( ! ) r_exception_type;
     failure_resource = ( ! ) r_failure_resource;
   }
    : partial_failure)

let batch_failures_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> partial_failure_of_xml i) ()

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

let managed_rule_of_xml i =
  let r_tags = ref None in
  let r_resource_ar_n = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceARN"; "TemplateName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
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

let action_log_line_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let action_log_line_role_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_log_alarm_input_of_xml i =
  let r_tags = ref None in
  let r_treat_missing_data = ref None in
  let r_comparison_operator = ref None in
  let r_threshold = ref None in
  let r_query_results_to_alarm = ref None in
  let r_query_results_to_evaluate = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_actions = ref None in
  let r_ok_actions = ref None in
  let r_actions_enabled = ref None in
  let r_action_log_line_role_arn = ref None in
  let r_action_log_line_count = ref None in
  let r_scheduled_query_configuration = ref None in
  let r_alarm_description = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "TreatMissingData";
      "ComparisonOperator";
      "Threshold";
      "QueryResultsToAlarm";
      "QueryResultsToEvaluate";
      "InsufficientDataActions";
      "AlarmActions";
      "OKActions";
      "ActionsEnabled";
      "ActionLogLineRoleArn";
      "ActionLogLineCount";
      "ScheduledQueryConfiguration";
      "AlarmDescription";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "QueryResultsToAlarm" ->
          r_query_results_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToAlarm"
                 (fun i _ -> query_results_to_alarm_of_xml i)
                 ())
      | "QueryResultsToEvaluate" ->
          r_query_results_to_evaluate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToEvaluate"
                 (fun i _ -> query_results_to_evaluate_of_xml i)
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
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
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
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | "ActionLogLineRoleArn" ->
          r_action_log_line_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineRoleArn"
                 (fun i _ -> action_log_line_role_arn_of_xml i)
                 ())
      | "ActionLogLineCount" ->
          r_action_log_line_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineCount"
                 (fun i _ -> action_log_line_count_of_xml i)
                 ())
      | "ScheduledQueryConfiguration" ->
          r_scheduled_query_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryConfiguration"
                 (fun i _ -> scheduled_query_configuration_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     treat_missing_data = ( ! ) r_treat_missing_data;
     comparison_operator =
       Smaws_Lib.Xml.Parse.required "ComparisonOperator" (( ! ) r_comparison_operator) i;
     threshold = Smaws_Lib.Xml.Parse.required "Threshold" (( ! ) r_threshold) i;
     query_results_to_alarm =
       Smaws_Lib.Xml.Parse.required "QueryResultsToAlarm" (( ! ) r_query_results_to_alarm) i;
     query_results_to_evaluate =
       Smaws_Lib.Xml.Parse.required "QueryResultsToEvaluate" (( ! ) r_query_results_to_evaluate) i;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     ok_actions = ( ! ) r_ok_actions;
     actions_enabled = ( ! ) r_actions_enabled;
     action_log_line_role_arn = ( ! ) r_action_log_line_role_arn;
     action_log_line_count = ( ! ) r_action_log_line_count;
     scheduled_query_configuration =
       Smaws_Lib.Xml.Parse.required "ScheduledQueryConfiguration"
         (( ! ) r_scheduled_query_configuration)
         i;
     alarm_description = ( ! ) r_alarm_description;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
   }
    : put_log_alarm_input)

let put_insight_rule_output_of_xml i = ()
let insight_rule_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let insight_rule_definition_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_on_transformed_logs_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let put_insight_rule_input_of_xml i =
  let r_apply_on_transformed_logs = ref None in
  let r_tags = ref None in
  let r_rule_definition = ref None in
  let r_rule_state = ref None in
  let r_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplyOnTransformedLogs"; "Tags"; "RuleDefinition"; "RuleState"; "RuleName" ] (fun tag _ ->
      match tag with
      | "ApplyOnTransformedLogs" ->
          r_apply_on_transformed_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyOnTransformedLogs"
                 (fun i _ -> insight_rule_on_transformed_logs_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "RuleDefinition" ->
          r_rule_definition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleDefinition"
                 (fun i _ -> insight_rule_definition_of_xml i)
                 ())
      | "RuleState" ->
          r_rule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleState"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     apply_on_transformed_logs = ( ! ) r_apply_on_transformed_logs;
     tags = ( ! ) r_tags;
     rule_definition = Smaws_Lib.Xml.Parse.required "RuleDefinition" (( ! ) r_rule_definition) i;
     rule_state = ( ! ) r_rule_state;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
   }
    : put_insight_rule_input)

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

let data_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dashboard_validation_message_of_xml i =
  let r_message = ref None in
  let r_data_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "DataPath" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "DataPath" ->
          r_data_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataPath" (fun i _ -> data_path_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; data_path = ( ! ) r_data_path } : dashboard_validation_message)

let dashboard_validation_messages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> dashboard_validation_message_of_xml i)
    ()

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

let dashboard_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dashboard_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_dashboard_input_of_xml i =
  let r_tags = ref None in
  let r_dashboard_body = ref None in
  let r_dashboard_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "DashboardBody"; "DashboardName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
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
     tags = ( ! ) r_tags;
     dashboard_body = Smaws_Lib.Xml.Parse.required "DashboardBody" (( ! ) r_dashboard_body) i;
     dashboard_name = Smaws_Lib.Xml.Parse.required "DashboardName" (( ! ) r_dashboard_name) i;
   }
    : put_dashboard_input)

let dashboard_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dashboard_invalid_input_error_of_xml i =
  let r_dashboard_validation_messages = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "dashboardValidationMessages"; "message" ]
    (fun tag _ ->
      match tag with
      | "dashboardValidationMessages" ->
          r_dashboard_validation_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "dashboardValidationMessages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_validation_message_of_xml i)
                     ())
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> dashboard_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dashboard_validation_messages = ( ! ) r_dashboard_validation_messages;
     message = ( ! ) r_message;
   }
    : dashboard_invalid_input_error)

let alarm_rule_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let alarm_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_composite_alarm_input_of_xml i =
  let r_actions_suppressor_extension_period = ref None in
  let r_actions_suppressor_wait_period = ref None in
  let r_actions_suppressor = ref None in
  let r_tags = ref None in
  let r_ok_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_rule = ref None in
  let r_alarm_name = ref None in
  let r_alarm_description = ref None in
  let r_alarm_actions = ref None in
  let r_actions_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionsSuppressorExtensionPeriod";
      "ActionsSuppressorWaitPeriod";
      "ActionsSuppressor";
      "Tags";
      "OKActions";
      "InsufficientDataActions";
      "AlarmRule";
      "AlarmName";
      "AlarmDescription";
      "AlarmActions";
      "ActionsEnabled";
    ] (fun tag _ ->
      match tag with
      | "ActionsSuppressorExtensionPeriod" ->
          r_actions_suppressor_extension_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorExtensionPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressorWaitPeriod" ->
          r_actions_suppressor_wait_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorWaitPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressor" ->
          r_actions_suppressor :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressor"
                 (fun i _ -> alarm_arn_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
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
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmRule" ->
          r_alarm_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmRule" (fun i _ -> alarm_rule_of_xml i) ())
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
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     actions_suppressor_extension_period = ( ! ) r_actions_suppressor_extension_period;
     actions_suppressor_wait_period = ( ! ) r_actions_suppressor_wait_period;
     actions_suppressor = ( ! ) r_actions_suppressor;
     tags = ( ! ) r_tags;
     ok_actions = ( ! ) r_ok_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_rule = Smaws_Lib.Xml.Parse.required "AlarmRule" (( ! ) r_alarm_rule) i;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
     alarm_description = ( ! ) r_alarm_description;
     alarm_actions = ( ! ) r_alarm_actions;
     actions_enabled = ( ! ) r_actions_enabled;
   }
    : put_composite_alarm_input)

let put_anomaly_detector_output_of_xml i = ()

let anomaly_detector_excluded_time_ranges_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> range_of_xml i) ()

let anomaly_detector_metric_timezone_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let anomaly_detector_configuration_of_xml i =
  let r_metric_timezone = ref None in
  let r_excluded_time_ranges = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricTimezone"; "ExcludedTimeRanges" ]
    (fun tag _ ->
      match tag with
      | "MetricTimezone" ->
          r_metric_timezone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricTimezone"
                 (fun i _ -> anomaly_detector_metric_timezone_of_xml i)
                 ())
      | "ExcludedTimeRanges" ->
          r_excluded_time_ranges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedTimeRanges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> range_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_timezone = ( ! ) r_metric_timezone;
     excluded_time_ranges = ( ! ) r_excluded_time_ranges;
   }
    : anomaly_detector_configuration)

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

let put_anomaly_detector_input_of_xml i =
  let r_metric_math_anomaly_detector = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_metric_characteristics = ref None in
  let r_configuration = ref None in
  let r_stat = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricMathAnomalyDetector";
      "SingleMetricAnomalyDetector";
      "MetricCharacteristics";
      "Configuration";
      "Stat";
      "Dimensions";
      "MetricName";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "MetricCharacteristics" ->
          r_metric_characteristics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricCharacteristics"
                 (fun i _ -> metric_characteristics_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> anomaly_detector_configuration_of_xml i)
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     metric_characteristics = ( ! ) r_metric_characteristics;
     configuration = ( ! ) r_configuration;
     stat = ( ! ) r_stat;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
   }
    : put_anomaly_detector_input)

let name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let put_alarm_mute_rule_input_of_xml i =
  let r_expire_date = ref None in
  let r_start_date = ref None in
  let r_tags = ref None in
  let r_mute_targets = ref None in
  let r_rule = ref None in
  let r_description = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ExpireDate"; "StartDate"; "Tags"; "MuteTargets"; "Rule"; "Description"; "Name" ]
    (fun tag _ ->
      match tag with
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "MuteTargets" ->
          r_mute_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MuteTargets"
                 (fun i _ -> mute_targets_of_xml i)
                 ())
      | "Rule" ->
          r_rule := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> rule_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expire_date = ( ! ) r_expire_date;
     start_date = ( ! ) r_start_date;
     tags = ( ! ) r_tags;
     mute_targets = ( ! ) r_mute_targets;
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
     description = ( ! ) r_description;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : put_alarm_mute_rule_input)

let owning_accounts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_id_of_xml i) ()

let output_format_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let o_tel_enrichment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Stopped" -> STOPPED | "Running" -> RUNNING | _ -> failwith "unknown enum value"
    : o_tel_enrichment_status)

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let mute_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metrics_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_of_xml i) ()

let metric_widget_image_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metric_widget_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_stream_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_stream_entry_of_xml i =
  let r_output_format = ref None in
  let r_state = ref None in
  let r_firehose_arn = ref None in
  let r_name = ref None in
  let r_last_update_date = ref None in
  let r_creation_date = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OutputFormat"; "State"; "FirehoseArn"; "Name"; "LastUpdateDate"; "CreationDate"; "Arn" ]
    (fun tag _ ->
      match tag with
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> metric_stream_state_of_xml i)
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | "LastUpdateDate" ->
          r_last_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdateDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     output_format = ( ! ) r_output_format;
     state = ( ! ) r_state;
     firehose_arn = ( ! ) r_firehose_arn;
     name = ( ! ) r_name;
     last_update_date = ( ! ) r_last_update_date;
     creation_date = ( ! ) r_creation_date;
     arn = ( ! ) r_arn;
   }
    : metric_stream_entry)

let metric_stream_entries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_stream_entry_of_xml i) ()

let datapoint_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_value_of_xml i) ()

let message_data_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_data_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let message_data_of_xml i =
  let r_value = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Code" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> message_data_value_of_xml i)
                 ())
      | "Code" ->
          r_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Code"
                 (fun i _ -> message_data_code_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; code = ( ! ) r_code } : message_data)

let metric_data_result_messages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> message_data_of_xml i) ()

let metric_data_result_of_xml i =
  let r_messages = ref None in
  let r_status_code = ref None in
  let r_values = ref None in
  let r_timestamps = ref None in
  let r_label = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Messages"; "StatusCode"; "Values"; "Timestamps"; "Label"; "Id" ] (fun tag _ ->
      match tag with
      | "Messages" ->
          r_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Messages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_data_of_xml i)
                     ())
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> status_code_of_xml i)
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
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_of_xml i) ())
                 ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> metric_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     messages = ( ! ) r_messages;
     status_code = ( ! ) r_status_code;
     values = ( ! ) r_values;
     timestamps = ( ! ) r_timestamps;
     label = ( ! ) r_label;
     id = ( ! ) r_id;
   }
    : metric_data_result)

let metric_data_results_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_result_of_xml i) ()

let evaluation_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "EVALUATION_ERROR" -> EVALUATION_ERROR
   | "EVALUATION_FAILURE" -> EVALUATION_FAILURE
   | "PARTIAL_DATA" -> PARTIAL_DATA
   | _ -> failwith "unknown enum value"
    : evaluation_state)

let metric_alarm_of_xml i =
  let r_evaluation_interval = ref None in
  let r_evaluation_criteria = ref None in
  let r_evaluation_window = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_evaluation_state = ref None in
  let r_threshold_metric_id = ref None in
  let r_metrics = ref None in
  let r_evaluate_low_sample_count_percentile = ref None in
  let r_treat_missing_data = ref None in
  let r_comparison_operator = ref None in
  let r_threshold = ref None in
  let r_datapoints_to_alarm = ref None in
  let r_evaluation_periods = ref None in
  let r_unit_ = ref None in
  let r_period = ref None in
  let r_dimensions = ref None in
  let r_extended_statistic = ref None in
  let r_statistic = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  let r_state_updated_timestamp = ref None in
  let r_state_reason_data = ref None in
  let r_state_reason = ref None in
  let r_state_value = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_actions = ref None in
  let r_ok_actions = ref None in
  let r_actions_enabled = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_alarm_description = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EvaluationInterval";
      "EvaluationCriteria";
      "EvaluationWindow";
      "StateTransitionedTimestamp";
      "EvaluationState";
      "ThresholdMetricId";
      "Metrics";
      "EvaluateLowSampleCountPercentile";
      "TreatMissingData";
      "ComparisonOperator";
      "Threshold";
      "DatapointsToAlarm";
      "EvaluationPeriods";
      "Unit";
      "Period";
      "Dimensions";
      "ExtendedStatistic";
      "Statistic";
      "Namespace";
      "MetricName";
      "StateUpdatedTimestamp";
      "StateReasonData";
      "StateReason";
      "StateValue";
      "InsufficientDataActions";
      "AlarmActions";
      "OKActions";
      "ActionsEnabled";
      "AlarmConfigurationUpdatedTimestamp";
      "AlarmDescription";
      "AlarmArn";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
      | "EvaluationInterval" ->
          r_evaluation_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationInterval"
                 (fun i _ -> evaluation_interval_of_xml i)
                 ())
      | "EvaluationCriteria" ->
          r_evaluation_criteria :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationCriteria"
                 (fun i _ -> evaluation_criteria_of_xml i)
                 ())
      | "EvaluationWindow" ->
          r_evaluation_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationWindow"
                 (fun i _ -> evaluation_window_of_xml i)
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
      | "ThresholdMetricId" ->
          r_threshold_metric_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThresholdMetricId"
                 (fun i _ -> metric_id_of_xml i)
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
      | "EvaluateLowSampleCountPercentile" ->
          r_evaluate_low_sample_count_percentile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluateLowSampleCountPercentile"
                 (fun i _ -> evaluate_low_sample_count_percentile_of_xml i)
                 ())
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "DatapointsToAlarm" ->
          r_datapoints_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatapointsToAlarm"
                 (fun i _ -> datapoints_to_alarm_of_xml i)
                 ())
      | "EvaluationPeriods" ->
          r_evaluation_periods :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationPeriods"
                 (fun i _ -> evaluation_periods_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
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
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
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
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
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
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
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
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     evaluation_interval = ( ! ) r_evaluation_interval;
     evaluation_criteria = ( ! ) r_evaluation_criteria;
     evaluation_window = ( ! ) r_evaluation_window;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     evaluation_state = ( ! ) r_evaluation_state;
     threshold_metric_id = ( ! ) r_threshold_metric_id;
     metrics = ( ! ) r_metrics;
     evaluate_low_sample_count_percentile = ( ! ) r_evaluate_low_sample_count_percentile;
     treat_missing_data = ( ! ) r_treat_missing_data;
     comparison_operator = ( ! ) r_comparison_operator;
     threshold = ( ! ) r_threshold;
     datapoints_to_alarm = ( ! ) r_datapoints_to_alarm;
     evaluation_periods = ( ! ) r_evaluation_periods;
     unit_ = ( ! ) r_unit_;
     period = ( ! ) r_period;
     dimensions = ( ! ) r_dimensions;
     extended_statistic = ( ! ) r_extended_statistic;
     statistic = ( ! ) r_statistic;
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     state_reason_data = ( ! ) r_state_reason_data;
     state_reason = ( ! ) r_state_reason;
     state_value = ( ! ) r_state_value;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     ok_actions = ( ! ) r_ok_actions;
     actions_enabled = ( ! ) r_actions_enabled;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     alarm_description = ( ! ) r_alarm_description;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_name = ( ! ) r_alarm_name;
   }
    : metric_alarm)

let metric_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_alarm_of_xml i) ()

let max_returned_results_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let managed_rule_state_of_xml i =
  let r_state = ref None in
  let r_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "State"; "RuleName" ] (fun tag _ ->
      match tag with
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
   }
    : managed_rule_state)

let managed_rule_description_of_xml i =
  let r_rule_state = ref None in
  let r_resource_ar_n = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleState"; "ResourceARN"; "TemplateName" ]
    (fun tag _ ->
      match tag with
      | "RuleState" ->
          r_rule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleState"
                 (fun i _ -> managed_rule_state_of_xml i)
                 ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_state = ( ! ) r_rule_state;
     resource_ar_n = ( ! ) r_resource_ar_n;
     template_name = ( ! ) r_template_name;
   }
    : managed_rule_description)

let managed_rule_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_rule_description_of_xml i) ()

let log_alarm_of_xml i =
  let r_action_log_line_role_arn = ref None in
  let r_action_log_line_count = ref None in
  let r_evaluation_state = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_treat_missing_data = ref None in
  let r_comparison_operator = ref None in
  let r_threshold = ref None in
  let r_query_results_to_alarm = ref None in
  let r_query_results_to_evaluate = ref None in
  let r_scheduled_query_configuration = ref None in
  let r_state_updated_timestamp = ref None in
  let r_state_reason_data = ref None in
  let r_state_reason = ref None in
  let r_state_value = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_actions = ref None in
  let r_ok_actions = ref None in
  let r_actions_enabled = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_alarm_description = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionLogLineRoleArn";
      "ActionLogLineCount";
      "EvaluationState";
      "StateTransitionedTimestamp";
      "TreatMissingData";
      "ComparisonOperator";
      "Threshold";
      "QueryResultsToAlarm";
      "QueryResultsToEvaluate";
      "ScheduledQueryConfiguration";
      "StateUpdatedTimestamp";
      "StateReasonData";
      "StateReason";
      "StateValue";
      "InsufficientDataActions";
      "AlarmActions";
      "OKActions";
      "ActionsEnabled";
      "AlarmConfigurationUpdatedTimestamp";
      "AlarmDescription";
      "AlarmArn";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
      | "ActionLogLineRoleArn" ->
          r_action_log_line_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineRoleArn"
                 (fun i _ -> action_log_line_role_arn_of_xml i)
                 ())
      | "ActionLogLineCount" ->
          r_action_log_line_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionLogLineCount"
                 (fun i _ -> action_log_line_count_of_xml i)
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
      | "TreatMissingData" ->
          r_treat_missing_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatMissingData"
                 (fun i _ -> treat_missing_data_of_xml i)
                 ())
      | "ComparisonOperator" ->
          r_comparison_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComparisonOperator"
                 (fun i _ -> comparison_operator_of_xml i)
                 ())
      | "Threshold" ->
          r_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Threshold" (fun i _ -> threshold_of_xml i) ())
      | "QueryResultsToAlarm" ->
          r_query_results_to_alarm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToAlarm"
                 (fun i _ -> query_results_to_alarm_of_xml i)
                 ())
      | "QueryResultsToEvaluate" ->
          r_query_results_to_evaluate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryResultsToEvaluate"
                 (fun i _ -> query_results_to_evaluate_of_xml i)
                 ())
      | "ScheduledQueryConfiguration" ->
          r_scheduled_query_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledQueryConfiguration"
                 (fun i _ -> scheduled_query_configuration_of_xml i)
                 ())
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
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
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
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
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
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
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_log_line_role_arn = ( ! ) r_action_log_line_role_arn;
     action_log_line_count = ( ! ) r_action_log_line_count;
     evaluation_state = ( ! ) r_evaluation_state;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     treat_missing_data = ( ! ) r_treat_missing_data;
     comparison_operator = ( ! ) r_comparison_operator;
     threshold = ( ! ) r_threshold;
     query_results_to_alarm = ( ! ) r_query_results_to_alarm;
     query_results_to_evaluate = ( ! ) r_query_results_to_evaluate;
     scheduled_query_configuration = ( ! ) r_scheduled_query_configuration;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     state_reason_data = ( ! ) r_state_reason_data;
     state_reason = ( ! ) r_state_reason;
     state_value = ( ! ) r_state_value;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_actions = ( ! ) r_alarm_actions;
     ok_actions = ( ! ) r_ok_actions;
     actions_enabled = ( ! ) r_actions_enabled;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     alarm_description = ( ! ) r_alarm_description;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_name = ( ! ) r_alarm_name;
   }
    : log_alarm)

let log_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> log_alarm_of_xml i) ()

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

let list_metrics_output_of_xml i =
  let r_owning_accounts = ref None in
  let r_next_token = ref None in
  let r_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OwningAccounts"; "NextToken"; "Metrics" ]
    (fun tag _ ->
      match tag with
      | "OwningAccounts" ->
          r_owning_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwningAccounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_id_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     owning_accounts = ( ! ) r_owning_accounts;
     next_token = ( ! ) r_next_token;
     metrics = ( ! ) r_metrics;
   }
    : list_metrics_output)

let dimension_filter_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> dimension_value_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> dimension_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i }
    : dimension_filter)

let dimension_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_filter_of_xml i) ()

let include_linked_accounts_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_metrics_input_of_xml i =
  let r_owning_account = ref None in
  let r_include_linked_accounts = ref None in
  let r_recently_active = ref None in
  let r_next_token = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OwningAccount";
      "IncludeLinkedAccounts";
      "RecentlyActive";
      "NextToken";
      "Dimensions";
      "MetricName";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "OwningAccount" ->
          r_owning_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwningAccount"
                 (fun i _ -> account_id_of_xml i)
                 ())
      | "IncludeLinkedAccounts" ->
          r_include_linked_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccounts"
                 (fun i _ -> include_linked_accounts_of_xml i)
                 ())
      | "RecentlyActive" ->
          r_recently_active :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecentlyActive"
                 (fun i _ -> recently_active_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dimension_filter_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     owning_account = ( ! ) r_owning_account;
     include_linked_accounts = ( ! ) r_include_linked_accounts;
     recently_active = ( ! ) r_recently_active;
     next_token = ( ! ) r_next_token;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
   }
    : list_metrics_input)

let list_metric_streams_output_of_xml i =
  let r_entries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Entries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Entries" ->
          r_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Entries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_entry_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ entries = ( ! ) r_entries; next_token = ( ! ) r_next_token } : list_metric_streams_output)

let list_metric_streams_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_metric_streams_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> list_metric_streams_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : list_metric_streams_input)

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

let list_managed_insight_rules_output_of_xml i =
  let r_next_token = ref None in
  let r_managed_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ManagedRules" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ManagedRules" ->
          r_managed_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedRules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_rule_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; managed_rules = ( ! ) r_managed_rules }
    : list_managed_insight_rules_output)

let insight_rule_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_managed_insight_rules_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_resource_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken"; "ResourceARN" ]
    (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> insight_rule_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ResourceARN" ->
          r_resource_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     resource_ar_n = Smaws_Lib.Xml.Parse.required "ResourceARN" (( ! ) r_resource_ar_n) i;
   }
    : list_managed_insight_rules_input)

let dashboard_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let last_modified_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let dashboard_entry_of_xml i =
  let r_size = ref None in
  let r_last_modified = ref None in
  let r_dashboard_arn = ref None in
  let r_dashboard_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Size"; "LastModified"; "DashboardArn"; "DashboardName" ] (fun tag _ ->
      match tag with
      | "Size" ->
          r_size := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Size" (fun i _ -> size_of_xml i) ())
      | "LastModified" ->
          r_last_modified :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastModified"
                 (fun i _ -> last_modified_of_xml i)
                 ())
      | "DashboardArn" ->
          r_dashboard_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardArn"
                 (fun i _ -> dashboard_arn_of_xml i)
                 ())
      | "DashboardName" ->
          r_dashboard_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardName"
                 (fun i _ -> dashboard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     size = ( ! ) r_size;
     last_modified = ( ! ) r_last_modified;
     dashboard_arn = ( ! ) r_dashboard_arn;
     dashboard_name = ( ! ) r_dashboard_name;
   }
    : dashboard_entry)

let dashboard_entries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dashboard_entry_of_xml i) ()

let list_dashboards_output_of_xml i =
  let r_next_token = ref None in
  let r_dashboard_entries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "DashboardEntries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "DashboardEntries" ->
          r_dashboard_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardEntries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dashboard_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; dashboard_entries = ( ! ) r_dashboard_entries }
    : list_dashboards_output)

let dashboard_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_dashboards_input_of_xml i =
  let r_next_token = ref None in
  let r_dashboard_name_prefix = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "DashboardNamePrefix" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "DashboardNamePrefix" ->
          r_dashboard_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardNamePrefix"
                 (fun i _ -> dashboard_name_prefix_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; dashboard_name_prefix = ( ! ) r_dashboard_name_prefix }
    : list_dashboards_input)

let arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_mute_rule_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "EXPIRED" -> EXPIRED
   | "ACTIVE" -> ACTIVE
   | "SCHEDULED" -> SCHEDULED
   | _ -> failwith "unknown enum value"
    : alarm_mute_rule_status)

let alarm_mute_rule_summary_of_xml i =
  let r_last_updated_timestamp = ref None in
  let r_mute_type = ref None in
  let r_status = ref None in
  let r_expire_date = ref None in
  let r_alarm_mute_rule_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LastUpdatedTimestamp"; "MuteType"; "Status"; "ExpireDate"; "AlarmMuteRuleArn" ] (fun tag _ ->
      match tag with
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "MuteType" ->
          r_mute_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MuteType" (fun i _ -> mute_type_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> alarm_mute_rule_status_of_xml i)
                 ())
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | "AlarmMuteRuleArn" ->
          r_alarm_mute_rule_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleArn" (fun i _ -> arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_updated_timestamp = ( ! ) r_last_updated_timestamp;
     mute_type = ( ! ) r_mute_type;
     status = ( ! ) r_status;
     expire_date = ( ! ) r_expire_date;
     alarm_mute_rule_arn = ( ! ) r_alarm_mute_rule_arn;
   }
    : alarm_mute_rule_summary)

let alarm_mute_rule_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_mute_rule_summary_of_xml i) ()

let list_alarm_mute_rules_output_of_xml i =
  let r_next_token = ref None in
  let r_alarm_mute_rule_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AlarmMuteRuleSummaries" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AlarmMuteRuleSummaries" ->
          r_alarm_mute_rule_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_mute_rule_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     alarm_mute_rule_summaries = ( ! ) r_alarm_mute_rule_summaries;
   }
    : list_alarm_mute_rules_output)

let alarm_mute_rule_statuses_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_mute_rule_status_of_xml i) ()

let list_alarm_mute_rules_input_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_statuses = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "MaxRecords"; "Statuses"; "AlarmName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "Statuses" ->
          r_statuses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statuses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_mute_rule_status_of_xml i)
                     ())
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     statuses = ( ! ) r_statuses;
     alarm_name = ( ! ) r_alarm_name;
   }
    : list_alarm_mute_rules_input)

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

let kms_key_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let insight_rule_schema_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_is_managed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_of_xml i =
  let r_apply_on_transformed_logs = ref None in
  let r_managed_rule = ref None in
  let r_definition = ref None in
  let r_schema = ref None in
  let r_state = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplyOnTransformedLogs"; "ManagedRule"; "Definition"; "Schema"; "State"; "Name" ]
    (fun tag _ ->
      match tag with
      | "ApplyOnTransformedLogs" ->
          r_apply_on_transformed_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyOnTransformedLogs"
                 (fun i _ -> insight_rule_on_transformed_logs_of_xml i)
                 ())
      | "ManagedRule" ->
          r_managed_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedRule"
                 (fun i _ -> insight_rule_is_managed_of_xml i)
                 ())
      | "Definition" ->
          r_definition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Definition"
                 (fun i _ -> insight_rule_definition_of_xml i)
                 ())
      | "Schema" ->
          r_schema :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Schema"
                 (fun i _ -> insight_rule_schema_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> insight_rule_state_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     apply_on_transformed_logs = ( ! ) r_apply_on_transformed_logs;
     managed_rule = ( ! ) r_managed_rule;
     definition = Smaws_Lib.Xml.Parse.required "Definition" (( ! ) r_definition) i;
     schema = Smaws_Lib.Xml.Parse.required "Schema" (( ! ) r_schema) i;
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : insight_rule)

let insight_rules_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_of_xml i) ()

let insight_rule_unbound_long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_unbound_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_unbound_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let insight_rule_order_by_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_name_of_xml i) ()

let insight_rule_metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_metric_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_metric_name_of_xml i) ()

let insight_rule_metric_datapoint_of_xml i =
  let r_maximum = ref None in
  let r_minimum = ref None in
  let r_sum = ref None in
  let r_average = ref None in
  let r_sample_count = ref None in
  let r_max_contributor_value = ref None in
  let r_unique_contributors = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Maximum";
      "Minimum";
      "Sum";
      "Average";
      "SampleCount";
      "MaxContributorValue";
      "UniqueContributors";
      "Timestamp";
    ] (fun tag _ ->
      match tag with
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Average" ->
          r_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Average"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "MaxContributorValue" ->
          r_max_contributor_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxContributorValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "UniqueContributors" ->
          r_unique_contributors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UniqueContributors"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maximum = ( ! ) r_maximum;
     minimum = ( ! ) r_minimum;
     sum = ( ! ) r_sum;
     average = ( ! ) r_average;
     sample_count = ( ! ) r_sample_count;
     max_contributor_value = ( ! ) r_max_contributor_value;
     unique_contributors = ( ! ) r_unique_contributors;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
   }
    : insight_rule_metric_datapoint)

let insight_rule_metric_datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_metric_datapoint_of_xml i)
    ()

let insight_rule_contributor_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_contributor_keys_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_key_of_xml i)
    ()

let insight_rule_contributor_datapoint_of_xml i =
  let r_approximate_value = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApproximateValue"; "Timestamp" ] (fun tag _ ->
      match tag with
      | "ApproximateValue" ->
          r_approximate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     approximate_value =
       Smaws_Lib.Xml.Parse.required "ApproximateValue" (( ! ) r_approximate_value) i;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
   }
    : insight_rule_contributor_datapoint)

let insight_rule_contributor_datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_datapoint_of_xml i)
    ()

let insight_rule_contributor_of_xml i =
  let r_datapoints = ref None in
  let r_approximate_aggregate_value = ref None in
  let r_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Datapoints"; "ApproximateAggregateValue"; "Keys" ]
    (fun tag _ ->
      match tag with
      | "Datapoints" ->
          r_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Datapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_datapoint_of_xml i)
                     ())
                 ())
      | "ApproximateAggregateValue" ->
          r_approximate_aggregate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateAggregateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "Keys" ->
          r_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Keys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_key_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     datapoints = Smaws_Lib.Xml.Parse.required "Datapoints" (( ! ) r_datapoints) i;
     approximate_aggregate_value =
       Smaws_Lib.Xml.Parse.required "ApproximateAggregateValue"
         (( ! ) r_approximate_aggregate_value)
         i;
     keys = Smaws_Lib.Xml.Parse.required "Keys" (( ! ) r_keys) i;
   }
    : insight_rule_contributor)

let insight_rule_contributors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> insight_rule_contributor_of_xml i) ()

let insight_rule_contributor_key_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let insight_rule_contributor_key_labels_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> insight_rule_contributor_key_label_of_xml i)
    ()

let insight_rule_aggregation_statistic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let history_summary_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let history_item_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AlarmContributorAction" -> AlarmContributorAction
   | "AlarmContributorStateUpdate" -> AlarmContributorStateUpdate
   | "Action" -> Action
   | "StateUpdate" -> StateUpdate
   | "ConfigurationUpdate" -> ConfigurationUpdate
   | _ -> failwith "unknown enum value"
    : history_item_type)

let history_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let get_metric_widget_image_input_of_xml i =
  let r_output_format = ref None in
  let r_metric_widget = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OutputFormat"; "MetricWidget" ] (fun tag _ ->
      match tag with
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> output_format_of_xml i)
                 ())
      | "MetricWidget" ->
          r_metric_widget :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricWidget"
                 (fun i _ -> metric_widget_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     output_format = ( ! ) r_output_format;
     metric_widget = Smaws_Lib.Xml.Parse.required "MetricWidget" (( ! ) r_metric_widget) i;
   }
    : get_metric_widget_image_input)

let get_metric_stream_output_of_xml i =
  let r_include_linked_accounts_metrics = ref None in
  let r_statistics_configurations = ref None in
  let r_output_format = ref None in
  let r_last_update_date = ref None in
  let r_creation_date = ref None in
  let r_state = ref None in
  let r_role_arn = ref None in
  let r_firehose_arn = ref None in
  let r_exclude_filters = ref None in
  let r_include_filters = ref None in
  let r_name = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IncludeLinkedAccountsMetrics";
      "StatisticsConfigurations";
      "OutputFormat";
      "LastUpdateDate";
      "CreationDate";
      "State";
      "RoleArn";
      "FirehoseArn";
      "ExcludeFilters";
      "IncludeFilters";
      "Name";
      "Arn";
    ] (fun tag _ ->
      match tag with
      | "IncludeLinkedAccountsMetrics" ->
          r_include_linked_accounts_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeLinkedAccountsMetrics"
                 (fun i _ -> include_linked_accounts_metrics_of_xml i)
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
      | "OutputFormat" ->
          r_output_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputFormat"
                 (fun i _ -> metric_stream_output_format_of_xml i)
                 ())
      | "LastUpdateDate" ->
          r_last_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdateDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> metric_stream_state_of_xml i)
                 ())
      | "RoleArn" ->
          r_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "FirehoseArn" ->
          r_firehose_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FirehoseArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
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
      | "IncludeFilters" ->
          r_include_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_stream_filter_of_xml i)
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_stream_name_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_linked_accounts_metrics = ( ! ) r_include_linked_accounts_metrics;
     statistics_configurations = ( ! ) r_statistics_configurations;
     output_format = ( ! ) r_output_format;
     last_update_date = ( ! ) r_last_update_date;
     creation_date = ( ! ) r_creation_date;
     state = ( ! ) r_state;
     role_arn = ( ! ) r_role_arn;
     firehose_arn = ( ! ) r_firehose_arn;
     exclude_filters = ( ! ) r_exclude_filters;
     include_filters = ( ! ) r_include_filters;
     name = ( ! ) r_name;
     arn = ( ! ) r_arn;
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
  let r_extended_statistics = ref None in
  let r_unit_ = ref None in
  let r_maximum = ref None in
  let r_minimum = ref None in
  let r_sum = ref None in
  let r_average = ref None in
  let r_sample_count = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ExtendedStatistics";
      "Unit";
      "Maximum";
      "Minimum";
      "Sum";
      "Average";
      "SampleCount";
      "Timestamp";
    ] (fun tag _ ->
      match tag with
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
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Sum" ->
          r_sum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Sum" (fun i _ -> datapoint_value_of_xml i) ())
      | "Average" ->
          r_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Average"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "SampleCount" ->
          r_sample_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleCount"
                 (fun i _ -> datapoint_value_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extended_statistics = ( ! ) r_extended_statistics;
     unit_ = ( ! ) r_unit_;
     maximum = ( ! ) r_maximum;
     minimum = ( ! ) r_minimum;
     sum = ( ! ) r_sum;
     average = ( ! ) r_average;
     sample_count = ( ! ) r_sample_count;
     timestamp = ( ! ) r_timestamp;
   }
    : datapoint)

let datapoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_of_xml i) ()

let get_metric_statistics_output_of_xml i =
  let r_datapoints = ref None in
  let r_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Datapoints"; "Label" ] (fun tag _ ->
      match tag with
      | "Datapoints" ->
          r_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Datapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> datapoint_of_xml i) ())
                 ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> metric_label_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ datapoints = ( ! ) r_datapoints; label = ( ! ) r_label } : get_metric_statistics_output)

let extended_statistics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> extended_statistic_of_xml i) ()

let get_metric_statistics_input_of_xml i =
  let r_unit_ = ref None in
  let r_extended_statistics = ref None in
  let r_statistics = ref None in
  let r_period = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Unit";
      "ExtendedStatistics";
      "Statistics";
      "Period";
      "EndTime";
      "StartTime";
      "Dimensions";
      "MetricName";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "ExtendedStatistics" ->
          r_extended_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extended_statistic_of_xml i)
                     ())
                 ())
      | "Statistics" ->
          r_statistics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statistic_of_xml i) ())
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     unit_ = ( ! ) r_unit_;
     extended_statistics = ( ! ) r_extended_statistics;
     statistics = ( ! ) r_statistics;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     dimensions = ( ! ) r_dimensions;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
   }
    : get_metric_statistics_input)

let get_metric_data_output_of_xml i =
  let r_messages = ref None in
  let r_next_token = ref None in
  let r_metric_data_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Messages"; "NextToken"; "MetricDataResults" ]
    (fun tag _ ->
      match tag with
      | "Messages" ->
          r_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Messages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_data_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MetricDataResults" ->
          r_metric_data_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_result_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     messages = ( ! ) r_messages;
     next_token = ( ! ) r_next_token;
     metric_data_results = ( ! ) r_metric_data_results;
   }
    : get_metric_data_output)

let get_metric_data_max_datapoints_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_metric_data_input_of_xml i =
  let r_label_options = ref None in
  let r_max_datapoints = ref None in
  let r_scan_by = ref None in
  let r_next_token = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_metric_data_queries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LabelOptions";
      "MaxDatapoints";
      "ScanBy";
      "NextToken";
      "EndTime";
      "StartTime";
      "MetricDataQueries";
    ] (fun tag _ ->
      match tag with
      | "LabelOptions" ->
          r_label_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LabelOptions"
                 (fun i _ -> label_options_of_xml i)
                 ())
      | "MaxDatapoints" ->
          r_max_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxDatapoints"
                 (fun i _ -> get_metric_data_max_datapoints_of_xml i)
                 ())
      | "ScanBy" ->
          r_scan_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanBy" (fun i _ -> scan_by_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
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
  ({
     label_options = ( ! ) r_label_options;
     max_datapoints = ( ! ) r_max_datapoints;
     scan_by = ( ! ) r_scan_by;
     next_token = ( ! ) r_next_token;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : get_metric_data_input)

let get_insight_rule_report_output_of_xml i =
  let r_metric_datapoints = ref None in
  let r_contributors = ref None in
  let r_approximate_unique_count = ref None in
  let r_aggregate_value = ref None in
  let r_aggregation_statistic = ref None in
  let r_key_labels = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricDatapoints";
      "Contributors";
      "ApproximateUniqueCount";
      "AggregateValue";
      "AggregationStatistic";
      "KeyLabels";
    ] (fun tag _ ->
      match tag with
      | "MetricDatapoints" ->
          r_metric_datapoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDatapoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_metric_datapoint_of_xml i)
                     ())
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
      | "ApproximateUniqueCount" ->
          r_approximate_unique_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproximateUniqueCount"
                 (fun i _ -> insight_rule_unbound_long_of_xml i)
                 ())
      | "AggregateValue" ->
          r_aggregate_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregateValue"
                 (fun i _ -> insight_rule_unbound_double_of_xml i)
                 ())
      | "AggregationStatistic" ->
          r_aggregation_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AggregationStatistic"
                 (fun i _ -> insight_rule_aggregation_statistic_of_xml i)
                 ())
      | "KeyLabels" ->
          r_key_labels :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyLabels"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_contributor_key_label_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_datapoints = ( ! ) r_metric_datapoints;
     contributors = ( ! ) r_contributors;
     approximate_unique_count = ( ! ) r_approximate_unique_count;
     aggregate_value = ( ! ) r_aggregate_value;
     aggregation_statistic = ( ! ) r_aggregation_statistic;
     key_labels = ( ! ) r_key_labels;
   }
    : get_insight_rule_report_output)

let get_insight_rule_report_input_of_xml i =
  let r_order_by = ref None in
  let r_metrics = ref None in
  let r_max_contributor_count = ref None in
  let r_period = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OrderBy"; "Metrics"; "MaxContributorCount"; "Period"; "EndTime"; "StartTime"; "RuleName" ]
    (fun tag _ ->
      match tag with
      | "OrderBy" ->
          r_order_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderBy"
                 (fun i _ -> insight_rule_order_by_of_xml i)
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
      | "MaxContributorCount" ->
          r_max_contributor_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxContributorCount"
                 (fun i _ -> insight_rule_unbound_integer_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> insight_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     order_by = ( ! ) r_order_by;
     metrics = ( ! ) r_metrics;
     max_contributor_count = ( ! ) r_max_contributor_count;
     period = Smaws_Lib.Xml.Parse.required "Period" (( ! ) r_period) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
   }
    : get_insight_rule_report_input)

let dataset_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dataset_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_dataset_output_of_xml i =
  let r_kms_key_arn = ref None in
  let r_arn = ref None in
  let r_dataset_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KmsKeyArn"; "Arn"; "DatasetId" ] (fun tag _ ->
      match tag with
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn" (fun i _ -> kms_key_arn_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> dataset_arn_of_xml i) ())
      | "DatasetId" ->
          r_dataset_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetId" (fun i _ -> dataset_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     kms_key_arn = ( ! ) r_kms_key_arn;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     dataset_id = Smaws_Lib.Xml.Parse.required "DatasetId" (( ! ) r_dataset_id) i;
   }
    : get_dataset_output)

let dataset_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let get_dashboard_output_of_xml i =
  let r_dashboard_name = ref None in
  let r_dashboard_body = ref None in
  let r_dashboard_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DashboardName"; "DashboardBody"; "DashboardArn" ]
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
      | "DashboardArn" ->
          r_dashboard_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DashboardArn"
                 (fun i _ -> dashboard_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dashboard_name = ( ! ) r_dashboard_name;
     dashboard_body = ( ! ) r_dashboard_body;
     dashboard_arn = ( ! ) r_dashboard_arn;
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

let get_alarm_mute_rule_output_of_xml i =
  let r_mute_type = ref None in
  let r_last_updated_timestamp = ref None in
  let r_status = ref None in
  let r_expire_date = ref None in
  let r_start_date = ref None in
  let r_mute_targets = ref None in
  let r_rule = ref None in
  let r_description = ref None in
  let r_alarm_mute_rule_arn = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MuteType";
      "LastUpdatedTimestamp";
      "Status";
      "ExpireDate";
      "StartDate";
      "MuteTargets";
      "Rule";
      "Description";
      "AlarmMuteRuleArn";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "MuteType" ->
          r_mute_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MuteType" (fun i _ -> mute_type_of_xml i) ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> alarm_mute_rule_status_of_xml i)
                 ())
      | "ExpireDate" ->
          r_expire_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpireDate" (fun i _ -> timestamp_of_xml i) ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "MuteTargets" ->
          r_mute_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MuteTargets"
                 (fun i _ -> mute_targets_of_xml i)
                 ())
      | "Rule" ->
          r_rule := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> rule_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> alarm_description_of_xml i)
                 ())
      | "AlarmMuteRuleArn" ->
          r_alarm_mute_rule_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmMuteRuleArn" (fun i _ -> arn_of_xml i) ())
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mute_type = ( ! ) r_mute_type;
     last_updated_timestamp = ( ! ) r_last_updated_timestamp;
     status = ( ! ) r_status;
     expire_date = ( ! ) r_expire_date;
     start_date = ( ! ) r_start_date;
     mute_targets = ( ! ) r_mute_targets;
     rule = ( ! ) r_rule;
     description = ( ! ) r_description;
     alarm_mute_rule_arn = ( ! ) r_alarm_mute_rule_arn;
     name = ( ! ) r_name;
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

let alarm_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ()

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

let describe_insight_rules_output_of_xml i =
  let r_insight_rules = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InsightRules"; "NextToken" ] (fun tag _ ->
      match tag with
      | "InsightRules" ->
          r_insight_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsightRules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> insight_rule_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ insight_rules = ( ! ) r_insight_rules; next_token = ( ! ) r_next_token }
    : describe_insight_rules_output)

let describe_insight_rules_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> insight_rule_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : describe_insight_rules_input)

let anomaly_detector_state_value_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TRAINED" -> TRAINED
   | "TRAINED_INSUFFICIENT_DATA" -> TRAINED_INSUFFICIENT_DATA
   | "PENDING_TRAINING" -> PENDING_TRAINING
   | _ -> failwith "unknown enum value"
    : anomaly_detector_state_value)

let anomaly_detector_of_xml i =
  let r_metric_math_anomaly_detector = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_metric_characteristics = ref None in
  let r_state_value = ref None in
  let r_configuration = ref None in
  let r_stat = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricMathAnomalyDetector";
      "SingleMetricAnomalyDetector";
      "MetricCharacteristics";
      "StateValue";
      "Configuration";
      "Stat";
      "Dimensions";
      "MetricName";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "MetricCharacteristics" ->
          r_metric_characteristics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricCharacteristics"
                 (fun i _ -> metric_characteristics_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> anomaly_detector_state_value_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> anomaly_detector_configuration_of_xml i)
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     metric_characteristics = ( ! ) r_metric_characteristics;
     state_value = ( ! ) r_state_value;
     configuration = ( ! ) r_configuration;
     stat = ( ! ) r_stat;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
   }
    : anomaly_detector)

let anomaly_detectors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> anomaly_detector_of_xml i) ()

let describe_anomaly_detectors_output_of_xml i =
  let r_next_token = ref None in
  let r_anomaly_detectors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AnomalyDetectors" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AnomalyDetectors" ->
          r_anomaly_detectors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnomalyDetectors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> anomaly_detector_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; anomaly_detectors = ( ! ) r_anomaly_detectors }
    : describe_anomaly_detectors_output)

let anomaly_detector_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "METRIC_MATH" -> METRIC_MATH
   | "SINGLE_METRIC" -> SINGLE_METRIC
   | _ -> failwith "unknown enum value"
    : anomaly_detector_type)

let anomaly_detector_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> anomaly_detector_type_of_xml i) ()

let describe_anomaly_detectors_input_of_xml i =
  let r_anomaly_detector_types = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AnomalyDetectorTypes"; "Dimensions"; "MetricName"; "Namespace"; "MaxResults"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "AnomalyDetectorTypes" ->
          r_anomaly_detector_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnomalyDetectorTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> anomaly_detector_type_of_xml i)
                     ())
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_returned_results_count_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     anomaly_detector_types = ( ! ) r_anomaly_detector_types;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : describe_anomaly_detectors_input)

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
  let r_unit_ = ref None in
  let r_period = ref None in
  let r_dimensions = ref None in
  let r_extended_statistic = ref None in
  let r_statistic = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Unit"; "Period"; "Dimensions"; "ExtendedStatistic"; "Statistic"; "Namespace"; "MetricName" ]
    (fun tag _ ->
      match tag with
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> standard_unit_of_xml i) ())
      | "Period" ->
          r_period :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Period" (fun i _ -> period_of_xml i) ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
                 ())
      | "ExtendedStatistic" ->
          r_extended_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtendedStatistic"
                 (fun i _ -> extended_statistic_of_xml i)
                 ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic" (fun i _ -> statistic_of_xml i) ())
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
     unit_ = ( ! ) r_unit_;
     period = ( ! ) r_period;
     dimensions = ( ! ) r_dimensions;
     extended_statistic = ( ! ) r_extended_statistic;
     statistic = ( ! ) r_statistic;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
   }
    : describe_alarms_for_metric_input)

let actions_suppressed_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Alarm" -> Alarm
   | "ExtensionPeriod" -> ExtensionPeriod
   | "WaitPeriod" -> WaitPeriod
   | _ -> failwith "unknown enum value"
    : actions_suppressed_by)

let actions_suppressed_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let composite_alarm_of_xml i =
  let r_actions_suppressor_extension_period = ref None in
  let r_actions_suppressor_wait_period = ref None in
  let r_actions_suppressor = ref None in
  let r_actions_suppressed_reason = ref None in
  let r_actions_suppressed_by = ref None in
  let r_state_transitioned_timestamp = ref None in
  let r_state_value = ref None in
  let r_state_updated_timestamp = ref None in
  let r_state_reason_data = ref None in
  let r_state_reason = ref None in
  let r_ok_actions = ref None in
  let r_insufficient_data_actions = ref None in
  let r_alarm_rule = ref None in
  let r_alarm_name = ref None in
  let r_alarm_description = ref None in
  let r_alarm_configuration_updated_timestamp = ref None in
  let r_alarm_arn = ref None in
  let r_alarm_actions = ref None in
  let r_actions_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionsSuppressorExtensionPeriod";
      "ActionsSuppressorWaitPeriod";
      "ActionsSuppressor";
      "ActionsSuppressedReason";
      "ActionsSuppressedBy";
      "StateTransitionedTimestamp";
      "StateValue";
      "StateUpdatedTimestamp";
      "StateReasonData";
      "StateReason";
      "OKActions";
      "InsufficientDataActions";
      "AlarmRule";
      "AlarmName";
      "AlarmDescription";
      "AlarmConfigurationUpdatedTimestamp";
      "AlarmArn";
      "AlarmActions";
      "ActionsEnabled";
    ] (fun tag _ ->
      match tag with
      | "ActionsSuppressorExtensionPeriod" ->
          r_actions_suppressor_extension_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorExtensionPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressorWaitPeriod" ->
          r_actions_suppressor_wait_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressorWaitPeriod"
                 (fun i _ -> suppressor_period_of_xml i)
                 ())
      | "ActionsSuppressor" ->
          r_actions_suppressor :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressor"
                 (fun i _ -> alarm_arn_of_xml i)
                 ())
      | "ActionsSuppressedReason" ->
          r_actions_suppressed_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressedReason"
                 (fun i _ -> actions_suppressed_reason_of_xml i)
                 ())
      | "ActionsSuppressedBy" ->
          r_actions_suppressed_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsSuppressedBy"
                 (fun i _ -> actions_suppressed_by_of_xml i)
                 ())
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "StateUpdatedTimestamp" ->
          r_state_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateReasonData" ->
          r_state_reason_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReasonData"
                 (fun i _ -> state_reason_data_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
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
      | "InsufficientDataActions" ->
          r_insufficient_data_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InsufficientDataActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AlarmRule" ->
          r_alarm_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmRule" (fun i _ -> alarm_rule_of_xml i) ())
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
      | "AlarmConfigurationUpdatedTimestamp" ->
          r_alarm_configuration_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmConfigurationUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "AlarmArn" ->
          r_alarm_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmArn" (fun i _ -> alarm_arn_of_xml i) ())
      | "AlarmActions" ->
          r_alarm_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "ActionsEnabled" ->
          r_actions_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionsEnabled"
                 (fun i _ -> actions_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     actions_suppressor_extension_period = ( ! ) r_actions_suppressor_extension_period;
     actions_suppressor_wait_period = ( ! ) r_actions_suppressor_wait_period;
     actions_suppressor = ( ! ) r_actions_suppressor;
     actions_suppressed_reason = ( ! ) r_actions_suppressed_reason;
     actions_suppressed_by = ( ! ) r_actions_suppressed_by;
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     state_value = ( ! ) r_state_value;
     state_updated_timestamp = ( ! ) r_state_updated_timestamp;
     state_reason_data = ( ! ) r_state_reason_data;
     state_reason = ( ! ) r_state_reason;
     ok_actions = ( ! ) r_ok_actions;
     insufficient_data_actions = ( ! ) r_insufficient_data_actions;
     alarm_rule = ( ! ) r_alarm_rule;
     alarm_name = ( ! ) r_alarm_name;
     alarm_description = ( ! ) r_alarm_description;
     alarm_configuration_updated_timestamp = ( ! ) r_alarm_configuration_updated_timestamp;
     alarm_arn = ( ! ) r_alarm_arn;
     alarm_actions = ( ! ) r_alarm_actions;
     actions_enabled = ( ! ) r_actions_enabled;
   }
    : composite_alarm)

let composite_alarms_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> composite_alarm_of_xml i) ()

let describe_alarms_output_of_xml i =
  let r_next_token = ref None in
  let r_log_alarms = ref None in
  let r_metric_alarms = ref None in
  let r_composite_alarms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "LogAlarms"; "MetricAlarms"; "CompositeAlarms" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "LogAlarms" ->
          r_log_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> log_alarm_of_xml i) ())
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
      | "CompositeAlarms" ->
          r_composite_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CompositeAlarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> composite_alarm_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     log_alarms = ( ! ) r_log_alarms;
     metric_alarms = ( ! ) r_metric_alarms;
     composite_alarms = ( ! ) r_composite_alarms;
   }
    : describe_alarms_output)

let alarm_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alarm_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "LogAlarm" -> LogAlarm
   | "MetricAlarm" -> MetricAlarm
   | "CompositeAlarm" -> CompositeAlarm
   | _ -> failwith "unknown enum value"
    : alarm_type)

let alarm_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ()

let action_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let describe_alarms_input_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_action_prefix = ref None in
  let r_state_value = ref None in
  let r_parents_of_alarm_name = ref None in
  let r_children_of_alarm_name = ref None in
  let r_alarm_types = ref None in
  let r_alarm_name_prefix = ref None in
  let r_alarm_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NextToken";
      "MaxRecords";
      "ActionPrefix";
      "StateValue";
      "ParentsOfAlarmName";
      "ChildrenOfAlarmName";
      "AlarmTypes";
      "AlarmNamePrefix";
      "AlarmNames";
    ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "ActionPrefix" ->
          r_action_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionPrefix"
                 (fun i _ -> action_prefix_of_xml i)
                 ())
      | "StateValue" ->
          r_state_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateValue"
                 (fun i _ -> state_value_of_xml i)
                 ())
      | "ParentsOfAlarmName" ->
          r_parents_of_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentsOfAlarmName"
                 (fun i _ -> alarm_name_of_xml i)
                 ())
      | "ChildrenOfAlarmName" ->
          r_children_of_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChildrenOfAlarmName"
                 (fun i _ -> alarm_name_of_xml i)
                 ())
      | "AlarmTypes" ->
          r_alarm_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ())
                 ())
      | "AlarmNamePrefix" ->
          r_alarm_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNamePrefix"
                 (fun i _ -> alarm_name_prefix_of_xml i)
                 ())
      | "AlarmNames" ->
          r_alarm_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     action_prefix = ( ! ) r_action_prefix;
     state_value = ( ! ) r_state_value;
     parents_of_alarm_name = ( ! ) r_parents_of_alarm_name;
     children_of_alarm_name = ( ! ) r_children_of_alarm_name;
     alarm_types = ( ! ) r_alarm_types;
     alarm_name_prefix = ( ! ) r_alarm_name_prefix;
     alarm_names = ( ! ) r_alarm_names;
   }
    : describe_alarms_input)

let contributor_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
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

let alarm_history_item_of_xml i =
  let r_alarm_contributor_attributes = ref None in
  let r_history_data = ref None in
  let r_history_summary = ref None in
  let r_history_item_type = ref None in
  let r_timestamp = ref None in
  let r_alarm_type = ref None in
  let r_alarm_contributor_id = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlarmContributorAttributes";
      "HistoryData";
      "HistorySummary";
      "HistoryItemType";
      "Timestamp";
      "AlarmType";
      "AlarmContributorId";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
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
      | "HistoryData" ->
          r_history_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryData"
                 (fun i _ -> history_data_of_xml i)
                 ())
      | "HistorySummary" ->
          r_history_summary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistorySummary"
                 (fun i _ -> history_summary_of_xml i)
                 ())
      | "HistoryItemType" ->
          r_history_item_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryItemType"
                 (fun i _ -> history_item_type_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "AlarmType" ->
          r_alarm_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmType" (fun i _ -> alarm_type_of_xml i) ())
      | "AlarmContributorId" ->
          r_alarm_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     alarm_contributor_attributes = ( ! ) r_alarm_contributor_attributes;
     history_data = ( ! ) r_history_data;
     history_summary = ( ! ) r_history_summary;
     history_item_type = ( ! ) r_history_item_type;
     timestamp = ( ! ) r_timestamp;
     alarm_type = ( ! ) r_alarm_type;
     alarm_contributor_id = ( ! ) r_alarm_contributor_id;
     alarm_name = ( ! ) r_alarm_name;
   }
    : alarm_history_item)

let alarm_history_items_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_history_item_of_xml i) ()

let describe_alarm_history_output_of_xml i =
  let r_next_token = ref None in
  let r_alarm_history_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AlarmHistoryItems" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AlarmHistoryItems" ->
          r_alarm_history_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmHistoryItems"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_history_item_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; alarm_history_items = ( ! ) r_alarm_history_items }
    : describe_alarm_history_output)

let describe_alarm_history_input_of_xml i =
  let r_scan_by = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_end_date = ref None in
  let r_start_date = ref None in
  let r_history_item_type = ref None in
  let r_alarm_types = ref None in
  let r_alarm_contributor_id = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScanBy";
      "NextToken";
      "MaxRecords";
      "EndDate";
      "StartDate";
      "HistoryItemType";
      "AlarmTypes";
      "AlarmContributorId";
      "AlarmName";
    ] (fun tag _ ->
      match tag with
      | "ScanBy" ->
          r_scan_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanBy" (fun i _ -> scan_by_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "EndDate" ->
          r_end_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndDate" (fun i _ -> timestamp_of_xml i) ())
      | "StartDate" ->
          r_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartDate" (fun i _ -> timestamp_of_xml i) ())
      | "HistoryItemType" ->
          r_history_item_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HistoryItemType"
                 (fun i _ -> history_item_type_of_xml i)
                 ())
      | "AlarmTypes" ->
          r_alarm_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_type_of_xml i) ())
                 ())
      | "AlarmContributorId" ->
          r_alarm_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scan_by = ( ! ) r_scan_by;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     end_date = ( ! ) r_end_date;
     start_date = ( ! ) r_start_date;
     history_item_type = ( ! ) r_history_item_type;
     alarm_types = ( ! ) r_alarm_types;
     alarm_contributor_id = ( ! ) r_alarm_contributor_id;
     alarm_name = ( ! ) r_alarm_name;
   }
    : describe_alarm_history_input)

let alarm_contributor_of_xml i =
  let r_state_transitioned_timestamp = ref None in
  let r_state_reason = ref None in
  let r_contributor_attributes = ref None in
  let r_contributor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StateTransitionedTimestamp"; "StateReason"; "ContributorAttributes"; "ContributorId" ]
    (fun tag _ ->
      match tag with
      | "StateTransitionedTimestamp" ->
          r_state_transitioned_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateTransitionedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StateReason" ->
          r_state_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StateReason"
                 (fun i _ -> state_reason_of_xml i)
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
      | "ContributorId" ->
          r_contributor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContributorId"
                 (fun i _ -> contributor_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     state_transitioned_timestamp = ( ! ) r_state_transitioned_timestamp;
     state_reason = Smaws_Lib.Xml.Parse.required "StateReason" (( ! ) r_state_reason) i;
     contributor_attributes =
       Smaws_Lib.Xml.Parse.required "ContributorAttributes" (( ! ) r_contributor_attributes) i;
     contributor_id = Smaws_Lib.Xml.Parse.required "ContributorId" (( ! ) r_contributor_id) i;
   }
    : alarm_contributor)

let alarm_contributors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_contributor_of_xml i) ()

let describe_alarm_contributors_output_of_xml i =
  let r_next_token = ref None in
  let r_alarm_contributors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AlarmContributors" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AlarmContributors" ->
          r_alarm_contributors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmContributors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alarm_contributor_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     alarm_contributors =
       Smaws_Lib.Xml.Parse.required "AlarmContributors" (( ! ) r_alarm_contributors) i;
   }
    : describe_alarm_contributors_output)

let describe_alarm_contributors_input_of_xml i =
  let r_next_token = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AlarmName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName" (fun i _ -> alarm_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     alarm_name = Smaws_Lib.Xml.Parse.required "AlarmName" (( ! ) r_alarm_name) i;
   }
    : describe_alarm_contributors_input)

let delete_metric_stream_output_of_xml i = ()

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

let delete_dashboards_output_of_xml i = ()

let dashboard_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dashboard_name_of_xml i) ()

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

let delete_anomaly_detector_output_of_xml i = ()

let delete_anomaly_detector_input_of_xml i =
  let r_metric_math_anomaly_detector = ref None in
  let r_single_metric_anomaly_detector = ref None in
  let r_stat = ref None in
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricMathAnomalyDetector";
      "SingleMetricAnomalyDetector";
      "Stat";
      "Dimensions";
      "MetricName";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "MetricMathAnomalyDetector" ->
          r_metric_math_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricMathAnomalyDetector"
                 (fun i _ -> metric_math_anomaly_detector_of_xml i)
                 ())
      | "SingleMetricAnomalyDetector" ->
          r_single_metric_anomaly_detector :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SingleMetricAnomalyDetector"
                 (fun i _ -> single_metric_anomaly_detector_of_xml i)
                 ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> anomaly_detector_metric_stat_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dimension_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_math_anomaly_detector = ( ! ) r_metric_math_anomaly_detector;
     single_metric_anomaly_detector = ( ! ) r_single_metric_anomaly_detector;
     stat = ( ! ) r_stat;
     dimensions = ( ! ) r_dimensions;
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
   }
    : delete_anomaly_detector_input)

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

let associate_dataset_kms_key_output_of_xml i = ()

let associate_dataset_kms_key_input_of_xml i =
  let r_kms_key_arn = ref None in
  let r_dataset_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KmsKeyArn"; "DatasetIdentifier" ] (fun tag _ ->
      match tag with
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn" (fun i _ -> kms_key_arn_of_xml i) ())
      | "DatasetIdentifier" ->
          r_dataset_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatasetIdentifier"
                 (fun i _ -> dataset_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     kms_key_arn = Smaws_Lib.Xml.Parse.required "KmsKeyArn" (( ! ) r_kms_key_arn) i;
     dataset_identifier =
       Smaws_Lib.Xml.Parse.required "DatasetIdentifier" (( ! ) r_dataset_identifier) i;
   }
    : associate_dataset_kms_key_input)
