open Smaws_Lib.Json.SerializeHelpers
open Types

let workflow_target_action_to_yojson (x : workflow_target_action) =
  match x with
  | POST_RECOVERY -> `String "postRecovery"
  | DEACTIVATE -> `String "deactivate"
  | ACTIVATE -> `String "activate"

let step_name_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let lambda_arn_to_yojson = string_to_yojson

let lambdas_to_yojson (x : lambdas) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson lambda_arn_to_yojson x.arn);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let lambda_list_to_yojson tree = list_to_yojson lambdas_to_yojson tree

let region_to_run_in_to_yojson (x : region_to_run_in) =
  match x with
  | INACTIVE_REGION -> `String "inactiveRegion"
  | ACTIVE_REGION -> `String "activeRegion"
  | DEACTIVATING_REGION -> `String "deactivatingRegion"
  | ACTIVATING_REGION -> `String "activatingRegion"

let lambda_ungraceful_behavior_to_yojson (x : lambda_ungraceful_behavior) =
  match x with SKIP -> `String "skip"

let lambda_ungraceful_to_yojson (x : lambda_ungraceful) =
  assoc_to_yojson [ ("behavior", option_to_yojson lambda_ungraceful_behavior_to_yojson x.behavior) ]

let custom_action_lambda_configuration_to_yojson (x : custom_action_lambda_configuration) =
  assoc_to_yojson
    [
      ("ungraceful", option_to_yojson lambda_ungraceful_to_yojson x.ungraceful);
      ("regionToRun", Some (region_to_run_in_to_yojson x.region_to_run));
      ( "retryIntervalMinutes",
        Some (Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.retry_interval_minutes) );
      ("lambdas", Some (lambda_list_to_yojson x.lambdas));
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let asg_arn_to_yojson = string_to_yojson

let asg_to_yojson (x : asg) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson asg_arn_to_yojson x.arn);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let asg_list_to_yojson tree = list_to_yojson asg_to_yojson tree

let ec2_ungraceful_to_yojson (x : ec2_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let ec2_asg_capacity_monitoring_approach_to_yojson (x : ec2_asg_capacity_monitoring_approach) =
  match x with
  | AUTOSCALING_MAX_IN_LAST_24_HOURS -> `String "autoscalingMaxInLast24Hours"
  | SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"

let ec2_asg_capacity_increase_configuration_to_yojson (x : ec2_asg_capacity_increase_configuration)
    =
  assoc_to_yojson
    [
      ( "capacityMonitoringApproach",
        option_to_yojson ec2_asg_capacity_monitoring_approach_to_yojson
          x.capacity_monitoring_approach );
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ("ungraceful", option_to_yojson ec2_ungraceful_to_yojson x.ungraceful);
      ("asgs", Some (asg_list_to_yojson x.asgs));
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let role_arn_to_yojson = string_to_yojson

let execution_approval_configuration_to_yojson (x : execution_approval_configuration) =
  assoc_to_yojson
    [
      ("approvalRole", Some (role_arn_to_yojson x.approval_role));
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let routing_control_arn_to_yojson = string_to_yojson

let routing_control_state_change_to_yojson (x : routing_control_state_change) =
  match x with OFF -> `String "Off" | ON -> `String "On"

let arc_routing_control_state_to_yojson (x : arc_routing_control_state) =
  assoc_to_yojson
    [
      ("state", Some (routing_control_state_change_to_yojson x.state));
      ("routingControlArn", Some (routing_control_arn_to_yojson x.routing_control_arn));
    ]

let arc_routing_control_states_to_yojson tree =
  list_to_yojson arc_routing_control_state_to_yojson tree

let region_and_routing_controls_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    arc_routing_control_states_to_yojson tree

let arc_routing_control_configuration_to_yojson (x : arc_routing_control_configuration) =
  assoc_to_yojson
    [
      ( "regionAndRoutingControls",
        Some (region_and_routing_controls_to_yojson x.region_and_routing_controls) );
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let global_aurora_default_behavior_to_yojson (x : global_aurora_default_behavior) =
  match x with FAILOVER -> `String "failover" | SWITCHOVER_ONLY -> `String "switchoverOnly"

let global_aurora_ungraceful_behavior_to_yojson (x : global_aurora_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let global_aurora_ungraceful_to_yojson (x : global_aurora_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson global_aurora_ungraceful_behavior_to_yojson x.ungraceful) ]

let global_cluster_identifier_to_yojson = string_to_yojson
let aurora_cluster_arn_to_yojson = string_to_yojson
let aurora_cluster_arns_to_yojson tree = list_to_yojson aurora_cluster_arn_to_yojson tree

let global_aurora_configuration_to_yojson (x : global_aurora_configuration) =
  assoc_to_yojson
    [
      ("databaseClusterArns", Some (aurora_cluster_arns_to_yojson x.database_cluster_arns));
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ("ungraceful", option_to_yojson global_aurora_ungraceful_to_yojson x.ungraceful);
      ("behavior", Some (global_aurora_default_behavior_to_yojson x.behavior));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let plan_arn_to_yojson = string_to_yojson

let region_switch_plan_configuration_to_yojson (x : region_switch_plan_configuration) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let ecs_cluster_arn_to_yojson = string_to_yojson
let ecs_service_arn_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("serviceArn", option_to_yojson ecs_service_arn_to_yojson x.service_arn);
      ("clusterArn", option_to_yojson ecs_cluster_arn_to_yojson x.cluster_arn);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree

let ecs_ungraceful_to_yojson (x : ecs_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let ecs_capacity_monitoring_approach_to_yojson (x : ecs_capacity_monitoring_approach) =
  match x with
  | CONTAINER_INSIGHTS_MAX_IN_LAST_24_HOURS -> `String "containerInsightsMaxInLast24Hours"
  | SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"

let ecs_capacity_increase_configuration_to_yojson (x : ecs_capacity_increase_configuration) =
  assoc_to_yojson
    [
      ( "capacityMonitoringApproach",
        option_to_yojson ecs_capacity_monitoring_approach_to_yojson x.capacity_monitoring_approach
      );
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ("ungraceful", option_to_yojson ecs_ungraceful_to_yojson x.ungraceful);
      ("services", Some (service_list_to_yojson x.services));
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let kubernetes_resource_type_to_yojson (x : kubernetes_resource_type) =
  assoc_to_yojson
    [
      ("kind", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kind));
      ("apiVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.api_version));
    ]

let kubernetes_namespace_to_yojson = string_to_yojson

let kubernetes_scaling_resource_to_yojson (x : kubernetes_scaling_resource) =
  assoc_to_yojson
    [
      ( "hpaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hpa_name );
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("namespace", Some (kubernetes_namespace_to_yojson x.namespace));
    ]

let region_to_yojson = string_to_yojson

let regional_scaling_resource_to_yojson tree =
  map_to_yojson region_to_yojson kubernetes_scaling_resource_to_yojson tree

let kubernetes_scaling_application_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    regional_scaling_resource_to_yojson tree

let kubernetes_scaling_apps_to_yojson tree =
  list_to_yojson kubernetes_scaling_application_to_yojson tree

let eks_cluster_arn_to_yojson = string_to_yojson

let eks_cluster_to_yojson (x : eks_cluster) =
  assoc_to_yojson
    [
      ("clusterArn", Some (eks_cluster_arn_to_yojson x.cluster_arn));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let eks_clusters_to_yojson tree = list_to_yojson eks_cluster_to_yojson tree

let eks_resource_scaling_ungraceful_to_yojson (x : eks_resource_scaling_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let eks_capacity_monitoring_approach_to_yojson (x : eks_capacity_monitoring_approach) =
  match x with SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"

let eks_resource_scaling_configuration_to_yojson (x : eks_resource_scaling_configuration) =
  assoc_to_yojson
    [
      ( "capacityMonitoringApproach",
        option_to_yojson eks_capacity_monitoring_approach_to_yojson x.capacity_monitoring_approach
      );
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ("ungraceful", option_to_yojson eks_resource_scaling_ungraceful_to_yojson x.ungraceful);
      ("eksClusters", option_to_yojson eks_clusters_to_yojson x.eks_clusters);
      ("scalingResources", option_to_yojson kubernetes_scaling_apps_to_yojson x.scaling_resources);
      ( "kubernetesResourceType",
        Some (kubernetes_resource_type_to_yojson x.kubernetes_resource_type) );
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let route53_hosted_zone_id_to_yojson = string_to_yojson
let route53_record_name_to_yojson = string_to_yojson
let route53_resource_record_set_identifier_to_yojson = string_to_yojson

let route53_resource_record_set_to_yojson (x : route53_resource_record_set) =
  assoc_to_yojson
    [
      ("region", option_to_yojson region_to_yojson x.region);
      ( "recordSetIdentifier",
        option_to_yojson route53_resource_record_set_identifier_to_yojson x.record_set_identifier );
    ]

let route53_resource_record_set_list_to_yojson tree =
  list_to_yojson route53_resource_record_set_to_yojson tree

let route53_health_check_configuration_to_yojson (x : route53_health_check_configuration) =
  assoc_to_yojson
    [
      ("recordSets", option_to_yojson route53_resource_record_set_list_to_yojson x.record_sets);
      ("recordName", Some (route53_record_name_to_yojson x.record_name));
      ("hostedZoneId", Some (route53_hosted_zone_id_to_yojson x.hosted_zone_id));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let document_db_default_behavior_to_yojson (x : document_db_default_behavior) =
  match x with FAILOVER -> `String "failover" | SWITCHOVER_ONLY -> `String "switchoverOnly"

let document_db_ungraceful_behavior_to_yojson (x : document_db_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let document_db_ungraceful_to_yojson (x : document_db_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson document_db_ungraceful_behavior_to_yojson x.ungraceful) ]

let document_db_global_cluster_identifier_to_yojson = string_to_yojson
let document_db_cluster_arn_to_yojson = string_to_yojson
let document_db_cluster_arns_to_yojson tree = list_to_yojson document_db_cluster_arn_to_yojson tree

let document_db_configuration_to_yojson (x : document_db_configuration) =
  assoc_to_yojson
    [
      ("databaseClusterArns", Some (document_db_cluster_arns_to_yojson x.database_cluster_arns));
      ( "globalClusterIdentifier",
        Some (document_db_global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ("ungraceful", option_to_yojson document_db_ungraceful_to_yojson x.ungraceful);
      ("behavior", Some (document_db_default_behavior_to_yojson x.behavior));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let rds_db_instance_arn_to_yojson = string_to_yojson

let rds_db_instance_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson rds_db_instance_arn_to_yojson tree

let rds_promote_read_replica_configuration_to_yojson (x : rds_promote_read_replica_configuration) =
  assoc_to_yojson
    [
      ("dbInstanceArnMap", Some (rds_db_instance_arn_map_to_yojson x.db_instance_arn_map));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let rds_create_cross_region_replica_configuration_to_yojson
    (x : rds_create_cross_region_replica_configuration) =
  assoc_to_yojson
    [
      ("dbInstanceArnMap", Some (rds_db_instance_arn_map_to_yojson x.db_instance_arn_map));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let event_source_mapping_action_to_yojson (x : event_source_mapping_action) =
  match x with DISABLE -> `String "disable" | ENABLE -> `String "enable"

let event_source_mapping_arn_to_yojson = string_to_yojson

let event_source_mapping_to_yojson (x : event_source_mapping) =
  assoc_to_yojson
    [
      ("arn", Some (event_source_mapping_arn_to_yojson x.arn));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let region_event_source_mapping_map_to_yojson tree =
  map_to_yojson region_to_yojson event_source_mapping_to_yojson tree

let lambda_event_source_mapping_ungraceful_behavior_to_yojson
    (x : lambda_event_source_mapping_ungraceful_behavior) =
  match x with SKIP -> `String "skip"

let lambda_event_source_mapping_ungraceful_to_yojson (x : lambda_event_source_mapping_ungraceful) =
  assoc_to_yojson
    [
      ( "behavior",
        option_to_yojson lambda_event_source_mapping_ungraceful_behavior_to_yojson x.behavior );
    ]

let lambda_event_source_mapping_configuration_to_yojson
    (x : lambda_event_source_mapping_configuration) =
  assoc_to_yojson
    [
      ("ungraceful", option_to_yojson lambda_event_source_mapping_ungraceful_to_yojson x.ungraceful);
      ( "regionEventSourceMappings",
        Some (region_event_source_mapping_map_to_yojson x.region_event_source_mappings) );
      ("action", Some (event_source_mapping_action_to_yojson x.action));
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let region_aurora_cluster_map_to_yojson tree =
  map_to_yojson region_to_yojson aurora_cluster_arn_to_yojson tree

let aurora_serverless_scaling_configuration_to_yojson (x : aurora_serverless_scaling_configuration)
    =
  assoc_to_yojson
    [
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ( "regionDatabaseClusterArns",
        Some (region_aurora_cluster_map_to_yojson x.region_database_cluster_arns) );
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let aurora_instance_arn_to_yojson = string_to_yojson

let region_aurora_instance_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson aurora_instance_arn_to_yojson tree

let aurora_provisioned_scaling_configuration_to_yojson
    (x : aurora_provisioned_scaling_configuration) =
  assoc_to_yojson
    [
      ("instanceArns", Some (region_aurora_instance_arn_map_to_yojson x.instance_arns));
      ( "regionDatabaseClusterArns",
        Some (region_aurora_cluster_map_to_yojson x.region_database_cluster_arns) );
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let neptune_default_behavior_to_yojson (x : neptune_default_behavior) =
  match x with FAILOVER -> `String "failover" | SWITCHOVER_ONLY -> `String "switchoverOnly"

let neptune_ungraceful_behavior_to_yojson (x : neptune_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let neptune_ungraceful_to_yojson (x : neptune_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson neptune_ungraceful_behavior_to_yojson x.ungraceful) ]

let neptune_global_cluster_identifier_to_yojson = string_to_yojson
let neptune_cluster_arn_to_yojson = string_to_yojson

let region_neptune_cluster_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson neptune_cluster_arn_to_yojson tree

let neptune_global_database_configuration_to_yojson (x : neptune_global_database_configuration) =
  assoc_to_yojson
    [
      ( "regionDatabaseClusterArns",
        Some (region_neptune_cluster_arn_map_to_yojson x.region_database_cluster_arns) );
      ( "globalClusterIdentifier",
        Some (neptune_global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ("ungraceful", option_to_yojson neptune_ungraceful_to_yojson x.ungraceful);
      ("behavior", Some (neptune_default_behavior_to_yojson x.behavior));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
    ]

let execution_block_type_to_yojson (x : execution_block_type) =
  match x with
  | NEPTUNE -> `String "NeptuneGlobalDatabase"
  | AURORA_PROVISIONED_SCALING -> `String "AuroraProvisionedScaling"
  | AURORA_SERVERLESS_SCALING -> `String "AuroraServerlessScaling"
  | LAMBDA_EVENT_SOURCE_MAPPING -> `String "LambdaEventSourceMapping"
  | RDS_CREATE_CROSS_REGION_REPLICA -> `String "RdsCreateCrossRegionReplica"
  | RDS_PROMOTE_READ_REPLICA -> `String "RdsPromoteReadReplica"
  | DOCUMENTDB -> `String "DocumentDb"
  | ROUTE53_HEALTH_CHECK -> `String "Route53HealthCheck"
  | EKS_RESOURCE_SCALING -> `String "EKSResourceScaling"
  | ECS -> `String "ECSServiceScaling"
  | PARALLEL -> `String "Parallel"
  | REGION_SWITCH -> `String "ARCRegionSwitchPlan"
  | ROUTING_CONTROL -> `String "ARCRoutingControl"
  | EC2_ASG -> `String "EC2AutoScaling"
  | AURORA -> `String "AuroraGlobalDatabase"
  | EXECUTION_APPROVAL -> `String "ManualApproval"
  | CUSTOM_ACTION_LAMBDA -> `String "CustomActionLambda"

let rec execution_block_configuration_to_yojson (x : execution_block_configuration) =
  match x with
  | NeptuneGlobalDatabaseConfig arg ->
      assoc_to_yojson
        [
          ("neptuneGlobalDatabaseConfig", Some (neptune_global_database_configuration_to_yojson arg));
        ]
  | AuroraProvisionedScalingConfig arg ->
      assoc_to_yojson
        [
          ( "auroraProvisionedScalingConfig",
            Some (aurora_provisioned_scaling_configuration_to_yojson arg) );
        ]
  | AuroraServerlessScalingConfig arg ->
      assoc_to_yojson
        [
          ( "auroraServerlessScalingConfig",
            Some (aurora_serverless_scaling_configuration_to_yojson arg) );
        ]
  | LambdaEventSourceMappingConfig arg ->
      assoc_to_yojson
        [
          ( "lambdaEventSourceMappingConfig",
            Some (lambda_event_source_mapping_configuration_to_yojson arg) );
        ]
  | RdsCreateCrossRegionReadReplicaConfig arg ->
      assoc_to_yojson
        [
          ( "rdsCreateCrossRegionReadReplicaConfig",
            Some (rds_create_cross_region_replica_configuration_to_yojson arg) );
        ]
  | RdsPromoteReadReplicaConfig arg ->
      assoc_to_yojson
        [
          ( "rdsPromoteReadReplicaConfig",
            Some (rds_promote_read_replica_configuration_to_yojson arg) );
        ]
  | DocumentDbConfig arg ->
      assoc_to_yojson [ ("documentDbConfig", Some (document_db_configuration_to_yojson arg)) ]
  | Route53HealthCheckConfig arg ->
      assoc_to_yojson
        [ ("route53HealthCheckConfig", Some (route53_health_check_configuration_to_yojson arg)) ]
  | EksResourceScalingConfig arg ->
      assoc_to_yojson
        [ ("eksResourceScalingConfig", Some (eks_resource_scaling_configuration_to_yojson arg)) ]
  | EcsCapacityIncreaseConfig arg ->
      assoc_to_yojson
        [ ("ecsCapacityIncreaseConfig", Some (ecs_capacity_increase_configuration_to_yojson arg)) ]
  | RegionSwitchPlanConfig arg ->
      assoc_to_yojson
        [ ("regionSwitchPlanConfig", Some (region_switch_plan_configuration_to_yojson arg)) ]
  | ParallelConfig arg ->
      assoc_to_yojson
        [ ("parallelConfig", Some (parallel_execution_block_configuration_to_yojson arg)) ]
  | GlobalAuroraConfig arg ->
      assoc_to_yojson [ ("globalAuroraConfig", Some (global_aurora_configuration_to_yojson arg)) ]
  | ArcRoutingControlConfig arg ->
      assoc_to_yojson
        [ ("arcRoutingControlConfig", Some (arc_routing_control_configuration_to_yojson arg)) ]
  | ExecutionApprovalConfig arg ->
      assoc_to_yojson
        [ ("executionApprovalConfig", Some (execution_approval_configuration_to_yojson arg)) ]
  | Ec2AsgCapacityIncreaseConfig arg ->
      assoc_to_yojson
        [
          ( "ec2AsgCapacityIncreaseConfig",
            Some (ec2_asg_capacity_increase_configuration_to_yojson arg) );
        ]
  | CustomActionLambdaConfig arg ->
      assoc_to_yojson
        [ ("customActionLambdaConfig", Some (custom_action_lambda_configuration_to_yojson arg)) ]

and parallel_execution_block_configuration_to_yojson (x : parallel_execution_block_configuration) =
  assoc_to_yojson [ ("steps", Some (steps_to_yojson x.steps)) ]

and step_to_yojson (x : step) =
  assoc_to_yojson
    [
      ("executionBlockType", Some (execution_block_type_to_yojson x.execution_block_type));
      ( "executionBlockConfiguration",
        Some (execution_block_configuration_to_yojson x.execution_block_configuration) );
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", Some (step_name_to_yojson x.name));
    ]

and steps_to_yojson tree = list_to_yojson step_to_yojson tree

let workflow_to_yojson (x : workflow) =
  assoc_to_yojson
    [
      ( "workflowDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.workflow_description );
      ("workflowTargetRegion", option_to_yojson region_to_yojson x.workflow_target_region);
      ("workflowTargetAction", Some (workflow_target_action_to_yojson x.workflow_target_action));
      ("steps", option_to_yojson steps_to_yojson x.steps);
    ]

let workflow_list_to_yojson tree = list_to_yojson workflow_to_yojson tree

let alarm_type_to_yojson (x : alarm_type) =
  match x with TRIGGER -> `String "trigger" | APPLICATION_HEALTH -> `String "applicationHealth"

let associated_alarm_to_yojson (x : associated_alarm) =
  assoc_to_yojson
    [
      ("alarmType", Some (alarm_type_to_yojson x.alarm_type));
      ( "resourceIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_identifier) );
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
    ]

let associated_alarm_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson associated_alarm_to_yojson
    tree

let alarm_condition_to_yojson (x : alarm_condition) =
  match x with GREEN -> `String "green" | RED -> `String "red"

let trigger_condition_to_yojson (x : trigger_condition) =
  assoc_to_yojson
    [
      ("condition", Some (alarm_condition_to_yojson x.condition));
      ( "associatedAlarmName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.associated_alarm_name) );
    ]

let trigger_condition_list_to_yojson tree = list_to_yojson trigger_condition_to_yojson tree

let trigger_to_yojson (x : trigger) =
  assoc_to_yojson
    [
      ( "minDelayMinutesBetweenExecutions",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
             x.min_delay_minutes_between_executions) );
      ("conditions", Some (trigger_condition_list_to_yojson x.conditions));
      ("action", Some (workflow_target_action_to_yojson x.action));
      ("targetRegion", Some (region_to_yojson x.target_region));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let trigger_list_to_yojson tree = list_to_yojson trigger_to_yojson tree
let account_id_to_yojson = string_to_yojson

let s3_report_output_configuration_to_yojson (x : s3_report_output_configuration) =
  assoc_to_yojson
    [
      ("bucketOwner", option_to_yojson account_id_to_yojson x.bucket_owner);
      ( "bucketPath",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket_path );
    ]

let report_output_configuration_to_yojson (x : report_output_configuration) =
  match x with
  | S3Configuration arg ->
      assoc_to_yojson [ ("s3Configuration", Some (s3_report_output_configuration_to_yojson arg)) ]

let report_output_list_to_yojson tree = list_to_yojson report_output_configuration_to_yojson tree

let report_configuration_to_yojson (x : report_configuration) =
  assoc_to_yojson
    [ ("reportOutput", option_to_yojson report_output_list_to_yojson x.report_output) ]

let plan_name_to_yojson = string_to_yojson
let region_list_to_yojson tree = list_to_yojson region_to_yojson tree

let recovery_approach_to_yojson (x : recovery_approach) =
  match x with ACTIVE_PASSIVE -> `String "activePassive" | ACTIVE_ACTIVE -> `String "activeActive"

let plan_to_yojson (x : plan) =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ("owner", Some (account_id_to_yojson x.owner));
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("regions", Some (region_list_to_yojson x.regions));
      ("name", Some (plan_name_to_yojson x.name));
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let update_plan_response_to_yojson (x : update_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let update_plan_request_to_yojson (x : update_plan_request) =
  assoc_to_yojson
    [
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let update_plan_execution_step_response_to_yojson = unit_to_yojson
let execution_id_to_yojson = string_to_yojson
let execution_comment_to_yojson = string_to_yojson

let update_plan_execution_step_action_to_yojson (x : update_plan_execution_step_action) =
  match x with SKIP -> `String "skip" | SWITCH_TO_UNGRACEFUL -> `String "switchToUngraceful"

let update_plan_execution_step_request_to_yojson (x : update_plan_execution_step_request) =
  assoc_to_yojson
    [
      ("actionToTake", Some (update_plan_execution_step_action_to_yojson x.action_to_take));
      ("stepName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.step_name));
      ("comment", Some (execution_comment_to_yojson x.comment));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let update_plan_execution_response_to_yojson = unit_to_yojson

let update_plan_execution_action_to_yojson (x : update_plan_execution_action) =
  match x with
  | RESUME -> `String "resume"
  | PAUSE -> `String "pause"
  | SWITCH_TO_UNGRACEFUL -> `String "switchToUngraceful"
  | SWITCH_TO_GRACEFUL -> `String "switchToGraceful"

let update_plan_execution_request_to_yojson (x : update_plan_execution_request) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
      ("action", Some (update_plan_execution_action_to_yojson x.action));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let illegal_state_exception_to_yojson (x : illegal_state_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceTagKeys", Some (tag_keys_to_yojson x.resource_tag_keys));
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("tags", Some (tags_to_yojson x.tags)); ("arn", Some (plan_arn_to_yojson x.arn)) ]

let step_status_to_yojson (x : step_status) =
  match x with
  | PENDING_APPROVAL -> `String "pendingApproval"
  | SKIPPED -> `String "skipped"
  | CANCELLED -> `String "canceled"
  | COMPLETED -> `String "completed"
  | FAILED -> `String "failed"
  | RUNNING -> `String "running"
  | NOT_STARTED -> `String "notStarted"

let execution_mode_to_yojson (x : execution_mode) =
  match x with UNGRACEFUL -> `String "ungraceful" | GRACEFUL -> `String "graceful"

let step_state_to_yojson (x : step_state) =
  assoc_to_yojson
    [
      ("stepMode", option_to_yojson execution_mode_to_yojson x.step_mode);
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ("status", option_to_yojson step_status_to_yojson x.status);
      ("name", option_to_yojson step_name_to_yojson x.name);
    ]

let step_states_to_yojson tree = list_to_yojson step_state_to_yojson tree

let start_plan_execution_response_to_yojson (x : start_plan_execution_response) =
  assoc_to_yojson
    [
      ( "deactivateRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.deactivate_region
      );
      ( "activateRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.activate_region
      );
      ( "planVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.plan_version );
      ("plan", option_to_yojson plan_arn_to_yojson x.plan);
      ("executionId", option_to_yojson execution_id_to_yojson x.execution_id);
    ]

let execution_action_to_yojson (x : execution_action) =
  match x with
  | POST_RECOVERY -> `String "postRecovery"
  | DEACTIVATE -> `String "deactivate"
  | ACTIVATE -> `String "activate"

let recovery_execution_id_to_yojson = string_to_yojson

let start_plan_execution_request_to_yojson (x : start_plan_execution_request) =
  assoc_to_yojson
    [
      ( "recoveryExecutionId",
        option_to_yojson recovery_execution_id_to_yojson x.recovery_execution_id );
      ( "latestVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.latest_version );
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
      ("mode", option_to_yojson execution_mode_to_yojson x.mode);
      ("action", Some (execution_action_to_yojson x.action));
      ( "targetRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_region) );
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let illegal_argument_exception_to_yojson (x : illegal_argument_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let s3_report_output_to_yojson (x : s3_report_output) =
  assoc_to_yojson
    [
      ( "s3ObjectKey",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.s3_object_key );
    ]

let route53_health_check_status_to_yojson (x : route53_health_check_status) =
  match x with
  | UNKNOWN -> `String "unknown"
  | UNHEALTHY -> `String "unhealthy"
  | HEALTHY -> `String "healthy"

let route53_health_check_id_to_yojson = string_to_yojson

let route53_health_check_to_yojson (x : route53_health_check) =
  assoc_to_yojson
    [
      ("region", Some (region_to_yojson x.region));
      ("status", option_to_yojson route53_health_check_status_to_yojson x.status);
      ("healthCheckId", option_to_yojson route53_health_check_id_to_yojson x.health_check_id);
      ("recordName", Some (route53_record_name_to_yojson x.record_name));
      ("hostedZoneId", Some (route53_hosted_zone_id_to_yojson x.hosted_zone_id));
    ]

let route53_health_check_list_to_yojson tree = list_to_yojson route53_health_check_to_yojson tree

let resources_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let resource_warning_status_to_yojson (x : resource_warning_status) =
  match x with RESOLVED -> `String "resolved" | ACTIVE -> `String "active"

let minimal_workflow_to_yojson (x : minimal_workflow) =
  assoc_to_yojson
    [
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("action", option_to_yojson execution_action_to_yojson x.action);
    ]

let resource_arn_to_yojson = string_to_yojson

let resource_warning_to_yojson (x : resource_warning) =
  assoc_to_yojson
    [
      ( "warningMessage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.warning_message) );
      ( "warningUpdatedTime",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.warning_updated_time) );
      ("warningStatus", Some (resource_warning_status_to_yojson x.warning_status));
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("stepName", option_to_yojson step_name_to_yojson x.step_name);
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
      ("workflow", option_to_yojson minimal_workflow_to_yojson x.workflow);
    ]

let failed_report_error_code_to_yojson (x : failed_report_error_code) =
  match x with
  | CONFIGURATION_ERROR -> `String "configurationError"
  | INVALID_RESOURCE -> `String "invalidResource"
  | INSUFFICIENT_PERMISSIONS -> `String "insufficientPermissions"

let failed_report_output_to_yojson (x : failed_report_output) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("errorCode", option_to_yojson failed_report_error_code_to_yojson x.error_code);
    ]

let report_output_to_yojson (x : report_output) =
  match x with
  | FailedReportOutput arg ->
      assoc_to_yojson [ ("failedReportOutput", Some (failed_report_output_to_yojson arg)) ]
  | S3ReportOutput arg ->
      assoc_to_yojson [ ("s3ReportOutput", Some (s3_report_output_to_yojson arg)) ]

let plan_warnings_to_yojson tree = list_to_yojson resource_warning_to_yojson tree

let abbreviated_plan_to_yojson (x : abbreviated_plan) =
  assoc_to_yojson
    [
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("activePlanExecution", option_to_yojson execution_id_to_yojson x.active_plan_execution);
      ( "executionRole",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_role );
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("regions", Some (region_list_to_yojson x.regions));
      ("name", Some (plan_name_to_yojson x.name));
      ("owner", Some (account_id_to_yojson x.owner));
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let plan_list_to_yojson tree = list_to_yojson abbreviated_plan_to_yojson tree
let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson tags_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let list_route53_health_checks_response_to_yojson (x : list_route53_health_checks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("healthChecks", option_to_yojson route53_health_check_list_to_yojson x.health_checks);
    ]

let list_route53_health_checks_request_to_yojson (x : list_route53_health_checks_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("recordName", option_to_yojson route53_record_name_to_yojson x.record_name);
      ("hostedZoneId", option_to_yojson route53_hosted_zone_id_to_yojson x.hosted_zone_id);
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let list_route53_health_checks_in_region_response_to_yojson
    (x : list_route53_health_checks_in_region_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("healthChecks", option_to_yojson route53_health_check_list_to_yojson x.health_checks);
    ]

let list_route53_health_checks_in_region_request_to_yojson
    (x : list_route53_health_checks_in_region_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("recordName", option_to_yojson route53_record_name_to_yojson x.record_name);
      ("hostedZoneId", option_to_yojson route53_hosted_zone_id_to_yojson x.hosted_zone_id);
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let list_plans_response_to_yojson (x : list_plans_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("plans", option_to_yojson plan_list_to_yojson x.plans);
    ]

let list_plans_request_to_yojson (x : list_plans_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_plans_in_region_response_to_yojson (x : list_plans_in_region_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("plans", option_to_yojson plan_list_to_yojson x.plans);
    ]

let list_plans_in_region_request_to_yojson (x : list_plans_in_region_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let execution_state_to_yojson (x : execution_state) =
  match x with
  | COMPLETED_MONITORING_APPLICATION_HEALTH -> `String "completedMonitoringApplicationHealth"
  | PENDING -> `String "pending"
  | FAILED -> `String "failed"
  | PENDING_MANUAL_APPROVAL -> `String "pendingManualApproval"
  | PLAN_EXECUTION_TIMED_OUT -> `String "planExecutionTimedOut"
  | CANCELLED -> `String "canceled"
  | COMPLETED_WITH_EXCEPTIONS -> `String "completedWithExceptions"
  | COMPLETED -> `String "completed"
  | PAUSED_BY_OPERATOR -> `String "pausedByOperator"
  | PAUSED_BY_FAILED_STEP -> `String "pausedByFailedStep"
  | IN_PROGRESS -> `String "inProgress"

let duration_to_yojson = string_to_yojson

let abbreviated_execution_to_yojson (x : abbreviated_execution) =
  assoc_to_yojson
    [
      ("actualRecoveryTime", option_to_yojson duration_to_yojson x.actual_recovery_time);
      ( "recoveryExecutionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recovery_execution_id );
      ( "executionRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_region) );
      ("executionAction", Some (execution_action_to_yojson x.execution_action));
      ("executionState", Some (execution_state_to_yojson x.execution_state));
      ("mode", Some (execution_mode_to_yojson x.mode));
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ("comment", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.comment);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let abbreviated_executions_list_to_yojson tree = list_to_yojson abbreviated_execution_to_yojson tree

let list_plan_executions_response_to_yojson (x : list_plan_executions_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("items", option_to_yojson abbreviated_executions_list_to_yojson x.items);
    ]

let list_executions_max_results_to_yojson = int_to_yojson

let list_plan_executions_request_to_yojson (x : list_plan_executions_request) =
  assoc_to_yojson
    [
      ("state", option_to_yojson execution_state_to_yojson x.state);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson list_executions_max_results_to_yojson x.max_results);
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let execution_event_type_to_yojson (x : execution_event_type) =
  match x with
  | PLAN_EVALUATION_WARNING -> `String "planEvaluationWarning"
  | STEP_PENDING_APPLICATION_HEALTH_MONITOR -> `String "stepPendingApplicationHealthMonitor"
  | STEP_EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL ->
      `String "stepExecutionBehaviorChangedToUngraceful"
  | STEP_PENDING_APPROVAL -> `String "stepPendingApproval"
  | STEP_CANCELED -> `String "stepCanceled"
  | STEP_PAUSED_BY_OPERATOR -> `String "stepPausedByOperator"
  | STEP_PAUSED_BY_ERROR -> `String "stepPausedByError"
  | STEP_SKIPPED -> `String "stepSkipped"
  | STEP_FAILED -> `String "stepFailed"
  | STEP_SUCCEEDED -> `String "stepSucceeded"
  | STEP_UPDATE -> `String "stepUpdate"
  | STEP_STARTED -> `String "stepStarted"
  | EXECUTION_SUCCESS_MONITORING_APPLICATION_HEALTH ->
      `String "executionSuccessMonitoringApplicationHealth"
  | EXECUTION_PENDING_CHILD_PLAN_MANUAL_APPROVAL ->
      `String "executionPendingChildPlanManualApproval"
  | EXECUTION_BEHAVIOR_CHANGED_TO_GRACEFUL -> `String "executionBehaviorChangedToGraceful"
  | EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL -> `String "executionBehaviorChangedToUngraceful"
  | EXECUTION_PENDING_APPROVAL -> `String "executionPendingApproval"
  | EXECUTION_CANCELED -> `String "executionCanceled"
  | EXECUTION_CANCELING -> `String "executionCanceling"
  | EXECUTION_PAUSED -> `String "executionPaused"
  | EXECUTION_PAUSING -> `String "executionPausing"
  | EXECUTION_FAILED -> `String "executionFailed"
  | EXECUTION_SUCCEEDED -> `String "executionSucceeded"
  | EXECUTION_STARTED -> `String "executionStarted"
  | EXECUTION_PENDING -> `String "executionPending"
  | UNKNOWN -> `String "unknown"

let execution_event_to_yojson (x : execution_event) =
  assoc_to_yojson
    [
      ( "previousEventId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.previous_event_id
      );
      ("eventId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_id));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("error", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error);
      ("resources", option_to_yojson resources_to_yojson x.resources);
      ("executionBlockType", option_to_yojson execution_block_type_to_yojson x.execution_block_type);
      ("stepName", option_to_yojson step_name_to_yojson x.step_name);
      ("type", option_to_yojson execution_event_type_to_yojson x.type_);
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.timestamp );
    ]

let execution_event_list_to_yojson tree = list_to_yojson execution_event_to_yojson tree

let list_plan_execution_events_response_to_yojson (x : list_plan_execution_events_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("items", option_to_yojson execution_event_list_to_yojson x.items);
    ]

let list_execution_events_max_results_to_yojson = int_to_yojson

let list_plan_execution_events_request_to_yojson (x : list_plan_execution_events_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson step_name_to_yojson x.name);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson list_execution_events_max_results_to_yojson x.max_results);
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let get_plan_response_to_yojson (x : get_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let get_plan_request_to_yojson (x : get_plan_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let get_plan_in_region_response_to_yojson (x : get_plan_in_region_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let get_plan_in_region_request_to_yojson (x : get_plan_in_region_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let get_plan_execution_step_states_max_results_to_yojson = int_to_yojson

let generated_report_to_yojson (x : generated_report) =
  assoc_to_yojson
    [
      ("reportOutput", option_to_yojson report_output_to_yojson x.report_output);
      ( "reportGenerationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.report_generation_time );
    ]

let generated_report_details_to_yojson tree = list_to_yojson generated_report_to_yojson tree

let get_plan_execution_response_to_yojson (x : get_plan_execution_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "generatedReportDetails",
        option_to_yojson generated_report_details_to_yojson x.generated_report_details );
      ("actualRecoveryTime", option_to_yojson duration_to_yojson x.actual_recovery_time);
      ("plan", option_to_yojson plan_to_yojson x.plan);
      ("stepStates", option_to_yojson step_states_to_yojson x.step_states);
      ( "recoveryExecutionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recovery_execution_id );
      ( "executionRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_region) );
      ("executionAction", Some (execution_action_to_yojson x.execution_action));
      ("executionState", Some (execution_state_to_yojson x.execution_state));
      ("mode", Some (execution_mode_to_yojson x.mode));
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ("comment", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.comment);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let get_plan_execution_request_to_yojson (x : get_plan_execution_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson get_plan_execution_step_states_max_results_to_yojson x.max_results );
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let evaluation_status_to_yojson (x : evaluation_status) =
  match x with
  | UNKNOWN -> `String "unknown"
  | PENDING_EVALUATION -> `String "pendingEvaluation"
  | ACTION_REQUIRED -> `String "actionRequired"
  | PASSED -> `String "passed"

let get_plan_evaluation_status_response_to_yojson (x : get_plan_evaluation_status_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("warnings", option_to_yojson plan_warnings_to_yojson x.warnings);
      ("evaluationState", option_to_yojson evaluation_status_to_yojson x.evaluation_state);
      ("region", option_to_yojson region_to_yojson x.region);
      ( "lastEvaluatedVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_evaluated_version );
      ( "lastEvaluationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_evaluation_time );
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let get_plan_evaluation_status_request_to_yojson (x : get_plan_evaluation_status_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let delete_plan_response_to_yojson = unit_to_yojson

let delete_plan_request_to_yojson (x : delete_plan_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let create_plan_response_to_yojson (x : create_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let create_plan_request_to_yojson (x : create_plan_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("regions", Some (region_list_to_yojson x.regions));
      ("name", Some (plan_name_to_yojson x.name));
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let cancel_plan_execution_response_to_yojson = unit_to_yojson

let cancel_plan_execution_request_to_yojson (x : cancel_plan_execution_request) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]

let approve_plan_execution_step_response_to_yojson = unit_to_yojson

let approval_to_yojson (x : approval) =
  match x with DECLINE -> `String "decline" | APPROVE -> `String "approve"

let approve_plan_execution_step_request_to_yojson (x : approve_plan_execution_step_request) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
      ("approval", Some (approval_to_yojson x.approval));
      ("stepName", Some (step_name_to_yojson x.step_name));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
    ]
