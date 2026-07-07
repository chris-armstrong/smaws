open Smaws_Lib.Json.SerializeHelpers
open Types

let wait_time_in_seconds_to_yojson = long_to_yojson

let minimum_healthy_hosts_per_zone_type_to_yojson (x : minimum_healthy_hosts_per_zone_type) =
  match x with FLEET_PERCENT -> `String "FLEET_PERCENT" | HOST_COUNT -> `String "HOST_COUNT"

let minimum_healthy_hosts_per_zone_value_to_yojson = int_to_yojson

let minimum_healthy_hosts_per_zone_to_yojson (x : minimum_healthy_hosts_per_zone) =
  assoc_to_yojson
    [
      ("value", option_to_yojson minimum_healthy_hosts_per_zone_value_to_yojson x.value);
      ("type", option_to_yojson minimum_healthy_hosts_per_zone_type_to_yojson x.type_);
    ]

let zonal_config_to_yojson (x : zonal_config) =
  assoc_to_yojson
    [
      ( "minimumHealthyHostsPerZone",
        option_to_yojson minimum_healthy_hosts_per_zone_to_yojson x.minimum_healthy_hosts_per_zone
      );
      ( "monitorDurationInSeconds",
        option_to_yojson wait_time_in_seconds_to_yojson x.monitor_duration_in_seconds );
      ( "firstZoneMonitorDurationInSeconds",
        option_to_yojson wait_time_in_seconds_to_yojson x.first_zone_monitor_duration_in_seconds );
    ]

let wait_time_in_mins_to_yojson = int_to_yojson
let version_id_to_yojson = string_to_yojson
let version_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson
let auto_scaling_group_name_to_yojson = string_to_yojson
let auto_scaling_group_hook_to_yojson = string_to_yojson

let auto_scaling_group_to_yojson (x : auto_scaling_group) =
  assoc_to_yojson
    [
      ("terminationHook", option_to_yojson auto_scaling_group_hook_to_yojson x.termination_hook);
      ("hook", option_to_yojson auto_scaling_group_hook_to_yojson x.hook);
      ("name", option_to_yojson auto_scaling_group_name_to_yojson x.name);
    ]

let auto_scaling_group_list_to_yojson tree = list_to_yojson auto_scaling_group_to_yojson tree

let update_deployment_group_output_to_yojson (x : update_deployment_group_output) =
  assoc_to_yojson
    [
      ( "hooksNotCleanedUp",
        option_to_yojson auto_scaling_group_list_to_yojson x.hooks_not_cleaned_up );
    ]

let application_name_to_yojson = string_to_yojson
let deployment_group_name_to_yojson = string_to_yojson
let deployment_config_name_to_yojson = string_to_yojson
let key_to_yojson = string_to_yojson

let ec2_tag_filter_type_to_yojson (x : ec2_tag_filter_type) =
  match x with
  | KEY_AND_VALUE -> `String "KEY_AND_VALUE"
  | VALUE_ONLY -> `String "VALUE_ONLY"
  | KEY_ONLY -> `String "KEY_ONLY"

let ec2_tag_filter_to_yojson (x : ec2_tag_filter) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson ec2_tag_filter_type_to_yojson x.type_);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Key", option_to_yojson key_to_yojson x.key);
    ]

let ec2_tag_filter_list_to_yojson tree = list_to_yojson ec2_tag_filter_to_yojson tree

let tag_filter_type_to_yojson (x : tag_filter_type) =
  match x with
  | KEY_AND_VALUE -> `String "KEY_AND_VALUE"
  | VALUE_ONLY -> `String "VALUE_ONLY"
  | KEY_ONLY -> `String "KEY_ONLY"

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson tag_filter_type_to_yojson x.type_);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Key", option_to_yojson key_to_yojson x.key);
    ]

let tag_filter_list_to_yojson tree = list_to_yojson tag_filter_to_yojson tree

let auto_scaling_group_name_list_to_yojson tree =
  list_to_yojson auto_scaling_group_name_to_yojson tree

let role_to_yojson = string_to_yojson
let trigger_name_to_yojson = string_to_yojson
let trigger_target_arn_to_yojson = string_to_yojson

let trigger_event_type_to_yojson (x : trigger_event_type) =
  match x with
  | INSTANCE_READY -> `String "InstanceReady"
  | INSTANCE_FAILURE -> `String "InstanceFailure"
  | INSTANCE_SUCCESS -> `String "InstanceSuccess"
  | INSTANCE_START -> `String "InstanceStart"
  | DEPLOYMENT_READY -> `String "DeploymentReady"
  | DEPLOYMENT_ROLLBACK -> `String "DeploymentRollback"
  | DEPLOYMENT_STOP -> `String "DeploymentStop"
  | DEPLOYMENT_FAILURE -> `String "DeploymentFailure"
  | DEPLOYMENT_SUCCESS -> `String "DeploymentSuccess"
  | DEPLOYMENT_START -> `String "DeploymentStart"

let trigger_event_type_list_to_yojson tree = list_to_yojson trigger_event_type_to_yojson tree

let trigger_config_to_yojson (x : trigger_config) =
  assoc_to_yojson
    [
      ("triggerEvents", option_to_yojson trigger_event_type_list_to_yojson x.trigger_events);
      ("triggerTargetArn", option_to_yojson trigger_target_arn_to_yojson x.trigger_target_arn);
      ("triggerName", option_to_yojson trigger_name_to_yojson x.trigger_name);
    ]

let trigger_config_list_to_yojson tree = list_to_yojson trigger_config_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let alarm_name_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson [ ("name", option_to_yojson alarm_name_to_yojson x.name) ]

let alarm_list_to_yojson tree = list_to_yojson alarm_to_yojson tree

let alarm_configuration_to_yojson (x : alarm_configuration) =
  assoc_to_yojson
    [
      ("alarms", option_to_yojson alarm_list_to_yojson x.alarms);
      ("ignorePollAlarmFailure", option_to_yojson boolean__to_yojson x.ignore_poll_alarm_failure);
      ("enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let auto_rollback_event_to_yojson (x : auto_rollback_event) =
  match x with
  | DEPLOYMENT_STOP_ON_REQUEST -> `String "DEPLOYMENT_STOP_ON_REQUEST"
  | DEPLOYMENT_STOP_ON_ALARM -> `String "DEPLOYMENT_STOP_ON_ALARM"
  | DEPLOYMENT_FAILURE -> `String "DEPLOYMENT_FAILURE"

let auto_rollback_events_list_to_yojson tree = list_to_yojson auto_rollback_event_to_yojson tree

let auto_rollback_configuration_to_yojson (x : auto_rollback_configuration) =
  assoc_to_yojson
    [
      ("events", option_to_yojson auto_rollback_events_list_to_yojson x.events);
      ("enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let outdated_instances_strategy_to_yojson (x : outdated_instances_strategy) =
  match x with Ignore -> `String "IGNORE" | Update -> `String "UPDATE"

let deployment_type_to_yojson (x : deployment_type) =
  match x with BLUE_GREEN -> `String "BLUE_GREEN" | IN_PLACE -> `String "IN_PLACE"

let deployment_option_to_yojson (x : deployment_option) =
  match x with
  | WITHOUT_TRAFFIC_CONTROL -> `String "WITHOUT_TRAFFIC_CONTROL"
  | WITH_TRAFFIC_CONTROL -> `String "WITH_TRAFFIC_CONTROL"

let deployment_style_to_yojson (x : deployment_style) =
  assoc_to_yojson
    [
      ("deploymentOption", option_to_yojson deployment_option_to_yojson x.deployment_option);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
    ]

let instance_action_to_yojson (x : instance_action) =
  match x with KEEP_ALIVE -> `String "KEEP_ALIVE" | TERMINATE -> `String "TERMINATE"

let duration_to_yojson = int_to_yojson

let blue_instance_termination_option_to_yojson (x : blue_instance_termination_option) =
  assoc_to_yojson
    [
      ( "terminationWaitTimeInMinutes",
        option_to_yojson duration_to_yojson x.termination_wait_time_in_minutes );
      ("action", option_to_yojson instance_action_to_yojson x.action);
    ]

let deployment_ready_action_to_yojson (x : deployment_ready_action) =
  match x with
  | STOP_DEPLOYMENT -> `String "STOP_DEPLOYMENT"
  | CONTINUE_DEPLOYMENT -> `String "CONTINUE_DEPLOYMENT"

let deployment_ready_option_to_yojson (x : deployment_ready_option) =
  assoc_to_yojson
    [
      ("waitTimeInMinutes", option_to_yojson duration_to_yojson x.wait_time_in_minutes);
      ("actionOnTimeout", option_to_yojson deployment_ready_action_to_yojson x.action_on_timeout);
    ]

let green_fleet_provisioning_action_to_yojson (x : green_fleet_provisioning_action) =
  match x with
  | COPY_AUTO_SCALING_GROUP -> `String "COPY_AUTO_SCALING_GROUP"
  | DISCOVER_EXISTING -> `String "DISCOVER_EXISTING"

let green_fleet_provisioning_option_to_yojson (x : green_fleet_provisioning_option) =
  assoc_to_yojson
    [ ("action", option_to_yojson green_fleet_provisioning_action_to_yojson x.action) ]

let blue_green_deployment_configuration_to_yojson (x : blue_green_deployment_configuration) =
  assoc_to_yojson
    [
      ( "greenFleetProvisioningOption",
        option_to_yojson green_fleet_provisioning_option_to_yojson x.green_fleet_provisioning_option
      );
      ( "deploymentReadyOption",
        option_to_yojson deployment_ready_option_to_yojson x.deployment_ready_option );
      ( "terminateBlueInstancesOnDeploymentSuccess",
        option_to_yojson blue_instance_termination_option_to_yojson
          x.terminate_blue_instances_on_deployment_success );
    ]

let elb_name_to_yojson = string_to_yojson

let elb_info_to_yojson (x : elb_info) =
  assoc_to_yojson [ ("name", option_to_yojson elb_name_to_yojson x.name) ]

let elb_info_list_to_yojson tree = list_to_yojson elb_info_to_yojson tree
let target_group_name_to_yojson = string_to_yojson

let target_group_info_to_yojson (x : target_group_info) =
  assoc_to_yojson [ ("name", option_to_yojson target_group_name_to_yojson x.name) ]

let target_group_info_list_to_yojson tree = list_to_yojson target_group_info_to_yojson tree
let listener_arn_to_yojson = string_to_yojson
let listener_arn_list_to_yojson tree = list_to_yojson listener_arn_to_yojson tree

let traffic_route_to_yojson (x : traffic_route) =
  assoc_to_yojson [ ("listenerArns", option_to_yojson listener_arn_list_to_yojson x.listener_arns) ]

let target_group_pair_info_to_yojson (x : target_group_pair_info) =
  assoc_to_yojson
    [
      ("testTrafficRoute", option_to_yojson traffic_route_to_yojson x.test_traffic_route);
      ("prodTrafficRoute", option_to_yojson traffic_route_to_yojson x.prod_traffic_route);
      ("targetGroups", option_to_yojson target_group_info_list_to_yojson x.target_groups);
    ]

let target_group_pair_info_list_to_yojson tree =
  list_to_yojson target_group_pair_info_to_yojson tree

let load_balancer_info_to_yojson (x : load_balancer_info) =
  assoc_to_yojson
    [
      ( "targetGroupPairInfoList",
        option_to_yojson target_group_pair_info_list_to_yojson x.target_group_pair_info_list );
      ( "targetGroupInfoList",
        option_to_yojson target_group_info_list_to_yojson x.target_group_info_list );
      ("elbInfoList", option_to_yojson elb_info_list_to_yojson x.elb_info_list);
    ]

let ec2_tag_set_list_to_yojson tree = list_to_yojson ec2_tag_filter_list_to_yojson tree

let ec2_tag_set_to_yojson (x : ec2_tag_set) =
  assoc_to_yojson
    [ ("ec2TagSetList", option_to_yojson ec2_tag_set_list_to_yojson x.ec2_tag_set_list) ]

let ecs_service_name_to_yojson = string_to_yojson
let ecs_cluster_name_to_yojson = string_to_yojson

let ecs_service_to_yojson (x : ecs_service) =
  assoc_to_yojson
    [
      ("clusterName", option_to_yojson ecs_cluster_name_to_yojson x.cluster_name);
      ("serviceName", option_to_yojson ecs_service_name_to_yojson x.service_name);
    ]

let ecs_service_list_to_yojson tree = list_to_yojson ecs_service_to_yojson tree
let on_premises_tag_set_list_to_yojson tree = list_to_yojson tag_filter_list_to_yojson tree

let on_premises_tag_set_to_yojson (x : on_premises_tag_set) =
  assoc_to_yojson
    [
      ( "onPremisesTagSetList",
        option_to_yojson on_premises_tag_set_list_to_yojson x.on_premises_tag_set_list );
    ]

let nullable_boolean_to_yojson = bool_to_yojson

let update_deployment_group_input_to_yojson (x : update_deployment_group_input) =
  assoc_to_yojson
    [
      ( "terminationHookEnabled",
        option_to_yojson nullable_boolean_to_yojson x.termination_hook_enabled );
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("serviceRoleArn", option_to_yojson role_to_yojson x.service_role_arn);
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ( "newDeploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.new_deployment_group_name );
      ( "currentDeploymentGroupName",
        Some (deployment_group_name_to_yojson x.current_deployment_group_name) );
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let message_to_yojson = string_to_yojson

let trigger_targets_limit_exceeded_exception_to_yojson
    (x : trigger_targets_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_set_list_limit_exceeded_exception_to_yojson (x : tag_set_list_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let lifecycle_hook_limit_exceeded_exception_to_yojson (x : lifecycle_hook_limit_exceeded_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_trigger_config_exception_to_yojson (x : invalid_trigger_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_traffic_routing_configuration_exception_to_yojson
    (x : invalid_traffic_routing_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_target_group_pair_exception_to_yojson (x : invalid_target_group_pair_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_role_exception_to_yojson (x : invalid_role_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_on_premises_tag_combination_exception_to_yojson
    (x : invalid_on_premises_tag_combination_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_load_balancer_info_exception_to_yojson (x : invalid_load_balancer_info_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ecs_service_exception_to_yojson (x : invalid_ecs_service_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ec2_tag_exception_to_yojson (x : invalid_ec2_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ec2_tag_combination_exception_to_yojson (x : invalid_ec2_tag_combination_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_style_exception_to_yojson (x : invalid_deployment_style_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_group_name_exception_to_yojson (x : invalid_deployment_group_name_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_config_name_exception_to_yojson
    (x : invalid_deployment_config_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_blue_green_deployment_configuration_exception_to_yojson
    (x : invalid_blue_green_deployment_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_auto_scaling_group_exception_to_yojson (x : invalid_auto_scaling_group_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_auto_rollback_config_exception_to_yojson (x : invalid_auto_rollback_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_application_name_exception_to_yojson (x : invalid_application_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_alarm_config_exception_to_yojson (x : invalid_alarm_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let ecs_service_mapping_limit_exceeded_exception_to_yojson
    (x : ecs_service_mapping_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_name_required_exception_to_yojson
    (x : deployment_group_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_does_not_exist_exception_to_yojson
    (x : deployment_group_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_already_exists_exception_to_yojson
    (x : deployment_group_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_does_not_exist_exception_to_yojson
    (x : deployment_config_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_name_required_exception_to_yojson (x : application_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_does_not_exist_exception_to_yojson (x : application_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let alarms_limit_exceeded_exception_to_yojson (x : alarms_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_application_input_to_yojson (x : update_application_input) =
  assoc_to_yojson
    [
      ("newApplicationName", option_to_yojson application_name_to_yojson x.new_application_name);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let application_already_exists_exception_to_yojson (x : application_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let untag_resource_output_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let tag_required_exception_to_yojson (x : tag_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_arn_required_exception_to_yojson (x : resource_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tags_to_add_exception_to_yojson (x : invalid_tags_to_add_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let arn_not_supported_exception_to_yojson (x : arn_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let unsupported_action_for_deployment_type_exception_to_yojson
    (x : unsupported_action_for_deployment_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let traffic_weight_to_yojson = double_to_yojson

let traffic_routing_type_to_yojson (x : traffic_routing_type) =
  match x with
  | AllAtOnce -> `String "AllAtOnce"
  | TimeBasedLinear -> `String "TimeBasedLinear"
  | TimeBasedCanary -> `String "TimeBasedCanary"

let percentage_to_yojson = int_to_yojson

let time_based_canary_to_yojson (x : time_based_canary) =
  assoc_to_yojson
    [
      ("canaryInterval", option_to_yojson wait_time_in_mins_to_yojson x.canary_interval);
      ("canaryPercentage", option_to_yojson percentage_to_yojson x.canary_percentage);
    ]

let time_based_linear_to_yojson (x : time_based_linear) =
  assoc_to_yojson
    [
      ("linearInterval", option_to_yojson wait_time_in_mins_to_yojson x.linear_interval);
      ("linearPercentage", option_to_yojson percentage_to_yojson x.linear_percentage);
    ]

let traffic_routing_config_to_yojson (x : traffic_routing_config) =
  assoc_to_yojson
    [
      ("timeBasedLinear", option_to_yojson time_based_linear_to_yojson x.time_based_linear);
      ("timeBasedCanary", option_to_yojson time_based_canary_to_yojson x.time_based_canary);
      ("type", option_to_yojson traffic_routing_type_to_yojson x.type_);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("end", option_to_yojson timestamp_to_yojson x.end_);
      ("start", option_to_yojson timestamp_to_yojson x.start);
    ]

let time_to_yojson = timestamp_epoch_seconds_to_yojson

let target_status_to_yojson (x : target_status) =
  match x with
  | READY -> `String "Ready"
  | UNKNOWN -> `String "Unknown"
  | SKIPPED -> `String "Skipped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let target_label_to_yojson (x : target_label) =
  match x with GREEN -> `String "Green" | BLUE -> `String "Blue"

let target_instances_to_yojson (x : target_instances) =
  assoc_to_yojson
    [
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ("tagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.tag_filters);
    ]

let target_id_to_yojson = string_to_yojson
let target_id_list_to_yojson tree = list_to_yojson target_id_to_yojson tree
let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let target_filter_name_to_yojson (x : target_filter_name) =
  match x with
  | SERVER_INSTANCE_LABEL -> `String "ServerInstanceLabel"
  | TARGET_STATUS -> `String "TargetStatus"

let target_filters_to_yojson tree =
  map_to_yojson target_filter_name_to_yojson filter_value_list_to_yojson tree

let target_arn_to_yojson = string_to_yojson
let tag_resource_output_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Key", option_to_yojson key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let tag_limit_exceeded_exception_to_yojson (x : tag_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let stop_status_to_yojson (x : stop_status) =
  match x with SUCCEEDED -> `String "Succeeded" | PENDING -> `String "Pending"

let stop_deployment_output_to_yojson (x : stop_deployment_output) =
  assoc_to_yojson
    [
      ("statusMessage", option_to_yojson message_to_yojson x.status_message);
      ("status", option_to_yojson stop_status_to_yojson x.status);
    ]

let deployment_id_to_yojson = string_to_yojson

let stop_deployment_input_to_yojson (x : stop_deployment_input) =
  assoc_to_yojson
    [
      ("autoRollbackEnabled", option_to_yojson nullable_boolean_to_yojson x.auto_rollback_enabled);
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let invalid_deployment_id_exception_to_yojson (x : invalid_deployment_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_id_required_exception_to_yojson (x : deployment_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_does_not_exist_exception_to_yojson (x : deployment_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_already_completed_exception_to_yojson (x : deployment_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let sort_order_to_yojson (x : sort_order) =
  match x with Descending -> `String "descending" | Ascending -> `String "ascending"

let skip_wait_time_for_instance_termination_input_to_yojson
    (x : skip_wait_time_for_instance_termination_input) =
  assoc_to_yojson [ ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id) ]

let deployment_not_started_exception_to_yojson (x : deployment_not_started_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let script_name_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let bundle_type_to_yojson (x : bundle_type) =
  match x with
  | JSON -> `String "JSON"
  | YAML -> `String "YAML"
  | Zip -> `String "zip"
  | TarGZip -> `String "tgz"
  | Tar -> `String "tar"

let e_tag_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("eTag", option_to_yojson e_tag_to_yojson x.e_tag);
      ("version", option_to_yojson version_id_to_yojson x.version);
      ("bundleType", option_to_yojson bundle_type_to_yojson x.bundle_type);
      ("key", option_to_yojson s3_key_to_yojson x.key);
      ("bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let description_to_yojson = string_to_yojson

let rollback_info_to_yojson (x : rollback_info) =
  assoc_to_yojson
    [
      ("rollbackMessage", option_to_yojson description_to_yojson x.rollback_message);
      ( "rollbackTriggeringDeploymentId",
        option_to_yojson deployment_id_to_yojson x.rollback_triggering_deployment_id );
      ("rollbackDeploymentId", option_to_yojson deployment_id_to_yojson x.rollback_deployment_id);
    ]

let role_required_exception_to_yojson (x : role_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let revision_required_exception_to_yojson (x : revision_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let revision_location_type_to_yojson (x : revision_location_type) =
  match x with
  | AppSpecContent -> `String "AppSpecContent"
  | String -> `String "String"
  | GitHub -> `String "GitHub"
  | S3 -> `String "S3"

let repository_to_yojson = string_to_yojson
let commit_id_to_yojson = string_to_yojson

let git_hub_location_to_yojson (x : git_hub_location) =
  assoc_to_yojson
    [
      ("commitId", option_to_yojson commit_id_to_yojson x.commit_id);
      ("repository", option_to_yojson repository_to_yojson x.repository);
    ]

let raw_string_content_to_yojson = string_to_yojson
let raw_string_sha256_to_yojson = string_to_yojson

let raw_string_to_yojson (x : raw_string) =
  assoc_to_yojson
    [
      ("sha256", option_to_yojson raw_string_sha256_to_yojson x.sha256);
      ("content", option_to_yojson raw_string_content_to_yojson x.content);
    ]

let app_spec_content_to_yojson (x : app_spec_content) =
  assoc_to_yojson
    [
      ("sha256", option_to_yojson raw_string_sha256_to_yojson x.sha256);
      ("content", option_to_yojson raw_string_content_to_yojson x.content);
    ]

let revision_location_to_yojson (x : revision_location) =
  assoc_to_yojson
    [
      ("appSpecContent", option_to_yojson app_spec_content_to_yojson x.app_spec_content);
      ("string", option_to_yojson raw_string_to_yojson x.string_);
      ("gitHubLocation", option_to_yojson git_hub_location_to_yojson x.git_hub_location);
      ("s3Location", option_to_yojson s3_location_to_yojson x.s3_location);
      ("revisionType", option_to_yojson revision_location_type_to_yojson x.revision_type);
    ]

let revision_location_list_to_yojson tree = list_to_yojson revision_location_to_yojson tree
let deployment_groups_list_to_yojson tree = list_to_yojson deployment_group_name_to_yojson tree

let generic_revision_info_to_yojson (x : generic_revision_info) =
  assoc_to_yojson
    [
      ("registerTime", option_to_yojson timestamp_to_yojson x.register_time);
      ("lastUsedTime", option_to_yojson timestamp_to_yojson x.last_used_time);
      ("firstUsedTime", option_to_yojson timestamp_to_yojson x.first_used_time);
      ("deploymentGroups", option_to_yojson deployment_groups_list_to_yojson x.deployment_groups);
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let revision_info_to_yojson (x : revision_info) =
  assoc_to_yojson
    [
      ( "genericRevisionInfo",
        option_to_yojson generic_revision_info_to_yojson x.generic_revision_info );
      ("revisionLocation", option_to_yojson revision_location_to_yojson x.revision_location);
    ]

let revision_info_list_to_yojson tree = list_to_yojson revision_info_to_yojson tree

let revision_does_not_exist_exception_to_yojson (x : revision_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_validation_exception_to_yojson (x : resource_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_to_yojson = string_to_yojson
let instance_name_list_to_yojson tree = list_to_yojson instance_name_to_yojson tree

let remove_tags_from_on_premises_instances_input_to_yojson
    (x : remove_tags_from_on_premises_instances_input) =
  assoc_to_yojson
    [
      ("instanceNames", Some (instance_name_list_to_yojson x.instance_names));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let invalid_instance_name_exception_to_yojson (x : invalid_instance_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_not_registered_exception_to_yojson (x : instance_not_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_required_exception_to_yojson (x : instance_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_limit_exceeded_exception_to_yojson (x : instance_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployments_list_to_yojson tree = list_to_yojson deployment_id_to_yojson tree

let related_deployments_to_yojson (x : related_deployments) =
  assoc_to_yojson
    [
      ( "autoUpdateOutdatedInstancesDeploymentIds",
        option_to_yojson deployments_list_to_yojson x.auto_update_outdated_instances_deployment_ids
      );
      ( "autoUpdateOutdatedInstancesRootDeploymentId",
        option_to_yojson deployment_id_to_yojson x.auto_update_outdated_instances_root_deployment_id
      );
    ]

let registration_status_to_yojson (x : registration_status) =
  match x with Deregistered -> `String "Deregistered" | Registered -> `String "Registered"

let iam_session_arn_to_yojson = string_to_yojson
let iam_user_arn_to_yojson = string_to_yojson

let register_on_premises_instance_input_to_yojson (x : register_on_premises_instance_input) =
  assoc_to_yojson
    [
      ("iamUserArn", option_to_yojson iam_user_arn_to_yojson x.iam_user_arn);
      ("iamSessionArn", option_to_yojson iam_session_arn_to_yojson x.iam_session_arn);
      ("instanceName", Some (instance_name_to_yojson x.instance_name));
    ]

let multiple_iam_arns_provided_exception_to_yojson (x : multiple_iam_arns_provided_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_iam_user_arn_exception_to_yojson (x : invalid_iam_user_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_iam_session_arn_exception_to_yojson (x : invalid_iam_session_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_already_registered_exception_to_yojson
    (x : instance_name_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_user_arn_required_exception_to_yojson (x : iam_user_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_user_arn_already_registered_exception_to_yojson
    (x : iam_user_arn_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_session_arn_already_registered_exception_to_yojson
    (x : iam_session_arn_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_arn_required_exception_to_yojson (x : iam_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let register_application_revision_input_to_yojson (x : register_application_revision_input) =
  assoc_to_yojson
    [
      ("revision", Some (revision_location_to_yojson x.revision));
      ("description", option_to_yojson description_to_yojson x.description);
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let invalid_revision_exception_to_yojson (x : invalid_revision_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let description_too_long_exception_to_yojson (x : description_too_long_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let lifecycle_event_hook_execution_id_to_yojson = string_to_yojson

let put_lifecycle_event_hook_execution_status_output_to_yojson
    (x : put_lifecycle_event_hook_execution_status_output) =
  assoc_to_yojson
    [
      ( "lifecycleEventHookExecutionId",
        option_to_yojson lifecycle_event_hook_execution_id_to_yojson
          x.lifecycle_event_hook_execution_id );
    ]

let lifecycle_event_status_to_yojson (x : lifecycle_event_status) =
  match x with
  | UNKNOWN -> `String "Unknown"
  | SKIPPED -> `String "Skipped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let put_lifecycle_event_hook_execution_status_input_to_yojson
    (x : put_lifecycle_event_hook_execution_status_input) =
  assoc_to_yojson
    [
      ("status", option_to_yojson lifecycle_event_status_to_yojson x.status);
      ( "lifecycleEventHookExecutionId",
        option_to_yojson lifecycle_event_hook_execution_id_to_yojson
          x.lifecycle_event_hook_execution_id );
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let lifecycle_event_already_completed_exception_to_yojson
    (x : lifecycle_event_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_lifecycle_event_hook_execution_status_exception_to_yojson
    (x : invalid_lifecycle_event_hook_execution_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_lifecycle_event_hook_execution_id_exception_to_yojson
    (x : invalid_lifecycle_event_hook_execution_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let minimum_healthy_hosts_value_to_yojson = int_to_yojson

let minimum_healthy_hosts_type_to_yojson (x : minimum_healthy_hosts_type) =
  match x with FLEET_PERCENT -> `String "FLEET_PERCENT" | HOST_COUNT -> `String "HOST_COUNT"

let minimum_healthy_hosts_to_yojson (x : minimum_healthy_hosts) =
  assoc_to_yojson
    [
      ("value", option_to_yojson minimum_healthy_hosts_value_to_yojson x.value);
      ("type", option_to_yojson minimum_healthy_hosts_type_to_yojson x.type_);
    ]

let log_tail_to_yojson = string_to_yojson

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let list_state_filter_action_to_yojson (x : list_state_filter_action) =
  match x with
  | Ignore -> `String "ignore"
  | Exclude -> `String "exclude"
  | Include -> `String "include"

let list_on_premises_instances_output_to_yojson (x : list_on_premises_instances_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("instanceNames", option_to_yojson instance_name_list_to_yojson x.instance_names);
    ]

let list_on_premises_instances_input_to_yojson (x : list_on_premises_instances_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tagFilters", option_to_yojson tag_filter_list_to_yojson x.tag_filters);
      ("registrationStatus", option_to_yojson registration_status_to_yojson x.registration_status);
    ]

let invalid_tag_filter_exception_to_yojson (x : invalid_tag_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_registration_status_exception_to_yojson (x : invalid_registration_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let git_hub_account_token_name_to_yojson = string_to_yojson

let git_hub_account_token_name_list_to_yojson tree =
  list_to_yojson git_hub_account_token_name_to_yojson tree

let list_git_hub_account_token_names_output_to_yojson (x : list_git_hub_account_token_names_output)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tokenNameList", option_to_yojson git_hub_account_token_name_list_to_yojson x.token_name_list);
    ]

let list_git_hub_account_token_names_input_to_yojson (x : list_git_hub_account_token_names_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let list_deployments_output_to_yojson (x : list_deployments_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deployments", option_to_yojson deployments_list_to_yojson x.deployments);
    ]

let external_id_to_yojson = string_to_yojson

let deployment_status_to_yojson (x : deployment_status) =
  match x with
  | READY -> `String "Ready"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | BAKING -> `String "Baking"
  | IN_PROGRESS -> `String "InProgress"
  | QUEUED -> `String "Queued"
  | CREATED -> `String "Created"

let deployment_status_list_to_yojson tree = list_to_yojson deployment_status_to_yojson tree

let list_deployments_input_to_yojson (x : list_deployments_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("createTimeRange", option_to_yojson time_range_to_yojson x.create_time_range);
      ( "includeOnlyStatuses",
        option_to_yojson deployment_status_list_to_yojson x.include_only_statuses );
      ("externalId", option_to_yojson external_id_to_yojson x.external_id);
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let invalid_time_range_exception_to_yojson (x : invalid_time_range_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_external_id_exception_to_yojson (x : invalid_external_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_status_exception_to_yojson (x : invalid_deployment_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_deployment_targets_output_to_yojson (x : list_deployment_targets_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("targetIds", option_to_yojson target_id_list_to_yojson x.target_ids);
    ]

let list_deployment_targets_input_to_yojson (x : list_deployment_targets_input) =
  assoc_to_yojson
    [
      ("targetFilters", option_to_yojson target_filters_to_yojson x.target_filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let invalid_target_filter_name_exception_to_yojson (x : invalid_target_filter_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_instance_type_exception_to_yojson (x : invalid_instance_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_instance_status_exception_to_yojson (x : invalid_instance_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_instance_type_exception_to_yojson
    (x : invalid_deployment_instance_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_id_to_yojson = string_to_yojson
let instances_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let list_deployment_instances_output_to_yojson (x : list_deployment_instances_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("instancesList", option_to_yojson instances_list_to_yojson x.instances_list);
    ]

let instance_status_to_yojson (x : instance_status) =
  match x with
  | READY -> `String "Ready"
  | UNKNOWN -> `String "Unknown"
  | SKIPPED -> `String "Skipped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let instance_status_list_to_yojson tree = list_to_yojson instance_status_to_yojson tree

let instance_type_to_yojson (x : instance_type) =
  match x with GREEN -> `String "Green" | BLUE -> `String "Blue"

let instance_type_list_to_yojson tree = list_to_yojson instance_type_to_yojson tree

let list_deployment_instances_input_to_yojson (x : list_deployment_instances_input) =
  assoc_to_yojson
    [
      ("instanceTypeFilter", option_to_yojson instance_type_list_to_yojson x.instance_type_filter);
      ( "instanceStatusFilter",
        option_to_yojson instance_status_list_to_yojson x.instance_status_filter );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let invalid_compute_platform_exception_to_yojson (x : invalid_compute_platform_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_deployment_groups_output_to_yojson (x : list_deployment_groups_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deploymentGroups", option_to_yojson deployment_groups_list_to_yojson x.deployment_groups);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let list_deployment_groups_input_to_yojson (x : list_deployment_groups_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let deployment_configs_list_to_yojson tree = list_to_yojson deployment_config_name_to_yojson tree

let list_deployment_configs_output_to_yojson (x : list_deployment_configs_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "deploymentConfigsList",
        option_to_yojson deployment_configs_list_to_yojson x.deployment_configs_list );
    ]

let list_deployment_configs_input_to_yojson (x : list_deployment_configs_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let applications_list_to_yojson tree = list_to_yojson application_name_to_yojson tree

let list_applications_output_to_yojson (x : list_applications_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("applications", option_to_yojson applications_list_to_yojson x.applications);
    ]

let list_applications_input_to_yojson (x : list_applications_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let list_application_revisions_output_to_yojson (x : list_application_revisions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("revisions", option_to_yojson revision_location_list_to_yojson x.revisions);
    ]

let application_revision_sort_by_to_yojson (x : application_revision_sort_by) =
  match x with
  | LastUsedTime -> `String "lastUsedTime"
  | FirstUsedTime -> `String "firstUsedTime"
  | RegisterTime -> `String "registerTime"

let list_application_revisions_input_to_yojson (x : list_application_revisions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deployed", option_to_yojson list_state_filter_action_to_yojson x.deployed);
      ("s3KeyPrefix", option_to_yojson s3_key_to_yojson x.s3_key_prefix);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("sortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("sortBy", option_to_yojson application_revision_sort_by_to_yojson x.sort_by);
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let invalid_sort_order_exception_to_yojson (x : invalid_sort_order_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_sort_by_exception_to_yojson (x : invalid_sort_by_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_key_prefix_filter_exception_to_yojson (x : invalid_key_prefix_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployed_state_filter_exception_to_yojson (x : invalid_deployed_state_filter_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_bucket_name_filter_exception_to_yojson (x : invalid_bucket_name_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let bucket_name_filter_required_exception_to_yojson (x : bucket_name_filter_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let lifecycle_message_to_yojson = string_to_yojson
let lifecycle_event_name_to_yojson = string_to_yojson

let lifecycle_error_code_to_yojson (x : lifecycle_error_code) =
  match x with
  | UNKNOWN_ERROR -> `String "UnknownError"
  | SCRIPT_FAILED -> `String "ScriptFailed"
  | SCRIPT_TIMED_OUT -> `String "ScriptTimedOut"
  | SCRIPT_NOT_EXECUTABLE -> `String "ScriptNotExecutable"
  | SCRIPT_MISSING -> `String "ScriptMissing"
  | SUCCESS -> `String "Success"

let diagnostics_to_yojson (x : diagnostics) =
  assoc_to_yojson
    [
      ("logTail", option_to_yojson log_tail_to_yojson x.log_tail);
      ("message", option_to_yojson lifecycle_message_to_yojson x.message);
      ("scriptName", option_to_yojson script_name_to_yojson x.script_name);
      ("errorCode", option_to_yojson lifecycle_error_code_to_yojson x.error_code);
    ]

let lifecycle_event_to_yojson (x : lifecycle_event) =
  assoc_to_yojson
    [
      ("status", option_to_yojson lifecycle_event_status_to_yojson x.status);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("diagnostics", option_to_yojson diagnostics_to_yojson x.diagnostics);
      ("lifecycleEventName", option_to_yojson lifecycle_event_name_to_yojson x.lifecycle_event_name);
    ]

let lifecycle_event_list_to_yojson tree = list_to_yojson lifecycle_event_to_yojson tree

let last_deployment_info_to_yojson (x : last_deployment_info) =
  assoc_to_yojson
    [
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("status", option_to_yojson deployment_status_to_yojson x.status);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let lambda_function_name_to_yojson = string_to_yojson
let lambda_function_alias_to_yojson = string_to_yojson

let lambda_function_info_to_yojson (x : lambda_function_info) =
  assoc_to_yojson
    [
      ("targetVersionWeight", option_to_yojson traffic_weight_to_yojson x.target_version_weight);
      ("targetVersion", option_to_yojson version_to_yojson x.target_version);
      ("currentVersion", option_to_yojson version_to_yojson x.current_version);
      ("functionAlias", option_to_yojson lambda_function_alias_to_yojson x.function_alias);
      ("functionName", option_to_yojson lambda_function_name_to_yojson x.function_name);
    ]

let lambda_target_to_yojson (x : lambda_target) =
  assoc_to_yojson
    [
      ("lambdaFunctionInfo", option_to_yojson lambda_function_info_to_yojson x.lambda_function_info);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let invalid_zonal_deployment_configuration_exception_to_yojson
    (x : invalid_zonal_deployment_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_update_outdated_instances_only_value_exception_to_yojson
    (x : invalid_update_outdated_instances_only_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_target_instances_exception_to_yojson (x : invalid_target_instances_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_minimum_healthy_host_value_exception_to_yojson
    (x : invalid_minimum_healthy_host_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ignore_application_stop_failures_value_exception_to_yojson
    (x : invalid_ignore_application_stop_failures_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_git_hub_account_token_name_exception_to_yojson
    (x : invalid_git_hub_account_token_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_git_hub_account_token_exception_to_yojson (x : invalid_git_hub_account_token_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_file_exists_behavior_exception_to_yojson (x : invalid_file_exists_behavior_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_wait_type_exception_to_yojson (x : invalid_deployment_wait_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_target_id_exception_to_yojson (x : invalid_deployment_target_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_target_to_yojson (x : instance_target) =
  assoc_to_yojson
    [
      ("instanceLabel", option_to_yojson target_label_to_yojson x.instance_label);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let instance_summary_to_yojson (x : instance_summary) =
  assoc_to_yojson
    [
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("status", option_to_yojson instance_status_to_yojson x.status);
      ("instanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let instance_summary_list_to_yojson tree = list_to_yojson instance_summary_to_yojson tree
let instance_arn_to_yojson = string_to_yojson

let instance_info_to_yojson (x : instance_info) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("deregisterTime", option_to_yojson timestamp_to_yojson x.deregister_time);
      ("registerTime", option_to_yojson timestamp_to_yojson x.register_time);
      ("instanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("iamUserArn", option_to_yojson iam_user_arn_to_yojson x.iam_user_arn);
      ("iamSessionArn", option_to_yojson iam_session_arn_to_yojson x.iam_session_arn);
      ("instanceName", option_to_yojson instance_name_to_yojson x.instance_name);
    ]

let instance_info_list_to_yojson tree = list_to_yojson instance_info_to_yojson tree

let instance_id_required_exception_to_yojson (x : instance_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_does_not_exist_exception_to_yojson (x : instance_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_count_to_yojson = long_to_yojson

let git_hub_account_token_name_required_exception_to_yojson
    (x : git_hub_account_token_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let git_hub_account_token_does_not_exist_exception_to_yojson
    (x : git_hub_account_token_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_on_premises_instance_output_to_yojson (x : get_on_premises_instance_output) =
  assoc_to_yojson [ ("instanceInfo", option_to_yojson instance_info_to_yojson x.instance_info) ]

let get_on_premises_instance_input_to_yojson (x : get_on_premises_instance_input) =
  assoc_to_yojson [ ("instanceName", Some (instance_name_to_yojson x.instance_name)) ]

let deployment_target_type_to_yojson (x : deployment_target_type) =
  match x with
  | CLOUDFORMATION_TARGET -> `String "CloudFormationTarget"
  | ECS_TARGET -> `String "ECSTarget"
  | LAMBDA_TARGET -> `String "LambdaTarget"
  | INSTANCE_TARGET -> `String "InstanceTarget"

let ecs_task_set_identifier_to_yojson = string_to_yojson
let ecs_task_set_count_to_yojson = long_to_yojson
let ecs_task_set_status_to_yojson = string_to_yojson

let ecs_task_set_to_yojson (x : ecs_task_set) =
  assoc_to_yojson
    [
      ("taskSetLabel", option_to_yojson target_label_to_yojson x.task_set_label);
      ("targetGroup", option_to_yojson target_group_info_to_yojson x.target_group);
      ("trafficWeight", option_to_yojson traffic_weight_to_yojson x.traffic_weight);
      ("status", option_to_yojson ecs_task_set_status_to_yojson x.status);
      ("runningCount", option_to_yojson ecs_task_set_count_to_yojson x.running_count);
      ("pendingCount", option_to_yojson ecs_task_set_count_to_yojson x.pending_count);
      ("desiredCount", option_to_yojson ecs_task_set_count_to_yojson x.desired_count);
      ("identifer", option_to_yojson ecs_task_set_identifier_to_yojson x.identifer);
    ]

let ecs_task_set_list_to_yojson tree = list_to_yojson ecs_task_set_to_yojson tree

let ecs_target_to_yojson (x : ecs_target) =
  assoc_to_yojson
    [
      ("taskSetsInfo", option_to_yojson ecs_task_set_list_to_yojson x.task_sets_info);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let cloud_formation_resource_type_to_yojson = string_to_yojson

let cloud_formation_target_to_yojson (x : cloud_formation_target) =
  assoc_to_yojson
    [
      ("targetVersionWeight", option_to_yojson traffic_weight_to_yojson x.target_version_weight);
      ("resourceType", option_to_yojson cloud_formation_resource_type_to_yojson x.resource_type);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let deployment_target_to_yojson (x : deployment_target) =
  assoc_to_yojson
    [
      ( "cloudFormationTarget",
        option_to_yojson cloud_formation_target_to_yojson x.cloud_formation_target );
      ("ecsTarget", option_to_yojson ecs_target_to_yojson x.ecs_target);
      ("lambdaTarget", option_to_yojson lambda_target_to_yojson x.lambda_target);
      ("instanceTarget", option_to_yojson instance_target_to_yojson x.instance_target);
      ( "deploymentTargetType",
        option_to_yojson deployment_target_type_to_yojson x.deployment_target_type );
    ]

let get_deployment_target_output_to_yojson (x : get_deployment_target_output) =
  assoc_to_yojson
    [ ("deploymentTarget", option_to_yojson deployment_target_to_yojson x.deployment_target) ]

let get_deployment_target_input_to_yojson (x : get_deployment_target_input) =
  assoc_to_yojson
    [
      ("targetId", Some (target_id_to_yojson x.target_id));
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let deployment_target_id_required_exception_to_yojson (x : deployment_target_id_required_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_target_does_not_exist_exception_to_yojson
    (x : deployment_target_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let error_code_to_yojson (x : error_code) =
  match x with
  | CLOUDFORMATION_STACK_FAILURE -> `String "CLOUDFORMATION_STACK_FAILURE"
  | TIMEOUT -> `String "TIMEOUT"
  | THROTTLED -> `String "THROTTLED"
  | REVISION_MISSING -> `String "REVISION_MISSING"
  | RESOURCE_LIMIT_EXCEEDED -> `String "RESOURCE_LIMIT_EXCEEDED"
  | OVER_MAX_INSTANCES -> `String "OVER_MAX_INSTANCES"
  | NO_INSTANCES -> `String "NO_INSTANCES"
  | NO_EC2_SUBSCRIPTION -> `String "NO_EC2_SUBSCRIPTION"
  | MISSING_GITHUB_TOKEN -> `String "MISSING_GITHUB_TOKEN"
  | MISSING_ELB_INFORMATION -> `String "MISSING_ELB_INFORMATION"
  | MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION ->
      `String "MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION"
  | MANUAL_STOP -> `String "MANUAL_STOP"
  | INVALID_REVISION -> `String "INVALID_REVISION"
  | INVALID_LAMBDA_FUNCTION -> `String "INVALID_LAMBDA_FUNCTION"
  | INVALID_LAMBDA_CONFIGURATION -> `String "INVALID_LAMBDA_CONFIGURATION"
  | INVALID_ECS_SERVICE -> `String "INVALID_ECS_SERVICE"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | IAM_ROLE_PERMISSIONS -> `String "IAM_ROLE_PERMISSIONS"
  | IAM_ROLE_MISSING -> `String "IAM_ROLE_MISSING"
  | HOOK_EXECUTION_FAILURE -> `String "HOOK_EXECUTION_FAILURE"
  | HEALTH_CONSTRAINTS_INVALID -> `String "HEALTH_CONSTRAINTS_INVALID"
  | HEALTH_CONSTRAINTS -> `String "HEALTH_CONSTRAINTS"
  | ELB_INVALID_INSTANCE -> `String "ELB_INVALID_INSTANCE"
  | ELASTIC_LOAD_BALANCING_INVALID -> `String "ELASTIC_LOAD_BALANCING_INVALID"
  | ECS_UPDATE_ERROR -> `String "ECS_UPDATE_ERROR"
  | DEPLOYMENT_GROUP_MISSING -> `String "DEPLOYMENT_GROUP_MISSING"
  | CUSTOMER_APPLICATION_UNHEALTHY -> `String "CUSTOMER_APPLICATION_UNHEALTHY"
  | CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND -> `String "CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND"
  | AUTO_SCALING_IAM_ROLE_PERMISSIONS -> `String "AUTO_SCALING_IAM_ROLE_PERMISSIONS"
  | AUTO_SCALING_CONFIGURATION -> `String "AUTO_SCALING_CONFIGURATION"
  | AUTOSCALING_VALIDATION_ERROR -> `String "AUTOSCALING_VALIDATION_ERROR"
  | APPLICATION_MISSING -> `String "APPLICATION_MISSING"
  | ALARM_ACTIVE -> `String "ALARM_ACTIVE"
  | AGENT_ISSUE -> `String "AGENT_ISSUE"

let error_message_to_yojson = string_to_yojson

let error_information_to_yojson (x : error_information) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let deployment_overview_to_yojson (x : deployment_overview) =
  assoc_to_yojson
    [
      ("Ready", option_to_yojson instance_count_to_yojson x.ready);
      ("Skipped", option_to_yojson instance_count_to_yojson x.skipped);
      ("Failed", option_to_yojson instance_count_to_yojson x.failed);
      ("Succeeded", option_to_yojson instance_count_to_yojson x.succeeded);
      ("InProgress", option_to_yojson instance_count_to_yojson x.in_progress);
      ("Pending", option_to_yojson instance_count_to_yojson x.pending);
    ]

let deployment_creator_to_yojson (x : deployment_creator) =
  match x with
  | AutoscalingTermination -> `String "autoscalingTermination"
  | CloudFormationRollback -> `String "CloudFormationRollback"
  | CloudFormation -> `String "CloudFormation"
  | CodeDeployAutoUpdate -> `String "CodeDeployAutoUpdate"
  | CodeDeploy -> `String "CodeDeploy"
  | CodeDeployRollback -> `String "codeDeployRollback"
  | Autoscaling -> `String "autoscaling"
  | User -> `String "user"

let additional_deployment_status_info_to_yojson = string_to_yojson

let file_exists_behavior_to_yojson (x : file_exists_behavior) =
  match x with
  | RETAIN -> `String "RETAIN"
  | OVERWRITE -> `String "OVERWRITE"
  | DISALLOW -> `String "DISALLOW"

let deployment_status_message_list_to_yojson tree = list_to_yojson error_message_to_yojson tree

let compute_platform_to_yojson (x : compute_platform) =
  match x with ECS -> `String "ECS" | LAMBDA -> `String "Lambda" | SERVER -> `String "Server"

let deployment_info_to_yojson (x : deployment_info) =
  assoc_to_yojson
    [
      ( "overrideAlarmConfiguration",
        option_to_yojson alarm_configuration_to_yojson x.override_alarm_configuration );
      ("relatedDeployments", option_to_yojson related_deployments_to_yojson x.related_deployments);
      ("externalId", option_to_yojson external_id_to_yojson x.external_id);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ( "deploymentStatusMessages",
        option_to_yojson deployment_status_message_list_to_yojson x.deployment_status_messages );
      ("fileExistsBehavior", option_to_yojson file_exists_behavior_to_yojson x.file_exists_behavior);
      ( "additionalDeploymentStatusInfo",
        option_to_yojson additional_deployment_status_info_to_yojson
          x.additional_deployment_status_info );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ( "instanceTerminationWaitTimeStarted",
        option_to_yojson boolean__to_yojson x.instance_termination_wait_time_started );
      ("targetInstances", option_to_yojson target_instances_to_yojson x.target_instances);
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ("rollbackInfo", option_to_yojson rollback_info_to_yojson x.rollback_info);
      ( "updateOutdatedInstancesOnly",
        option_to_yojson boolean__to_yojson x.update_outdated_instances_only );
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ( "ignoreApplicationStopFailures",
        option_to_yojson boolean__to_yojson x.ignore_application_stop_failures );
      ("creator", option_to_yojson deployment_creator_to_yojson x.creator);
      ("description", option_to_yojson description_to_yojson x.description);
      ("deploymentOverview", option_to_yojson deployment_overview_to_yojson x.deployment_overview);
      ("completeTime", option_to_yojson timestamp_to_yojson x.complete_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("errorInformation", option_to_yojson error_information_to_yojson x.error_information);
      ("status", option_to_yojson deployment_status_to_yojson x.status);
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ("previousRevision", option_to_yojson revision_location_to_yojson x.previous_revision);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let get_deployment_output_to_yojson (x : get_deployment_output) =
  assoc_to_yojson
    [ ("deploymentInfo", option_to_yojson deployment_info_to_yojson x.deployment_info) ]

let get_deployment_instance_output_to_yojson (x : get_deployment_instance_output) =
  assoc_to_yojson
    [ ("instanceSummary", option_to_yojson instance_summary_to_yojson x.instance_summary) ]

let get_deployment_instance_input_to_yojson (x : get_deployment_instance_input) =
  assoc_to_yojson
    [
      ("instanceId", Some (instance_id_to_yojson x.instance_id));
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let get_deployment_input_to_yojson (x : get_deployment_input) =
  assoc_to_yojson [ ("deploymentId", Some (deployment_id_to_yojson x.deployment_id)) ]

let deployment_group_id_to_yojson = string_to_yojson

let deployment_group_info_to_yojson (x : deployment_group_info) =
  assoc_to_yojson
    [
      ("terminationHookEnabled", option_to_yojson boolean__to_yojson x.termination_hook_enabled);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ( "lastAttemptedDeployment",
        option_to_yojson last_deployment_info_to_yojson x.last_attempted_deployment );
      ( "lastSuccessfulDeployment",
        option_to_yojson last_deployment_info_to_yojson x.last_successful_deployment );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("targetRevision", option_to_yojson revision_location_to_yojson x.target_revision);
      ("serviceRoleArn", option_to_yojson role_to_yojson x.service_role_arn);
      ("autoScalingGroups", option_to_yojson auto_scaling_group_list_to_yojson x.auto_scaling_groups);
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("deploymentGroupId", option_to_yojson deployment_group_id_to_yojson x.deployment_group_id);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let get_deployment_group_output_to_yojson (x : get_deployment_group_output) =
  assoc_to_yojson
    [
      ( "deploymentGroupInfo",
        option_to_yojson deployment_group_info_to_yojson x.deployment_group_info );
    ]

let get_deployment_group_input_to_yojson (x : get_deployment_group_input) =
  assoc_to_yojson
    [
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let deployment_config_id_to_yojson = string_to_yojson

let deployment_config_info_to_yojson (x : deployment_config_info) =
  assoc_to_yojson
    [
      ("zonalConfig", option_to_yojson zonal_config_to_yojson x.zonal_config);
      ( "trafficRoutingConfig",
        option_to_yojson traffic_routing_config_to_yojson x.traffic_routing_config );
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ( "minimumHealthyHosts",
        option_to_yojson minimum_healthy_hosts_to_yojson x.minimum_healthy_hosts );
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("deploymentConfigId", option_to_yojson deployment_config_id_to_yojson x.deployment_config_id);
    ]

let get_deployment_config_output_to_yojson (x : get_deployment_config_output) =
  assoc_to_yojson
    [
      ( "deploymentConfigInfo",
        option_to_yojson deployment_config_info_to_yojson x.deployment_config_info );
    ]

let get_deployment_config_input_to_yojson (x : get_deployment_config_input) =
  assoc_to_yojson
    [ ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name)) ]

let deployment_config_name_required_exception_to_yojson
    (x : deployment_config_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_application_revision_output_to_yojson (x : get_application_revision_output) =
  assoc_to_yojson
    [
      ("revisionInfo", option_to_yojson generic_revision_info_to_yojson x.revision_info);
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let get_application_revision_input_to_yojson (x : get_application_revision_input) =
  assoc_to_yojson
    [
      ("revision", Some (revision_location_to_yojson x.revision));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let application_id_to_yojson = string_to_yojson

let application_info_to_yojson (x : application_info) =
  assoc_to_yojson
    [
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ( "gitHubAccountName",
        option_to_yojson git_hub_account_token_name_to_yojson x.git_hub_account_name );
      ("linkedToGitHub", option_to_yojson boolean__to_yojson x.linked_to_git_hub);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("applicationId", option_to_yojson application_id_to_yojson x.application_id);
    ]

let get_application_output_to_yojson (x : get_application_output) =
  assoc_to_yojson [ ("application", option_to_yojson application_info_to_yojson x.application) ]

let get_application_input_to_yojson (x : get_application_input) =
  assoc_to_yojson [ ("applicationName", Some (application_name_to_yojson x.application_name)) ]

let deregister_on_premises_instance_input_to_yojson (x : deregister_on_premises_instance_input) =
  assoc_to_yojson [ ("instanceName", Some (instance_name_to_yojson x.instance_name)) ]

let deployments_info_list_to_yojson tree = list_to_yojson deployment_info_to_yojson tree

let deployment_wait_type_to_yojson (x : deployment_wait_type) =
  match x with TERMINATION_WAIT -> `String "TERMINATION_WAIT" | READY_WAIT -> `String "READY_WAIT"

let deployment_target_list_size_exceeded_exception_to_yojson
    (x : deployment_target_list_size_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_target_list_to_yojson tree = list_to_yojson deployment_target_to_yojson tree

let deployment_limit_exceeded_exception_to_yojson (x : deployment_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_is_not_in_ready_state_exception_to_yojson
    (x : deployment_is_not_in_ready_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_limit_exceeded_exception_to_yojson
    (x : deployment_group_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_info_list_to_yojson tree = list_to_yojson deployment_group_info_to_yojson tree

let deployment_config_limit_exceeded_exception_to_yojson
    (x : deployment_config_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_in_use_exception_to_yojson (x : deployment_config_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_already_exists_exception_to_yojson
    (x : deployment_config_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_resources_by_external_id_output_to_yojson = unit_to_yojson

let delete_resources_by_external_id_input_to_yojson (x : delete_resources_by_external_id_input) =
  assoc_to_yojson [ ("externalId", option_to_yojson external_id_to_yojson x.external_id) ]

let delete_git_hub_account_token_output_to_yojson (x : delete_git_hub_account_token_output) =
  assoc_to_yojson
    [ ("tokenName", option_to_yojson git_hub_account_token_name_to_yojson x.token_name) ]

let delete_git_hub_account_token_input_to_yojson (x : delete_git_hub_account_token_input) =
  assoc_to_yojson
    [ ("tokenName", option_to_yojson git_hub_account_token_name_to_yojson x.token_name) ]

let delete_deployment_group_output_to_yojson (x : delete_deployment_group_output) =
  assoc_to_yojson
    [
      ( "hooksNotCleanedUp",
        option_to_yojson auto_scaling_group_list_to_yojson x.hooks_not_cleaned_up );
    ]

let delete_deployment_group_input_to_yojson (x : delete_deployment_group_input) =
  assoc_to_yojson
    [
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let delete_deployment_config_input_to_yojson (x : delete_deployment_config_input) =
  assoc_to_yojson
    [ ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name)) ]

let delete_application_input_to_yojson (x : delete_application_input) =
  assoc_to_yojson [ ("applicationName", Some (application_name_to_yojson x.application_name)) ]

let create_deployment_output_to_yojson (x : create_deployment_output) =
  assoc_to_yojson [ ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id) ]

let create_deployment_input_to_yojson (x : create_deployment_input) =
  assoc_to_yojson
    [
      ( "overrideAlarmConfiguration",
        option_to_yojson alarm_configuration_to_yojson x.override_alarm_configuration );
      ("fileExistsBehavior", option_to_yojson file_exists_behavior_to_yojson x.file_exists_behavior);
      ( "updateOutdatedInstancesOnly",
        option_to_yojson boolean__to_yojson x.update_outdated_instances_only );
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ("targetInstances", option_to_yojson target_instances_to_yojson x.target_instances);
      ( "ignoreApplicationStopFailures",
        option_to_yojson boolean__to_yojson x.ignore_application_stop_failures );
      ("description", option_to_yojson description_to_yojson x.description);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let create_deployment_group_output_to_yojson (x : create_deployment_group_output) =
  assoc_to_yojson
    [ ("deploymentGroupId", option_to_yojson deployment_group_id_to_yojson x.deployment_group_id) ]

let create_deployment_group_input_to_yojson (x : create_deployment_group_input) =
  assoc_to_yojson
    [
      ( "terminationHookEnabled",
        option_to_yojson nullable_boolean_to_yojson x.termination_hook_enabled );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("serviceRoleArn", Some (role_to_yojson x.service_role_arn));
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let create_deployment_config_output_to_yojson (x : create_deployment_config_output) =
  assoc_to_yojson
    [
      ("deploymentConfigId", option_to_yojson deployment_config_id_to_yojson x.deployment_config_id);
    ]

let create_deployment_config_input_to_yojson (x : create_deployment_config_input) =
  assoc_to_yojson
    [
      ("zonalConfig", option_to_yojson zonal_config_to_yojson x.zonal_config);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ( "trafficRoutingConfig",
        option_to_yojson traffic_routing_config_to_yojson x.traffic_routing_config );
      ( "minimumHealthyHosts",
        option_to_yojson minimum_healthy_hosts_to_yojson x.minimum_healthy_hosts );
      ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name));
    ]

let create_application_output_to_yojson (x : create_application_output) =
  assoc_to_yojson [ ("applicationId", option_to_yojson application_id_to_yojson x.application_id) ]

let create_application_input_to_yojson (x : create_application_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let application_limit_exceeded_exception_to_yojson (x : application_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let continue_deployment_input_to_yojson (x : continue_deployment_input) =
  assoc_to_yojson
    [
      ("deploymentWaitType", option_to_yojson deployment_wait_type_to_yojson x.deployment_wait_type);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let batch_limit_exceeded_exception_to_yojson (x : batch_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let batch_get_on_premises_instances_output_to_yojson (x : batch_get_on_premises_instances_output) =
  assoc_to_yojson
    [ ("instanceInfos", option_to_yojson instance_info_list_to_yojson x.instance_infos) ]

let batch_get_on_premises_instances_input_to_yojson (x : batch_get_on_premises_instances_input) =
  assoc_to_yojson [ ("instanceNames", Some (instance_name_list_to_yojson x.instance_names)) ]

let batch_get_deployment_targets_output_to_yojson (x : batch_get_deployment_targets_output) =
  assoc_to_yojson
    [
      ("deploymentTargets", option_to_yojson deployment_target_list_to_yojson x.deployment_targets);
    ]

let batch_get_deployment_targets_input_to_yojson (x : batch_get_deployment_targets_input) =
  assoc_to_yojson
    [
      ("targetIds", Some (target_id_list_to_yojson x.target_ids));
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let batch_get_deployments_output_to_yojson (x : batch_get_deployments_output) =
  assoc_to_yojson
    [ ("deploymentsInfo", option_to_yojson deployments_info_list_to_yojson x.deployments_info) ]

let batch_get_deployments_input_to_yojson (x : batch_get_deployments_input) =
  assoc_to_yojson [ ("deploymentIds", Some (deployments_list_to_yojson x.deployment_ids)) ]

let batch_get_deployment_instances_output_to_yojson (x : batch_get_deployment_instances_output) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("instancesSummary", option_to_yojson instance_summary_list_to_yojson x.instances_summary);
    ]

let batch_get_deployment_instances_input_to_yojson (x : batch_get_deployment_instances_input) =
  assoc_to_yojson
    [
      ("instanceIds", Some (instances_list_to_yojson x.instance_ids));
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
    ]

let batch_get_deployment_groups_output_to_yojson (x : batch_get_deployment_groups_output) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ( "deploymentGroupsInfo",
        option_to_yojson deployment_group_info_list_to_yojson x.deployment_groups_info );
    ]

let batch_get_deployment_groups_input_to_yojson (x : batch_get_deployment_groups_input) =
  assoc_to_yojson
    [
      ("deploymentGroupNames", Some (deployment_groups_list_to_yojson x.deployment_group_names));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let applications_info_list_to_yojson tree = list_to_yojson application_info_to_yojson tree

let batch_get_applications_output_to_yojson (x : batch_get_applications_output) =
  assoc_to_yojson
    [ ("applicationsInfo", option_to_yojson applications_info_list_to_yojson x.applications_info) ]

let batch_get_applications_input_to_yojson (x : batch_get_applications_input) =
  assoc_to_yojson [ ("applicationNames", Some (applications_list_to_yojson x.application_names)) ]

let batch_get_application_revisions_output_to_yojson (x : batch_get_application_revisions_output) =
  assoc_to_yojson
    [
      ("revisions", option_to_yojson revision_info_list_to_yojson x.revisions);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
    ]

let batch_get_application_revisions_input_to_yojson (x : batch_get_application_revisions_input) =
  assoc_to_yojson
    [
      ("revisions", Some (revision_location_list_to_yojson x.revisions));
      ("applicationName", Some (application_name_to_yojson x.application_name));
    ]

let add_tags_to_on_premises_instances_input_to_yojson (x : add_tags_to_on_premises_instances_input)
    =
  assoc_to_yojson
    [
      ("instanceNames", Some (instance_name_list_to_yojson x.instance_names));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]
