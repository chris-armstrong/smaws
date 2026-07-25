open Types

let nullable_positive_integer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let accelerator_count_request_to_query path (x : accelerator_count_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let accelerator_manufacturer_to_query path (x : accelerator_manufacturer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NVIDIA -> "nvidia"
    | AMD -> "amd"
    | AMAZON_WEB_SERVICES -> "amazon-web-services"
    | XILINX -> "xilinx")

let accelerator_manufacturers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_manufacturer_to_query
    path xs

let accelerator_name_to_query path (x : accelerator_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | A100 -> "a100"
    | V100 -> "v100"
    | K80 -> "k80"
    | T4 -> "t4"
    | M60 -> "m60"
    | RADEON_PRO_V520 -> "radeon-pro-v520"
    | VU9P -> "vu9p")

let accelerator_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_name_to_query path xs

let accelerator_total_memory_mi_b_request_to_query path (x : accelerator_total_memory_mi_b_request)
    =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let accelerator_type_to_query path (x : accelerator_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with GPU -> "gpu" | FPGA -> "fpga" | INFERENCE -> "inference")

let accelerator_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_type_to_query path xs

let xml_string_max_len255_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let active_instance_refresh_not_found_fault_to_query path
    (x : active_instance_refresh_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let resource_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let auto_scaling_group_state_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let progress_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let scaling_activity_status_code_to_query path (x : scaling_activity_status_code) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PendingSpotBidPlacement -> "PendingSpotBidPlacement"
    | WaitingForSpotInstanceRequestId -> "WaitingForSpotInstanceRequestId"
    | WaitingForSpotInstanceId -> "WaitingForSpotInstanceId"
    | WaitingForInstanceId -> "WaitingForInstanceId"
    | PreInService -> "PreInService"
    | InProgress -> "InProgress"
    | WaitingForELBConnectionDraining -> "WaitingForELBConnectionDraining"
    | MidLifecycleAction -> "MidLifecycleAction"
    | WaitingForInstanceWarmup -> "WaitingForInstanceWarmup"
    | Successful -> "Successful"
    | Failed -> "Failed"
    | Cancelled -> "Cancelled"
    | WaitingForConnectionDraining -> "WaitingForConnectionDraining"
    | WaitingForInPlaceUpdateToStart -> "WaitingForInPlaceUpdateToStart"
    | WaitingForInPlaceUpdateToFinalize -> "WaitingForInPlaceUpdateToFinalize"
    | InPlaceUpdateInProgress -> "InPlaceUpdateInProgress")

let timestamp_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let xml_string_max_len1023_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let activity_to_query path (x : activity) =
  List.concat
    [
      xml_string_to_query (List.append path [ "ActivityId" ]) x.activity_id;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.description with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Description" ]) v);
      xml_string_max_len1023_to_query (List.append path [ "Cause" ]) x.cause;
      timestamp_type_to_query (List.append path [ "StartTime" ]) x.start_time;
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      scaling_activity_status_code_to_query (List.append path [ "StatusCode" ]) x.status_code;
      (match x.status_message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "StatusMessage" ]) v);
      (match x.progress with
      | None -> []
      | Some v -> progress_to_query (List.append path [ "Progress" ]) v);
      (match x.details with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Details" ]) v);
      (match x.auto_scaling_group_state with
      | None -> []
      | Some v -> auto_scaling_group_state_to_query (List.append path [ "AutoScalingGroupState" ]) v);
      (match x.auto_scaling_group_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AutoScalingGroupARN" ]) v);
    ]

let activities_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" activity_to_query path xs

let activities_type_to_query path (x : activities_type) =
  List.concat
    [
      activities_to_query (List.append path [ "Activities" ]) x.activities;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let activity_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let activity_type_to_query path (x : activity_type) =
  List.concat
    [
      (match x.activity with
      | None -> []
      | Some v -> activity_to_query (List.append path [ "Activity" ]) v);
    ]

let adjustment_type_to_query path (x : adjustment_type) =
  List.concat
    [
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
    ]

let adjustment_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" adjustment_type_to_query path xs

let alarm_to_query path (x : alarm) =
  List.concat
    [
      (match x.alarm_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AlarmName" ]) v);
      (match x.alarm_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AlarmARN" ]) v);
    ]

let alarm_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let alarm_specification_to_query path (x : alarm_specification) =
  List.concat
    [
      (match x.alarms with
      | None -> []
      | Some v -> alarm_list_to_query (List.append path [ "Alarms" ]) v);
    ]

let alarms_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_to_query path xs

let allowed_instance_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let allowed_instance_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" allowed_instance_type_to_query path
    xs

let already_exists_fault_to_query path (x : already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let any_printable_ascii_string_max_len4000_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ascii_string_max_len255_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let associate_public_ip_address_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let service_linked_role_failure_to_query path (x : service_linked_role_failure) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let resource_contention_fault_to_query path (x : resource_contention_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let xml_string_max_len19_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let instance_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len19_to_query path
    xs

let attach_instances_query_to_query path (x : attach_instances_query) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let instance_refresh_in_progress_fault_to_query path (x : instance_refresh_in_progress_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let attach_load_balancer_target_groups_result_type_to_query path _x = []

let xml_string_max_len511_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_group_ar_ns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len511_to_query path
    xs

let attach_load_balancer_target_groups_type_to_query path
    (x : attach_load_balancer_target_groups_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) x.target_group_ar_ns;
    ]

let attach_load_balancers_result_type_to_query path _x = []

let load_balancer_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let attach_load_balancers_type_to_query path (x : attach_load_balancers_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
    ]

let attach_traffic_sources_result_type_to_query path _x = []

let skip_zonal_shift_validation_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let traffic_source_identifier_to_query path (x : traffic_source_identifier) =
  List.concat
    [
      xml_string_max_len511_to_query (List.append path [ "Identifier" ]) x.identifier;
      (match x.type_ with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Type" ]) v);
    ]

let traffic_sources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" traffic_source_identifier_to_query
    path xs

let attach_traffic_sources_type_to_query path (x : attach_traffic_sources_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      traffic_sources_to_query (List.append path [ "TrafficSources" ]) x.traffic_sources;
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
    ]

let auto_rollback_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let retention_action_to_query path (x : retention_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Retain -> "retain" | Terminate -> "terminate")

let retention_triggers_to_query path (x : retention_triggers) =
  List.concat
    [
      (match x.terminate_hook_abandon with
      | None -> []
      | Some v -> retention_action_to_query (List.append path [ "TerminateHookAbandon" ]) v);
    ]

let instance_lifecycle_policy_to_query path (x : instance_lifecycle_policy) =
  List.concat
    [
      (match x.retention_triggers with
      | None -> []
      | Some v -> retention_triggers_to_query (List.append path [ "RetentionTriggers" ]) v);
    ]

let capacity_reservation_resource_group_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_to_query path xs

let capacity_reservation_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ascii_string_max_len255_to_query
    path xs

let capacity_reservation_target_to_query path (x : capacity_reservation_target) =
  List.concat
    [
      (match x.capacity_reservation_ids with
      | None -> []
      | Some v ->
          capacity_reservation_ids_to_query (List.append path [ "CapacityReservationIds" ]) v);
      (match x.capacity_reservation_resource_group_arns with
      | None -> []
      | Some v ->
          capacity_reservation_resource_group_arns_to_query
            (List.append path [ "CapacityReservationResourceGroupArns" ])
            v);
    ]

let capacity_reservation_preference_to_query path (x : capacity_reservation_preference) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CapacityReservationsOnly -> "capacity-reservations-only"
    | CapacityReservationsFirst -> "capacity-reservations-first"
    | None_ -> "none"
    | Default -> "default")

let capacity_reservation_specification_to_query path (x : capacity_reservation_specification) =
  List.concat
    [
      (match x.capacity_reservation_preference with
      | None -> []
      | Some v ->
          capacity_reservation_preference_to_query
            (List.append path [ "CapacityReservationPreference" ])
            v);
      (match x.capacity_reservation_target with
      | None -> []
      | Some v ->
          capacity_reservation_target_to_query (List.append path [ "CapacityReservationTarget" ]) v);
    ]

let impaired_zone_health_check_behavior_to_query path (x : impaired_zone_health_check_behavior) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ReplaceUnhealthy -> "ReplaceUnhealthy" | IgnoreUnhealthy -> "IgnoreUnhealthy")

let zonal_shift_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let availability_zone_impairment_policy_to_query path (x : availability_zone_impairment_policy) =
  List.concat
    [
      (match x.zonal_shift_enabled with
      | None -> []
      | Some v -> zonal_shift_enabled_to_query (List.append path [ "ZonalShiftEnabled" ]) v);
      (match x.impaired_zone_health_check_behavior with
      | None -> []
      | Some v ->
          impaired_zone_health_check_behavior_to_query
            (List.append path [ "ImpairedZoneHealthCheckBehavior" ])
            v);
    ]

let capacity_distribution_strategy_to_query path (x : capacity_distribution_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | BALANCED_ONLY -> "balanced-only"
    | BALANCED_BEST_EFFORT -> "balanced-best-effort"
    | RESERVATIONS_THEN_BALANCED -> "reservations-then-balanced")

let availability_zone_distribution_to_query path (x : availability_zone_distribution) =
  List.concat
    [
      (match x.capacity_distribution_strategy with
      | None -> []
      | Some v ->
          capacity_distribution_strategy_to_query
            (List.append path [ "CapacityDistributionStrategy" ])
            v);
    ]

let deletion_protection_to_query path (x : deletion_protection) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | None_ -> "none"
    | PreventForceDeletion -> "prevent-force-deletion"
    | PreventAllDeletion -> "prevent-all-deletion")

let int_percent100_to200_resettable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let int_percent_resettable_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_maintenance_policy_to_query path (x : instance_maintenance_policy) =
  List.concat
    [
      (match x.min_healthy_percentage with
      | None -> []
      | Some v -> int_percent_resettable_to_query (List.append path [ "MinHealthyPercentage" ]) v);
      (match x.max_healthy_percentage with
      | None -> []
      | Some v ->
          int_percent100_to200_resettable_to_query (List.append path [ "MaxHealthyPercentage" ]) v);
    ]

let default_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let context_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let warm_pool_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let reuse_on_scale_in_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let instance_reuse_policy_to_query path (x : instance_reuse_policy) =
  List.concat
    [
      (match x.reuse_on_scale_in with
      | None -> []
      | Some v -> reuse_on_scale_in_to_query (List.append path [ "ReuseOnScaleIn" ]) v);
    ]

let warm_pool_status_to_query path (x : warm_pool_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PendingDelete -> "PendingDelete")

let warm_pool_state_to_query path (x : warm_pool_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Stopped -> "Stopped" | Running -> "Running" | Hibernated -> "Hibernated")

let warm_pool_min_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_group_prepared_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let warm_pool_configuration_to_query path (x : warm_pool_configuration) =
  List.concat
    [
      (match x.max_group_prepared_capacity with
      | None -> []
      | Some v ->
          max_group_prepared_capacity_to_query (List.append path [ "MaxGroupPreparedCapacity" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> warm_pool_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.pool_state with
      | None -> []
      | Some v -> warm_pool_state_to_query (List.append path [ "PoolState" ]) v);
      (match x.status with
      | None -> []
      | Some v -> warm_pool_status_to_query (List.append path [ "Status" ]) v);
      (match x.instance_reuse_policy with
      | None -> []
      | Some v -> instance_reuse_policy_to_query (List.append path [ "InstanceReusePolicy" ]) v);
    ]

let capacity_rebalance_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let max_instance_lifetime_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let instance_protected_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let xml_string_max_len1600_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let termination_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len1600_to_query path
    xs

let propagate_at_launch_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_description_to_query path (x : tag_description) =
  List.concat
    [
      (match x.resource_id with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceId" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceType" ]) v);
      (match x.key with None -> [] | Some v -> tag_key_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
      (match x.propagate_at_launch with
      | None -> []
      | Some v -> propagate_at_launch_to_query (List.append path [ "PropagateAtLaunch" ]) v);
    ]

let tag_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_description_to_query path xs

let enabled_metric_to_query path (x : enabled_metric) =
  List.concat
    [
      (match x.metric with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Metric" ]) v);
      (match x.granularity with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Granularity" ]) v);
    ]

let enabled_metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" enabled_metric_to_query path xs

let xml_string_max_len5000_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let suspended_process_to_query path (x : suspended_process) =
  List.concat
    [
      (match x.process_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ProcessName" ]) v);
      (match x.suspension_reason with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SuspensionReason" ]) v);
    ]

let suspended_processes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" suspended_process_to_query path xs

let xml_string_max_len32_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_template_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_template_specification_to_query path (x : launch_template_specification) =
  List.concat
    [
      (match x.launch_template_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchTemplateId" ]) v);
      (match x.launch_template_name with
      | None -> []
      | Some v -> launch_template_name_to_query (List.append path [ "LaunchTemplateName" ]) v);
      (match x.version with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Version" ]) v);
    ]

let lifecycle_state_to_query path (x : lifecycle_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PENDING -> "Pending"
    | PENDING_WAIT -> "Pending:Wait"
    | PENDING_PROCEED -> "Pending:Proceed"
    | QUARANTINED -> "Quarantined"
    | IN_SERVICE -> "InService"
    | TERMINATING -> "Terminating"
    | TERMINATING_WAIT -> "Terminating:Wait"
    | TERMINATING_PROCEED -> "Terminating:Proceed"
    | TERMINATING_RETAINED -> "Terminating:Retained"
    | TERMINATED -> "Terminated"
    | DETACHING -> "Detaching"
    | DETACHED -> "Detached"
    | ENTERING_STANDBY -> "EnteringStandby"
    | STANDBY -> "Standby"
    | REPLACING_ROOT_VOLUME -> "ReplacingRootVolume"
    | REPLACING_ROOT_VOLUME_WAIT -> "ReplacingRootVolume:Wait"
    | REPLACING_ROOT_VOLUME_PROCEED -> "ReplacingRootVolume:Proceed"
    | ROOT_VOLUME_REPLACED -> "RootVolumeReplaced"
    | WARMED_PENDING -> "Warmed:Pending"
    | WARMED_PENDING_WAIT -> "Warmed:Pending:Wait"
    | WARMED_PENDING_PROCEED -> "Warmed:Pending:Proceed"
    | WARMED_PENDING_RETAINED -> "Warmed:Pending:Retained"
    | WARMED_TERMINATING -> "Warmed:Terminating"
    | WARMED_TERMINATING_WAIT -> "Warmed:Terminating:Wait"
    | WARMED_TERMINATING_PROCEED -> "Warmed:Terminating:Proceed"
    | WARMED_TERMINATING_RETAINED -> "Warmed:Terminating:Retained"
    | WARMED_TERMINATED -> "Warmed:Terminated"
    | WARMED_STOPPED -> "Warmed:Stopped"
    | WARMED_RUNNING -> "Warmed:Running"
    | WARMED_HIBERNATED -> "Warmed:Hibernated")

let instance_to_query path (x : instance) =
  List.concat
    [
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) x.availability_zone;
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      lifecycle_state_to_query (List.append path [ "LifecycleState" ]) x.lifecycle_state;
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      instance_protected_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
    ]

let instances_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_to_query path xs

let health_check_grace_period_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let availability_zone_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let cooldown_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_predicted_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_desired_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_max_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_min_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let mixed_instance_spot_price_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let spot_instance_pools_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let on_demand_percentage_above_base_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let on_demand_base_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instances_distribution_to_query path (x : instances_distribution) =
  List.concat
    [
      (match x.on_demand_allocation_strategy with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "OnDemandAllocationStrategy" ]) v);
      (match x.on_demand_base_capacity with
      | None -> []
      | Some v -> on_demand_base_capacity_to_query (List.append path [ "OnDemandBaseCapacity" ]) v);
      (match x.on_demand_percentage_above_base_capacity with
      | None -> []
      | Some v ->
          on_demand_percentage_above_base_capacity_to_query
            (List.append path [ "OnDemandPercentageAboveBaseCapacity" ])
            v);
      (match x.spot_allocation_strategy with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "SpotAllocationStrategy" ]) v);
      (match x.spot_instance_pools with
      | None -> []
      | Some v -> spot_instance_pools_to_query (List.append path [ "SpotInstancePools" ]) v);
      (match x.spot_max_price with
      | None -> []
      | Some v -> mixed_instance_spot_price_to_query (List.append path [ "SpotMaxPrice" ]) v);
    ]

let image_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let performance_factor_reference_request_to_query path (x : performance_factor_reference_request) =
  List.concat
    [
      (match x.instance_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "InstanceFamily" ]) v);
    ]

let performance_factor_reference_set_request_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item"
    performance_factor_reference_request_to_query path xs

let cpu_performance_factor_request_to_query path (x : cpu_performance_factor_request) =
  List.concat
    [
      (match x.references with
      | None -> []
      | Some v ->
          performance_factor_reference_set_request_to_query (List.append path [ "Reference" ]) v);
    ]

let baseline_performance_factors_request_to_query path (x : baseline_performance_factors_request) =
  List.concat
    [
      (match x.cpu with
      | None -> []
      | Some v -> cpu_performance_factor_request_to_query (List.append path [ "Cpu" ]) v);
    ]

let nullable_positive_double_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let network_bandwidth_gbps_request_to_query path (x : network_bandwidth_gbps_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
    ]

let baseline_ebs_bandwidth_mbps_request_to_query path (x : baseline_ebs_bandwidth_mbps_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let total_local_storage_gb_request_to_query path (x : total_local_storage_gb_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
    ]

let local_storage_type_to_query path (x : local_storage_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HDD -> "hdd" | SSD -> "ssd")

let local_storage_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" local_storage_type_to_query path xs

let local_storage_to_query path (x : local_storage) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INCLUDED -> "included" | EXCLUDED -> "excluded" | REQUIRED -> "required")

let network_interface_count_request_to_query path (x : network_interface_count_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let nullable_boolean_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let burstable_performance_to_query path (x : burstable_performance) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INCLUDED -> "included" | EXCLUDED -> "excluded" | REQUIRED -> "required")

let bare_metal_to_query path (x : bare_metal) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INCLUDED -> "included" | EXCLUDED -> "excluded" | REQUIRED -> "required")

let instance_generation_to_query path (x : instance_generation) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CURRENT -> "current" | PREVIOUS -> "previous")

let instance_generations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_generation_to_query path xs

let excluded_instance_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let excluded_instance_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" excluded_instance_to_query path xs

let memory_gi_b_per_v_cpu_request_to_query path (x : memory_gi_b_per_v_cpu_request) =
  List.concat
    [
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
    ]

let cpu_manufacturer_to_query path (x : cpu_manufacturer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | INTEL -> "intel"
    | AMD -> "amd"
    | AMAZON_WEB_SERVICES -> "amazon-web-services"
    | APPLE -> "apple")

let cpu_manufacturers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cpu_manufacturer_to_query path xs

let memory_mi_b_request_to_query path (x : memory_mi_b_request) =
  List.concat
    [
      nullable_positive_integer_to_query (List.append path [ "Min" ]) x.min;
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let v_cpu_count_request_to_query path (x : v_cpu_count_request) =
  List.concat
    [
      nullable_positive_integer_to_query (List.append path [ "Min" ]) x.min;
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
    ]

let instance_requirements_to_query path (x : instance_requirements) =
  List.concat
    [
      v_cpu_count_request_to_query (List.append path [ "VCpuCount" ]) x.v_cpu_count;
      memory_mi_b_request_to_query (List.append path [ "MemoryMiB" ]) x.memory_mi_b;
      (match x.cpu_manufacturers with
      | None -> []
      | Some v -> cpu_manufacturers_to_query (List.append path [ "CpuManufacturers" ]) v);
      (match x.memory_gi_b_per_v_cpu with
      | None -> []
      | Some v -> memory_gi_b_per_v_cpu_request_to_query (List.append path [ "MemoryGiBPerVCpu" ]) v);
      (match x.excluded_instance_types with
      | None -> []
      | Some v -> excluded_instance_types_to_query (List.append path [ "ExcludedInstanceTypes" ]) v);
      (match x.instance_generations with
      | None -> []
      | Some v -> instance_generations_to_query (List.append path [ "InstanceGenerations" ]) v);
      (match x.spot_max_price_percentage_over_lowest_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "SpotMaxPricePercentageOverLowestPrice" ])
            v);
      (match x.max_spot_price_as_percentage_of_optimal_on_demand_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice" ])
            v);
      (match x.on_demand_max_price_percentage_over_lowest_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "OnDemandMaxPricePercentageOverLowestPrice" ])
            v);
      (match x.bare_metal with
      | None -> []
      | Some v -> bare_metal_to_query (List.append path [ "BareMetal" ]) v);
      (match x.burstable_performance with
      | None -> []
      | Some v -> burstable_performance_to_query (List.append path [ "BurstablePerformance" ]) v);
      (match x.require_hibernate_support with
      | None -> []
      | Some v -> nullable_boolean_to_query (List.append path [ "RequireHibernateSupport" ]) v);
      (match x.network_interface_count with
      | None -> []
      | Some v ->
          network_interface_count_request_to_query (List.append path [ "NetworkInterfaceCount" ]) v);
      (match x.local_storage with
      | None -> []
      | Some v -> local_storage_to_query (List.append path [ "LocalStorage" ]) v);
      (match x.local_storage_types with
      | None -> []
      | Some v -> local_storage_types_to_query (List.append path [ "LocalStorageTypes" ]) v);
      (match x.total_local_storage_g_b with
      | None -> []
      | Some v ->
          total_local_storage_gb_request_to_query (List.append path [ "TotalLocalStorageGB" ]) v);
      (match x.baseline_ebs_bandwidth_mbps with
      | None -> []
      | Some v ->
          baseline_ebs_bandwidth_mbps_request_to_query
            (List.append path [ "BaselineEbsBandwidthMbps" ])
            v);
      (match x.accelerator_types with
      | None -> []
      | Some v -> accelerator_types_to_query (List.append path [ "AcceleratorTypes" ]) v);
      (match x.accelerator_count with
      | None -> []
      | Some v -> accelerator_count_request_to_query (List.append path [ "AcceleratorCount" ]) v);
      (match x.accelerator_manufacturers with
      | None -> []
      | Some v ->
          accelerator_manufacturers_to_query (List.append path [ "AcceleratorManufacturers" ]) v);
      (match x.accelerator_names with
      | None -> []
      | Some v -> accelerator_names_to_query (List.append path [ "AcceleratorNames" ]) v);
      (match x.accelerator_total_memory_mi_b with
      | None -> []
      | Some v ->
          accelerator_total_memory_mi_b_request_to_query
            (List.append path [ "AcceleratorTotalMemoryMiB" ])
            v);
      (match x.network_bandwidth_gbps with
      | None -> []
      | Some v ->
          network_bandwidth_gbps_request_to_query (List.append path [ "NetworkBandwidthGbps" ]) v);
      (match x.allowed_instance_types with
      | None -> []
      | Some v -> allowed_instance_types_to_query (List.append path [ "AllowedInstanceTypes" ]) v);
      (match x.baseline_performance_factors with
      | None -> []
      | Some v ->
          baseline_performance_factors_request_to_query
            (List.append path [ "BaselinePerformanceFactors" ])
            v);
    ]

let launch_template_overrides_to_query path (x : launch_template_overrides) =
  List.concat
    [
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
      (match x.launch_template_specification with
      | None -> []
      | Some v ->
          launch_template_specification_to_query
            (List.append path [ "LaunchTemplateSpecification" ])
            v);
      (match x.instance_requirements with
      | None -> []
      | Some v -> instance_requirements_to_query (List.append path [ "InstanceRequirements" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> image_id_to_query (List.append path [ "ImageId" ]) v);
    ]

let overrides_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_template_overrides_to_query
    path xs

let launch_template_to_query path (x : launch_template) =
  List.concat
    [
      (match x.launch_template_specification with
      | None -> []
      | Some v ->
          launch_template_specification_to_query
            (List.append path [ "LaunchTemplateSpecification" ])
            v);
      (match x.overrides with
      | None -> []
      | Some v -> overrides_to_query (List.append path [ "Overrides" ]) v);
    ]

let mixed_instances_policy_to_query path (x : mixed_instances_policy) =
  List.concat
    [
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.instances_distribution with
      | None -> []
      | Some v -> instances_distribution_to_query (List.append path [ "InstancesDistribution" ]) v);
    ]

let auto_scaling_group_to_query path (x : auto_scaling_group) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.auto_scaling_group_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AutoScalingGroupARN" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) x.min_size;
      auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) x.max_size;
      auto_scaling_group_desired_capacity_to_query
        (List.append path [ "DesiredCapacity" ])
        x.desired_capacity;
      (match x.predicted_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_predicted_capacity_to_query
            (List.append path [ "PredictedCapacity" ])
            v);
      cooldown_to_query (List.append path [ "DefaultCooldown" ]) x.default_cooldown;
      availability_zones_to_query (List.append path [ "AvailabilityZones" ]) x.availability_zones;
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.load_balancer_names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) v);
      (match x.target_group_ar_ns with
      | None -> []
      | Some v -> target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) v);
      xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) x.health_check_type;
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      timestamp_type_to_query (List.append path [ "CreatedTime" ]) x.created_time;
      (match x.suspended_processes with
      | None -> []
      | Some v -> suspended_processes_to_query (List.append path [ "SuspendedProcesses" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.enabled_metrics with
      | None -> []
      | Some v -> enabled_metrics_to_query (List.append path [ "EnabledMetrics" ]) v);
      (match x.status with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Status" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_description_list_to_query (List.append path [ "Tags" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.warm_pool_configuration with
      | None -> []
      | Some v -> warm_pool_configuration_to_query (List.append path [ "WarmPoolConfiguration" ]) v);
      (match x.warm_pool_size with
      | None -> []
      | Some v -> warm_pool_size_to_query (List.append path [ "WarmPoolSize" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_sources_to_query (List.append path [ "TrafficSources" ]) v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
    ]

let auto_scaling_group_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let filter_to_query path (x : filter) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Name" ]) v);
      (match x.values with
      | None -> []
      | Some v -> values_to_query (List.append path [ "Values" ]) v);
    ]

let filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" filter_to_query path xs

let max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let include_instances_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let auto_scaling_group_names_type_to_query path (x : auto_scaling_group_names_type) =
  List.concat
    [
      (match x.auto_scaling_group_names with
      | None -> []
      | Some v -> auto_scaling_group_names_to_query (List.append path [ "AutoScalingGroupNames" ]) v);
      (match x.include_instances with
      | None -> []
      | Some v -> include_instances_to_query (List.append path [ "IncludeInstances" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
    ]

let auto_scaling_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" auto_scaling_group_to_query path xs

let auto_scaling_groups_type_to_query path (x : auto_scaling_groups_type) =
  List.concat
    [
      auto_scaling_groups_to_query (List.append path [ "AutoScalingGroups" ]) x.auto_scaling_groups;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let auto_scaling_instance_details_to_query path (x : auto_scaling_instance_details) =
  List.concat
    [
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) x.availability_zone;
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      xml_string_max_len32_to_query (List.append path [ "LifecycleState" ]) x.lifecycle_state;
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      instance_protected_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
    ]

let auto_scaling_instances_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    auto_scaling_instance_details_to_query path xs

let auto_scaling_instances_type_to_query path (x : auto_scaling_instances_type) =
  List.concat
    [
      (match x.auto_scaling_instances with
      | None -> []
      | Some v -> auto_scaling_instances_to_query (List.append path [ "AutoScalingInstances" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let auto_scaling_notification_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let scaling_activity_in_progress_fault_to_query path (x : scaling_activity_in_progress_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let update_placement_group_param_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_auto_scaling_group_type_to_query path (x : update_auto_scaling_group_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.default_cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "DefaultCooldown" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.health_check_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) v);
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> update_placement_group_param_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
    ]

let should_decrement_desired_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let terminate_instance_in_auto_scaling_group_type_to_query path
    (x : terminate_instance_in_auto_scaling_group_type) =
  List.concat
    [
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
    ]

let resource_in_use_fault_to_query path (x : resource_in_use_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let process_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let scaling_process_query_to_query path (x : scaling_process_query) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.scaling_processes with
      | None -> []
      | Some v -> process_names_to_query (List.append path [ "ScalingProcesses" ]) v);
    ]

let limit_exceeded_fault_to_query path (x : limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let start_instance_refresh_answer_to_query path (x : start_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let bake_time_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let int_percent100_to200_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let standby_instances_to_query path (x : standby_instances) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Terminate -> "Terminate" | Ignore -> "Ignore" | Wait -> "Wait")

let scale_in_protected_instances_to_query path (x : scale_in_protected_instances) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Refresh -> "Refresh" | Ignore -> "Ignore" | Wait -> "Wait")

let skip_matching_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let checkpoint_delay_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let non_zero_int_percent_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let checkpoint_percentages_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" non_zero_int_percent_to_query path
    xs

let refresh_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let int_percent_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let refresh_preferences_to_query path (x : refresh_preferences) =
  List.concat
    [
      (match x.min_healthy_percentage with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "MinHealthyPercentage" ]) v);
      (match x.instance_warmup with
      | None -> []
      | Some v -> refresh_instance_warmup_to_query (List.append path [ "InstanceWarmup" ]) v);
      (match x.checkpoint_percentages with
      | None -> []
      | Some v -> checkpoint_percentages_to_query (List.append path [ "CheckpointPercentages" ]) v);
      (match x.checkpoint_delay with
      | None -> []
      | Some v -> checkpoint_delay_to_query (List.append path [ "CheckpointDelay" ]) v);
      (match x.skip_matching with
      | None -> []
      | Some v -> skip_matching_to_query (List.append path [ "SkipMatching" ]) v);
      (match x.auto_rollback with
      | None -> []
      | Some v -> auto_rollback_to_query (List.append path [ "AutoRollback" ]) v);
      (match x.scale_in_protected_instances with
      | None -> []
      | Some v ->
          scale_in_protected_instances_to_query (List.append path [ "ScaleInProtectedInstances" ]) v);
      (match x.standby_instances with
      | None -> []
      | Some v -> standby_instances_to_query (List.append path [ "StandbyInstances" ]) v);
      (match x.alarm_specification with
      | None -> []
      | Some v -> alarm_specification_to_query (List.append path [ "AlarmSpecification" ]) v);
      (match x.max_healthy_percentage with
      | None -> []
      | Some v -> int_percent100_to200_to_query (List.append path [ "MaxHealthyPercentage" ]) v);
      (match x.bake_time with
      | None -> []
      | Some v -> bake_time_to_query (List.append path [ "BakeTime" ]) v);
    ]

let desired_configuration_to_query path (x : desired_configuration) =
  List.concat
    [
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
    ]

let refresh_strategy_to_query path (x : refresh_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Rolling -> "Rolling" | ReplaceRootVolume -> "ReplaceRootVolume")

let start_instance_refresh_type_to_query path (x : start_instance_refresh_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.strategy with
      | None -> []
      | Some v -> refresh_strategy_to_query (List.append path [ "Strategy" ]) v);
      (match x.desired_configuration with
      | None -> []
      | Some v -> desired_configuration_to_query (List.append path [ "DesiredConfiguration" ]) v);
      (match x.preferences with
      | None -> []
      | Some v -> refresh_preferences_to_query (List.append path [ "Preferences" ]) v);
    ]

let set_instance_protection_answer_to_query path _x = []

let protected_from_scale_in_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let set_instance_protection_query_to_query path (x : set_instance_protection_query) =
  List.concat
    [
      instance_ids_to_query (List.append path [ "InstanceIds" ]) x.instance_ids;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      protected_from_scale_in_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
    ]

let should_respect_grace_period_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let set_instance_health_query_to_query path (x : set_instance_health_query) =
  List.concat
    [
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      (match x.should_respect_grace_period with
      | None -> []
      | Some v ->
          should_respect_grace_period_to_query (List.append path [ "ShouldRespectGracePeriod" ]) v);
    ]

let honor_cooldown_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let set_desired_capacity_type_to_query path (x : set_desired_capacity_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      auto_scaling_group_desired_capacity_to_query
        (List.append path [ "DesiredCapacity" ])
        x.desired_capacity;
      (match x.honor_cooldown with
      | None -> []
      | Some v -> honor_cooldown_to_query (List.append path [ "HonorCooldown" ]) v);
    ]

let irreversible_instance_refresh_fault_to_query path (x : irreversible_instance_refresh_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let rollback_instance_refresh_answer_to_query path (x : rollback_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let rollback_instance_refresh_type_to_query path (x : rollback_instance_refresh_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let record_lifecycle_action_heartbeat_answer_to_query path _x = []

let lifecycle_action_token_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let record_lifecycle_action_heartbeat_type_to_query path
    (x : record_lifecycle_action_heartbeat_type) =
  List.concat
    [
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
      resource_name_to_query (List.append path [ "AutoScalingGroupName" ]) x.auto_scaling_group_name;
      (match x.lifecycle_action_token with
      | None -> []
      | Some v -> lifecycle_action_token_to_query (List.append path [ "LifecycleActionToken" ]) v);
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
    ]

let put_warm_pool_answer_to_query path _x = []

let put_warm_pool_type_to_query path (x : put_warm_pool_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.max_group_prepared_capacity with
      | None -> []
      | Some v ->
          max_group_prepared_capacity_to_query (List.append path [ "MaxGroupPreparedCapacity" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> warm_pool_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.pool_state with
      | None -> []
      | Some v -> warm_pool_state_to_query (List.append path [ "PoolState" ]) v);
      (match x.instance_reuse_policy with
      | None -> []
      | Some v -> instance_reuse_policy_to_query (List.append path [ "InstanceReusePolicy" ]) v);
    ]

let put_scheduled_update_group_action_type_to_query path
    (x : put_scheduled_update_group_action_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
      (match x.time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "Time" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
    ]

let policy_arn_type_to_query path (x : policy_arn_type) =
  List.concat
    [
      (match x.policy_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "PolicyARN" ]) v);
      (match x.alarms with
      | None -> []
      | Some v -> alarms_to_query (List.append path [ "Alarms" ]) v);
    ]

let predictive_scaling_max_capacity_buffer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let predictive_scaling_max_capacity_breach_behavior_to_query path
    (x : predictive_scaling_max_capacity_breach_behavior) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | HonorMaxCapacity -> "HonorMaxCapacity"
    | IncreaseMaxCapacity -> "IncreaseMaxCapacity")

let predictive_scaling_scheduling_buffer_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let predictive_scaling_mode_to_query path (x : predictive_scaling_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ForecastAndScale -> "ForecastAndScale" | ForecastOnly -> "ForecastOnly")

let return_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let xml_string_metric_label_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_unit_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_metric_stat_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_to_query path (x : metric_dimension) =
  List.concat
    [
      metric_dimension_name_to_query (List.append path [ "Name" ]) x.name;
      metric_dimension_value_to_query (List.append path [ "Value" ]) x.value;
    ]

let metric_dimensions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_dimension_to_query path xs

let metric_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let metric_namespace_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_to_query path (x : metric) =
  List.concat
    [
      metric_namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
      (match x.dimensions with
      | None -> []
      | Some v -> metric_dimensions_to_query (List.append path [ "Dimensions" ]) v);
    ]

let metric_stat_to_query path (x : metric_stat) =
  List.concat
    [
      metric_to_query (List.append path [ "Metric" ]) x.metric;
      xml_string_metric_stat_to_query (List.append path [ "Stat" ]) x.stat;
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
    ]

let metric_data_query_to_query path (x : metric_data_query) =
  List.concat
    [
      xml_string_max_len255_to_query (List.append path [ "Id" ]) x.id;
      (match x.expression with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "Expression" ]) v);
      (match x.metric_stat with
      | None -> []
      | Some v -> metric_stat_to_query (List.append path [ "MetricStat" ]) v);
      (match x.label with
      | None -> []
      | Some v -> xml_string_metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.return_data with
      | None -> []
      | Some v -> return_data_to_query (List.append path [ "ReturnData" ]) v);
    ]

let metric_data_queries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_data_query_to_query path xs

let predictive_scaling_customized_capacity_metric_to_query path
    (x : predictive_scaling_customized_capacity_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predictive_scaling_customized_load_metric_to_query path
    (x : predictive_scaling_customized_load_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predictive_scaling_customized_scaling_metric_to_query path
    (x : predictive_scaling_customized_scaling_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predefined_load_metric_type_to_query path (x : predefined_load_metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ASGTotalCPUUtilization -> "ASGTotalCPUUtilization"
    | ASGTotalNetworkIn -> "ASGTotalNetworkIn"
    | ASGTotalNetworkOut -> "ASGTotalNetworkOut"
    | ALBTargetGroupRequestCount -> "ALBTargetGroupRequestCount")

let predictive_scaling_predefined_load_metric_to_query path
    (x : predictive_scaling_predefined_load_metric) =
  List.concat
    [
      predefined_load_metric_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
    ]

let predefined_scaling_metric_type_to_query path (x : predefined_scaling_metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ASGAverageCPUUtilization -> "ASGAverageCPUUtilization"
    | ASGAverageNetworkIn -> "ASGAverageNetworkIn"
    | ASGAverageNetworkOut -> "ASGAverageNetworkOut"
    | ALBRequestCountPerTarget -> "ALBRequestCountPerTarget")

let predictive_scaling_predefined_scaling_metric_to_query path
    (x : predictive_scaling_predefined_scaling_metric) =
  List.concat
    [
      predefined_scaling_metric_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
    ]

let predefined_metric_pair_type_to_query path (x : predefined_metric_pair_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ASGCPUUtilization -> "ASGCPUUtilization"
    | ASGNetworkIn -> "ASGNetworkIn"
    | ASGNetworkOut -> "ASGNetworkOut"
    | ALBRequestCount -> "ALBRequestCount")

let predictive_scaling_predefined_metric_pair_to_query path
    (x : predictive_scaling_predefined_metric_pair) =
  List.concat
    [
      predefined_metric_pair_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
    ]

let metric_scale_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let predictive_scaling_metric_specification_to_query path
    (x : predictive_scaling_metric_specification) =
  List.concat
    [
      metric_scale_to_query (List.append path [ "TargetValue" ]) x.target_value;
      (match x.predefined_metric_pair_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_metric_pair_to_query
            (List.append path [ "PredefinedMetricPairSpecification" ])
            v);
      (match x.predefined_scaling_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_scaling_metric_to_query
            (List.append path [ "PredefinedScalingMetricSpecification" ])
            v);
      (match x.predefined_load_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_load_metric_to_query
            (List.append path [ "PredefinedLoadMetricSpecification" ])
            v);
      (match x.customized_scaling_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_scaling_metric_to_query
            (List.append path [ "CustomizedScalingMetricSpecification" ])
            v);
      (match x.customized_load_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_load_metric_to_query
            (List.append path [ "CustomizedLoadMetricSpecification" ])
            v);
      (match x.customized_capacity_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_capacity_metric_to_query
            (List.append path [ "CustomizedCapacityMetricSpecification" ])
            v);
    ]

let predictive_scaling_metric_specifications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    predictive_scaling_metric_specification_to_query path xs

let predictive_scaling_configuration_to_query path (x : predictive_scaling_configuration) =
  List.concat
    [
      predictive_scaling_metric_specifications_to_query
        (List.append path [ "MetricSpecifications" ])
        x.metric_specifications;
      (match x.mode with
      | None -> []
      | Some v -> predictive_scaling_mode_to_query (List.append path [ "Mode" ]) v);
      (match x.scheduling_buffer_time with
      | None -> []
      | Some v ->
          predictive_scaling_scheduling_buffer_time_to_query
            (List.append path [ "SchedulingBufferTime" ])
            v);
      (match x.max_capacity_breach_behavior with
      | None -> []
      | Some v ->
          predictive_scaling_max_capacity_breach_behavior_to_query
            (List.append path [ "MaxCapacityBreachBehavior" ])
            v);
      (match x.max_capacity_buffer with
      | None -> []
      | Some v ->
          predictive_scaling_max_capacity_buffer_to_query
            (List.append path [ "MaxCapacityBuffer" ])
            v);
    ]

let scaling_policy_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let disable_scale_in_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let metric_granularity_in_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let target_tracking_metric_stat_to_query path (x : target_tracking_metric_stat) =
  List.concat
    [
      metric_to_query (List.append path [ "Metric" ]) x.metric;
      xml_string_metric_stat_to_query (List.append path [ "Stat" ]) x.stat;
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
    ]

let xml_string_max_len2047_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len64_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_tracking_metric_data_query_to_query path (x : target_tracking_metric_data_query) =
  List.concat
    [
      xml_string_max_len64_to_query (List.append path [ "Id" ]) x.id;
      (match x.expression with
      | None -> []
      | Some v -> xml_string_max_len2047_to_query (List.append path [ "Expression" ]) v);
      (match x.metric_stat with
      | None -> []
      | Some v -> target_tracking_metric_stat_to_query (List.append path [ "MetricStat" ]) v);
      (match x.label with
      | None -> []
      | Some v -> xml_string_metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
      (match x.return_data with
      | None -> []
      | Some v -> return_data_to_query (List.append path [ "ReturnData" ]) v);
    ]

let target_tracking_metric_data_queries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    target_tracking_metric_data_query_to_query path xs

let metric_statistic_to_query path (x : metric_statistic) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Average -> "Average"
    | Minimum -> "Minimum"
    | Maximum -> "Maximum"
    | SampleCount -> "SampleCount"
    | Sum -> "Sum")

let customized_metric_specification_to_query path (x : customized_metric_specification) =
  List.concat
    [
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> metric_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> metric_dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.statistic with
      | None -> []
      | Some v -> metric_statistic_to_query (List.append path [ "Statistic" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
      (match x.metrics with
      | None -> []
      | Some v -> target_tracking_metric_data_queries_to_query (List.append path [ "Metrics" ]) v);
    ]

let metric_type_to_query path (x : metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ASGAverageCPUUtilization -> "ASGAverageCPUUtilization"
    | ASGAverageNetworkIn -> "ASGAverageNetworkIn"
    | ASGAverageNetworkOut -> "ASGAverageNetworkOut"
    | ALBRequestCountPerTarget -> "ALBRequestCountPerTarget")

let predefined_metric_specification_to_query path (x : predefined_metric_specification) =
  List.concat
    [
      metric_type_to_query (List.append path [ "PredefinedMetricType" ]) x.predefined_metric_type;
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
    ]

let target_tracking_configuration_to_query path (x : target_tracking_configuration) =
  List.concat
    [
      (match x.predefined_metric_specification with
      | None -> []
      | Some v ->
          predefined_metric_specification_to_query
            (List.append path [ "PredefinedMetricSpecification" ])
            v);
      (match x.customized_metric_specification with
      | None -> []
      | Some v ->
          customized_metric_specification_to_query
            (List.append path [ "CustomizedMetricSpecification" ])
            v);
      metric_scale_to_query (List.append path [ "TargetValue" ]) x.target_value;
      (match x.disable_scale_in with
      | None -> []
      | Some v -> disable_scale_in_to_query (List.append path [ "DisableScaleIn" ]) v);
    ]

let estimated_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let policy_increment_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let step_adjustment_to_query path (x : step_adjustment) =
  List.concat
    [
      (match x.metric_interval_lower_bound with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricIntervalLowerBound" ]) v);
      (match x.metric_interval_upper_bound with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricIntervalUpperBound" ]) v);
      policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) x.scaling_adjustment;
    ]

let step_adjustments_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" step_adjustment_to_query path xs

let min_adjustment_magnitude_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let min_adjustment_step_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let put_scaling_policy_type_to_query path (x : put_scaling_policy_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      (match x.policy_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PolicyType" ]) v);
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
      (match x.min_adjustment_step with
      | None -> []
      | Some v -> min_adjustment_step_to_query (List.append path [ "MinAdjustmentStep" ]) v);
      (match x.min_adjustment_magnitude with
      | None -> []
      | Some v ->
          min_adjustment_magnitude_to_query (List.append path [ "MinAdjustmentMagnitude" ]) v);
      (match x.scaling_adjustment with
      | None -> []
      | Some v -> policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) v);
      (match x.cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "Cooldown" ]) v);
      (match x.metric_aggregation_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "MetricAggregationType" ]) v);
      (match x.step_adjustments with
      | None -> []
      | Some v -> step_adjustments_to_query (List.append path [ "StepAdjustments" ]) v);
      (match x.estimated_instance_warmup with
      | None -> []
      | Some v ->
          estimated_instance_warmup_to_query (List.append path [ "EstimatedInstanceWarmup" ]) v);
      (match x.target_tracking_configuration with
      | None -> []
      | Some v ->
          target_tracking_configuration_to_query
            (List.append path [ "TargetTrackingConfiguration" ])
            v);
      (match x.enabled with
      | None -> []
      | Some v -> scaling_policy_enabled_to_query (List.append path [ "Enabled" ]) v);
      (match x.predictive_scaling_configuration with
      | None -> []
      | Some v ->
          predictive_scaling_configuration_to_query
            (List.append path [ "PredictiveScalingConfiguration" ])
            v);
    ]

let put_notification_configuration_type_to_query path (x : put_notification_configuration_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) x.topic_ar_n;
      auto_scaling_notification_types_to_query
        (List.append path [ "NotificationTypes" ])
        x.notification_types;
    ]

let put_lifecycle_hook_answer_to_query path _x = []

let lifecycle_action_result_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let heartbeat_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let notification_target_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let lifecycle_transition_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let put_lifecycle_hook_type_to_query path (x : put_lifecycle_hook_type) =
  List.concat
    [
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.lifecycle_transition with
      | None -> []
      | Some v -> lifecycle_transition_to_query (List.append path [ "LifecycleTransition" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
    ]

let idempotent_parameter_mismatch_error_to_query path (x : idempotent_parameter_mismatch_error) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Message" ]) v);
    ]

let launch_instances_error_to_query path (x : launch_instances_error) =
  List.concat
    [
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      (match x.market_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "MarketType" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SubnetId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      (match x.error_code with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "ErrorCode" ]) v);
      (match x.error_message with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ErrorMessage" ]) v);
    ]

let launch_instances_errors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_instances_error_to_query path
    xs

let instance_collection_to_query path (x : instance_collection) =
  List.concat
    [
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      (match x.market_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "MarketType" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SubnetId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]

let instance_collections_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_collection_to_query path xs

let client_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_instances_result_to_query path (x : launch_instances_result) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.client_token with
      | None -> []
      | Some v -> client_token_to_query (List.append path [ "ClientToken" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instance_collections_to_query (List.append path [ "Instances" ]) v);
      (match x.errors with
      | None -> []
      | Some v -> launch_instances_errors_to_query (List.append path [ "Errors" ]) v);
    ]

let retry_strategy_to_query path (x : retry_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RETRY_WITH_GROUP_CONFIGURATION -> "retry-with-group-configuration"
    | NONE -> "none")

let subnet_ids_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let availability_zone_ids_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let availability_zones_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let requested_capacity_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let launch_instances_request_to_query path (x : launch_instances_request) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      requested_capacity_to_query (List.append path [ "RequestedCapacity" ]) x.requested_capacity;
      client_token_to_query (List.append path [ "ClientToken" ]) x.client_token;
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_limit1_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v ->
          availability_zone_ids_limit1_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.subnet_ids with
      | None -> []
      | Some v -> subnet_ids_limit1_to_query (List.append path [ "SubnetIds" ]) v);
      (match x.retry_strategy with
      | None -> []
      | Some v -> retry_strategy_to_query (List.append path [ "RetryStrategy" ]) v);
    ]

let predictive_scaling_forecast_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_scale_to_query path xs

let predictive_scaling_forecast_timestamps_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" timestamp_type_to_query path xs

let capacity_forecast_to_query path (x : capacity_forecast) =
  List.concat
    [
      predictive_scaling_forecast_timestamps_to_query
        (List.append path [ "Timestamps" ])
        x.timestamps;
      predictive_scaling_forecast_values_to_query (List.append path [ "Values" ]) x.values;
    ]

let load_forecast_to_query path (x : load_forecast) =
  List.concat
    [
      predictive_scaling_forecast_timestamps_to_query
        (List.append path [ "Timestamps" ])
        x.timestamps;
      predictive_scaling_forecast_values_to_query (List.append path [ "Values" ]) x.values;
      predictive_scaling_metric_specification_to_query
        (List.append path [ "MetricSpecification" ])
        x.metric_specification;
    ]

let load_forecasts_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_forecast_to_query path xs

let get_predictive_scaling_forecast_answer_to_query path
    (x : get_predictive_scaling_forecast_answer) =
  List.concat
    [
      load_forecasts_to_query (List.append path [ "LoadForecast" ]) x.load_forecast;
      capacity_forecast_to_query (List.append path [ "CapacityForecast" ]) x.capacity_forecast;
      timestamp_type_to_query (List.append path [ "UpdateTime" ]) x.update_time;
    ]

let get_predictive_scaling_forecast_type_to_query path (x : get_predictive_scaling_forecast_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      timestamp_type_to_query (List.append path [ "StartTime" ]) x.start_time;
      timestamp_type_to_query (List.append path [ "EndTime" ]) x.end_time;
    ]

let exit_standby_answer_to_query path (x : exit_standby_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let exit_standby_query_to_query path (x : exit_standby_query) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let execute_policy_type_to_query path (x : execute_policy_type) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      resource_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      (match x.honor_cooldown with
      | None -> []
      | Some v -> honor_cooldown_to_query (List.append path [ "HonorCooldown" ]) v);
      (match x.metric_value with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricValue" ]) v);
      (match x.breach_threshold with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "BreachThreshold" ]) v);
    ]

let enter_standby_answer_to_query path (x : enter_standby_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let enter_standby_query_to_query path (x : enter_standby_query) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
    ]

let metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let enable_metrics_collection_query_to_query path (x : enable_metrics_collection_query) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.metrics with
      | None -> []
      | Some v -> metrics_to_query (List.append path [ "Metrics" ]) v);
      xml_string_max_len255_to_query (List.append path [ "Granularity" ]) x.granularity;
    ]

let disable_metrics_collection_query_to_query path (x : disable_metrics_collection_query) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.metrics with
      | None -> []
      | Some v -> metrics_to_query (List.append path [ "Metrics" ]) v);
    ]

let detach_traffic_sources_result_type_to_query path _x = []

let detach_traffic_sources_type_to_query path (x : detach_traffic_sources_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      traffic_sources_to_query (List.append path [ "TrafficSources" ]) x.traffic_sources;
    ]

let detach_load_balancer_target_groups_result_type_to_query path _x = []

let detach_load_balancer_target_groups_type_to_query path
    (x : detach_load_balancer_target_groups_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) x.target_group_ar_ns;
    ]

let detach_load_balancers_result_type_to_query path _x = []

let detach_load_balancers_type_to_query path (x : detach_load_balancers_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
    ]

let detach_instances_answer_to_query path (x : detach_instances_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let detach_instances_query_to_query path (x : detach_instances_query) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
    ]

let invalid_next_token_to_query path (x : invalid_next_token) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let describe_warm_pool_answer_to_query path (x : describe_warm_pool_answer) =
  List.concat
    [
      (match x.warm_pool_configuration with
      | None -> []
      | Some v -> warm_pool_configuration_to_query (List.append path [ "WarmPoolConfiguration" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_warm_pool_type_to_query path (x : describe_warm_pool_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let traffic_source_state_to_query path (x : traffic_source_state) =
  List.concat
    [
      (match x.traffic_source with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "TrafficSource" ]) v);
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
      (match x.identifier with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Identifier" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Type" ]) v);
    ]

let traffic_source_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" traffic_source_state_to_query path
    xs

let describe_traffic_sources_response_to_query path (x : describe_traffic_sources_response) =
  List.concat
    [
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_source_states_to_query (List.append path [ "TrafficSources" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_traffic_sources_request_to_query path (x : describe_traffic_sources_request) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.traffic_source_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TrafficSourceType" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let describe_termination_policy_types_answer_to_query path
    (x : describe_termination_policy_types_answer) =
  List.concat
    [
      (match x.termination_policy_types with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicyTypes" ]) v);
    ]

let tags_type_to_query path (x : tags_type) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_description_list_to_query (List.append path [ "Tags" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_tags_type_to_query path (x : describe_tags_type) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let scheduled_update_group_action_to_query path (x : scheduled_update_group_action) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.scheduled_action_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ScheduledActionName" ]) v);
      (match x.scheduled_action_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ScheduledActionARN" ]) v);
      (match x.time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "Time" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
    ]

let scheduled_update_group_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    scheduled_update_group_action_to_query path xs

let scheduled_actions_type_to_query path (x : scheduled_actions_type) =
  List.concat
    [
      (match x.scheduled_update_group_actions with
      | None -> []
      | Some v ->
          scheduled_update_group_actions_to_query
            (List.append path [ "ScheduledUpdateGroupActions" ])
            v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let scheduled_action_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let describe_scheduled_actions_type_to_query path (x : describe_scheduled_actions_type) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.scheduled_action_names with
      | None -> []
      | Some v -> scheduled_action_names_to_query (List.append path [ "ScheduledActionNames" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let process_type_to_query path (x : process_type) =
  List.concat [ xml_string_max_len255_to_query (List.append path [ "ProcessName" ]) x.process_name ]

let processes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" process_type_to_query path xs

let processes_type_to_query path (x : processes_type) =
  List.concat
    [
      (match x.processes with
      | None -> []
      | Some v -> processes_to_query (List.append path [ "Processes" ]) v);
    ]

let include_deleted_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let describe_scaling_activities_type_to_query path (x : describe_scaling_activities_type) =
  List.concat
    [
      (match x.activity_ids with
      | None -> []
      | Some v -> activity_ids_to_query (List.append path [ "ActivityIds" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.include_deleted_groups with
      | None -> []
      | Some v -> include_deleted_groups_to_query (List.append path [ "IncludeDeletedGroups" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
    ]

let scaling_policy_to_query path (x : scaling_policy) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) v);
      (match x.policy_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "PolicyARN" ]) v);
      (match x.policy_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PolicyType" ]) v);
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
      (match x.min_adjustment_step with
      | None -> []
      | Some v -> min_adjustment_step_to_query (List.append path [ "MinAdjustmentStep" ]) v);
      (match x.min_adjustment_magnitude with
      | None -> []
      | Some v ->
          min_adjustment_magnitude_to_query (List.append path [ "MinAdjustmentMagnitude" ]) v);
      (match x.scaling_adjustment with
      | None -> []
      | Some v -> policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) v);
      (match x.cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "Cooldown" ]) v);
      (match x.step_adjustments with
      | None -> []
      | Some v -> step_adjustments_to_query (List.append path [ "StepAdjustments" ]) v);
      (match x.metric_aggregation_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "MetricAggregationType" ]) v);
      (match x.estimated_instance_warmup with
      | None -> []
      | Some v ->
          estimated_instance_warmup_to_query (List.append path [ "EstimatedInstanceWarmup" ]) v);
      (match x.alarms with
      | None -> []
      | Some v -> alarms_to_query (List.append path [ "Alarms" ]) v);
      (match x.target_tracking_configuration with
      | None -> []
      | Some v ->
          target_tracking_configuration_to_query
            (List.append path [ "TargetTrackingConfiguration" ])
            v);
      (match x.enabled with
      | None -> []
      | Some v -> scaling_policy_enabled_to_query (List.append path [ "Enabled" ]) v);
      (match x.predictive_scaling_configuration with
      | None -> []
      | Some v ->
          predictive_scaling_configuration_to_query
            (List.append path [ "PredictiveScalingConfiguration" ])
            v);
    ]

let scaling_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scaling_policy_to_query path xs

let policies_type_to_query path (x : policies_type) =
  List.concat
    [
      (match x.scaling_policies with
      | None -> []
      | Some v -> scaling_policies_to_query (List.append path [ "ScalingPolicies" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let policy_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len64_to_query path
    xs

let policy_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_to_query path xs

let describe_policies_type_to_query path (x : describe_policies_type) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.policy_names with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "PolicyNames" ]) v);
      (match x.policy_types with
      | None -> []
      | Some v -> policy_types_to_query (List.append path [ "PolicyTypes" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let notification_configuration_to_query path (x : notification_configuration) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.topic_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) v);
      (match x.notification_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "NotificationType" ]) v);
    ]

let notification_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" notification_configuration_to_query
    path xs

let describe_notification_configurations_answer_to_query path
    (x : describe_notification_configurations_answer) =
  List.concat
    [
      notification_configurations_to_query
        (List.append path [ "NotificationConfigurations" ])
        x.notification_configurations;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_notification_configurations_type_to_query path
    (x : describe_notification_configurations_type) =
  List.concat
    [
      (match x.auto_scaling_group_names with
      | None -> []
      | Some v -> auto_scaling_group_names_to_query (List.append path [ "AutoScalingGroupNames" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let metric_granularity_type_to_query path (x : metric_granularity_type) =
  List.concat
    [
      (match x.granularity with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Granularity" ]) v);
    ]

let metric_granularity_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_granularity_type_to_query
    path xs

let metric_collection_type_to_query path (x : metric_collection_type) =
  List.concat
    [
      (match x.metric with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Metric" ]) v);
    ]

let metric_collection_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_collection_type_to_query path
    xs

let describe_metric_collection_types_answer_to_query path
    (x : describe_metric_collection_types_answer) =
  List.concat
    [
      (match x.metrics with
      | None -> []
      | Some v -> metric_collection_types_to_query (List.append path [ "Metrics" ]) v);
      (match x.granularities with
      | None -> []
      | Some v -> metric_granularity_types_to_query (List.append path [ "Granularities" ]) v);
    ]

let load_balancer_target_group_state_to_query path (x : load_balancer_target_group_state) =
  List.concat
    [
      (match x.load_balancer_target_group_ar_n with
      | None -> []
      | Some v ->
          xml_string_max_len511_to_query (List.append path [ "LoadBalancerTargetGroupARN" ]) v);
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
    ]

let load_balancer_target_group_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    load_balancer_target_group_state_to_query path xs

let describe_load_balancer_target_groups_response_to_query path
    (x : describe_load_balancer_target_groups_response) =
  List.concat
    [
      (match x.load_balancer_target_groups with
      | None -> []
      | Some v ->
          load_balancer_target_group_states_to_query
            (List.append path [ "LoadBalancerTargetGroups" ])
            v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_load_balancer_target_groups_request_to_query path
    (x : describe_load_balancer_target_groups_request) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let load_balancer_state_to_query path (x : load_balancer_state) =
  List.concat
    [
      (match x.load_balancer_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LoadBalancerName" ]) v);
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
    ]

let load_balancer_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_state_to_query path xs

let describe_load_balancers_response_to_query path (x : describe_load_balancers_response) =
  List.concat
    [
      (match x.load_balancers with
      | None -> []
      | Some v -> load_balancer_states_to_query (List.append path [ "LoadBalancers" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_load_balancers_request_to_query path (x : describe_load_balancers_request) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let describe_lifecycle_hook_types_answer_to_query path (x : describe_lifecycle_hook_types_answer) =
  List.concat
    [
      (match x.lifecycle_hook_types with
      | None -> []
      | Some v ->
          auto_scaling_notification_types_to_query (List.append path [ "LifecycleHookTypes" ]) v);
    ]

let global_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let lifecycle_hook_to_query path (x : lifecycle_hook) =
  List.concat
    [
      (match x.lifecycle_hook_name with
      | None -> []
      | Some v -> ascii_string_max_len255_to_query (List.append path [ "LifecycleHookName" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.lifecycle_transition with
      | None -> []
      | Some v -> lifecycle_transition_to_query (List.append path [ "LifecycleTransition" ]) v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.global_timeout with
      | None -> []
      | Some v -> global_timeout_to_query (List.append path [ "GlobalTimeout" ]) v);
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
    ]

let lifecycle_hooks_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" lifecycle_hook_to_query path xs

let describe_lifecycle_hooks_answer_to_query path (x : describe_lifecycle_hooks_answer) =
  List.concat
    [
      (match x.lifecycle_hooks with
      | None -> []
      | Some v -> lifecycle_hooks_to_query (List.append path [ "LifecycleHooks" ]) v);
    ]

let lifecycle_hook_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ascii_string_max_len255_to_query
    path xs

let describe_lifecycle_hooks_type_to_query path (x : describe_lifecycle_hooks_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.lifecycle_hook_names with
      | None -> []
      | Some v -> lifecycle_hook_names_to_query (List.append path [ "LifecycleHookNames" ]) v);
    ]

let instance_metadata_endpoint_state_to_query path (x : instance_metadata_endpoint_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Disabled -> "disabled" | Enabled -> "enabled")

let instance_metadata_http_put_response_hop_limit_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_metadata_http_tokens_state_to_query path (x : instance_metadata_http_tokens_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Optional -> "optional" | Required -> "required")

let instance_metadata_options_to_query path (x : instance_metadata_options) =
  List.concat
    [
      (match x.http_tokens with
      | None -> []
      | Some v -> instance_metadata_http_tokens_state_to_query (List.append path [ "HttpTokens" ]) v);
      (match x.http_put_response_hop_limit with
      | None -> []
      | Some v ->
          instance_metadata_http_put_response_hop_limit_to_query
            (List.append path [ "HttpPutResponseHopLimit" ])
            v);
      (match x.http_endpoint with
      | None -> []
      | Some v -> instance_metadata_endpoint_state_to_query (List.append path [ "HttpEndpoint" ]) v);
    ]

let ebs_optimized_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let spot_price_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let monitoring_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let instance_monitoring_to_query path (x : instance_monitoring) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> monitoring_enabled_to_query (List.append path [ "Enabled" ]) v);
    ]

let no_device_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let block_device_ebs_throughput_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let block_device_ebs_encrypted_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let block_device_ebs_iops_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let block_device_ebs_delete_on_termination_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let block_device_ebs_volume_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let block_device_ebs_volume_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let ebs_to_query path (x : ebs) =
  List.concat
    [
      (match x.snapshot_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SnapshotId" ]) v);
      (match x.volume_size with
      | None -> []
      | Some v -> block_device_ebs_volume_size_to_query (List.append path [ "VolumeSize" ]) v);
      (match x.volume_type with
      | None -> []
      | Some v -> block_device_ebs_volume_type_to_query (List.append path [ "VolumeType" ]) v);
      (match x.delete_on_termination with
      | None -> []
      | Some v ->
          block_device_ebs_delete_on_termination_to_query
            (List.append path [ "DeleteOnTermination" ])
            v);
      (match x.iops with
      | None -> []
      | Some v -> block_device_ebs_iops_to_query (List.append path [ "Iops" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> block_device_ebs_encrypted_to_query (List.append path [ "Encrypted" ]) v);
      (match x.throughput with
      | None -> []
      | Some v -> block_device_ebs_throughput_to_query (List.append path [ "Throughput" ]) v);
    ]

let block_device_mapping_to_query path (x : block_device_mapping) =
  List.concat
    [
      (match x.virtual_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "VirtualName" ]) v);
      xml_string_max_len255_to_query (List.append path [ "DeviceName" ]) x.device_name;
      (match x.ebs with None -> [] | Some v -> ebs_to_query (List.append path [ "Ebs" ]) v);
      (match x.no_device with
      | None -> []
      | Some v -> no_device_to_query (List.append path [ "NoDevice" ]) v);
    ]

let block_device_mappings_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" block_device_mapping_to_query path
    xs

let xml_string_user_data_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let classic_link_vpc_security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let launch_configuration_to_query path (x : launch_configuration) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
      (match x.launch_configuration_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "LaunchConfigurationARN" ]) v);
      xml_string_max_len255_to_query (List.append path [ "ImageId" ]) x.image_id;
      (match x.key_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KeyName" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.classic_link_vpc_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ClassicLinkVPCId" ]) v);
      (match x.classic_link_vpc_security_groups with
      | None -> []
      | Some v ->
          classic_link_vpc_security_groups_to_query
            (List.append path [ "ClassicLinkVPCSecurityGroups" ])
            v);
      (match x.user_data with
      | None -> []
      | Some v -> xml_string_user_data_to_query (List.append path [ "UserData" ]) v);
      xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) x.instance_type;
      (match x.kernel_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KernelId" ]) v);
      (match x.ramdisk_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RamdiskId" ]) v);
      (match x.block_device_mappings with
      | None -> []
      | Some v -> block_device_mappings_to_query (List.append path [ "BlockDeviceMappings" ]) v);
      (match x.instance_monitoring with
      | None -> []
      | Some v -> instance_monitoring_to_query (List.append path [ "InstanceMonitoring" ]) v);
      (match x.spot_price with
      | None -> []
      | Some v -> spot_price_to_query (List.append path [ "SpotPrice" ]) v);
      (match x.iam_instance_profile with
      | None -> []
      | Some v -> xml_string_max_len1600_to_query (List.append path [ "IamInstanceProfile" ]) v);
      timestamp_type_to_query (List.append path [ "CreatedTime" ]) x.created_time;
      (match x.ebs_optimized with
      | None -> []
      | Some v -> ebs_optimized_to_query (List.append path [ "EbsOptimized" ]) v);
      (match x.associate_public_ip_address with
      | None -> []
      | Some v ->
          associate_public_ip_address_to_query (List.append path [ "AssociatePublicIpAddress" ]) v);
      (match x.placement_tenancy with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PlacementTenancy" ]) v);
      (match x.metadata_options with
      | None -> []
      | Some v -> instance_metadata_options_to_query (List.append path [ "MetadataOptions" ]) v);
    ]

let launch_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_configuration_to_query path
    xs

let launch_configurations_type_to_query path (x : launch_configurations_type) =
  List.concat
    [
      launch_configurations_to_query
        (List.append path [ "LaunchConfigurations" ])
        x.launch_configurations;
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let launch_configuration_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let launch_configuration_names_type_to_query path (x : launch_configuration_names_type) =
  List.concat
    [
      (match x.launch_configuration_names with
      | None -> []
      | Some v ->
          launch_configuration_names_to_query (List.append path [ "LaunchConfigurationNames" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let instances_to_update_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_refresh_warm_pool_progress_to_query path (x : instance_refresh_warm_pool_progress) =
  List.concat
    [
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
    ]

let instance_refresh_live_pool_progress_to_query path (x : instance_refresh_live_pool_progress) =
  List.concat
    [
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
    ]

let instance_refresh_progress_details_to_query path (x : instance_refresh_progress_details) =
  List.concat
    [
      (match x.live_pool_progress with
      | None -> []
      | Some v ->
          instance_refresh_live_pool_progress_to_query (List.append path [ "LivePoolProgress" ]) v);
      (match x.warm_pool_progress with
      | None -> []
      | Some v ->
          instance_refresh_warm_pool_progress_to_query (List.append path [ "WarmPoolProgress" ]) v);
    ]

let rollback_details_to_query path (x : rollback_details) =
  List.concat
    [
      (match x.rollback_reason with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "RollbackReason" ]) v);
      (match x.rollback_start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "RollbackStartTime" ]) v);
      (match x.percentage_complete_on_rollback with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageCompleteOnRollback" ]) v);
      (match x.instances_to_update_on_rollback with
      | None -> []
      | Some v ->
          instances_to_update_to_query (List.append path [ "InstancesToUpdateOnRollback" ]) v);
      (match x.progress_details_on_rollback with
      | None -> []
      | Some v ->
          instance_refresh_progress_details_to_query
            (List.append path [ "ProgressDetailsOnRollback" ])
            v);
    ]

let instance_refresh_status_to_query path (x : instance_refresh_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Pending -> "Pending"
    | InProgress -> "InProgress"
    | Successful -> "Successful"
    | Failed -> "Failed"
    | Cancelling -> "Cancelling"
    | Cancelled -> "Cancelled"
    | RollbackInProgress -> "RollbackInProgress"
    | RollbackFailed -> "RollbackFailed"
    | RollbackSuccessful -> "RollbackSuccessful"
    | Baking -> "Baking")

let instance_refresh_to_query path (x : instance_refresh) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> instance_refresh_status_to_query (List.append path [ "Status" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "StatusReason" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
      (match x.progress_details with
      | None -> []
      | Some v ->
          instance_refresh_progress_details_to_query (List.append path [ "ProgressDetails" ]) v);
      (match x.preferences with
      | None -> []
      | Some v -> refresh_preferences_to_query (List.append path [ "Preferences" ]) v);
      (match x.desired_configuration with
      | None -> []
      | Some v -> desired_configuration_to_query (List.append path [ "DesiredConfiguration" ]) v);
      (match x.rollback_details with
      | None -> []
      | Some v -> rollback_details_to_query (List.append path [ "RollbackDetails" ]) v);
      (match x.strategy with
      | None -> []
      | Some v -> refresh_strategy_to_query (List.append path [ "Strategy" ]) v);
    ]

let instance_refreshes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_refresh_to_query path xs

let describe_instance_refreshes_answer_to_query path (x : describe_instance_refreshes_answer) =
  List.concat
    [
      (match x.instance_refreshes with
      | None -> []
      | Some v -> instance_refreshes_to_query (List.append path [ "InstanceRefreshes" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let instance_refresh_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let describe_instance_refreshes_type_to_query path (x : describe_instance_refreshes_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_refresh_ids with
      | None -> []
      | Some v -> instance_refresh_ids_to_query (List.append path [ "InstanceRefreshIds" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let describe_auto_scaling_notification_types_answer_to_query path
    (x : describe_auto_scaling_notification_types_answer) =
  List.concat
    [
      (match x.auto_scaling_notification_types with
      | None -> []
      | Some v ->
          auto_scaling_notification_types_to_query
            (List.append path [ "AutoScalingNotificationTypes" ])
            v);
    ]

let describe_auto_scaling_instances_type_to_query path (x : describe_auto_scaling_instances_type) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_adjustment_types_answer_to_query path (x : describe_adjustment_types_answer) =
  List.concat
    [
      (match x.adjustment_types with
      | None -> []
      | Some v -> adjustment_types_to_query (List.append path [ "AdjustmentTypes" ]) v);
    ]

let number_of_launch_configurations_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let number_of_auto_scaling_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_number_of_launch_configurations_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_number_of_auto_scaling_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_account_limits_answer_to_query path (x : describe_account_limits_answer) =
  List.concat
    [
      (match x.max_number_of_auto_scaling_groups with
      | None -> []
      | Some v ->
          max_number_of_auto_scaling_groups_to_query
            (List.append path [ "MaxNumberOfAutoScalingGroups" ])
            v);
      (match x.max_number_of_launch_configurations with
      | None -> []
      | Some v ->
          max_number_of_launch_configurations_to_query
            (List.append path [ "MaxNumberOfLaunchConfigurations" ])
            v);
      (match x.number_of_auto_scaling_groups with
      | None -> []
      | Some v ->
          number_of_auto_scaling_groups_to_query
            (List.append path [ "NumberOfAutoScalingGroups" ])
            v);
      (match x.number_of_launch_configurations with
      | None -> []
      | Some v ->
          number_of_launch_configurations_to_query
            (List.append path [ "NumberOfLaunchConfigurations" ])
            v);
    ]

let delete_warm_pool_answer_to_query path _x = []
let force_delete_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let delete_warm_pool_type_to_query path (x : delete_warm_pool_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.force_delete with
      | None -> []
      | Some v -> force_delete_to_query (List.append path [ "ForceDelete" ]) v);
    ]

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.resource_id with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceId" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceType" ]) v);
      tag_key_to_query (List.append path [ "Key" ]) x.key;
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
      (match x.propagate_at_launch with
      | None -> []
      | Some v -> propagate_at_launch_to_query (List.append path [ "PropagateAtLaunch" ]) v);
    ]

let tags_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let delete_tags_type_to_query path (x : delete_tags_type) =
  List.concat [ tags_to_query (List.append path [ "Tags" ]) x.tags ]

let delete_scheduled_action_type_to_query path (x : delete_scheduled_action_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
    ]

let delete_policy_type_to_query path (x : delete_policy_type) =
  List.concat
    [
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      resource_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
    ]

let delete_notification_configuration_type_to_query path
    (x : delete_notification_configuration_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) x.topic_ar_n;
    ]

let delete_lifecycle_hook_answer_to_query path _x = []

let delete_lifecycle_hook_type_to_query path (x : delete_lifecycle_hook_type) =
  List.concat
    [
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let launch_configuration_name_type_to_query path (x : launch_configuration_name_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
    ]

let delete_auto_scaling_group_type_to_query path (x : delete_auto_scaling_group_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.force_delete with
      | None -> []
      | Some v -> force_delete_to_query (List.append path [ "ForceDelete" ]) v);
    ]

let create_or_update_tags_type_to_query path (x : create_or_update_tags_type) =
  List.concat [ tags_to_query (List.append path [ "Tags" ]) x.tags ]

let create_launch_configuration_type_to_query path (x : create_launch_configuration_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      (match x.key_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KeyName" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.classic_link_vpc_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ClassicLinkVPCId" ]) v);
      (match x.classic_link_vpc_security_groups with
      | None -> []
      | Some v ->
          classic_link_vpc_security_groups_to_query
            (List.append path [ "ClassicLinkVPCSecurityGroups" ])
            v);
      (match x.user_data with
      | None -> []
      | Some v -> xml_string_user_data_to_query (List.append path [ "UserData" ]) v);
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      (match x.kernel_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KernelId" ]) v);
      (match x.ramdisk_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RamdiskId" ]) v);
      (match x.block_device_mappings with
      | None -> []
      | Some v -> block_device_mappings_to_query (List.append path [ "BlockDeviceMappings" ]) v);
      (match x.instance_monitoring with
      | None -> []
      | Some v -> instance_monitoring_to_query (List.append path [ "InstanceMonitoring" ]) v);
      (match x.spot_price with
      | None -> []
      | Some v -> spot_price_to_query (List.append path [ "SpotPrice" ]) v);
      (match x.iam_instance_profile with
      | None -> []
      | Some v -> xml_string_max_len1600_to_query (List.append path [ "IamInstanceProfile" ]) v);
      (match x.ebs_optimized with
      | None -> []
      | Some v -> ebs_optimized_to_query (List.append path [ "EbsOptimized" ]) v);
      (match x.associate_public_ip_address with
      | None -> []
      | Some v ->
          associate_public_ip_address_to_query (List.append path [ "AssociatePublicIpAddress" ]) v);
      (match x.placement_tenancy with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PlacementTenancy" ]) v);
      (match x.metadata_options with
      | None -> []
      | Some v -> instance_metadata_options_to_query (List.append path [ "MetadataOptions" ]) v);
    ]

let lifecycle_hook_specification_to_query path (x : lifecycle_hook_specification) =
  List.concat
    [
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
      lifecycle_transition_to_query
        (List.append path [ "LifecycleTransition" ])
        x.lifecycle_transition;
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
    ]

let lifecycle_hook_specifications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    lifecycle_hook_specification_to_query path xs

let create_auto_scaling_group_type_to_query path (x : create_auto_scaling_group_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) x.min_size;
      auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) x.max_size;
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.default_cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "DefaultCooldown" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.load_balancer_names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) v);
      (match x.target_group_ar_ns with
      | None -> []
      | Some v -> target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) v);
      (match x.health_check_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) v);
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.lifecycle_hook_specification_list with
      | None -> []
      | Some v ->
          lifecycle_hook_specifications_to_query
            (List.append path [ "LifecycleHookSpecificationList" ])
            v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_sources_to_query (List.append path [ "TrafficSources" ]) v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
    ]

let complete_lifecycle_action_answer_to_query path _x = []

let complete_lifecycle_action_type_to_query path (x : complete_lifecycle_action_type) =
  List.concat
    [
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
      resource_name_to_query (List.append path [ "AutoScalingGroupName" ]) x.auto_scaling_group_name;
      (match x.lifecycle_action_token with
      | None -> []
      | Some v -> lifecycle_action_token_to_query (List.append path [ "LifecycleActionToken" ]) v);
      lifecycle_action_result_to_query
        (List.append path [ "LifecycleActionResult" ])
        x.lifecycle_action_result;
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
    ]

let cancel_instance_refresh_answer_to_query path (x : cancel_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let boolean_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let cancel_instance_refresh_type_to_query path (x : cancel_instance_refresh_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.wait_for_transitioning_instances with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "WaitForTransitioningInstances" ]) v);
    ]

let failed_scheduled_update_group_action_request_to_query path
    (x : failed_scheduled_update_group_action_request) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
      (match x.error_code with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "ErrorCode" ]) v);
      (match x.error_message with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ErrorMessage" ]) v);
    ]

let failed_scheduled_update_group_action_requests_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    failed_scheduled_update_group_action_request_to_query path xs

let batch_put_scheduled_update_group_action_answer_to_query path
    (x : batch_put_scheduled_update_group_action_answer) =
  List.concat
    [
      (match x.failed_scheduled_update_group_actions with
      | None -> []
      | Some v ->
          failed_scheduled_update_group_action_requests_to_query
            (List.append path [ "FailedScheduledUpdateGroupActions" ])
            v);
    ]

let scheduled_update_group_action_request_to_query path (x : scheduled_update_group_action_request)
    =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
    ]

let scheduled_update_group_action_requests_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    scheduled_update_group_action_request_to_query path xs

let batch_put_scheduled_update_group_action_type_to_query path
    (x : batch_put_scheduled_update_group_action_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      scheduled_update_group_action_requests_to_query
        (List.append path [ "ScheduledUpdateGroupActions" ])
        x.scheduled_update_group_actions;
    ]

let batch_delete_scheduled_action_answer_to_query path (x : batch_delete_scheduled_action_answer) =
  List.concat
    [
      (match x.failed_scheduled_actions with
      | None -> []
      | Some v ->
          failed_scheduled_update_group_action_requests_to_query
            (List.append path [ "FailedScheduledActions" ])
            v);
    ]

let batch_delete_scheduled_action_type_to_query path (x : batch_delete_scheduled_action_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      scheduled_action_names_to_query
        (List.append path [ "ScheduledActionNames" ])
        x.scheduled_action_names;
    ]
