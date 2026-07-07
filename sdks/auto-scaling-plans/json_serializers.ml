open Smaws_Lib.Json.SerializeHelpers
open Types

let xml_string_max_len256_to_yojson = string_to_yojson
let xml_string_max_len128_to_yojson = string_to_yojson
let xml_string_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_scaling_plan_response_to_yojson = unit_to_yojson
let scaling_plan_name_to_yojson = string_to_yojson
let scaling_plan_version_to_yojson = long_to_yojson
let tag_values_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson tag_values_to_yojson x.values);
      ("Key", option_to_yojson xml_string_max_len128_to_yojson x.key);
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree

let application_source_to_yojson (x : application_source) =
  assoc_to_yojson
    [
      ("TagFilters", option_to_yojson tag_filters_to_yojson x.tag_filters);
      ("CloudFormationStackARN", option_to_yojson xml_string_to_yojson x.cloud_formation_stack_ar_n);
    ]

let service_namespace_to_yojson (x : service_namespace) =
  match x with
  | DYNAMODB -> `String "dynamodb"
  | RDS -> `String "rds"
  | EC2 -> `String "ec2"
  | ECS -> `String "ecs"
  | AUTOSCALING -> `String "autoscaling"

let resource_id_max_len1600_to_yojson = string_to_yojson

let scalable_dimension_to_yojson (x : scalable_dimension) =
  match x with
  | DynamoDBIndexWriteCapacityUnits -> `String "dynamodb:index:WriteCapacityUnits"
  | DynamoDBIndexReadCapacityUnits -> `String "dynamodb:index:ReadCapacityUnits"
  | DynamoDBTableWriteCapacityUnits -> `String "dynamodb:table:WriteCapacityUnits"
  | DynamoDBTableReadCapacityUnits -> `String "dynamodb:table:ReadCapacityUnits"
  | RDSClusterReadReplicaCount -> `String "rds:cluster:ReadReplicaCount"
  | EC2SpotFleetRequestTargetCapacity -> `String "ec2:spot-fleet-request:TargetCapacity"
  | ECSServiceDesiredCount -> `String "ecs:service:DesiredCount"
  | AutoScalingGroupDesiredCapacity -> `String "autoscaling:autoScalingGroup:DesiredCapacity"

let resource_capacity_to_yojson = int_to_yojson

let scaling_metric_type_to_yojson (x : scaling_metric_type) =
  match x with
  | EC2SpotFleetRequestAverageNetworkOut -> `String "EC2SpotFleetRequestAverageNetworkOut"
  | EC2SpotFleetRequestAverageNetworkIn -> `String "EC2SpotFleetRequestAverageNetworkIn"
  | EC2SpotFleetRequestAverageCPUUtilization -> `String "EC2SpotFleetRequestAverageCPUUtilization"
  | RDSReaderAverageDatabaseConnections -> `String "RDSReaderAverageDatabaseConnections"
  | RDSReaderAverageCPUUtilization -> `String "RDSReaderAverageCPUUtilization"
  | ALBRequestCountPerTarget -> `String "ALBRequestCountPerTarget"
  | ECSServiceAverageMemoryUtilization -> `String "ECSServiceAverageMemoryUtilization"
  | ECSServiceAverageCPUUtilization -> `String "ECSServiceAverageCPUUtilization"
  | DynamoDBWriteCapacityUtilization -> `String "DynamoDBWriteCapacityUtilization"
  | DynamoDBReadCapacityUtilization -> `String "DynamoDBReadCapacityUtilization"
  | ASGAverageNetworkOut -> `String "ASGAverageNetworkOut"
  | ASGAverageNetworkIn -> `String "ASGAverageNetworkIn"
  | ASGAverageCPUUtilization -> `String "ASGAverageCPUUtilization"

let resource_label_to_yojson = string_to_yojson

let predefined_scaling_metric_specification_to_yojson (x : predefined_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ( "PredefinedScalingMetricType",
        Some (scaling_metric_type_to_yojson x.predefined_scaling_metric_type) );
    ]

let metric_name_to_yojson = string_to_yojson
let metric_namespace_to_yojson = string_to_yojson
let metric_dimension_name_to_yojson = string_to_yojson
let metric_dimension_value_to_yojson = string_to_yojson

let metric_dimension_to_yojson (x : metric_dimension) =
  assoc_to_yojson
    [
      ("Value", Some (metric_dimension_value_to_yojson x.value));
      ("Name", Some (metric_dimension_name_to_yojson x.name));
    ]

let metric_dimensions_to_yojson tree = list_to_yojson metric_dimension_to_yojson tree

let metric_statistic_to_yojson (x : metric_statistic) =
  match x with
  | Sum -> `String "Sum"
  | SampleCount -> `String "SampleCount"
  | Maximum -> `String "Maximum"
  | Minimum -> `String "Minimum"
  | Average -> `String "Average"

let metric_unit_to_yojson = string_to_yojson

let customized_scaling_metric_specification_to_yojson (x : customized_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("Statistic", Some (metric_statistic_to_yojson x.statistic));
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Namespace", Some (metric_namespace_to_yojson x.namespace));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
    ]

let metric_scale_to_yojson = double_to_yojson
let disable_scale_in_to_yojson = bool_to_yojson
let cooldown_to_yojson = int_to_yojson

let target_tracking_configuration_to_yojson (x : target_tracking_configuration) =
  assoc_to_yojson
    [
      ("EstimatedInstanceWarmup", option_to_yojson cooldown_to_yojson x.estimated_instance_warmup);
      ("ScaleInCooldown", option_to_yojson cooldown_to_yojson x.scale_in_cooldown);
      ("ScaleOutCooldown", option_to_yojson cooldown_to_yojson x.scale_out_cooldown);
      ("DisableScaleIn", option_to_yojson disable_scale_in_to_yojson x.disable_scale_in);
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
      ( "CustomizedScalingMetricSpecification",
        option_to_yojson customized_scaling_metric_specification_to_yojson
          x.customized_scaling_metric_specification );
      ( "PredefinedScalingMetricSpecification",
        option_to_yojson predefined_scaling_metric_specification_to_yojson
          x.predefined_scaling_metric_specification );
    ]

let target_tracking_configurations_to_yojson tree =
  list_to_yojson target_tracking_configuration_to_yojson tree

let load_metric_type_to_yojson (x : load_metric_type) =
  match x with
  | ALBTargetGroupRequestCount -> `String "ALBTargetGroupRequestCount"
  | ASGTotalNetworkOut -> `String "ASGTotalNetworkOut"
  | ASGTotalNetworkIn -> `String "ASGTotalNetworkIn"
  | ASGTotalCPUUtilization -> `String "ASGTotalCPUUtilization"

let predefined_load_metric_specification_to_yojson (x : predefined_load_metric_specification) =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ("PredefinedLoadMetricType", Some (load_metric_type_to_yojson x.predefined_load_metric_type));
    ]

let customized_load_metric_specification_to_yojson (x : customized_load_metric_specification) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("Statistic", Some (metric_statistic_to_yojson x.statistic));
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Namespace", Some (metric_namespace_to_yojson x.namespace));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
    ]

let scheduled_action_buffer_time_to_yojson = int_to_yojson

let predictive_scaling_max_capacity_behavior_to_yojson
    (x : predictive_scaling_max_capacity_behavior) =
  match x with
  | SetMaxCapacityAboveForecastCapacity -> `String "SetMaxCapacityAboveForecastCapacity"
  | SetMaxCapacityToForecastCapacity -> `String "SetMaxCapacityToForecastCapacity"
  | SetForecastCapacityToMaxCapacity -> `String "SetForecastCapacityToMaxCapacity"

let predictive_scaling_mode_to_yojson (x : predictive_scaling_mode) =
  match x with
  | ForecastOnly -> `String "ForecastOnly"
  | ForecastAndScale -> `String "ForecastAndScale"

let scaling_policy_update_behavior_to_yojson (x : scaling_policy_update_behavior) =
  match x with
  | ReplaceExternalPolicies -> `String "ReplaceExternalPolicies"
  | KeepExternalPolicies -> `String "KeepExternalPolicies"

let disable_dynamic_scaling_to_yojson = bool_to_yojson

let scaling_instruction_to_yojson (x : scaling_instruction) =
  assoc_to_yojson
    [
      ( "DisableDynamicScaling",
        option_to_yojson disable_dynamic_scaling_to_yojson x.disable_dynamic_scaling );
      ( "ScalingPolicyUpdateBehavior",
        option_to_yojson scaling_policy_update_behavior_to_yojson x.scaling_policy_update_behavior
      );
      ( "PredictiveScalingMode",
        option_to_yojson predictive_scaling_mode_to_yojson x.predictive_scaling_mode );
      ( "PredictiveScalingMaxCapacityBuffer",
        option_to_yojson resource_capacity_to_yojson x.predictive_scaling_max_capacity_buffer );
      ( "PredictiveScalingMaxCapacityBehavior",
        option_to_yojson predictive_scaling_max_capacity_behavior_to_yojson
          x.predictive_scaling_max_capacity_behavior );
      ( "ScheduledActionBufferTime",
        option_to_yojson scheduled_action_buffer_time_to_yojson x.scheduled_action_buffer_time );
      ( "CustomizedLoadMetricSpecification",
        option_to_yojson customized_load_metric_specification_to_yojson
          x.customized_load_metric_specification );
      ( "PredefinedLoadMetricSpecification",
        option_to_yojson predefined_load_metric_specification_to_yojson
          x.predefined_load_metric_specification );
      ( "TargetTrackingConfigurations",
        Some (target_tracking_configurations_to_yojson x.target_tracking_configurations) );
      ("MaxCapacity", Some (resource_capacity_to_yojson x.max_capacity));
      ("MinCapacity", Some (resource_capacity_to_yojson x.min_capacity));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let scaling_instructions_to_yojson tree = list_to_yojson scaling_instruction_to_yojson tree

let update_scaling_plan_request_to_yojson (x : update_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingInstructions", option_to_yojson scaling_instructions_to_yojson x.scaling_instructions);
      ("ApplicationSource", option_to_yojson application_source_to_yojson x.application_source);
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let object_not_found_exception_to_yojson (x : object_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_update_exception_to_yojson (x : concurrent_update_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson

let scaling_status_code_to_yojson (x : scaling_status_code) =
  match x with
  | Active -> `String "Active"
  | PartiallyActive -> `String "PartiallyActive"
  | Inactive -> `String "Inactive"

let policy_name_to_yojson = string_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with TargetTrackingScaling -> `String "TargetTrackingScaling"

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ( "TargetTrackingConfiguration",
        option_to_yojson target_tracking_configuration_to_yojson x.target_tracking_configuration );
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
    ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let scaling_plan_status_code_to_yojson (x : scaling_plan_status_code) =
  match x with
  | UpdateFailed -> `String "UpdateFailed"
  | UpdateInProgress -> `String "UpdateInProgress"
  | DeletionFailed -> `String "DeletionFailed"
  | DeletionInProgress -> `String "DeletionInProgress"
  | CreationFailed -> `String "CreationFailed"
  | CreationInProgress -> `String "CreationInProgress"
  | ActiveWithProblems -> `String "ActiveWithProblems"
  | Active -> `String "Active"

let scaling_plan_to_yojson (x : scaling_plan) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_type_to_yojson x.creation_time);
      ("StatusStartTime", option_to_yojson timestamp_type_to_yojson x.status_start_time);
      ("StatusMessage", option_to_yojson xml_string_to_yojson x.status_message);
      ("StatusCode", Some (scaling_plan_status_code_to_yojson x.status_code));
      ("ScalingInstructions", Some (scaling_instructions_to_yojson x.scaling_instructions));
      ("ApplicationSource", Some (application_source_to_yojson x.application_source));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let scaling_plans_to_yojson tree = list_to_yojson scaling_plan_to_yojson tree

let scaling_plan_resource_to_yojson (x : scaling_plan_resource) =
  assoc_to_yojson
    [
      ("ScalingStatusMessage", option_to_yojson xml_string_to_yojson x.scaling_status_message);
      ("ScalingStatusCode", Some (scaling_status_code_to_yojson x.scaling_status_code));
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let scaling_plan_resources_to_yojson tree = list_to_yojson scaling_plan_resource_to_yojson tree
let scaling_plan_names_to_yojson tree = list_to_yojson scaling_plan_name_to_yojson tree
let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let datapoint_to_yojson (x : datapoint) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson metric_scale_to_yojson x.value);
      ("Timestamp", option_to_yojson timestamp_type_to_yojson x.timestamp);
    ]

let datapoints_to_yojson tree = list_to_yojson datapoint_to_yojson tree

let get_scaling_plan_resource_forecast_data_response_to_yojson
    (x : get_scaling_plan_resource_forecast_data_response) =
  assoc_to_yojson [ ("Datapoints", Some (datapoints_to_yojson x.datapoints)) ]

let forecast_data_type_to_yojson (x : forecast_data_type) =
  match x with
  | ScheduledActionMaxCapacity -> `String "ScheduledActionMaxCapacity"
  | ScheduledActionMinCapacity -> `String "ScheduledActionMinCapacity"
  | LoadForecast -> `String "LoadForecast"
  | CapacityForecast -> `String "CapacityForecast"

let get_scaling_plan_resource_forecast_data_request_to_yojson
    (x : get_scaling_plan_resource_forecast_data_request) =
  assoc_to_yojson
    [
      ("EndTime", Some (timestamp_type_to_yojson x.end_time));
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("ForecastDataType", Some (forecast_data_type_to_yojson x.forecast_data_type));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (xml_string_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let describe_scaling_plans_response_to_yojson (x : describe_scaling_plans_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ScalingPlans", option_to_yojson scaling_plans_to_yojson x.scaling_plans);
    ]

let application_sources_to_yojson tree = list_to_yojson application_source_to_yojson tree

let describe_scaling_plans_request_to_yojson (x : describe_scaling_plans_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ApplicationSources", option_to_yojson application_sources_to_yojson x.application_sources);
      ("ScalingPlanVersion", option_to_yojson scaling_plan_version_to_yojson x.scaling_plan_version);
      ("ScalingPlanNames", option_to_yojson scaling_plan_names_to_yojson x.scaling_plan_names);
    ]

let describe_scaling_plan_resources_response_to_yojson
    (x : describe_scaling_plan_resources_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ScalingPlanResources",
        option_to_yojson scaling_plan_resources_to_yojson x.scaling_plan_resources );
    ]

let describe_scaling_plan_resources_request_to_yojson (x : describe_scaling_plan_resources_request)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let delete_scaling_plan_response_to_yojson = unit_to_yojson

let delete_scaling_plan_request_to_yojson (x : delete_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]

let create_scaling_plan_response_to_yojson (x : create_scaling_plan_response) =
  assoc_to_yojson
    [ ("ScalingPlanVersion", Some (scaling_plan_version_to_yojson x.scaling_plan_version)) ]

let create_scaling_plan_request_to_yojson (x : create_scaling_plan_request) =
  assoc_to_yojson
    [
      ("ScalingInstructions", Some (scaling_instructions_to_yojson x.scaling_instructions));
      ("ApplicationSource", Some (application_source_to_yojson x.application_source));
      ("ScalingPlanName", Some (scaling_plan_name_to_yojson x.scaling_plan_name));
    ]
