open Smaws_Lib.Json.SerializeHelpers
open Types

let adjustment_type_to_yojson (x : adjustment_type) =
  match x with
  | ChangeInCapacity -> `String "ChangeInCapacity"
  | PercentChangeInCapacity -> `String "PercentChangeInCapacity"
  | ExactCapacity -> `String "ExactCapacity"

let resource_id_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson
    [
      ("AlarmName", Some (resource_id_to_yojson x.alarm_name));
      ("AlarmARN", Some (resource_id_to_yojson x.alarm_ar_n));
    ]

let alarms_to_yojson tree = list_to_yojson alarm_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let exception_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_map_to_yojson x.tags));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_update_exception_to_yojson (x : concurrent_update_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let xml_string_to_yojson = string_to_yojson

let register_scalable_target_response_to_yojson (x : register_scalable_target_response) =
  assoc_to_yojson
    [ ("ScalableTargetARN", option_to_yojson xml_string_to_yojson x.scalable_target_ar_n) ]

let scaling_suspended_to_yojson = bool_to_yojson

let suspended_state_to_yojson (x : suspended_state) =
  assoc_to_yojson
    [
      ( "DynamicScalingInSuspended",
        option_to_yojson scaling_suspended_to_yojson x.dynamic_scaling_in_suspended );
      ( "DynamicScalingOutSuspended",
        option_to_yojson scaling_suspended_to_yojson x.dynamic_scaling_out_suspended );
      ( "ScheduledScalingSuspended",
        option_to_yojson scaling_suspended_to_yojson x.scheduled_scaling_suspended );
    ]

let resource_id_max_len1600_to_yojson = string_to_yojson
let resource_capacity_to_yojson = int_to_yojson

let scalable_dimension_to_yojson (x : scalable_dimension) =
  match x with
  | ECSServiceDesiredCount -> `String "ecs:service:DesiredCount"
  | EC2SpotFleetRequestTargetCapacity -> `String "ec2:spot-fleet-request:TargetCapacity"
  | EMRInstanceGroupInstanceCount -> `String "elasticmapreduce:instancegroup:InstanceCount"
  | AppstreamFleetDesiredCapacity -> `String "appstream:fleet:DesiredCapacity"
  | DynamoDBTableReadCapacityUnits -> `String "dynamodb:table:ReadCapacityUnits"
  | DynamoDBTableWriteCapacityUnits -> `String "dynamodb:table:WriteCapacityUnits"
  | DynamoDBIndexReadCapacityUnits -> `String "dynamodb:index:ReadCapacityUnits"
  | DynamoDBIndexWriteCapacityUnits -> `String "dynamodb:index:WriteCapacityUnits"
  | RDSClusterReadReplicaCount -> `String "rds:cluster:ReadReplicaCount"
  | SageMakerVariantDesiredInstanceCount -> `String "sagemaker:variant:DesiredInstanceCount"
  | CustomResourceScalableDimension -> `String "custom-resource:ResourceType:Property"
  | ComprehendDocClassifierEndpointInferenceUnits ->
      `String "comprehend:document-classifier-endpoint:DesiredInferenceUnits"
  | ComprehendEntityRecognizerEndpointInferenceUnits ->
      `String "comprehend:entity-recognizer-endpoint:DesiredInferenceUnits"
  | LambdaFunctionProvisionedConcurrency -> `String "lambda:function:ProvisionedConcurrency"
  | CassandraTableReadCapacityUnits -> `String "cassandra:table:ReadCapacityUnits"
  | CassandraTableWriteCapacityUnits -> `String "cassandra:table:WriteCapacityUnits"
  | KafkaBrokerStorageVolumeSize -> `String "kafka:broker-storage:VolumeSize"
  | ElastiCacheCacheClusterNodes -> `String "elasticache:cache-cluster:Nodes"
  | ElastiCacheReplicationGroupNodeGroups -> `String "elasticache:replication-group:NodeGroups"
  | ElastiCacheReplicationGroupReplicas -> `String "elasticache:replication-group:Replicas"
  | NeptuneClusterReadReplicaCount -> `String "neptune:cluster:ReadReplicaCount"
  | SageMakerVariantDesiredProvisionedConcurrency ->
      `String "sagemaker:variant:DesiredProvisionedConcurrency"
  | SageMakerInferenceComponentDesiredCopyCount ->
      `String "sagemaker:inference-component:DesiredCopyCount"
  | WorkSpacesWorkSpacesPoolDesiredUserSessions ->
      `String "workspaces:workspacespool:DesiredUserSessions"

let service_namespace_to_yojson (x : service_namespace) =
  match x with
  | ECS -> `String "ecs"
  | EMR -> `String "elasticmapreduce"
  | EC2 -> `String "ec2"
  | APPSTREAM -> `String "appstream"
  | DYNAMODB -> `String "dynamodb"
  | RDS -> `String "rds"
  | SAGEMAKER -> `String "sagemaker"
  | CUSTOM_RESOURCE -> `String "custom-resource"
  | COMPREHEND -> `String "comprehend"
  | LAMBDA -> `String "lambda"
  | CASSANDRA -> `String "cassandra"
  | KAFKA -> `String "kafka"
  | ELASTICACHE -> `String "elasticache"
  | NEPTUNE -> `String "neptune"
  | WORKSPACES -> `String "workspaces"

let register_scalable_target_request_to_yojson (x : register_scalable_target_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
      ("RoleARN", option_to_yojson resource_id_max_len1600_to_yojson x.role_ar_n);
      ("SuspendedState", option_to_yojson suspended_state_to_yojson x.suspended_state);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let object_not_found_exception_to_yojson (x : object_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_scheduled_action_response_to_yojson = unit_to_yojson

let scalable_target_action_to_yojson (x : scalable_target_action) =
  assoc_to_yojson
    [
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
    ]

let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson
let scheduled_action_name_to_yojson = string_to_yojson

let put_scheduled_action_request_to_yojson (x : put_scheduled_action_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("Schedule", option_to_yojson resource_id_max_len1600_to_yojson x.schedule);
      ("Timezone", option_to_yojson resource_id_max_len1600_to_yojson x.timezone);
      ("ScheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("StartTime", option_to_yojson timestamp_type_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ( "ScalableTargetAction",
        option_to_yojson scalable_target_action_to_yojson x.scalable_target_action );
    ]

let failed_resource_access_exception_to_yojson (x : failed_resource_access_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_scaling_policy_response_to_yojson (x : put_scaling_policy_response) =
  assoc_to_yojson
    [
      ("PolicyARN", Some (resource_id_max_len1600_to_yojson x.policy_ar_n));
      ("Alarms", option_to_yojson alarms_to_yojson x.alarms);
    ]

let predictive_scaling_max_capacity_buffer_to_yojson = int_to_yojson

let predictive_scaling_max_capacity_breach_behavior_to_yojson
    (x : predictive_scaling_max_capacity_breach_behavior) =
  match x with
  | HonorMaxCapacity -> `String "HonorMaxCapacity"
  | IncreaseMaxCapacity -> `String "IncreaseMaxCapacity"

let predictive_scaling_scheduling_buffer_time_to_yojson = int_to_yojson

let predictive_scaling_mode_to_yojson (x : predictive_scaling_mode) =
  match x with
  | ForecastOnly -> `String "ForecastOnly"
  | ForecastAndScale -> `String "ForecastAndScale"

let return_data_to_yojson = bool_to_yojson
let predictive_scaling_metric_unit_to_yojson = string_to_yojson
let predictive_scaling_metric_namespace_to_yojson = string_to_yojson
let predictive_scaling_metric_name_to_yojson = string_to_yojson
let predictive_scaling_metric_dimension_value_to_yojson = string_to_yojson
let predictive_scaling_metric_dimension_name_to_yojson = string_to_yojson

let predictive_scaling_metric_dimension_to_yojson (x : predictive_scaling_metric_dimension) =
  assoc_to_yojson
    [
      ("Name", Some (predictive_scaling_metric_dimension_name_to_yojson x.name));
      ("Value", Some (predictive_scaling_metric_dimension_value_to_yojson x.value));
    ]

let predictive_scaling_metric_dimensions_to_yojson tree =
  list_to_yojson predictive_scaling_metric_dimension_to_yojson tree

let predictive_scaling_metric_to_yojson (x : predictive_scaling_metric) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson predictive_scaling_metric_dimensions_to_yojson x.dimensions);
      ("MetricName", option_to_yojson predictive_scaling_metric_name_to_yojson x.metric_name);
      ("Namespace", option_to_yojson predictive_scaling_metric_namespace_to_yojson x.namespace);
    ]

let predictive_scaling_metric_stat_to_yojson (x : predictive_scaling_metric_stat) =
  assoc_to_yojson
    [
      ("Metric", Some (predictive_scaling_metric_to_yojson x.metric));
      ("Stat", Some (xml_string_to_yojson x.stat));
      ("Unit", option_to_yojson predictive_scaling_metric_unit_to_yojson x.unit_);
    ]

let expression_to_yojson = string_to_yojson
let id_to_yojson = string_to_yojson

let predictive_scaling_metric_data_query_to_yojson (x : predictive_scaling_metric_data_query) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("Expression", option_to_yojson expression_to_yojson x.expression);
      ("MetricStat", option_to_yojson predictive_scaling_metric_stat_to_yojson x.metric_stat);
      ("Label", option_to_yojson xml_string_to_yojson x.label);
      ("ReturnData", option_to_yojson return_data_to_yojson x.return_data);
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

let resource_label_to_yojson = string_to_yojson
let predictive_scaling_metric_type_to_yojson = string_to_yojson

let predictive_scaling_predefined_load_metric_specification_to_yojson
    (x : predictive_scaling_predefined_load_metric_specification) =
  assoc_to_yojson
    [
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let predictive_scaling_predefined_scaling_metric_specification_to_yojson
    (x : predictive_scaling_predefined_scaling_metric_specification) =
  assoc_to_yojson
    [
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let predictive_scaling_predefined_metric_pair_specification_to_yojson
    (x : predictive_scaling_predefined_metric_pair_specification) =
  assoc_to_yojson
    [
      ( "PredefinedMetricType",
        Some (predictive_scaling_metric_type_to_yojson x.predefined_metric_type) );
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let metric_scale_to_yojson = double_to_yojson

let predictive_scaling_metric_specification_to_yojson (x : predictive_scaling_metric_specification)
    =
  assoc_to_yojson
    [
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
      ( "PredefinedMetricPairSpecification",
        option_to_yojson predictive_scaling_predefined_metric_pair_specification_to_yojson
          x.predefined_metric_pair_specification );
      ( "PredefinedScalingMetricSpecification",
        option_to_yojson predictive_scaling_predefined_scaling_metric_specification_to_yojson
          x.predefined_scaling_metric_specification );
      ( "PredefinedLoadMetricSpecification",
        option_to_yojson predictive_scaling_predefined_load_metric_specification_to_yojson
          x.predefined_load_metric_specification );
      ( "CustomizedScalingMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_scaling_metric_specification );
      ( "CustomizedLoadMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_load_metric_specification );
      ( "CustomizedCapacityMetricSpecification",
        option_to_yojson predictive_scaling_customized_metric_specification_to_yojson
          x.customized_capacity_metric_specification );
    ]

let predictive_scaling_metric_specifications_to_yojson tree =
  list_to_yojson predictive_scaling_metric_specification_to_yojson tree

let predictive_scaling_policy_configuration_to_yojson (x : predictive_scaling_policy_configuration)
    =
  assoc_to_yojson
    [
      ( "MetricSpecifications",
        Some (predictive_scaling_metric_specifications_to_yojson x.metric_specifications) );
      ("Mode", option_to_yojson predictive_scaling_mode_to_yojson x.mode);
      ( "SchedulingBufferTime",
        option_to_yojson predictive_scaling_scheduling_buffer_time_to_yojson
          x.scheduling_buffer_time );
      ( "MaxCapacityBreachBehavior",
        option_to_yojson predictive_scaling_max_capacity_breach_behavior_to_yojson
          x.max_capacity_breach_behavior );
      ( "MaxCapacityBuffer",
        option_to_yojson predictive_scaling_max_capacity_buffer_to_yojson x.max_capacity_buffer );
    ]

let disable_scale_in_to_yojson = bool_to_yojson
let cooldown_to_yojson = int_to_yojson
let target_tracking_metric_unit_to_yojson = string_to_yojson
let target_tracking_metric_namespace_to_yojson = string_to_yojson
let target_tracking_metric_name_to_yojson = string_to_yojson
let target_tracking_metric_dimension_value_to_yojson = string_to_yojson
let target_tracking_metric_dimension_name_to_yojson = string_to_yojson

let target_tracking_metric_dimension_to_yojson (x : target_tracking_metric_dimension) =
  assoc_to_yojson
    [
      ("Name", Some (target_tracking_metric_dimension_name_to_yojson x.name));
      ("Value", Some (target_tracking_metric_dimension_value_to_yojson x.value));
    ]

let target_tracking_metric_dimensions_to_yojson tree =
  list_to_yojson target_tracking_metric_dimension_to_yojson tree

let target_tracking_metric_to_yojson (x : target_tracking_metric) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson target_tracking_metric_dimensions_to_yojson x.dimensions);
      ("MetricName", option_to_yojson target_tracking_metric_name_to_yojson x.metric_name);
      ("Namespace", option_to_yojson target_tracking_metric_namespace_to_yojson x.namespace);
    ]

let target_tracking_metric_stat_to_yojson (x : target_tracking_metric_stat) =
  assoc_to_yojson
    [
      ("Metric", Some (target_tracking_metric_to_yojson x.metric));
      ("Stat", Some (xml_string_to_yojson x.stat));
      ("Unit", option_to_yojson target_tracking_metric_unit_to_yojson x.unit_);
    ]

let target_tracking_metric_data_query_to_yojson (x : target_tracking_metric_data_query) =
  assoc_to_yojson
    [
      ("Expression", option_to_yojson expression_to_yojson x.expression);
      ("Id", Some (id_to_yojson x.id));
      ("Label", option_to_yojson xml_string_to_yojson x.label);
      ("MetricStat", option_to_yojson target_tracking_metric_stat_to_yojson x.metric_stat);
      ("ReturnData", option_to_yojson return_data_to_yojson x.return_data);
    ]

let target_tracking_metric_data_queries_to_yojson tree =
  list_to_yojson target_tracking_metric_data_query_to_yojson tree

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

let customized_metric_specification_to_yojson (x : customized_metric_specification) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("Namespace", option_to_yojson metric_namespace_to_yojson x.namespace);
      ("Dimensions", option_to_yojson metric_dimensions_to_yojson x.dimensions);
      ("Statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("Metrics", option_to_yojson target_tracking_metric_data_queries_to_yojson x.metrics);
    ]

let metric_type_to_yojson (x : metric_type) =
  match x with
  | DynamoDBReadCapacityUtilization -> `String "DynamoDBReadCapacityUtilization"
  | DynamoDBWriteCapacityUtilization -> `String "DynamoDBWriteCapacityUtilization"
  | ALBRequestCountPerTarget -> `String "ALBRequestCountPerTarget"
  | RDSReaderAverageCPUUtilization -> `String "RDSReaderAverageCPUUtilization"
  | RDSReaderAverageDatabaseConnections -> `String "RDSReaderAverageDatabaseConnections"
  | EC2SpotFleetRequestAverageCPUUtilization -> `String "EC2SpotFleetRequestAverageCPUUtilization"
  | EC2SpotFleetRequestAverageNetworkIn -> `String "EC2SpotFleetRequestAverageNetworkIn"
  | EC2SpotFleetRequestAverageNetworkOut -> `String "EC2SpotFleetRequestAverageNetworkOut"
  | SageMakerVariantInvocationsPerInstance -> `String "SageMakerVariantInvocationsPerInstance"
  | ECSServiceAverageCPUUtilization -> `String "ECSServiceAverageCPUUtilization"
  | ECSServiceAverageMemoryUtilization -> `String "ECSServiceAverageMemoryUtilization"
  | AppStreamAverageCapacityUtilization -> `String "AppStreamAverageCapacityUtilization"
  | ComprehendInferenceUtilization -> `String "ComprehendInferenceUtilization"
  | LambdaProvisionedConcurrencyUtilization -> `String "LambdaProvisionedConcurrencyUtilization"
  | CassandraReadCapacityUtilization -> `String "CassandraReadCapacityUtilization"
  | CassandraWriteCapacityUtilization -> `String "CassandraWriteCapacityUtilization"
  | KafkaBrokerStorageUtilization -> `String "KafkaBrokerStorageUtilization"
  | ElastiCacheEngineCPUUtilization -> `String "ElastiCacheEngineCPUUtilization"
  | ElastiCacheDatabaseMemoryUsagePercentage -> `String "ElastiCacheDatabaseMemoryUsagePercentage"
  | ElastiCachePrimaryEngineCPUUtilization -> `String "ElastiCachePrimaryEngineCPUUtilization"
  | ElastiCacheReplicaEngineCPUUtilization -> `String "ElastiCacheReplicaEngineCPUUtilization"
  | ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage ->
      `String "ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage"
  | NeptuneReaderAverageCPUUtilization -> `String "NeptuneReaderAverageCPUUtilization"
  | SageMakerVariantProvisionedConcurrencyUtilization ->
      `String "SageMakerVariantProvisionedConcurrencyUtilization"
  | ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage ->
      `String "ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage"
  | SageMakerInferenceComponentInvocationsPerCopy ->
      `String "SageMakerInferenceComponentInvocationsPerCopy"
  | WorkSpacesAverageUserSessionsCapacityUtilization ->
      `String "WorkSpacesAverageUserSessionsCapacityUtilization"
  | SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution ->
      `String "SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution"
  | SageMakerVariantConcurrentRequestsPerModelHighResolution ->
      `String "SageMakerVariantConcurrentRequestsPerModelHighResolution"
  | ECSServiceAverageCPUUtilizationHighResolution ->
      `String "ECSServiceAverageCPUUtilizationHighResolution"
  | ECSServiceAverageMemoryUtilizationHighResolution ->
      `String "ECSServiceAverageMemoryUtilizationHighResolution"

let predefined_metric_specification_to_yojson (x : predefined_metric_specification) =
  assoc_to_yojson
    [
      ("PredefinedMetricType", Some (metric_type_to_yojson x.predefined_metric_type));
      ("ResourceLabel", option_to_yojson resource_label_to_yojson x.resource_label);
    ]

let target_tracking_scaling_policy_configuration_to_yojson
    (x : target_tracking_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("TargetValue", Some (metric_scale_to_yojson x.target_value));
      ( "PredefinedMetricSpecification",
        option_to_yojson predefined_metric_specification_to_yojson x.predefined_metric_specification
      );
      ( "CustomizedMetricSpecification",
        option_to_yojson customized_metric_specification_to_yojson x.customized_metric_specification
      );
      ("ScaleOutCooldown", option_to_yojson cooldown_to_yojson x.scale_out_cooldown);
      ("ScaleInCooldown", option_to_yojson cooldown_to_yojson x.scale_in_cooldown);
      ("DisableScaleIn", option_to_yojson disable_scale_in_to_yojson x.disable_scale_in);
    ]

let metric_aggregation_type_to_yojson (x : metric_aggregation_type) =
  match x with
  | Average -> `String "Average"
  | Minimum -> `String "Minimum"
  | Maximum -> `String "Maximum"

let min_adjustment_magnitude_to_yojson = int_to_yojson
let scaling_adjustment_to_yojson = int_to_yojson

let step_adjustment_to_yojson (x : step_adjustment) =
  assoc_to_yojson
    [
      ( "MetricIntervalLowerBound",
        option_to_yojson metric_scale_to_yojson x.metric_interval_lower_bound );
      ( "MetricIntervalUpperBound",
        option_to_yojson metric_scale_to_yojson x.metric_interval_upper_bound );
      ("ScalingAdjustment", Some (scaling_adjustment_to_yojson x.scaling_adjustment));
    ]

let step_adjustments_to_yojson tree = list_to_yojson step_adjustment_to_yojson tree

let step_scaling_policy_configuration_to_yojson (x : step_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("AdjustmentType", option_to_yojson adjustment_type_to_yojson x.adjustment_type);
      ("StepAdjustments", option_to_yojson step_adjustments_to_yojson x.step_adjustments);
      ( "MinAdjustmentMagnitude",
        option_to_yojson min_adjustment_magnitude_to_yojson x.min_adjustment_magnitude );
      ("Cooldown", option_to_yojson cooldown_to_yojson x.cooldown);
      ( "MetricAggregationType",
        option_to_yojson metric_aggregation_type_to_yojson x.metric_aggregation_type );
    ]

let policy_type_to_yojson (x : policy_type) =
  match x with
  | StepScaling -> `String "StepScaling"
  | TargetTrackingScaling -> `String "TargetTrackingScaling"
  | PredictiveScaling -> `String "PredictiveScaling"

let policy_name_to_yojson = string_to_yojson

let put_scaling_policy_request_to_yojson (x : put_scaling_policy_request) =
  assoc_to_yojson
    [
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ( "StepScalingPolicyConfiguration",
        option_to_yojson step_scaling_policy_configuration_to_yojson
          x.step_scaling_policy_configuration );
      ( "TargetTrackingScalingPolicyConfiguration",
        option_to_yojson target_tracking_scaling_policy_configuration_to_yojson
          x.target_tracking_scaling_policy_configuration );
      ( "PredictiveScalingPolicyConfiguration",
        option_to_yojson predictive_scaling_policy_configuration_to_yojson
          x.predictive_scaling_policy_configuration );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let predictive_scaling_forecast_values_to_yojson tree = list_to_yojson metric_scale_to_yojson tree

let predictive_scaling_forecast_timestamps_to_yojson tree =
  list_to_yojson timestamp_type_to_yojson tree

let capacity_forecast_to_yojson (x : capacity_forecast) =
  assoc_to_yojson
    [
      ("Timestamps", Some (predictive_scaling_forecast_timestamps_to_yojson x.timestamps));
      ("Values", Some (predictive_scaling_forecast_values_to_yojson x.values));
    ]

let load_forecast_to_yojson (x : load_forecast) =
  assoc_to_yojson
    [
      ("Timestamps", Some (predictive_scaling_forecast_timestamps_to_yojson x.timestamps));
      ("Values", Some (predictive_scaling_forecast_values_to_yojson x.values));
      ( "MetricSpecification",
        Some (predictive_scaling_metric_specification_to_yojson x.metric_specification) );
    ]

let load_forecasts_to_yojson tree = list_to_yojson load_forecast_to_yojson tree

let get_predictive_scaling_forecast_response_to_yojson
    (x : get_predictive_scaling_forecast_response) =
  assoc_to_yojson
    [
      ("LoadForecast", option_to_yojson load_forecasts_to_yojson x.load_forecast);
      ("CapacityForecast", option_to_yojson capacity_forecast_to_yojson x.capacity_forecast);
      ("UpdateTime", option_to_yojson timestamp_type_to_yojson x.update_time);
    ]

let get_predictive_scaling_forecast_request_to_yojson (x : get_predictive_scaling_forecast_request)
    =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("EndTime", Some (timestamp_type_to_yojson x.end_time));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let scheduled_action_to_yojson (x : scheduled_action) =
  assoc_to_yojson
    [
      ("ScheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
      ("ScheduledActionARN", Some (resource_id_max_len1600_to_yojson x.scheduled_action_ar_n));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("Schedule", Some (resource_id_max_len1600_to_yojson x.schedule));
      ("Timezone", option_to_yojson resource_id_max_len1600_to_yojson x.timezone);
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("StartTime", option_to_yojson timestamp_type_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ( "ScalableTargetAction",
        option_to_yojson scalable_target_action_to_yojson x.scalable_target_action );
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
    ]

let scheduled_actions_to_yojson tree = list_to_yojson scheduled_action_to_yojson tree

let describe_scheduled_actions_response_to_yojson (x : describe_scheduled_actions_response) =
  assoc_to_yojson
    [
      ("ScheduledActions", option_to_yojson scheduled_actions_to_yojson x.scheduled_actions);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let resource_ids_max_len1600_to_yojson tree = list_to_yojson resource_id_max_len1600_to_yojson tree

let describe_scheduled_actions_request_to_yojson (x : describe_scheduled_actions_request) =
  assoc_to_yojson
    [
      ( "ScheduledActionNames",
        option_to_yojson resource_ids_max_len1600_to_yojson x.scheduled_action_names );
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ("PolicyARN", Some (resource_id_max_len1600_to_yojson x.policy_ar_n));
      ("PolicyName", Some (policy_name_to_yojson x.policy_name));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ( "StepScalingPolicyConfiguration",
        option_to_yojson step_scaling_policy_configuration_to_yojson
          x.step_scaling_policy_configuration );
      ( "TargetTrackingScalingPolicyConfiguration",
        option_to_yojson target_tracking_scaling_policy_configuration_to_yojson
          x.target_tracking_scaling_policy_configuration );
      ( "PredictiveScalingPolicyConfiguration",
        option_to_yojson predictive_scaling_policy_configuration_to_yojson
          x.predictive_scaling_policy_configuration );
      ("Alarms", option_to_yojson alarms_to_yojson x.alarms);
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
    ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let describe_scaling_policies_response_to_yojson (x : describe_scaling_policies_response) =
  assoc_to_yojson
    [
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let describe_scaling_policies_request_to_yojson (x : describe_scaling_policies_request) =
  assoc_to_yojson
    [
      ("PolicyNames", option_to_yojson resource_ids_max_len1600_to_yojson x.policy_names);
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let not_scaled_reason_to_yojson (x : not_scaled_reason) =
  assoc_to_yojson
    [
      ("Code", Some (xml_string_to_yojson x.code));
      ("MaxCapacity", option_to_yojson resource_capacity_to_yojson x.max_capacity);
      ("MinCapacity", option_to_yojson resource_capacity_to_yojson x.min_capacity);
      ("CurrentCapacity", option_to_yojson resource_capacity_to_yojson x.current_capacity);
    ]

let not_scaled_reasons_to_yojson tree = list_to_yojson not_scaled_reason_to_yojson tree

let scaling_activity_status_code_to_yojson (x : scaling_activity_status_code) =
  match x with
  | Pending -> `String "Pending"
  | InProgress -> `String "InProgress"
  | Successful -> `String "Successful"
  | Overridden -> `String "Overridden"
  | Unfulfilled -> `String "Unfulfilled"
  | Failed -> `String "Failed"

let scaling_activity_to_yojson (x : scaling_activity) =
  assoc_to_yojson
    [
      ("ActivityId", Some (resource_id_to_yojson x.activity_id));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("Description", Some (xml_string_to_yojson x.description));
      ("Cause", Some (xml_string_to_yojson x.cause));
      ("StartTime", Some (timestamp_type_to_yojson x.start_time));
      ("EndTime", option_to_yojson timestamp_type_to_yojson x.end_time);
      ("StatusCode", Some (scaling_activity_status_code_to_yojson x.status_code));
      ("StatusMessage", option_to_yojson xml_string_to_yojson x.status_message);
      ("Details", option_to_yojson xml_string_to_yojson x.details);
      ("NotScaledReasons", option_to_yojson not_scaled_reasons_to_yojson x.not_scaled_reasons);
    ]

let scaling_activities_to_yojson tree = list_to_yojson scaling_activity_to_yojson tree

let describe_scaling_activities_response_to_yojson (x : describe_scaling_activities_response) =
  assoc_to_yojson
    [
      ("ScalingActivities", option_to_yojson scaling_activities_to_yojson x.scaling_activities);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let include_not_scaled_activities_to_yojson = bool_to_yojson

let describe_scaling_activities_request_to_yojson (x : describe_scaling_activities_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", option_to_yojson resource_id_max_len1600_to_yojson x.resource_id);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
      ( "IncludeNotScaledActivities",
        option_to_yojson include_not_scaled_activities_to_yojson x.include_not_scaled_activities );
    ]

let scalable_target_to_yojson (x : scalable_target) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
      ("MinCapacity", Some (resource_capacity_to_yojson x.min_capacity));
      ("MaxCapacity", Some (resource_capacity_to_yojson x.max_capacity));
      ("PredictedCapacity", option_to_yojson resource_capacity_to_yojson x.predicted_capacity);
      ("RoleARN", Some (resource_id_max_len1600_to_yojson x.role_ar_n));
      ("CreationTime", Some (timestamp_type_to_yojson x.creation_time));
      ("SuspendedState", option_to_yojson suspended_state_to_yojson x.suspended_state);
      ("ScalableTargetARN", option_to_yojson xml_string_to_yojson x.scalable_target_ar_n);
    ]

let scalable_targets_to_yojson tree = list_to_yojson scalable_target_to_yojson tree

let describe_scalable_targets_response_to_yojson (x : describe_scalable_targets_response) =
  assoc_to_yojson
    [
      ("ScalableTargets", option_to_yojson scalable_targets_to_yojson x.scalable_targets);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let describe_scalable_targets_request_to_yojson (x : describe_scalable_targets_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceIds", option_to_yojson resource_ids_max_len1600_to_yojson x.resource_ids);
      ("ScalableDimension", option_to_yojson scalable_dimension_to_yojson x.scalable_dimension);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson xml_string_to_yojson x.next_token);
    ]

let deregister_scalable_target_response_to_yojson = unit_to_yojson

let deregister_scalable_target_request_to_yojson (x : deregister_scalable_target_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
    ]

let delete_scheduled_action_response_to_yojson = unit_to_yojson

let delete_scheduled_action_request_to_yojson (x : delete_scheduled_action_request) =
  assoc_to_yojson
    [
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ScheduledActionName", Some (resource_id_max_len1600_to_yojson x.scheduled_action_name));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
    ]

let delete_scaling_policy_response_to_yojson = unit_to_yojson

let delete_scaling_policy_request_to_yojson (x : delete_scaling_policy_request) =
  assoc_to_yojson
    [
      ("PolicyName", Some (resource_id_max_len1600_to_yojson x.policy_name));
      ("ServiceNamespace", Some (service_namespace_to_yojson x.service_namespace));
      ("ResourceId", Some (resource_id_max_len1600_to_yojson x.resource_id));
      ("ScalableDimension", Some (scalable_dimension_to_yojson x.scalable_dimension));
    ]
