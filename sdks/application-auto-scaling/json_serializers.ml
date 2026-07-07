open Smaws_Lib.Json.SerializeHelpers
open Types

let xml_string_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let exception_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson
let metric_scale_to_yojson = double_to_yojson

let metric_type_to_yojson (x : metric_type) =
  match x with
  | ECSServiceAverageMemoryUtilizationHighResolution ->
      `String "ECSServiceAverageMemoryUtilizationHighResolution"
  | ECSServiceAverageCPUUtilizationHighResolution ->
      `String "ECSServiceAverageCPUUtilizationHighResolution"
  | SageMakerVariantConcurrentRequestsPerModelHighResolution ->
      `String "SageMakerVariantConcurrentRequestsPerModelHighResolution"
  | SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution ->
      `String "SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution"
  | WorkSpacesAverageUserSessionsCapacityUtilization ->
      `String "WorkSpacesAverageUserSessionsCapacityUtilization"
  | SageMakerInferenceComponentInvocationsPerCopy ->
      `String "SageMakerInferenceComponentInvocationsPerCopy"
  | ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage ->
      `String "ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage"
  | SageMakerVariantProvisionedConcurrencyUtilization ->
      `String "SageMakerVariantProvisionedConcurrencyUtilization"
  | NeptuneReaderAverageCPUUtilization -> `String "NeptuneReaderAverageCPUUtilization"
  | ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage ->
      `String "ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage"
  | ElastiCacheReplicaEngineCPUUtilization -> `String "ElastiCacheReplicaEngineCPUUtilization"
  | ElastiCachePrimaryEngineCPUUtilization -> `String "ElastiCachePrimaryEngineCPUUtilization"
  | ElastiCacheDatabaseMemoryUsagePercentage -> `String "ElastiCacheDatabaseMemoryUsagePercentage"
  | ElastiCacheEngineCPUUtilization -> `String "ElastiCacheEngineCPUUtilization"
  | KafkaBrokerStorageUtilization -> `String "KafkaBrokerStorageUtilization"
  | CassandraWriteCapacityUtilization -> `String "CassandraWriteCapacityUtilization"
  | CassandraReadCapacityUtilization -> `String "CassandraReadCapacityUtilization"
  | LambdaProvisionedConcurrencyUtilization -> `String "LambdaProvisionedConcurrencyUtilization"
  | ComprehendInferenceUtilization -> `String "ComprehendInferenceUtilization"
  | AppStreamAverageCapacityUtilization -> `String "AppStreamAverageCapacityUtilization"
  | ECSServiceAverageMemoryUtilization -> `String "ECSServiceAverageMemoryUtilization"
  | ECSServiceAverageCPUUtilization -> `String "ECSServiceAverageCPUUtilization"
  | SageMakerVariantInvocationsPerInstance -> `String "SageMakerVariantInvocationsPerInstance"
  | EC2SpotFleetRequestAverageNetworkOut -> `String "EC2SpotFleetRequestAverageNetworkOut"
  | EC2SpotFleetRequestAverageNetworkIn -> `String "EC2SpotFleetRequestAverageNetworkIn"
  | EC2SpotFleetRequestAverageCPUUtilization -> `String "EC2SpotFleetRequestAverageCPUUtilization"
  | RDSReaderAverageDatabaseConnections -> `String "RDSReaderAverageDatabaseConnections"
  | RDSReaderAverageCPUUtilization -> `String "RDSReaderAverageCPUUtilization"
  | ALBRequestCountPerTarget -> `String "ALBRequestCountPerTarget"
  | DynamoDBWriteCapacityUtilization -> `String "DynamoDBWriteCapacityUtilization"
  | DynamoDBReadCapacityUtilization -> `String "DynamoDBReadCapacityUtilization"

let resource_label_to_yojson = string_to_yojson

let predefined_metric_specification_to_yojson (x : predefined_metric_specification) =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ("PredefinedMetricType", Some (metric_type_to_yojson x.predefined_metric_type));
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
let expression_to_yojson = string_to_yojson
let id_to_yojson = string_to_yojson
let target_tracking_metric_dimension_name_to_yojson = string_to_yojson
let target_tracking_metric_dimension_value_to_yojson = string_to_yojson

let target_tracking_metric_dimension_to_yojson (x : target_tracking_metric_dimension) =
  assoc_to_yojson
    [
      ("Value", Some (target_tracking_metric_dimension_value_to_yojson x.value));
      ("Name", Some (target_tracking_metric_dimension_name_to_yojson x.name));
    ]

let target_tracking_metric_dimensions_to_yojson tree =
  list_to_yojson target_tracking_metric_dimension_to_yojson tree

let target_tracking_metric_name_to_yojson = string_to_yojson
let target_tracking_metric_namespace_to_yojson = string_to_yojson

let target_tracking_metric_to_yojson (x : target_tracking_metric) =
  assoc_to_yojson
    [
      ("Namespace", option_to_yojson target_tracking_metric_namespace_to_yojson x.namespace);
      ("MetricName", option_to_yojson target_tracking_metric_name_to_yojson x.metric_name);
      ("Dimensions", option_to_yojson target_tracking_metric_dimensions_to_yojson x.dimensions);
    ]

let target_tracking_metric_unit_to_yojson = string_to_yojson

let target_tracking_metric_stat_to_yojson (x : target_tracking_metric_stat) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson target_tracking_metric_unit_to_yojson x.unit_);
      ("Stat", Some (xml_string_to_yojson x.stat));
      ("Metric", Some (target_tracking_metric_to_yojson x.metric));
    ]

let return_data_to_yojson = bool_to_yojson

let target_tracking_metric_data_query_to_yojson (x : target_tracking_metric_data_query) =
  assoc_to_yojson
    [
      ("ReturnData", option_to_yojson return_data_to_yojson x.return_data);
      ("MetricStat", option_to_yojson target_tracking_metric_stat_to_yojson x.metric_stat);
      ("Label", option_to_yojson xml_string_to_yojson x.label);
      ("Id", Some (id_to_yojson x.id));
      ("Expression", option_to_yojson expression_to_yojson x.expression);
    ]

let target_tracking_metric_data_queries_to_yojson tree =
  list_to_yojson target_tracking_metric_data_query_to_yojson tree

let customized_metric_specification_to_yojson (x : customized_metric_specification) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson target_tracking_metric_data_queries_to_yojson x.metrics);
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("Statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Namespace", option_to_yojson metric_namespace_to_yojson x.namespace);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let cooldown_to_yojson = int_to_yojson
let disable_scale_in_to_yojson = bool_to_yojson

let target_tracking_scaling_policy_configuration_to_yojson
    (x : target_tracking_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("DisableScaleIn", option_to_yojson disable_scale_in_to_yojson x.disable_scale_in);
      ("ScaleInCooldown", option_to_yojson cooldown_to_yojson x.scale_in_cooldown);
      ("ScaleOutCooldown", option_to_yojson cooldown_to_yojson x.scale_out_cooldown);
      ( "CustomizedMetricSpecification",
        option_to_yojson customized_metric_specification_to_yojson x.customized_metric_specification
      );
      ( "PredefinedMetricSpecification",
        option_to_yojson predefined_metric_specification_to_yojson x.predefined_metric_specification
      );
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_map_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let scaling_suspended_to_yojson = bool_to_yojson

let suspended_state_to_yojson (x : suspended_state) =
  assoc_to_yojson
    [
      ( "ScheduledScalingSuspended",
        option_to_yojson scaling_suspended_to_yojson x.scheduled_scaling_suspended );
      ( "DynamicScalingOutSuspended",
        option_to_yojson scaling_suspended_to_yojson x.dynamic_scaling_out_suspended );
      ( "DynamicScalingInSuspended",
        option_to_yojson scaling_suspended_to_yojson x.dynamic_scaling_in_suspended );
    ]

let adjustment_type_to_yojson (x : adjustment_type) =
  match x with
  | ExactCapacity -> `String "ExactCapacity"
  | PercentChangeInCapacity -> `String "PercentChangeInCapacity"
  | ChangeInCapacity -> `String "ChangeInCapacity"

let scaling_adjustment_to_yojson = int_to_yojson

let step_adjustment_to_yojson (x : step_adjustment) =
  assoc_to_yojson
    [
      ("ScalingAdjustment", Some (scaling_adjustment_to_yojson x.scaling_adjustment));
      ( "MetricIntervalUpperBound",
        option_to_yojson metric_scale_to_yojson x.metric_interval_upper_bound );
      ( "MetricIntervalLowerBound",
        option_to_yojson metric_scale_to_yojson x.metric_interval_lower_bound );
    ]

let step_adjustments_to_yojson tree = list_to_yojson step_adjustment_to_yojson tree
let min_adjustment_magnitude_to_yojson = int_to_yojson

let metric_aggregation_type_to_yojson (x : metric_aggregation_type) =
  match x with
  | Maximum -> `String "Maximum"
  | Minimum -> `String "Minimum"
  | Average -> `String "Average"

let step_scaling_policy_configuration_to_yojson (x : step_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ( "MetricAggregationType",
        option_to_yojson metric_aggregation_type_to_yojson x.metric_aggregation_type );
      ("Cooldown", option_to_yojson cooldown_to_yojson x.cooldown);
      ( "MinAdjustmentMagnitude",
        option_to_yojson min_adjustment_magnitude_to_yojson x.min_adjustment_magnitude );
      ("StepAdjustments", option_to_yojson step_adjustments_to_yojson x.step_adjustments);
      ("AdjustmentType", option_to_yojson adjustment_type_to_yojson x.adjustment_type);
    ]

let service_namespace_to_yojson (x : service_namespace) =
  match x with
  | WORKSPACES -> `String "workspaces"
  | NEPTUNE -> `String "neptune"
  | ELASTICACHE -> `String "elasticache"
  | KAFKA -> `String "kafka"
  | CASSANDRA -> `String "cassandra"
  | LAMBDA -> `String "lambda"
  | COMPREHEND -> `String "comprehend"
  | CUSTOM_RESOURCE -> `String "custom-resource"
  | SAGEMAKER -> `String "sagemaker"
  | RDS -> `String "rds"
  | DYNAMODB -> `String "dynamodb"
  | APPSTREAM -> `String "appstream"
  | EC2 -> `String "ec2"
  | EMR -> `String "elasticmapreduce"
  | ECS -> `String "ecs"

let scheduled_action_name_to_yojson = string_to_yojson
let resource_id_max_len1600_to_yojson = string_to_yojson

let scalable_dimension_to_yojson (x : scalable_dimension) =
  match x with
  | WorkSpacesWorkSpacesPoolDesiredUserSessions ->
      `String "workspaces:workspacespool:DesiredUserSessions"
  | SageMakerInferenceComponentDesiredCopyCount ->
      `String "sagemaker:inference-component:DesiredCopyCount"
  | SageMakerVariantDesiredProvisionedConcurrency ->
      `String "sagemaker:variant:DesiredProvisionedConcurrency"
  | NeptuneClusterReadReplicaCount -> `String "neptune:cluster:ReadReplicaCount"
  | ElastiCacheReplicationGroupReplicas -> `String "elasticache:replication-group:Replicas"
  | ElastiCacheReplicationGroupNodeGroups -> `String "elasticache:replication-group:NodeGroups"
  | ElastiCacheCacheClusterNodes -> `String "elasticache:cache-cluster:Nodes"
  | KafkaBrokerStorageVolumeSize -> `String "kafka:broker-storage:VolumeSize"
  | CassandraTableWriteCapacityUnits -> `String "cassandra:table:WriteCapacityUnits"
  | CassandraTableReadCapacityUnits -> `String "cassandra:table:ReadCapacityUnits"
  | LambdaFunctionProvisionedConcurrency -> `String "lambda:function:ProvisionedConcurrency"
  | ComprehendEntityRecognizerEndpointInferenceUnits ->
      `String "comprehend:entity-recognizer-endpoint:DesiredInferenceUnits"
  | ComprehendDocClassifierEndpointInferenceUnits ->
      `String "comprehend:document-classifier-endpoint:DesiredInferenceUnits"
  | CustomResourceScalableDimension -> `String "custom-resource:ResourceType:Property"
  | SageMakerVariantDesiredInstanceCount -> `String "sagemaker:variant:DesiredInstanceCount"
  | RDSClusterReadReplicaCount -> `String "rds:cluster:ReadReplicaCount"
  | DynamoDBIndexWriteCapacityUnits -> `String "dynamodb:index:WriteCapacityUnits"
  | DynamoDBIndexReadCapacityUnits -> `String "dynamodb:index:ReadCapacityUnits"
  | DynamoDBTableWriteCapacityUnits -> `String "dynamodb:table:WriteCapacityUnits"
  | DynamoDBTableReadCapacityUnits -> `String "dynamodb:table:ReadCapacityUnits"
  | AppstreamFleetDesiredCapacity -> `String "appstream:fleet:DesiredCapacity"
  | EMRInstanceGroupInstanceCount -> `String "elasticmapreduce:instancegroup:InstanceCount"
  | EC2SpotFleetRequestTargetCapacity -> `String "ec2:spot-fleet-request:TargetCapacity"
  | ECSServiceDesiredCount -> `String "ecs:service:DesiredCount"

let resource_capacity_to_yojson = int_to_yojson

let scalable_target_action_to_yojson (x : scalable_target_action) =
  assoc_to_yojson
    [
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
    ]

let scheduled_action_to_yojson (x : scheduled_action) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
      ( "ScalableTargetAction",
        option_to_yojson scalable_target_action_to_yojson x.scalable_target_action );
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_type_to_yojson x.start_time);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("Timezone", option_to_yojson resource_id_max_len1600_to_yojson x.timezone);
      ("Schedule", Some (resource_id_max_len1600_to_yojson x.schedule));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ScheduledActionARN", Some (resource_id_max_len1600_to_yojson x.scheduled_action_ar_n));
      ("ScheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
    ]

let scheduled_actions_to_yojson tree = list_to_yojson scheduled_action_to_yojson tree
let policy_name_to_yojson = string_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with
  | PredictiveScaling -> `String "PredictiveScaling"
  | TargetTrackingScaling -> `String "TargetTrackingScaling"
  | StepScaling -> `String "StepScaling"

let predictive_scaling_metric_type_to_yojson = string_to_yojson

let predictive_scaling_predefined_metric_pair_specification_to_yojson
    (x : predictive_scaling_predefined_metric_pair_specification) =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
    ]

let predictive_scaling_predefined_scaling_metric_specification_to_yojson
    (x : predictive_scaling_predefined_scaling_metric_specification) =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
    ]

let predictive_scaling_predefined_load_metric_specification_to_yojson
    (x : predictive_scaling_predefined_load_metric_specification) =
  assoc_to_yojson
    [
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
    ]

let predictive_scaling_metric_dimension_name_to_yojson = string_to_yojson
let predictive_scaling_metric_dimension_value_to_yojson = string_to_yojson

let predictive_scaling_metric_dimension_to_yojson (x : predictive_scaling_metric_dimension) =
  assoc_to_yojson
    [
      ("Value", Some (predictive_scaling_metric_dimension_value_to_yojson x.value));
      ("Name", Some (predictive_scaling_metric_dimension_name_to_yojson x.name));
    ]

let predictive_scaling_metric_dimensions_to_yojson tree =
  list_to_yojson predictive_scaling_metric_dimension_to_yojson tree

let predictive_scaling_metric_name_to_yojson = string_to_yojson
let predictive_scaling_metric_namespace_to_yojson = string_to_yojson

let predictive_scaling_metric_to_yojson (x : predictive_scaling_metric) =
  assoc_to_yojson
    [
      ("Namespace", option_to_yojson predictive_scaling_metric_namespace_to_yojson x.namespace);
      ("MetricName", option_to_yojson predictive_scaling_metric_name_to_yojson x.metric_name);
      ("Dimensions", option_to_yojson predictive_scaling_metric_dimensions_to_yojson x.dimensions);
    ]

let predictive_scaling_metric_unit_to_yojson = string_to_yojson

let predictive_scaling_metric_stat_to_yojson (x : predictive_scaling_metric_stat) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson predictive_scaling_metric_unit_to_yojson x.unit_);
      ("Stat", Some (xml_string_to_yojson x.stat));
      ("Metric", Some (predictive_scaling_metric_to_yojson x.metric));
    ]

let predictive_scaling_metric_data_query_to_yojson (x : predictive_scaling_metric_data_query) =
  assoc_to_yojson
    [
      ("ReturnData", option_to_yojson return_data_to_yojson x.return_data);
      ("Label", option_to_yojson xml_string_to_yojson x.label);
      ("MetricStat", option_to_yojson predictive_scaling_metric_stat_to_yojson x.metric_stat);
      ("Expression", option_to_yojson expression_to_yojson x.expression);
      ("Id", Some (id_to_yojson x.id));
    ]

let predictive_scaling_metric_data_queries_to_yojson tree =
  list_to_yojson predictive_scaling_metric_data_query_to_yojson tree

let predictive_scaling_customized_metric_specification_to_yojson
    (x : predictive_scaling_customized_metric_specification) =
  assoc_to_yojson
    [
      ( "MetricDataQueries",
        Some (predictive_scaling_metric_data_queries_to_yojson x.metric_data_queries) );
    ]

let predictive_scaling_metric_specification_to_yojson (x : predictive_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ( "CustomizedCapacityMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_capacity_metric_specification );
      ( "CustomizedLoadMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_load_metric_specification );
      ( "CustomizedScalingMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_scaling_metric_specification );
      ( "PredefinedLoadMetricSpecification",
        option_to_yojson predictive_scaling_predefined_load_metric_specification_to_yojson
          x.predefined_load_metric_specification );
      ( "PredefinedScalingMetricSpecification",
        option_to_yojson predictive_scaling_predefined_scaling_metric_specification_to_yojson
          x.predefined_scaling_metric_specification );
      ( "PredefinedMetricPairSpecification",
        option_to_yojson predictive_scaling_predefined_metric_pair_specification_to_yojson
          x.predefined_metric_pair_specification );
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
    ]

let predictive_scaling_metric_specifications_to_yojson tree =
  list_to_yojson predictive_scaling_metric_specification_to_yojson tree

let predictive_scaling_mode_to_yojson (x : predictive_scaling_mode) =
  match x with
  | ForecastAndScale -> `String "ForecastAndScale"
  | ForecastOnly -> `String "ForecastOnly"

let predictive_scaling_scheduling_buffer_time_to_yojson = int_to_yojson

let predictive_scaling_max_capacity_breach_behavior_to_yojson
    (x : predictive_scaling_max_capacity_breach_behavior) =
  match x with
  | IncreaseMaxCapacity -> `String "IncreaseMaxCapacity"
  | HonorMaxCapacity -> `String "HonorMaxCapacity"

let predictive_scaling_max_capacity_buffer_to_yojson = int_to_yojson

let predictive_scaling_policy_configuration_to_yojson (x : predictive_scaling_policy_configuration)
    =
  assoc_to_yojson
    [
      ( "MaxCapacityBuffer",
        option_to_yojson predictive_scaling_max_capacity_buffer_to_yojson x.max_capacity_buffer );
      ( "MaxCapacityBreachBehavior",
        option_to_yojson predictive_scaling_max_capacity_breach_behavior_to_yojson
          x.max_capacity_breach_behavior );
      ( "SchedulingBufferTime",
        option_to_yojson predictive_scaling_scheduling_buffer_time_to_yojson
          x.scheduling_buffer_time );
      ("Mode", option_to_yojson predictive_scaling_mode_to_yojson x.mode);
      ( "MetricSpecifications",
        Some (predictive_scaling_metric_specifications_to_yojson x.metric_specifications) );
    ]

let resource_id_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson
    [
      ("AlarmARN", Some (resource_id_to_yojson x.alarm_ar_n));
      ("AlarmName", Some (resource_id_to_yojson x.alarm_name));
    ]

let alarms_to_yojson tree = list_to_yojson alarm_to_yojson tree

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
      ("Alarms", option_to_yojson alarms_to_yojson x.alarms);
      ( "PredictiveScalingPolicyConfiguration",
        option_to_yojson predictive_scaling_policy_configuration_to_yojson
          x.predictive_scaling_policy_configuration );
      ( "TargetTrackingScalingPolicyConfiguration",
        option_to_yojson target_tracking_scaling_policy_configuration_to_yojson
          x.target_tracking_scaling_policy_configuration );
      ( "StepScalingPolicyConfiguration",
        option_to_yojson step_scaling_policy_configuration_to_yojson
          x.step_scaling_policy_configuration );
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("PolicyARN", Some (resource_id_max_len1600_to_yojson x.policy_ar_n));
    ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let scaling_activity_status_code_to_yojson (x : scaling_activity_status_code) =
  match x with
  | Failed -> `String "Failed"
  | Unfulfilled -> `String "Unfulfilled"
  | Overridden -> `String "Overridden"
  | Successful -> `String "Successful"
  | InProgress -> `String "InProgress"
  | Pending -> `String "Pending"

let not_scaled_reason_to_yojson (x : not_scaled_reason) =
  assoc_to_yojson
    [
      ("CurrentCapacity", option_to_yojson resource_capacity_to_yojson x.current_capacity);
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
      ("Code", Some (xml_string_to_yojson x.code));
    ]

let not_scaled_reasons_to_yojson tree = list_to_yojson not_scaled_reason_to_yojson tree

let scaling_activity_to_yojson (x : scaling_activity) =
  assoc_to_yojson
    [
      ("NotScaledReasons", option_to_yojson not_scaled_reasons_to_yojson x.not_scaled_reasons);
      ("Details", option_to_yojson xml_string_to_yojson x.details);
      ("StatusMessage", option_to_yojson xml_string_to_yojson x.status_message);
      ("StatusCode", Some (scaling_activity_status_code_to_yojson x.status_code));
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("Cause", Some (xml_string_to_yojson x.cause));
      ("Description", Some (xml_string_to_yojson x.description));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ActivityId", Some (resource_id_to_yojson x.activity_id));
    ]

let scaling_activities_to_yojson tree = list_to_yojson scaling_activity_to_yojson tree

let scalable_target_to_yojson (x : scalable_target) =
  assoc_to_yojson
    [
      ("ScalableTargetARN", option_to_yojson xml_string_to_yojson x.scalable_target_ar_n);
      ("SuspendedState", option_to_yojson suspended_state_to_yojson x.suspended_state);
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
      ("RoleARN", Some (resource_id_max_len1600_to_yojson x.role_ar_n));
      ("PredictedCapacity", option_to_yojson resource_capacity_to_yojson x.predicted_capacity);
      ("MaxCapacity", Some (resource_capacity_to_yojson x.max_capacity));
      ("MinCapacity", Some (resource_capacity_to_yojson x.min_capacity));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let scalable_targets_to_yojson tree = list_to_yojson scalable_target_to_yojson tree
let resource_ids_max_len1600_to_yojson tree = list_to_yojson resource_id_max_len1600_to_yojson tree

let register_scalable_target_response_to_yojson (x : register_scalable_target_response) =
  assoc_to_yojson
    [ ("ScalableTargetARN", option_to_yojson xml_string_to_yojson x.scalable_target_ar_n) ]

let register_scalable_target_request_to_yojson (x : register_scalable_target_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("SuspendedState", option_to_yojson suspended_state_to_yojson x.suspended_state);
      ("RoleARN", option_to_yojson resource_id_max_len1600_to_yojson x.role_ar_n);
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_update_exception_to_yojson (x : concurrent_update_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_scheduled_action_response_to_yojson = unit_to_yojson

let put_scheduled_action_request_to_yojson (x : put_scheduled_action_request) =
  assoc_to_yojson
    [
      ( "ScalableTargetAction",
        option_to_yojson scalable_target_action_to_yojson x.scalable_target_action );
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_type_to_yojson x.start_time);
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
      ("Timezone", option_to_yojson resource_id_max_len1600_to_yojson x.timezone);
      ("Schedule", option_to_yojson resource_id_max_len1600_to_yojson x.schedule);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let object_not_found_exception_to_yojson (x : object_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_scaling_policy_response_to_yojson (x : put_scaling_policy_response) =
  assoc_to_yojson
    [
      ("Alarms", option_to_yojson alarms_to_yojson x.alarms);
      ("PolicyARN", Some (resource_id_max_len1600_to_yojson x.policy_ar_n));
    ]

let put_scaling_policy_request_to_yojson (x : put_scaling_policy_request) =
  assoc_to_yojson
    [
      ( "PredictiveScalingPolicyConfiguration",
        option_to_yojson predictive_scaling_policy_configuration_to_yojson
          x.predictive_scaling_policy_configuration );
      ( "TargetTrackingScalingPolicyConfiguration",
        option_to_yojson target_tracking_scaling_policy_configuration_to_yojson
          x.target_tracking_scaling_policy_configuration );
      ( "StepScalingPolicyConfiguration",
        option_to_yojson step_scaling_policy_configuration_to_yojson
          x.step_scaling_policy_configuration );
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
    ]

let failed_resource_access_exception_to_yojson (x : failed_resource_access_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let predictive_scaling_forecast_values_to_yojson tree = list_to_yojson metric_scale_to_yojson tree

let predictive_scaling_forecast_timestamps_to_yojson tree =
  list_to_yojson timestamp_type_to_yojson tree

let max_results_to_yojson = int_to_yojson

let load_forecast_to_yojson (x : load_forecast) =
  assoc_to_yojson
    [
      ( "MetricSpecification",
        Some (predictive_scaling_metric_specification_to_yojson x.metric_specification) );
      ("Values", Some (predictive_scaling_forecast_values_to_yojson x.values));
      ("Timestamps", Some (predictive_scaling_forecast_timestamps_to_yojson x.timestamps));
    ]

let load_forecasts_to_yojson tree = list_to_yojson load_forecast_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let include_not_scaled_activities_to_yojson = bool_to_yojson

let capacity_forecast_to_yojson (x : capacity_forecast) =
  assoc_to_yojson
    [
      ("Values", Some (predictive_scaling_forecast_values_to_yojson x.values));
      ("Timestamps", Some (predictive_scaling_forecast_timestamps_to_yojson x.timestamps));
    ]

let get_predictive_scaling_forecast_response_to_yojson
    (x : get_predictive_scaling_forecast_response) =
  assoc_to_yojson
    [
      ("UpdateTime", option_to_yojson timestamp_type_to_yojson x.update_time);
      ("CapacityForecast", option_to_yojson capacity_forecast_to_yojson x.capacity_forecast);
      ("LoadForecast", option_to_yojson load_forecasts_to_yojson x.load_forecast);
    ]

let get_predictive_scaling_forecast_request_to_yojson (x : get_predictive_scaling_forecast_request)
    =
  assoc_to_yojson
    [
      ("EndTime", Some (timestamp_type_to_yojson x.end_time));
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let describe_scheduled_actions_response_to_yojson (x : describe_scheduled_actions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("ScheduledActions", option_to_yojson scheduled_actions_to_yojson x.scheduled_actions);
    ]

let describe_scheduled_actions_request_to_yojson (x : describe_scheduled_actions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ( "ScheduledActionNames",
        option_to_yojson resource_ids_max_len1600_to_yojson x.scheduled_action_names );
    ]

let describe_scaling_policies_response_to_yojson (x : describe_scaling_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
    ]

let describe_scaling_policies_request_to_yojson (x : describe_scaling_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("PolicyNames", option_to_yojson resource_ids_max_len1600_to_yojson x.policy_names);
    ]

let describe_scaling_activities_response_to_yojson (x : describe_scaling_activities_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("ScalingActivities", option_to_yojson scaling_activities_to_yojson x.scaling_activities);
    ]

let describe_scaling_activities_request_to_yojson (x : describe_scaling_activities_request) =
  assoc_to_yojson
    [
      ( "IncludeNotScaledActivities",
        option_to_yojson include_not_scaled_activities_to_yojson x.include_not_scaled_activities );
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let describe_scalable_targets_response_to_yojson (x : describe_scalable_targets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("ScalableTargets", option_to_yojson scalable_targets_to_yojson x.scalable_targets);
    ]

let describe_scalable_targets_request_to_yojson (x : describe_scalable_targets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("ResourceIds", option_to_yojson resource_ids_max_len1600_to_yojson x.resource_ids);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let deregister_scalable_target_response_to_yojson = unit_to_yojson

let deregister_scalable_target_request_to_yojson (x : deregister_scalable_target_request) =
  assoc_to_yojson
    [
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let delete_scheduled_action_response_to_yojson = unit_to_yojson

let delete_scheduled_action_request_to_yojson (x : delete_scheduled_action_request) =
  assoc_to_yojson
    [
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScheduledActionName", Some (resource_id_max_len1600_to_yojson x.scheduled_action_name));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
    ]

let delete_scaling_policy_response_to_yojson = unit_to_yojson

let delete_scaling_policy_request_to_yojson (x : delete_scaling_policy_request) =
  assoc_to_yojson
    [
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("PolicyName", Some (resource_id_max_len1600_to_yojson x.policy_name));
    ]
