open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let last_updated_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let status_reason_to_yojson = string_to_yojson

let status_to_yojson (x : status) =
  match x with
  | ACTIVE -> `String "Active"
  | INACTIVE -> `String "Inactive"
  | PENDING -> `String "Pending"
  | FAILED -> `String "Failed"

let account_id_to_yojson = string_to_yojson

let account_enrollment_status_to_yojson (x : account_enrollment_status) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("status", option_to_yojson status_to_yojson x.status);
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
    ]

let account_enrollment_statuses_to_yojson tree =
  list_to_yojson account_enrollment_status_to_yojson tree

let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree
let allocated_storage_to_yojson = int_to_yojson

let allocation_strategy_to_yojson (x : allocation_strategy) =
  match x with PRIORITIZED -> `String "Prioritized" | LOWEST_PRICE -> `String "LowestPrice"

let asg_type_to_yojson (x : asg_type) =
  match x with
  | SINGLE_INSTANCE_TYPE -> `String "SingleInstanceType"
  | MIXED_INSTANCE_TYPE -> `String "MixedInstanceTypes"

let auto_scaling_configuration_to_yojson (x : auto_scaling_configuration) =
  match x with
  | TARGET_TRACKING_SCALING_CPU -> `String "TargetTrackingScalingCpu"
  | TARGET_TRACKING_SCALING_MEMORY -> `String "TargetTrackingScalingMemory"

let auto_scaling_group_arn_to_yojson = string_to_yojson
let auto_scaling_group_arns_to_yojson tree = list_to_yojson auto_scaling_group_arn_to_yojson tree
let mixed_instance_type_to_yojson = string_to_yojson
let mixed_instance_types_to_yojson tree = list_to_yojson mixed_instance_type_to_yojson tree
let nullable_estimated_instance_hour_reduction_percentage_to_yojson = double_to_yojson
let nullable_instance_type_to_yojson = string_to_yojson
let max_size_to_yojson = int_to_yojson
let min_size_to_yojson = int_to_yojson
let desired_capacity_to_yojson = int_to_yojson

let auto_scaling_group_configuration_to_yojson (x : auto_scaling_group_configuration) =
  assoc_to_yojson
    [
      ("desiredCapacity", option_to_yojson desired_capacity_to_yojson x.desired_capacity);
      ("minSize", option_to_yojson min_size_to_yojson x.min_size);
      ("maxSize", option_to_yojson max_size_to_yojson x.max_size);
      ("instanceType", option_to_yojson nullable_instance_type_to_yojson x.instance_type);
      ("allocationStrategy", option_to_yojson allocation_strategy_to_yojson x.allocation_strategy);
      ( "estimatedInstanceHourReductionPercentage",
        option_to_yojson nullable_estimated_instance_hour_reduction_percentage_to_yojson
          x.estimated_instance_hour_reduction_percentage );
      ("type", option_to_yojson asg_type_to_yojson x.type_);
      ("mixedInstanceTypes", option_to_yojson mixed_instance_types_to_yojson x.mixed_instance_types);
    ]

let value_to_yojson = double_to_yojson
let currency_to_yojson (x : currency) = match x with USD -> `String "USD" | CNY -> `String "CNY"

let auto_scaling_group_estimated_monthly_savings_to_yojson
    (x : auto_scaling_group_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let auto_scaling_group_name_to_yojson = string_to_yojson

let inferred_workload_type_to_yojson (x : inferred_workload_type) =
  match x with
  | AMAZON_EMR -> `String "AmazonEmr"
  | APACHE_CASSANDRA -> `String "ApacheCassandra"
  | APACHE_HADOOP -> `String "ApacheHadoop"
  | MEMCACHED -> `String "Memcached"
  | NGINX -> `String "Nginx"
  | POSTGRE_SQL -> `String "PostgreSql"
  | REDIS -> `String "Redis"
  | KAFKA -> `String "Kafka"
  | SQLSERVER -> `String "SQLServer"

let inferred_workload_types_to_yojson tree = list_to_yojson inferred_workload_type_to_yojson tree

let instance_savings_estimation_mode_source_to_yojson (x : instance_savings_estimation_mode_source)
    =
  match x with
  | PUBLIC_PRICING -> `String "PublicPricing"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"

let instance_savings_estimation_mode_to_yojson (x : instance_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson instance_savings_estimation_mode_source_to_yojson x.source) ]

let preferred_resource_value_to_yojson = string_to_yojson

let preferred_resource_values_to_yojson tree =
  list_to_yojson preferred_resource_value_to_yojson tree

let preferred_resource_name_to_yojson (x : preferred_resource_name) =
  match x with EC2_INSTANCE_TYPES -> `String "Ec2InstanceTypes"

let effective_preferred_resource_to_yojson (x : effective_preferred_resource) =
  assoc_to_yojson
    [
      ("name", option_to_yojson preferred_resource_name_to_yojson x.name);
      ("includeList", option_to_yojson preferred_resource_values_to_yojson x.include_list);
      ( "effectiveIncludeList",
        option_to_yojson preferred_resource_values_to_yojson x.effective_include_list );
      ("excludeList", option_to_yojson preferred_resource_values_to_yojson x.exclude_list);
    ]

let effective_preferred_resources_to_yojson tree =
  list_to_yojson effective_preferred_resource_to_yojson tree

let customizable_metric_headroom_to_yojson (x : customizable_metric_headroom) =
  match x with
  | PERCENT_30 -> `String "PERCENT_30"
  | PERCENT_20 -> `String "PERCENT_20"
  | PERCENT_10 -> `String "PERCENT_10"
  | PERCENT_0 -> `String "PERCENT_0"

let customizable_metric_threshold_to_yojson (x : customizable_metric_threshold) =
  match x with P90 -> `String "P90" | P95 -> `String "P95" | P99_5 -> `String "P99_5"

let customizable_metric_parameters_to_yojson (x : customizable_metric_parameters) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson customizable_metric_threshold_to_yojson x.threshold);
      ("headroom", option_to_yojson customizable_metric_headroom_to_yojson x.headroom);
    ]

let customizable_metric_name_to_yojson (x : customizable_metric_name) =
  match x with
  | CPU_UTILIZATION -> `String "CpuUtilization"
  | MEMORY_UTILIZATION -> `String "MemoryUtilization"

let utilization_preference_to_yojson (x : utilization_preference) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson customizable_metric_name_to_yojson x.metric_name);
      ( "metricParameters",
        option_to_yojson customizable_metric_parameters_to_yojson x.metric_parameters );
    ]

let utilization_preferences_to_yojson tree = list_to_yojson utilization_preference_to_yojson tree

let look_back_period_preference_to_yojson (x : look_back_period_preference) =
  match x with
  | DAYS_14 -> `String "DAYS_14"
  | DAYS_32 -> `String "DAYS_32"
  | DAYS_93 -> `String "DAYS_93"

let external_metrics_source_to_yojson (x : external_metrics_source) =
  match x with
  | DATADOG -> `String "Datadog"
  | DYNATRACE -> `String "Dynatrace"
  | NEWRELIC -> `String "NewRelic"
  | INSTANA -> `String "Instana"

let external_metrics_preference_to_yojson (x : external_metrics_preference) =
  assoc_to_yojson [ ("source", option_to_yojson external_metrics_source_to_yojson x.source) ]

let inferred_workload_types_preference_to_yojson (x : inferred_workload_types_preference) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let enhanced_infrastructure_metrics_to_yojson (x : enhanced_infrastructure_metrics) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let cpu_vendor_architecture_to_yojson (x : cpu_vendor_architecture) =
  match x with AWS_ARM64 -> `String "AWS_ARM64" | CURRENT -> `String "CURRENT"

let cpu_vendor_architectures_to_yojson tree = list_to_yojson cpu_vendor_architecture_to_yojson tree

let effective_recommendation_preferences_to_yojson (x : effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
      ( "savingsEstimationMode",
        option_to_yojson instance_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let current_performance_risk_to_yojson (x : current_performance_risk) =
  match x with
  | VERY_LOW -> `String "VeryLow"
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"

let last_refresh_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let migration_effort_to_yojson (x : migration_effort) =
  match x with
  | VERY_LOW -> `String "VeryLow"
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"

let savings_opportunity_percentage_to_yojson = double_to_yojson

let auto_scaling_group_savings_opportunity_after_discounts_to_yojson
    (x : auto_scaling_group_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson auto_scaling_group_estimated_monthly_savings_to_yojson
          x.estimated_monthly_savings );
    ]

let estimated_monthly_savings_to_yojson (x : estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let savings_opportunity_to_yojson (x : savings_opportunity) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let rank_to_yojson = int_to_yojson
let performance_risk_to_yojson = double_to_yojson
let metric_value_to_yojson = double_to_yojson

let metric_statistic_to_yojson (x : metric_statistic) =
  match x with MAXIMUM -> `String "Maximum" | AVERAGE -> `String "Average"

let metric_name_to_yojson (x : metric_name) =
  match x with
  | CPU -> `String "Cpu"
  | MEMORY -> `String "Memory"
  | EBS_READ_OPS_PER_SECOND -> `String "EBS_READ_OPS_PER_SECOND"
  | EBS_WRITE_OPS_PER_SECOND -> `String "EBS_WRITE_OPS_PER_SECOND"
  | EBS_READ_BYTES_PER_SECOND -> `String "EBS_READ_BYTES_PER_SECOND"
  | EBS_WRITE_BYTES_PER_SECOND -> `String "EBS_WRITE_BYTES_PER_SECOND"
  | DISK_READ_OPS_PER_SECOND -> `String "DISK_READ_OPS_PER_SECOND"
  | DISK_WRITE_OPS_PER_SECOND -> `String "DISK_WRITE_OPS_PER_SECOND"
  | DISK_READ_BYTES_PER_SECOND -> `String "DISK_READ_BYTES_PER_SECOND"
  | DISK_WRITE_BYTES_PER_SECOND -> `String "DISK_WRITE_BYTES_PER_SECOND"
  | NETWORK_IN_BYTES_PER_SECOND -> `String "NETWORK_IN_BYTES_PER_SECOND"
  | NETWORK_OUT_BYTES_PER_SECOND -> `String "NETWORK_OUT_BYTES_PER_SECOND"
  | NETWORK_PACKETS_IN_PER_SECOND -> `String "NETWORK_PACKETS_IN_PER_SECOND"
  | NETWORK_PACKETS_OUT_PER_SECOND -> `String "NETWORK_PACKETS_OUT_PER_SECOND"
  | GPU_PERCENTAGE -> `String "GPU_PERCENTAGE"
  | GPU_MEMORY_PERCENTAGE -> `String "GPU_MEMORY_PERCENTAGE"

let utilization_metric_to_yojson (x : utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson metric_name_to_yojson x.name);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let projected_utilization_metrics_to_yojson tree = list_to_yojson utilization_metric_to_yojson tree
let gpu_memory_size_in_mi_b_to_yojson = int_to_yojson
let gpu_count_to_yojson = int_to_yojson

let gpu_to_yojson (x : gpu) =
  assoc_to_yojson
    [
      ("gpuCount", option_to_yojson gpu_count_to_yojson x.gpu_count);
      ( "gpuMemorySizeInMiB",
        option_to_yojson gpu_memory_size_in_mi_b_to_yojson x.gpu_memory_size_in_mi_b );
    ]

let gpus_to_yojson tree = list_to_yojson gpu_to_yojson tree

let gpu_info_to_yojson (x : gpu_info) =
  assoc_to_yojson [ ("gpus", option_to_yojson gpus_to_yojson x.gpus) ]

let auto_scaling_group_recommendation_option_to_yojson
    (x : auto_scaling_group_recommendation_option) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson auto_scaling_group_configuration_to_yojson x.configuration);
      ("instanceGpuInfo", option_to_yojson gpu_info_to_yojson x.instance_gpu_info);
      ( "projectedUtilizationMetrics",
        option_to_yojson projected_utilization_metrics_to_yojson x.projected_utilization_metrics );
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson auto_scaling_group_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("migrationEffort", option_to_yojson migration_effort_to_yojson x.migration_effort);
    ]

let auto_scaling_group_recommendation_options_to_yojson tree =
  list_to_yojson auto_scaling_group_recommendation_option_to_yojson tree

let look_back_period_in_days_to_yojson = double_to_yojson
let utilization_metrics_to_yojson tree = list_to_yojson utilization_metric_to_yojson tree

let finding_to_yojson (x : finding) =
  match x with
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | OPTIMIZED -> `String "Optimized"
  | NOT_OPTIMIZED -> `String "NotOptimized"

let auto_scaling_group_recommendation_to_yojson (x : auto_scaling_group_recommendation) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "autoScalingGroupArn",
        option_to_yojson auto_scaling_group_arn_to_yojson x.auto_scaling_group_arn );
      ( "autoScalingGroupName",
        option_to_yojson auto_scaling_group_name_to_yojson x.auto_scaling_group_name );
      ("finding", option_to_yojson finding_to_yojson x.finding);
      ("utilizationMetrics", option_to_yojson utilization_metrics_to_yojson x.utilization_metrics);
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "currentConfiguration",
        option_to_yojson auto_scaling_group_configuration_to_yojson x.current_configuration );
      ("currentInstanceGpuInfo", option_to_yojson gpu_info_to_yojson x.current_instance_gpu_info);
      ( "recommendationOptions",
        option_to_yojson auto_scaling_group_recommendation_options_to_yojson
          x.recommendation_options );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "effectiveRecommendationPreferences",
        option_to_yojson effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
    ]

let auto_scaling_group_recommendations_to_yojson tree =
  list_to_yojson auto_scaling_group_recommendation_to_yojson tree

let code_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let missing_authentication_token_to_yojson (x : missing_authentication_token) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_enrollment_status_response_to_yojson (x : update_enrollment_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
    ]

let include_member_accounts_to_yojson = bool_to_yojson

let update_enrollment_status_request_to_yojson (x : update_enrollment_status_request) =
  assoc_to_yojson
    [
      ("status", Some (status_to_yojson x.status));
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let opt_in_required_exception_to_yojson (x : opt_in_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let put_recommendation_preferences_response_to_yojson = unit_to_yojson

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | AFTER_DISCOUNTS -> `String "AfterDiscounts"
  | BEFORE_DISCOUNTS -> `String "BeforeDiscounts"

let preferred_resource_to_yojson (x : preferred_resource) =
  assoc_to_yojson
    [
      ("name", option_to_yojson preferred_resource_name_to_yojson x.name);
      ("includeList", option_to_yojson preferred_resource_values_to_yojson x.include_list);
      ("excludeList", option_to_yojson preferred_resource_values_to_yojson x.exclude_list);
    ]

let preferred_resources_to_yojson tree = list_to_yojson preferred_resource_to_yojson tree
let scope_value_to_yojson = string_to_yojson

let scope_name_to_yojson (x : scope_name) =
  match x with
  | ORGANIZATION -> `String "Organization"
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_ARN -> `String "ResourceArn"

let scope_to_yojson (x : scope) =
  assoc_to_yojson
    [
      ("name", option_to_yojson scope_name_to_yojson x.name);
      ("value", option_to_yojson scope_value_to_yojson x.value);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | EC2_INSTANCE -> `String "Ec2Instance"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EBS_VOLUME -> `String "EbsVolume"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | NOT_APPLICABLE -> `String "NotApplicable"
  | ECS_SERVICE -> `String "EcsService"
  | LICENSE -> `String "License"
  | RDS_DB_INSTANCE -> `String "RdsDBInstance"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDBClusterStorage"
  | IDLE -> `String "Idle"

let put_recommendation_preferences_request_to_yojson (x : put_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ("preferredResources", option_to_yojson preferred_resources_to_yojson x.preferred_resources);
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let inferred_workload_saving_to_yojson (x : inferred_workload_saving) =
  assoc_to_yojson
    [
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let inferred_workload_savings_to_yojson tree =
  list_to_yojson inferred_workload_saving_to_yojson tree

let very_low_to_yojson = long_to_yojson
let low_to_yojson = long_to_yojson
let medium_to_yojson = long_to_yojson
let high_to_yojson = long_to_yojson

let current_performance_risk_ratings_to_yojson (x : current_performance_risk_ratings) =
  assoc_to_yojson
    [
      ("high", option_to_yojson high_to_yojson x.high);
      ("medium", option_to_yojson medium_to_yojson x.medium);
      ("low", option_to_yojson low_to_yojson x.low);
      ("veryLow", option_to_yojson very_low_to_yojson x.very_low);
    ]

let recommendation_source_type_to_yojson (x : recommendation_source_type) =
  match x with
  | EC2_INSTANCE -> `String "Ec2Instance"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EBS_VOLUME -> `String "EbsVolume"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | ECS_SERVICE -> `String "EcsService"
  | LICENSE -> `String "License"
  | RDS_DB_INSTANCE -> `String "RdsDBInstance"
  | RDS_DB_INSTANCE_STORAGE -> `String "RdsDBInstanceStorage"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDBClusterStorage"
  | NAT_GATEWAY -> `String "NatGateway"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | WORKSPACES -> `String "WorkSpaces"
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"

let summary_value_to_yojson = double_to_yojson

let idle_finding_to_yojson (x : idle_finding) =
  match x with
  | IDLE -> `String "Idle"
  | UNATTACHED -> `String "Unattached"
  | UNUSED -> `String "Unused"

let idle_summary_to_yojson (x : idle_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson idle_finding_to_yojson x.name);
      ("value", option_to_yojson summary_value_to_yojson x.value);
    ]

let idle_summaries_to_yojson tree = list_to_yojson idle_summary_to_yojson tree

let finding_reason_code_to_yojson (x : finding_reason_code) =
  match x with
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"

let reason_code_summary_to_yojson (x : reason_code_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson finding_reason_code_to_yojson x.name);
      ("value", option_to_yojson summary_value_to_yojson x.value);
    ]

let reason_code_summaries_to_yojson tree = list_to_yojson reason_code_summary_to_yojson tree

let summary_to_yojson (x : summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson finding_to_yojson x.name);
      ("value", option_to_yojson summary_value_to_yojson x.value);
      ( "reasonCodeSummaries",
        option_to_yojson reason_code_summaries_to_yojson x.reason_code_summaries );
    ]

let summaries_to_yojson tree = list_to_yojson summary_to_yojson tree

let recommendation_summary_to_yojson (x : recommendation_summary) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson summaries_to_yojson x.summaries);
      ("idleSummaries", option_to_yojson idle_summaries_to_yojson x.idle_summaries);
      ( "recommendationResourceType",
        option_to_yojson recommendation_source_type_to_yojson x.recommendation_resource_type );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "idleSavingsOpportunity",
        option_to_yojson savings_opportunity_to_yojson x.idle_savings_opportunity );
      ( "aggregatedSavingsOpportunity",
        option_to_yojson savings_opportunity_to_yojson x.aggregated_savings_opportunity );
      ( "currentPerformanceRiskRatings",
        option_to_yojson current_performance_risk_ratings_to_yojson
          x.current_performance_risk_ratings );
      ( "inferredWorkloadSavings",
        option_to_yojson inferred_workload_savings_to_yojson x.inferred_workload_savings );
    ]

let recommendation_summaries_to_yojson tree = list_to_yojson recommendation_summary_to_yojson tree
let next_token_to_yojson = string_to_yojson

let get_recommendation_summaries_response_to_yojson (x : get_recommendation_summaries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "recommendationSummaries",
        option_to_yojson recommendation_summaries_to_yojson x.recommendation_summaries );
    ]

let max_results_to_yojson = int_to_yojson

let get_recommendation_summaries_request_to_yojson (x : get_recommendation_summaries_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let recommendation_preferences_detail_to_yojson (x : recommendation_preferences_detail) =
  assoc_to_yojson
    [
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let recommendation_preferences_details_to_yojson tree =
  list_to_yojson recommendation_preferences_detail_to_yojson tree

let get_recommendation_preferences_response_to_yojson (x : get_recommendation_preferences_response)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "recommendationPreferencesDetails",
        option_to_yojson recommendation_preferences_details_to_yojson
          x.recommendation_preferences_details );
    ]

let get_recommendation_preferences_request_to_yojson (x : get_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let message_to_yojson = string_to_yojson
let identifier_to_yojson = string_to_yojson

let get_recommendation_error_to_yojson (x : get_recommendation_error) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson identifier_to_yojson x.identifier);
      ("code", option_to_yojson code_to_yojson x.code);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let get_recommendation_errors_to_yojson tree =
  list_to_yojson get_recommendation_error_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let rds_savings_estimation_mode_source_to_yojson (x : rds_savings_estimation_mode_source) =
  match x with
  | PUBLIC_PRICING -> `String "PublicPricing"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"

let rds_savings_estimation_mode_to_yojson (x : rds_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson rds_savings_estimation_mode_source_to_yojson x.source) ]

let rds_effective_recommendation_preferences_to_yojson
    (x : rds_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "savingsEstimationMode",
        option_to_yojson rds_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let rdsdb_metric_statistic_to_yojson (x : rdsdb_metric_statistic) =
  match x with
  | MAXIMUM -> `String "Maximum"
  | MINIMUM -> `String "Minimum"
  | AVERAGE -> `String "Average"

let rdsdb_metric_name_to_yojson (x : rdsdb_metric_name) =
  match x with
  | CPU -> `String "CPU"
  | MEMORY -> `String "Memory"
  | EBS_VOLUME_STORAGE_SPACE_UTILIZATION -> `String "EBSVolumeStorageSpaceUtilization"
  | NETWORK_RECEIVE_THROUGHPUT -> `String "NetworkReceiveThroughput"
  | NETWORK_TRANSMIT_THROUGHPUT -> `String "NetworkTransmitThroughput"
  | EBS_VOLUME_READ_IOPS -> `String "EBSVolumeReadIOPS"
  | EBS_VOLUME_WRITE_IOPS -> `String "EBSVolumeWriteIOPS"
  | EBS_VOLUME_READ_THROUGHPUT -> `String "EBSVolumeReadThroughput"
  | EBS_VOLUME_WRITE_THROUGHPUT -> `String "EBSVolumeWriteThroughput"
  | DATABASE_CONNECTIONS -> `String "DatabaseConnections"
  | STORAGE_NETWORK_RECEIVE_THROUGHPUT -> `String "StorageNetworkReceiveThroughput"
  | STORAGE_NETWORK_TRANSMIT_THROUGHPUT -> `String "StorageNetworkTransmitThroughput"
  | AURORA_MEMORY_HEALTH_STATE -> `String "AuroraMemoryHealthState"
  | AURORA_MEMORY_NUM_DECLINED_SQL -> `String "AuroraMemoryNumDeclinedSql"
  | AURORA_MEMORY_NUM_KILL_CONN_TOTAL -> `String "AuroraMemoryNumKillConnTotal"
  | AURORA_MEMORY_NUM_KILL_QUERY_TOTAL -> `String "AuroraMemoryNumKillQueryTotal"
  | READ_IOPS_EPHEMERAL_STORAGE -> `String "ReadIOPSEphemeralStorage"
  | WRITE_IOPS_EPHEMERAL_STORAGE -> `String "WriteIOPSEphemeralStorage"
  | VOLUME_READ_IOPS -> `String "VolumeReadIOPs"
  | VOLUME_BYTES_USED -> `String "VolumeBytesUsed"
  | VOLUME_WRITE_IOPS -> `String "VolumeWriteIOPs"

let rdsdb_utilization_metric_to_yojson (x : rdsdb_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson rdsdb_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson rdsdb_metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let rdsdb_utilization_metrics_to_yojson tree =
  list_to_yojson rdsdb_utilization_metric_to_yojson tree

let rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
    (x : rds_estimated_monthly_volume_io_ps_cost_variation) =
  match x with
  | NONE -> `String "None"
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"

let rds_storage_estimated_monthly_savings_to_yojson (x : rds_storage_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let rds_storage_savings_opportunity_after_discounts_to_yojson
    (x : rds_storage_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson rds_storage_estimated_monthly_savings_to_yojson x.estimated_monthly_savings
      );
    ]

let nullable_storage_throughput_to_yojson = int_to_yojson
let nullable_max_allocated_storage_to_yojson = int_to_yojson
let nullable_iop_s_to_yojson = int_to_yojson
let storage_type_to_yojson = string_to_yojson

let db_storage_configuration_to_yojson (x : db_storage_configuration) =
  assoc_to_yojson
    [
      ("storageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("iops", option_to_yojson nullable_iop_s_to_yojson x.iops);
      ( "maxAllocatedStorage",
        option_to_yojson nullable_max_allocated_storage_to_yojson x.max_allocated_storage );
      ( "storageThroughput",
        option_to_yojson nullable_storage_throughput_to_yojson x.storage_throughput );
    ]

let rdsdb_storage_recommendation_option_to_yojson (x : rdsdb_storage_recommendation_option) =
  assoc_to_yojson
    [
      ( "storageConfiguration",
        option_to_yojson db_storage_configuration_to_yojson x.storage_configuration );
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson rds_storage_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ( "estimatedMonthlyVolumeIOPsCostVariation",
        option_to_yojson rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
          x.estimated_monthly_volume_io_ps_cost_variation );
    ]

let rdsdb_storage_recommendation_options_to_yojson tree =
  list_to_yojson rdsdb_storage_recommendation_option_to_yojson tree

let rds_instance_estimated_monthly_savings_to_yojson (x : rds_instance_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let rds_instance_savings_opportunity_after_discounts_to_yojson
    (x : rds_instance_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson rds_instance_estimated_monthly_savings_to_yojson
          x.estimated_monthly_savings );
    ]

let rdsdb_projected_utilization_metrics_to_yojson tree =
  list_to_yojson rdsdb_utilization_metric_to_yojson tree

let db_instance_class_to_yojson = string_to_yojson

let rdsdb_instance_recommendation_option_to_yojson (x : rdsdb_instance_recommendation_option) =
  assoc_to_yojson
    [
      ("dbInstanceClass", option_to_yojson db_instance_class_to_yojson x.db_instance_class);
      ( "projectedUtilizationMetrics",
        option_to_yojson rdsdb_projected_utilization_metrics_to_yojson
          x.projected_utilization_metrics );
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson rds_instance_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
    ]

let rdsdb_instance_recommendation_options_to_yojson tree =
  list_to_yojson rdsdb_instance_recommendation_option_to_yojson tree

let rds_storage_finding_reason_code_to_yojson (x : rds_storage_finding_reason_code) =
  match x with
  | EBS_VOLUME_ALLOCATED_STORAGE_UNDER_PROVISIONED ->
      `String "EBSVolumeAllocatedStorageUnderprovisioned"
  | EBS_VOLUME_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSVolumeThroughputUnderprovisioned"
  | EBS_VOLUME_IOPS_OVER_PROVISIONED -> `String "EBSVolumeIOPSOverprovisioned"
  | EBS_VOLUME_THROUGHPUT_OVER_PROVISIONED -> `String "EBSVolumeThroughputOverprovisioned"
  | NEW_GENERATION_STORAGE_TYPE_AVAILABLE -> `String "NewGenerationStorageTypeAvailable"
  | DB_CLUSTER_STORAGE_OPTION_AVAILABLE -> `String "DBClusterStorageOptionAvailable"
  | DB_CLUSTER_STORAGE_SAVINGS_AVAILABLE -> `String "DBClusterStorageSavingsAvailable"

let rds_storage_finding_reason_codes_to_yojson tree =
  list_to_yojson rds_storage_finding_reason_code_to_yojson tree

let rds_current_instance_performance_risk_to_yojson (x : rds_current_instance_performance_risk) =
  match x with
  | VERY_LOW -> `String "VeryLow"
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"

let rds_instance_finding_reason_code_to_yojson (x : rds_instance_finding_reason_code) =
  match x with
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NetworkBandwidthOverprovisioned"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBSIOPSOverprovisioned"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBSIOPSUnderprovisioned"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBSThroughputOverprovisioned"
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NetworkBandwidthUnderprovisioned"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSThroughputUnderprovisioned"
  | NEW_GENERATION_DB_INSTANCE_CLASS_AVAILABLE -> `String "NewGenerationDBInstanceClassAvailable"
  | NEW_ENGINE_VERSION_AVAILABLE -> `String "NewEngineVersionAvailable"
  | DB_CLUSTER_WRITER_UNDER_PROVISIONED -> `String "DBClusterWriterUnderprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | INSTANCE_STORAGE_READ_IOPS_UNDER_PROVISIONED ->
      `String "InstanceStorageReadIOPSUnderprovisioned"
  | INSTANCE_STORAGE_WRITE_IOPS_UNDER_PROVISIONED ->
      `String "InstanceStorageWriteIOPSUnderprovisioned"

let rds_instance_finding_reason_codes_to_yojson tree =
  list_to_yojson rds_instance_finding_reason_code_to_yojson tree

let rds_storage_finding_to_yojson (x : rds_storage_finding) =
  match x with
  | OPTIMIZED -> `String "Optimized"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | NOT_OPTIMIZED -> `String "NotOptimized"

let rds_instance_finding_to_yojson (x : rds_instance_finding) =
  match x with
  | OPTIMIZED -> `String "Optimized"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OVER_PROVISIONED -> `String "Overprovisioned"

let idle_to_yojson (x : idle) = match x with TRUE -> `String "True" | FALSE -> `String "False"
let db_cluster_identifier_to_yojson = string_to_yojson
let current_db_instance_class_to_yojson = string_to_yojson
let promotion_tier_to_yojson = int_to_yojson
let engine_version_to_yojson = string_to_yojson
let engine_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let rdsdb_recommendation_to_yojson (x : rdsdb_recommendation) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("engine", option_to_yojson engine_to_yojson x.engine);
      ("engineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("promotionTier", option_to_yojson promotion_tier_to_yojson x.promotion_tier);
      ( "currentDBInstanceClass",
        option_to_yojson current_db_instance_class_to_yojson x.current_db_instance_class );
      ( "currentStorageConfiguration",
        option_to_yojson db_storage_configuration_to_yojson x.current_storage_configuration );
      ( "dbClusterIdentifier",
        option_to_yojson db_cluster_identifier_to_yojson x.db_cluster_identifier );
      ("idle", option_to_yojson idle_to_yojson x.idle);
      ("instanceFinding", option_to_yojson rds_instance_finding_to_yojson x.instance_finding);
      ("storageFinding", option_to_yojson rds_storage_finding_to_yojson x.storage_finding);
      ( "instanceFindingReasonCodes",
        option_to_yojson rds_instance_finding_reason_codes_to_yojson x.instance_finding_reason_codes
      );
      ( "currentInstancePerformanceRisk",
        option_to_yojson rds_current_instance_performance_risk_to_yojson
          x.current_instance_performance_risk );
      ( "currentStorageEstimatedMonthlyVolumeIOPsCostVariation",
        option_to_yojson rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
          x.current_storage_estimated_monthly_volume_io_ps_cost_variation );
      ( "storageFindingReasonCodes",
        option_to_yojson rds_storage_finding_reason_codes_to_yojson x.storage_finding_reason_codes
      );
      ( "instanceRecommendationOptions",
        option_to_yojson rdsdb_instance_recommendation_options_to_yojson
          x.instance_recommendation_options );
      ( "storageRecommendationOptions",
        option_to_yojson rdsdb_storage_recommendation_options_to_yojson
          x.storage_recommendation_options );
      ( "utilizationMetrics",
        option_to_yojson rdsdb_utilization_metrics_to_yojson x.utilization_metrics );
      ( "effectiveRecommendationPreferences",
        option_to_yojson rds_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let rdsdb_recommendations_to_yojson tree = list_to_yojson rdsdb_recommendation_to_yojson tree

let get_rds_database_recommendations_response_to_yojson
    (x : get_rds_database_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "rdsDBRecommendations",
        option_to_yojson rdsdb_recommendations_to_yojson x.rds_db_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let recommendation_preferences_to_yojson (x : recommendation_preferences) =
  assoc_to_yojson
    [
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
    ]

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let rdsdb_recommendation_filter_name_to_yojson (x : rdsdb_recommendation_filter_name) =
  match x with
  | INSTANCE_FINDING -> `String "InstanceFinding"
  | INSTANCE_FINDING_REASON_CODE -> `String "InstanceFindingReasonCode"
  | STORAGE_FINDING -> `String "StorageFinding"
  | STORAGE_FINDING_REASON_CODE -> `String "StorageFindingReasonCode"
  | IDLE -> `String "Idle"

let rdsdb_recommendation_filter_to_yojson (x : rdsdb_recommendation_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson rdsdb_recommendation_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let rdsdb_recommendation_filters_to_yojson tree =
  list_to_yojson rdsdb_recommendation_filter_to_yojson tree

let resource_arns_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let get_rds_database_recommendations_request_to_yojson
    (x : get_rds_database_recommendations_request) =
  assoc_to_yojson
    [
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson rdsdb_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let metric_values_to_yojson tree = list_to_yojson metric_value_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let timestamps_to_yojson tree = list_to_yojson timestamp_to_yojson tree

let rds_database_projected_metric_to_yojson (x : rds_database_projected_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson rdsdb_metric_name_to_yojson x.name);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("values", option_to_yojson metric_values_to_yojson x.values);
    ]

let rds_database_projected_metrics_to_yojson tree =
  list_to_yojson rds_database_projected_metric_to_yojson tree

let recommended_db_instance_class_to_yojson = string_to_yojson

let rds_database_recommended_option_projected_metric_to_yojson
    (x : rds_database_recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ( "recommendedDBInstanceClass",
        option_to_yojson recommended_db_instance_class_to_yojson x.recommended_db_instance_class );
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ( "projectedMetrics",
        option_to_yojson rds_database_projected_metrics_to_yojson x.projected_metrics );
    ]

let rds_database_recommended_option_projected_metrics_to_yojson tree =
  list_to_yojson rds_database_recommended_option_projected_metric_to_yojson tree

let get_rds_database_recommendation_projected_metrics_response_to_yojson
    (x : get_rds_database_recommendation_projected_metrics_response) =
  assoc_to_yojson
    [
      ( "recommendedOptionProjectedMetrics",
        option_to_yojson rds_database_recommended_option_projected_metrics_to_yojson
          x.recommended_option_projected_metrics );
    ]

let period_to_yojson = int_to_yojson

let get_rds_database_recommendation_projected_metrics_request_to_yojson
    (x : get_rds_database_recommendation_projected_metrics_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("period", Some (period_to_yojson x.period));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let license_model_to_yojson (x : license_model) =
  match x with
  | LICENSE_INCLUDED -> `String "LicenseIncluded"
  | BRING_YOUR_OWN_LICENSE -> `String "BringYourOwnLicense"

let license_edition_to_yojson (x : license_edition) =
  match x with
  | ENTERPRISE -> `String "Enterprise"
  | STANDARD -> `String "Standard"
  | FREE -> `String "Free"
  | NO_LICENSE_EDITION_FOUND -> `String "NoLicenseEditionFound"

let operating_system_to_yojson = string_to_yojson

let license_recommendation_option_to_yojson (x : license_recommendation_option) =
  assoc_to_yojson
    [
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("licenseEdition", option_to_yojson license_edition_to_yojson x.license_edition);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
    ]

let license_recommendation_options_to_yojson tree =
  list_to_yojson license_recommendation_option_to_yojson tree

let license_finding_reason_code_to_yojson (x : license_finding_reason_code) =
  match x with
  | CW_APP_INSIGHTS_DISABLED -> `String "InvalidCloudWatchApplicationInsightsSetup"
  | CW_APP_INSIGHTS_ERROR -> `String "CloudWatchApplicationInsightsError"
  | LICENSE_OVER_PROVISIONED -> `String "LicenseOverprovisioned"
  | OPTIMIZED -> `String "Optimized"

let license_finding_reason_codes_to_yojson tree =
  list_to_yojson license_finding_reason_code_to_yojson tree

let license_finding_to_yojson (x : license_finding) =
  match x with
  | INSUFFICIENT_METRICS -> `String "InsufficientMetrics"
  | OPTIMIZED -> `String "Optimized"
  | NOT_OPTIMIZED -> `String "NotOptimized"

let metric_provider_arn_to_yojson = string_to_yojson

let metric_source_provider_to_yojson (x : metric_source_provider) =
  match x with CloudWatchAppInsights -> `String "CloudWatchApplicationInsights"

let metric_source_to_yojson (x : metric_source) =
  assoc_to_yojson
    [
      ("provider", option_to_yojson metric_source_provider_to_yojson x.provider);
      ("providerArn", option_to_yojson metric_provider_arn_to_yojson x.provider_arn);
    ]

let metrics_source_to_yojson tree = list_to_yojson metric_source_to_yojson tree
let license_version_to_yojson = string_to_yojson
let license_name_to_yojson (x : license_name) = match x with SQLSERVER -> `String "SQLServer"
let instance_type_to_yojson = string_to_yojson
let number_of_cores_to_yojson = int_to_yojson

let license_configuration_to_yojson (x : license_configuration) =
  assoc_to_yojson
    [
      ("numberOfCores", option_to_yojson number_of_cores_to_yojson x.number_of_cores);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("licenseEdition", option_to_yojson license_edition_to_yojson x.license_edition);
      ("licenseName", option_to_yojson license_name_to_yojson x.license_name);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("licenseVersion", option_to_yojson license_version_to_yojson x.license_version);
      ("metricsSource", option_to_yojson metrics_source_to_yojson x.metrics_source);
    ]

let license_recommendation_to_yojson (x : license_recommendation) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "currentLicenseConfiguration",
        option_to_yojson license_configuration_to_yojson x.current_license_configuration );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("finding", option_to_yojson license_finding_to_yojson x.finding);
      ( "findingReasonCodes",
        option_to_yojson license_finding_reason_codes_to_yojson x.finding_reason_codes );
      ( "licenseRecommendationOptions",
        option_to_yojson license_recommendation_options_to_yojson x.license_recommendation_options
      );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let license_recommendations_to_yojson tree = list_to_yojson license_recommendation_to_yojson tree

let get_license_recommendations_response_to_yojson (x : get_license_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "licenseRecommendations",
        option_to_yojson license_recommendations_to_yojson x.license_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let license_recommendation_filter_name_to_yojson (x : license_recommendation_filter_name) =
  match x with
  | LICENSE_FINDING -> `String "Finding"
  | LICENSE_FINDING_REASON_CODE -> `String "FindingReasonCode"
  | LICENSE_NAME -> `String "LicenseName"

let license_recommendation_filter_to_yojson (x : license_recommendation_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson license_recommendation_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let license_recommendation_filters_to_yojson tree =
  list_to_yojson license_recommendation_filter_to_yojson tree

let get_license_recommendations_request_to_yojson (x : get_license_recommendations_request) =
  assoc_to_yojson
    [
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson license_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let lambda_savings_estimation_mode_source_to_yojson (x : lambda_savings_estimation_mode_source) =
  match x with
  | PUBLIC_PRICING -> `String "PublicPricing"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"

let lambda_savings_estimation_mode_to_yojson (x : lambda_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson lambda_savings_estimation_mode_source_to_yojson x.source) ]

let lambda_effective_recommendation_preferences_to_yojson
    (x : lambda_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson lambda_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let lambda_estimated_monthly_savings_to_yojson (x : lambda_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let lambda_savings_opportunity_after_discounts_to_yojson
    (x : lambda_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson lambda_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let lambda_function_memory_metric_statistic_to_yojson (x : lambda_function_memory_metric_statistic)
    =
  match x with
  | LOWER_BOUND -> `String "LowerBound"
  | UPPER_BOUND -> `String "UpperBound"
  | EXPECTED -> `String "Expected"

let lambda_function_memory_metric_name_to_yojson (x : lambda_function_memory_metric_name) =
  match x with DURATION -> `String "Duration"

let lambda_function_memory_projected_metric_to_yojson (x : lambda_function_memory_projected_metric)
    =
  assoc_to_yojson
    [
      ("name", option_to_yojson lambda_function_memory_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson lambda_function_memory_metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let lambda_function_memory_projected_metrics_to_yojson tree =
  list_to_yojson lambda_function_memory_projected_metric_to_yojson tree

let memory_size_to_yojson = int_to_yojson

let lambda_function_memory_recommendation_option_to_yojson
    (x : lambda_function_memory_recommendation_option) =
  assoc_to_yojson
    [
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("memorySize", option_to_yojson memory_size_to_yojson x.memory_size);
      ( "projectedUtilizationMetrics",
        option_to_yojson lambda_function_memory_projected_metrics_to_yojson
          x.projected_utilization_metrics );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson lambda_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
    ]

let lambda_function_memory_recommendation_options_to_yojson tree =
  list_to_yojson lambda_function_memory_recommendation_option_to_yojson tree

let lambda_function_recommendation_finding_reason_code_to_yojson
    (x : lambda_function_recommendation_finding_reason_code) =
  match x with
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | INSUFFICIENT_DATA -> `String "InsufficientData"
  | INCONCLUSIVE -> `String "Inconclusive"

let lambda_function_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson lambda_function_recommendation_finding_reason_code_to_yojson tree

let lambda_function_recommendation_finding_to_yojson (x : lambda_function_recommendation_finding) =
  match x with
  | OPTIMIZED -> `String "Optimized"
  | NOT_OPTIMIZED -> `String "NotOptimized"
  | UNAVAILABLE -> `String "Unavailable"

let lambda_function_metric_statistic_to_yojson (x : lambda_function_metric_statistic) =
  match x with MAXIMUM -> `String "Maximum" | AVERAGE -> `String "Average"

let lambda_function_metric_name_to_yojson (x : lambda_function_metric_name) =
  match x with DURATION -> `String "Duration" | MEMORY -> `String "Memory"

let lambda_function_utilization_metric_to_yojson (x : lambda_function_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson lambda_function_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson lambda_function_metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let lambda_function_utilization_metrics_to_yojson tree =
  list_to_yojson lambda_function_utilization_metric_to_yojson tree

let number_of_invocations_to_yojson = long_to_yojson
let function_version_to_yojson = string_to_yojson
let function_arn_to_yojson = string_to_yojson

let lambda_function_recommendation_to_yojson (x : lambda_function_recommendation) =
  assoc_to_yojson
    [
      ("functionArn", option_to_yojson function_arn_to_yojson x.function_arn);
      ("functionVersion", option_to_yojson function_version_to_yojson x.function_version);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("currentMemorySize", option_to_yojson memory_size_to_yojson x.current_memory_size);
      ( "numberOfInvocations",
        option_to_yojson number_of_invocations_to_yojson x.number_of_invocations );
      ( "utilizationMetrics",
        option_to_yojson lambda_function_utilization_metrics_to_yojson x.utilization_metrics );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("finding", option_to_yojson lambda_function_recommendation_finding_to_yojson x.finding);
      ( "findingReasonCodes",
        option_to_yojson lambda_function_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ( "memorySizeRecommendationOptions",
        option_to_yojson lambda_function_memory_recommendation_options_to_yojson
          x.memory_size_recommendation_options );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "effectiveRecommendationPreferences",
        option_to_yojson lambda_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let lambda_function_recommendations_to_yojson tree =
  list_to_yojson lambda_function_recommendation_to_yojson tree

let get_lambda_function_recommendations_response_to_yojson
    (x : get_lambda_function_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "lambdaFunctionRecommendations",
        option_to_yojson lambda_function_recommendations_to_yojson x.lambda_function_recommendations
      );
    ]

let lambda_function_recommendation_filter_name_to_yojson
    (x : lambda_function_recommendation_filter_name) =
  match x with FINDING -> `String "Finding" | FINDING_REASON_CODE -> `String "FindingReasonCode"

let lambda_function_recommendation_filter_to_yojson (x : lambda_function_recommendation_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson lambda_function_recommendation_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let lambda_function_recommendation_filters_to_yojson tree =
  list_to_yojson lambda_function_recommendation_filter_to_yojson tree

let function_arns_to_yojson tree = list_to_yojson function_arn_to_yojson tree

let get_lambda_function_recommendations_request_to_yojson
    (x : get_lambda_function_recommendations_request) =
  assoc_to_yojson
    [
      ("functionArns", option_to_yojson function_arns_to_yojson x.function_arns);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson lambda_function_recommendation_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let idle_recommendation_resource_type_to_yojson (x : idle_recommendation_resource_type) =
  match x with
  | EC2_INSTANCE -> `String "EC2Instance"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EBS_VOLUME -> `String "EBSVolume"
  | ECS_SERVICE -> `String "ECSService"
  | RDS_DB_INSTANCE -> `String "RDSDBInstance"
  | NAT_GATEWAY -> `String "NatGateway"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | WORKSPACES -> `String "WorkSpaces"
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"

let idle_recommendation_error_to_yojson (x : idle_recommendation_error) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson identifier_to_yojson x.identifier);
      ("code", option_to_yojson code_to_yojson x.code);
      ("message", option_to_yojson message_to_yojson x.message);
      ("resourceType", option_to_yojson idle_recommendation_resource_type_to_yojson x.resource_type);
    ]

let idle_recommendation_errors_to_yojson tree =
  list_to_yojson idle_recommendation_error_to_yojson tree

let idle_dimension_value_to_yojson = string_to_yojson
let idle_dimension_values_to_yojson tree = list_to_yojson idle_dimension_value_to_yojson tree
let idle_dimension_key_to_yojson = string_to_yojson

let idle_dimension_to_yojson (x : idle_dimension) =
  assoc_to_yojson
    [
      ("key", option_to_yojson idle_dimension_key_to_yojson x.key);
      ("values", option_to_yojson idle_dimension_values_to_yojson x.values);
    ]

let idle_dimensions_to_yojson tree = list_to_yojson idle_dimension_to_yojson tree

let idle_metric_name_to_yojson (x : idle_metric_name) =
  match x with
  | CPU -> `String "CPU"
  | MEMORY -> `String "Memory"
  | NETWORK_OUT_BYTES_PER_SECOND -> `String "NetworkOutBytesPerSecond"
  | NETWORK_IN_BYTES_PER_SECOND -> `String "NetworkInBytesPerSecond"
  | DATABASE_CONNECTIONS -> `String "DatabaseConnections"
  | EBS_VOLUME_READ_IOPS -> `String "EBSVolumeReadIOPS"
  | EBS_VOLUME_WRITE_IOPS -> `String "EBSVolumeWriteIOPS"
  | VOLUME_READ_OPS_PER_SECOND -> `String "VolumeReadOpsPerSecond"
  | VOLUME_WRITE_OPS_PER_SECOND -> `String "VolumeWriteOpsPerSecond"
  | ACTIVE_CONNECTION_COUNT -> `String "ActiveConnectionCount"
  | PACKETS_IN_FROM_SOURCE -> `String "PacketsInFromSource"
  | PACKETS_IN_FROM_DESTINATION -> `String "PacketsInFromDestination"
  | CONSUMED_READ_CAPACITY_UNITS -> `String "ConsumedReadCapacityUnits"
  | CONSUMED_WRITE_CAPACITY_UNITS -> `String "ConsumedWriteCapacityUnits"
  | CONSUMED_CHANGE_DATA_CAPTURE_UNITS -> `String "ConsumedChangeDataCaptureUnits"
  | NEW_CONNECTIONS -> `String "NewConnections"
  | ENGINE_CPU_UTILIZATION -> `String "EngineCPUUtilization"
  | CACHE_HITS -> `String "CacheHits"
  | CACHE_MISSES -> `String "CacheMisses"
  | KEYSPACE_HITS -> `String "KeyspaceHits"
  | KEYSPACE_MISSES -> `String "KeyspaceMisses"
  | IS_IDLE -> `String "IsIdle"
  | USER_CONNECTED -> `String "UserConnected"
  | INVOCATIONS -> `String "Invocations"
  | GET_TYPE_CMDS -> `String "GetTypeCmds"
  | SET_TYPE_CMDS -> `String "SetTypeCmds"
  | ELASTI_CACHE_PROCESSING_UNITS -> `String "ElastiCacheProcessingUnits"
  | CURR_CONNECTIONS -> `String "CurrConnections"

let idle_utilization_metric_to_yojson (x : idle_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson idle_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("dimensions", option_to_yojson idle_dimensions_to_yojson x.dimensions);
    ]

let idle_utilization_metrics_to_yojson tree = list_to_yojson idle_utilization_metric_to_yojson tree

let idle_estimated_monthly_savings_to_yojson (x : idle_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let idle_savings_opportunity_after_discounts_to_yojson
    (x : idle_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson idle_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let idle_savings_opportunity_to_yojson (x : idle_savings_opportunity) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson idle_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let idle_finding_description_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson

let idle_recommendation_to_yojson (x : idle_recommendation) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceType", option_to_yojson idle_recommendation_resource_type_to_yojson x.resource_type);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("finding", option_to_yojson idle_finding_to_yojson x.finding);
      ( "findingDescription",
        option_to_yojson idle_finding_description_to_yojson x.finding_description );
      ( "savingsOpportunity",
        option_to_yojson idle_savings_opportunity_to_yojson x.savings_opportunity );
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson idle_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ( "utilizationMetrics",
        option_to_yojson idle_utilization_metrics_to_yojson x.utilization_metrics );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let idle_recommendations_to_yojson tree = list_to_yojson idle_recommendation_to_yojson tree

let get_idle_recommendations_response_to_yojson (x : get_idle_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("idleRecommendations", option_to_yojson idle_recommendations_to_yojson x.idle_recommendations);
      ("errors", option_to_yojson idle_recommendation_errors_to_yojson x.errors);
    ]

let order_to_yojson (x : order) = match x with ASC -> `String "Asc" | DESC -> `String "Desc"

let dimension_to_yojson (x : dimension) =
  match x with
  | SAVINGS_VALUE -> `String "SavingsValue"
  | SAVINGS_VALUE_AFTER_DISCOUNT -> `String "SavingsValueAfterDiscount"

let order_by_to_yojson (x : order_by) =
  assoc_to_yojson
    [
      ("dimension", option_to_yojson dimension_to_yojson x.dimension);
      ("order", option_to_yojson order_to_yojson x.order);
    ]

let idle_recommendation_filter_name_to_yojson (x : idle_recommendation_filter_name) =
  match x with FINDING -> `String "Finding" | RESOURCE_TYPE -> `String "ResourceType"

let idle_recommendation_filter_to_yojson (x : idle_recommendation_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson idle_recommendation_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let idle_recommendation_filters_to_yojson tree =
  list_to_yojson idle_recommendation_filter_to_yojson tree

let idle_max_results_to_yojson = int_to_yojson

let get_idle_recommendations_request_to_yojson (x : get_idle_recommendations_request) =
  assoc_to_yojson
    [
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson idle_max_results_to_yojson x.max_results);
      ("filters", option_to_yojson idle_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
    ]

let get_enrollment_statuses_for_organization_response_to_yojson
    (x : get_enrollment_statuses_for_organization_response) =
  assoc_to_yojson
    [
      ( "accountEnrollmentStatuses",
        option_to_yojson account_enrollment_statuses_to_yojson x.account_enrollment_statuses );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let enrollment_filter_name_to_yojson (x : enrollment_filter_name) =
  match x with STATUS -> `String "Status"

let enrollment_filter_to_yojson (x : enrollment_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson enrollment_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let enrollment_filters_to_yojson tree = list_to_yojson enrollment_filter_to_yojson tree

let get_enrollment_statuses_for_organization_request_to_yojson
    (x : get_enrollment_statuses_for_organization_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson enrollment_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let number_of_member_accounts_opted_in_to_yojson = int_to_yojson
let member_accounts_enrolled_to_yojson = bool_to_yojson

let get_enrollment_status_response_to_yojson (x : get_enrollment_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
      ( "memberAccountsEnrolled",
        option_to_yojson member_accounts_enrolled_to_yojson x.member_accounts_enrolled );
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
      ( "numberOfMemberAccountsOptedIn",
        option_to_yojson number_of_member_accounts_opted_in_to_yojson
          x.number_of_member_accounts_opted_in );
    ]

let get_enrollment_status_request_to_yojson = unit_to_yojson

let get_effective_recommendation_preferences_response_to_yojson
    (x : get_effective_recommendation_preferences_response) =
  assoc_to_yojson
    [
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
    ]

let get_effective_recommendation_preferences_request_to_yojson
    (x : get_effective_recommendation_preferences_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let ecs_savings_estimation_mode_source_to_yojson (x : ecs_savings_estimation_mode_source) =
  match x with
  | PUBLIC_PRICING -> `String "PublicPricing"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"

let ecs_savings_estimation_mode_to_yojson (x : ecs_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson ecs_savings_estimation_mode_source_to_yojson x.source) ]

let ecs_effective_recommendation_preferences_to_yojson
    (x : ecs_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson ecs_savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
    ]

let nullable_cpu_to_yojson = int_to_yojson
let nullable_memory_reservation_to_yojson = int_to_yojson
let nullable_memory_to_yojson = int_to_yojson

let memory_size_configuration_to_yojson (x : memory_size_configuration) =
  assoc_to_yojson
    [
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
      ( "memoryReservation",
        option_to_yojson nullable_memory_reservation_to_yojson x.memory_reservation );
    ]

let container_name_to_yojson = string_to_yojson

let container_recommendation_to_yojson (x : container_recommendation) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson container_name_to_yojson x.container_name);
      ( "memorySizeConfiguration",
        option_to_yojson memory_size_configuration_to_yojson x.memory_size_configuration );
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
    ]

let container_recommendations_to_yojson tree =
  list_to_yojson container_recommendation_to_yojson tree

let upper_bound_value_to_yojson = double_to_yojson
let lower_bound_value_to_yojson = double_to_yojson

let ecs_service_metric_statistic_to_yojson (x : ecs_service_metric_statistic) =
  match x with MAXIMUM -> `String "Maximum" | AVERAGE -> `String "Average"

let ecs_service_metric_name_to_yojson (x : ecs_service_metric_name) =
  match x with CPU -> `String "Cpu" | MEMORY -> `String "Memory"

let ecs_service_projected_utilization_metric_to_yojson
    (x : ecs_service_projected_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson ecs_service_metric_statistic_to_yojson x.statistic);
      ("lowerBoundValue", option_to_yojson lower_bound_value_to_yojson x.lower_bound_value);
      ("upperBoundValue", option_to_yojson upper_bound_value_to_yojson x.upper_bound_value);
    ]

let ecs_service_projected_utilization_metrics_to_yojson tree =
  list_to_yojson ecs_service_projected_utilization_metric_to_yojson tree

let ecs_estimated_monthly_savings_to_yojson (x : ecs_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let ecs_savings_opportunity_after_discounts_to_yojson (x : ecs_savings_opportunity_after_discounts)
    =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson ecs_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let ecs_service_recommendation_option_to_yojson (x : ecs_service_recommendation_option) =
  assoc_to_yojson
    [
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson ecs_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ( "projectedUtilizationMetrics",
        option_to_yojson ecs_service_projected_utilization_metrics_to_yojson
          x.projected_utilization_metrics );
      ( "containerRecommendations",
        option_to_yojson container_recommendations_to_yojson x.container_recommendations );
    ]

let ecs_service_recommendation_options_to_yojson tree =
  list_to_yojson ecs_service_recommendation_option_to_yojson tree

let ecs_service_recommendation_finding_reason_code_to_yojson
    (x : ecs_service_recommendation_finding_reason_code) =
  match x with
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"

let ecs_service_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson ecs_service_recommendation_finding_reason_code_to_yojson tree

let ecs_service_recommendation_finding_to_yojson (x : ecs_service_recommendation_finding) =
  match x with
  | OPTIMIZED -> `String "Optimized"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OVER_PROVISIONED -> `String "Overprovisioned"

let ecs_service_launch_type_to_yojson (x : ecs_service_launch_type) =
  match x with EC2 -> `String "EC2" | FARGATE -> `String "Fargate"

let ecs_service_utilization_metric_to_yojson (x : ecs_service_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson ecs_service_metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let ecs_service_utilization_metrics_to_yojson tree =
  list_to_yojson ecs_service_utilization_metric_to_yojson tree

let task_definition_arn_to_yojson = string_to_yojson

let container_configuration_to_yojson (x : container_configuration) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson container_name_to_yojson x.container_name);
      ( "memorySizeConfiguration",
        option_to_yojson memory_size_configuration_to_yojson x.memory_size_configuration );
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
    ]

let container_configurations_to_yojson tree = list_to_yojson container_configuration_to_yojson tree

let service_configuration_to_yojson (x : service_configuration) =
  assoc_to_yojson
    [
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ( "containerConfigurations",
        option_to_yojson container_configurations_to_yojson x.container_configurations );
      ( "autoScalingConfiguration",
        option_to_yojson auto_scaling_configuration_to_yojson x.auto_scaling_configuration );
      ("taskDefinitionArn", option_to_yojson task_definition_arn_to_yojson x.task_definition_arn);
    ]

let service_arn_to_yojson = string_to_yojson

let ecs_service_recommendation_to_yojson (x : ecs_service_recommendation) =
  assoc_to_yojson
    [
      ("serviceArn", option_to_yojson service_arn_to_yojson x.service_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "currentServiceConfiguration",
        option_to_yojson service_configuration_to_yojson x.current_service_configuration );
      ( "utilizationMetrics",
        option_to_yojson ecs_service_utilization_metrics_to_yojson x.utilization_metrics );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ("launchType", option_to_yojson ecs_service_launch_type_to_yojson x.launch_type);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("finding", option_to_yojson ecs_service_recommendation_finding_to_yojson x.finding);
      ( "findingReasonCodes",
        option_to_yojson ecs_service_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ( "serviceRecommendationOptions",
        option_to_yojson ecs_service_recommendation_options_to_yojson
          x.service_recommendation_options );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "effectiveRecommendationPreferences",
        option_to_yojson ecs_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let ecs_service_recommendations_to_yojson tree =
  list_to_yojson ecs_service_recommendation_to_yojson tree

let get_ecs_service_recommendations_response_to_yojson
    (x : get_ecs_service_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ecsServiceRecommendations",
        option_to_yojson ecs_service_recommendations_to_yojson x.ecs_service_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let ecs_service_recommendation_filter_name_to_yojson (x : ecs_service_recommendation_filter_name) =
  match x with FINDING -> `String "Finding" | FINDING_REASON_CODE -> `String "FindingReasonCode"

let ecs_service_recommendation_filter_to_yojson (x : ecs_service_recommendation_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ecs_service_recommendation_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let ecs_service_recommendation_filters_to_yojson tree =
  list_to_yojson ecs_service_recommendation_filter_to_yojson tree

let service_arns_to_yojson tree = list_to_yojson service_arn_to_yojson tree

let get_ecs_service_recommendations_request_to_yojson (x : get_ecs_service_recommendations_request)
    =
  assoc_to_yojson
    [
      ("serviceArns", option_to_yojson service_arns_to_yojson x.service_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson ecs_service_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let ecs_service_projected_metric_to_yojson (x : ecs_service_projected_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("upperBoundValues", option_to_yojson metric_values_to_yojson x.upper_bound_values);
      ("lowerBoundValues", option_to_yojson metric_values_to_yojson x.lower_bound_values);
    ]

let ecs_service_projected_metrics_to_yojson tree =
  list_to_yojson ecs_service_projected_metric_to_yojson tree

let cpu_size_to_yojson = int_to_yojson

let ecs_service_recommended_option_projected_metric_to_yojson
    (x : ecs_service_recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ("recommendedCpuUnits", option_to_yojson cpu_size_to_yojson x.recommended_cpu_units);
      ("recommendedMemorySize", option_to_yojson memory_size_to_yojson x.recommended_memory_size);
      ( "projectedMetrics",
        option_to_yojson ecs_service_projected_metrics_to_yojson x.projected_metrics );
    ]

let ecs_service_recommended_option_projected_metrics_to_yojson tree =
  list_to_yojson ecs_service_recommended_option_projected_metric_to_yojson tree

let get_ecs_service_recommendation_projected_metrics_response_to_yojson
    (x : get_ecs_service_recommendation_projected_metrics_response) =
  assoc_to_yojson
    [
      ( "recommendedOptionProjectedMetrics",
        option_to_yojson ecs_service_recommended_option_projected_metrics_to_yojson
          x.recommended_option_projected_metrics );
    ]

let get_ecs_service_recommendation_projected_metrics_request_to_yojson
    (x : get_ecs_service_recommendation_projected_metrics_request) =
  assoc_to_yojson
    [
      ("serviceArn", Some (service_arn_to_yojson x.service_arn));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("period", Some (period_to_yojson x.period));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
    ]

let projected_metric_to_yojson (x : projected_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson metric_name_to_yojson x.name);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("values", option_to_yojson metric_values_to_yojson x.values);
    ]

let projected_metrics_to_yojson tree = list_to_yojson projected_metric_to_yojson tree
let recommended_instance_type_to_yojson = string_to_yojson

let recommended_option_projected_metric_to_yojson (x : recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ( "recommendedInstanceType",
        option_to_yojson recommended_instance_type_to_yojson x.recommended_instance_type );
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("projectedMetrics", option_to_yojson projected_metrics_to_yojson x.projected_metrics);
    ]

let recommended_option_projected_metrics_to_yojson tree =
  list_to_yojson recommended_option_projected_metric_to_yojson tree

let get_ec2_recommendation_projected_metrics_response_to_yojson
    (x : get_ec2_recommendation_projected_metrics_response) =
  assoc_to_yojson
    [
      ( "recommendedOptionProjectedMetrics",
        option_to_yojson recommended_option_projected_metrics_to_yojson
          x.recommended_option_projected_metrics );
    ]

let instance_arn_to_yojson = string_to_yojson

let get_ec2_recommendation_projected_metrics_request_to_yojson
    (x : get_ec2_recommendation_projected_metrics_request) =
  assoc_to_yojson
    [
      ("instanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("period", Some (period_to_yojson x.period));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let instance_idle_to_yojson (x : instance_idle) =
  match x with TRUE -> `String "True" | FALSE -> `String "False"

let external_metric_status_reason_to_yojson = string_to_yojson

let external_metric_status_code_to_yojson (x : external_metric_status_code) =
  match x with
  | NO_EXTERNAL_METRIC_SET -> `String "NO_EXTERNAL_METRIC_SET"
  | INTEGRATION_SUCCESS -> `String "INTEGRATION_SUCCESS"
  | DATADOG_INTEGRATION_ERROR -> `String "DATADOG_INTEGRATION_ERROR"
  | DYNATRACE_INTEGRATION_ERROR -> `String "DYNATRACE_INTEGRATION_ERROR"
  | NEWRELIC_INTEGRATION_ERROR -> `String "NEWRELIC_INTEGRATION_ERROR"
  | INSTANA_INTEGRATION_ERROR -> `String "INSTANA_INTEGRATION_ERROR"
  | INSUFFICIENT_DATADOG_METRICS -> `String "INSUFFICIENT_DATADOG_METRICS"
  | INSUFFICIENT_DYNATRACE_METRICS -> `String "INSUFFICIENT_DYNATRACE_METRICS"
  | INSUFFICIENT_NEWRELIC_METRICS -> `String "INSUFFICIENT_NEWRELIC_METRICS"
  | INSUFFICIENT_INSTANA_METRICS -> `String "INSUFFICIENT_INSTANA_METRICS"

let external_metric_status_to_yojson (x : external_metric_status) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson external_metric_status_code_to_yojson x.status_code);
      ("statusReason", option_to_yojson external_metric_status_reason_to_yojson x.status_reason);
    ]

let instance_state_to_yojson (x : instance_state) =
  match x with
  | PENDING -> `String "pending"
  | RUNNING -> `String "running"
  | SHUTTING_DOWN -> `String "shutting-down"
  | TERMINATED -> `String "terminated"
  | STOPPING -> `String "stopping"
  | STOPPED -> `String "stopped"

let recommendation_source_arn_to_yojson = string_to_yojson

let recommendation_source_to_yojson (x : recommendation_source) =
  assoc_to_yojson
    [
      ( "recommendationSourceArn",
        option_to_yojson recommendation_source_arn_to_yojson x.recommendation_source_arn );
      ( "recommendationSourceType",
        option_to_yojson recommendation_source_type_to_yojson x.recommendation_source_type );
    ]

let recommendation_sources_to_yojson tree = list_to_yojson recommendation_source_to_yojson tree

let instance_estimated_monthly_savings_to_yojson (x : instance_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let instance_savings_opportunity_after_discounts_to_yojson
    (x : instance_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson instance_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let platform_difference_to_yojson (x : platform_difference) =
  match x with
  | HYPERVISOR -> `String "Hypervisor"
  | NETWORK_INTERFACE -> `String "NetworkInterface"
  | STORAGE_INTERFACE -> `String "StorageInterface"
  | INSTANCE_STORE_AVAILABILITY -> `String "InstanceStoreAvailability"
  | VIRTUALIZATION_TYPE -> `String "VirtualizationType"
  | ARCHITECTURE -> `String "Architecture"

let platform_differences_to_yojson tree = list_to_yojson platform_difference_to_yojson tree

let instance_recommendation_option_to_yojson (x : instance_recommendation_option) =
  assoc_to_yojson
    [
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("instanceGpuInfo", option_to_yojson gpu_info_to_yojson x.instance_gpu_info);
      ( "projectedUtilizationMetrics",
        option_to_yojson projected_utilization_metrics_to_yojson x.projected_utilization_metrics );
      ("platformDifferences", option_to_yojson platform_differences_to_yojson x.platform_differences);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson instance_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("migrationEffort", option_to_yojson migration_effort_to_yojson x.migration_effort);
    ]

let recommendation_options_to_yojson tree =
  list_to_yojson instance_recommendation_option_to_yojson tree

let instance_recommendation_finding_reason_code_to_yojson
    (x : instance_recommendation_finding_reason_code) =
  match x with
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBSThroughputOverprovisioned"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSThroughputUnderprovisioned"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBSIOPSOverprovisioned"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBSIOPSUnderprovisioned"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NetworkBandwidthOverprovisioned"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NetworkBandwidthUnderprovisioned"
  | NETWORK_PPS_OVER_PROVISIONED -> `String "NetworkPPSOverprovisioned"
  | NETWORK_PPS_UNDER_PROVISIONED -> `String "NetworkPPSUnderprovisioned"
  | DISK_IOPS_OVER_PROVISIONED -> `String "DiskIOPSOverprovisioned"
  | DISK_IOPS_UNDER_PROVISIONED -> `String "DiskIOPSUnderprovisioned"
  | DISK_THROUGHPUT_OVER_PROVISIONED -> `String "DiskThroughputOverprovisioned"
  | DISK_THROUGHPUT_UNDER_PROVISIONED -> `String "DiskThroughputUnderprovisioned"
  | GPU_UNDER_PROVISIONED -> `String "GPUUnderprovisioned"
  | GPU_OVER_PROVISIONED -> `String "GPUOverprovisioned"
  | GPU_MEMORY_UNDER_PROVISIONED -> `String "GPUMemoryUnderprovisioned"
  | GPU_MEMORY_OVER_PROVISIONED -> `String "GPUMemoryOverprovisioned"

let instance_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson instance_recommendation_finding_reason_code_to_yojson tree

let current_instance_type_to_yojson = string_to_yojson
let instance_name_to_yojson = string_to_yojson

let instance_recommendation_to_yojson (x : instance_recommendation) =
  assoc_to_yojson
    [
      ("instanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("instanceName", option_to_yojson instance_name_to_yojson x.instance_name);
      ( "currentInstanceType",
        option_to_yojson current_instance_type_to_yojson x.current_instance_type );
      ("finding", option_to_yojson finding_to_yojson x.finding);
      ( "findingReasonCodes",
        option_to_yojson instance_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ("utilizationMetrics", option_to_yojson utilization_metrics_to_yojson x.utilization_metrics);
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "recommendationOptions",
        option_to_yojson recommendation_options_to_yojson x.recommendation_options );
      ( "recommendationSources",
        option_to_yojson recommendation_sources_to_yojson x.recommendation_sources );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "effectiveRecommendationPreferences",
        option_to_yojson effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
      ("instanceState", option_to_yojson instance_state_to_yojson x.instance_state);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "externalMetricStatus",
        option_to_yojson external_metric_status_to_yojson x.external_metric_status );
      ("currentInstanceGpuInfo", option_to_yojson gpu_info_to_yojson x.current_instance_gpu_info);
      ("idle", option_to_yojson instance_idle_to_yojson x.idle);
    ]

let instance_recommendations_to_yojson tree = list_to_yojson instance_recommendation_to_yojson tree

let get_ec2_instance_recommendations_response_to_yojson
    (x : get_ec2_instance_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "instanceRecommendations",
        option_to_yojson instance_recommendations_to_yojson x.instance_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let filter_name_to_yojson (x : filter_name) =
  match x with
  | FINDING -> `String "Finding"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | RECOMMENDATION_SOURCE_TYPE -> `String "RecommendationSourceType"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree
let instance_arns_to_yojson tree = list_to_yojson instance_arn_to_yojson tree

let get_ec2_instance_recommendations_request_to_yojson
    (x : get_ec2_instance_recommendations_request) =
  assoc_to_yojson
    [
      ("instanceArns", option_to_yojson instance_arns_to_yojson x.instance_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let ebs_savings_estimation_mode_source_to_yojson (x : ebs_savings_estimation_mode_source) =
  match x with
  | PUBLIC_PRICING -> `String "PublicPricing"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"

let ebs_savings_estimation_mode_to_yojson (x : ebs_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson ebs_savings_estimation_mode_source_to_yojson x.source) ]

let ebs_effective_recommendation_preferences_to_yojson
    (x : ebs_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson ebs_savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
    ]

let ebs_estimated_monthly_savings_to_yojson (x : ebs_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let ebs_savings_opportunity_after_discounts_to_yojson (x : ebs_savings_opportunity_after_discounts)
    =
  assoc_to_yojson
    [
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
      ( "estimatedMonthlySavings",
        option_to_yojson ebs_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let root_volume_to_yojson = bool_to_yojson
let volume_burst_throughput_to_yojson = int_to_yojson
let volume_baseline_throughput_to_yojson = int_to_yojson
let volume_burst_iop_s_to_yojson = int_to_yojson
let volume_baseline_iop_s_to_yojson = int_to_yojson
let volume_size_to_yojson = int_to_yojson
let volume_type_to_yojson = string_to_yojson

let volume_configuration_to_yojson (x : volume_configuration) =
  assoc_to_yojson
    [
      ("volumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("volumeSize", option_to_yojson volume_size_to_yojson x.volume_size);
      ( "volumeBaselineIOPS",
        option_to_yojson volume_baseline_iop_s_to_yojson x.volume_baseline_iop_s );
      ("volumeBurstIOPS", option_to_yojson volume_burst_iop_s_to_yojson x.volume_burst_iop_s);
      ( "volumeBaselineThroughput",
        option_to_yojson volume_baseline_throughput_to_yojson x.volume_baseline_throughput );
      ( "volumeBurstThroughput",
        option_to_yojson volume_burst_throughput_to_yojson x.volume_burst_throughput );
      ("rootVolume", option_to_yojson root_volume_to_yojson x.root_volume);
    ]

let volume_recommendation_option_to_yojson (x : volume_recommendation_option) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson volume_configuration_to_yojson x.configuration);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson ebs_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
    ]

let volume_recommendation_options_to_yojson tree =
  list_to_yojson volume_recommendation_option_to_yojson tree

let ebs_metric_name_to_yojson (x : ebs_metric_name) =
  match x with
  | VOLUME_READ_OPS_PER_SECOND -> `String "VolumeReadOpsPerSecond"
  | VOLUME_WRITE_OPS_PER_SECOND -> `String "VolumeWriteOpsPerSecond"
  | VOLUME_READ_BYTES_PER_SECOND -> `String "VolumeReadBytesPerSecond"
  | VOLUME_WRITE_BYTES_PER_SECOND -> `String "VolumeWriteBytesPerSecond"
  | VOLUME_IOPS_EXCEEDED -> `String "VolumeIOPSExceeded"
  | VOLUME_THROUGHPUT_EXCEEDED -> `String "VolumeThroughputExceeded"

let ebs_utilization_metric_to_yojson (x : ebs_utilization_metric) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ebs_metric_name_to_yojson x.name);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("value", option_to_yojson metric_value_to_yojson x.value);
    ]

let ebs_utilization_metrics_to_yojson tree = list_to_yojson ebs_utilization_metric_to_yojson tree

let ebs_finding_to_yojson (x : ebs_finding) =
  match x with OPTIMIZED -> `String "Optimized" | NOT_OPTIMIZED -> `String "NotOptimized"

let volume_arn_to_yojson = string_to_yojson

let volume_recommendation_to_yojson (x : volume_recommendation) =
  assoc_to_yojson
    [
      ("volumeArn", option_to_yojson volume_arn_to_yojson x.volume_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "currentConfiguration",
        option_to_yojson volume_configuration_to_yojson x.current_configuration );
      ("finding", option_to_yojson ebs_finding_to_yojson x.finding);
      ( "utilizationMetrics",
        option_to_yojson ebs_utilization_metrics_to_yojson x.utilization_metrics );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "volumeRecommendationOptions",
        option_to_yojson volume_recommendation_options_to_yojson x.volume_recommendation_options );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "effectiveRecommendationPreferences",
        option_to_yojson ebs_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let volume_recommendations_to_yojson tree = list_to_yojson volume_recommendation_to_yojson tree

let get_ebs_volume_recommendations_response_to_yojson (x : get_ebs_volume_recommendations_response)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "volumeRecommendations",
        option_to_yojson volume_recommendations_to_yojson x.volume_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let ebs_filter_name_to_yojson (x : ebs_filter_name) = match x with FINDING -> `String "Finding"

let ebs_filter_to_yojson (x : ebs_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson ebs_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let ebs_filters_to_yojson tree = list_to_yojson ebs_filter_to_yojson tree
let volume_arns_to_yojson tree = list_to_yojson volume_arn_to_yojson tree

let get_ebs_volume_recommendations_request_to_yojson (x : get_ebs_volume_recommendations_request) =
  assoc_to_yojson
    [
      ("volumeArns", option_to_yojson volume_arns_to_yojson x.volume_arns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson ebs_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let get_auto_scaling_group_recommendations_response_to_yojson
    (x : get_auto_scaling_group_recommendations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "autoScalingGroupRecommendations",
        option_to_yojson auto_scaling_group_recommendations_to_yojson
          x.auto_scaling_group_recommendations );
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
    ]

let get_auto_scaling_group_recommendations_request_to_yojson
    (x : get_auto_scaling_group_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ( "autoScalingGroupArns",
        option_to_yojson auto_scaling_group_arns_to_yojson x.auto_scaling_group_arns );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let metadata_key_to_yojson = string_to_yojson
let destination_key_to_yojson = string_to_yojson
let destination_bucket_to_yojson = string_to_yojson

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson destination_bucket_to_yojson x.bucket);
      ("key", option_to_yojson destination_key_to_yojson x.key);
      ("metadataKey", option_to_yojson metadata_key_to_yojson x.metadata_key);
    ]

let job_id_to_yojson = string_to_yojson

let export_rds_database_recommendations_response_to_yojson
    (x : export_rds_database_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let file_format_to_yojson (x : file_format) = match x with CSV -> `String "Csv"
let destination_key_prefix_to_yojson = string_to_yojson

let s3_destination_config_to_yojson (x : s3_destination_config) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson destination_bucket_to_yojson x.bucket);
      ("keyPrefix", option_to_yojson destination_key_prefix_to_yojson x.key_prefix);
    ]

let exportable_rdsdb_field_to_yojson (x : exportable_rdsdb_field) =
  match x with
  | RESOURCE_ARN -> `String "ResourceArn"
  | ACCOUNT_ID -> `String "AccountId"
  | ENGINE -> `String "Engine"
  | ENGINE_VERSION -> `String "EngineVersion"
  | IDLE -> `String "Idle"
  | MULTI_AZ_DB_INSTANCE -> `String "MultiAZDBInstance"
  | CLUSTER_WRITER -> `String "ClusterWriter"
  | CURRENT_DB_INSTANCE_CLASS -> `String "CurrentDBInstanceClass"
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_TYPE -> `String "CurrentStorageConfigurationStorageType"
  | CURRENT_STORAGE_CONFIGURATION_ALLOCATED_STORAGE ->
      `String "CurrentStorageConfigurationAllocatedStorage"
  | CURRENT_STORAGE_CONFIGURATION_MAX_ALLOCATED_STORAGE ->
      `String "CurrentStorageConfigurationMaxAllocatedStorage"
  | CURRENT_STORAGE_CONFIGURATION_IOPS -> `String "CurrentStorageConfigurationIOPS"
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_THROUGHPUT ->
      `String "CurrentStorageConfigurationStorageThroughput"
  | CURRENT_STORAGE_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION ->
      `String "CurrentStorageEstimatedMonthlyVolumeIOPsCostVariation"
  | CURRENT_INSTANCE_ON_DEMAND_HOURLY_PRICE -> `String "CurrentInstanceOnDemandHourlyPrice"
  | CURRENT_STORAGE_ON_DEMAND_MONTHLY_PRICE -> `String "CurrentStorageOnDemandMonthlyPrice"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterInstanceOnDemandMonthlyCost"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterStorageOnDemandMonthlyCost"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterStorageIOOnDemandMonthlyCost"
  | CURRENT_INSTANCE_PERFORMANCE_RISK -> `String "CurrentInstancePerformanceRisk"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_STORAGE_SPACE_UTILIZATION_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeStorageSpaceUtilizationMaximum"
  | UTILIZATION_METRICS_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsNetworkReceiveThroughputMaximum"
  | UTILIZATION_METRICS_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsNetworkTransmitThroughputMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadIOPSMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadThroughputMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteThroughputMaximum"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM ->
      `String "UtilizationMetricsDatabaseConnectionsMaximum"
  | UTILIZATION_METRICS_STORAGE_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsStorageNetworkReceiveThroughputMaximum"
  | UTILIZATION_METRICS_STORAGE_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsStorageNetworkTransmitThroughputMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_HEALTH_STATE_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryHealthStateMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_DECLINED_SQL_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumDeclinedSqlTotalMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_CONN_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumKillConnTotalMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_QUERY_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumKillQueryTotalMaximum"
  | UTILIZATION_METRICS_READ_IOPS_EPHEMERAL_STORAGE_MAXIMUM ->
      `String "UtilizationMetricsReadIOPSEphemeralStorageMaximum"
  | UTILIZATION_METRICS_WRITE_IOPS_EPHEMERAL_STORAGE_MAXIMUM ->
      `String "UtilizationMetricsWriteIOPSEphemeralStorageMaximum"
  | UTILIZATION_METRICS_VOLUME_BYTES_USED_AVERAGE ->
      `String "UtilizationMetricsVolumeBytesUsedAverage"
  | UTILIZATION_METRICS_VOLUME_READ_IOPS_AVERAGE ->
      `String "UtilizationMetricsVolumeReadIOPsAverage"
  | UTILIZATION_METRICS_VOLUME_WRITE_IOPS_AVERAGE ->
      `String "UtilizationMetricsVolumeWriteIOPsAverage"
  | INSTANCE_FINDING -> `String "InstanceFinding"
  | INSTANCE_FINDING_REASON_CODES -> `String "InstanceFindingReasonCodes"
  | STORAGE_FINDING -> `String "StorageFinding"
  | STORAGE_FINDING_REASON_CODES -> `String "StorageFindingReasonCodes"
  | INSTANCE_RECOMMENDATION_OPTIONS_DB_INSTANCE_CLASS ->
      `String "InstanceRecommendationOptionsDBInstanceClass"
  | INSTANCE_RECOMMENDATION_OPTIONS_RANK -> `String "InstanceRecommendationOptionsRank"
  | INSTANCE_RECOMMENDATION_OPTIONS_PERFORMANCE_RISK ->
      `String "InstanceRecommendationOptionsPerformanceRisk"
  | INSTANCE_RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "InstanceRecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_TYPE -> `String "StorageRecommendationOptionsStorageType"
  | STORAGE_RECOMMENDATION_OPTIONS_ALLOCATED_STORAGE ->
      `String "StorageRecommendationOptionsAllocatedStorage"
  | STORAGE_RECOMMENDATION_OPTIONS_MAX_ALLOCATED_STORAGE ->
      `String "StorageRecommendationOptionsMaxAllocatedStorage"
  | STORAGE_RECOMMENDATION_OPTIONS_IOPS -> `String "StorageRecommendationOptionsIOPS"
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_THROUGHPUT ->
      `String "StorageRecommendationOptionsStorageThroughput"
  | STORAGE_RECOMMENDATION_OPTIONS_RANK -> `String "StorageRecommendationOptionsRank"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION ->
      `String "StorageRecommendationOptionsEstimatedMonthlyVolumeIOPsCostVariation"
  | INSTANCE_RECOMMENDATION_OPTIONS_INSTANCE_ON_DEMAND_HOURLY_PRICE ->
      `String "InstanceRecommendationOptionsInstanceOnDemandHourlyPrice"
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "InstanceRecommendationOptionsSavingsOpportunityPercentage"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrency"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValue"
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "InstanceRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | STORAGE_RECOMMENDATION_OPTIONS_ON_DEMAND_MONTHLY_PRICE ->
      `String "StorageRecommendationOptionsOnDemandMonthlyPrice"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterInstanceOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterStorageOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterStorageIOOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "StorageRecommendationOptionsSavingsOpportunityPercentage"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrency"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsValue"
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "StorageRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | TAGS -> `String "Tags"
  | DB_CLUSTER_IDENTIFIER -> `String "DBClusterIdentifier"
  | PROMOTION_TIER -> `String "PromotionTier"

let exportable_rdsdb_fields_to_yojson tree = list_to_yojson exportable_rdsdb_field_to_yojson tree

let export_rds_database_recommendations_request_to_yojson
    (x : export_rds_database_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson rdsdb_recommendation_filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_rdsdb_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let export_license_recommendations_response_to_yojson (x : export_license_recommendations_response)
    =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_license_field_to_yojson (x : exportable_license_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_ARN -> `String "ResourceArn"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | LICENSE_FINDING -> `String "Finding"
  | LICENSE_FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | CURRENT_LICENSE_CONFIGURATION_NUMBER_OF_CORES ->
      `String "CurrentLicenseConfigurationNumberOfCores"
  | CURRENT_LICENSE_CONFIGURATION_INSTANCE_TYPE -> `String "CurrentLicenseConfigurationInstanceType"
  | CURRENT_LICENSE_CONFIGURATION_OPERATING_SYSTEM ->
      `String "CurrentLicenseConfigurationOperatingSystem"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_NAME -> `String "CurrentLicenseConfigurationLicenseName"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_EDITION ->
      `String "CurrentLicenseConfigurationLicenseEdition"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_MODEL -> `String "CurrentLicenseConfigurationLicenseModel"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_VERSION ->
      `String "CurrentLicenseConfigurationLicenseVersion"
  | CURRENT_LICENSE_CONFIGURATION_METRICS_SOURCE ->
      `String "CurrentLicenseConfigurationMetricsSource"
  | RECOMMENDATION_OPTIONS_OPERATING_SYSTEM -> `String "RecommendationOptionsOperatingSystem"
  | RECOMMENDATION_OPTIONS_LICENSE_EDITION -> `String "RecommendationOptionsLicenseEdition"
  | RECOMMENDATION_OPTIONS_LICENSE_MODEL -> `String "RecommendationOptionsLicenseModel"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | TAGS -> `String "Tags"

let exportable_license_fields_to_yojson tree =
  list_to_yojson exportable_license_field_to_yojson tree

let export_license_recommendations_request_to_yojson (x : export_license_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson license_recommendation_filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_license_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let export_lambda_function_recommendations_response_to_yojson
    (x : export_lambda_function_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_lambda_function_field_to_yojson (x : exportable_lambda_function_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | FUNCTION_ARN -> `String "FunctionArn"
  | FUNCTION_VERSION -> `String "FunctionVersion"
  | FINDING -> `String "Finding"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | NUMBER_OF_INVOCATIONS -> `String "NumberOfInvocations"
  | UTILIZATION_METRICS_DURATION_MAXIMUM -> `String "UtilizationMetricsDurationMaximum"
  | UTILIZATION_METRICS_DURATION_AVERAGE -> `String "UtilizationMetricsDurationAverage"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_MEMORY_AVERAGE -> `String "UtilizationMetricsMemoryAverage"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_CONFIGURATION_MEMORY_SIZE -> `String "CurrentConfigurationMemorySize"
  | CURRENT_CONFIGURATION_TIMEOUT -> `String "CurrentConfigurationTimeout"
  | CURRENT_COST_TOTAL -> `String "CurrentCostTotal"
  | CURRENT_COST_AVERAGE -> `String "CurrentCostAverage"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MEMORY_SIZE ->
      `String "RecommendationOptionsConfigurationMemorySize"
  | RECOMMENDATION_OPTIONS_COST_LOW -> `String "RecommendationOptionsCostLow"
  | RECOMMENDATION_OPTIONS_COST_HIGH -> `String "RecommendationOptionsCostHigh"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_LOWER_BOUND ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationLowerBound"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_UPPER_BOUND ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationUpperBound"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_EXPECTED ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationExpected"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | TAGS -> `String "Tags"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"

let exportable_lambda_function_fields_to_yojson tree =
  list_to_yojson exportable_lambda_function_field_to_yojson tree

let export_lambda_function_recommendations_request_to_yojson
    (x : export_lambda_function_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson lambda_function_recommendation_filters_to_yojson x.filters);
      ( "fieldsToExport",
        option_to_yojson exportable_lambda_function_fields_to_yojson x.fields_to_export );
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let export_idle_recommendations_response_to_yojson (x : export_idle_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_idle_field_to_yojson (x : exportable_idle_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_ARN -> `String "ResourceArn"
  | RESOURCE_ID -> `String "ResourceId"
  | RESOURCE_TYPE -> `String "ResourceType"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | SAVINGS_OPPORTUNITY -> `String "SavingsOpportunity"
  | SAVINGS_OPPORTUNITY_AFTER_DISCOUNT -> `String "SavingsOpportunityAfterDiscount"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM ->
      `String "UtilizationMetricsDatabaseConnectionsMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadIOPSMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum"
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_ACTIVE_CONNECTION_COUNT_MAXIMUM ->
      `String "UtilizationMetricsActiveConnectionCountMaximum"
  | UTILIZATION_METRICS_PACKETS_IN_FROM_SOURCE_MAXIMUM ->
      `String "UtilizationMetricsPacketsInFromSourceMaximum"
  | UTILIZATION_METRICS_PACKETS_IN_FROM_DESTINATION_MAXIMUM ->
      `String "UtilizationMetricsPacketsInFromDestinationMaximum"
  | UTILIZATION_METRICS_CONSUMED_READ_CAPACITY_UNITS_SUM ->
      `String "UtilizationMetricsConsumedReadCapacityUnitsSum"
  | UTILIZATION_METRICS_CONSUMED_WRITE_CAPACITY_UNITS_SUM ->
      `String "UtilizationMetricsConsumedWriteCapacityUnitsSum"
  | UTILIZATION_METRICS_NEW_CONNECTIONS_SUM -> `String "UtilizationMetricsNewConnectionsSum"
  | UTILIZATION_METRICS_ENGINE_CPU_UTILIZATION_MAXIMUM ->
      `String "UtilizationMetricsEngineCPUUtilizationMaximum"
  | UTILIZATION_METRICS_CACHE_HITS_SUM -> `String "UtilizationMetricsCacheHitsSum"
  | UTILIZATION_METRICS_CACHE_MISSES_SUM -> `String "UtilizationMetricsCacheMissesSum"
  | UTILIZATION_METRICS_KEYSPACE_HITS_SUM -> `String "UtilizationMetricsKeyspaceHitsSum"
  | UTILIZATION_METRICS_KEYSPACE_MISSES_SUM -> `String "UtilizationMetricsKeyspaceMissesSum"
  | UTILIZATION_METRICS_IS_IDLE_MINIMUM -> `String "UtilizationMetricsIsIdleMinimum"
  | UTILIZATION_METRICS_USER_CONNECTED_SUM -> `String "UtilizationMetricsUserConnectedSum"
  | UTILIZATION_METRICS_INVOCATIONS_SUM -> `String "UtilizationMetricsInvocationsSum"
  | UTILIZATION_METRICS_GET_TYPE_CMDS_SUM -> `String "UtilizationMetricsGetTypeCmdsSum"
  | UTILIZATION_METRICS_SET_TYPE_CMDS_SUM -> `String "UtilizationMetricsSetTypeCmdsSum"
  | UTILIZATION_METRICS_ELASTI_CACHE_PROCESSING_UNITS_SUM ->
      `String "UtilizationMetricsElastiCacheProcessingUnitsSum"
  | UTILIZATION_METRICS_CURR_CONNECTIONS_SUM -> `String "UtilizationMetricsCurrConnectionsSum"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_SUM ->
      `String "UtilizationMetricsDatabaseConnectionsSum"
  | FINDING -> `String "Finding"
  | FINDING_DESCRIPTION -> `String "FindingDescription"
  | TAGS -> `String "Tags"

let exportable_idle_fields_to_yojson tree = list_to_yojson exportable_idle_field_to_yojson tree

let export_idle_recommendations_request_to_yojson (x : export_idle_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson idle_recommendation_filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_idle_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let export_ecs_service_recommendations_response_to_yojson
    (x : export_ecs_service_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_ecs_service_field_to_yojson (x : exportable_ecs_service_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | SERVICE_ARN -> `String "ServiceArn"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | LAUNCH_TYPE -> `String "LaunchType"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | CURRENT_SERVICE_CONFIGURATION_MEMORY -> `String "CurrentServiceConfigurationMemory"
  | CURRENT_SERVICE_CONFIGURATION_CPU -> `String "CurrentServiceConfigurationCpu"
  | CURRENT_SERVICE_CONFIGURATION_TASK_DEFINITION_ARN ->
      `String "CurrentServiceConfigurationTaskDefinitionArn"
  | CURRENT_SERVICE_CONFIGURATION_AUTO_SCALING_CONFIGURATION ->
      `String "CurrentServiceConfigurationAutoScalingConfiguration"
  | CURRENT_SERVICE_CONTAINER_CONFIGURATIONS -> `String "CurrentServiceContainerConfigurations"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | FINDING -> `String "Finding"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | RECOMMENDATION_OPTIONS_CPU -> `String "RecommendationOptionsCpu"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_CONTAINER_RECOMMENDATIONS ->
      `String "RecommendationOptionsContainerRecommendations"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | TAGS -> `String "Tags"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"

let exportable_ecs_service_fields_to_yojson tree =
  list_to_yojson exportable_ecs_service_field_to_yojson tree

let export_ecs_service_recommendations_request_to_yojson
    (x : export_ecs_service_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson ecs_service_recommendation_filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_ecs_service_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let export_ec2_instance_recommendations_response_to_yojson
    (x : export_ec2_instance_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_instance_field_to_yojson (x : exportable_instance_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | INSTANCE_ARN -> `String "InstanceArn"
  | INSTANCE_NAME -> `String "InstanceName"
  | FINDING -> `String "Finding"
  | Finding_Reason_Codes -> `String "FindingReasonCodes"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_INSTANCE_TYPE -> `String "CurrentInstanceType"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum"
  | CURRENT_ON_DEMAND_PRICE -> `String "CurrentOnDemandPrice"
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardOneYearNoUpfrontReservedPrice"
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardThreeYearNoUpfrontReservedPrice"
  | CURRENT_VCPUS -> `String "CurrentVCpus"
  | CURRENT_MEMORY -> `String "CurrentMemory"
  | CURRENT_STORAGE -> `String "CurrentStorage"
  | CURRENT_NETWORK -> `String "CurrentNetwork"
  | RECOMMENDATION_OPTIONS_INSTANCE_TYPE -> `String "RecommendationOptionsInstanceType"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | RECOMMENDATION_OPTIONS_PLATFORM_DIFFERENCES ->
      `String "RecommendationOptionsPlatformDifferences"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | RECOMMENDATION_OPTIONS_VCPUS -> `String "RecommendationOptionsVcpus"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | RECOMMENDATION_OPTIONS_STORAGE -> `String "RecommendationOptionsStorage"
  | RECOMMENDATION_OPTIONS_NETWORK -> `String "RecommendationOptionsNetwork"
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE -> `String "RecommendationOptionsOnDemandPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice"
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_ARN ->
      `String "RecommendationsSourcesRecommendationSourceArn"
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_TYPE ->
      `String "RecommendationsSourcesRecommendationSourceType"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES ->
      `String "EffectiveRecommendationPreferencesInferredWorkloadTypes"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT -> `String "RecommendationOptionsMigrationEffort"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_EXTERNAL_METRICS_SOURCE ->
      `String "EffectiveRecommendationPreferencesExternalMetricsSource"
  | TAGS -> `String "Tags"
  | INSTANCE_STATE -> `String "InstanceState"
  | EXTERNAL_METRIC_STATUS_CODE -> `String "ExternalMetricStatusCode"
  | EXTERNAL_METRIC_STATUS_REASON -> `String "ExternalMetricStatusReason"
  | CURRENT_INSTANCE_GPU_INFO -> `String "CurrentInstanceGpuInfo"
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO -> `String "RecommendationOptionsInstanceGpuInfo"
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM -> `String "UtilizationMetricsGpuPercentageMaximum"
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "UtilizationMetricsGpuMemoryPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum"
  | IDLE -> `String "Idle"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES ->
      `String "EffectiveRecommendationPreferencesPreferredResources"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_UTILIZATION_PREFERENCES ->
      `String "EffectiveRecommendationPreferencesUtilizationPreferences"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"

let exportable_instance_fields_to_yojson tree =
  list_to_yojson exportable_instance_field_to_yojson tree

let export_ec2_instance_recommendations_request_to_yojson
    (x : export_ec2_instance_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_instance_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let export_ebs_volume_recommendations_response_to_yojson
    (x : export_ebs_volume_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_volume_field_to_yojson (x : exportable_volume_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | VOLUME_ARN -> `String "VolumeArn"
  | FINDING -> `String "Finding"
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_IOPS_EXCEEDED_MAXIMUM ->
      `String "UtilizationMetricsVolumeIOPSExceededMaximum"
  | UTILIZATION_METRICS_VOLUME_THROUGHPUT_EXCEEDED_MAXIMUM ->
      `String "UtilizationMetricsVolumeThroughputExceededMaximum"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_CONFIGURATION_VOLUME_TYPE -> `String "CurrentConfigurationVolumeType"
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_IOPS -> `String "CurrentConfigurationVolumeBaselineIOPS"
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT ->
      `String "CurrentConfigurationVolumeBaselineThroughput"
  | CURRENT_CONFIGURATION_VOLUME_BURST_IOPS -> `String "CurrentConfigurationVolumeBurstIOPS"
  | CURRENT_CONFIGURATION_VOLUME_BURST_THROUGHPUT ->
      `String "CurrentConfigurationVolumeBurstThroughput"
  | CURRENT_CONFIGURATION_VOLUME_SIZE -> `String "CurrentConfigurationVolumeSize"
  | CURRENT_MONTHLY_PRICE -> `String "CurrentMonthlyPrice"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_TYPE ->
      `String "RecommendationOptionsConfigurationVolumeType"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_IOPS ->
      `String "RecommendationOptionsConfigurationVolumeBaselineIOPS"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT ->
      `String "RecommendationOptionsConfigurationVolumeBaselineThroughput"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_IOPS ->
      `String "RecommendationOptionsConfigurationVolumeBurstIOPS"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_THROUGHPUT ->
      `String "RecommendationOptionsConfigurationVolumeBurstThroughput"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_SIZE ->
      `String "RecommendationOptionsConfigurationVolumeSize"
  | RECOMMENDATION_OPTIONS_MONTHLY_PRICE -> `String "RecommendationOptionsMonthlyPrice"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | TAGS -> `String "Tags"
  | ROOT_VOLUME -> `String "RootVolume"
  | CURRENT_CONFIGURATION_ROOT_VOLUME -> `String "CurrentConfigurationRootVolume"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"

let exportable_volume_fields_to_yojson tree = list_to_yojson exportable_volume_field_to_yojson tree

let export_ebs_volume_recommendations_request_to_yojson
    (x : export_ebs_volume_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson ebs_filters_to_yojson x.filters);
      ("fieldsToExport", option_to_yojson exportable_volume_fields_to_yojson x.fields_to_export);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
    ]

let export_auto_scaling_group_recommendations_response_to_yojson
    (x : export_auto_scaling_group_recommendations_response) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let exportable_auto_scaling_group_field_to_yojson (x : exportable_auto_scaling_group_field) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | AUTO_SCALING_GROUP_ARN -> `String "AutoScalingGroupArn"
  | AUTO_SCALING_GROUP_NAME -> `String "AutoScalingGroupName"
  | FINDING -> `String "Finding"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_CONFIGURATION_INSTANCE_TYPE -> `String "CurrentConfigurationInstanceType"
  | CURRENT_CONFIGURATION_DESIRED_CAPACITY -> `String "CurrentConfigurationDesiredCapacity"
  | CURRENT_CONFIGURATION_MIN_SIZE -> `String "CurrentConfigurationMinSize"
  | CURRENT_CONFIGURATION_MAX_SIZE -> `String "CurrentConfigurationMaxSize"
  | CURRENT_CONFIGURATION_ALLOCATION_STRATEGY -> `String "CurrentConfigurationAllocationStrategy"
  | CURRENT_CONFIGURATION_MIXED_INSTANCE_TYPES -> `String "CurrentConfigurationMixedInstanceTypes"
  | CURRENT_CONFIGURATION_TYPE -> `String "CurrentConfigurationType"
  | CURRENT_ON_DEMAND_PRICE -> `String "CurrentOnDemandPrice"
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardOneYearNoUpfrontReservedPrice"
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardThreeYearNoUpfrontReservedPrice"
  | CURRENT_VCPUS -> `String "CurrentVCpus"
  | CURRENT_MEMORY -> `String "CurrentMemory"
  | CURRENT_STORAGE -> `String "CurrentStorage"
  | CURRENT_NETWORK -> `String "CurrentNetwork"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_INSTANCE_TYPE ->
      `String "RecommendationOptionsConfigurationInstanceType"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_DESIRED_CAPACITY ->
      `String "RecommendationOptionsConfigurationDesiredCapacity"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIN_SIZE ->
      `String "RecommendationOptionsConfigurationMinSize"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MAX_SIZE ->
      `String "RecommendationOptionsConfigurationMaxSize"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ESTIMATED_INSTANCE_HOUR_REDUCTION_PERCENTAGE ->
      `String "RecommendationOptionsConfigurationEstimatedInstanceHourReductionPercentage"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ALLOCATION_STRATEGY ->
      `String "RecommendationOptionsConfigurationAllocationStrategy"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIXED_INSTANCE_TYPES ->
      `String "RecommendationOptionsConfigurationMixedInstanceTypes"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_TYPE -> `String "RecommendationOptionsConfigurationType"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE -> `String "RecommendationOptionsOnDemandPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_VCPUS -> `String "RecommendationOptionsVcpus"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | RECOMMENDATION_OPTIONS_STORAGE -> `String "RecommendationOptionsStorage"
  | RECOMMENDATION_OPTIONS_NETWORK -> `String "RecommendationOptionsNetwork"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES ->
      `String "EffectiveRecommendationPreferencesInferredWorkloadTypes"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES ->
      `String "EffectiveRecommendationPreferencesPreferredResources"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT -> `String "RecommendationOptionsMigrationEffort"
  | CURRENT_INSTANCE_GPU_INFO -> `String "CurrentInstanceGpuInfo"
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO -> `String "RecommendationOptionsInstanceGpuInfo"
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM -> `String "UtilizationMetricsGpuPercentageMaximum"
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "UtilizationMetricsGpuMemoryPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"

let exportable_auto_scaling_group_fields_to_yojson tree =
  list_to_yojson exportable_auto_scaling_group_field_to_yojson tree

let export_auto_scaling_group_recommendations_request_to_yojson
    (x : export_auto_scaling_group_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ( "fieldsToExport",
        option_to_yojson exportable_auto_scaling_group_fields_to_yojson x.fields_to_export );
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
    ]

let failure_reason_to_yojson = string_to_yojson
let creation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | QUEUED -> `String "Queued"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETE -> `String "Complete"
  | FAILED -> `String "Failed"

let export_destination_to_yojson (x : export_destination) =
  assoc_to_yojson [ ("s3", option_to_yojson s3_destination_to_yojson x.s3) ]

let recommendation_export_job_to_yojson (x : recommendation_export_job) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("destination", option_to_yojson export_destination_to_yojson x.destination);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("status", option_to_yojson job_status_to_yojson x.status);
      ("creationTimestamp", option_to_yojson creation_timestamp_to_yojson x.creation_timestamp);
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let recommendation_export_jobs_to_yojson tree =
  list_to_yojson recommendation_export_job_to_yojson tree

let describe_recommendation_export_jobs_response_to_yojson
    (x : describe_recommendation_export_jobs_response) =
  assoc_to_yojson
    [
      ( "recommendationExportJobs",
        option_to_yojson recommendation_export_jobs_to_yojson x.recommendation_export_jobs );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let job_filter_name_to_yojson (x : job_filter_name) =
  match x with RESOURCE_TYPE -> `String "ResourceType" | JOB_STATUS -> `String "JobStatus"

let job_filter_to_yojson (x : job_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson job_filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_values_to_yojson x.values);
    ]

let job_filters_to_yojson tree = list_to_yojson job_filter_to_yojson tree
let job_ids_to_yojson tree = list_to_yojson job_id_to_yojson tree

let describe_recommendation_export_jobs_request_to_yojson
    (x : describe_recommendation_export_jobs_request) =
  assoc_to_yojson
    [
      ("jobIds", option_to_yojson job_ids_to_yojson x.job_ids);
      ("filters", option_to_yojson job_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let delete_recommendation_preferences_response_to_yojson = unit_to_yojson

let recommendation_preference_name_to_yojson (x : recommendation_preference_name) =
  match x with
  | ENHANCED_INFRASTRUCTURE_METRICS -> `String "EnhancedInfrastructureMetrics"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | EXTERNAL_METRICS_PREFERENCE -> `String "ExternalMetricsPreference"
  | LOOKBACK_PERIOD_PREFERENCE -> `String "LookBackPeriodPreference"
  | PREFERRED_RESOURCES -> `String "PreferredResources"
  | UTILIZATION_PREFERENCES -> `String "UtilizationPreferences"

let recommendation_preference_names_to_yojson tree =
  list_to_yojson recommendation_preference_name_to_yojson tree

let delete_recommendation_preferences_request_to_yojson
    (x : delete_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ( "recommendationPreferenceNames",
        Some (recommendation_preference_names_to_yojson x.recommendation_preference_names) );
    ]
