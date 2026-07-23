open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let object_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : object_not_found_exception)

let internal_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_service_exception)

let concurrent_update_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_update_exception)

let update_scaling_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_dynamic_scaling_of_yojson = bool_of_yojson

let scaling_policy_update_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "KeepExternalPolicies" -> KeepExternalPolicies
    | `String "ReplaceExternalPolicies" -> ReplaceExternalPolicies
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalingPolicyUpdateBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingPolicyUpdateBehavior")
     : scaling_policy_update_behavior)
    : scaling_policy_update_behavior)

let predictive_scaling_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ForecastAndScale" -> ForecastAndScale
    | `String "ForecastOnly" -> ForecastOnly
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PredictiveScalingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PredictiveScalingMode")
     : predictive_scaling_mode)
    : predictive_scaling_mode)

let resource_capacity_of_yojson = int_of_yojson

let predictive_scaling_max_capacity_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "SetForecastCapacityToMaxCapacity" -> SetForecastCapacityToMaxCapacity
    | `String "SetMaxCapacityToForecastCapacity" -> SetMaxCapacityToForecastCapacity
    | `String "SetMaxCapacityAboveForecastCapacity" -> SetMaxCapacityAboveForecastCapacity
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "PredictiveScalingMaxCapacityBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "PredictiveScalingMaxCapacityBehavior")
     : predictive_scaling_max_capacity_behavior)
    : predictive_scaling_max_capacity_behavior)

let scheduled_action_buffer_time_of_yojson = int_of_yojson
let metric_unit_of_yojson = string_of_yojson

let metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Average" -> Average
    | `String "Minimum" -> Minimum
    | `String "Maximum" -> Maximum
    | `String "SampleCount" -> SampleCount
    | `String "Sum" -> Sum
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricStatistic")
     : metric_statistic)
    : metric_statistic)

let metric_dimension_value_of_yojson = string_of_yojson
let metric_dimension_name_of_yojson = string_of_yojson

let metric_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key metric_dimension_name_of_yojson "Name" _list path;
     value = value_for_key metric_dimension_value_of_yojson "Value" _list path;
   }
    : metric_dimension)

let metric_dimensions_of_yojson tree path = list_of_yojson metric_dimension_of_yojson tree path
let metric_namespace_of_yojson = string_of_yojson
let metric_name_of_yojson = string_of_yojson

let customized_load_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     namespace = value_for_key metric_namespace_of_yojson "Namespace" _list path;
     dimensions =
       option_of_yojson (value_for_key metric_dimensions_of_yojson "Dimensions") _list path;
     statistic = value_for_key metric_statistic_of_yojson "Statistic" _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "Unit") _list path;
   }
    : customized_load_metric_specification)

let resource_label_of_yojson = string_of_yojson

let load_metric_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASGTotalCPUUtilization" -> ASGTotalCPUUtilization
    | `String "ASGTotalNetworkIn" -> ASGTotalNetworkIn
    | `String "ASGTotalNetworkOut" -> ASGTotalNetworkOut
    | `String "ALBTargetGroupRequestCount" -> ALBTargetGroupRequestCount
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadMetricType" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadMetricType")
     : load_metric_type)
    : load_metric_type)

let predefined_load_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predefined_load_metric_type =
       value_for_key load_metric_type_of_yojson "PredefinedLoadMetricType" _list path;
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
   }
    : predefined_load_metric_specification)

let cooldown_of_yojson = int_of_yojson
let disable_scale_in_of_yojson = bool_of_yojson
let metric_scale_of_yojson = double_of_yojson

let customized_scaling_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     namespace = value_for_key metric_namespace_of_yojson "Namespace" _list path;
     dimensions =
       option_of_yojson (value_for_key metric_dimensions_of_yojson "Dimensions") _list path;
     statistic = value_for_key metric_statistic_of_yojson "Statistic" _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "Unit") _list path;
   }
    : customized_scaling_metric_specification)

let scaling_metric_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASGAverageCPUUtilization" -> ASGAverageCPUUtilization
    | `String "ASGAverageNetworkIn" -> ASGAverageNetworkIn
    | `String "ASGAverageNetworkOut" -> ASGAverageNetworkOut
    | `String "DynamoDBReadCapacityUtilization" -> DynamoDBReadCapacityUtilization
    | `String "DynamoDBWriteCapacityUtilization" -> DynamoDBWriteCapacityUtilization
    | `String "ECSServiceAverageCPUUtilization" -> ECSServiceAverageCPUUtilization
    | `String "ECSServiceAverageMemoryUtilization" -> ECSServiceAverageMemoryUtilization
    | `String "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
    | `String "RDSReaderAverageCPUUtilization" -> RDSReaderAverageCPUUtilization
    | `String "RDSReaderAverageDatabaseConnections" -> RDSReaderAverageDatabaseConnections
    | `String "EC2SpotFleetRequestAverageCPUUtilization" -> EC2SpotFleetRequestAverageCPUUtilization
    | `String "EC2SpotFleetRequestAverageNetworkIn" -> EC2SpotFleetRequestAverageNetworkIn
    | `String "EC2SpotFleetRequestAverageNetworkOut" -> EC2SpotFleetRequestAverageNetworkOut
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingMetricType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingMetricType")
     : scaling_metric_type)
    : scaling_metric_type)

let predefined_scaling_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predefined_scaling_metric_type =
       value_for_key scaling_metric_type_of_yojson "PredefinedScalingMetricType" _list path;
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
   }
    : predefined_scaling_metric_specification)

let target_tracking_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predefined_scaling_metric_specification =
       option_of_yojson
         (value_for_key predefined_scaling_metric_specification_of_yojson
            "PredefinedScalingMetricSpecification")
         _list path;
     customized_scaling_metric_specification =
       option_of_yojson
         (value_for_key customized_scaling_metric_specification_of_yojson
            "CustomizedScalingMetricSpecification")
         _list path;
     target_value = value_for_key metric_scale_of_yojson "TargetValue" _list path;
     disable_scale_in =
       option_of_yojson (value_for_key disable_scale_in_of_yojson "DisableScaleIn") _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key cooldown_of_yojson "ScaleOutCooldown") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key cooldown_of_yojson "ScaleInCooldown") _list path;
     estimated_instance_warmup =
       option_of_yojson (value_for_key cooldown_of_yojson "EstimatedInstanceWarmup") _list path;
   }
    : target_tracking_configuration)

let target_tracking_configurations_of_yojson tree path =
  list_of_yojson target_tracking_configuration_of_yojson tree path

let scalable_dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "autoscaling:autoScalingGroup:DesiredCapacity" -> AutoScalingGroupDesiredCapacity
    | `String "ecs:service:DesiredCount" -> ECSServiceDesiredCount
    | `String "ec2:spot-fleet-request:TargetCapacity" -> EC2SpotFleetRequestTargetCapacity
    | `String "rds:cluster:ReadReplicaCount" -> RDSClusterReadReplicaCount
    | `String "dynamodb:table:ReadCapacityUnits" -> DynamoDBTableReadCapacityUnits
    | `String "dynamodb:table:WriteCapacityUnits" -> DynamoDBTableWriteCapacityUnits
    | `String "dynamodb:index:ReadCapacityUnits" -> DynamoDBIndexReadCapacityUnits
    | `String "dynamodb:index:WriteCapacityUnits" -> DynamoDBIndexWriteCapacityUnits
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalableDimension" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalableDimension")
     : scalable_dimension)
    : scalable_dimension)

let resource_id_max_len1600_of_yojson = string_of_yojson

let service_namespace_of_yojson (tree : t) path =
  ((match tree with
    | `String "autoscaling" -> AUTOSCALING
    | `String "ecs" -> ECS
    | `String "ec2" -> EC2
    | `String "rds" -> RDS
    | `String "dynamodb" -> DYNAMODB
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceNamespace" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceNamespace")
     : service_namespace)
    : service_namespace)

let scaling_instruction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     min_capacity = value_for_key resource_capacity_of_yojson "MinCapacity" _list path;
     max_capacity = value_for_key resource_capacity_of_yojson "MaxCapacity" _list path;
     target_tracking_configurations =
       value_for_key target_tracking_configurations_of_yojson "TargetTrackingConfigurations" _list
         path;
     predefined_load_metric_specification =
       option_of_yojson
         (value_for_key predefined_load_metric_specification_of_yojson
            "PredefinedLoadMetricSpecification")
         _list path;
     customized_load_metric_specification =
       option_of_yojson
         (value_for_key customized_load_metric_specification_of_yojson
            "CustomizedLoadMetricSpecification")
         _list path;
     scheduled_action_buffer_time =
       option_of_yojson
         (value_for_key scheduled_action_buffer_time_of_yojson "ScheduledActionBufferTime")
         _list path;
     predictive_scaling_max_capacity_behavior =
       option_of_yojson
         (value_for_key predictive_scaling_max_capacity_behavior_of_yojson
            "PredictiveScalingMaxCapacityBehavior")
         _list path;
     predictive_scaling_max_capacity_buffer =
       option_of_yojson
         (value_for_key resource_capacity_of_yojson "PredictiveScalingMaxCapacityBuffer")
         _list path;
     predictive_scaling_mode =
       option_of_yojson
         (value_for_key predictive_scaling_mode_of_yojson "PredictiveScalingMode")
         _list path;
     scaling_policy_update_behavior =
       option_of_yojson
         (value_for_key scaling_policy_update_behavior_of_yojson "ScalingPolicyUpdateBehavior")
         _list path;
     disable_dynamic_scaling =
       option_of_yojson
         (value_for_key disable_dynamic_scaling_of_yojson "DisableDynamicScaling")
         _list path;
   }
    : scaling_instruction)

let scaling_instructions_of_yojson tree path =
  list_of_yojson scaling_instruction_of_yojson tree path

let xml_string_max_len256_of_yojson = string_of_yojson
let tag_values_of_yojson tree path = list_of_yojson xml_string_max_len256_of_yojson tree path
let xml_string_max_len128_of_yojson = string_of_yojson

let tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key xml_string_max_len128_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key tag_values_of_yojson "Values") _list path;
   }
    : tag_filter)

let tag_filters_of_yojson tree path = list_of_yojson tag_filter_of_yojson tree path
let xml_string_of_yojson = string_of_yojson

let application_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_formation_stack_ar_n =
       option_of_yojson (value_for_key xml_string_of_yojson "CloudFormationStackARN") _list path;
     tag_filters = option_of_yojson (value_for_key tag_filters_of_yojson "TagFilters") _list path;
   }
    : application_source)

let scaling_plan_version_of_yojson = long_of_yojson
let scaling_plan_name_of_yojson = string_of_yojson

let update_scaling_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
     application_source =
       option_of_yojson (value_for_key application_source_of_yojson "ApplicationSource") _list path;
     scaling_instructions =
       option_of_yojson
         (value_for_key scaling_instructions_of_yojson "ScalingInstructions")
         _list path;
   }
    : update_scaling_plan_request)

let timestamp_type_of_yojson = timestamp_epoch_seconds_of_yojson

let datapoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_type_of_yojson "Timestamp") _list path;
     value = option_of_yojson (value_for_key metric_scale_of_yojson "Value") _list path;
   }
    : datapoint)

let datapoints_of_yojson tree path = list_of_yojson datapoint_of_yojson tree path

let get_scaling_plan_resource_forecast_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ datapoints = value_for_key datapoints_of_yojson "Datapoints" _list path }
    : get_scaling_plan_resource_forecast_data_response)

let forecast_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CapacityForecast" -> CapacityForecast
    | `String "LoadForecast" -> LoadForecast
    | `String "ScheduledActionMinCapacity" -> ScheduledActionMinCapacity
    | `String "ScheduledActionMaxCapacity" -> ScheduledActionMaxCapacity
    | `String value -> raise (deserialize_unknown_enum_value_error path "ForecastDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "ForecastDataType")
     : forecast_data_type)
    : forecast_data_type)

let get_scaling_plan_resource_forecast_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     resource_id = value_for_key xml_string_of_yojson "ResourceId" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     forecast_data_type = value_for_key forecast_data_type_of_yojson "ForecastDataType" _list path;
     start_time = value_for_key timestamp_type_of_yojson "StartTime" _list path;
     end_time = value_for_key timestamp_type_of_yojson "EndTime" _list path;
   }
    : get_scaling_plan_resource_forecast_data_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let next_token_of_yojson = string_of_yojson

let scaling_plan_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> Active
    | `String "ActiveWithProblems" -> ActiveWithProblems
    | `String "CreationInProgress" -> CreationInProgress
    | `String "CreationFailed" -> CreationFailed
    | `String "DeletionInProgress" -> DeletionInProgress
    | `String "DeletionFailed" -> DeletionFailed
    | `String "UpdateInProgress" -> UpdateInProgress
    | `String "UpdateFailed" -> UpdateFailed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalingPlanStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingPlanStatusCode")
     : scaling_plan_status_code)
    : scaling_plan_status_code)

let scaling_plan_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
     application_source = value_for_key application_source_of_yojson "ApplicationSource" _list path;
     scaling_instructions =
       value_for_key scaling_instructions_of_yojson "ScalingInstructions" _list path;
     status_code = value_for_key scaling_plan_status_code_of_yojson "StatusCode" _list path;
     status_message =
       option_of_yojson (value_for_key xml_string_of_yojson "StatusMessage") _list path;
     status_start_time =
       option_of_yojson (value_for_key timestamp_type_of_yojson "StatusStartTime") _list path;
     creation_time =
       option_of_yojson (value_for_key timestamp_type_of_yojson "CreationTime") _list path;
   }
    : scaling_plan)

let scaling_plans_of_yojson tree path = list_of_yojson scaling_plan_of_yojson tree path

let describe_scaling_plans_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plans =
       option_of_yojson (value_for_key scaling_plans_of_yojson "ScalingPlans") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_scaling_plans_response)

let max_results_of_yojson = int_of_yojson
let application_sources_of_yojson tree path = list_of_yojson application_source_of_yojson tree path
let scaling_plan_names_of_yojson tree path = list_of_yojson scaling_plan_name_of_yojson tree path

let describe_scaling_plans_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_names =
       option_of_yojson (value_for_key scaling_plan_names_of_yojson "ScalingPlanNames") _list path;
     scaling_plan_version =
       option_of_yojson
         (value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion")
         _list path;
     application_sources =
       option_of_yojson
         (value_for_key application_sources_of_yojson "ApplicationSources")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_scaling_plans_request)

let scaling_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "Inactive" -> Inactive
    | `String "PartiallyActive" -> PartiallyActive
    | `String "Active" -> Active
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingStatusCode")
     : scaling_status_code)
    : scaling_status_code)

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TargetTrackingScaling" -> TargetTrackingScaling
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let policy_name_of_yojson = string_of_yojson

let scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_name = value_for_key policy_name_of_yojson "PolicyName" _list path;
     policy_type = value_for_key policy_type_of_yojson "PolicyType" _list path;
     target_tracking_configuration =
       option_of_yojson
         (value_for_key target_tracking_configuration_of_yojson "TargetTrackingConfiguration")
         _list path;
   }
    : scaling_policy)

let scaling_policies_of_yojson tree path = list_of_yojson scaling_policy_of_yojson tree path

let scaling_plan_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     scaling_policies =
       option_of_yojson (value_for_key scaling_policies_of_yojson "ScalingPolicies") _list path;
     scaling_status_code =
       value_for_key scaling_status_code_of_yojson "ScalingStatusCode" _list path;
     scaling_status_message =
       option_of_yojson (value_for_key xml_string_of_yojson "ScalingStatusMessage") _list path;
   }
    : scaling_plan_resource)

let scaling_plan_resources_of_yojson tree path =
  list_of_yojson scaling_plan_resource_of_yojson tree path

let describe_scaling_plan_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_resources =
       option_of_yojson
         (value_for_key scaling_plan_resources_of_yojson "ScalingPlanResources")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_scaling_plan_resources_response)

let describe_scaling_plan_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_scaling_plan_resources_request)

let delete_scaling_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_scaling_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
   }
    : delete_scaling_plan_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let create_scaling_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_version =
       value_for_key scaling_plan_version_of_yojson "ScalingPlanVersion" _list path;
   }
    : create_scaling_plan_response)

let create_scaling_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_plan_name = value_for_key scaling_plan_name_of_yojson "ScalingPlanName" _list path;
     application_source = value_for_key application_source_of_yojson "ApplicationSource" _list path;
     scaling_instructions =
       value_for_key scaling_instructions_of_yojson "ScalingInstructions" _list path;
   }
    : create_scaling_plan_request)
