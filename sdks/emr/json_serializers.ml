open Smaws_Lib.Json.SerializeHelpers
open Types

let action_on_failure_to_yojson (x : action_on_failure) =
  match x with
  | TERMINATE_JOB_FLOW -> `String "TERMINATE_JOB_FLOW"
  | TERMINATE_CLUSTER -> `String "TERMINATE_CLUSTER"
  | CANCEL_AND_WAIT -> `String "CANCEL_AND_WAIT"
  | CONTINUE -> `String "CONTINUE"

let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let arn_type_to_yojson = string_to_yojson
let instance_fleet_id_to_yojson = string_to_yojson
let xml_string_max_len256_to_yojson = string_to_yojson

let add_instance_fleet_output_to_yojson (x : add_instance_fleet_output) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson xml_string_max_len256_to_yojson x.cluster_id);
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
    ]

let on_demand_capacity_reservation_preference_to_yojson
    (x : on_demand_capacity_reservation_preference) =
  match x with OPEN -> `String "open" | NONE -> `String "none"

let on_demand_capacity_reservation_usage_strategy_to_yojson
    (x : on_demand_capacity_reservation_usage_strategy) =
  match x with USE_CAPACITY_RESERVATIONS_FIRST -> `String "use-capacity-reservations-first"

let on_demand_capacity_reservation_options_to_yojson (x : on_demand_capacity_reservation_options) =
  assoc_to_yojson
    [
      ( "UsageStrategy",
        option_to_yojson on_demand_capacity_reservation_usage_strategy_to_yojson x.usage_strategy );
      ( "CapacityReservationPreference",
        option_to_yojson on_demand_capacity_reservation_preference_to_yojson
          x.capacity_reservation_preference );
      ( "CapacityReservationResourceGroupArn",
        option_to_yojson xml_string_max_len256_to_yojson x.capacity_reservation_resource_group_arn
      );
    ]

let on_demand_provisioning_allocation_strategy_to_yojson
    (x : on_demand_provisioning_allocation_strategy) =
  match x with LOWEST_PRICE -> `String "lowest-price" | PRIORITIZED -> `String "prioritized"

let whole_number_to_yojson = int_to_yojson

let on_demand_resizing_specification_to_yojson (x : on_demand_resizing_specification) =
  assoc_to_yojson
    [
      ("TimeoutDurationMinutes", option_to_yojson whole_number_to_yojson x.timeout_duration_minutes);
      ( "AllocationStrategy",
        option_to_yojson on_demand_provisioning_allocation_strategy_to_yojson x.allocation_strategy
      );
      ( "CapacityReservationOptions",
        option_to_yojson on_demand_capacity_reservation_options_to_yojson
          x.capacity_reservation_options );
    ]

let spot_provisioning_allocation_strategy_to_yojson (x : spot_provisioning_allocation_strategy) =
  match x with
  | CAPACITY_OPTIMIZED -> `String "capacity-optimized"
  | PRICE_CAPACITY_OPTIMIZED -> `String "price-capacity-optimized"
  | LOWEST_PRICE -> `String "lowest-price"
  | DIVERSIFIED -> `String "diversified"
  | CAPACITY_OPTIMIZED_PRIORITIZED -> `String "capacity-optimized-prioritized"

let spot_resizing_specification_to_yojson (x : spot_resizing_specification) =
  assoc_to_yojson
    [
      ("TimeoutDurationMinutes", option_to_yojson whole_number_to_yojson x.timeout_duration_minutes);
      ( "AllocationStrategy",
        option_to_yojson spot_provisioning_allocation_strategy_to_yojson x.allocation_strategy );
    ]

let instance_fleet_resizing_specifications_to_yojson (x : instance_fleet_resizing_specifications) =
  assoc_to_yojson
    [
      ( "SpotResizeSpecification",
        option_to_yojson spot_resizing_specification_to_yojson x.spot_resize_specification );
      ( "OnDemandResizeSpecification",
        option_to_yojson on_demand_resizing_specification_to_yojson x.on_demand_resize_specification
      );
    ]

let on_demand_provisioning_specification_to_yojson (x : on_demand_provisioning_specification) =
  assoc_to_yojson
    [
      ( "AllocationStrategy",
        Some (on_demand_provisioning_allocation_strategy_to_yojson x.allocation_strategy) );
      ( "CapacityReservationOptions",
        option_to_yojson on_demand_capacity_reservation_options_to_yojson
          x.capacity_reservation_options );
    ]

let spot_provisioning_timeout_action_to_yojson (x : spot_provisioning_timeout_action) =
  match x with
  | SWITCH_TO_ON_DEMAND -> `String "SWITCH_TO_ON_DEMAND"
  | TERMINATE_CLUSTER -> `String "TERMINATE_CLUSTER"

let spot_provisioning_specification_to_yojson (x : spot_provisioning_specification) =
  assoc_to_yojson
    [
      ("TimeoutDurationMinutes", Some (whole_number_to_yojson x.timeout_duration_minutes));
      ("TimeoutAction", Some (spot_provisioning_timeout_action_to_yojson x.timeout_action));
      ("BlockDurationMinutes", option_to_yojson whole_number_to_yojson x.block_duration_minutes);
      ( "AllocationStrategy",
        option_to_yojson spot_provisioning_allocation_strategy_to_yojson x.allocation_strategy );
    ]

let instance_fleet_provisioning_specifications_to_yojson
    (x : instance_fleet_provisioning_specifications) =
  assoc_to_yojson
    [
      ( "SpotSpecification",
        option_to_yojson spot_provisioning_specification_to_yojson x.spot_specification );
      ( "OnDemandSpecification",
        option_to_yojson on_demand_provisioning_specification_to_yojson x.on_demand_specification );
    ]

let non_negative_double_to_yojson = double_to_yojson
let string__to_yojson = string_to_yojson
let string_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let rec configuration_list_to_yojson tree = list_to_yojson configuration_to_yojson tree

and configuration_to_yojson (x : configuration) =
  assoc_to_yojson
    [
      ("Classification", option_to_yojson string__to_yojson x.classification);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
    ]

let boolean_object_to_yojson = bool_to_yojson
let integer_to_yojson = int_to_yojson
let throughput_val_to_yojson = int_to_yojson

let volume_specification_to_yojson (x : volume_specification) =
  assoc_to_yojson
    [
      ("VolumeType", Some (string__to_yojson x.volume_type));
      ("Iops", option_to_yojson integer_to_yojson x.iops);
      ("SizeInGB", Some (integer_to_yojson x.size_in_g_b));
      ("Throughput", option_to_yojson throughput_val_to_yojson x.throughput);
    ]

let ebs_block_device_config_to_yojson (x : ebs_block_device_config) =
  assoc_to_yojson
    [
      ("VolumeSpecification", Some (volume_specification_to_yojson x.volume_specification));
      ("VolumesPerInstance", option_to_yojson integer_to_yojson x.volumes_per_instance);
    ]

let ebs_block_device_config_list_to_yojson tree =
  list_to_yojson ebs_block_device_config_to_yojson tree

let ebs_configuration_to_yojson (x : ebs_configuration) =
  assoc_to_yojson
    [
      ( "EbsBlockDeviceConfigs",
        option_to_yojson ebs_block_device_config_list_to_yojson x.ebs_block_device_configs );
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
    ]

let instance_type_to_yojson = string_to_yojson

let instance_type_config_to_yojson (x : instance_type_config) =
  assoc_to_yojson
    [
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("WeightedCapacity", option_to_yojson whole_number_to_yojson x.weighted_capacity);
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ( "BidPriceAsPercentageOfOnDemandPrice",
        option_to_yojson non_negative_double_to_yojson x.bid_price_as_percentage_of_on_demand_price
      );
      ("EbsConfiguration", option_to_yojson ebs_configuration_to_yojson x.ebs_configuration);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("Priority", option_to_yojson non_negative_double_to_yojson x.priority);
    ]

let instance_type_config_list_to_yojson tree = list_to_yojson instance_type_config_to_yojson tree

let instance_fleet_type_to_yojson (x : instance_fleet_type) =
  match x with MASTER -> `String "MASTER" | CORE -> `String "CORE" | TASK -> `String "TASK"

let instance_fleet_config_to_yojson (x : instance_fleet_config) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("InstanceFleetType", Some (instance_fleet_type_to_yojson x.instance_fleet_type));
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ( "InstanceTypeConfigs",
        option_to_yojson instance_type_config_list_to_yojson x.instance_type_configs );
      ( "LaunchSpecifications",
        option_to_yojson instance_fleet_provisioning_specifications_to_yojson
          x.launch_specifications );
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
    ]

let add_instance_fleet_input_to_yojson (x : add_instance_fleet_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
      ("InstanceFleet", Some (instance_fleet_config_to_yojson x.instance_fleet));
    ]

let internal_server_error_to_yojson = unit_to_yojson
let instance_group_ids_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let add_instance_groups_output_to_yojson (x : add_instance_groups_output) =
  assoc_to_yojson
    [
      ("JobFlowId", option_to_yojson xml_string_max_len256_to_yojson x.job_flow_id);
      ("InstanceGroupIds", option_to_yojson instance_group_ids_list_to_yojson x.instance_group_ids);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
    ]

let metric_dimension_to_yojson (x : metric_dimension) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let metric_dimension_list_to_yojson tree = list_to_yojson metric_dimension_to_yojson tree

let unit__to_yojson (x : unit_) =
  match x with
  | NONE -> `String "NONE"
  | SECONDS -> `String "SECONDS"
  | MICRO_SECONDS -> `String "MICRO_SECONDS"
  | MILLI_SECONDS -> `String "MILLI_SECONDS"
  | BYTES -> `String "BYTES"
  | KILO_BYTES -> `String "KILO_BYTES"
  | MEGA_BYTES -> `String "MEGA_BYTES"
  | GIGA_BYTES -> `String "GIGA_BYTES"
  | TERA_BYTES -> `String "TERA_BYTES"
  | BITS -> `String "BITS"
  | KILO_BITS -> `String "KILO_BITS"
  | MEGA_BITS -> `String "MEGA_BITS"
  | GIGA_BITS -> `String "GIGA_BITS"
  | TERA_BITS -> `String "TERA_BITS"
  | PERCENT -> `String "PERCENT"
  | COUNT -> `String "COUNT"
  | BYTES_PER_SECOND -> `String "BYTES_PER_SECOND"
  | KILO_BYTES_PER_SECOND -> `String "KILO_BYTES_PER_SECOND"
  | MEGA_BYTES_PER_SECOND -> `String "MEGA_BYTES_PER_SECOND"
  | GIGA_BYTES_PER_SECOND -> `String "GIGA_BYTES_PER_SECOND"
  | TERA_BYTES_PER_SECOND -> `String "TERA_BYTES_PER_SECOND"
  | BITS_PER_SECOND -> `String "BITS_PER_SECOND"
  | KILO_BITS_PER_SECOND -> `String "KILO_BITS_PER_SECOND"
  | MEGA_BITS_PER_SECOND -> `String "MEGA_BITS_PER_SECOND"
  | GIGA_BITS_PER_SECOND -> `String "GIGA_BITS_PER_SECOND"
  | TERA_BITS_PER_SECOND -> `String "TERA_BITS_PER_SECOND"
  | COUNT_PER_SECOND -> `String "COUNT_PER_SECOND"

let statistic_to_yojson (x : statistic) =
  match x with
  | SAMPLE_COUNT -> `String "SAMPLE_COUNT"
  | AVERAGE -> `String "AVERAGE"
  | SUM -> `String "SUM"
  | MINIMUM -> `String "MINIMUM"
  | MAXIMUM -> `String "MAXIMUM"

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"

let cloud_watch_alarm_definition_to_yojson (x : cloud_watch_alarm_definition) =
  assoc_to_yojson
    [
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("EvaluationPeriods", option_to_yojson integer_to_yojson x.evaluation_periods);
      ("MetricName", Some (string__to_yojson x.metric_name));
      ("Namespace", option_to_yojson string__to_yojson x.namespace);
      ("Period", Some (integer_to_yojson x.period));
      ("Statistic", option_to_yojson statistic_to_yojson x.statistic);
      ("Threshold", Some (non_negative_double_to_yojson x.threshold));
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
      ("Dimensions", option_to_yojson metric_dimension_list_to_yojson x.dimensions);
    ]

let scaling_trigger_to_yojson (x : scaling_trigger) =
  assoc_to_yojson
    [
      ( "CloudWatchAlarmDefinition",
        Some (cloud_watch_alarm_definition_to_yojson x.cloud_watch_alarm_definition) );
    ]

let adjustment_type_to_yojson (x : adjustment_type) =
  match x with
  | CHANGE_IN_CAPACITY -> `String "CHANGE_IN_CAPACITY"
  | PERCENT_CHANGE_IN_CAPACITY -> `String "PERCENT_CHANGE_IN_CAPACITY"
  | EXACT_CAPACITY -> `String "EXACT_CAPACITY"

let simple_scaling_policy_configuration_to_yojson (x : simple_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("AdjustmentType", option_to_yojson adjustment_type_to_yojson x.adjustment_type);
      ("ScalingAdjustment", Some (integer_to_yojson x.scaling_adjustment));
      ("CoolDown", option_to_yojson integer_to_yojson x.cool_down);
    ]

let market_type_to_yojson (x : market_type) =
  match x with ON_DEMAND -> `String "ON_DEMAND" | SPOT -> `String "SPOT"

let scaling_action_to_yojson (x : scaling_action) =
  assoc_to_yojson
    [
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ( "SimpleScalingPolicyConfiguration",
        Some (simple_scaling_policy_configuration_to_yojson x.simple_scaling_policy_configuration)
      );
    ]

let scaling_rule_to_yojson (x : scaling_rule) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Action", Some (scaling_action_to_yojson x.action));
      ("Trigger", Some (scaling_trigger_to_yojson x.trigger));
    ]

let scaling_rule_list_to_yojson tree = list_to_yojson scaling_rule_to_yojson tree

let scaling_constraints_to_yojson (x : scaling_constraints) =
  assoc_to_yojson
    [
      ("MinCapacity", Some (integer_to_yojson x.min_capacity));
      ("MaxCapacity", Some (integer_to_yojson x.max_capacity));
    ]

let auto_scaling_policy_to_yojson (x : auto_scaling_policy) =
  assoc_to_yojson
    [
      ("Constraints", Some (scaling_constraints_to_yojson x.constraints));
      ("Rules", Some (scaling_rule_list_to_yojson x.rules));
    ]

let instance_role_type_to_yojson (x : instance_role_type) =
  match x with MASTER -> `String "MASTER" | CORE -> `String "CORE" | TASK -> `String "TASK"

let instance_group_config_to_yojson (x : instance_group_config) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (integer_to_yojson x.instance_count));
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("EbsConfiguration", option_to_yojson ebs_configuration_to_yojson x.ebs_configuration);
      ("AutoScalingPolicy", option_to_yojson auto_scaling_policy_to_yojson x.auto_scaling_policy);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
    ]

let instance_group_config_list_to_yojson tree = list_to_yojson instance_group_config_to_yojson tree

let add_instance_groups_input_to_yojson (x : add_instance_groups_input) =
  assoc_to_yojson
    [
      ("InstanceGroups", Some (instance_group_config_list_to_yojson x.instance_groups));
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
    ]

let step_ids_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let add_job_flow_steps_output_to_yojson (x : add_job_flow_steps_output) =
  assoc_to_yojson [ ("StepIds", option_to_yojson step_ids_list_to_yojson x.step_ids) ]

let xml_string_to_yojson = string_to_yojson

let s3_monitoring_configuration_to_yojson (x : s3_monitoring_configuration) =
  assoc_to_yojson
    [
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
    ]

let step_monitoring_configuration_to_yojson (x : step_monitoring_configuration) =
  assoc_to_yojson
    [
      ( "S3MonitoringConfiguration",
        option_to_yojson s3_monitoring_configuration_to_yojson x.s3_monitoring_configuration );
    ]

let xml_string_list_to_yojson tree = list_to_yojson xml_string_to_yojson tree

let key_value_to_yojson (x : key_value) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson xml_string_to_yojson x.key);
      ("Value", option_to_yojson xml_string_to_yojson x.value);
    ]

let key_value_list_to_yojson tree = list_to_yojson key_value_to_yojson tree

let hadoop_jar_step_config_to_yojson (x : hadoop_jar_step_config) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson key_value_list_to_yojson x.properties);
      ("Jar", Some (xml_string_to_yojson x.jar));
      ("MainClass", option_to_yojson xml_string_to_yojson x.main_class);
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
    ]

let step_config_to_yojson (x : step_config) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("HadoopJarStep", Some (hadoop_jar_step_config_to_yojson x.hadoop_jar_step));
      ( "StepMonitoringConfiguration",
        option_to_yojson step_monitoring_configuration_to_yojson x.step_monitoring_configuration );
    ]

let step_config_list_to_yojson tree = list_to_yojson step_config_to_yojson tree

let add_job_flow_steps_input_to_yojson (x : add_job_flow_steps_input) =
  assoc_to_yojson
    [
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
      ("Steps", Some (step_config_list_to_yojson x.steps));
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
    ]

let add_tags_output_to_yojson = unit_to_yojson
let cluster_id_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let resource_id_to_yojson = string_to_yojson

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Args", option_to_yojson string_list_to_yojson x.args);
      ("AdditionalInfo", option_to_yojson string_map_to_yojson x.additional_info);
    ]

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree
let auth_mode_to_yojson (x : auth_mode) = match x with SSO -> `String "SSO" | IAM -> `String "IAM"

let auto_scaling_policy_state_change_reason_code_to_yojson
    (x : auto_scaling_policy_state_change_reason_code) =
  match x with
  | USER_REQUEST -> `String "USER_REQUEST"
  | PROVISION_FAILURE -> `String "PROVISION_FAILURE"
  | CLEANUP_FAILURE -> `String "CLEANUP_FAILURE"

let auto_scaling_policy_state_change_reason_to_yojson (x : auto_scaling_policy_state_change_reason)
    =
  assoc_to_yojson
    [
      ("Code", option_to_yojson auto_scaling_policy_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let auto_scaling_policy_state_to_yojson (x : auto_scaling_policy_state) =
  match x with
  | PENDING -> `String "PENDING"
  | ATTACHING -> `String "ATTACHING"
  | ATTACHED -> `String "ATTACHED"
  | DETACHING -> `String "DETACHING"
  | DETACHED -> `String "DETACHED"
  | FAILED -> `String "FAILED"

let auto_scaling_policy_status_to_yojson (x : auto_scaling_policy_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson auto_scaling_policy_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson auto_scaling_policy_state_change_reason_to_yojson x.state_change_reason );
    ]

let auto_scaling_policy_description_to_yojson (x : auto_scaling_policy_description) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson auto_scaling_policy_status_to_yojson x.status);
      ("Constraints", option_to_yojson scaling_constraints_to_yojson x.constraints);
      ("Rules", option_to_yojson scaling_rule_list_to_yojson x.rules);
    ]

let long_to_yojson = long_to_yojson

let auto_termination_policy_to_yojson (x : auto_termination_policy) =
  assoc_to_yojson [ ("IdleTimeout", option_to_yojson long_to_yojson x.idle_timeout) ]

let port_to_yojson = int_to_yojson

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("MinRange", Some (port_to_yojson x.min_range));
      ("MaxRange", option_to_yojson port_to_yojson x.max_range);
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree
let boolean__to_yojson = bool_to_yojson

let block_public_access_configuration_to_yojson (x : block_public_access_configuration) =
  assoc_to_yojson
    [
      ( "BlockPublicSecurityGroupRules",
        Some (boolean__to_yojson x.block_public_security_group_rules) );
      ( "PermittedPublicSecurityGroupRuleRanges",
        option_to_yojson port_ranges_to_yojson x.permitted_public_security_group_rule_ranges );
      ("Classification", option_to_yojson string__to_yojson x.classification);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
    ]

let date_to_yojson = timestamp_epoch_seconds_to_yojson

let block_public_access_configuration_metadata_to_yojson
    (x : block_public_access_configuration_metadata) =
  assoc_to_yojson
    [
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("CreatedByArn", Some (arn_type_to_yojson x.created_by_arn));
    ]

let script_bootstrap_action_config_to_yojson (x : script_bootstrap_action_config) =
  assoc_to_yojson
    [
      ("Path", Some (xml_string_to_yojson x.path));
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
    ]

let bootstrap_action_config_to_yojson (x : bootstrap_action_config) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ( "ScriptBootstrapAction",
        Some (script_bootstrap_action_config_to_yojson x.script_bootstrap_action) );
    ]

let bootstrap_action_config_list_to_yojson tree =
  list_to_yojson bootstrap_action_config_to_yojson tree

let bootstrap_action_detail_to_yojson (x : bootstrap_action_detail) =
  assoc_to_yojson
    [
      ( "BootstrapActionConfig",
        option_to_yojson bootstrap_action_config_to_yojson x.bootstrap_action_config );
    ]

let bootstrap_action_detail_list_to_yojson tree =
  list_to_yojson bootstrap_action_detail_to_yojson tree

let cancel_steps_request_status_to_yojson (x : cancel_steps_request_status) =
  match x with SUBMITTED -> `String "SUBMITTED" | FAILED -> `String "FAILED"

let step_id_to_yojson = string_to_yojson

let cancel_steps_info_to_yojson (x : cancel_steps_info) =
  assoc_to_yojson
    [
      ("StepId", option_to_yojson step_id_to_yojson x.step_id);
      ("Status", option_to_yojson cancel_steps_request_status_to_yojson x.status);
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let cancel_steps_info_list_to_yojson tree = list_to_yojson cancel_steps_info_to_yojson tree

let cancel_steps_output_to_yojson (x : cancel_steps_output) =
  assoc_to_yojson
    [
      ( "CancelStepsInfoList",
        option_to_yojson cancel_steps_info_list_to_yojson x.cancel_steps_info_list );
    ]

let step_cancellation_option_to_yojson (x : step_cancellation_option) =
  match x with
  | SEND_INTERRUPT -> `String "SEND_INTERRUPT"
  | TERMINATE_PROCESS -> `String "TERMINATE_PROCESS"

let cancel_steps_input_to_yojson (x : cancel_steps_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
      ("StepIds", Some (step_ids_list_to_yojson x.step_ids));
      ( "StepCancellationOption",
        option_to_yojson step_cancellation_option_to_yojson x.step_cancellation_option );
    ]

let certificate_authority_to_yojson (x : certificate_authority) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson xml_string_to_yojson x.certificate_arn);
      ("CertificateData", option_to_yojson xml_string_to_yojson x.certificate_data);
    ]

let client_request_token_to_yojson = string_to_yojson
let log_types_map_to_yojson tree = map_to_yojson xml_string_to_yojson xml_string_list_to_yojson tree

let cloud_watch_log_configuration_to_yojson (x : cloud_watch_log_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ("LogGroupName", option_to_yojson xml_string_to_yojson x.log_group_name);
      ("LogStreamNamePrefix", option_to_yojson xml_string_to_yojson x.log_stream_name_prefix);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
    ]

let log_upload_policy_value_to_yojson (x : log_upload_policy_value) =
  match x with
  | EMR_MANAGED -> `String "emr-managed"
  | ON_CUSTOMER_S3ONLY -> `String "on-customer-s3only"
  | DISABLED -> `String "disabled"

let log_type_to_yojson (x : log_type) =
  match x with
  | SYSTEM_LOGS -> `String "system-logs"
  | APPLICATION_LOGS -> `String "application-logs"
  | PERSISTENT_UI_LOGS -> `String "persistent-ui-logs"

let log_type_map_to_yojson tree =
  map_to_yojson log_type_to_yojson log_upload_policy_value_to_yojson tree

let s3_logging_configuration_to_yojson (x : s3_logging_configuration) =
  assoc_to_yojson
    [ ("LogTypeUploadPolicy", option_to_yojson log_type_map_to_yojson x.log_type_upload_policy) ]

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "CloudWatchLogConfiguration",
        option_to_yojson cloud_watch_log_configuration_to_yojson x.cloud_watch_log_configuration );
      ( "S3LoggingConfiguration",
        option_to_yojson s3_logging_configuration_to_yojson x.s3_logging_configuration );
    ]

let placement_group_strategy_to_yojson (x : placement_group_strategy) =
  match x with
  | SPREAD -> `String "SPREAD"
  | PARTITION -> `String "PARTITION"
  | CLUSTER -> `String "CLUSTER"
  | NONE -> `String "NONE"

let placement_group_config_to_yojson (x : placement_group_config) =
  assoc_to_yojson
    [
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
      ("PlacementStrategy", option_to_yojson placement_group_strategy_to_yojson x.placement_strategy);
    ]

let placement_group_config_list_to_yojson tree =
  list_to_yojson placement_group_config_to_yojson tree

let optional_arn_type_to_yojson = string_to_yojson

let kerberos_attributes_to_yojson (x : kerberos_attributes) =
  assoc_to_yojson
    [
      ("Realm", Some (xml_string_max_len256_to_yojson x.realm));
      ("KdcAdminPassword", Some (xml_string_max_len256_to_yojson x.kdc_admin_password));
      ( "CrossRealmTrustPrincipalPassword",
        option_to_yojson xml_string_max_len256_to_yojson x.cross_realm_trust_principal_password );
      ("ADDomainJoinUser", option_to_yojson xml_string_max_len256_to_yojson x.ad_domain_join_user);
      ( "ADDomainJoinPassword",
        option_to_yojson xml_string_max_len256_to_yojson x.ad_domain_join_password );
    ]

let repo_upgrade_on_boot_to_yojson (x : repo_upgrade_on_boot) =
  match x with SECURITY -> `String "SECURITY" | NONE -> `String "NONE"

let scale_down_behavior_to_yojson (x : scale_down_behavior) =
  match x with
  | TERMINATE_AT_INSTANCE_HOUR -> `String "TERMINATE_AT_INSTANCE_HOUR"
  | TERMINATE_AT_TASK_COMPLETION -> `String "TERMINATE_AT_TASK_COMPLETION"

let instance_collection_type_to_yojson (x : instance_collection_type) =
  match x with
  | INSTANCE_FLEET -> `String "INSTANCE_FLEET"
  | INSTANCE_GROUP -> `String "INSTANCE_GROUP"

let xml_string_max_len256_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let ec2_instance_attributes_to_yojson (x : ec2_instance_attributes) =
  assoc_to_yojson
    [
      ("Ec2KeyName", option_to_yojson string__to_yojson x.ec2_key_name);
      ("Ec2SubnetId", option_to_yojson string__to_yojson x.ec2_subnet_id);
      ( "RequestedEc2SubnetIds",
        option_to_yojson xml_string_max_len256_list_to_yojson x.requested_ec2_subnet_ids );
      ("Ec2AvailabilityZone", option_to_yojson string__to_yojson x.ec2_availability_zone);
      ( "RequestedEc2AvailabilityZones",
        option_to_yojson xml_string_max_len256_list_to_yojson x.requested_ec2_availability_zones );
      ("IamInstanceProfile", option_to_yojson string__to_yojson x.iam_instance_profile);
      ( "EmrManagedMasterSecurityGroup",
        option_to_yojson string__to_yojson x.emr_managed_master_security_group );
      ( "EmrManagedSlaveSecurityGroup",
        option_to_yojson string__to_yojson x.emr_managed_slave_security_group );
      ( "ServiceAccessSecurityGroup",
        option_to_yojson string__to_yojson x.service_access_security_group );
      ( "AdditionalMasterSecurityGroups",
        option_to_yojson string_list_to_yojson x.additional_master_security_groups );
      ( "AdditionalSlaveSecurityGroups",
        option_to_yojson string_list_to_yojson x.additional_slave_security_groups );
    ]

let error_data_to_yojson tree = list_to_yojson string_map_to_yojson tree

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorData", option_to_yojson error_data_to_yojson x.error_data);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let error_detail_list_to_yojson tree = list_to_yojson error_detail_to_yojson tree

let cluster_timeline_to_yojson (x : cluster_timeline) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
    ]

let cluster_state_change_reason_code_to_yojson (x : cluster_state_change_reason_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | INSTANCE_FLEET_TIMEOUT -> `String "INSTANCE_FLEET_TIMEOUT"
  | BOOTSTRAP_FAILURE -> `String "BOOTSTRAP_FAILURE"
  | USER_REQUEST -> `String "USER_REQUEST"
  | STEP_FAILURE -> `String "STEP_FAILURE"
  | ALL_STEPS_COMPLETED -> `String "ALL_STEPS_COMPLETED"

let cluster_state_change_reason_to_yojson (x : cluster_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson cluster_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let cluster_state_to_yojson (x : cluster_state) =
  match x with
  | STARTING -> `String "STARTING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | RUNNING -> `String "RUNNING"
  | WAITING -> `String "WAITING"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATED_WITH_ERRORS -> `String "TERMINATED_WITH_ERRORS"

let cluster_status_to_yojson (x : cluster_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson cluster_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson cluster_state_change_reason_to_yojson x.state_change_reason );
      ("Timeline", option_to_yojson cluster_timeline_to_yojson x.timeline);
      ("ErrorDetails", option_to_yojson error_detail_list_to_yojson x.error_details);
    ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson cluster_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson cluster_status_to_yojson x.status);
      ( "Ec2InstanceAttributes",
        option_to_yojson ec2_instance_attributes_to_yojson x.ec2_instance_attributes );
      ( "InstanceCollectionType",
        option_to_yojson instance_collection_type_to_yojson x.instance_collection_type );
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ("LogEncryptionKmsKeyId", option_to_yojson string__to_yojson x.log_encryption_kms_key_id);
      ("RequestedAmiVersion", option_to_yojson string__to_yojson x.requested_ami_version);
      ("RunningAmiVersion", option_to_yojson string__to_yojson x.running_ami_version);
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
      ("AutoTerminate", option_to_yojson boolean__to_yojson x.auto_terminate);
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServiceRole", option_to_yojson string__to_yojson x.service_role);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("MasterPublicDnsName", option_to_yojson string__to_yojson x.master_public_dns_name);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("SecurityConfiguration", option_to_yojson xml_string_to_yojson x.security_configuration);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("EbsRootVolumeSize", option_to_yojson integer_to_yojson x.ebs_root_volume_size);
      ("RepoUpgradeOnBoot", option_to_yojson repo_upgrade_on_boot_to_yojson x.repo_upgrade_on_boot);
      ("KerberosAttributes", option_to_yojson kerberos_attributes_to_yojson x.kerberos_attributes);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("OutpostArn", option_to_yojson optional_arn_type_to_yojson x.outpost_arn);
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("PlacementGroups", option_to_yojson placement_group_config_list_to_yojson x.placement_groups);
      ("OSReleaseLabel", option_to_yojson string__to_yojson x.os_release_label);
      ("EbsRootVolumeIops", option_to_yojson integer_to_yojson x.ebs_root_volume_iops);
      ("EbsRootVolumeThroughput", option_to_yojson integer_to_yojson x.ebs_root_volume_throughput);
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("SessionEnabled", option_to_yojson boolean_object_to_yojson x.session_enabled);
    ]

let cluster_state_list_to_yojson tree = list_to_yojson cluster_state_to_yojson tree

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson cluster_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson cluster_status_to_yojson x.status);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("OutpostArn", option_to_yojson optional_arn_type_to_yojson x.outpost_arn);
    ]

let cluster_summary_list_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree

let command_to_yojson (x : command) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("ScriptPath", option_to_yojson string__to_yojson x.script_path);
      ("Args", option_to_yojson string_list_to_yojson x.args);
    ]

let command_list_to_yojson tree = list_to_yojson command_to_yojson tree

let compute_limits_unit_type_to_yojson (x : compute_limits_unit_type) =
  match x with
  | InstanceFleetUnits -> `String "InstanceFleetUnits"
  | Instances -> `String "Instances"
  | VCPU -> `String "VCPU"

let compute_limits_to_yojson (x : compute_limits) =
  assoc_to_yojson
    [
      ("UnitType", Some (compute_limits_unit_type_to_yojson x.unit_type));
      ("MinimumCapacityUnits", Some (integer_to_yojson x.minimum_capacity_units));
      ("MaximumCapacityUnits", Some (integer_to_yojson x.maximum_capacity_units));
      ( "MaximumOnDemandCapacityUnits",
        option_to_yojson integer_to_yojson x.maximum_on_demand_capacity_units );
      ("MaximumCoreCapacityUnits", option_to_yojson integer_to_yojson x.maximum_core_capacity_units);
    ]

let create_persistent_app_ui_output_to_yojson (x : create_persistent_app_ui_output) =
  assoc_to_yojson
    [
      ("PersistentAppUIId", option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_id);
      ( "RuntimeRoleEnabledCluster",
        option_to_yojson boolean__to_yojson x.runtime_role_enabled_cluster );
    ]

let profiler_type_to_yojson (x : profiler_type) =
  match x with SHS -> `String "SHS" | TEZUI -> `String "TEZUI" | YTS -> `String "YTS"

let emr_containers_config_to_yojson (x : emr_containers_config) =
  assoc_to_yojson [ ("JobRunId", option_to_yojson xml_string_max_len256_to_yojson x.job_run_id) ]

let create_persistent_app_ui_input_to_yojson (x : create_persistent_app_ui_input) =
  assoc_to_yojson
    [
      ("TargetResourceArn", Some (arn_type_to_yojson x.target_resource_arn));
      ( "EMRContainersConfig",
        option_to_yojson emr_containers_config_to_yojson x.emr_containers_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("XReferer", option_to_yojson string__to_yojson x.x_referer);
      ("ProfilerType", option_to_yojson profiler_type_to_yojson x.profiler_type);
    ]

let create_security_configuration_output_to_yojson (x : create_security_configuration_output) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_to_yojson x.name));
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
    ]

let create_security_configuration_input_to_yojson (x : create_security_configuration_input) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_to_yojson x.name));
      ("SecurityConfiguration", Some (string__to_yojson x.security_configuration));
    ]

let create_studio_output_to_yojson (x : create_studio_output) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("Url", option_to_yojson xml_string_to_yojson x.url);
    ]

let idc_user_assignment_to_yojson (x : idc_user_assignment) =
  match x with REQUIRED -> `String "REQUIRED" | OPTIONAL -> `String "OPTIONAL"

let subnet_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let create_studio_input_to_yojson (x : create_studio_input) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("AuthMode", Some (auth_mode_to_yojson x.auth_mode));
      ("VpcId", Some (xml_string_max_len256_to_yojson x.vpc_id));
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("ServiceRole", Some (xml_string_to_yojson x.service_role));
      ("UserRole", option_to_yojson xml_string_to_yojson x.user_role);
      ( "WorkspaceSecurityGroupId",
        Some (xml_string_max_len256_to_yojson x.workspace_security_group_id) );
      ("EngineSecurityGroupId", Some (xml_string_max_len256_to_yojson x.engine_security_group_id));
      ("DefaultS3Location", Some (xml_string_to_yojson x.default_s3_location));
      ("IdpAuthUrl", option_to_yojson xml_string_to_yojson x.idp_auth_url);
      ( "IdpRelayStateParameterName",
        option_to_yojson xml_string_max_len256_to_yojson x.idp_relay_state_parameter_name );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TrustedIdentityPropagationEnabled",
        option_to_yojson boolean_object_to_yojson x.trusted_identity_propagation_enabled );
      ("IdcUserAssignment", option_to_yojson idc_user_assignment_to_yojson x.idc_user_assignment);
      ("IdcInstanceArn", option_to_yojson arn_type_to_yojson x.idc_instance_arn);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
    ]

let identity_type_to_yojson (x : identity_type) =
  match x with USER -> `String "USER" | GROUP -> `String "GROUP"

let create_studio_session_mapping_input_to_yojson (x : create_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("SessionPolicyArn", Some (xml_string_max_len256_to_yojson x.session_policy_arn));
    ]

let username_password_to_yojson (x : username_password) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson xml_string_max_len256_to_yojson x.username);
      ("Password", option_to_yojson xml_string_max_len256_to_yojson x.password);
    ]

let credentials_to_yojson (x : credentials) =
  match x with
  | UsernamePassword arg ->
      assoc_to_yojson [ ("UsernamePassword", Some (username_password_to_yojson arg)) ]

let delete_security_configuration_output_to_yojson = unit_to_yojson

let delete_security_configuration_input_to_yojson (x : delete_security_configuration_input) =
  assoc_to_yojson [ ("Name", Some (xml_string_to_yojson x.name)) ]

let delete_studio_input_to_yojson (x : delete_studio_input) =
  assoc_to_yojson [ ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id)) ]

let delete_studio_session_mapping_input_to_yojson (x : delete_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
    ]

let describe_cluster_output_to_yojson (x : describe_cluster_output) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let describe_cluster_input_to_yojson (x : describe_cluster_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let supported_products_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let step_execution_state_to_yojson (x : step_execution_state) =
  match x with
  | PENDING -> `String "PENDING"
  | RUNNING -> `String "RUNNING"
  | CONTINUE -> `String "CONTINUE"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | INTERRUPTED -> `String "INTERRUPTED"

let step_execution_status_detail_to_yojson (x : step_execution_status_detail) =
  assoc_to_yojson
    [
      ("State", Some (step_execution_state_to_yojson x.state));
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
    ]

let step_detail_to_yojson (x : step_detail) =
  assoc_to_yojson
    [
      ("StepConfig", Some (step_config_to_yojson x.step_config));
      ( "ExecutionStatusDetail",
        Some (step_execution_status_detail_to_yojson x.execution_status_detail) );
    ]

let step_detail_list_to_yojson tree = list_to_yojson step_detail_to_yojson tree

let placement_type_to_yojson (x : placement_type) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson xml_string_to_yojson x.availability_zone);
      ( "AvailabilityZones",
        option_to_yojson xml_string_max_len256_list_to_yojson x.availability_zones );
    ]

let instance_group_state_to_yojson (x : instance_group_state) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | RUNNING -> `String "RUNNING"
  | RECONFIGURING -> `String "RECONFIGURING"
  | RESIZING -> `String "RESIZING"
  | SUSPENDED -> `String "SUSPENDED"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | ARRESTED -> `String "ARRESTED"
  | SHUTTING_DOWN -> `String "SHUTTING_DOWN"
  | ENDED -> `String "ENDED"

let instance_group_detail_to_yojson (x : instance_group_detail) =
  assoc_to_yojson
    [
      ("InstanceGroupId", option_to_yojson xml_string_max_len256_to_yojson x.instance_group_id);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Market", Some (market_type_to_yojson x.market));
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("InstanceRequestCount", Some (integer_to_yojson x.instance_request_count));
      ("InstanceRunningCount", Some (integer_to_yojson x.instance_running_count));
      ("State", Some (instance_group_state_to_yojson x.state));
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
    ]

let instance_group_detail_list_to_yojson tree = list_to_yojson instance_group_detail_to_yojson tree

let job_flow_instances_detail_to_yojson (x : job_flow_instances_detail) =
  assoc_to_yojson
    [
      ("MasterInstanceType", Some (instance_type_to_yojson x.master_instance_type));
      ("MasterPublicDnsName", option_to_yojson xml_string_to_yojson x.master_public_dns_name);
      ("MasterInstanceId", option_to_yojson xml_string_to_yojson x.master_instance_id);
      ("SlaveInstanceType", Some (instance_type_to_yojson x.slave_instance_type));
      ("InstanceCount", Some (integer_to_yojson x.instance_count));
      ("InstanceGroups", option_to_yojson instance_group_detail_list_to_yojson x.instance_groups);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("Ec2KeyName", option_to_yojson xml_string_max_len256_to_yojson x.ec2_key_name);
      ("Ec2SubnetId", option_to_yojson xml_string_max_len256_to_yojson x.ec2_subnet_id);
      ("Placement", option_to_yojson placement_type_to_yojson x.placement);
      ( "KeepJobFlowAliveWhenNoSteps",
        option_to_yojson boolean__to_yojson x.keep_job_flow_alive_when_no_steps );
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("HadoopVersion", option_to_yojson xml_string_max_len256_to_yojson x.hadoop_version);
    ]

let job_flow_execution_state_to_yojson (x : job_flow_execution_state) =
  match x with
  | STARTING -> `String "STARTING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | RUNNING -> `String "RUNNING"
  | WAITING -> `String "WAITING"
  | SHUTTING_DOWN -> `String "SHUTTING_DOWN"
  | TERMINATED -> `String "TERMINATED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let job_flow_execution_status_detail_to_yojson (x : job_flow_execution_status_detail) =
  assoc_to_yojson
    [
      ("State", Some (job_flow_execution_state_to_yojson x.state));
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
    ]

let job_flow_detail_to_yojson (x : job_flow_detail) =
  assoc_to_yojson
    [
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("LogEncryptionKmsKeyId", option_to_yojson xml_string_to_yojson x.log_encryption_kms_key_id);
      ("AmiVersion", option_to_yojson xml_string_max_len256_to_yojson x.ami_version);
      ( "ExecutionStatusDetail",
        Some (job_flow_execution_status_detail_to_yojson x.execution_status_detail) );
      ("Instances", Some (job_flow_instances_detail_to_yojson x.instances));
      ("Steps", option_to_yojson step_detail_list_to_yojson x.steps);
      ( "BootstrapActions",
        option_to_yojson bootstrap_action_detail_list_to_yojson x.bootstrap_actions );
      ("SupportedProducts", option_to_yojson supported_products_list_to_yojson x.supported_products);
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ("JobFlowRole", option_to_yojson xml_string_to_yojson x.job_flow_role);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
    ]

let job_flow_detail_list_to_yojson tree = list_to_yojson job_flow_detail_to_yojson tree

let describe_job_flows_output_to_yojson (x : describe_job_flows_output) =
  assoc_to_yojson [ ("JobFlows", option_to_yojson job_flow_detail_list_to_yojson x.job_flows) ]

let job_flow_execution_state_list_to_yojson tree =
  list_to_yojson job_flow_execution_state_to_yojson tree

let describe_job_flows_input_to_yojson (x : describe_job_flows_input) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson date_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson date_to_yojson x.created_before);
      ("JobFlowIds", option_to_yojson xml_string_list_to_yojson x.job_flow_ids);
      ("JobFlowStates", option_to_yojson job_flow_execution_state_list_to_yojson x.job_flow_states);
    ]

let environment_variables_map_to_yojson tree =
  map_to_yojson xml_string_max_len256_to_yojson xml_string_to_yojson tree

let output_notebook_format_to_yojson (x : output_notebook_format) =
  match x with HTML -> `String "HTML"

let uri_string_to_yojson = string_to_yojson

let output_notebook_s3_location_for_output_to_yojson (x : output_notebook_s3_location_for_output) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
      ("Key", option_to_yojson uri_string_to_yojson x.key);
    ]

let notebook_s3_location_for_output_to_yojson (x : notebook_s3_location_for_output) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
      ("Key", option_to_yojson uri_string_to_yojson x.key);
    ]

let notebook_execution_status_to_yojson (x : notebook_execution_status) =
  match x with
  | START_PENDING -> `String "START_PENDING"
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | FINISHING -> `String "FINISHING"
  | FINISHED -> `String "FINISHED"
  | FAILING -> `String "FAILING"
  | FAILED -> `String "FAILED"
  | STOP_PENDING -> `String "STOP_PENDING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let iam_role_arn_to_yojson = string_to_yojson

let execution_engine_type_to_yojson (x : execution_engine_type) =
  match x with EMR -> `String "EMR"

let execution_engine_config_to_yojson (x : execution_engine_config) =
  assoc_to_yojson
    [
      ("Id", Some (xml_string_max_len256_to_yojson x.id));
      ("Type", option_to_yojson execution_engine_type_to_yojson x.type_);
      ( "MasterInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.master_instance_security_group_id );
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
    ]

let notebook_execution_to_yojson (x : notebook_execution) =
  assoc_to_yojson
    [
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ("ExecutionEngine", option_to_yojson execution_engine_config_to_yojson x.execution_engine);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("NotebookParams", option_to_yojson xml_string_to_yojson x.notebook_params);
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("Arn", option_to_yojson xml_string_max_len256_to_yojson x.arn);
      ("OutputNotebookURI", option_to_yojson xml_string_to_yojson x.output_notebook_ur_i);
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ( "NotebookInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_instance_security_group_id );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_for_output_to_yojson x.notebook_s3_location );
      ( "OutputNotebookS3Location",
        option_to_yojson output_notebook_s3_location_for_output_to_yojson
          x.output_notebook_s3_location );
      ( "OutputNotebookFormat",
        option_to_yojson output_notebook_format_to_yojson x.output_notebook_format );
      ( "EnvironmentVariables",
        option_to_yojson environment_variables_map_to_yojson x.environment_variables );
    ]

let describe_notebook_execution_output_to_yojson (x : describe_notebook_execution_output) =
  assoc_to_yojson
    [ ("NotebookExecution", option_to_yojson notebook_execution_to_yojson x.notebook_execution) ]

let describe_notebook_execution_input_to_yojson (x : describe_notebook_execution_input) =
  assoc_to_yojson
    [ ("NotebookExecutionId", Some (xml_string_max_len256_to_yojson x.notebook_execution_id)) ]

let persistent_app_ui_type_to_yojson (x : persistent_app_ui_type) =
  match x with SHS -> `String "SHS" | TEZ -> `String "TEZ" | YTS -> `String "YTS"

let persistent_app_ui_type_list_to_yojson tree =
  list_to_yojson persistent_app_ui_type_to_yojson tree

let persistent_app_u_i_to_yojson (x : persistent_app_u_i) =
  assoc_to_yojson
    [
      ("PersistentAppUIId", option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_id);
      ( "PersistentAppUITypeList",
        option_to_yojson persistent_app_ui_type_list_to_yojson x.persistent_app_ui_type_list );
      ( "PersistentAppUIStatus",
        option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_status );
      ("AuthorId", option_to_yojson xml_string_max_len256_to_yojson x.author_id);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_persistent_app_ui_output_to_yojson (x : describe_persistent_app_ui_output) =
  assoc_to_yojson
    [ ("PersistentAppUI", option_to_yojson persistent_app_u_i_to_yojson x.persistent_app_u_i) ]

let describe_persistent_app_ui_input_to_yojson (x : describe_persistent_app_ui_input) =
  assoc_to_yojson
    [ ("PersistentAppUIId", Some (xml_string_max_len256_to_yojson x.persistent_app_ui_id)) ]

let os_release_to_yojson (x : os_release) =
  assoc_to_yojson [ ("Label", option_to_yojson string__to_yojson x.label) ]

let os_release_list_to_yojson tree = list_to_yojson os_release_to_yojson tree

let simplified_application_to_yojson (x : simplified_application) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let simplified_application_list_to_yojson tree =
  list_to_yojson simplified_application_to_yojson tree

let describe_release_label_output_to_yojson (x : describe_release_label_output) =
  assoc_to_yojson
    [
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
      ("Applications", option_to_yojson simplified_application_list_to_yojson x.applications);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("AvailableOSReleases", option_to_yojson os_release_list_to_yojson x.available_os_releases);
    ]

let max_results_number_to_yojson = int_to_yojson

let describe_release_label_input_to_yojson (x : describe_release_label_input) =
  assoc_to_yojson
    [
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
    ]

let describe_security_configuration_output_to_yojson (x : describe_security_configuration_output) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_to_yojson x.name);
      ("SecurityConfiguration", option_to_yojson string__to_yojson x.security_configuration);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let describe_security_configuration_input_to_yojson (x : describe_security_configuration_input) =
  assoc_to_yojson [ ("Name", Some (xml_string_to_yojson x.name)) ]

let step_timeline_to_yojson (x : step_timeline) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
    ]

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("LogFile", option_to_yojson string__to_yojson x.log_file);
    ]

let step_state_change_reason_code_to_yojson (x : step_state_change_reason_code) =
  match x with NONE -> `String "NONE"

let step_state_change_reason_to_yojson (x : step_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson step_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let step_state_to_yojson (x : step_state) =
  match x with
  | PENDING -> `String "PENDING"
  | CANCEL_PENDING -> `String "CANCEL_PENDING"
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | INTERRUPTED -> `String "INTERRUPTED"

let step_status_to_yojson (x : step_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson step_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson step_state_change_reason_to_yojson x.state_change_reason );
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("Timeline", option_to_yojson step_timeline_to_yojson x.timeline);
    ]

let hadoop_step_config_to_yojson (x : hadoop_step_config) =
  assoc_to_yojson
    [
      ("Jar", option_to_yojson string__to_yojson x.jar);
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
      ("MainClass", option_to_yojson string__to_yojson x.main_class);
      ("Args", option_to_yojson string_list_to_yojson x.args);
    ]

let step_to_yojson (x : step) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson step_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Config", option_to_yojson hadoop_step_config_to_yojson x.config);
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("Status", option_to_yojson step_status_to_yojson x.status);
      ("ExecutionRoleArn", option_to_yojson optional_arn_type_to_yojson x.execution_role_arn);
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ("EncryptionKeyArn", option_to_yojson string__to_yojson x.encryption_key_arn);
    ]

let describe_step_output_to_yojson (x : describe_step_output) =
  assoc_to_yojson [ ("Step", option_to_yojson step_to_yojson x.step) ]

let describe_step_input_to_yojson (x : describe_step_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("StepId", Some (step_id_to_yojson x.step_id));
    ]

let studio_to_yojson (x : studio) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("StudioArn", option_to_yojson xml_string_max_len256_to_yojson x.studio_arn);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ("VpcId", option_to_yojson xml_string_max_len256_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("UserRole", option_to_yojson xml_string_to_yojson x.user_role);
      ( "WorkspaceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.workspace_security_group_id );
      ( "EngineSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.engine_security_group_id );
      ("Url", option_to_yojson xml_string_to_yojson x.url);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("DefaultS3Location", option_to_yojson xml_string_to_yojson x.default_s3_location);
      ("IdpAuthUrl", option_to_yojson xml_string_to_yojson x.idp_auth_url);
      ( "IdpRelayStateParameterName",
        option_to_yojson xml_string_max_len256_to_yojson x.idp_relay_state_parameter_name );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("IdcInstanceArn", option_to_yojson arn_type_to_yojson x.idc_instance_arn);
      ( "TrustedIdentityPropagationEnabled",
        option_to_yojson boolean_object_to_yojson x.trusted_identity_propagation_enabled );
      ("IdcUserAssignment", option_to_yojson idc_user_assignment_to_yojson x.idc_user_assignment);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
    ]

let describe_studio_output_to_yojson (x : describe_studio_output) =
  assoc_to_yojson [ ("Studio", option_to_yojson studio_to_yojson x.studio) ]

let describe_studio_input_to_yojson (x : describe_studio_input) =
  assoc_to_yojson [ ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id)) ]

let instance_id_to_yojson = string_to_yojson
let ec2_instance_ids_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree
let ec2_instance_ids_to_terminate_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let ebs_block_device_to_yojson (x : ebs_block_device) =
  assoc_to_yojson
    [
      ("VolumeSpecification", option_to_yojson volume_specification_to_yojson x.volume_specification);
      ("Device", option_to_yojson string__to_yojson x.device);
    ]

let ebs_block_device_list_to_yojson tree = list_to_yojson ebs_block_device_to_yojson tree

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [
      ("Device", option_to_yojson string__to_yojson x.device);
      ("VolumeId", option_to_yojson string__to_yojson x.volume_id);
    ]

let ebs_volume_list_to_yojson tree = list_to_yojson ebs_volume_to_yojson tree

let update_studio_session_mapping_input_to_yojson (x : update_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("SessionPolicyArn", Some (xml_string_max_len256_to_yojson x.session_policy_arn));
    ]

let update_studio_input_to_yojson (x : update_studio_input) =
  assoc_to_yojson
    [
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("DefaultS3Location", option_to_yojson xml_string_to_yojson x.default_s3_location);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
    ]

let session_state_to_yojson (x : session_state) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | STARTING -> `String "STARTING"
  | STARTED -> `String "STARTED"
  | IDLE -> `String "IDLE"
  | BUSY -> `String "BUSY"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | FAILED -> `String "FAILED"

let session_id_to_yojson = string_to_yojson

let terminate_session_output_to_yojson (x : terminate_session_output) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("State", Some (session_state_to_yojson x.state));
    ]

let terminate_session_input_to_yojson (x : terminate_session_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let terminate_job_flows_input_to_yojson (x : terminate_job_flows_input) =
  assoc_to_yojson [ ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids)) ]

let stop_notebook_execution_input_to_yojson (x : stop_notebook_execution_input) =
  assoc_to_yojson
    [ ("NotebookExecutionId", Some (xml_string_max_len256_to_yojson x.notebook_execution_id)) ]

let start_session_output_to_yojson (x : start_session_output) =
  assoc_to_yojson
    [
      ("Id", Some (session_id_to_yojson x.id));
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ("AccountId", option_to_yojson xml_string_max_len256_to_yojson x.account_id);
      ("State", option_to_yojson session_state_to_yojson x.state);
    ]

let session_s3_logging_configuration_to_yojson (x : session_s3_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
    ]

let session_managed_logging_configuration_to_yojson (x : session_managed_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
    ]

let session_cloud_watch_logging_configuration_to_yojson
    (x : session_cloud_watch_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("LogGroup", option_to_yojson xml_string_to_yojson x.log_group);
      ("LogStreamNamePrefix", option_to_yojson xml_string_to_yojson x.log_stream_name_prefix);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
    ]

let session_monitoring_configuration_to_yojson (x : session_monitoring_configuration) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingConfiguration",
        option_to_yojson session_cloud_watch_logging_configuration_to_yojson
          x.cloud_watch_logging_configuration );
      ( "ManagedLoggingConfiguration",
        option_to_yojson session_managed_logging_configuration_to_yojson
          x.managed_logging_configuration );
      ( "S3LoggingConfiguration",
        option_to_yojson session_s3_logging_configuration_to_yojson x.s3_logging_configuration );
    ]

let start_session_input_to_yojson (x : start_session_input) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
      ("EngineConfigurations", option_to_yojson configuration_list_to_yojson x.engine_configurations);
      ( "MonitoringConfiguration",
        option_to_yojson session_monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson long_to_yojson x.session_idle_timeout_in_minutes );
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_notebook_execution_output_to_yojson (x : start_notebook_execution_output) =
  assoc_to_yojson
    [
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
    ]

let output_notebook_s3_location_from_input_to_yojson (x : output_notebook_s3_location_from_input) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
      ("Key", option_to_yojson uri_string_to_yojson x.key);
    ]

let notebook_s3_location_from_input_to_yojson (x : notebook_s3_location_from_input) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
      ("Key", option_to_yojson uri_string_to_yojson x.key);
    ]

let start_notebook_execution_input_to_yojson (x : start_notebook_execution_input) =
  assoc_to_yojson
    [
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ("RelativePath", option_to_yojson xml_string_to_yojson x.relative_path);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("NotebookParams", option_to_yojson xml_string_to_yojson x.notebook_params);
      ("ExecutionEngine", Some (execution_engine_config_to_yojson x.execution_engine));
      ("ServiceRole", Some (xml_string_to_yojson x.service_role));
      ( "NotebookInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_instance_security_group_id );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_from_input_to_yojson x.notebook_s3_location );
      ( "OutputNotebookS3Location",
        option_to_yojson output_notebook_s3_location_from_input_to_yojson
          x.output_notebook_s3_location );
      ( "OutputNotebookFormat",
        option_to_yojson output_notebook_format_to_yojson x.output_notebook_format );
      ( "EnvironmentVariables",
        option_to_yojson environment_variables_map_to_yojson x.environment_variables );
    ]

let set_visible_to_all_users_input_to_yojson (x : set_visible_to_all_users_input) =
  assoc_to_yojson
    [
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
      ("VisibleToAllUsers", Some (boolean__to_yojson x.visible_to_all_users));
    ]

let set_unhealthy_node_replacement_input_to_yojson (x : set_unhealthy_node_replacement_input) =
  assoc_to_yojson
    [
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
      ("UnhealthyNodeReplacement", Some (boolean_object_to_yojson x.unhealthy_node_replacement));
    ]

let set_termination_protection_input_to_yojson (x : set_termination_protection_input) =
  assoc_to_yojson
    [
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
      ("TerminationProtected", Some (boolean__to_yojson x.termination_protected));
    ]

let set_keep_job_flow_alive_when_no_steps_input_to_yojson
    (x : set_keep_job_flow_alive_when_no_steps_input) =
  assoc_to_yojson
    [
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
      ("KeepJobFlowAliveWhenNoSteps", Some (boolean__to_yojson x.keep_job_flow_alive_when_no_steps));
    ]

let run_job_flow_output_to_yojson (x : run_job_flow_output) =
  assoc_to_yojson
    [
      ("JobFlowId", option_to_yojson xml_string_max_len256_to_yojson x.job_flow_id);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
    ]

let scaling_strategy_to_yojson (x : scaling_strategy) =
  match x with DEFAULT -> `String "DEFAULT" | ADVANCED -> `String "ADVANCED"

let utilization_performance_index_integer_to_yojson = int_to_yojson

let managed_scaling_policy_to_yojson (x : managed_scaling_policy) =
  assoc_to_yojson
    [
      ("ComputeLimits", option_to_yojson compute_limits_to_yojson x.compute_limits);
      ( "UtilizationPerformanceIndex",
        option_to_yojson utilization_performance_index_integer_to_yojson
          x.utilization_performance_index );
      ("ScalingStrategy", option_to_yojson scaling_strategy_to_yojson x.scaling_strategy);
    ]

let supported_product_config_to_yojson (x : supported_product_config) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
    ]

let new_supported_products_list_to_yojson tree =
  list_to_yojson supported_product_config_to_yojson tree

let security_groups_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree
let instance_fleet_config_list_to_yojson tree = list_to_yojson instance_fleet_config_to_yojson tree

let job_flow_instances_config_to_yojson (x : job_flow_instances_config) =
  assoc_to_yojson
    [
      ("MasterInstanceType", option_to_yojson instance_type_to_yojson x.master_instance_type);
      ("SlaveInstanceType", option_to_yojson instance_type_to_yojson x.slave_instance_type);
      ("InstanceCount", option_to_yojson integer_to_yojson x.instance_count);
      ("InstanceGroups", option_to_yojson instance_group_config_list_to_yojson x.instance_groups);
      ("InstanceFleets", option_to_yojson instance_fleet_config_list_to_yojson x.instance_fleets);
      ("Ec2KeyName", option_to_yojson xml_string_max_len256_to_yojson x.ec2_key_name);
      ("Placement", option_to_yojson placement_type_to_yojson x.placement);
      ( "KeepJobFlowAliveWhenNoSteps",
        option_to_yojson boolean__to_yojson x.keep_job_flow_alive_when_no_steps );
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("HadoopVersion", option_to_yojson xml_string_max_len256_to_yojson x.hadoop_version);
      ("Ec2SubnetId", option_to_yojson xml_string_max_len256_to_yojson x.ec2_subnet_id);
      ("Ec2SubnetIds", option_to_yojson xml_string_max_len256_list_to_yojson x.ec2_subnet_ids);
      ( "EmrManagedMasterSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.emr_managed_master_security_group );
      ( "EmrManagedSlaveSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.emr_managed_slave_security_group );
      ( "ServiceAccessSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.service_access_security_group );
      ( "AdditionalMasterSecurityGroups",
        option_to_yojson security_groups_list_to_yojson x.additional_master_security_groups );
      ( "AdditionalSlaveSecurityGroups",
        option_to_yojson security_groups_list_to_yojson x.additional_slave_security_groups );
    ]

let run_job_flow_input_to_yojson (x : run_job_flow_input) =
  assoc_to_yojson
    [
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("LogEncryptionKmsKeyId", option_to_yojson xml_string_to_yojson x.log_encryption_kms_key_id);
      ("AdditionalInfo", option_to_yojson xml_string_to_yojson x.additional_info);
      ("AmiVersion", option_to_yojson xml_string_max_len256_to_yojson x.ami_version);
      ("ReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.release_label);
      ("Instances", Some (job_flow_instances_config_to_yojson x.instances));
      ("Steps", option_to_yojson step_config_list_to_yojson x.steps);
      ("StepExecutionRoleArn", option_to_yojson arn_type_to_yojson x.step_execution_role_arn);
      ( "BootstrapActions",
        option_to_yojson bootstrap_action_config_list_to_yojson x.bootstrap_actions );
      ("SupportedProducts", option_to_yojson supported_products_list_to_yojson x.supported_products);
      ( "NewSupportedProducts",
        option_to_yojson new_supported_products_list_to_yojson x.new_supported_products );
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ("JobFlowRole", option_to_yojson xml_string_to_yojson x.job_flow_role);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SecurityConfiguration", option_to_yojson xml_string_to_yojson x.security_configuration);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("EbsRootVolumeSize", option_to_yojson integer_to_yojson x.ebs_root_volume_size);
      ("RepoUpgradeOnBoot", option_to_yojson repo_upgrade_on_boot_to_yojson x.repo_upgrade_on_boot);
      ("KerberosAttributes", option_to_yojson kerberos_attributes_to_yojson x.kerberos_attributes);
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ( "ManagedScalingPolicy",
        option_to_yojson managed_scaling_policy_to_yojson x.managed_scaling_policy );
      ( "PlacementGroupConfigs",
        option_to_yojson placement_group_config_list_to_yojson x.placement_group_configs );
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
      ("OSReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.os_release_label);
      ("EbsRootVolumeIops", option_to_yojson integer_to_yojson x.ebs_root_volume_iops);
      ("EbsRootVolumeThroughput", option_to_yojson integer_to_yojson x.ebs_root_volume_throughput);
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("SessionEnabled", option_to_yojson boolean_object_to_yojson x.session_enabled);
    ]

let remove_tags_output_to_yojson = unit_to_yojson

let remove_tags_input_to_yojson (x : remove_tags_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagKeys", Some (string_list_to_yojson x.tag_keys));
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
    ]

let remove_managed_scaling_policy_output_to_yojson = unit_to_yojson

let remove_managed_scaling_policy_input_to_yojson (x : remove_managed_scaling_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let remove_auto_termination_policy_output_to_yojson = unit_to_yojson

let remove_auto_termination_policy_input_to_yojson (x : remove_auto_termination_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let remove_auto_scaling_policy_output_to_yojson = unit_to_yojson
let instance_group_id_to_yojson = string_to_yojson

let remove_auto_scaling_policy_input_to_yojson (x : remove_auto_scaling_policy_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("InstanceGroupId", Some (instance_group_id_to_yojson x.instance_group_id));
    ]

let put_managed_scaling_policy_output_to_yojson = unit_to_yojson

let put_managed_scaling_policy_input_to_yojson (x : put_managed_scaling_policy_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("ManagedScalingPolicy", Some (managed_scaling_policy_to_yojson x.managed_scaling_policy));
    ]

let put_block_public_access_configuration_output_to_yojson = unit_to_yojson

let put_block_public_access_configuration_input_to_yojson
    (x : put_block_public_access_configuration_input) =
  assoc_to_yojson
    [
      ( "BlockPublicAccessConfiguration",
        Some (block_public_access_configuration_to_yojson x.block_public_access_configuration) );
    ]

let put_auto_termination_policy_output_to_yojson = unit_to_yojson

let put_auto_termination_policy_input_to_yojson (x : put_auto_termination_policy_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
    ]

let put_auto_scaling_policy_output_to_yojson (x : put_auto_scaling_policy_output) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("InstanceGroupId", option_to_yojson instance_group_id_to_yojson x.instance_group_id);
      ( "AutoScalingPolicy",
        option_to_yojson auto_scaling_policy_description_to_yojson x.auto_scaling_policy );
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
    ]

let put_auto_scaling_policy_input_to_yojson (x : put_auto_scaling_policy_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("InstanceGroupId", Some (instance_group_id_to_yojson x.instance_group_id));
      ("AutoScalingPolicy", Some (auto_scaling_policy_to_yojson x.auto_scaling_policy));
    ]

let reconfiguration_type_to_yojson (x : reconfiguration_type) =
  match x with OVERWRITE -> `String "OVERWRITE" | MERGE -> `String "MERGE"

let instance_resize_policy_to_yojson (x : instance_resize_policy) =
  assoc_to_yojson
    [
      ( "InstancesToTerminate",
        option_to_yojson ec2_instance_ids_list_to_yojson x.instances_to_terminate );
      ("InstancesToProtect", option_to_yojson ec2_instance_ids_list_to_yojson x.instances_to_protect);
      ( "InstanceTerminationTimeout",
        option_to_yojson integer_to_yojson x.instance_termination_timeout );
    ]

let shrink_policy_to_yojson (x : shrink_policy) =
  assoc_to_yojson
    [
      ("DecommissionTimeout", option_to_yojson integer_to_yojson x.decommission_timeout);
      ( "InstanceResizePolicy",
        option_to_yojson instance_resize_policy_to_yojson x.instance_resize_policy );
    ]

let instance_group_modify_config_to_yojson (x : instance_group_modify_config) =
  assoc_to_yojson
    [
      ("InstanceGroupId", Some (xml_string_max_len256_to_yojson x.instance_group_id));
      ("InstanceCount", option_to_yojson integer_to_yojson x.instance_count);
      ( "EC2InstanceIdsToTerminate",
        option_to_yojson ec2_instance_ids_to_terminate_list_to_yojson
          x.ec2_instance_ids_to_terminate );
      ("ShrinkPolicy", option_to_yojson shrink_policy_to_yojson x.shrink_policy);
      ("ReconfigurationType", option_to_yojson reconfiguration_type_to_yojson x.reconfiguration_type);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
    ]

let instance_group_modify_config_list_to_yojson tree =
  list_to_yojson instance_group_modify_config_to_yojson tree

let modify_instance_groups_input_to_yojson (x : modify_instance_groups_input) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ( "InstanceGroups",
        option_to_yojson instance_group_modify_config_list_to_yojson x.instance_groups );
    ]

let instance_fleet_modify_config_to_yojson (x : instance_fleet_modify_config) =
  assoc_to_yojson
    [
      ("InstanceFleetId", Some (instance_fleet_id_to_yojson x.instance_fleet_id));
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ( "InstanceTypeConfigs",
        option_to_yojson instance_type_config_list_to_yojson x.instance_type_configs );
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
    ]

let modify_instance_fleet_input_to_yojson (x : modify_instance_fleet_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("InstanceFleet", Some (instance_fleet_modify_config_to_yojson x.instance_fleet));
    ]

let modify_cluster_output_to_yojson (x : modify_cluster_output) =
  assoc_to_yojson
    [
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
    ]

let modify_cluster_input_to_yojson (x : modify_cluster_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (string__to_yojson x.cluster_id));
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
    ]

let float__to_yojson = float_to_yojson

let supported_instance_type_to_yojson (x : supported_instance_type) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("MemoryGB", option_to_yojson float__to_yojson x.memory_g_b);
      ("StorageGB", option_to_yojson integer_to_yojson x.storage_g_b);
      ("VCPU", option_to_yojson integer_to_yojson x.vcp_u);
      ("Is64BitsOnly", option_to_yojson boolean__to_yojson x.is64_bits_only);
      ("InstanceFamilyId", option_to_yojson string__to_yojson x.instance_family_id);
      ("EbsOptimizedAvailable", option_to_yojson boolean__to_yojson x.ebs_optimized_available);
      ("EbsOptimizedByDefault", option_to_yojson boolean__to_yojson x.ebs_optimized_by_default);
      ("NumberOfDisks", option_to_yojson integer_to_yojson x.number_of_disks);
      ("EbsStorageOnly", option_to_yojson boolean__to_yojson x.ebs_storage_only);
      ("Architecture", option_to_yojson string__to_yojson x.architecture);
    ]

let supported_instance_types_list_to_yojson tree =
  list_to_yojson supported_instance_type_to_yojson tree

let list_supported_instance_types_output_to_yojson (x : list_supported_instance_types_output) =
  assoc_to_yojson
    [
      ( "SupportedInstanceTypes",
        option_to_yojson supported_instance_types_list_to_yojson x.supported_instance_types );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let list_supported_instance_types_input_to_yojson (x : list_supported_instance_types_input) =
  assoc_to_yojson
    [
      ("ReleaseLabel", Some (string__to_yojson x.release_label));
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let marker_to_yojson = string_to_yojson

let session_mapping_summary_to_yojson (x : session_mapping_summary) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("SessionPolicyArn", option_to_yojson xml_string_max_len256_to_yojson x.session_policy_arn);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let session_mapping_summary_list_to_yojson tree =
  list_to_yojson session_mapping_summary_to_yojson tree

let list_studio_session_mappings_output_to_yojson (x : list_studio_session_mappings_output) =
  assoc_to_yojson
    [
      ("SessionMappings", option_to_yojson session_mapping_summary_list_to_yojson x.session_mappings);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_studio_session_mappings_input_to_yojson (x : list_studio_session_mappings_input) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let studio_summary_to_yojson (x : studio_summary) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("VpcId", option_to_yojson xml_string_max_len256_to_yojson x.vpc_id);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("Url", option_to_yojson xml_string_max_len256_to_yojson x.url);
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let studio_summary_list_to_yojson tree = list_to_yojson studio_summary_to_yojson tree

let list_studios_output_to_yojson (x : list_studios_output) =
  assoc_to_yojson
    [
      ("Studios", option_to_yojson studio_summary_list_to_yojson x.studios);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_studios_input_to_yojson (x : list_studios_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let step_summary_to_yojson (x : step_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson step_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Config", option_to_yojson hadoop_step_config_to_yojson x.config);
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("Status", option_to_yojson step_status_to_yojson x.status);
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ("EncryptionKeyArn", option_to_yojson string__to_yojson x.encryption_key_arn);
    ]

let step_summary_list_to_yojson tree = list_to_yojson step_summary_to_yojson tree

let list_steps_output_to_yojson (x : list_steps_output) =
  assoc_to_yojson
    [
      ("Steps", option_to_yojson step_summary_list_to_yojson x.steps);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let step_state_list_to_yojson tree = list_to_yojson step_state_to_yojson tree

let list_steps_input_to_yojson (x : list_steps_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("StepStates", option_to_yojson step_state_list_to_yojson x.step_states);
      ("StepIds", option_to_yojson xml_string_list_to_yojson x.step_ids);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("Id", Some (session_id_to_yojson x.id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Arn", Some (arn_type_to_yojson x.arn));
      ("State", Some (session_state_to_yojson x.state));
      ("StateChangeReason", option_to_yojson xml_string_to_yojson x.state_change_reason);
      ("ReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.release_label);
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
      ("AccountId", option_to_yojson xml_string_max_len256_to_yojson x.account_id);
      ("CreatedAt", option_to_yojson date_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson date_to_yojson x.updated_at);
      ("StartedAt", option_to_yojson date_to_yojson x.started_at);
      ("EndedAt", option_to_yojson date_to_yojson x.ended_at);
      ("IdleSince", option_to_yojson date_to_yojson x.idle_since);
      ("EngineConfigurations", option_to_yojson configuration_list_to_yojson x.engine_configurations);
      ( "MonitoringConfiguration",
        option_to_yojson session_monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson long_to_yojson x.session_idle_timeout_in_minutes );
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("ServerUrl", option_to_yojson xml_string_to_yojson x.server_url);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree

let list_sessions_output_to_yojson (x : list_sessions_output) =
  assoc_to_yojson
    [
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let session_state_list_to_yojson tree = list_to_yojson session_state_to_yojson tree

let list_sessions_input_to_yojson (x : list_sessions_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SessionStates", option_to_yojson session_state_list_to_yojson x.session_states);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
    ]

let security_configuration_summary_to_yojson (x : security_configuration_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson xml_string_to_yojson x.name);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let security_configuration_list_to_yojson tree =
  list_to_yojson security_configuration_summary_to_yojson tree

let list_security_configurations_output_to_yojson (x : list_security_configurations_output) =
  assoc_to_yojson
    [
      ( "SecurityConfigurations",
        option_to_yojson security_configuration_list_to_yojson x.security_configurations );
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_security_configurations_input_to_yojson (x : list_security_configurations_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let list_release_labels_output_to_yojson (x : list_release_labels_output) =
  assoc_to_yojson
    [
      ("ReleaseLabels", option_to_yojson string_list_to_yojson x.release_labels);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let release_label_filter_to_yojson (x : release_label_filter) =
  assoc_to_yojson
    [
      ("Prefix", option_to_yojson string__to_yojson x.prefix);
      ("Application", option_to_yojson string__to_yojson x.application);
    ]

let list_release_labels_input_to_yojson (x : list_release_labels_input) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson release_label_filter_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
    ]

let notebook_execution_summary_to_yojson (x : notebook_execution_summary) =
  assoc_to_yojson
    [
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_for_output_to_yojson x.notebook_s3_location );
      ("ExecutionEngineId", option_to_yojson xml_string_to_yojson x.execution_engine_id);
    ]

let notebook_execution_summary_list_to_yojson tree =
  list_to_yojson notebook_execution_summary_to_yojson tree

let list_notebook_executions_output_to_yojson (x : list_notebook_executions_output) =
  assoc_to_yojson
    [
      ( "NotebookExecutions",
        option_to_yojson notebook_execution_summary_list_to_yojson x.notebook_executions );
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_notebook_executions_input_to_yojson (x : list_notebook_executions_input) =
  assoc_to_yojson
    [
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ("From", option_to_yojson date_to_yojson x.from_);
      ("To", option_to_yojson date_to_yojson x.to_);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ExecutionEngineId", option_to_yojson xml_string_to_yojson x.execution_engine_id);
    ]

let instance_timeline_to_yojson (x : instance_timeline) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
    ]

let instance_state_change_reason_code_to_yojson (x : instance_state_change_reason_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | BOOTSTRAP_FAILURE -> `String "BOOTSTRAP_FAILURE"
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"

let instance_state_change_reason_to_yojson (x : instance_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson instance_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let instance_state_to_yojson (x : instance_state) =
  match x with
  | AWAITING_FULFILLMENT -> `String "AWAITING_FULFILLMENT"
  | PROVISIONING -> `String "PROVISIONING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | RUNNING -> `String "RUNNING"
  | TERMINATED -> `String "TERMINATED"

let instance_status_to_yojson (x : instance_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson instance_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson instance_state_change_reason_to_yojson x.state_change_reason );
      ("Timeline", option_to_yojson instance_timeline_to_yojson x.timeline);
    ]

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson instance_id_to_yojson x.id);
      ("Ec2InstanceId", option_to_yojson instance_id_to_yojson x.ec2_instance_id);
      ("PublicDnsName", option_to_yojson string__to_yojson x.public_dns_name);
      ("PublicIpAddress", option_to_yojson string__to_yojson x.public_ip_address);
      ("PrivateDnsName", option_to_yojson string__to_yojson x.private_dns_name);
      ("PrivateIpAddress", option_to_yojson string__to_yojson x.private_ip_address);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("InstanceGroupId", option_to_yojson string__to_yojson x.instance_group_id);
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("EbsVolumes", option_to_yojson ebs_volume_list_to_yojson x.ebs_volumes);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_to_yojson tree

let list_instances_output_to_yojson (x : list_instances_output) =
  assoc_to_yojson
    [
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let instance_state_list_to_yojson tree = list_to_yojson instance_state_to_yojson tree

let instance_group_type_to_yojson (x : instance_group_type) =
  match x with MASTER -> `String "MASTER" | CORE -> `String "CORE" | TASK -> `String "TASK"

let instance_group_type_list_to_yojson tree = list_to_yojson instance_group_type_to_yojson tree

let list_instances_input_to_yojson (x : list_instances_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("InstanceGroupId", option_to_yojson instance_group_id_to_yojson x.instance_group_id);
      ( "InstanceGroupTypes",
        option_to_yojson instance_group_type_list_to_yojson x.instance_group_types );
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ("InstanceFleetType", option_to_yojson instance_fleet_type_to_yojson x.instance_fleet_type);
      ("InstanceStates", option_to_yojson instance_state_list_to_yojson x.instance_states);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let instance_group_timeline_to_yojson (x : instance_group_timeline) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
    ]

let instance_group_state_change_reason_code_to_yojson (x : instance_group_state_change_reason_code)
    =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"

let instance_group_state_change_reason_to_yojson (x : instance_group_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson instance_group_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let instance_group_status_to_yojson (x : instance_group_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson instance_group_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson instance_group_state_change_reason_to_yojson x.state_change_reason );
      ("Timeline", option_to_yojson instance_group_timeline_to_yojson x.timeline);
    ]

let instance_group_to_yojson (x : instance_group) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson instance_group_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("InstanceGroupType", option_to_yojson instance_group_type_to_yojson x.instance_group_type);
      ("BidPrice", option_to_yojson string__to_yojson x.bid_price);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("RequestedInstanceCount", option_to_yojson integer_to_yojson x.requested_instance_count);
      ("RunningInstanceCount", option_to_yojson integer_to_yojson x.running_instance_count);
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("ConfigurationsVersion", option_to_yojson long_to_yojson x.configurations_version);
      ( "LastSuccessfullyAppliedConfigurations",
        option_to_yojson configuration_list_to_yojson x.last_successfully_applied_configurations );
      ( "LastSuccessfullyAppliedConfigurationsVersion",
        option_to_yojson long_to_yojson x.last_successfully_applied_configurations_version );
      ("EbsBlockDevices", option_to_yojson ebs_block_device_list_to_yojson x.ebs_block_devices);
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
      ("ShrinkPolicy", option_to_yojson shrink_policy_to_yojson x.shrink_policy);
      ( "AutoScalingPolicy",
        option_to_yojson auto_scaling_policy_description_to_yojson x.auto_scaling_policy );
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
    ]

let instance_group_list_to_yojson tree = list_to_yojson instance_group_to_yojson tree

let list_instance_groups_output_to_yojson (x : list_instance_groups_output) =
  assoc_to_yojson
    [
      ("InstanceGroups", option_to_yojson instance_group_list_to_yojson x.instance_groups);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_instance_groups_input_to_yojson (x : list_instance_groups_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let instance_type_specification_to_yojson (x : instance_type_specification) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("WeightedCapacity", option_to_yojson whole_number_to_yojson x.weighted_capacity);
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ( "BidPriceAsPercentageOfOnDemandPrice",
        option_to_yojson non_negative_double_to_yojson x.bid_price_as_percentage_of_on_demand_price
      );
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("EbsBlockDevices", option_to_yojson ebs_block_device_list_to_yojson x.ebs_block_devices);
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("Priority", option_to_yojson non_negative_double_to_yojson x.priority);
    ]

let instance_type_specification_list_to_yojson tree =
  list_to_yojson instance_type_specification_to_yojson tree

let instance_fleet_timeline_to_yojson (x : instance_fleet_timeline) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
    ]

let instance_fleet_state_change_reason_code_to_yojson (x : instance_fleet_state_change_reason_code)
    =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"

let instance_fleet_state_change_reason_to_yojson (x : instance_fleet_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson instance_fleet_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let instance_fleet_state_to_yojson (x : instance_fleet_state) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | RUNNING -> `String "RUNNING"
  | RESIZING -> `String "RESIZING"
  | RECONFIGURING -> `String "RECONFIGURING"
  | SUSPENDED -> `String "SUSPENDED"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"

let instance_fleet_status_to_yojson (x : instance_fleet_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson instance_fleet_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson instance_fleet_state_change_reason_to_yojson x.state_change_reason );
      ("Timeline", option_to_yojson instance_fleet_timeline_to_yojson x.timeline);
    ]

let instance_fleet_to_yojson (x : instance_fleet) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson instance_fleet_id_to_yojson x.id);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Status", option_to_yojson instance_fleet_status_to_yojson x.status);
      ("InstanceFleetType", option_to_yojson instance_fleet_type_to_yojson x.instance_fleet_type);
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ( "ProvisionedOnDemandCapacity",
        option_to_yojson whole_number_to_yojson x.provisioned_on_demand_capacity );
      ( "ProvisionedSpotCapacity",
        option_to_yojson whole_number_to_yojson x.provisioned_spot_capacity );
      ( "InstanceTypeSpecifications",
        option_to_yojson instance_type_specification_list_to_yojson x.instance_type_specifications
      );
      ( "LaunchSpecifications",
        option_to_yojson instance_fleet_provisioning_specifications_to_yojson
          x.launch_specifications );
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
    ]

let instance_fleet_list_to_yojson tree = list_to_yojson instance_fleet_to_yojson tree

let list_instance_fleets_output_to_yojson (x : list_instance_fleets_output) =
  assoc_to_yojson
    [
      ("InstanceFleets", option_to_yojson instance_fleet_list_to_yojson x.instance_fleets);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_instance_fleets_input_to_yojson (x : list_instance_fleets_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_clusters_output_to_yojson (x : list_clusters_output) =
  assoc_to_yojson
    [
      ("Clusters", option_to_yojson cluster_summary_list_to_yojson x.clusters);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_clusters_input_to_yojson (x : list_clusters_input) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson date_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson date_to_yojson x.created_before);
      ("ClusterStates", option_to_yojson cluster_state_list_to_yojson x.cluster_states);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_bootstrap_actions_output_to_yojson (x : list_bootstrap_actions_output) =
  assoc_to_yojson
    [
      ("BootstrapActions", option_to_yojson command_list_to_yojson x.bootstrap_actions);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_bootstrap_actions_input_to_yojson (x : list_bootstrap_actions_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let session_mapping_detail_to_yojson (x : session_mapping_detail) =
  assoc_to_yojson
    [
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("SessionPolicyArn", option_to_yojson xml_string_max_len256_to_yojson x.session_policy_arn);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
    ]

let get_studio_session_mapping_output_to_yojson (x : get_studio_session_mapping_output) =
  assoc_to_yojson
    [ ("SessionMapping", option_to_yojson session_mapping_detail_to_yojson x.session_mapping) ]

let get_studio_session_mapping_input_to_yojson (x : get_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
    ]

let sensitive_string_to_yojson = string_to_yojson

let get_session_endpoint_output_to_yojson (x : get_session_endpoint_output) =
  assoc_to_yojson
    [
      ("Endpoint", Some (xml_string_to_yojson x.endpoint));
      ("AuthToken", option_to_yojson sensitive_string_to_yojson x.auth_token);
      ("AuthTokenExpirationTime", option_to_yojson date_to_yojson x.auth_token_expiration_time);
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
    ]

let get_session_endpoint_input_to_yojson (x : get_session_endpoint_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let get_session_output_to_yojson (x : get_session_output) =
  assoc_to_yojson [ ("Session", Some (session_to_yojson x.session)) ]

let get_session_input_to_yojson (x : get_session_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let get_persistent_app_ui_presigned_url_output_to_yojson
    (x : get_persistent_app_ui_presigned_url_output) =
  assoc_to_yojson
    [
      ("PresignedURLReady", option_to_yojson boolean__to_yojson x.presigned_url_ready);
      ("PresignedURL", option_to_yojson xml_string_to_yojson x.presigned_ur_l);
    ]

let get_persistent_app_ui_presigned_url_input_to_yojson
    (x : get_persistent_app_ui_presigned_url_input) =
  assoc_to_yojson
    [
      ("PersistentAppUIId", Some (xml_string_max_len256_to_yojson x.persistent_app_ui_id));
      ( "PersistentAppUIType",
        option_to_yojson persistent_app_ui_type_to_yojson x.persistent_app_ui_type );
      ("ApplicationId", option_to_yojson xml_string_max_len256_to_yojson x.application_id);
      ("AuthProxyCall", option_to_yojson boolean_object_to_yojson x.auth_proxy_call);
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
    ]

let get_on_cluster_app_ui_presigned_url_output_to_yojson
    (x : get_on_cluster_app_ui_presigned_url_output) =
  assoc_to_yojson
    [
      ("PresignedURLReady", option_to_yojson boolean__to_yojson x.presigned_url_ready);
      ("PresignedURL", option_to_yojson xml_string_to_yojson x.presigned_ur_l);
    ]

let on_cluster_app_ui_type_to_yojson (x : on_cluster_app_ui_type) =
  match x with
  | SparkHistoryServer -> `String "SparkHistoryServer"
  | YarnTimelineService -> `String "YarnTimelineService"
  | TezUI -> `String "TezUI"
  | ApplicationMaster -> `String "ApplicationMaster"
  | JobHistoryServer -> `String "JobHistoryServer"
  | ResourceManager -> `String "ResourceManager"

let get_on_cluster_app_ui_presigned_url_input_to_yojson
    (x : get_on_cluster_app_ui_presigned_url_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
      ( "OnClusterAppUIType",
        option_to_yojson on_cluster_app_ui_type_to_yojson x.on_cluster_app_ui_type );
      ("ApplicationId", option_to_yojson xml_string_max_len256_to_yojson x.application_id);
      ("DryRun", option_to_yojson boolean_object_to_yojson x.dry_run);
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
    ]

let get_managed_scaling_policy_output_to_yojson (x : get_managed_scaling_policy_output) =
  assoc_to_yojson
    [
      ( "ManagedScalingPolicy",
        option_to_yojson managed_scaling_policy_to_yojson x.managed_scaling_policy );
    ]

let get_managed_scaling_policy_input_to_yojson (x : get_managed_scaling_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let get_cluster_session_credentials_output_to_yojson (x : get_cluster_session_credentials_output) =
  assoc_to_yojson
    [
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
      ("ExpiresAt", option_to_yojson date_to_yojson x.expires_at);
    ]

let get_cluster_session_credentials_input_to_yojson (x : get_cluster_session_credentials_input) =
  assoc_to_yojson
    [
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
    ]

let get_block_public_access_configuration_output_to_yojson
    (x : get_block_public_access_configuration_output) =
  assoc_to_yojson
    [
      ( "BlockPublicAccessConfiguration",
        Some (block_public_access_configuration_to_yojson x.block_public_access_configuration) );
      ( "BlockPublicAccessConfigurationMetadata",
        Some
          (block_public_access_configuration_metadata_to_yojson
             x.block_public_access_configuration_metadata) );
    ]

let get_block_public_access_configuration_input_to_yojson = unit_to_yojson

let get_auto_termination_policy_output_to_yojson (x : get_auto_termination_policy_output) =
  assoc_to_yojson
    [
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
    ]

let get_auto_termination_policy_input_to_yojson (x : get_auto_termination_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]
