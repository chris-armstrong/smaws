open Types

let unit_of_xml _ = ()

let nullable_positive_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let accelerator_count_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : accelerator_count_request)

let accelerator_manufacturer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "nvidia" -> NVIDIA
   | "amd" -> AMD
   | "amazon-web-services" -> AMAZON_WEB_SERVICES
   | "xilinx" -> XILINX
   | _ -> failwith "unknown enum value"
    : accelerator_manufacturer)

let accelerator_manufacturers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_manufacturer_of_xml i) ()

let accelerator_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "a100" -> A100
   | "v100" -> V100
   | "k80" -> K80
   | "t4" -> T4
   | "m60" -> M60
   | "radeon-pro-v520" -> RADEON_PRO_V520
   | "vu9p" -> VU9P
   | _ -> failwith "unknown enum value"
    : accelerator_name)

let accelerator_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_name_of_xml i) ()

let accelerator_total_memory_mi_b_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : accelerator_total_memory_mi_b_request)

let accelerator_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "gpu" -> GPU
   | "fpga" -> FPGA
   | "inference" -> INFERENCE
   | _ -> failwith "unknown enum value"
    : accelerator_type)

let accelerator_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_type_of_xml i) ()

let xml_string_max_len255_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let active_instance_refresh_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : active_instance_refresh_not_found_fault)

let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let auto_scaling_group_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let progress_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let scaling_activity_status_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PendingSpotBidPlacement" -> PendingSpotBidPlacement
   | "WaitingForSpotInstanceRequestId" -> WaitingForSpotInstanceRequestId
   | "WaitingForSpotInstanceId" -> WaitingForSpotInstanceId
   | "WaitingForInstanceId" -> WaitingForInstanceId
   | "PreInService" -> PreInService
   | "InProgress" -> InProgress
   | "WaitingForELBConnectionDraining" -> WaitingForELBConnectionDraining
   | "MidLifecycleAction" -> MidLifecycleAction
   | "WaitingForInstanceWarmup" -> WaitingForInstanceWarmup
   | "Successful" -> Successful
   | "Failed" -> Failed
   | "Cancelled" -> Cancelled
   | "WaitingForConnectionDraining" -> WaitingForConnectionDraining
   | "WaitingForInPlaceUpdateToStart" -> WaitingForInPlaceUpdateToStart
   | "WaitingForInPlaceUpdateToFinalize" -> WaitingForInPlaceUpdateToFinalize
   | "InPlaceUpdateInProgress" -> InPlaceUpdateInProgress
   | _ -> failwith "unknown enum value"
    : scaling_activity_status_code)

let timestamp_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let xml_string_max_len1023_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let activity_of_xml i =
  let r_activity_id = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_description = ref None in
  let r_cause = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_status_code = ref None in
  let r_status_message = ref None in
  let r_progress = ref None in
  let r_details = ref None in
  let r_auto_scaling_group_state = ref None in
  let r_auto_scaling_group_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActivityId";
      "AutoScalingGroupName";
      "Description";
      "Cause";
      "StartTime";
      "EndTime";
      "StatusCode";
      "StatusMessage";
      "Progress";
      "Details";
      "AutoScalingGroupState";
      "AutoScalingGroupARN";
    ] (fun tag _ ->
      match tag with
      | "ActivityId" ->
          r_activity_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActivityId" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "Cause" ->
          r_cause :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Cause"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> scaling_activity_status_code_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Progress" ->
          r_progress :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Progress" (fun i _ -> progress_of_xml i) ())
      | "Details" ->
          r_details :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Details" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroupState" ->
          r_auto_scaling_group_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupState"
                 (fun i _ -> auto_scaling_group_state_of_xml i)
                 ())
      | "AutoScalingGroupARN" ->
          r_auto_scaling_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     activity_id = Smaws_Lib.Xml.Parse.required "ActivityId" (( ! ) r_activity_id) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     description = ( ! ) r_description;
     cause = Smaws_Lib.Xml.Parse.required "Cause" (( ! ) r_cause) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = ( ! ) r_end_time;
     status_code = Smaws_Lib.Xml.Parse.required "StatusCode" (( ! ) r_status_code) i;
     status_message = ( ! ) r_status_message;
     progress = ( ! ) r_progress;
     details = ( ! ) r_details;
     auto_scaling_group_state = ( ! ) r_auto_scaling_group_state;
     auto_scaling_group_ar_n = ( ! ) r_auto_scaling_group_ar_n;
   }
    : activity)

let activities_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ()

let activities_type_of_xml i =
  let r_activities = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     activities = Smaws_Lib.Xml.Parse.required "Activities" (( ! ) r_activities) i;
     next_token = ( ! ) r_next_token;
   }
    : activities_type)

let activity_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let activity_type_of_xml i =
  let r_activity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activity" ] (fun tag _ ->
      match tag with
      | "Activity" ->
          r_activity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Activity" (fun i _ -> activity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activity = ( ! ) r_activity } : activity_type)

let adjustment_type_of_xml i =
  let r_adjustment_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdjustmentType" ] (fun tag _ ->
      match tag with
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ adjustment_type = ( ! ) r_adjustment_type } : adjustment_type)

let adjustment_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> adjustment_type_of_xml i) ()

let alarm_of_xml i =
  let r_alarm_name = ref None in
  let r_alarm_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmName"; "AlarmARN" ] (fun tag _ ->
      match tag with
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AlarmARN" ->
          r_alarm_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_name = ( ! ) r_alarm_name; alarm_ar_n = ( ! ) r_alarm_ar_n } : alarm)

let alarm_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let alarm_specification_of_xml i =
  let r_alarms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Alarms" ] (fun tag _ ->
      match tag with
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarms = ( ! ) r_alarms } : alarm_specification)

let alarms_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ()
let allowed_instance_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let allowed_instance_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> allowed_instance_type_of_xml i) ()

let already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : already_exists_fault)

let any_printable_ascii_string_max_len4000_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let ascii_string_max_len255_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let associate_public_ip_address_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let service_linked_role_failure_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : service_linked_role_failure)

let resource_contention_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_contention_fault)

let xml_string_max_len19_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let instance_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len19_of_xml i) ()

let attach_instances_query_of_xml i =
  let r_instance_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceIds"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : attach_instances_query)

let instance_refresh_in_progress_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : instance_refresh_in_progress_fault)

let attach_load_balancer_target_groups_result_type_of_xml i = ()
let xml_string_max_len511_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_group_ar_ns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len511_of_xml i) ()

let attach_load_balancer_target_groups_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_target_group_ar_ns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "TargetGroupARNs" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     target_group_ar_ns =
       Smaws_Lib.Xml.Parse.required "TargetGroupARNs" (( ! ) r_target_group_ar_ns) i;
   }
    : attach_load_balancer_target_groups_type)

let attach_load_balancers_result_type_of_xml i = ()

let load_balancer_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let attach_load_balancers_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "LoadBalancerNames" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
   }
    : attach_load_balancers_type)

let attach_traffic_sources_result_type_of_xml i = ()

let skip_zonal_shift_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let traffic_source_identifier_of_xml i =
  let r_identifier = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identifier"; "Type" ] (fun tag _ ->
      match tag with
      | "Identifier" ->
          r_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identifier"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identifier = Smaws_Lib.Xml.Parse.required "Identifier" (( ! ) r_identifier) i;
     type_ = ( ! ) r_type_;
   }
    : traffic_source_identifier)

let traffic_sources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> traffic_source_identifier_of_xml i) ()

let attach_traffic_sources_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_traffic_sources = ref None in
  let r_skip_zonal_shift_validation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "TrafficSources"; "SkipZonalShiftValidation" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     traffic_sources = Smaws_Lib.Xml.Parse.required "TrafficSources" (( ! ) r_traffic_sources) i;
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
   }
    : attach_traffic_sources_type)

let auto_rollback_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let retention_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "retain" -> Retain | "terminate" -> Terminate | _ -> failwith "unknown enum value"
    : retention_action)

let retention_triggers_of_xml i =
  let r_terminate_hook_abandon = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TerminateHookAbandon" ] (fun tag _ ->
      match tag with
      | "TerminateHookAbandon" ->
          r_terminate_hook_abandon :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateHookAbandon"
                 (fun i _ -> retention_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ terminate_hook_abandon = ( ! ) r_terminate_hook_abandon } : retention_triggers)

let instance_lifecycle_policy_of_xml i =
  let r_retention_triggers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RetentionTriggers" ] (fun tag _ ->
      match tag with
      | "RetentionTriggers" ->
          r_retention_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionTriggers"
                 (fun i _ -> retention_triggers_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ retention_triggers = ( ! ) r_retention_triggers } : instance_lifecycle_policy)

let capacity_reservation_resource_group_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

let capacity_reservation_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ascii_string_max_len255_of_xml i) ()

let capacity_reservation_target_of_xml i =
  let r_capacity_reservation_ids = ref None in
  let r_capacity_reservation_resource_group_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CapacityReservationIds"; "CapacityReservationResourceGroupArns" ] (fun tag _ ->
      match tag with
      | "CapacityReservationIds" ->
          r_capacity_reservation_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ascii_string_max_len255_of_xml i)
                     ())
                 ())
      | "CapacityReservationResourceGroupArns" ->
          r_capacity_reservation_resource_group_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationResourceGroupArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_ids = ( ! ) r_capacity_reservation_ids;
     capacity_reservation_resource_group_arns = ( ! ) r_capacity_reservation_resource_group_arns;
   }
    : capacity_reservation_target)

let capacity_reservation_preference_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "capacity-reservations-only" -> CapacityReservationsOnly
   | "capacity-reservations-first" -> CapacityReservationsFirst
   | "none" -> None_
   | "default" -> Default
   | _ -> failwith "unknown enum value"
    : capacity_reservation_preference)

let capacity_reservation_specification_of_xml i =
  let r_capacity_reservation_preference = ref None in
  let r_capacity_reservation_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CapacityReservationPreference"; "CapacityReservationTarget" ] (fun tag _ ->
      match tag with
      | "CapacityReservationPreference" ->
          r_capacity_reservation_preference :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationPreference"
                 (fun i _ -> capacity_reservation_preference_of_xml i)
                 ())
      | "CapacityReservationTarget" ->
          r_capacity_reservation_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationTarget"
                 (fun i _ -> capacity_reservation_target_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_preference = ( ! ) r_capacity_reservation_preference;
     capacity_reservation_target = ( ! ) r_capacity_reservation_target;
   }
    : capacity_reservation_specification)

let impaired_zone_health_check_behavior_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ReplaceUnhealthy" -> ReplaceUnhealthy
   | "IgnoreUnhealthy" -> IgnoreUnhealthy
   | _ -> failwith "unknown enum value"
    : impaired_zone_health_check_behavior)

let zonal_shift_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let availability_zone_impairment_policy_of_xml i =
  let r_zonal_shift_enabled = ref None in
  let r_impaired_zone_health_check_behavior = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ZonalShiftEnabled"; "ImpairedZoneHealthCheckBehavior" ] (fun tag _ ->
      match tag with
      | "ZonalShiftEnabled" ->
          r_zonal_shift_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ZonalShiftEnabled"
                 (fun i _ -> zonal_shift_enabled_of_xml i)
                 ())
      | "ImpairedZoneHealthCheckBehavior" ->
          r_impaired_zone_health_check_behavior :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImpairedZoneHealthCheckBehavior"
                 (fun i _ -> impaired_zone_health_check_behavior_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     zonal_shift_enabled = ( ! ) r_zonal_shift_enabled;
     impaired_zone_health_check_behavior = ( ! ) r_impaired_zone_health_check_behavior;
   }
    : availability_zone_impairment_policy)

let capacity_distribution_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "balanced-only" -> BALANCED_ONLY
   | "balanced-best-effort" -> BALANCED_BEST_EFFORT
   | "reservations-then-balanced" -> RESERVATIONS_THEN_BALANCED
   | _ -> failwith "unknown enum value"
    : capacity_distribution_strategy)

let availability_zone_distribution_of_xml i =
  let r_capacity_distribution_strategy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CapacityDistributionStrategy" ] (fun tag _ ->
      match tag with
      | "CapacityDistributionStrategy" ->
          r_capacity_distribution_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityDistributionStrategy"
                 (fun i _ -> capacity_distribution_strategy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ capacity_distribution_strategy = ( ! ) r_capacity_distribution_strategy }
    : availability_zone_distribution)

let deletion_protection_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "none" -> None_
   | "prevent-force-deletion" -> PreventForceDeletion
   | "prevent-all-deletion" -> PreventAllDeletion
   | _ -> failwith "unknown enum value"
    : deletion_protection)

let int_percent100_to200_resettable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_percent_resettable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_maintenance_policy_of_xml i =
  let r_min_healthy_percentage = ref None in
  let r_max_healthy_percentage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MinHealthyPercentage"; "MaxHealthyPercentage" ]
    (fun tag _ ->
      match tag with
      | "MinHealthyPercentage" ->
          r_min_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinHealthyPercentage"
                 (fun i _ -> int_percent_resettable_of_xml i)
                 ())
      | "MaxHealthyPercentage" ->
          r_max_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxHealthyPercentage"
                 (fun i _ -> int_percent100_to200_resettable_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     min_healthy_percentage = ( ! ) r_min_healthy_percentage;
     max_healthy_percentage = ( ! ) r_max_healthy_percentage;
   }
    : instance_maintenance_policy)

let default_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let warm_pool_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reuse_on_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_reuse_policy_of_xml i =
  let r_reuse_on_scale_in = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReuseOnScaleIn" ] (fun tag _ ->
      match tag with
      | "ReuseOnScaleIn" ->
          r_reuse_on_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReuseOnScaleIn"
                 (fun i _ -> reuse_on_scale_in_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reuse_on_scale_in = ( ! ) r_reuse_on_scale_in } : instance_reuse_policy)

let warm_pool_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PendingDelete" -> PendingDelete | _ -> failwith "unknown enum value"
    : warm_pool_status)

let warm_pool_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Stopped" -> Stopped
   | "Running" -> Running
   | "Hibernated" -> Hibernated
   | _ -> failwith "unknown enum value"
    : warm_pool_state)

let warm_pool_min_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_group_prepared_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let warm_pool_configuration_of_xml i =
  let r_max_group_prepared_capacity = ref None in
  let r_min_size = ref None in
  let r_pool_state = ref None in
  let r_status = ref None in
  let r_instance_reuse_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxGroupPreparedCapacity"; "MinSize"; "PoolState"; "Status"; "InstanceReusePolicy" ]
    (fun tag _ ->
      match tag with
      | "MaxGroupPreparedCapacity" ->
          r_max_group_prepared_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxGroupPreparedCapacity"
                 (fun i _ -> max_group_prepared_capacity_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> warm_pool_min_size_of_xml i)
                 ())
      | "PoolState" ->
          r_pool_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PoolState"
                 (fun i _ -> warm_pool_state_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> warm_pool_status_of_xml i)
                 ())
      | "InstanceReusePolicy" ->
          r_instance_reuse_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceReusePolicy"
                 (fun i _ -> instance_reuse_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_group_prepared_capacity = ( ! ) r_max_group_prepared_capacity;
     min_size = ( ! ) r_min_size;
     pool_state = ( ! ) r_pool_state;
     status = ( ! ) r_status;
     instance_reuse_policy = ( ! ) r_instance_reuse_policy;
   }
    : warm_pool_configuration)

let capacity_rebalance_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_instance_lifetime_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_protected_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let xml_string_max_len1600_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let termination_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len1600_of_xml i) ()

let propagate_at_launch_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_description_of_xml i =
  let r_resource_id = ref None in
  let r_resource_type = ref None in
  let r_key = ref None in
  let r_value = ref None in
  let r_propagate_at_launch = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceId"; "ResourceType"; "Key"; "Value"; "PropagateAtLaunch" ] (fun tag _ ->
      match tag with
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId" (fun i _ -> xml_string_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "PropagateAtLaunch" ->
          r_propagate_at_launch :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropagateAtLaunch"
                 (fun i _ -> propagate_at_launch_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_id = ( ! ) r_resource_id;
     resource_type = ( ! ) r_resource_type;
     key = ( ! ) r_key;
     value = ( ! ) r_value;
     propagate_at_launch = ( ! ) r_propagate_at_launch;
   }
    : tag_description)

let tag_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_description_of_xml i) ()

let enabled_metric_of_xml i =
  let r_metric = ref None in
  let r_granularity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric"; "Granularity" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metric"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric = ( ! ) r_metric; granularity = ( ! ) r_granularity } : enabled_metric)

let enabled_metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> enabled_metric_of_xml i) ()

let xml_string_max_len5000_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let suspended_process_of_xml i =
  let r_process_name = ref None in
  let r_suspension_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProcessName"; "SuspensionReason" ] (fun tag _ ->
      match tag with
      | "ProcessName" ->
          r_process_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProcessName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SuspensionReason" ->
          r_suspension_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuspensionReason"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ process_name = ( ! ) r_process_name; suspension_reason = ( ! ) r_suspension_reason }
    : suspended_process)

let suspended_processes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> suspended_process_of_xml i) ()

let xml_string_max_len32_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let launch_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let launch_template_specification_of_xml i =
  let r_launch_template_id = ref None in
  let r_launch_template_name = ref None in
  let r_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LaunchTemplateId"; "LaunchTemplateName"; "Version" ] (fun tag _ ->
      match tag with
      | "LaunchTemplateId" ->
          r_launch_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplateName" ->
          r_launch_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateName"
                 (fun i _ -> launch_template_name_of_xml i)
                 ())
      | "Version" ->
          r_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Version"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_template_id = ( ! ) r_launch_template_id;
     launch_template_name = ( ! ) r_launch_template_name;
     version = ( ! ) r_version;
   }
    : launch_template_specification)

let lifecycle_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Pending" -> PENDING
   | "Pending:Wait" -> PENDING_WAIT
   | "Pending:Proceed" -> PENDING_PROCEED
   | "Quarantined" -> QUARANTINED
   | "InService" -> IN_SERVICE
   | "Terminating" -> TERMINATING
   | "Terminating:Wait" -> TERMINATING_WAIT
   | "Terminating:Proceed" -> TERMINATING_PROCEED
   | "Terminating:Retained" -> TERMINATING_RETAINED
   | "Terminated" -> TERMINATED
   | "Detaching" -> DETACHING
   | "Detached" -> DETACHED
   | "EnteringStandby" -> ENTERING_STANDBY
   | "Standby" -> STANDBY
   | "ReplacingRootVolume" -> REPLACING_ROOT_VOLUME
   | "ReplacingRootVolume:Wait" -> REPLACING_ROOT_VOLUME_WAIT
   | "ReplacingRootVolume:Proceed" -> REPLACING_ROOT_VOLUME_PROCEED
   | "RootVolumeReplaced" -> ROOT_VOLUME_REPLACED
   | "Warmed:Pending" -> WARMED_PENDING
   | "Warmed:Pending:Wait" -> WARMED_PENDING_WAIT
   | "Warmed:Pending:Proceed" -> WARMED_PENDING_PROCEED
   | "Warmed:Pending:Retained" -> WARMED_PENDING_RETAINED
   | "Warmed:Terminating" -> WARMED_TERMINATING
   | "Warmed:Terminating:Wait" -> WARMED_TERMINATING_WAIT
   | "Warmed:Terminating:Proceed" -> WARMED_TERMINATING_PROCEED
   | "Warmed:Terminating:Retained" -> WARMED_TERMINATING_RETAINED
   | "Warmed:Terminated" -> WARMED_TERMINATED
   | "Warmed:Stopped" -> WARMED_STOPPED
   | "Warmed:Running" -> WARMED_RUNNING
   | "Warmed:Hibernated" -> WARMED_HIBERNATED
   | _ -> failwith "unknown enum value"
    : lifecycle_state)

let instance_of_xml i =
  let r_instance_id = ref None in
  let r_instance_type = ref None in
  let r_availability_zone = ref None in
  let r_availability_zone_id = ref None in
  let r_lifecycle_state = ref None in
  let r_health_status = ref None in
  let r_launch_configuration_name = ref None in
  let r_launch_template = ref None in
  let r_image_id = ref None in
  let r_protected_from_scale_in = ref None in
  let r_weighted_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceId";
      "InstanceType";
      "AvailabilityZone";
      "AvailabilityZoneId";
      "LifecycleState";
      "HealthStatus";
      "LaunchConfigurationName";
      "LaunchTemplate";
      "ImageId";
      "ProtectedFromScaleIn";
      "WeightedCapacity";
    ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> lifecycle_state_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
     instance_type = ( ! ) r_instance_type;
     availability_zone =
       Smaws_Lib.Xml.Parse.required "AvailabilityZone" (( ! ) r_availability_zone) i;
     availability_zone_id = ( ! ) r_availability_zone_id;
     lifecycle_state = Smaws_Lib.Xml.Parse.required "LifecycleState" (( ! ) r_lifecycle_state) i;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     launch_template = ( ! ) r_launch_template;
     image_id = ( ! ) r_image_id;
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
     weighted_capacity = ( ! ) r_weighted_capacity;
   }
    : instance)

let instances_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ()

let health_check_grace_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let availability_zone_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let cooldown_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_predicted_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_desired_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_max_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_min_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let mixed_instance_spot_price_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let spot_instance_pools_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let on_demand_percentage_above_base_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let on_demand_base_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instances_distribution_of_xml i =
  let r_on_demand_allocation_strategy = ref None in
  let r_on_demand_base_capacity = ref None in
  let r_on_demand_percentage_above_base_capacity = ref None in
  let r_spot_allocation_strategy = ref None in
  let r_spot_instance_pools = ref None in
  let r_spot_max_price = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OnDemandAllocationStrategy";
      "OnDemandBaseCapacity";
      "OnDemandPercentageAboveBaseCapacity";
      "SpotAllocationStrategy";
      "SpotInstancePools";
      "SpotMaxPrice";
    ] (fun tag _ ->
      match tag with
      | "OnDemandAllocationStrategy" ->
          r_on_demand_allocation_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandAllocationStrategy"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "OnDemandBaseCapacity" ->
          r_on_demand_base_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandBaseCapacity"
                 (fun i _ -> on_demand_base_capacity_of_xml i)
                 ())
      | "OnDemandPercentageAboveBaseCapacity" ->
          r_on_demand_percentage_above_base_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandPercentageAboveBaseCapacity"
                 (fun i _ -> on_demand_percentage_above_base_capacity_of_xml i)
                 ())
      | "SpotAllocationStrategy" ->
          r_spot_allocation_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotAllocationStrategy"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "SpotInstancePools" ->
          r_spot_instance_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotInstancePools"
                 (fun i _ -> spot_instance_pools_of_xml i)
                 ())
      | "SpotMaxPrice" ->
          r_spot_max_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotMaxPrice"
                 (fun i _ -> mixed_instance_spot_price_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     on_demand_allocation_strategy = ( ! ) r_on_demand_allocation_strategy;
     on_demand_base_capacity = ( ! ) r_on_demand_base_capacity;
     on_demand_percentage_above_base_capacity = ( ! ) r_on_demand_percentage_above_base_capacity;
     spot_allocation_strategy = ( ! ) r_spot_allocation_strategy;
     spot_instance_pools = ( ! ) r_spot_instance_pools;
     spot_max_price = ( ! ) r_spot_max_price;
   }
    : instances_distribution)

let image_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let performance_factor_reference_request_of_xml i =
  let r_instance_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceFamily" ] (fun tag _ ->
      match tag with
      | "InstanceFamily" ->
          r_instance_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_family = ( ! ) r_instance_family } : performance_factor_reference_request)

let performance_factor_reference_set_request_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item"
    (fun i _ -> performance_factor_reference_request_of_xml i)
    ()

let cpu_performance_factor_request_of_xml i =
  let r_references = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reference" ] (fun tag _ ->
      match tag with
      | "Reference" ->
          r_references :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reference"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item"
                     (fun i _ -> performance_factor_reference_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ references = ( ! ) r_references } : cpu_performance_factor_request)

let baseline_performance_factors_request_of_xml i =
  let r_cpu = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cpu" ] (fun tag _ ->
      match tag with
      | "Cpu" ->
          r_cpu :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Cpu"
                 (fun i _ -> cpu_performance_factor_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cpu = ( ! ) r_cpu } : baseline_performance_factors_request)

let nullable_positive_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let network_bandwidth_gbps_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : network_bandwidth_gbps_request)

let baseline_ebs_bandwidth_mbps_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : baseline_ebs_bandwidth_mbps_request)

let total_local_storage_gb_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : total_local_storage_gb_request)

let local_storage_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "hdd" -> HDD | "ssd" -> SSD | _ -> failwith "unknown enum value"
    : local_storage_type)

let local_storage_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> local_storage_type_of_xml i) ()

let local_storage_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "included" -> INCLUDED
   | "excluded" -> EXCLUDED
   | "required" -> REQUIRED
   | _ -> failwith "unknown enum value"
    : local_storage)

let network_interface_count_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : network_interface_count_request)

let nullable_boolean_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let burstable_performance_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "included" -> INCLUDED
   | "excluded" -> EXCLUDED
   | "required" -> REQUIRED
   | _ -> failwith "unknown enum value"
    : burstable_performance)

let bare_metal_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "included" -> INCLUDED
   | "excluded" -> EXCLUDED
   | "required" -> REQUIRED
   | _ -> failwith "unknown enum value"
    : bare_metal)

let instance_generation_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "current" -> CURRENT | "previous" -> PREVIOUS | _ -> failwith "unknown enum value"
    : instance_generation)

let instance_generations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_generation_of_xml i) ()

let excluded_instance_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let excluded_instance_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> excluded_instance_of_xml i) ()

let memory_gi_b_per_v_cpu_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = ( ! ) r_min; max = ( ! ) r_max } : memory_gi_b_per_v_cpu_request)

let cpu_manufacturer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "intel" -> INTEL
   | "amd" -> AMD
   | "amazon-web-services" -> AMAZON_WEB_SERVICES
   | "apple" -> APPLE
   | _ -> failwith "unknown enum value"
    : cpu_manufacturer)

let cpu_manufacturers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cpu_manufacturer_of_xml i) ()

let memory_mi_b_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = Smaws_Lib.Xml.Parse.required "Min" (( ! ) r_min) i; max = ( ! ) r_max }
    : memory_mi_b_request)

let v_cpu_count_request_of_xml i =
  let r_min = ref None in
  let r_max = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Min"; "Max" ] (fun tag _ ->
      match tag with
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min = Smaws_Lib.Xml.Parse.required "Min" (( ! ) r_min) i; max = ( ! ) r_max }
    : v_cpu_count_request)

let instance_requirements_of_xml i =
  let r_v_cpu_count = ref None in
  let r_memory_mi_b = ref None in
  let r_cpu_manufacturers = ref None in
  let r_memory_gi_b_per_v_cpu = ref None in
  let r_excluded_instance_types = ref None in
  let r_instance_generations = ref None in
  let r_spot_max_price_percentage_over_lowest_price = ref None in
  let r_max_spot_price_as_percentage_of_optimal_on_demand_price = ref None in
  let r_on_demand_max_price_percentage_over_lowest_price = ref None in
  let r_bare_metal = ref None in
  let r_burstable_performance = ref None in
  let r_require_hibernate_support = ref None in
  let r_network_interface_count = ref None in
  let r_local_storage = ref None in
  let r_local_storage_types = ref None in
  let r_total_local_storage_g_b = ref None in
  let r_baseline_ebs_bandwidth_mbps = ref None in
  let r_accelerator_types = ref None in
  let r_accelerator_count = ref None in
  let r_accelerator_manufacturers = ref None in
  let r_accelerator_names = ref None in
  let r_accelerator_total_memory_mi_b = ref None in
  let r_network_bandwidth_gbps = ref None in
  let r_allowed_instance_types = ref None in
  let r_baseline_performance_factors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "VCpuCount";
      "MemoryMiB";
      "CpuManufacturers";
      "MemoryGiBPerVCpu";
      "ExcludedInstanceTypes";
      "InstanceGenerations";
      "SpotMaxPricePercentageOverLowestPrice";
      "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice";
      "OnDemandMaxPricePercentageOverLowestPrice";
      "BareMetal";
      "BurstablePerformance";
      "RequireHibernateSupport";
      "NetworkInterfaceCount";
      "LocalStorage";
      "LocalStorageTypes";
      "TotalLocalStorageGB";
      "BaselineEbsBandwidthMbps";
      "AcceleratorTypes";
      "AcceleratorCount";
      "AcceleratorManufacturers";
      "AcceleratorNames";
      "AcceleratorTotalMemoryMiB";
      "NetworkBandwidthGbps";
      "AllowedInstanceTypes";
      "BaselinePerformanceFactors";
    ] (fun tag _ ->
      match tag with
      | "VCpuCount" ->
          r_v_cpu_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VCpuCount"
                 (fun i _ -> v_cpu_count_request_of_xml i)
                 ())
      | "MemoryMiB" ->
          r_memory_mi_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemoryMiB"
                 (fun i _ -> memory_mi_b_request_of_xml i)
                 ())
      | "CpuManufacturers" ->
          r_cpu_manufacturers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CpuManufacturers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cpu_manufacturer_of_xml i)
                     ())
                 ())
      | "MemoryGiBPerVCpu" ->
          r_memory_gi_b_per_v_cpu :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemoryGiBPerVCpu"
                 (fun i _ -> memory_gi_b_per_v_cpu_request_of_xml i)
                 ())
      | "ExcludedInstanceTypes" ->
          r_excluded_instance_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedInstanceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> excluded_instance_of_xml i)
                     ())
                 ())
      | "InstanceGenerations" ->
          r_instance_generations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceGenerations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_generation_of_xml i)
                     ())
                 ())
      | "SpotMaxPricePercentageOverLowestPrice" ->
          r_spot_max_price_percentage_over_lowest_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotMaxPricePercentageOverLowestPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice" ->
          r_max_spot_price_as_percentage_of_optimal_on_demand_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "OnDemandMaxPricePercentageOverLowestPrice" ->
          r_on_demand_max_price_percentage_over_lowest_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandMaxPricePercentageOverLowestPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "BareMetal" ->
          r_bare_metal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BareMetal" (fun i _ -> bare_metal_of_xml i) ())
      | "BurstablePerformance" ->
          r_burstable_performance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BurstablePerformance"
                 (fun i _ -> burstable_performance_of_xml i)
                 ())
      | "RequireHibernateSupport" ->
          r_require_hibernate_support :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireHibernateSupport"
                 (fun i _ -> nullable_boolean_of_xml i)
                 ())
      | "NetworkInterfaceCount" ->
          r_network_interface_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaceCount"
                 (fun i _ -> network_interface_count_request_of_xml i)
                 ())
      | "LocalStorage" ->
          r_local_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LocalStorage"
                 (fun i _ -> local_storage_of_xml i)
                 ())
      | "LocalStorageTypes" ->
          r_local_storage_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LocalStorageTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> local_storage_type_of_xml i)
                     ())
                 ())
      | "TotalLocalStorageGB" ->
          r_total_local_storage_g_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalLocalStorageGB"
                 (fun i _ -> total_local_storage_gb_request_of_xml i)
                 ())
      | "BaselineEbsBandwidthMbps" ->
          r_baseline_ebs_bandwidth_mbps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BaselineEbsBandwidthMbps"
                 (fun i _ -> baseline_ebs_bandwidth_mbps_request_of_xml i)
                 ())
      | "AcceleratorTypes" ->
          r_accelerator_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_type_of_xml i)
                     ())
                 ())
      | "AcceleratorCount" ->
          r_accelerator_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorCount"
                 (fun i _ -> accelerator_count_request_of_xml i)
                 ())
      | "AcceleratorManufacturers" ->
          r_accelerator_manufacturers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorManufacturers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_manufacturer_of_xml i)
                     ())
                 ())
      | "AcceleratorNames" ->
          r_accelerator_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_name_of_xml i)
                     ())
                 ())
      | "AcceleratorTotalMemoryMiB" ->
          r_accelerator_total_memory_mi_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorTotalMemoryMiB"
                 (fun i _ -> accelerator_total_memory_mi_b_request_of_xml i)
                 ())
      | "NetworkBandwidthGbps" ->
          r_network_bandwidth_gbps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkBandwidthGbps"
                 (fun i _ -> network_bandwidth_gbps_request_of_xml i)
                 ())
      | "AllowedInstanceTypes" ->
          r_allowed_instance_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedInstanceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> allowed_instance_type_of_xml i)
                     ())
                 ())
      | "BaselinePerformanceFactors" ->
          r_baseline_performance_factors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BaselinePerformanceFactors"
                 (fun i _ -> baseline_performance_factors_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     v_cpu_count = Smaws_Lib.Xml.Parse.required "VCpuCount" (( ! ) r_v_cpu_count) i;
     memory_mi_b = Smaws_Lib.Xml.Parse.required "MemoryMiB" (( ! ) r_memory_mi_b) i;
     cpu_manufacturers = ( ! ) r_cpu_manufacturers;
     memory_gi_b_per_v_cpu = ( ! ) r_memory_gi_b_per_v_cpu;
     excluded_instance_types = ( ! ) r_excluded_instance_types;
     instance_generations = ( ! ) r_instance_generations;
     spot_max_price_percentage_over_lowest_price =
       ( ! ) r_spot_max_price_percentage_over_lowest_price;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       ( ! ) r_max_spot_price_as_percentage_of_optimal_on_demand_price;
     on_demand_max_price_percentage_over_lowest_price =
       ( ! ) r_on_demand_max_price_percentage_over_lowest_price;
     bare_metal = ( ! ) r_bare_metal;
     burstable_performance = ( ! ) r_burstable_performance;
     require_hibernate_support = ( ! ) r_require_hibernate_support;
     network_interface_count = ( ! ) r_network_interface_count;
     local_storage = ( ! ) r_local_storage;
     local_storage_types = ( ! ) r_local_storage_types;
     total_local_storage_g_b = ( ! ) r_total_local_storage_g_b;
     baseline_ebs_bandwidth_mbps = ( ! ) r_baseline_ebs_bandwidth_mbps;
     accelerator_types = ( ! ) r_accelerator_types;
     accelerator_count = ( ! ) r_accelerator_count;
     accelerator_manufacturers = ( ! ) r_accelerator_manufacturers;
     accelerator_names = ( ! ) r_accelerator_names;
     accelerator_total_memory_mi_b = ( ! ) r_accelerator_total_memory_mi_b;
     network_bandwidth_gbps = ( ! ) r_network_bandwidth_gbps;
     allowed_instance_types = ( ! ) r_allowed_instance_types;
     baseline_performance_factors = ( ! ) r_baseline_performance_factors;
   }
    : instance_requirements)

let launch_template_overrides_of_xml i =
  let r_instance_type = ref None in
  let r_weighted_capacity = ref None in
  let r_launch_template_specification = ref None in
  let r_instance_requirements = ref None in
  let r_image_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceType";
      "WeightedCapacity";
      "LaunchTemplateSpecification";
      "InstanceRequirements";
      "ImageId";
    ] (fun tag _ ->
      match tag with
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "LaunchTemplateSpecification" ->
          r_launch_template_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateSpecification"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "InstanceRequirements" ->
          r_instance_requirements :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRequirements"
                 (fun i _ -> instance_requirements_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId" (fun i _ -> image_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_type = ( ! ) r_instance_type;
     weighted_capacity = ( ! ) r_weighted_capacity;
     launch_template_specification = ( ! ) r_launch_template_specification;
     instance_requirements = ( ! ) r_instance_requirements;
     image_id = ( ! ) r_image_id;
   }
    : launch_template_overrides)

let overrides_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_template_overrides_of_xml i) ()

let launch_template_of_xml i =
  let r_launch_template_specification = ref None in
  let r_overrides = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchTemplateSpecification"; "Overrides" ]
    (fun tag _ ->
      match tag with
      | "LaunchTemplateSpecification" ->
          r_launch_template_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateSpecification"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "Overrides" ->
          r_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Overrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_template_overrides_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_template_specification = ( ! ) r_launch_template_specification;
     overrides = ( ! ) r_overrides;
   }
    : launch_template)

let mixed_instances_policy_of_xml i =
  let r_launch_template = ref None in
  let r_instances_distribution = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchTemplate"; "InstancesDistribution" ]
    (fun tag _ ->
      match tag with
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_of_xml i)
                 ())
      | "InstancesDistribution" ->
          r_instances_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesDistribution"
                 (fun i _ -> instances_distribution_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_template = ( ! ) r_launch_template;
     instances_distribution = ( ! ) r_instances_distribution;
   }
    : mixed_instances_policy)

let auto_scaling_group_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_auto_scaling_group_ar_n = ref None in
  let r_launch_configuration_name = ref None in
  let r_launch_template = ref None in
  let r_mixed_instances_policy = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_predicted_capacity = ref None in
  let r_default_cooldown = ref None in
  let r_availability_zones = ref None in
  let r_availability_zone_ids = ref None in
  let r_load_balancer_names = ref None in
  let r_target_group_ar_ns = ref None in
  let r_health_check_type = ref None in
  let r_health_check_grace_period = ref None in
  let r_instances = ref None in
  let r_created_time = ref None in
  let r_suspended_processes = ref None in
  let r_placement_group = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_enabled_metrics = ref None in
  let r_status = ref None in
  let r_tags = ref None in
  let r_termination_policies = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_max_instance_lifetime = ref None in
  let r_capacity_rebalance = ref None in
  let r_warm_pool_configuration = ref None in
  let r_warm_pool_size = ref None in
  let r_context = ref None in
  let r_desired_capacity_type = ref None in
  let r_default_instance_warmup = ref None in
  let r_traffic_sources = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_deletion_protection = ref None in
  let r_availability_zone_distribution = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_instance_lifecycle_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "AutoScalingGroupARN";
      "LaunchConfigurationName";
      "LaunchTemplate";
      "MixedInstancesPolicy";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "PredictedCapacity";
      "DefaultCooldown";
      "AvailabilityZones";
      "AvailabilityZoneIds";
      "LoadBalancerNames";
      "TargetGroupARNs";
      "HealthCheckType";
      "HealthCheckGracePeriod";
      "Instances";
      "CreatedTime";
      "SuspendedProcesses";
      "PlacementGroup";
      "VPCZoneIdentifier";
      "EnabledMetrics";
      "Status";
      "Tags";
      "TerminationPolicies";
      "NewInstancesProtectedFromScaleIn";
      "ServiceLinkedRoleARN";
      "MaxInstanceLifetime";
      "CapacityRebalance";
      "WarmPoolConfiguration";
      "WarmPoolSize";
      "Context";
      "DesiredCapacityType";
      "DefaultInstanceWarmup";
      "TrafficSources";
      "InstanceMaintenancePolicy";
      "DeletionProtection";
      "AvailabilityZoneDistribution";
      "AvailabilityZoneImpairmentPolicy";
      "CapacityReservationSpecification";
      "InstanceLifecyclePolicy";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupARN" ->
          r_auto_scaling_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "PredictedCapacity" ->
          r_predicted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictedCapacity"
                 (fun i _ -> auto_scaling_group_predicted_capacity_of_xml i)
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "SuspendedProcesses" ->
          r_suspended_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuspendedProcesses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> suspended_process_of_xml i)
                     ())
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "EnabledMetrics" ->
          r_enabled_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledMetrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> enabled_metric_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "WarmPoolConfiguration" ->
          r_warm_pool_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolConfiguration"
                 (fun i _ -> warm_pool_configuration_of_xml i)
                 ())
      | "WarmPoolSize" ->
          r_warm_pool_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolSize"
                 (fun i _ -> warm_pool_size_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     auto_scaling_group_ar_n = ( ! ) r_auto_scaling_group_ar_n;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     launch_template = ( ! ) r_launch_template;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     min_size = Smaws_Lib.Xml.Parse.required "MinSize" (( ! ) r_min_size) i;
     max_size = Smaws_Lib.Xml.Parse.required "MaxSize" (( ! ) r_max_size) i;
     desired_capacity = Smaws_Lib.Xml.Parse.required "DesiredCapacity" (( ! ) r_desired_capacity) i;
     predicted_capacity = ( ! ) r_predicted_capacity;
     default_cooldown = Smaws_Lib.Xml.Parse.required "DefaultCooldown" (( ! ) r_default_cooldown) i;
     availability_zones =
       Smaws_Lib.Xml.Parse.required "AvailabilityZones" (( ! ) r_availability_zones) i;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     load_balancer_names = ( ! ) r_load_balancer_names;
     target_group_ar_ns = ( ! ) r_target_group_ar_ns;
     health_check_type =
       Smaws_Lib.Xml.Parse.required "HealthCheckType" (( ! ) r_health_check_type) i;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     instances = ( ! ) r_instances;
     created_time = Smaws_Lib.Xml.Parse.required "CreatedTime" (( ! ) r_created_time) i;
     suspended_processes = ( ! ) r_suspended_processes;
     placement_group = ( ! ) r_placement_group;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     enabled_metrics = ( ! ) r_enabled_metrics;
     status = ( ! ) r_status;
     tags = ( ! ) r_tags;
     termination_policies = ( ! ) r_termination_policies;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     warm_pool_configuration = ( ! ) r_warm_pool_configuration;
     warm_pool_size = ( ! ) r_warm_pool_size;
     context = ( ! ) r_context;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     traffic_sources = ( ! ) r_traffic_sources;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     deletion_protection = ( ! ) r_deletion_protection;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
   }
    : auto_scaling_group)

let auto_scaling_group_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> xml_string_of_xml i) ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; values = ( ! ) r_values } : filter)

let filters_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ()

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let include_instances_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_names_type_of_xml i =
  let r_auto_scaling_group_names = ref None in
  let r_include_instances = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupNames"; "IncludeInstances"; "NextToken"; "MaxRecords"; "Filters" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupNames" ->
          r_auto_scaling_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "IncludeInstances" ->
          r_include_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeInstances"
                 (fun i _ -> include_instances_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_names = ( ! ) r_auto_scaling_group_names;
     include_instances = ( ! ) r_include_instances;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
   }
    : auto_scaling_group_names_type)

let auto_scaling_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> auto_scaling_group_of_xml i) ()

let auto_scaling_groups_type_of_xml i =
  let r_auto_scaling_groups = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroups"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroups" ->
          r_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> auto_scaling_group_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_groups =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroups" (( ! ) r_auto_scaling_groups) i;
     next_token = ( ! ) r_next_token;
   }
    : auto_scaling_groups_type)

let auto_scaling_instance_details_of_xml i =
  let r_instance_id = ref None in
  let r_instance_type = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_availability_zone = ref None in
  let r_availability_zone_id = ref None in
  let r_lifecycle_state = ref None in
  let r_health_status = ref None in
  let r_launch_configuration_name = ref None in
  let r_launch_template = ref None in
  let r_image_id = ref None in
  let r_protected_from_scale_in = ref None in
  let r_weighted_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceId";
      "InstanceType";
      "AutoScalingGroupName";
      "AvailabilityZone";
      "AvailabilityZoneId";
      "LifecycleState";
      "HealthStatus";
      "LaunchConfigurationName";
      "LaunchTemplate";
      "ImageId";
      "ProtectedFromScaleIn";
      "WeightedCapacity";
    ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
     instance_type = ( ! ) r_instance_type;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     availability_zone =
       Smaws_Lib.Xml.Parse.required "AvailabilityZone" (( ! ) r_availability_zone) i;
     availability_zone_id = ( ! ) r_availability_zone_id;
     lifecycle_state = Smaws_Lib.Xml.Parse.required "LifecycleState" (( ! ) r_lifecycle_state) i;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     launch_template = ( ! ) r_launch_template;
     image_id = ( ! ) r_image_id;
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
     weighted_capacity = ( ! ) r_weighted_capacity;
   }
    : auto_scaling_instance_details)

let auto_scaling_instances_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> auto_scaling_instance_details_of_xml i)
    ()

let auto_scaling_instances_type_of_xml i =
  let r_auto_scaling_instances = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingInstances"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AutoScalingInstances" ->
          r_auto_scaling_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingInstances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> auto_scaling_instance_details_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ auto_scaling_instances = ( ! ) r_auto_scaling_instances; next_token = ( ! ) r_next_token }
    : auto_scaling_instances_type)

let auto_scaling_notification_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let scaling_activity_in_progress_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scaling_activity_in_progress_fault)

let update_placement_group_param_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_auto_scaling_group_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_launch_configuration_name = ref None in
  let r_launch_template = ref None in
  let r_mixed_instances_policy = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_default_cooldown = ref None in
  let r_availability_zones = ref None in
  let r_availability_zone_ids = ref None in
  let r_health_check_type = ref None in
  let r_health_check_grace_period = ref None in
  let r_placement_group = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_termination_policies = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_max_instance_lifetime = ref None in
  let r_capacity_rebalance = ref None in
  let r_context = ref None in
  let r_desired_capacity_type = ref None in
  let r_default_instance_warmup = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_availability_zone_distribution = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_skip_zonal_shift_validation = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_instance_lifecycle_policy = ref None in
  let r_deletion_protection = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "LaunchConfigurationName";
      "LaunchTemplate";
      "MixedInstancesPolicy";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "DefaultCooldown";
      "AvailabilityZones";
      "AvailabilityZoneIds";
      "HealthCheckType";
      "HealthCheckGracePeriod";
      "PlacementGroup";
      "VPCZoneIdentifier";
      "TerminationPolicies";
      "NewInstancesProtectedFromScaleIn";
      "ServiceLinkedRoleARN";
      "MaxInstanceLifetime";
      "CapacityRebalance";
      "Context";
      "DesiredCapacityType";
      "DefaultInstanceWarmup";
      "InstanceMaintenancePolicy";
      "AvailabilityZoneDistribution";
      "AvailabilityZoneImpairmentPolicy";
      "SkipZonalShiftValidation";
      "CapacityReservationSpecification";
      "InstanceLifecyclePolicy";
      "DeletionProtection";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> update_placement_group_param_of_xml i)
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     launch_template = ( ! ) r_launch_template;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     min_size = ( ! ) r_min_size;
     max_size = ( ! ) r_max_size;
     desired_capacity = ( ! ) r_desired_capacity;
     default_cooldown = ( ! ) r_default_cooldown;
     availability_zones = ( ! ) r_availability_zones;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     health_check_type = ( ! ) r_health_check_type;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     placement_group = ( ! ) r_placement_group;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     termination_policies = ( ! ) r_termination_policies;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     context = ( ! ) r_context;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
     deletion_protection = ( ! ) r_deletion_protection;
   }
    : update_auto_scaling_group_type)

let should_decrement_desired_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_instance_in_auto_scaling_group_type_of_xml i =
  let r_instance_id = ref None in
  let r_should_decrement_desired_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceId"; "ShouldDecrementDesiredCapacity" ]
    (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
   }
    : terminate_instance_in_auto_scaling_group_type)

let resource_in_use_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_in_use_fault)

let process_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let scaling_process_query_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scaling_processes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "ScalingProcesses" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScalingProcesses" ->
          r_scaling_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingProcesses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     scaling_processes = ( ! ) r_scaling_processes;
   }
    : scaling_process_query)

let limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_fault)

let start_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : start_instance_refresh_answer)

let bake_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_percent100_to200_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let standby_instances_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Terminate" -> Terminate
   | "Ignore" -> Ignore
   | "Wait" -> Wait
   | _ -> failwith "unknown enum value"
    : standby_instances)

let scale_in_protected_instances_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Refresh" -> Refresh
   | "Ignore" -> Ignore
   | "Wait" -> Wait
   | _ -> failwith "unknown enum value"
    : scale_in_protected_instances)

let skip_matching_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let checkpoint_delay_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let non_zero_int_percent_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let checkpoint_percentages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> non_zero_int_percent_of_xml i) ()

let refresh_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_percent_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let refresh_preferences_of_xml i =
  let r_min_healthy_percentage = ref None in
  let r_instance_warmup = ref None in
  let r_checkpoint_percentages = ref None in
  let r_checkpoint_delay = ref None in
  let r_skip_matching = ref None in
  let r_auto_rollback = ref None in
  let r_scale_in_protected_instances = ref None in
  let r_standby_instances = ref None in
  let r_alarm_specification = ref None in
  let r_max_healthy_percentage = ref None in
  let r_bake_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MinHealthyPercentage";
      "InstanceWarmup";
      "CheckpointPercentages";
      "CheckpointDelay";
      "SkipMatching";
      "AutoRollback";
      "ScaleInProtectedInstances";
      "StandbyInstances";
      "AlarmSpecification";
      "MaxHealthyPercentage";
      "BakeTime";
    ] (fun tag _ ->
      match tag with
      | "MinHealthyPercentage" ->
          r_min_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinHealthyPercentage"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "InstanceWarmup" ->
          r_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceWarmup"
                 (fun i _ -> refresh_instance_warmup_of_xml i)
                 ())
      | "CheckpointPercentages" ->
          r_checkpoint_percentages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CheckpointPercentages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> non_zero_int_percent_of_xml i)
                     ())
                 ())
      | "CheckpointDelay" ->
          r_checkpoint_delay :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CheckpointDelay"
                 (fun i _ -> checkpoint_delay_of_xml i)
                 ())
      | "SkipMatching" ->
          r_skip_matching :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipMatching"
                 (fun i _ -> skip_matching_of_xml i)
                 ())
      | "AutoRollback" ->
          r_auto_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoRollback"
                 (fun i _ -> auto_rollback_of_xml i)
                 ())
      | "ScaleInProtectedInstances" ->
          r_scale_in_protected_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleInProtectedInstances"
                 (fun i _ -> scale_in_protected_instances_of_xml i)
                 ())
      | "StandbyInstances" ->
          r_standby_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StandbyInstances"
                 (fun i _ -> standby_instances_of_xml i)
                 ())
      | "AlarmSpecification" ->
          r_alarm_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmSpecification"
                 (fun i _ -> alarm_specification_of_xml i)
                 ())
      | "MaxHealthyPercentage" ->
          r_max_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxHealthyPercentage"
                 (fun i _ -> int_percent100_to200_of_xml i)
                 ())
      | "BakeTime" ->
          r_bake_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BakeTime" (fun i _ -> bake_time_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     min_healthy_percentage = ( ! ) r_min_healthy_percentage;
     instance_warmup = ( ! ) r_instance_warmup;
     checkpoint_percentages = ( ! ) r_checkpoint_percentages;
     checkpoint_delay = ( ! ) r_checkpoint_delay;
     skip_matching = ( ! ) r_skip_matching;
     auto_rollback = ( ! ) r_auto_rollback;
     scale_in_protected_instances = ( ! ) r_scale_in_protected_instances;
     standby_instances = ( ! ) r_standby_instances;
     alarm_specification = ( ! ) r_alarm_specification;
     max_healthy_percentage = ( ! ) r_max_healthy_percentage;
     bake_time = ( ! ) r_bake_time;
   }
    : refresh_preferences)

let desired_configuration_of_xml i =
  let r_launch_template = ref None in
  let r_mixed_instances_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchTemplate"; "MixedInstancesPolicy" ]
    (fun tag _ ->
      match tag with
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_template = ( ! ) r_launch_template;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
   }
    : desired_configuration)

let refresh_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Rolling" -> Rolling
   | "ReplaceRootVolume" -> ReplaceRootVolume
   | _ -> failwith "unknown enum value"
    : refresh_strategy)

let start_instance_refresh_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_strategy = ref None in
  let r_desired_configuration = ref None in
  let r_preferences = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "Strategy"; "DesiredConfiguration"; "Preferences" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Strategy" ->
          r_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Strategy"
                 (fun i _ -> refresh_strategy_of_xml i)
                 ())
      | "DesiredConfiguration" ->
          r_desired_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredConfiguration"
                 (fun i _ -> desired_configuration_of_xml i)
                 ())
      | "Preferences" ->
          r_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Preferences"
                 (fun i _ -> refresh_preferences_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     strategy = ( ! ) r_strategy;
     desired_configuration = ( ! ) r_desired_configuration;
     preferences = ( ! ) r_preferences;
   }
    : start_instance_refresh_type)

let set_instance_protection_answer_of_xml i = ()

let protected_from_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_instance_protection_query_of_xml i =
  let r_instance_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_protected_from_scale_in = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceIds"; "AutoScalingGroupName"; "ProtectedFromScaleIn" ] (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> protected_from_scale_in_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = Smaws_Lib.Xml.Parse.required "InstanceIds" (( ! ) r_instance_ids) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
   }
    : set_instance_protection_query)

let should_respect_grace_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_instance_health_query_of_xml i =
  let r_instance_id = ref None in
  let r_health_status = ref None in
  let r_should_respect_grace_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceId"; "HealthStatus"; "ShouldRespectGracePeriod" ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "ShouldRespectGracePeriod" ->
          r_should_respect_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldRespectGracePeriod"
                 (fun i _ -> should_respect_grace_period_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     should_respect_grace_period = ( ! ) r_should_respect_grace_period;
   }
    : set_instance_health_query)

let honor_cooldown_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_desired_capacity_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_desired_capacity = ref None in
  let r_honor_cooldown = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "DesiredCapacity"; "HonorCooldown" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "HonorCooldown" ->
          r_honor_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HonorCooldown"
                 (fun i _ -> honor_cooldown_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     desired_capacity = Smaws_Lib.Xml.Parse.required "DesiredCapacity" (( ! ) r_desired_capacity) i;
     honor_cooldown = ( ! ) r_honor_cooldown;
   }
    : set_desired_capacity_type)

let irreversible_instance_refresh_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : irreversible_instance_refresh_fault)

let rollback_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : rollback_instance_refresh_answer)

let rollback_instance_refresh_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : rollback_instance_refresh_type)

let record_lifecycle_action_heartbeat_answer_of_xml i = ()
let lifecycle_action_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let record_lifecycle_action_heartbeat_type_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_action_token = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LifecycleHookName"; "AutoScalingGroupName"; "LifecycleActionToken"; "InstanceId" ]
    (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LifecycleActionToken" ->
          r_lifecycle_action_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionToken"
                 (fun i _ -> lifecycle_action_token_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_action_token = ( ! ) r_lifecycle_action_token;
     instance_id = ( ! ) r_instance_id;
   }
    : record_lifecycle_action_heartbeat_type)

let put_warm_pool_answer_of_xml i = ()

let put_warm_pool_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_max_group_prepared_capacity = ref None in
  let r_min_size = ref None in
  let r_pool_state = ref None in
  let r_instance_reuse_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "MaxGroupPreparedCapacity";
      "MinSize";
      "PoolState";
      "InstanceReusePolicy";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MaxGroupPreparedCapacity" ->
          r_max_group_prepared_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxGroupPreparedCapacity"
                 (fun i _ -> max_group_prepared_capacity_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> warm_pool_min_size_of_xml i)
                 ())
      | "PoolState" ->
          r_pool_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PoolState"
                 (fun i _ -> warm_pool_state_of_xml i)
                 ())
      | "InstanceReusePolicy" ->
          r_instance_reuse_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceReusePolicy"
                 (fun i _ -> instance_reuse_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     max_group_prepared_capacity = ( ! ) r_max_group_prepared_capacity;
     min_size = ( ! ) r_min_size;
     pool_state = ( ! ) r_pool_state;
     instance_reuse_policy = ( ! ) r_instance_reuse_policy;
   }
    : put_warm_pool_type)

let put_scheduled_update_group_action_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_action_name = ref None in
  let r_time = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_recurrence = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_time_zone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "ScheduledActionName";
      "Time";
      "StartTime";
      "EndTime";
      "Recurrence";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "TimeZone";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Time" ->
          r_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Time" (fun i _ -> timestamp_type_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     time = ( ! ) r_time;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     recurrence = ( ! ) r_recurrence;
     min_size = ( ! ) r_min_size;
     max_size = ( ! ) r_max_size;
     desired_capacity = ( ! ) r_desired_capacity;
     time_zone = ( ! ) r_time_zone;
   }
    : put_scheduled_update_group_action_type)

let policy_arn_type_of_xml i =
  let r_policy_ar_n = ref None in
  let r_alarms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyARN"; "Alarms" ] (fun tag _ ->
      match tag with
      | "PolicyARN" ->
          r_policy_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_ar_n = ( ! ) r_policy_ar_n; alarms = ( ! ) r_alarms } : policy_arn_type)

let predictive_scaling_max_capacity_buffer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let predictive_scaling_max_capacity_breach_behavior_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HonorMaxCapacity" -> HonorMaxCapacity
   | "IncreaseMaxCapacity" -> IncreaseMaxCapacity
   | _ -> failwith "unknown enum value"
    : predictive_scaling_max_capacity_breach_behavior)

let predictive_scaling_scheduling_buffer_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let predictive_scaling_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ForecastAndScale" -> ForecastAndScale
   | "ForecastOnly" -> ForecastOnly
   | _ -> failwith "unknown enum value"
    : predictive_scaling_mode)

let return_data_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let xml_string_metric_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_unit_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_metric_stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_dimension_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_dimension_name_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> metric_dimension_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : metric_dimension)

let metric_dimensions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_dimension_of_xml i) ()

let metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> metric_namespace_of_xml i)
                 ())
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
                     (fun i _ -> metric_dimension_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     dimensions = ( ! ) r_dimensions;
   }
    : metric)

let metric_stat_of_xml i =
  let r_metric = ref None in
  let r_stat = ref None in
  let r_unit_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric"; "Stat"; "Unit" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> xml_string_metric_stat_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     unit_ = ( ! ) r_unit_;
   }
    : metric_stat)

let metric_data_query_of_xml i =
  let r_id = ref None in
  let r_expression = ref None in
  let r_metric_stat = ref None in
  let r_label = ref None in
  let r_return_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Id"; "Expression"; "MetricStat"; "Label"; "ReturnData" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Id"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> metric_stat_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Label"
                 (fun i _ -> xml_string_metric_label_of_xml i)
                 ())
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
     expression = ( ! ) r_expression;
     metric_stat = ( ! ) r_metric_stat;
     label = ( ! ) r_label;
     return_data = ( ! ) r_return_data;
   }
    : metric_data_query)

let metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_query_of_xml i) ()

let predictive_scaling_customized_capacity_metric_of_xml i =
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
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_capacity_metric)

let predictive_scaling_customized_load_metric_of_xml i =
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
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_load_metric)

let predictive_scaling_customized_scaling_metric_of_xml i =
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
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_scaling_metric)

let predefined_load_metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ASGTotalCPUUtilization" -> ASGTotalCPUUtilization
   | "ASGTotalNetworkIn" -> ASGTotalNetworkIn
   | "ASGTotalNetworkOut" -> ASGTotalNetworkOut
   | "ALBTargetGroupRequestCount" -> ALBTargetGroupRequestCount
   | _ -> failwith "unknown enum value"
    : predefined_load_metric_type)

let predictive_scaling_predefined_load_metric_of_xml i =
  let r_predefined_metric_type = ref None in
  let r_resource_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PredefinedMetricType"; "ResourceLabel" ]
    (fun tag _ ->
      match tag with
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_load_metric_type_of_xml i)
                 ())
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
     resource_label = ( ! ) r_resource_label;
   }
    : predictive_scaling_predefined_load_metric)

let predefined_scaling_metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ASGAverageCPUUtilization" -> ASGAverageCPUUtilization
   | "ASGAverageNetworkIn" -> ASGAverageNetworkIn
   | "ASGAverageNetworkOut" -> ASGAverageNetworkOut
   | "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
   | _ -> failwith "unknown enum value"
    : predefined_scaling_metric_type)

let predictive_scaling_predefined_scaling_metric_of_xml i =
  let r_predefined_metric_type = ref None in
  let r_resource_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PredefinedMetricType"; "ResourceLabel" ]
    (fun tag _ ->
      match tag with
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_scaling_metric_type_of_xml i)
                 ())
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
     resource_label = ( ! ) r_resource_label;
   }
    : predictive_scaling_predefined_scaling_metric)

let predefined_metric_pair_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ASGCPUUtilization" -> ASGCPUUtilization
   | "ASGNetworkIn" -> ASGNetworkIn
   | "ASGNetworkOut" -> ASGNetworkOut
   | "ALBRequestCount" -> ALBRequestCount
   | _ -> failwith "unknown enum value"
    : predefined_metric_pair_type)

let predictive_scaling_predefined_metric_pair_of_xml i =
  let r_predefined_metric_type = ref None in
  let r_resource_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PredefinedMetricType"; "ResourceLabel" ]
    (fun tag _ ->
      match tag with
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_metric_pair_type_of_xml i)
                 ())
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
     resource_label = ( ! ) r_resource_label;
   }
    : predictive_scaling_predefined_metric_pair)

let metric_scale_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let predictive_scaling_metric_specification_of_xml i =
  let r_target_value = ref None in
  let r_predefined_metric_pair_specification = ref None in
  let r_predefined_scaling_metric_specification = ref None in
  let r_predefined_load_metric_specification = ref None in
  let r_customized_scaling_metric_specification = ref None in
  let r_customized_load_metric_specification = ref None in
  let r_customized_capacity_metric_specification = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetValue";
      "PredefinedMetricPairSpecification";
      "PredefinedScalingMetricSpecification";
      "PredefinedLoadMetricSpecification";
      "CustomizedScalingMetricSpecification";
      "CustomizedLoadMetricSpecification";
      "CustomizedCapacityMetricSpecification";
    ] (fun tag _ ->
      match tag with
      | "TargetValue" ->
          r_target_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "PredefinedMetricPairSpecification" ->
          r_predefined_metric_pair_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricPairSpecification"
                 (fun i _ -> predictive_scaling_predefined_metric_pair_of_xml i)
                 ())
      | "PredefinedScalingMetricSpecification" ->
          r_predefined_scaling_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedScalingMetricSpecification"
                 (fun i _ -> predictive_scaling_predefined_scaling_metric_of_xml i)
                 ())
      | "PredefinedLoadMetricSpecification" ->
          r_predefined_load_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedLoadMetricSpecification"
                 (fun i _ -> predictive_scaling_predefined_load_metric_of_xml i)
                 ())
      | "CustomizedScalingMetricSpecification" ->
          r_customized_scaling_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedScalingMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_scaling_metric_of_xml i)
                 ())
      | "CustomizedLoadMetricSpecification" ->
          r_customized_load_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedLoadMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_load_metric_of_xml i)
                 ())
      | "CustomizedCapacityMetricSpecification" ->
          r_customized_capacity_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedCapacityMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_capacity_metric_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_value = Smaws_Lib.Xml.Parse.required "TargetValue" (( ! ) r_target_value) i;
     predefined_metric_pair_specification = ( ! ) r_predefined_metric_pair_specification;
     predefined_scaling_metric_specification = ( ! ) r_predefined_scaling_metric_specification;
     predefined_load_metric_specification = ( ! ) r_predefined_load_metric_specification;
     customized_scaling_metric_specification = ( ! ) r_customized_scaling_metric_specification;
     customized_load_metric_specification = ( ! ) r_customized_load_metric_specification;
     customized_capacity_metric_specification = ( ! ) r_customized_capacity_metric_specification;
   }
    : predictive_scaling_metric_specification)

let predictive_scaling_metric_specifications_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> predictive_scaling_metric_specification_of_xml i)
    ()

let predictive_scaling_configuration_of_xml i =
  let r_metric_specifications = ref None in
  let r_mode = ref None in
  let r_scheduling_buffer_time = ref None in
  let r_max_capacity_breach_behavior = ref None in
  let r_max_capacity_buffer = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetricSpecifications";
      "Mode";
      "SchedulingBufferTime";
      "MaxCapacityBreachBehavior";
      "MaxCapacityBuffer";
    ] (fun tag _ ->
      match tag with
      | "MetricSpecifications" ->
          r_metric_specifications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricSpecifications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> predictive_scaling_metric_specification_of_xml i)
                     ())
                 ())
      | "Mode" ->
          r_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Mode"
                 (fun i _ -> predictive_scaling_mode_of_xml i)
                 ())
      | "SchedulingBufferTime" ->
          r_scheduling_buffer_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SchedulingBufferTime"
                 (fun i _ -> predictive_scaling_scheduling_buffer_time_of_xml i)
                 ())
      | "MaxCapacityBreachBehavior" ->
          r_max_capacity_breach_behavior :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacityBreachBehavior"
                 (fun i _ -> predictive_scaling_max_capacity_breach_behavior_of_xml i)
                 ())
      | "MaxCapacityBuffer" ->
          r_max_capacity_buffer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacityBuffer"
                 (fun i _ -> predictive_scaling_max_capacity_buffer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_specifications =
       Smaws_Lib.Xml.Parse.required "MetricSpecifications" (( ! ) r_metric_specifications) i;
     mode = ( ! ) r_mode;
     scheduling_buffer_time = ( ! ) r_scheduling_buffer_time;
     max_capacity_breach_behavior = ( ! ) r_max_capacity_breach_behavior;
     max_capacity_buffer = ( ! ) r_max_capacity_buffer;
   }
    : predictive_scaling_configuration)

let scaling_policy_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let disable_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metric_granularity_in_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_tracking_metric_stat_of_xml i =
  let r_metric = ref None in
  let r_stat = ref None in
  let r_unit_ = ref None in
  let r_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric"; "Stat"; "Unit"; "Period" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> xml_string_metric_stat_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     unit_ = ( ! ) r_unit_;
     period = ( ! ) r_period;
   }
    : target_tracking_metric_stat)

let xml_string_max_len2047_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len64_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_tracking_metric_data_query_of_xml i =
  let r_id = ref None in
  let r_expression = ref None in
  let r_metric_stat = ref None in
  let r_label = ref None in
  let r_period = ref None in
  let r_return_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Id"; "Expression"; "MetricStat"; "Label"; "Period"; "ReturnData" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Id"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> xml_string_max_len2047_of_xml i)
                 ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> target_tracking_metric_stat_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Label"
                 (fun i _ -> xml_string_metric_label_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
     expression = ( ! ) r_expression;
     metric_stat = ( ! ) r_metric_stat;
     label = ( ! ) r_label;
     period = ( ! ) r_period;
     return_data = ( ! ) r_return_data;
   }
    : target_tracking_metric_data_query)

let target_tracking_metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> target_tracking_metric_data_query_of_xml i)
    ()

let metric_statistic_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Average" -> Average
   | "Minimum" -> Minimum
   | "Maximum" -> Maximum
   | "SampleCount" -> SampleCount
   | "Sum" -> Sum
   | _ -> failwith "unknown enum value"
    : metric_statistic)

let customized_metric_specification_of_xml i =
  let r_metric_name = ref None in
  let r_namespace = ref None in
  let r_dimensions = ref None in
  let r_statistic = ref None in
  let r_unit_ = ref None in
  let r_period = ref None in
  let r_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MetricName"; "Namespace"; "Dimensions"; "Statistic"; "Unit"; "Period"; "Metrics" ]
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
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> metric_namespace_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_dimension_of_xml i)
                     ())
                 ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic"
                 (fun i _ -> metric_statistic_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_tracking_metric_data_query_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_name = ( ! ) r_metric_name;
     namespace = ( ! ) r_namespace;
     dimensions = ( ! ) r_dimensions;
     statistic = ( ! ) r_statistic;
     unit_ = ( ! ) r_unit_;
     period = ( ! ) r_period;
     metrics = ( ! ) r_metrics;
   }
    : customized_metric_specification)

let metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ASGAverageCPUUtilization" -> ASGAverageCPUUtilization
   | "ASGAverageNetworkIn" -> ASGAverageNetworkIn
   | "ASGAverageNetworkOut" -> ASGAverageNetworkOut
   | "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
   | _ -> failwith "unknown enum value"
    : metric_type)

let predefined_metric_specification_of_xml i =
  let r_predefined_metric_type = ref None in
  let r_resource_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PredefinedMetricType"; "ResourceLabel" ]
    (fun tag _ ->
      match tag with
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> metric_type_of_xml i)
                 ())
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
     resource_label = ( ! ) r_resource_label;
   }
    : predefined_metric_specification)

let target_tracking_configuration_of_xml i =
  let r_predefined_metric_specification = ref None in
  let r_customized_metric_specification = ref None in
  let r_target_value = ref None in
  let r_disable_scale_in = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PredefinedMetricSpecification";
      "CustomizedMetricSpecification";
      "TargetValue";
      "DisableScaleIn";
    ] (fun tag _ ->
      match tag with
      | "PredefinedMetricSpecification" ->
          r_predefined_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricSpecification"
                 (fun i _ -> predefined_metric_specification_of_xml i)
                 ())
      | "CustomizedMetricSpecification" ->
          r_customized_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedMetricSpecification"
                 (fun i _ -> customized_metric_specification_of_xml i)
                 ())
      | "TargetValue" ->
          r_target_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "DisableScaleIn" ->
          r_disable_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableScaleIn"
                 (fun i _ -> disable_scale_in_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predefined_metric_specification = ( ! ) r_predefined_metric_specification;
     customized_metric_specification = ( ! ) r_customized_metric_specification;
     target_value = Smaws_Lib.Xml.Parse.required "TargetValue" (( ! ) r_target_value) i;
     disable_scale_in = ( ! ) r_disable_scale_in;
   }
    : target_tracking_configuration)

let estimated_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let policy_increment_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let step_adjustment_of_xml i =
  let r_metric_interval_lower_bound = ref None in
  let r_metric_interval_upper_bound = ref None in
  let r_scaling_adjustment = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MetricIntervalLowerBound"; "MetricIntervalUpperBound"; "ScalingAdjustment" ] (fun tag _ ->
      match tag with
      | "MetricIntervalLowerBound" ->
          r_metric_interval_lower_bound :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricIntervalLowerBound"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "MetricIntervalUpperBound" ->
          r_metric_interval_upper_bound :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricIntervalUpperBound"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_interval_lower_bound = ( ! ) r_metric_interval_lower_bound;
     metric_interval_upper_bound = ( ! ) r_metric_interval_upper_bound;
     scaling_adjustment =
       Smaws_Lib.Xml.Parse.required "ScalingAdjustment" (( ! ) r_scaling_adjustment) i;
   }
    : step_adjustment)

let step_adjustments_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> step_adjustment_of_xml i) ()

let min_adjustment_magnitude_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let min_adjustment_step_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let put_scaling_policy_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_name = ref None in
  let r_policy_type = ref None in
  let r_adjustment_type = ref None in
  let r_min_adjustment_step = ref None in
  let r_min_adjustment_magnitude = ref None in
  let r_scaling_adjustment = ref None in
  let r_cooldown = ref None in
  let r_metric_aggregation_type = ref None in
  let r_step_adjustments = ref None in
  let r_estimated_instance_warmup = ref None in
  let r_target_tracking_configuration = ref None in
  let r_enabled = ref None in
  let r_predictive_scaling_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "PolicyName";
      "PolicyType";
      "AdjustmentType";
      "MinAdjustmentStep";
      "MinAdjustmentMagnitude";
      "ScalingAdjustment";
      "Cooldown";
      "MetricAggregationType";
      "StepAdjustments";
      "EstimatedInstanceWarmup";
      "TargetTrackingConfiguration";
      "Enabled";
      "PredictiveScalingConfiguration";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyType" ->
          r_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MinAdjustmentStep" ->
          r_min_adjustment_step :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentStep"
                 (fun i _ -> min_adjustment_step_of_xml i)
                 ())
      | "MinAdjustmentMagnitude" ->
          r_min_adjustment_magnitude :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentMagnitude"
                 (fun i _ -> min_adjustment_magnitude_of_xml i)
                 ())
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | "Cooldown" ->
          r_cooldown :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cooldown" (fun i _ -> cooldown_of_xml i) ())
      | "MetricAggregationType" ->
          r_metric_aggregation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAggregationType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "StepAdjustments" ->
          r_step_adjustments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StepAdjustments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> step_adjustment_of_xml i)
                     ())
                 ())
      | "EstimatedInstanceWarmup" ->
          r_estimated_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedInstanceWarmup"
                 (fun i _ -> estimated_instance_warmup_of_xml i)
                 ())
      | "TargetTrackingConfiguration" ->
          r_target_tracking_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTrackingConfiguration"
                 (fun i _ -> target_tracking_configuration_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> scaling_policy_enabled_of_xml i)
                 ())
      | "PredictiveScalingConfiguration" ->
          r_predictive_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictiveScalingConfiguration"
                 (fun i _ -> predictive_scaling_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_type = ( ! ) r_policy_type;
     adjustment_type = ( ! ) r_adjustment_type;
     min_adjustment_step = ( ! ) r_min_adjustment_step;
     min_adjustment_magnitude = ( ! ) r_min_adjustment_magnitude;
     scaling_adjustment = ( ! ) r_scaling_adjustment;
     cooldown = ( ! ) r_cooldown;
     metric_aggregation_type = ( ! ) r_metric_aggregation_type;
     step_adjustments = ( ! ) r_step_adjustments;
     estimated_instance_warmup = ( ! ) r_estimated_instance_warmup;
     target_tracking_configuration = ( ! ) r_target_tracking_configuration;
     enabled = ( ! ) r_enabled;
     predictive_scaling_configuration = ( ! ) r_predictive_scaling_configuration;
   }
    : put_scaling_policy_type)

let put_notification_configuration_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_topic_ar_n = ref None in
  let r_notification_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "TopicARN"; "NotificationTypes" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationTypes" ->
          r_notification_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     topic_ar_n = Smaws_Lib.Xml.Parse.required "TopicARN" (( ! ) r_topic_ar_n) i;
     notification_types =
       Smaws_Lib.Xml.Parse.required "NotificationTypes" (( ! ) r_notification_types) i;
   }
    : put_notification_configuration_type)

let put_lifecycle_hook_answer_of_xml i = ()
let lifecycle_action_result_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let heartbeat_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let notification_target_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let lifecycle_transition_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_lifecycle_hook_type_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_transition = ref None in
  let r_role_ar_n = ref None in
  let r_notification_target_ar_n = ref None in
  let r_notification_metadata = ref None in
  let r_heartbeat_timeout = ref None in
  let r_default_result = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LifecycleHookName";
      "AutoScalingGroupName";
      "LifecycleTransition";
      "RoleARN";
      "NotificationTargetARN";
      "NotificationMetadata";
      "HeartbeatTimeout";
      "DefaultResult";
    ] (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_transition = ( ! ) r_lifecycle_transition;
     role_ar_n = ( ! ) r_role_ar_n;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     notification_metadata = ( ! ) r_notification_metadata;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     default_result = ( ! ) r_default_result;
   }
    : put_lifecycle_hook_type)

let idempotent_parameter_mismatch_error_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : idempotent_parameter_mismatch_error)

let launch_instances_error_of_xml i =
  let r_instance_type = ref None in
  let r_market_type = ref None in
  let r_subnet_id = ref None in
  let r_availability_zone = ref None in
  let r_availability_zone_id = ref None in
  let r_error_code = ref None in
  let r_error_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceType";
      "MarketType";
      "SubnetId";
      "AvailabilityZone";
      "AvailabilityZoneId";
      "ErrorCode";
      "ErrorMessage";
    ] (fun tag _ ->
      match tag with
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MarketType" ->
          r_market_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MarketType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_type = ( ! ) r_instance_type;
     market_type = ( ! ) r_market_type;
     subnet_id = ( ! ) r_subnet_id;
     availability_zone = ( ! ) r_availability_zone;
     availability_zone_id = ( ! ) r_availability_zone_id;
     error_code = ( ! ) r_error_code;
     error_message = ( ! ) r_error_message;
   }
    : launch_instances_error)

let launch_instances_errors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_instances_error_of_xml i) ()

let instance_collection_of_xml i =
  let r_instance_type = ref None in
  let r_market_type = ref None in
  let r_subnet_id = ref None in
  let r_availability_zone = ref None in
  let r_availability_zone_id = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceType";
      "MarketType";
      "SubnetId";
      "AvailabilityZone";
      "AvailabilityZoneId";
      "InstanceIds";
    ] (fun tag _ ->
      match tag with
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MarketType" ->
          r_market_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MarketType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_type = ( ! ) r_instance_type;
     market_type = ( ! ) r_market_type;
     subnet_id = ( ! ) r_subnet_id;
     availability_zone = ( ! ) r_availability_zone;
     availability_zone_id = ( ! ) r_availability_zone_id;
     instance_ids = ( ! ) r_instance_ids;
   }
    : instance_collection)

let instance_collections_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_collection_of_xml i) ()

let client_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let launch_instances_result_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_client_token = ref None in
  let r_instances = ref None in
  let r_errors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "ClientToken"; "Instances"; "Errors" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_collection_of_xml i)
                     ())
                 ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_instances_error_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     client_token = ( ! ) r_client_token;
     instances = ( ! ) r_instances;
     errors = ( ! ) r_errors;
   }
    : launch_instances_result)

let retry_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "retry-with-group-configuration" -> RETRY_WITH_GROUP_CONFIGURATION
   | "none" -> NONE
   | _ -> failwith "unknown enum value"
    : retry_strategy)

let subnet_ids_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let availability_zone_ids_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let availability_zones_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let requested_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let launch_instances_request_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_requested_capacity = ref None in
  let r_client_token = ref None in
  let r_availability_zones = ref None in
  let r_availability_zone_ids = ref None in
  let r_subnet_ids = ref None in
  let r_retry_strategy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "RequestedCapacity";
      "ClientToken";
      "AvailabilityZones";
      "AvailabilityZoneIds";
      "SubnetIds";
      "RetryStrategy";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "RequestedCapacity" ->
          r_requested_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestedCapacity"
                 (fun i _ -> requested_capacity_of_xml i)
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "RetryStrategy" ->
          r_retry_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetryStrategy"
                 (fun i _ -> retry_strategy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     requested_capacity =
       Smaws_Lib.Xml.Parse.required "RequestedCapacity" (( ! ) r_requested_capacity) i;
     client_token = Smaws_Lib.Xml.Parse.required "ClientToken" (( ! ) r_client_token) i;
     availability_zones = ( ! ) r_availability_zones;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     subnet_ids = ( ! ) r_subnet_ids;
     retry_strategy = ( ! ) r_retry_strategy;
   }
    : launch_instances_request)

let predictive_scaling_forecast_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_scale_of_xml i) ()

let predictive_scaling_forecast_timestamps_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_type_of_xml i) ()

let capacity_forecast_of_xml i =
  let r_timestamps = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timestamps"; "Values" ] (fun tag _ ->
      match tag with
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> timestamp_type_of_xml i)
                     ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_scale_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamps = Smaws_Lib.Xml.Parse.required "Timestamps" (( ! ) r_timestamps) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
   }
    : capacity_forecast)

let load_forecast_of_xml i =
  let r_timestamps = ref None in
  let r_values = ref None in
  let r_metric_specification = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timestamps"; "Values"; "MetricSpecification" ]
    (fun tag _ ->
      match tag with
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> timestamp_type_of_xml i)
                     ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_scale_of_xml i)
                     ())
                 ())
      | "MetricSpecification" ->
          r_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricSpecification"
                 (fun i _ -> predictive_scaling_metric_specification_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamps = Smaws_Lib.Xml.Parse.required "Timestamps" (( ! ) r_timestamps) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     metric_specification =
       Smaws_Lib.Xml.Parse.required "MetricSpecification" (( ! ) r_metric_specification) i;
   }
    : load_forecast)

let load_forecasts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_forecast_of_xml i) ()

let get_predictive_scaling_forecast_answer_of_xml i =
  let r_load_forecast = ref None in
  let r_capacity_forecast = ref None in
  let r_update_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadForecast"; "CapacityForecast"; "UpdateTime" ]
    (fun tag _ ->
      match tag with
      | "LoadForecast" ->
          r_load_forecast :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadForecast"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_forecast_of_xml i)
                     ())
                 ())
      | "CapacityForecast" ->
          r_capacity_forecast :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityForecast"
                 (fun i _ -> capacity_forecast_of_xml i)
                 ())
      | "UpdateTime" ->
          r_update_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_forecast = Smaws_Lib.Xml.Parse.required "LoadForecast" (( ! ) r_load_forecast) i;
     capacity_forecast =
       Smaws_Lib.Xml.Parse.required "CapacityForecast" (( ! ) r_capacity_forecast) i;
     update_time = Smaws_Lib.Xml.Parse.required "UpdateTime" (( ! ) r_update_time) i;
   }
    : get_predictive_scaling_forecast_answer)

let get_predictive_scaling_forecast_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_name = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "PolicyName"; "StartTime"; "EndTime" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
   }
    : get_predictive_scaling_forecast_type)

let exit_standby_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : exit_standby_answer)

let exit_standby_query_of_xml i =
  let r_instance_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceIds"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : exit_standby_query)

let execute_policy_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_name = ref None in
  let r_honor_cooldown = ref None in
  let r_metric_value = ref None in
  let r_breach_threshold = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "PolicyName"; "HonorCooldown"; "MetricValue"; "BreachThreshold" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "HonorCooldown" ->
          r_honor_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HonorCooldown"
                 (fun i _ -> honor_cooldown_of_xml i)
                 ())
      | "MetricValue" ->
          r_metric_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "BreachThreshold" ->
          r_breach_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachThreshold"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     honor_cooldown = ( ! ) r_honor_cooldown;
     metric_value = ( ! ) r_metric_value;
     breach_threshold = ( ! ) r_breach_threshold;
   }
    : execute_policy_type)

let enter_standby_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : enter_standby_answer)

let enter_standby_query_of_xml i =
  let r_instance_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_should_decrement_desired_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceIds"; "AutoScalingGroupName"; "ShouldDecrementDesiredCapacity" ] (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
   }
    : enter_standby_query)

let metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let enable_metrics_collection_query_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_metrics = ref None in
  let r_granularity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "Metrics"; "Granularity" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     metrics = ( ! ) r_metrics;
     granularity = Smaws_Lib.Xml.Parse.required "Granularity" (( ! ) r_granularity) i;
   }
    : enable_metrics_collection_query)

let disable_metrics_collection_query_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "Metrics" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     metrics = ( ! ) r_metrics;
   }
    : disable_metrics_collection_query)

let detach_traffic_sources_result_type_of_xml i = ()

let detach_traffic_sources_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_traffic_sources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "TrafficSources" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     traffic_sources = Smaws_Lib.Xml.Parse.required "TrafficSources" (( ! ) r_traffic_sources) i;
   }
    : detach_traffic_sources_type)

let detach_load_balancer_target_groups_result_type_of_xml i = ()

let detach_load_balancer_target_groups_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_target_group_ar_ns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "TargetGroupARNs" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     target_group_ar_ns =
       Smaws_Lib.Xml.Parse.required "TargetGroupARNs" (( ! ) r_target_group_ar_ns) i;
   }
    : detach_load_balancer_target_groups_type)

let detach_load_balancers_result_type_of_xml i = ()

let detach_load_balancers_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "LoadBalancerNames" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
   }
    : detach_load_balancers_type)

let detach_instances_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : detach_instances_answer)

let detach_instances_query_of_xml i =
  let r_instance_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_should_decrement_desired_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceIds"; "AutoScalingGroupName"; "ShouldDecrementDesiredCapacity" ] (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
   }
    : detach_instances_query)

let invalid_next_token_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_next_token)

let describe_warm_pool_answer_of_xml i =
  let r_warm_pool_configuration = ref None in
  let r_instances = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "WarmPoolConfiguration"; "Instances"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "WarmPoolConfiguration" ->
          r_warm_pool_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolConfiguration"
                 (fun i _ -> warm_pool_configuration_of_xml i)
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     warm_pool_configuration = ( ! ) r_warm_pool_configuration;
     instances = ( ! ) r_instances;
     next_token = ( ! ) r_next_token;
   }
    : describe_warm_pool_answer)

let describe_warm_pool_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "MaxRecords"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
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
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_warm_pool_type)

let traffic_source_state_of_xml i =
  let r_traffic_source = ref None in
  let r_state = ref None in
  let r_identifier = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrafficSource"; "State"; "Identifier"; "Type" ]
    (fun tag _ ->
      match tag with
      | "TrafficSource" ->
          r_traffic_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSource"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Identifier" ->
          r_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identifier"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     traffic_source = ( ! ) r_traffic_source;
     state = ( ! ) r_state;
     identifier = ( ! ) r_identifier;
     type_ = ( ! ) r_type_;
   }
    : traffic_source_state)

let traffic_source_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> traffic_source_state_of_xml i) ()

let describe_traffic_sources_response_of_xml i =
  let r_traffic_sources = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrafficSources"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_state_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ traffic_sources = ( ! ) r_traffic_sources; next_token = ( ! ) r_next_token }
    : describe_traffic_sources_response)

let describe_traffic_sources_request_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_traffic_source_type = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "TrafficSourceType"; "NextToken"; "MaxRecords" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TrafficSourceType" ->
          r_traffic_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSourceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     traffic_source_type = ( ! ) r_traffic_source_type;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_traffic_sources_request)

let describe_termination_policy_types_answer_of_xml i =
  let r_termination_policy_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TerminationPolicyTypes" ] (fun tag _ ->
      match tag with
      | "TerminationPolicyTypes" ->
          r_termination_policy_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicyTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ termination_policy_types = ( ! ) r_termination_policy_types }
    : describe_termination_policy_types_answer)

let tags_type_of_xml i =
  let r_tags = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags; next_token = ( ! ) r_next_token } : tags_type)

let describe_tags_type_of_xml i =
  let r_filters = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters"; "NextToken"; "MaxRecords" ]
    (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filters = ( ! ) r_filters; next_token = ( ! ) r_next_token; max_records = ( ! ) r_max_records }
    : describe_tags_type)

let scheduled_update_group_action_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_action_name = ref None in
  let r_scheduled_action_ar_n = ref None in
  let r_time = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_recurrence = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_time_zone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "ScheduledActionName";
      "ScheduledActionARN";
      "Time";
      "StartTime";
      "EndTime";
      "Recurrence";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "TimeZone";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionARN" ->
          r_scheduled_action_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "Time" ->
          r_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Time" (fun i _ -> timestamp_type_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     scheduled_action_name = ( ! ) r_scheduled_action_name;
     scheduled_action_ar_n = ( ! ) r_scheduled_action_ar_n;
     time = ( ! ) r_time;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     recurrence = ( ! ) r_recurrence;
     min_size = ( ! ) r_min_size;
     max_size = ( ! ) r_max_size;
     desired_capacity = ( ! ) r_desired_capacity;
     time_zone = ( ! ) r_time_zone;
   }
    : scheduled_update_group_action)

let scheduled_update_group_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> scheduled_update_group_action_of_xml i)
    ()

let scheduled_actions_type_of_xml i =
  let r_scheduled_update_group_actions = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduledUpdateGroupActions"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "ScheduledUpdateGroupActions" ->
          r_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scheduled_update_group_action_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_update_group_actions = ( ! ) r_scheduled_update_group_actions;
     next_token = ( ! ) r_next_token;
   }
    : scheduled_actions_type)

let scheduled_action_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let describe_scheduled_actions_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_action_names = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "ScheduledActionNames";
      "StartTime";
      "EndTime";
      "NextToken";
      "MaxRecords";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionNames" ->
          r_scheduled_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     scheduled_action_names = ( ! ) r_scheduled_action_names;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_scheduled_actions_type)

let process_type_of_xml i =
  let r_process_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProcessName" ] (fun tag _ ->
      match tag with
      | "ProcessName" ->
          r_process_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProcessName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ process_name = Smaws_Lib.Xml.Parse.required "ProcessName" (( ! ) r_process_name) i }
    : process_type)

let processes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> process_type_of_xml i) ()

let processes_type_of_xml i =
  let r_processes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Processes" ] (fun tag _ ->
      match tag with
      | "Processes" ->
          r_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Processes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> process_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ processes = ( ! ) r_processes } : processes_type)

let include_deleted_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_scaling_activities_type_of_xml i =
  let r_activity_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_include_deleted_groups = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActivityIds";
      "AutoScalingGroupName";
      "IncludeDeletedGroups";
      "MaxRecords";
      "NextToken";
      "Filters";
    ] (fun tag _ ->
      match tag with
      | "ActivityIds" ->
          r_activity_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActivityIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "IncludeDeletedGroups" ->
          r_include_deleted_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeDeletedGroups"
                 (fun i _ -> include_deleted_groups_of_xml i)
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
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     activity_ids = ( ! ) r_activity_ids;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     include_deleted_groups = ( ! ) r_include_deleted_groups;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     filters = ( ! ) r_filters;
   }
    : describe_scaling_activities_type)

let scaling_policy_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_name = ref None in
  let r_policy_ar_n = ref None in
  let r_policy_type = ref None in
  let r_adjustment_type = ref None in
  let r_min_adjustment_step = ref None in
  let r_min_adjustment_magnitude = ref None in
  let r_scaling_adjustment = ref None in
  let r_cooldown = ref None in
  let r_step_adjustments = ref None in
  let r_metric_aggregation_type = ref None in
  let r_estimated_instance_warmup = ref None in
  let r_alarms = ref None in
  let r_target_tracking_configuration = ref None in
  let r_enabled = ref None in
  let r_predictive_scaling_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "PolicyName";
      "PolicyARN";
      "PolicyType";
      "AdjustmentType";
      "MinAdjustmentStep";
      "MinAdjustmentMagnitude";
      "ScalingAdjustment";
      "Cooldown";
      "StepAdjustments";
      "MetricAggregationType";
      "EstimatedInstanceWarmup";
      "Alarms";
      "TargetTrackingConfiguration";
      "Enabled";
      "PredictiveScalingConfiguration";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyARN" ->
          r_policy_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "PolicyType" ->
          r_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MinAdjustmentStep" ->
          r_min_adjustment_step :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentStep"
                 (fun i _ -> min_adjustment_step_of_xml i)
                 ())
      | "MinAdjustmentMagnitude" ->
          r_min_adjustment_magnitude :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentMagnitude"
                 (fun i _ -> min_adjustment_magnitude_of_xml i)
                 ())
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | "Cooldown" ->
          r_cooldown :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cooldown" (fun i _ -> cooldown_of_xml i) ())
      | "StepAdjustments" ->
          r_step_adjustments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StepAdjustments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> step_adjustment_of_xml i)
                     ())
                 ())
      | "MetricAggregationType" ->
          r_metric_aggregation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAggregationType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "EstimatedInstanceWarmup" ->
          r_estimated_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedInstanceWarmup"
                 (fun i _ -> estimated_instance_warmup_of_xml i)
                 ())
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ())
                 ())
      | "TargetTrackingConfiguration" ->
          r_target_tracking_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTrackingConfiguration"
                 (fun i _ -> target_tracking_configuration_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> scaling_policy_enabled_of_xml i)
                 ())
      | "PredictiveScalingConfiguration" ->
          r_predictive_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictiveScalingConfiguration"
                 (fun i _ -> predictive_scaling_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     policy_name = ( ! ) r_policy_name;
     policy_ar_n = ( ! ) r_policy_ar_n;
     policy_type = ( ! ) r_policy_type;
     adjustment_type = ( ! ) r_adjustment_type;
     min_adjustment_step = ( ! ) r_min_adjustment_step;
     min_adjustment_magnitude = ( ! ) r_min_adjustment_magnitude;
     scaling_adjustment = ( ! ) r_scaling_adjustment;
     cooldown = ( ! ) r_cooldown;
     step_adjustments = ( ! ) r_step_adjustments;
     metric_aggregation_type = ( ! ) r_metric_aggregation_type;
     estimated_instance_warmup = ( ! ) r_estimated_instance_warmup;
     alarms = ( ! ) r_alarms;
     target_tracking_configuration = ( ! ) r_target_tracking_configuration;
     enabled = ( ! ) r_enabled;
     predictive_scaling_configuration = ( ! ) r_predictive_scaling_configuration;
   }
    : scaling_policy)

let scaling_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scaling_policy_of_xml i) ()

let policies_type_of_xml i =
  let r_scaling_policies = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalingPolicies"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ScalingPolicies" ->
          r_scaling_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scaling_policy_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ scaling_policies = ( ! ) r_scaling_policies; next_token = ( ! ) r_next_token } : policies_type)

let policy_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len64_of_xml i) ()

let policy_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

let describe_policies_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_names = ref None in
  let r_policy_types = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "PolicyNames"; "PolicyTypes"; "NextToken"; "MaxRecords" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "PolicyTypes" ->
          r_policy_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len64_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     policy_names = ( ! ) r_policy_names;
     policy_types = ( ! ) r_policy_types;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_policies_type)

let notification_configuration_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_topic_ar_n = ref None in
  let r_notification_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "TopicARN"; "NotificationType" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     topic_ar_n = ( ! ) r_topic_ar_n;
     notification_type = ( ! ) r_notification_type;
   }
    : notification_configuration)

let notification_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> notification_configuration_of_xml i) ()

let describe_notification_configurations_answer_of_xml i =
  let r_notification_configurations = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NotificationConfigurations"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "NotificationConfigurations" ->
          r_notification_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_configuration_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     notification_configurations =
       Smaws_Lib.Xml.Parse.required "NotificationConfigurations"
         (( ! ) r_notification_configurations)
         i;
     next_token = ( ! ) r_next_token;
   }
    : describe_notification_configurations_answer)

let describe_notification_configurations_type_of_xml i =
  let r_auto_scaling_group_names = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupNames"; "NextToken"; "MaxRecords" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupNames" ->
          r_auto_scaling_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_names = ( ! ) r_auto_scaling_group_names;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_notification_configurations_type)

let metric_granularity_type_of_xml i =
  let r_granularity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Granularity" ] (fun tag _ ->
      match tag with
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ granularity = ( ! ) r_granularity } : metric_granularity_type)

let metric_granularity_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_granularity_type_of_xml i) ()

let metric_collection_type_of_xml i =
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metric"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric = ( ! ) r_metric } : metric_collection_type)

let metric_collection_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_collection_type_of_xml i) ()

let describe_metric_collection_types_answer_of_xml i =
  let r_metrics = ref None in
  let r_granularities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metrics"; "Granularities" ] (fun tag _ ->
      match tag with
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_collection_type_of_xml i)
                     ())
                 ())
      | "Granularities" ->
          r_granularities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_granularity_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metrics = ( ! ) r_metrics; granularities = ( ! ) r_granularities }
    : describe_metric_collection_types_answer)

let load_balancer_target_group_state_of_xml i =
  let r_load_balancer_target_group_ar_n = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerTargetGroupARN"; "State" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerTargetGroupARN" ->
          r_load_balancer_target_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerTargetGroupARN"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_target_group_ar_n = ( ! ) r_load_balancer_target_group_ar_n;
     state = ( ! ) r_state;
   }
    : load_balancer_target_group_state)

let load_balancer_target_group_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> load_balancer_target_group_state_of_xml i)
    ()

let describe_load_balancer_target_groups_response_of_xml i =
  let r_load_balancer_target_groups = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerTargetGroups"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerTargetGroups" ->
          r_load_balancer_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerTargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_target_group_state_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_target_groups = ( ! ) r_load_balancer_target_groups;
     next_token = ( ! ) r_next_token;
   }
    : describe_load_balancer_target_groups_response)

let describe_load_balancer_target_groups_request_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "NextToken"; "MaxRecords" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_load_balancer_target_groups_request)

let load_balancer_state_of_xml i =
  let r_load_balancer_name = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerName"; "State" ] (fun tag _ ->
      match tag with
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_balancer_name = ( ! ) r_load_balancer_name; state = ( ! ) r_state } : load_balancer_state)

let load_balancer_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_state_of_xml i) ()

let describe_load_balancers_response_of_xml i =
  let r_load_balancers = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancers"; "NextToken" ] (fun tag _ ->
      match tag with
      | "LoadBalancers" ->
          r_load_balancers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_state_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_balancers = ( ! ) r_load_balancers; next_token = ( ! ) r_next_token }
    : describe_load_balancers_response)

let describe_load_balancers_request_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "NextToken"; "MaxRecords" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_load_balancers_request)

let describe_lifecycle_hook_types_answer_of_xml i =
  let r_lifecycle_hook_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHookTypes" ] (fun tag _ ->
      match tag with
      | "LifecycleHookTypes" ->
          r_lifecycle_hook_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ lifecycle_hook_types = ( ! ) r_lifecycle_hook_types } : describe_lifecycle_hook_types_answer)

let global_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let lifecycle_hook_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_transition = ref None in
  let r_notification_target_ar_n = ref None in
  let r_role_ar_n = ref None in
  let r_notification_metadata = ref None in
  let r_heartbeat_timeout = ref None in
  let r_global_timeout = ref None in
  let r_default_result = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LifecycleHookName";
      "AutoScalingGroupName";
      "LifecycleTransition";
      "NotificationTargetARN";
      "RoleARN";
      "NotificationMetadata";
      "HeartbeatTimeout";
      "GlobalTimeout";
      "DefaultResult";
    ] (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "GlobalTimeout" ->
          r_global_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalTimeout"
                 (fun i _ -> global_timeout_of_xml i)
                 ())
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name = ( ! ) r_lifecycle_hook_name;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     lifecycle_transition = ( ! ) r_lifecycle_transition;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     role_ar_n = ( ! ) r_role_ar_n;
     notification_metadata = ( ! ) r_notification_metadata;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     global_timeout = ( ! ) r_global_timeout;
     default_result = ( ! ) r_default_result;
   }
    : lifecycle_hook)

let lifecycle_hooks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> lifecycle_hook_of_xml i) ()

let describe_lifecycle_hooks_answer_of_xml i =
  let r_lifecycle_hooks = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHooks" ] (fun tag _ ->
      match tag with
      | "LifecycleHooks" ->
          r_lifecycle_hooks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHooks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lifecycle_hook_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ lifecycle_hooks = ( ! ) r_lifecycle_hooks } : describe_lifecycle_hooks_answer)

let lifecycle_hook_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ascii_string_max_len255_of_xml i) ()

let describe_lifecycle_hooks_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "LifecycleHookNames" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleHookNames" ->
          r_lifecycle_hook_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ascii_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_hook_names = ( ! ) r_lifecycle_hook_names;
   }
    : describe_lifecycle_hooks_type)

let instance_metadata_endpoint_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "disabled" -> Disabled | "enabled" -> Enabled | _ -> failwith "unknown enum value"
    : instance_metadata_endpoint_state)

let instance_metadata_http_put_response_hop_limit_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_metadata_http_tokens_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "optional" -> Optional
   | "required" -> Required
   | _ -> failwith "unknown enum value"
    : instance_metadata_http_tokens_state)

let instance_metadata_options_of_xml i =
  let r_http_tokens = ref None in
  let r_http_put_response_hop_limit = ref None in
  let r_http_endpoint = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HttpTokens"; "HttpPutResponseHopLimit"; "HttpEndpoint" ] (fun tag _ ->
      match tag with
      | "HttpTokens" ->
          r_http_tokens :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpTokens"
                 (fun i _ -> instance_metadata_http_tokens_state_of_xml i)
                 ())
      | "HttpPutResponseHopLimit" ->
          r_http_put_response_hop_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpPutResponseHopLimit"
                 (fun i _ -> instance_metadata_http_put_response_hop_limit_of_xml i)
                 ())
      | "HttpEndpoint" ->
          r_http_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpEndpoint"
                 (fun i _ -> instance_metadata_endpoint_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     http_tokens = ( ! ) r_http_tokens;
     http_put_response_hop_limit = ( ! ) r_http_put_response_hop_limit;
     http_endpoint = ( ! ) r_http_endpoint;
   }
    : instance_metadata_options)

let ebs_optimized_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let spot_price_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let monitoring_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_monitoring_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> monitoring_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : instance_monitoring)

let no_device_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_throughput_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_encrypted_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_iops_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_delete_on_termination_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_volume_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let block_device_ebs_volume_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let ebs_of_xml i =
  let r_snapshot_id = ref None in
  let r_volume_size = ref None in
  let r_volume_type = ref None in
  let r_delete_on_termination = ref None in
  let r_iops = ref None in
  let r_encrypted = ref None in
  let r_throughput = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SnapshotId";
      "VolumeSize";
      "VolumeType";
      "DeleteOnTermination";
      "Iops";
      "Encrypted";
      "Throughput";
    ] (fun tag _ ->
      match tag with
      | "SnapshotId" ->
          r_snapshot_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "VolumeSize" ->
          r_volume_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VolumeSize"
                 (fun i _ -> block_device_ebs_volume_size_of_xml i)
                 ())
      | "VolumeType" ->
          r_volume_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VolumeType"
                 (fun i _ -> block_device_ebs_volume_type_of_xml i)
                 ())
      | "DeleteOnTermination" ->
          r_delete_on_termination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteOnTermination"
                 (fun i _ -> block_device_ebs_delete_on_termination_of_xml i)
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops"
                 (fun i _ -> block_device_ebs_iops_of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> block_device_ebs_encrypted_of_xml i)
                 ())
      | "Throughput" ->
          r_throughput :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Throughput"
                 (fun i _ -> block_device_ebs_throughput_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_id = ( ! ) r_snapshot_id;
     volume_size = ( ! ) r_volume_size;
     volume_type = ( ! ) r_volume_type;
     delete_on_termination = ( ! ) r_delete_on_termination;
     iops = ( ! ) r_iops;
     encrypted = ( ! ) r_encrypted;
     throughput = ( ! ) r_throughput;
   }
    : ebs)

let block_device_mapping_of_xml i =
  let r_virtual_name = ref None in
  let r_device_name = ref None in
  let r_ebs = ref None in
  let r_no_device = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VirtualName"; "DeviceName"; "Ebs"; "NoDevice" ]
    (fun tag _ ->
      match tag with
      | "VirtualName" ->
          r_virtual_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DeviceName" ->
          r_device_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeviceName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Ebs" ->
          r_ebs := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Ebs" (fun i _ -> ebs_of_xml i) ())
      | "NoDevice" ->
          r_no_device :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoDevice" (fun i _ -> no_device_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     virtual_name = ( ! ) r_virtual_name;
     device_name = Smaws_Lib.Xml.Parse.required "DeviceName" (( ! ) r_device_name) i;
     ebs = ( ! ) r_ebs;
     no_device = ( ! ) r_no_device;
   }
    : block_device_mapping)

let block_device_mappings_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> block_device_mapping_of_xml i) ()

let xml_string_user_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let classic_link_vpc_security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let launch_configuration_of_xml i =
  let r_launch_configuration_name = ref None in
  let r_launch_configuration_ar_n = ref None in
  let r_image_id = ref None in
  let r_key_name = ref None in
  let r_security_groups = ref None in
  let r_classic_link_vpc_id = ref None in
  let r_classic_link_vpc_security_groups = ref None in
  let r_user_data = ref None in
  let r_instance_type = ref None in
  let r_kernel_id = ref None in
  let r_ramdisk_id = ref None in
  let r_block_device_mappings = ref None in
  let r_instance_monitoring = ref None in
  let r_spot_price = ref None in
  let r_iam_instance_profile = ref None in
  let r_created_time = ref None in
  let r_ebs_optimized = ref None in
  let r_associate_public_ip_address = ref None in
  let r_placement_tenancy = ref None in
  let r_metadata_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LaunchConfigurationName";
      "LaunchConfigurationARN";
      "ImageId";
      "KeyName";
      "SecurityGroups";
      "ClassicLinkVPCId";
      "ClassicLinkVPCSecurityGroups";
      "UserData";
      "InstanceType";
      "KernelId";
      "RamdiskId";
      "BlockDeviceMappings";
      "InstanceMonitoring";
      "SpotPrice";
      "IamInstanceProfile";
      "CreatedTime";
      "EbsOptimized";
      "AssociatePublicIpAddress";
      "PlacementTenancy";
      "MetadataOptions";
    ] (fun tag _ ->
      match tag with
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchConfigurationARN" ->
          r_launch_configuration_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KeyName" ->
          r_key_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "ClassicLinkVPCId" ->
          r_classic_link_vpc_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ClassicLinkVPCSecurityGroups" ->
          r_classic_link_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "UserData" ->
          r_user_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserData"
                 (fun i _ -> xml_string_user_data_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KernelId" ->
          r_kernel_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KernelId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "RamdiskId" ->
          r_ramdisk_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RamdiskId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "BlockDeviceMappings" ->
          r_block_device_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BlockDeviceMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> block_device_mapping_of_xml i)
                     ())
                 ())
      | "InstanceMonitoring" ->
          r_instance_monitoring :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMonitoring"
                 (fun i _ -> instance_monitoring_of_xml i)
                 ())
      | "SpotPrice" ->
          r_spot_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotPrice" (fun i _ -> spot_price_of_xml i) ())
      | "IamInstanceProfile" ->
          r_iam_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamInstanceProfile"
                 (fun i _ -> xml_string_max_len1600_of_xml i)
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EbsOptimized" ->
          r_ebs_optimized :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EbsOptimized"
                 (fun i _ -> ebs_optimized_of_xml i)
                 ())
      | "AssociatePublicIpAddress" ->
          r_associate_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatePublicIpAddress"
                 (fun i _ -> associate_public_ip_address_of_xml i)
                 ())
      | "PlacementTenancy" ->
          r_placement_tenancy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementTenancy"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "MetadataOptions" ->
          r_metadata_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetadataOptions"
                 (fun i _ -> instance_metadata_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
     launch_configuration_ar_n = ( ! ) r_launch_configuration_ar_n;
     image_id = Smaws_Lib.Xml.Parse.required "ImageId" (( ! ) r_image_id) i;
     key_name = ( ! ) r_key_name;
     security_groups = ( ! ) r_security_groups;
     classic_link_vpc_id = ( ! ) r_classic_link_vpc_id;
     classic_link_vpc_security_groups = ( ! ) r_classic_link_vpc_security_groups;
     user_data = ( ! ) r_user_data;
     instance_type = Smaws_Lib.Xml.Parse.required "InstanceType" (( ! ) r_instance_type) i;
     kernel_id = ( ! ) r_kernel_id;
     ramdisk_id = ( ! ) r_ramdisk_id;
     block_device_mappings = ( ! ) r_block_device_mappings;
     instance_monitoring = ( ! ) r_instance_monitoring;
     spot_price = ( ! ) r_spot_price;
     iam_instance_profile = ( ! ) r_iam_instance_profile;
     created_time = Smaws_Lib.Xml.Parse.required "CreatedTime" (( ! ) r_created_time) i;
     ebs_optimized = ( ! ) r_ebs_optimized;
     associate_public_ip_address = ( ! ) r_associate_public_ip_address;
     placement_tenancy = ( ! ) r_placement_tenancy;
     metadata_options = ( ! ) r_metadata_options;
   }
    : launch_configuration)

let launch_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_configuration_of_xml i) ()

let launch_configurations_type_of_xml i =
  let r_launch_configurations = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchConfigurations"; "NextToken" ] (fun tag _ ->
      match tag with
      | "LaunchConfigurations" ->
          r_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_configuration_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configurations =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurations" (( ! ) r_launch_configurations) i;
     next_token = ( ! ) r_next_token;
   }
    : launch_configurations_type)

let launch_configuration_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let launch_configuration_names_type_of_xml i =
  let r_launch_configuration_names = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LaunchConfigurationNames"; "NextToken"; "MaxRecords" ] (fun tag _ ->
      match tag with
      | "LaunchConfigurationNames" ->
          r_launch_configuration_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configuration_names = ( ! ) r_launch_configuration_names;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : launch_configuration_names_type)

let instances_to_update_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_refresh_warm_pool_progress_of_xml i =
  let r_percentage_complete = ref None in
  let r_instances_to_update = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PercentageComplete"; "InstancesToUpdate" ]
    (fun tag _ ->
      match tag with
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     percentage_complete = ( ! ) r_percentage_complete;
     instances_to_update = ( ! ) r_instances_to_update;
   }
    : instance_refresh_warm_pool_progress)

let instance_refresh_live_pool_progress_of_xml i =
  let r_percentage_complete = ref None in
  let r_instances_to_update = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PercentageComplete"; "InstancesToUpdate" ]
    (fun tag _ ->
      match tag with
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     percentage_complete = ( ! ) r_percentage_complete;
     instances_to_update = ( ! ) r_instances_to_update;
   }
    : instance_refresh_live_pool_progress)

let instance_refresh_progress_details_of_xml i =
  let r_live_pool_progress = ref None in
  let r_warm_pool_progress = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LivePoolProgress"; "WarmPoolProgress" ]
    (fun tag _ ->
      match tag with
      | "LivePoolProgress" ->
          r_live_pool_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LivePoolProgress"
                 (fun i _ -> instance_refresh_live_pool_progress_of_xml i)
                 ())
      | "WarmPoolProgress" ->
          r_warm_pool_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolProgress"
                 (fun i _ -> instance_refresh_warm_pool_progress_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     live_pool_progress = ( ! ) r_live_pool_progress;
     warm_pool_progress = ( ! ) r_warm_pool_progress;
   }
    : instance_refresh_progress_details)

let rollback_details_of_xml i =
  let r_rollback_reason = ref None in
  let r_rollback_start_time = ref None in
  let r_percentage_complete_on_rollback = ref None in
  let r_instances_to_update_on_rollback = ref None in
  let r_progress_details_on_rollback = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RollbackReason";
      "RollbackStartTime";
      "PercentageCompleteOnRollback";
      "InstancesToUpdateOnRollback";
      "ProgressDetailsOnRollback";
    ] (fun tag _ ->
      match tag with
      | "RollbackReason" ->
          r_rollback_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackReason"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "RollbackStartTime" ->
          r_rollback_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackStartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "PercentageCompleteOnRollback" ->
          r_percentage_complete_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleteOnRollback"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "InstancesToUpdateOnRollback" ->
          r_instances_to_update_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdateOnRollback"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "ProgressDetailsOnRollback" ->
          r_progress_details_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressDetailsOnRollback"
                 (fun i _ -> instance_refresh_progress_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rollback_reason = ( ! ) r_rollback_reason;
     rollback_start_time = ( ! ) r_rollback_start_time;
     percentage_complete_on_rollback = ( ! ) r_percentage_complete_on_rollback;
     instances_to_update_on_rollback = ( ! ) r_instances_to_update_on_rollback;
     progress_details_on_rollback = ( ! ) r_progress_details_on_rollback;
   }
    : rollback_details)

let instance_refresh_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Pending" -> Pending
   | "InProgress" -> InProgress
   | "Successful" -> Successful
   | "Failed" -> Failed
   | "Cancelling" -> Cancelling
   | "Cancelled" -> Cancelled
   | "RollbackInProgress" -> RollbackInProgress
   | "RollbackFailed" -> RollbackFailed
   | "RollbackSuccessful" -> RollbackSuccessful
   | "Baking" -> Baking
   | _ -> failwith "unknown enum value"
    : instance_refresh_status)

let instance_refresh_of_xml i =
  let r_instance_refresh_id = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_percentage_complete = ref None in
  let r_instances_to_update = ref None in
  let r_progress_details = ref None in
  let r_preferences = ref None in
  let r_desired_configuration = ref None in
  let r_rollback_details = ref None in
  let r_strategy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceRefreshId";
      "AutoScalingGroupName";
      "Status";
      "StatusReason";
      "StartTime";
      "EndTime";
      "PercentageComplete";
      "InstancesToUpdate";
      "ProgressDetails";
      "Preferences";
      "DesiredConfiguration";
      "RollbackDetails";
      "Strategy";
    ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> instance_refresh_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "ProgressDetails" ->
          r_progress_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressDetails"
                 (fun i _ -> instance_refresh_progress_details_of_xml i)
                 ())
      | "Preferences" ->
          r_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Preferences"
                 (fun i _ -> refresh_preferences_of_xml i)
                 ())
      | "DesiredConfiguration" ->
          r_desired_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredConfiguration"
                 (fun i _ -> desired_configuration_of_xml i)
                 ())
      | "RollbackDetails" ->
          r_rollback_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackDetails"
                 (fun i _ -> rollback_details_of_xml i)
                 ())
      | "Strategy" ->
          r_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Strategy"
                 (fun i _ -> refresh_strategy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_refresh_id = ( ! ) r_instance_refresh_id;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     percentage_complete = ( ! ) r_percentage_complete;
     instances_to_update = ( ! ) r_instances_to_update;
     progress_details = ( ! ) r_progress_details;
     preferences = ( ! ) r_preferences;
     desired_configuration = ( ! ) r_desired_configuration;
     rollback_details = ( ! ) r_rollback_details;
     strategy = ( ! ) r_strategy;
   }
    : instance_refresh)

let instance_refreshes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_refresh_of_xml i) ()

let describe_instance_refreshes_answer_of_xml i =
  let r_instance_refreshes = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshes"; "NextToken" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshes" ->
          r_instance_refreshes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_refresh_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refreshes = ( ! ) r_instance_refreshes; next_token = ( ! ) r_next_token }
    : describe_instance_refreshes_answer)

let instance_refresh_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let describe_instance_refreshes_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_instance_refresh_ids = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "InstanceRefreshIds"; "NextToken"; "MaxRecords" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceRefreshIds" ->
          r_instance_refresh_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_refresh_ids = ( ! ) r_instance_refresh_ids;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
   }
    : describe_instance_refreshes_type)

let describe_auto_scaling_notification_types_answer_of_xml i =
  let r_auto_scaling_notification_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingNotificationTypes" ] (fun tag _ ->
      match tag with
      | "AutoScalingNotificationTypes" ->
          r_auto_scaling_notification_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingNotificationTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ auto_scaling_notification_types = ( ! ) r_auto_scaling_notification_types }
    : describe_auto_scaling_notification_types_answer)

let describe_auto_scaling_instances_type_of_xml i =
  let r_instance_ids = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceIds"; "MaxRecords"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
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
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_auto_scaling_instances_type)

let describe_adjustment_types_answer_of_xml i =
  let r_adjustment_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdjustmentTypes" ] (fun tag _ ->
      match tag with
      | "AdjustmentTypes" ->
          r_adjustment_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> adjustment_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ adjustment_types = ( ! ) r_adjustment_types } : describe_adjustment_types_answer)

let number_of_launch_configurations_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let number_of_auto_scaling_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_number_of_launch_configurations_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_number_of_auto_scaling_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_account_limits_answer_of_xml i =
  let r_max_number_of_auto_scaling_groups = ref None in
  let r_max_number_of_launch_configurations = ref None in
  let r_number_of_auto_scaling_groups = ref None in
  let r_number_of_launch_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxNumberOfAutoScalingGroups";
      "MaxNumberOfLaunchConfigurations";
      "NumberOfAutoScalingGroups";
      "NumberOfLaunchConfigurations";
    ] (fun tag _ ->
      match tag with
      | "MaxNumberOfAutoScalingGroups" ->
          r_max_number_of_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxNumberOfAutoScalingGroups"
                 (fun i _ -> max_number_of_auto_scaling_groups_of_xml i)
                 ())
      | "MaxNumberOfLaunchConfigurations" ->
          r_max_number_of_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxNumberOfLaunchConfigurations"
                 (fun i _ -> max_number_of_launch_configurations_of_xml i)
                 ())
      | "NumberOfAutoScalingGroups" ->
          r_number_of_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfAutoScalingGroups"
                 (fun i _ -> number_of_auto_scaling_groups_of_xml i)
                 ())
      | "NumberOfLaunchConfigurations" ->
          r_number_of_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfLaunchConfigurations"
                 (fun i _ -> number_of_launch_configurations_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_number_of_auto_scaling_groups = ( ! ) r_max_number_of_auto_scaling_groups;
     max_number_of_launch_configurations = ( ! ) r_max_number_of_launch_configurations;
     number_of_auto_scaling_groups = ( ! ) r_number_of_auto_scaling_groups;
     number_of_launch_configurations = ( ! ) r_number_of_launch_configurations;
   }
    : describe_account_limits_answer)

let delete_warm_pool_answer_of_xml i = ()

let force_delete_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let delete_warm_pool_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_force_delete = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "ForceDelete" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ForceDelete" ->
          r_force_delete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceDelete"
                 (fun i _ -> force_delete_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     force_delete = ( ! ) r_force_delete;
   }
    : delete_warm_pool_type)

let tag_of_xml i =
  let r_resource_id = ref None in
  let r_resource_type = ref None in
  let r_key = ref None in
  let r_value = ref None in
  let r_propagate_at_launch = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceId"; "ResourceType"; "Key"; "Value"; "PropagateAtLaunch" ] (fun tag _ ->
      match tag with
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId" (fun i _ -> xml_string_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "PropagateAtLaunch" ->
          r_propagate_at_launch :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropagateAtLaunch"
                 (fun i _ -> propagate_at_launch_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_id = ( ! ) r_resource_id;
     resource_type = ( ! ) r_resource_type;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = ( ! ) r_value;
     propagate_at_launch = ( ! ) r_propagate_at_launch;
   }
    : tag)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let delete_tags_type_of_xml i =
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
  ({ tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i } : delete_tags_type)

let delete_scheduled_action_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "ScheduledActionName" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : delete_scheduled_action_type)

let delete_policy_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "PolicyName" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : delete_policy_type)

let delete_notification_configuration_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_topic_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "TopicARN" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     topic_ar_n = Smaws_Lib.Xml.Parse.required "TopicARN" (( ! ) r_topic_ar_n) i;
   }
    : delete_notification_configuration_type)

let delete_lifecycle_hook_answer_of_xml i = ()

let delete_lifecycle_hook_type_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHookName"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : delete_lifecycle_hook_type)

let launch_configuration_name_type_of_xml i =
  let r_launch_configuration_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchConfigurationName" ] (fun tag _ ->
      match tag with
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
   }
    : launch_configuration_name_type)

let delete_auto_scaling_group_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_force_delete = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "ForceDelete" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ForceDelete" ->
          r_force_delete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceDelete"
                 (fun i _ -> force_delete_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     force_delete = ( ! ) r_force_delete;
   }
    : delete_auto_scaling_group_type)

let create_or_update_tags_type_of_xml i =
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
  ({ tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i } : create_or_update_tags_type)

let create_launch_configuration_type_of_xml i =
  let r_launch_configuration_name = ref None in
  let r_image_id = ref None in
  let r_key_name = ref None in
  let r_security_groups = ref None in
  let r_classic_link_vpc_id = ref None in
  let r_classic_link_vpc_security_groups = ref None in
  let r_user_data = ref None in
  let r_instance_id = ref None in
  let r_instance_type = ref None in
  let r_kernel_id = ref None in
  let r_ramdisk_id = ref None in
  let r_block_device_mappings = ref None in
  let r_instance_monitoring = ref None in
  let r_spot_price = ref None in
  let r_iam_instance_profile = ref None in
  let r_ebs_optimized = ref None in
  let r_associate_public_ip_address = ref None in
  let r_placement_tenancy = ref None in
  let r_metadata_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LaunchConfigurationName";
      "ImageId";
      "KeyName";
      "SecurityGroups";
      "ClassicLinkVPCId";
      "ClassicLinkVPCSecurityGroups";
      "UserData";
      "InstanceId";
      "InstanceType";
      "KernelId";
      "RamdiskId";
      "BlockDeviceMappings";
      "InstanceMonitoring";
      "SpotPrice";
      "IamInstanceProfile";
      "EbsOptimized";
      "AssociatePublicIpAddress";
      "PlacementTenancy";
      "MetadataOptions";
    ] (fun tag _ ->
      match tag with
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KeyName" ->
          r_key_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "ClassicLinkVPCId" ->
          r_classic_link_vpc_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ClassicLinkVPCSecurityGroups" ->
          r_classic_link_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "UserData" ->
          r_user_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserData"
                 (fun i _ -> xml_string_user_data_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KernelId" ->
          r_kernel_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KernelId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "RamdiskId" ->
          r_ramdisk_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RamdiskId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "BlockDeviceMappings" ->
          r_block_device_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BlockDeviceMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> block_device_mapping_of_xml i)
                     ())
                 ())
      | "InstanceMonitoring" ->
          r_instance_monitoring :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMonitoring"
                 (fun i _ -> instance_monitoring_of_xml i)
                 ())
      | "SpotPrice" ->
          r_spot_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotPrice" (fun i _ -> spot_price_of_xml i) ())
      | "IamInstanceProfile" ->
          r_iam_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamInstanceProfile"
                 (fun i _ -> xml_string_max_len1600_of_xml i)
                 ())
      | "EbsOptimized" ->
          r_ebs_optimized :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EbsOptimized"
                 (fun i _ -> ebs_optimized_of_xml i)
                 ())
      | "AssociatePublicIpAddress" ->
          r_associate_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatePublicIpAddress"
                 (fun i _ -> associate_public_ip_address_of_xml i)
                 ())
      | "PlacementTenancy" ->
          r_placement_tenancy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementTenancy"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "MetadataOptions" ->
          r_metadata_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetadataOptions"
                 (fun i _ -> instance_metadata_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
     image_id = ( ! ) r_image_id;
     key_name = ( ! ) r_key_name;
     security_groups = ( ! ) r_security_groups;
     classic_link_vpc_id = ( ! ) r_classic_link_vpc_id;
     classic_link_vpc_security_groups = ( ! ) r_classic_link_vpc_security_groups;
     user_data = ( ! ) r_user_data;
     instance_id = ( ! ) r_instance_id;
     instance_type = ( ! ) r_instance_type;
     kernel_id = ( ! ) r_kernel_id;
     ramdisk_id = ( ! ) r_ramdisk_id;
     block_device_mappings = ( ! ) r_block_device_mappings;
     instance_monitoring = ( ! ) r_instance_monitoring;
     spot_price = ( ! ) r_spot_price;
     iam_instance_profile = ( ! ) r_iam_instance_profile;
     ebs_optimized = ( ! ) r_ebs_optimized;
     associate_public_ip_address = ( ! ) r_associate_public_ip_address;
     placement_tenancy = ( ! ) r_placement_tenancy;
     metadata_options = ( ! ) r_metadata_options;
   }
    : create_launch_configuration_type)

let lifecycle_hook_specification_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_lifecycle_transition = ref None in
  let r_notification_metadata = ref None in
  let r_heartbeat_timeout = ref None in
  let r_default_result = ref None in
  let r_notification_target_ar_n = ref None in
  let r_role_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LifecycleHookName";
      "LifecycleTransition";
      "NotificationMetadata";
      "HeartbeatTimeout";
      "DefaultResult";
      "NotificationTargetARN";
      "RoleARN";
    ] (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
     lifecycle_transition =
       Smaws_Lib.Xml.Parse.required "LifecycleTransition" (( ! ) r_lifecycle_transition) i;
     notification_metadata = ( ! ) r_notification_metadata;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     default_result = ( ! ) r_default_result;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     role_ar_n = ( ! ) r_role_ar_n;
   }
    : lifecycle_hook_specification)

let lifecycle_hook_specifications_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> lifecycle_hook_specification_of_xml i)
    ()

let create_auto_scaling_group_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_launch_configuration_name = ref None in
  let r_launch_template = ref None in
  let r_mixed_instances_policy = ref None in
  let r_instance_id = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_default_cooldown = ref None in
  let r_availability_zones = ref None in
  let r_availability_zone_ids = ref None in
  let r_load_balancer_names = ref None in
  let r_target_group_ar_ns = ref None in
  let r_health_check_type = ref None in
  let r_health_check_grace_period = ref None in
  let r_placement_group = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_termination_policies = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_capacity_rebalance = ref None in
  let r_lifecycle_hook_specification_list = ref None in
  let r_deletion_protection = ref None in
  let r_tags = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_max_instance_lifetime = ref None in
  let r_context = ref None in
  let r_desired_capacity_type = ref None in
  let r_default_instance_warmup = ref None in
  let r_traffic_sources = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_availability_zone_distribution = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_skip_zonal_shift_validation = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_instance_lifecycle_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupName";
      "LaunchConfigurationName";
      "LaunchTemplate";
      "MixedInstancesPolicy";
      "InstanceId";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "DefaultCooldown";
      "AvailabilityZones";
      "AvailabilityZoneIds";
      "LoadBalancerNames";
      "TargetGroupARNs";
      "HealthCheckType";
      "HealthCheckGracePeriod";
      "PlacementGroup";
      "VPCZoneIdentifier";
      "TerminationPolicies";
      "NewInstancesProtectedFromScaleIn";
      "CapacityRebalance";
      "LifecycleHookSpecificationList";
      "DeletionProtection";
      "Tags";
      "ServiceLinkedRoleARN";
      "MaxInstanceLifetime";
      "Context";
      "DesiredCapacityType";
      "DefaultInstanceWarmup";
      "TrafficSources";
      "InstanceMaintenancePolicy";
      "AvailabilityZoneDistribution";
      "AvailabilityZoneImpairmentPolicy";
      "SkipZonalShiftValidation";
      "CapacityReservationSpecification";
      "InstanceLifecyclePolicy";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "LifecycleHookSpecificationList" ->
          r_lifecycle_hook_specification_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookSpecificationList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lifecycle_hook_specification_of_xml i)
                     ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     launch_template = ( ! ) r_launch_template;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     instance_id = ( ! ) r_instance_id;
     min_size = Smaws_Lib.Xml.Parse.required "MinSize" (( ! ) r_min_size) i;
     max_size = Smaws_Lib.Xml.Parse.required "MaxSize" (( ! ) r_max_size) i;
     desired_capacity = ( ! ) r_desired_capacity;
     default_cooldown = ( ! ) r_default_cooldown;
     availability_zones = ( ! ) r_availability_zones;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     load_balancer_names = ( ! ) r_load_balancer_names;
     target_group_ar_ns = ( ! ) r_target_group_ar_ns;
     health_check_type = ( ! ) r_health_check_type;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     placement_group = ( ! ) r_placement_group;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     termination_policies = ( ! ) r_termination_policies;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     lifecycle_hook_specification_list = ( ! ) r_lifecycle_hook_specification_list;
     deletion_protection = ( ! ) r_deletion_protection;
     tags = ( ! ) r_tags;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     context = ( ! ) r_context;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     traffic_sources = ( ! ) r_traffic_sources;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
   }
    : create_auto_scaling_group_type)

let complete_lifecycle_action_answer_of_xml i = ()

let complete_lifecycle_action_type_of_xml i =
  let r_lifecycle_hook_name = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_action_token = ref None in
  let r_lifecycle_action_result = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LifecycleHookName";
      "AutoScalingGroupName";
      "LifecycleActionToken";
      "LifecycleActionResult";
      "InstanceId";
    ] (fun tag _ ->
      match tag with
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LifecycleActionToken" ->
          r_lifecycle_action_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionToken"
                 (fun i _ -> lifecycle_action_token_of_xml i)
                 ())
      | "LifecycleActionResult" ->
          r_lifecycle_action_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_action_token = ( ! ) r_lifecycle_action_token;
     lifecycle_action_result =
       Smaws_Lib.Xml.Parse.required "LifecycleActionResult" (( ! ) r_lifecycle_action_result) i;
     instance_id = ( ! ) r_instance_id;
   }
    : complete_lifecycle_action_type)

let cancel_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : cancel_instance_refresh_answer)

let boolean_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cancel_instance_refresh_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_wait_for_transitioning_instances = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "WaitForTransitioningInstances" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "WaitForTransitioningInstances" ->
          r_wait_for_transitioning_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WaitForTransitioningInstances"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     wait_for_transitioning_instances = ( ! ) r_wait_for_transitioning_instances;
   }
    : cancel_instance_refresh_type)

let failed_scheduled_update_group_action_request_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_error_code = ref None in
  let r_error_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ScheduledActionName"; "ErrorCode"; "ErrorMessage" ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     error_code = ( ! ) r_error_code;
     error_message = ( ! ) r_error_message;
   }
    : failed_scheduled_update_group_action_request)

let failed_scheduled_update_group_action_requests_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
    ()

let batch_put_scheduled_update_group_action_answer_of_xml i =
  let r_failed_scheduled_update_group_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedScheduledUpdateGroupActions" ] (fun tag _ ->
      match tag with
      | "FailedScheduledUpdateGroupActions" ->
          r_failed_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_scheduled_update_group_actions = ( ! ) r_failed_scheduled_update_group_actions }
    : batch_put_scheduled_update_group_action_answer)

let scheduled_update_group_action_request_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_recurrence = ref None in
  let r_min_size = ref None in
  let r_max_size = ref None in
  let r_desired_capacity = ref None in
  let r_time_zone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduledActionName";
      "StartTime";
      "EndTime";
      "Recurrence";
      "MinSize";
      "MaxSize";
      "DesiredCapacity";
      "TimeZone";
    ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     recurrence = ( ! ) r_recurrence;
     min_size = ( ! ) r_min_size;
     max_size = ( ! ) r_max_size;
     desired_capacity = ( ! ) r_desired_capacity;
     time_zone = ( ! ) r_time_zone;
   }
    : scheduled_update_group_action_request)

let scheduled_update_group_action_requests_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> scheduled_update_group_action_request_of_xml i)
    ()

let batch_put_scheduled_update_group_action_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_update_group_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AutoScalingGroupName"; "ScheduledUpdateGroupActions" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledUpdateGroupActions" ->
          r_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     scheduled_update_group_actions =
       Smaws_Lib.Xml.Parse.required "ScheduledUpdateGroupActions"
         (( ! ) r_scheduled_update_group_actions)
         i;
   }
    : batch_put_scheduled_update_group_action_type)

let batch_delete_scheduled_action_answer_of_xml i =
  let r_failed_scheduled_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedScheduledActions" ] (fun tag _ ->
      match tag with
      | "FailedScheduledActions" ->
          r_failed_scheduled_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedScheduledActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_scheduled_actions = ( ! ) r_failed_scheduled_actions }
    : batch_delete_scheduled_action_answer)

let batch_delete_scheduled_action_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_scheduled_action_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "ScheduledActionNames" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ScheduledActionNames" ->
          r_scheduled_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     scheduled_action_names =
       Smaws_Lib.Xml.Parse.required "ScheduledActionNames" (( ! ) r_scheduled_action_names) i;
   }
    : batch_delete_scheduled_action_type)
