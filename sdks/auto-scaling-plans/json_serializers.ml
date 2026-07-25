open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let object_not_found_exception_to_yojson (x : object_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_update_exception_to_yojson (x : concurrent_update_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_scaling_plan_response_to_yojson = unit_to_yojson
let disable_dynamic_scaling_to_yojson = bool_to_yojson

let scaling_policy_update_behavior_to_yojson (x : scaling_policy_update_behavior) =
  match x with
  | KeepExternalPolicies -> `String "KeepExternalPolicies"
  | ReplaceExternalPolicies -> `String "ReplaceExternalPolicies"

let predictive_scaling_mode_to_yojson (x : predictive_scaling_mode) =
  match x with
  | ForecastAndScale -> `String "ForecastAndScale"
  | ForecastOnly -> `String "ForecastOnly"

let resource_capacity_to_yojson = int_to_yojson

let predictive_scaling_max_capacity_behavior_to_yojson
    (x : predictive_scaling_max_capacity_behavior) =
  match x with
  | SetForecastCapacityToMaxCapacity -> `String "SetForecastCapacityToMaxCapacity"
  | SetMaxCapacityToForecastCapacity -> `String "SetMaxCapacityToForecastCapacity"
  | SetMaxCapacityAboveForecastCapacity -> `String "SetMaxCapacityAboveForecastCapacity"

let scheduled_action_buffer_time_to_yojson = int_to_yojson
let metric_unit_to_yojson = string_to_yojson

let metric_statistic_to_yojson (x : metric_statistic) =
  match x with
  | Average -> `String "Average"
  | Minimum -> `String "Minimum"
  | Maximum -> `String "Maximum"
  | SampleCount -> `String "SampleCount"
  | Sum -> `String "Sum"

let metric_dimension_value_to_yojson = string_to_yojson
let metric_dimension_name_to_yojson = string_to_yojson

let metric_dimension_to_yojson (x : metric_dimension) =
  assoc_to_yojson
    [
      ("Name", Some (metric_dimension_name_to_yojson x.name));
      ("Value", Some (metric_dimension_value_to_yojson x.value));
    ]

let metric_dimensions_to_yojson tree = list_to_yojson metric_dimension_to_yojson tree
let metric_namespace_to_yojson = string_to_yojson
let metric_name_to_yojson = string_to_yojson

let customized_load_metric_specification_to_yojson (x : customized_load_metric_specification) =
  assoc_to_yojson
    [
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("Namespace", Some (metric_namespace_to_yojson x.namespace));
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Statistic", Some (metric_statistic_to_yojson x.statistic));
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
    ]

let resource_label_to_yojson = string_to_yojson

let load_metric_type_to_yojson (x : load_metric_type) =
  match x with
  | ASGTotalCPUUtilization -> `String "ASGTotalCPUUtilization"
  | ASGTotalNetworkIn -> `String "ASGTotalNetworkIn"
  | ASGTotalNetworkOut -> `String "ASGTotalNetworkOut"
  | ALBTargetGroupRequestCount -> `String "ALBTargetGroupRequestCount"

let predefined_load_metric_specification_to_yojson (x : predefined_load_metric_specification) =
  assoc_to_yojson
    [
      ("PredefinedLoadMetricType", Some (load_metric_type_to_yojson x.predefined_load_metric_type));
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let cooldown_to_yojson = int_to_yojson
let disable_scale_in_to_yojson = bool_to_yojson
let metric_scale_to_yojson = double_to_yojson

let customized_scaling_metric_specification_to_yojson (x : customized_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("Namespace", Some (metric_namespace_to_yojson x.namespace));
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Statistic", Some (metric_statistic_to_yojson x.statistic));
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
    ]

let scaling_metric_type_to_yojson (x : scaling_metric_type) =
  match x with
  | ASGAverageCPUUtilization -> `String "ASGAverageCPUUtilization"
  | ASGAverageNetworkIn -> `String "ASGAverageNetworkIn"
  | ASGAverageNetworkOut -> `String "ASGAverageNetworkOut"
  | DynamoDBReadCapacityUtilization -> `String "DynamoDBReadCapacityUtilization"
  | DynamoDBWriteCapacityUtilization -> `String "DynamoDBWriteCapacityUtilization"
  | ECSServiceAverageCPUUtilization -> `String "ECSServiceAverageCPUUtilization"
  | ECSServiceAverageMemoryUtilization -> `String "ECSServiceAverageMemoryUtilization"
  | ALBRequestCountPerTarget -> `String "ALBRequestCountPerTarget"
  | RDSReaderAverageCPUUtilization -> `String "RDSReaderAverageCPUUtilization"
  | RDSReaderAverageDatabaseConnections -> `String "RDSReaderAverageDatabaseConnections"
  | EC2SpotFleetRequestAverageCPUUtilization -> `String "EC2SpotFleetRequestAverageCPUUtilization"
  | EC2SpotFleetRequestAverageNetworkIn -> `String "EC2SpotFleetRequestAverageNetworkIn"
  | EC2SpotFleetRequestAverageNetworkOut -> `String "EC2SpotFleetRequestAverageNetworkOut"

let predefined_scaling_metric_specification_to_yojson (x : predefined_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ( "PredefinedScalingMetricType",
        Some (scaling_metric_type_to_yojson x.predefined_scaling_metric_type) );
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let target_tracking_configuration_to_yojson (x : target_tracking_configuration) =
  assoc_to_yojson
    [
      ( "PredefinedScalingMetricSpecification",
        option_to_yojson predefined_scaling_metric_specification_to_yojson
          x.predefined_scaling_metric_specification );
      ( "CustomizedScalingMetricSpecification",
        option_to_yojson customized_scaling_metric_specification_to_yojson
          x.customized_scaling_metric_specification );
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
      ("DisableScaleIn", option_to_yojson disable_scale_in_to_yojson x.disable_scale_in);
      ("ScaleOutCooldown", option_to_yojson cooldown_to_yojson x.scale_out_cooldown);
      ("ScaleInCooldown", option_to_yojson cooldown_to_yojson x.scale_in_cooldown);
      ("EstimatedInstanceWarmup", option_to_yojson cooldown_to_yojson x.estimated_instance_warmup);
    ]

let target_tracking_configurations_to_yojson tree =
  list_to_yojson target_tracking_configuration_to_yojson tree

let scalable_dimension_to_yojson (x : scalable_dimension) =
  match x with
  | AutoScalingGroupDesiredCapacity -> `String "autoscaling:autoScalingGroup:DesiredCapacity"
  | ECSServiceDesiredCount -> `String "ecs:service:DesiredCount"
  | EC2SpotFleetRequestTargetCapacity -> `String "ec2:spot-fleet-request:TargetCapacity"
  | RDSClusterReadReplicaCount -> `String "rds:cluster:ReadReplicaCount"
  | DynamoDBTableReadCapacityUnits -> `String "dynamodb:table:ReadCapacityUnits"
  | DynamoDBTableWriteCapacityUnits -> `String "dynamodb:table:WriteCapacityUnits"
  | DynamoDBIndexReadCapacityUnits -> `String "dynamodb:index:ReadCapacityUnits"
  | DynamoDBIndexWriteCapacityUnits -> `String "dynamodb:index:WriteCapacityUnits"

let resource_id_max_len1600_to_yojson = string_to_yojson

let service_namespace_to_yojson (x : service_namespace) =
  match x with
  | AUTOSCALING -> `String "autoscaling"
  | ECS -> `String "ecs"
  | EC2 -> `String "ec2"
  | RDS -> `String "rds"
  | DYNAMODB -> `String "dynamodb"

let scaling_instruction_to_yojson (x : scaling_instruction) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("MinCapacity", Some (resource_capacity_to_yojson x.min_capacity));
      ("MaxCapacity", Some (resource_capacity_to_yojson x.max_capacity));
      ( "TargetTrackingConfigurations",
        Some (target_tracking_configurations_to_yojson x.target_tracking_configurations) );
      ( "PredefinedLoadMetricSpecification",
        option_to_yojson predefined_load_metric_specification_to_yojson
          x.predefined_load_metric_specification );
      ( "CustomizedLoadMetricSpecification",
        option_to_yojson customized_load_metric_specification_to_yojson
          x.customized_load_metric_specification );
      ( "ScheduledActionBufferTime",
        option_to_yojson scheduled_action_buffer_time_to_yojson x.scheduled_action_buffer_time );
      ( "PredictiveScalingMaxCapacityBehavior",
        option_to_yojson predictive_scaling_max_capacity_behavior_to_yojson
          x.predictive_scaling_max_capacity_behavior );
      ( "PredictiveScalingMaxCapacityBuffer",
        option_to_yojson resource_capacity_to_yojson x.predictive_scaling_max_capacity_buffer );
      ( "PredictiveScalingMode",
        option_to_yojson predictive_scaling_mode_to_yojson x.predictive_scaling_mode );
      ( "ScalingPolicyUpdateBehavior",
        option_to_yojson scaling_policy_update_behavior_to_yojson x.scaling_policy_update_behavior
      );
      ( "DisableDynamicScaling",
        option_to_yojson disable_dynamic_scaling_to_yojson x.disable_dynamic_scaling );
    ]

let scaling_instructions_to_yojson tree = list_to_yojson scaling_instruction_to_yojson tree
let xml_string_max_len256_to_yojson = string_to_yojson
let tag_values_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree
let xml_string_max_len128_to_yojson = string_to_yojson

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson xml_string_max_len128_to_yojson x.key);
      ("Values", option_to_yojson tag_values_to_yojson x.values);
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree
let xml_string_to_yojson = string_to_yojson

let application_source_to_yojson (x : application_source) =
  assoc_to_yojson
    [
      ("CloudFormationStackARN", option_to_yojson xml_string_to_yojson x.cloud_formation_stack_ar_n);
      ("TagFilters", option_to_yojson tag_filters_to_yojson x.tag_filters);
    ]

let scaling_plan_version_to_yojson = long_to_yojson
let scaling_plan_name_to_yojson = string_to_yojson

let update_scaling_plan_request_to_yojson (x : update_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ApplicationSource", option_to_yojson application_source_to_yojson x.application_source);
      ("ScalingInstructions", option_to_yojson scaling_instructions_to_yojson x.scaling_instructions);
    ]

let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson

let datapoint_to_yojson (x : datapoint) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_type_to_yojson x.timestamp);
      ("Value", option_to_yojson metric_scale_to_yojson x.value);
    ]

let datapoints_to_yojson tree = list_to_yojson datapoint_to_yojson tree

let get_scaling_plan_resource_forecast_data_response_to_yojson
    (x : get_scaling_plan_resource_forecast_data_response) =
  assoc_to_yojson [ ("Datapoints", Some (datapoints_to_yojson x.datapoints)) ]

let forecast_data_type_to_yojson (x : forecast_data_type) =
  match x with
  | CapacityForecast -> `String "CapacityForecast"
  | LoadForecast -> `String "LoadForecast"
  | ScheduledActionMinCapacity -> `String "ScheduledActionMinCapacity"
  | ScheduledActionMaxCapacity -> `String "ScheduledActionMaxCapacity"

let get_scaling_plan_resource_forecast_data_request_to_yojson
    (x : get_scaling_plan_resource_forecast_data_request) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (xml_string_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ForecastDataType", Some (forecast_data_type_to_yojson x.forecast_data_type));
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("EndTime", Some (timestamp_type_to_yojson x.end_time));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let scaling_plan_status_code_to_yojson (x : scaling_plan_status_code) =
  match x with
  | Active -> `String "Active"
  | ActiveWithProblems -> `String "ActiveWithProblems"
  | CreationInProgress -> `String "CreationInProgress"
  | CreationFailed -> `String "CreationFailed"
  | DeletionInProgress -> `String "DeletionInProgress"
  | DeletionFailed -> `String "DeletionFailed"
  | UpdateInProgress -> `String "UpdateInProgress"
  | UpdateFailed -> `String "UpdateFailed"

let scaling_plan_to_yojson (x : scaling_plan) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ApplicationSource", Some (application_source_to_yojson x.application_source));
      ("ScalingInstructions", Some (scaling_instructions_to_yojson x.scaling_instructions));
      ("StatusCode", Some (scaling_plan_status_code_to_yojson x.status_code));
      ("StatusMessage", option_to_yojson xml_string_to_yojson x.status_message);
      ("StatusStartTime", option_to_yojson timestamp_type_to_yojson x.status_start_time);
      ("CreationTime", option_to_yojson timestamp_type_to_yojson x.creation_time);
    ]

let scaling_plans_to_yojson tree = list_to_yojson scaling_plan_to_yojson tree

let describe_scaling_plans_response_to_yojson (x : describe_scaling_plans_response) =
  assoc_to_yojson
    [
      ("ScalingPlans", option_to_yojson scaling_plans_to_yojson x.scaling_plans);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let application_sources_to_yojson tree = list_to_yojson application_source_to_yojson tree
let scaling_plan_names_to_yojson tree = list_to_yojson scaling_plan_name_to_yojson tree

let describe_scaling_plans_request_to_yojson (x : describe_scaling_plans_request) =
  assoc_to_yojson
    [
      ("ScalingPlanNames", option_to_yojson scaling_plan_names_to_yojson x.scaling_plan_names);
      ("ScalingPlanVersion", option_to_yojson scaling_plan_version_to_yojson x.scaling_plan_version);
      ("ApplicationSources", option_to_yojson application_sources_to_yojson x.application_sources);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let scaling_status_code_to_yojson (x : scaling_status_code) =
  match x with
  | Inactive -> `String "Inactive"
  | PartiallyActive -> `String "PartiallyActive"
  | Active -> `String "Active"

let policy_type_to_yojson (x : policy_type) =
  match x with TargetTrackingScaling -> `String "TargetTrackingScaling"

let policy_name_to_yojson = string_to_yojson

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ( "TargetTrackingConfiguration",
        option_to_yojson target_tracking_configuration_to_yojson x.target_tracking_configuration );
    ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let scaling_plan_resource_to_yojson (x : scaling_plan_resource) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
      ("ScalingStatusCode", Some (scaling_status_code_to_yojson x.scaling_status_code));
      ("ScalingStatusMessage", option_to_yojson xml_string_to_yojson x.scaling_status_message);
    ]

let scaling_plan_resources_to_yojson tree = list_to_yojson scaling_plan_resource_to_yojson tree

let describe_scaling_plan_resources_response_to_yojson
    (x : describe_scaling_plan_resources_response) =
  assoc_to_yojson
    [
      ( "ScalingPlanResources",
        option_to_yojson scaling_plan_resources_to_yojson x.scaling_plan_resources );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_scaling_plan_resources_request_to_yojson (x : describe_scaling_plan_resources_request)
    =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let delete_scaling_plan_response_to_yojson = unit_to_yojson

let delete_scaling_plan_request_to_yojson (x : delete_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_scaling_plan_response_to_yojson (x : create_scaling_plan_response) =
  assoc_to_yojson
    [ ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version)) ]

let create_scaling_plan_request_to_yojson (x : create_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
      ("ApplicationSource", Some (application_source_to_yojson x.application_source));
      ("ScalingInstructions", Some (scaling_instructions_to_yojson x.scaling_instructions));
    ]
