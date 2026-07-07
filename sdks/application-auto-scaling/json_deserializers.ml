open Smaws_Lib.Json.DeserializeHelpers
open Types

let xml_string_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let exception_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceName") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : resource_not_found_exception)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceName") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : too_many_tags_exception)

let timestamp_type_of_yojson = timestamp_epoch_seconds_of_yojson
let metric_scale_of_yojson = double_of_yojson

let metric_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ECSServiceAverageMemoryUtilizationHighResolution" ->
        ECSServiceAverageMemoryUtilizationHighResolution
    | `String "ECSServiceAverageCPUUtilizationHighResolution" ->
        ECSServiceAverageCPUUtilizationHighResolution
    | `String "SageMakerVariantConcurrentRequestsPerModelHighResolution" ->
        SageMakerVariantConcurrentRequestsPerModelHighResolution
    | `String "SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution" ->
        SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution
    | `String "WorkSpacesAverageUserSessionsCapacityUtilization" ->
        WorkSpacesAverageUserSessionsCapacityUtilization
    | `String "SageMakerInferenceComponentInvocationsPerCopy" ->
        SageMakerInferenceComponentInvocationsPerCopy
    | `String "ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage" ->
        ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage
    | `String "SageMakerVariantProvisionedConcurrencyUtilization" ->
        SageMakerVariantProvisionedConcurrencyUtilization
    | `String "NeptuneReaderAverageCPUUtilization" -> NeptuneReaderAverageCPUUtilization
    | `String "ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage" ->
        ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage
    | `String "ElastiCacheReplicaEngineCPUUtilization" -> ElastiCacheReplicaEngineCPUUtilization
    | `String "ElastiCachePrimaryEngineCPUUtilization" -> ElastiCachePrimaryEngineCPUUtilization
    | `String "ElastiCacheDatabaseMemoryUsagePercentage" -> ElastiCacheDatabaseMemoryUsagePercentage
    | `String "ElastiCacheEngineCPUUtilization" -> ElastiCacheEngineCPUUtilization
    | `String "KafkaBrokerStorageUtilization" -> KafkaBrokerStorageUtilization
    | `String "CassandraWriteCapacityUtilization" -> CassandraWriteCapacityUtilization
    | `String "CassandraReadCapacityUtilization" -> CassandraReadCapacityUtilization
    | `String "LambdaProvisionedConcurrencyUtilization" -> LambdaProvisionedConcurrencyUtilization
    | `String "ComprehendInferenceUtilization" -> ComprehendInferenceUtilization
    | `String "AppStreamAverageCapacityUtilization" -> AppStreamAverageCapacityUtilization
    | `String "ECSServiceAverageMemoryUtilization" -> ECSServiceAverageMemoryUtilization
    | `String "ECSServiceAverageCPUUtilization" -> ECSServiceAverageCPUUtilization
    | `String "SageMakerVariantInvocationsPerInstance" -> SageMakerVariantInvocationsPerInstance
    | `String "EC2SpotFleetRequestAverageNetworkOut" -> EC2SpotFleetRequestAverageNetworkOut
    | `String "EC2SpotFleetRequestAverageNetworkIn" -> EC2SpotFleetRequestAverageNetworkIn
    | `String "EC2SpotFleetRequestAverageCPUUtilization" -> EC2SpotFleetRequestAverageCPUUtilization
    | `String "RDSReaderAverageDatabaseConnections" -> RDSReaderAverageDatabaseConnections
    | `String "RDSReaderAverageCPUUtilization" -> RDSReaderAverageCPUUtilization
    | `String "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
    | `String "DynamoDBWriteCapacityUtilization" -> DynamoDBWriteCapacityUtilization
    | `String "DynamoDBReadCapacityUtilization" -> DynamoDBReadCapacityUtilization
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricType" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricType")
     : metric_type)
    : metric_type)

let resource_label_of_yojson = string_of_yojson

let predefined_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
     predefined_metric_type = value_for_key metric_type_of_yojson "PredefinedMetricType" _list path;
   }
    : predefined_metric_specification)

let metric_name_of_yojson = string_of_yojson
let metric_namespace_of_yojson = string_of_yojson
let metric_dimension_name_of_yojson = string_of_yojson
let metric_dimension_value_of_yojson = string_of_yojson

let metric_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key metric_dimension_value_of_yojson "Value" _list path;
     name = value_for_key metric_dimension_name_of_yojson "Name" _list path;
   }
    : metric_dimension)

let metric_dimensions_of_yojson tree path = list_of_yojson metric_dimension_of_yojson tree path

let metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Sum" -> Sum
    | `String "SampleCount" -> SampleCount
    | `String "Maximum" -> Maximum
    | `String "Minimum" -> Minimum
    | `String "Average" -> Average
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricStatistic")
     : metric_statistic)
    : metric_statistic)

let metric_unit_of_yojson = string_of_yojson
let expression_of_yojson = string_of_yojson
let id_of_yojson = string_of_yojson
let target_tracking_metric_dimension_name_of_yojson = string_of_yojson
let target_tracking_metric_dimension_value_of_yojson = string_of_yojson

let target_tracking_metric_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key target_tracking_metric_dimension_value_of_yojson "Value" _list path;
     name = value_for_key target_tracking_metric_dimension_name_of_yojson "Name" _list path;
   }
    : target_tracking_metric_dimension)

let target_tracking_metric_dimensions_of_yojson tree path =
  list_of_yojson target_tracking_metric_dimension_of_yojson tree path

let target_tracking_metric_name_of_yojson = string_of_yojson
let target_tracking_metric_namespace_of_yojson = string_of_yojson

let target_tracking_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       option_of_yojson
         (value_for_key target_tracking_metric_namespace_of_yojson "Namespace")
         _list path;
     metric_name =
       option_of_yojson
         (value_for_key target_tracking_metric_name_of_yojson "MetricName")
         _list path;
     dimensions =
       option_of_yojson
         (value_for_key target_tracking_metric_dimensions_of_yojson "Dimensions")
         _list path;
   }
    : target_tracking_metric)

let target_tracking_metric_unit_of_yojson = string_of_yojson

let target_tracking_metric_stat_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ =
       option_of_yojson (value_for_key target_tracking_metric_unit_of_yojson "Unit") _list path;
     stat = value_for_key xml_string_of_yojson "Stat" _list path;
     metric = value_for_key target_tracking_metric_of_yojson "Metric" _list path;
   }
    : target_tracking_metric_stat)

let return_data_of_yojson = bool_of_yojson

let target_tracking_metric_data_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_data = option_of_yojson (value_for_key return_data_of_yojson "ReturnData") _list path;
     metric_stat =
       option_of_yojson
         (value_for_key target_tracking_metric_stat_of_yojson "MetricStat")
         _list path;
     label = option_of_yojson (value_for_key xml_string_of_yojson "Label") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
     expression = option_of_yojson (value_for_key expression_of_yojson "Expression") _list path;
   }
    : target_tracking_metric_data_query)

let target_tracking_metric_data_queries_of_yojson tree path =
  list_of_yojson target_tracking_metric_data_query_of_yojson tree path

let customized_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics =
       option_of_yojson
         (value_for_key target_tracking_metric_data_queries_of_yojson "Metrics")
         _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "Unit") _list path;
     statistic = option_of_yojson (value_for_key metric_statistic_of_yojson "Statistic") _list path;
     dimensions =
       option_of_yojson (value_for_key metric_dimensions_of_yojson "Dimensions") _list path;
     namespace = option_of_yojson (value_for_key metric_namespace_of_yojson "Namespace") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
   }
    : customized_metric_specification)

let cooldown_of_yojson = int_of_yojson
let disable_scale_in_of_yojson = bool_of_yojson

let target_tracking_scaling_policy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_scale_in =
       option_of_yojson (value_for_key disable_scale_in_of_yojson "DisableScaleIn") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key cooldown_of_yojson "ScaleInCooldown") _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key cooldown_of_yojson "ScaleOutCooldown") _list path;
     customized_metric_specification =
       option_of_yojson
         (value_for_key customized_metric_specification_of_yojson "CustomizedMetricSpecification")
         _list path;
     predefined_metric_specification =
       option_of_yojson
         (value_for_key predefined_metric_specification_of_yojson "PredefinedMetricSpecification")
         _list path;
     target_value = value_for_key metric_scale_of_yojson "TargetValue" _list path;
   }
    : target_tracking_scaling_policy_configuration)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_map_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let scaling_suspended_of_yojson = bool_of_yojson

let suspended_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_scaling_suspended =
       option_of_yojson
         (value_for_key scaling_suspended_of_yojson "ScheduledScalingSuspended")
         _list path;
     dynamic_scaling_out_suspended =
       option_of_yojson
         (value_for_key scaling_suspended_of_yojson "DynamicScalingOutSuspended")
         _list path;
     dynamic_scaling_in_suspended =
       option_of_yojson
         (value_for_key scaling_suspended_of_yojson "DynamicScalingInSuspended")
         _list path;
   }
    : suspended_state)

let adjustment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ExactCapacity" -> ExactCapacity
    | `String "PercentChangeInCapacity" -> PercentChangeInCapacity
    | `String "ChangeInCapacity" -> ChangeInCapacity
    | `String value -> raise (deserialize_unknown_enum_value_error path "AdjustmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "AdjustmentType")
     : adjustment_type)
    : adjustment_type)

let scaling_adjustment_of_yojson = int_of_yojson

let step_adjustment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_adjustment = value_for_key scaling_adjustment_of_yojson "ScalingAdjustment" _list path;
     metric_interval_upper_bound =
       option_of_yojson (value_for_key metric_scale_of_yojson "MetricIntervalUpperBound") _list path;
     metric_interval_lower_bound =
       option_of_yojson (value_for_key metric_scale_of_yojson "MetricIntervalLowerBound") _list path;
   }
    : step_adjustment)

let step_adjustments_of_yojson tree path = list_of_yojson step_adjustment_of_yojson tree path
let min_adjustment_magnitude_of_yojson = int_of_yojson

let metric_aggregation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Maximum" -> Maximum
    | `String "Minimum" -> Minimum
    | `String "Average" -> Average
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MetricAggregationType" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricAggregationType")
     : metric_aggregation_type)
    : metric_aggregation_type)

let step_scaling_policy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_aggregation_type =
       option_of_yojson
         (value_for_key metric_aggregation_type_of_yojson "MetricAggregationType")
         _list path;
     cooldown = option_of_yojson (value_for_key cooldown_of_yojson "Cooldown") _list path;
     min_adjustment_magnitude =
       option_of_yojson
         (value_for_key min_adjustment_magnitude_of_yojson "MinAdjustmentMagnitude")
         _list path;
     step_adjustments =
       option_of_yojson (value_for_key step_adjustments_of_yojson "StepAdjustments") _list path;
     adjustment_type =
       option_of_yojson (value_for_key adjustment_type_of_yojson "AdjustmentType") _list path;
   }
    : step_scaling_policy_configuration)

let service_namespace_of_yojson (tree : t) path =
  ((match tree with
    | `String "workspaces" -> WORKSPACES
    | `String "neptune" -> NEPTUNE
    | `String "elasticache" -> ELASTICACHE
    | `String "kafka" -> KAFKA
    | `String "cassandra" -> CASSANDRA
    | `String "lambda" -> LAMBDA
    | `String "comprehend" -> COMPREHEND
    | `String "custom-resource" -> CUSTOM_RESOURCE
    | `String "sagemaker" -> SAGEMAKER
    | `String "rds" -> RDS
    | `String "dynamodb" -> DYNAMODB
    | `String "appstream" -> APPSTREAM
    | `String "ec2" -> EC2
    | `String "elasticmapreduce" -> EMR
    | `String "ecs" -> ECS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceNamespace" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceNamespace")
     : service_namespace)
    : service_namespace)

let scheduled_action_name_of_yojson = string_of_yojson
let resource_id_max_len1600_of_yojson = string_of_yojson

let scalable_dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "workspaces:workspacespool:DesiredUserSessions" ->
        WorkSpacesWorkSpacesPoolDesiredUserSessions
    | `String "sagemaker:inference-component:DesiredCopyCount" ->
        SageMakerInferenceComponentDesiredCopyCount
    | `String "sagemaker:variant:DesiredProvisionedConcurrency" ->
        SageMakerVariantDesiredProvisionedConcurrency
    | `String "neptune:cluster:ReadReplicaCount" -> NeptuneClusterReadReplicaCount
    | `String "elasticache:replication-group:Replicas" -> ElastiCacheReplicationGroupReplicas
    | `String "elasticache:replication-group:NodeGroups" -> ElastiCacheReplicationGroupNodeGroups
    | `String "elasticache:cache-cluster:Nodes" -> ElastiCacheCacheClusterNodes
    | `String "kafka:broker-storage:VolumeSize" -> KafkaBrokerStorageVolumeSize
    | `String "cassandra:table:WriteCapacityUnits" -> CassandraTableWriteCapacityUnits
    | `String "cassandra:table:ReadCapacityUnits" -> CassandraTableReadCapacityUnits
    | `String "lambda:function:ProvisionedConcurrency" -> LambdaFunctionProvisionedConcurrency
    | `String "comprehend:entity-recognizer-endpoint:DesiredInferenceUnits" ->
        ComprehendEntityRecognizerEndpointInferenceUnits
    | `String "comprehend:document-classifier-endpoint:DesiredInferenceUnits" ->
        ComprehendDocClassifierEndpointInferenceUnits
    | `String "custom-resource:ResourceType:Property" -> CustomResourceScalableDimension
    | `String "sagemaker:variant:DesiredInstanceCount" -> SageMakerVariantDesiredInstanceCount
    | `String "rds:cluster:ReadReplicaCount" -> RDSClusterReadReplicaCount
    | `String "dynamodb:index:WriteCapacityUnits" -> DynamoDBIndexWriteCapacityUnits
    | `String "dynamodb:index:ReadCapacityUnits" -> DynamoDBIndexReadCapacityUnits
    | `String "dynamodb:table:WriteCapacityUnits" -> DynamoDBTableWriteCapacityUnits
    | `String "dynamodb:table:ReadCapacityUnits" -> DynamoDBTableReadCapacityUnits
    | `String "appstream:fleet:DesiredCapacity" -> AppstreamFleetDesiredCapacity
    | `String "elasticmapreduce:instancegroup:InstanceCount" -> EMRInstanceGroupInstanceCount
    | `String "ec2:spot-fleet-request:TargetCapacity" -> EC2SpotFleetRequestTargetCapacity
    | `String "ecs:service:DesiredCount" -> ECSServiceDesiredCount
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalableDimension" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalableDimension")
     : scalable_dimension)
    : scalable_dimension)

let resource_capacity_of_yojson = int_of_yojson

let scalable_target_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MaxCapacity") _list path;
     min_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MinCapacity") _list path;
   }
    : scalable_target_action)

let scheduled_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = value_for_key timestamp_type_of_yojson "CreationTime" _list path;
     scalable_target_action =
       option_of_yojson
         (value_for_key scalable_target_action_of_yojson "ScalableTargetAction")
         _list path;
     end_time = option_of_yojson (value_for_key timestamp_type_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_type_of_yojson "StartTime") _list path;
     scalable_dimension =
       option_of_yojson (value_for_key scalable_dimension_of_yojson "ScalableDimension") _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     timezone =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "Timezone") _list path;
     schedule = value_for_key resource_id_max_len1600_of_yojson "Schedule" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     scheduled_action_ar_n =
       value_for_key resource_id_max_len1600_of_yojson "ScheduledActionARN" _list path;
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "ScheduledActionName" _list path;
   }
    : scheduled_action)

let scheduled_actions_of_yojson tree path = list_of_yojson scheduled_action_of_yojson tree path
let policy_name_of_yojson = string_of_yojson

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PredictiveScaling" -> PredictiveScaling
    | `String "TargetTrackingScaling" -> TargetTrackingScaling
    | `String "StepScaling" -> StepScaling
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let predictive_scaling_metric_type_of_yojson = string_of_yojson

let predictive_scaling_predefined_metric_pair_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
     predefined_metric_type =
       value_for_key predictive_scaling_metric_type_of_yojson "PredefinedMetricType" _list path;
   }
    : predictive_scaling_predefined_metric_pair_specification)

let predictive_scaling_predefined_scaling_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
     predefined_metric_type =
       value_for_key predictive_scaling_metric_type_of_yojson "PredefinedMetricType" _list path;
   }
    : predictive_scaling_predefined_scaling_metric_specification)

let predictive_scaling_predefined_load_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_label =
       option_of_yojson (value_for_key resource_label_of_yojson "ResourceLabel") _list path;
     predefined_metric_type =
       value_for_key predictive_scaling_metric_type_of_yojson "PredefinedMetricType" _list path;
   }
    : predictive_scaling_predefined_load_metric_specification)

let predictive_scaling_metric_dimension_name_of_yojson = string_of_yojson
let predictive_scaling_metric_dimension_value_of_yojson = string_of_yojson

let predictive_scaling_metric_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key predictive_scaling_metric_dimension_value_of_yojson "Value" _list path;
     name = value_for_key predictive_scaling_metric_dimension_name_of_yojson "Name" _list path;
   }
    : predictive_scaling_metric_dimension)

let predictive_scaling_metric_dimensions_of_yojson tree path =
  list_of_yojson predictive_scaling_metric_dimension_of_yojson tree path

let predictive_scaling_metric_name_of_yojson = string_of_yojson
let predictive_scaling_metric_namespace_of_yojson = string_of_yojson

let predictive_scaling_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       option_of_yojson
         (value_for_key predictive_scaling_metric_namespace_of_yojson "Namespace")
         _list path;
     metric_name =
       option_of_yojson
         (value_for_key predictive_scaling_metric_name_of_yojson "MetricName")
         _list path;
     dimensions =
       option_of_yojson
         (value_for_key predictive_scaling_metric_dimensions_of_yojson "Dimensions")
         _list path;
   }
    : predictive_scaling_metric)

let predictive_scaling_metric_unit_of_yojson = string_of_yojson

let predictive_scaling_metric_stat_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ =
       option_of_yojson (value_for_key predictive_scaling_metric_unit_of_yojson "Unit") _list path;
     stat = value_for_key xml_string_of_yojson "Stat" _list path;
     metric = value_for_key predictive_scaling_metric_of_yojson "Metric" _list path;
   }
    : predictive_scaling_metric_stat)

let predictive_scaling_metric_data_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_data = option_of_yojson (value_for_key return_data_of_yojson "ReturnData") _list path;
     label = option_of_yojson (value_for_key xml_string_of_yojson "Label") _list path;
     metric_stat =
       option_of_yojson
         (value_for_key predictive_scaling_metric_stat_of_yojson "MetricStat")
         _list path;
     expression = option_of_yojson (value_for_key expression_of_yojson "Expression") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
   }
    : predictive_scaling_metric_data_query)

let predictive_scaling_metric_data_queries_of_yojson tree path =
  list_of_yojson predictive_scaling_metric_data_query_of_yojson tree path

let predictive_scaling_customized_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_data_queries =
       value_for_key predictive_scaling_metric_data_queries_of_yojson "MetricDataQueries" _list path;
   }
    : predictive_scaling_customized_metric_specification)

let predictive_scaling_metric_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customized_capacity_metric_specification =
       option_of_yojson
         (value_for_key predictive_scaling_customized_metric_specification_of_yojson
            "CustomizedCapacityMetricSpecification")
         _list path;
     customized_load_metric_specification =
       option_of_yojson
         (value_for_key predictive_scaling_customized_metric_specification_of_yojson
            "CustomizedLoadMetricSpecification")
         _list path;
     customized_scaling_metric_specification =
       option_of_yojson
         (value_for_key predictive_scaling_customized_metric_specification_of_yojson
            "CustomizedScalingMetricSpecification")
         _list path;
     predefined_load_metric_specification =
       option_of_yojson
         (value_for_key predictive_scaling_predefined_load_metric_specification_of_yojson
            "PredefinedLoadMetricSpecification")
         _list path;
     predefined_scaling_metric_specification =
       option_of_yojson
         (value_for_key predictive_scaling_predefined_scaling_metric_specification_of_yojson
            "PredefinedScalingMetricSpecification")
         _list path;
     predefined_metric_pair_specification =
       option_of_yojson
         (value_for_key predictive_scaling_predefined_metric_pair_specification_of_yojson
            "PredefinedMetricPairSpecification")
         _list path;
     target_value = value_for_key metric_scale_of_yojson "TargetValue" _list path;
   }
    : predictive_scaling_metric_specification)

let predictive_scaling_metric_specifications_of_yojson tree path =
  list_of_yojson predictive_scaling_metric_specification_of_yojson tree path

let predictive_scaling_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ForecastAndScale" -> ForecastAndScale
    | `String "ForecastOnly" -> ForecastOnly
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PredictiveScalingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PredictiveScalingMode")
     : predictive_scaling_mode)
    : predictive_scaling_mode)

let predictive_scaling_scheduling_buffer_time_of_yojson = int_of_yojson

let predictive_scaling_max_capacity_breach_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "IncreaseMaxCapacity" -> IncreaseMaxCapacity
    | `String "HonorMaxCapacity" -> HonorMaxCapacity
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "PredictiveScalingMaxCapacityBreachBehavior"
             value)
    | _ -> raise (deserialize_wrong_type_error path "PredictiveScalingMaxCapacityBreachBehavior")
     : predictive_scaling_max_capacity_breach_behavior)
    : predictive_scaling_max_capacity_breach_behavior)

let predictive_scaling_max_capacity_buffer_of_yojson = int_of_yojson

let predictive_scaling_policy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_capacity_buffer =
       option_of_yojson
         (value_for_key predictive_scaling_max_capacity_buffer_of_yojson "MaxCapacityBuffer")
         _list path;
     max_capacity_breach_behavior =
       option_of_yojson
         (value_for_key predictive_scaling_max_capacity_breach_behavior_of_yojson
            "MaxCapacityBreachBehavior")
         _list path;
     scheduling_buffer_time =
       option_of_yojson
         (value_for_key predictive_scaling_scheduling_buffer_time_of_yojson "SchedulingBufferTime")
         _list path;
     mode = option_of_yojson (value_for_key predictive_scaling_mode_of_yojson "Mode") _list path;
     metric_specifications =
       value_for_key predictive_scaling_metric_specifications_of_yojson "MetricSpecifications" _list
         path;
   }
    : predictive_scaling_policy_configuration)

let resource_id_of_yojson = string_of_yojson

let alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_ar_n = value_for_key resource_id_of_yojson "AlarmARN" _list path;
     alarm_name = value_for_key resource_id_of_yojson "AlarmName" _list path;
   }
    : alarm)

let alarms_of_yojson tree path = list_of_yojson alarm_of_yojson tree path

let scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = value_for_key timestamp_type_of_yojson "CreationTime" _list path;
     alarms = option_of_yojson (value_for_key alarms_of_yojson "Alarms") _list path;
     predictive_scaling_policy_configuration =
       option_of_yojson
         (value_for_key predictive_scaling_policy_configuration_of_yojson
            "PredictiveScalingPolicyConfiguration")
         _list path;
     target_tracking_scaling_policy_configuration =
       option_of_yojson
         (value_for_key target_tracking_scaling_policy_configuration_of_yojson
            "TargetTrackingScalingPolicyConfiguration")
         _list path;
     step_scaling_policy_configuration =
       option_of_yojson
         (value_for_key step_scaling_policy_configuration_of_yojson "StepScalingPolicyConfiguration")
         _list path;
     policy_type = value_for_key policy_type_of_yojson "PolicyType" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     policy_name = value_for_key policy_name_of_yojson "PolicyName" _list path;
     policy_ar_n = value_for_key resource_id_max_len1600_of_yojson "PolicyARN" _list path;
   }
    : scaling_policy)

let scaling_policies_of_yojson tree path = list_of_yojson scaling_policy_of_yojson tree path

let scaling_activity_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "Failed" -> Failed
    | `String "Unfulfilled" -> Unfulfilled
    | `String "Overridden" -> Overridden
    | `String "Successful" -> Successful
    | `String "InProgress" -> InProgress
    | `String "Pending" -> Pending
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalingActivityStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingActivityStatusCode")
     : scaling_activity_status_code)
    : scaling_activity_status_code)

let not_scaled_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     current_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "CurrentCapacity") _list path;
     min_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MinCapacity") _list path;
     max_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MaxCapacity") _list path;
     code = value_for_key xml_string_of_yojson "Code" _list path;
   }
    : not_scaled_reason)

let not_scaled_reasons_of_yojson tree path = list_of_yojson not_scaled_reason_of_yojson tree path

let scaling_activity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_scaled_reasons =
       option_of_yojson (value_for_key not_scaled_reasons_of_yojson "NotScaledReasons") _list path;
     details = option_of_yojson (value_for_key xml_string_of_yojson "Details") _list path;
     status_message =
       option_of_yojson (value_for_key xml_string_of_yojson "StatusMessage") _list path;
     status_code = value_for_key scaling_activity_status_code_of_yojson "StatusCode" _list path;
     end_time = option_of_yojson (value_for_key timestamp_type_of_yojson "EndTime") _list path;
     start_time = value_for_key timestamp_type_of_yojson "StartTime" _list path;
     cause = value_for_key xml_string_of_yojson "Cause" _list path;
     description = value_for_key xml_string_of_yojson "Description" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     activity_id = value_for_key resource_id_of_yojson "ActivityId" _list path;
   }
    : scaling_activity)

let scaling_activities_of_yojson tree path = list_of_yojson scaling_activity_of_yojson tree path

let scalable_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_target_ar_n =
       option_of_yojson (value_for_key xml_string_of_yojson "ScalableTargetARN") _list path;
     suspended_state =
       option_of_yojson (value_for_key suspended_state_of_yojson "SuspendedState") _list path;
     creation_time = value_for_key timestamp_type_of_yojson "CreationTime" _list path;
     role_ar_n = value_for_key resource_id_max_len1600_of_yojson "RoleARN" _list path;
     predicted_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "PredictedCapacity") _list path;
     max_capacity = value_for_key resource_capacity_of_yojson "MaxCapacity" _list path;
     min_capacity = value_for_key resource_capacity_of_yojson "MinCapacity" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : scalable_target)

let scalable_targets_of_yojson tree path = list_of_yojson scalable_target_of_yojson tree path

let resource_ids_max_len1600_of_yojson tree path =
  list_of_yojson resource_id_max_len1600_of_yojson tree path

let register_scalable_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_target_ar_n =
       option_of_yojson (value_for_key xml_string_of_yojson "ScalableTargetARN") _list path;
   }
    : register_scalable_target_response)

let register_scalable_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
     suspended_state =
       option_of_yojson (value_for_key suspended_state_of_yojson "SuspendedState") _list path;
     role_ar_n =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "RoleARN") _list path;
     max_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MaxCapacity") _list path;
     min_capacity =
       option_of_yojson (value_for_key resource_capacity_of_yojson "MinCapacity") _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : register_scalable_target_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let internal_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_service_exception)

let concurrent_update_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_update_exception)

let put_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_target_action =
       option_of_yojson
         (value_for_key scalable_target_action_of_yojson "ScalableTargetAction")
         _list path;
     end_time = option_of_yojson (value_for_key timestamp_type_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_type_of_yojson "StartTime") _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "ScheduledActionName" _list path;
     timezone =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "Timezone") _list path;
     schedule =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "Schedule") _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : put_scheduled_action_request)

let object_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : object_not_found_exception)

let put_scaling_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarms = option_of_yojson (value_for_key alarms_of_yojson "Alarms") _list path;
     policy_ar_n = value_for_key resource_id_max_len1600_of_yojson "PolicyARN" _list path;
   }
    : put_scaling_policy_response)

let put_scaling_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictive_scaling_policy_configuration =
       option_of_yojson
         (value_for_key predictive_scaling_policy_configuration_of_yojson
            "PredictiveScalingPolicyConfiguration")
         _list path;
     target_tracking_scaling_policy_configuration =
       option_of_yojson
         (value_for_key target_tracking_scaling_policy_configuration_of_yojson
            "TargetTrackingScalingPolicyConfiguration")
         _list path;
     step_scaling_policy_configuration =
       option_of_yojson
         (value_for_key step_scaling_policy_configuration_of_yojson "StepScalingPolicyConfiguration")
         _list path;
     policy_type = option_of_yojson (value_for_key policy_type_of_yojson "PolicyType") _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     policy_name = value_for_key policy_name_of_yojson "PolicyName" _list path;
   }
    : put_scaling_policy_request)

let failed_resource_access_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : failed_resource_access_exception)

let predictive_scaling_forecast_values_of_yojson tree path =
  list_of_yojson metric_scale_of_yojson tree path

let predictive_scaling_forecast_timestamps_of_yojson tree path =
  list_of_yojson timestamp_type_of_yojson tree path

let max_results_of_yojson = int_of_yojson

let load_forecast_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_specification =
       value_for_key predictive_scaling_metric_specification_of_yojson "MetricSpecification" _list
         path;
     values = value_for_key predictive_scaling_forecast_values_of_yojson "Values" _list path;
     timestamps =
       value_for_key predictive_scaling_forecast_timestamps_of_yojson "Timestamps" _list path;
   }
    : load_forecast)

let load_forecasts_of_yojson tree path = list_of_yojson load_forecast_of_yojson tree path

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let include_not_scaled_activities_of_yojson = bool_of_yojson

let capacity_forecast_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key predictive_scaling_forecast_values_of_yojson "Values" _list path;
     timestamps =
       value_for_key predictive_scaling_forecast_timestamps_of_yojson "Timestamps" _list path;
   }
    : capacity_forecast)

let get_predictive_scaling_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_time = option_of_yojson (value_for_key timestamp_type_of_yojson "UpdateTime") _list path;
     capacity_forecast =
       option_of_yojson (value_for_key capacity_forecast_of_yojson "CapacityForecast") _list path;
     load_forecast =
       option_of_yojson (value_for_key load_forecasts_of_yojson "LoadForecast") _list path;
   }
    : get_predictive_scaling_forecast_response)

let get_predictive_scaling_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = value_for_key timestamp_type_of_yojson "EndTime" _list path;
     start_time = value_for_key timestamp_type_of_yojson "StartTime" _list path;
     policy_name = value_for_key policy_name_of_yojson "PolicyName" _list path;
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : get_predictive_scaling_forecast_request)

let describe_scheduled_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     scheduled_actions =
       option_of_yojson (value_for_key scheduled_actions_of_yojson "ScheduledActions") _list path;
   }
    : describe_scheduled_actions_response)

let describe_scheduled_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     scalable_dimension =
       option_of_yojson (value_for_key scalable_dimension_of_yojson "ScalableDimension") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "ResourceId") _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     scheduled_action_names =
       option_of_yojson
         (value_for_key resource_ids_max_len1600_of_yojson "ScheduledActionNames")
         _list path;
   }
    : describe_scheduled_actions_request)

let describe_scaling_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     scaling_policies =
       option_of_yojson (value_for_key scaling_policies_of_yojson "ScalingPolicies") _list path;
   }
    : describe_scaling_policies_response)

let describe_scaling_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     scalable_dimension =
       option_of_yojson (value_for_key scalable_dimension_of_yojson "ScalableDimension") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "ResourceId") _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     policy_names =
       option_of_yojson (value_for_key resource_ids_max_len1600_of_yojson "PolicyNames") _list path;
   }
    : describe_scaling_policies_request)

let describe_scaling_activities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     scaling_activities =
       option_of_yojson (value_for_key scaling_activities_of_yojson "ScalingActivities") _list path;
   }
    : describe_scaling_activities_response)

let describe_scaling_activities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_not_scaled_activities =
       option_of_yojson
         (value_for_key include_not_scaled_activities_of_yojson "IncludeNotScaledActivities")
         _list path;
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     scalable_dimension =
       option_of_yojson (value_for_key scalable_dimension_of_yojson "ScalableDimension") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_id_max_len1600_of_yojson "ResourceId") _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : describe_scaling_activities_request)

let describe_scalable_targets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     scalable_targets =
       option_of_yojson (value_for_key scalable_targets_of_yojson "ScalableTargets") _list path;
   }
    : describe_scalable_targets_response)

let describe_scalable_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key xml_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     scalable_dimension =
       option_of_yojson (value_for_key scalable_dimension_of_yojson "ScalableDimension") _list path;
     resource_ids =
       option_of_yojson (value_for_key resource_ids_max_len1600_of_yojson "ResourceIds") _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : describe_scalable_targets_request)

let deregister_scalable_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_scalable_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : deregister_scalable_target_request)

let delete_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     scheduled_action_name =
       value_for_key resource_id_max_len1600_of_yojson "ScheduledActionName" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
   }
    : delete_scheduled_action_request)

let delete_scaling_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_scaling_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_dimension = value_for_key scalable_dimension_of_yojson "ScalableDimension" _list path;
     resource_id = value_for_key resource_id_max_len1600_of_yojson "ResourceId" _list path;
     service_namespace = value_for_key service_namespace_of_yojson "ServiceNamespace" _list path;
     policy_name = value_for_key resource_id_max_len1600_of_yojson "PolicyName" _list path;
   }
    : delete_scaling_policy_request)
