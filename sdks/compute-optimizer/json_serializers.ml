open Smaws_Lib.Json.SerializeHelpers
open Types

let volume_type_to_yojson = string_to_yojson
let volume_size_to_yojson = int_to_yojson
let volume_arn_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson
let volume_baseline_iop_s_to_yojson = int_to_yojson
let volume_burst_iop_s_to_yojson = int_to_yojson
let volume_baseline_throughput_to_yojson = int_to_yojson
let volume_burst_throughput_to_yojson = int_to_yojson
let root_volume_to_yojson = bool_to_yojson

let volume_configuration_to_yojson (x : volume_configuration) =
  assoc_to_yojson
    [
      ("rootVolume", option_to_yojson root_volume_to_yojson x.root_volume);
      ( "volumeBurstThroughput",
        option_to_yojson volume_burst_throughput_to_yojson x.volume_burst_throughput );
      ( "volumeBaselineThroughput",
        option_to_yojson volume_baseline_throughput_to_yojson x.volume_baseline_throughput );
      ("volumeBurstIOPS", option_to_yojson volume_burst_iop_s_to_yojson x.volume_burst_iop_s);
      ( "volumeBaselineIOPS",
        option_to_yojson volume_baseline_iop_s_to_yojson x.volume_baseline_iop_s );
      ("volumeSize", option_to_yojson volume_size_to_yojson x.volume_size);
      ("volumeType", option_to_yojson volume_type_to_yojson x.volume_type);
    ]

let ebs_finding_to_yojson (x : ebs_finding) =
  match x with NOT_OPTIMIZED -> `String "NotOptimized" | OPTIMIZED -> `String "Optimized"

let ebs_metric_name_to_yojson (x : ebs_metric_name) =
  match x with
  | VOLUME_THROUGHPUT_EXCEEDED -> `String "VolumeThroughputExceeded"
  | VOLUME_IOPS_EXCEEDED -> `String "VolumeIOPSExceeded"
  | VOLUME_WRITE_BYTES_PER_SECOND -> `String "VolumeWriteBytesPerSecond"
  | VOLUME_READ_BYTES_PER_SECOND -> `String "VolumeReadBytesPerSecond"
  | VOLUME_WRITE_OPS_PER_SECOND -> `String "VolumeWriteOpsPerSecond"
  | VOLUME_READ_OPS_PER_SECOND -> `String "VolumeReadOpsPerSecond"

let metric_statistic_to_yojson (x : metric_statistic) =
  match x with AVERAGE -> `String "Average" | MAXIMUM -> `String "Maximum"

let metric_value_to_yojson = double_to_yojson

let ebs_utilization_metric_to_yojson (x : ebs_utilization_metric) =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson ebs_metric_name_to_yojson x.name);
    ]

let ebs_utilization_metrics_to_yojson tree = list_to_yojson ebs_utilization_metric_to_yojson tree
let look_back_period_in_days_to_yojson = double_to_yojson
let performance_risk_to_yojson = double_to_yojson
let rank_to_yojson = int_to_yojson
let savings_opportunity_percentage_to_yojson = double_to_yojson
let currency_to_yojson (x : currency) = match x with CNY -> `String "CNY" | USD -> `String "USD"
let value_to_yojson = double_to_yojson

let estimated_monthly_savings_to_yojson (x : estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let savings_opportunity_to_yojson (x : savings_opportunity) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let ebs_estimated_monthly_savings_to_yojson (x : ebs_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let ebs_savings_opportunity_after_discounts_to_yojson (x : ebs_savings_opportunity_after_discounts)
    =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson ebs_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let volume_recommendation_option_to_yojson (x : volume_recommendation_option) =
  assoc_to_yojson
    [
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson ebs_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("configuration", option_to_yojson volume_configuration_to_yojson x.configuration);
    ]

let volume_recommendation_options_to_yojson tree =
  list_to_yojson volume_recommendation_option_to_yojson tree

let last_refresh_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let current_performance_risk_to_yojson (x : current_performance_risk) =
  match x with
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"
  | VERY_LOW -> `String "VeryLow"

let ebs_savings_estimation_mode_source_to_yojson (x : ebs_savings_estimation_mode_source) =
  match x with
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | PUBLIC_PRICING -> `String "PublicPricing"

let ebs_savings_estimation_mode_to_yojson (x : ebs_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson ebs_savings_estimation_mode_source_to_yojson x.source) ]

let look_back_period_preference_to_yojson (x : look_back_period_preference) =
  match x with
  | DAYS_93 -> `String "DAYS_93"
  | DAYS_32 -> `String "DAYS_32"
  | DAYS_14 -> `String "DAYS_14"

let ebs_effective_recommendation_preferences_to_yojson
    (x : ebs_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "savingsEstimationMode",
        option_to_yojson ebs_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let volume_recommendation_to_yojson (x : volume_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "effectiveRecommendationPreferences",
        option_to_yojson ebs_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "volumeRecommendationOptions",
        option_to_yojson volume_recommendation_options_to_yojson x.volume_recommendation_options );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "utilizationMetrics",
        option_to_yojson ebs_utilization_metrics_to_yojson x.utilization_metrics );
      ("finding", option_to_yojson ebs_finding_to_yojson x.finding);
      ( "currentConfiguration",
        option_to_yojson volume_configuration_to_yojson x.current_configuration );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("volumeArn", option_to_yojson volume_arn_to_yojson x.volume_arn);
    ]

let volume_recommendations_to_yojson tree = list_to_yojson volume_recommendation_to_yojson tree
let volume_arns_to_yojson tree = list_to_yojson volume_arn_to_yojson tree
let very_low_to_yojson = long_to_yojson

let customizable_metric_name_to_yojson (x : customizable_metric_name) =
  match x with
  | MEMORY_UTILIZATION -> `String "MemoryUtilization"
  | CPU_UTILIZATION -> `String "CpuUtilization"

let customizable_metric_threshold_to_yojson (x : customizable_metric_threshold) =
  match x with P99_5 -> `String "P99_5" | P95 -> `String "P95" | P90 -> `String "P90"

let customizable_metric_headroom_to_yojson (x : customizable_metric_headroom) =
  match x with
  | PERCENT_0 -> `String "PERCENT_0"
  | PERCENT_10 -> `String "PERCENT_10"
  | PERCENT_20 -> `String "PERCENT_20"
  | PERCENT_30 -> `String "PERCENT_30"

let customizable_metric_parameters_to_yojson (x : customizable_metric_parameters) =
  assoc_to_yojson
    [
      ("headroom", option_to_yojson customizable_metric_headroom_to_yojson x.headroom);
      ("threshold", option_to_yojson customizable_metric_threshold_to_yojson x.threshold);
    ]

let utilization_preference_to_yojson (x : utilization_preference) =
  assoc_to_yojson
    [
      ( "metricParameters",
        option_to_yojson customizable_metric_parameters_to_yojson x.metric_parameters );
      ("metricName", option_to_yojson customizable_metric_name_to_yojson x.metric_name);
    ]

let utilization_preferences_to_yojson tree = list_to_yojson utilization_preference_to_yojson tree

let metric_name_to_yojson (x : metric_name) =
  match x with
  | GPU_MEMORY_PERCENTAGE -> `String "GPU_MEMORY_PERCENTAGE"
  | GPU_PERCENTAGE -> `String "GPU_PERCENTAGE"
  | NETWORK_PACKETS_OUT_PER_SECOND -> `String "NETWORK_PACKETS_OUT_PER_SECOND"
  | NETWORK_PACKETS_IN_PER_SECOND -> `String "NETWORK_PACKETS_IN_PER_SECOND"
  | NETWORK_OUT_BYTES_PER_SECOND -> `String "NETWORK_OUT_BYTES_PER_SECOND"
  | NETWORK_IN_BYTES_PER_SECOND -> `String "NETWORK_IN_BYTES_PER_SECOND"
  | DISK_WRITE_BYTES_PER_SECOND -> `String "DISK_WRITE_BYTES_PER_SECOND"
  | DISK_READ_BYTES_PER_SECOND -> `String "DISK_READ_BYTES_PER_SECOND"
  | DISK_WRITE_OPS_PER_SECOND -> `String "DISK_WRITE_OPS_PER_SECOND"
  | DISK_READ_OPS_PER_SECOND -> `String "DISK_READ_OPS_PER_SECOND"
  | EBS_WRITE_BYTES_PER_SECOND -> `String "EBS_WRITE_BYTES_PER_SECOND"
  | EBS_READ_BYTES_PER_SECOND -> `String "EBS_READ_BYTES_PER_SECOND"
  | EBS_WRITE_OPS_PER_SECOND -> `String "EBS_WRITE_OPS_PER_SECOND"
  | EBS_READ_OPS_PER_SECOND -> `String "EBS_READ_OPS_PER_SECOND"
  | MEMORY -> `String "Memory"
  | CPU -> `String "Cpu"

let utilization_metric_to_yojson (x : utilization_metric) =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson metric_name_to_yojson x.name);
    ]

let utilization_metrics_to_yojson tree = list_to_yojson utilization_metric_to_yojson tree
let upper_bound_value_to_yojson = double_to_yojson

let status_to_yojson (x : status) =
  match x with
  | FAILED -> `String "Failed"
  | PENDING -> `String "Pending"
  | INACTIVE -> `String "Inactive"
  | ACTIVE -> `String "Active"

let status_reason_to_yojson = string_to_yojson

let update_enrollment_status_response_to_yojson (x : update_enrollment_status_response) =
  assoc_to_yojson
    [
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let include_member_accounts_to_yojson = bool_to_yojson

let update_enrollment_status_request_to_yojson (x : update_enrollment_status_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("status", Some (status_to_yojson x.status));
    ]

let error_message_to_yojson = string_to_yojson

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

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let timestamps_to_yojson tree = list_to_yojson timestamp_to_yojson tree
let task_definition_arn_to_yojson = string_to_yojson
let summary_value_to_yojson = double_to_yojson

let finding_to_yojson (x : finding) =
  match x with
  | NOT_OPTIMIZED -> `String "NotOptimized"
  | OPTIMIZED -> `String "Optimized"
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | UNDER_PROVISIONED -> `String "Underprovisioned"

let finding_reason_code_to_yojson (x : finding_reason_code) =
  match x with
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"

let reason_code_summary_to_yojson (x : reason_code_summary) =
  assoc_to_yojson
    [
      ("value", option_to_yojson summary_value_to_yojson x.value);
      ("name", option_to_yojson finding_reason_code_to_yojson x.name);
    ]

let reason_code_summaries_to_yojson tree = list_to_yojson reason_code_summary_to_yojson tree

let summary_to_yojson (x : summary) =
  assoc_to_yojson
    [
      ( "reasonCodeSummaries",
        option_to_yojson reason_code_summaries_to_yojson x.reason_code_summaries );
      ("value", option_to_yojson summary_value_to_yojson x.value);
      ("name", option_to_yojson finding_to_yojson x.name);
    ]

let summaries_to_yojson tree = list_to_yojson summary_to_yojson tree
let storage_type_to_yojson = string_to_yojson
let nullable_memory_to_yojson = int_to_yojson
let nullable_cpu_to_yojson = int_to_yojson
let container_name_to_yojson = string_to_yojson
let nullable_memory_reservation_to_yojson = int_to_yojson

let memory_size_configuration_to_yojson (x : memory_size_configuration) =
  assoc_to_yojson
    [
      ( "memoryReservation",
        option_to_yojson nullable_memory_reservation_to_yojson x.memory_reservation );
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
    ]

let container_configuration_to_yojson (x : container_configuration) =
  assoc_to_yojson
    [
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ( "memorySizeConfiguration",
        option_to_yojson memory_size_configuration_to_yojson x.memory_size_configuration );
      ("containerName", option_to_yojson container_name_to_yojson x.container_name);
    ]

let container_configurations_to_yojson tree = list_to_yojson container_configuration_to_yojson tree

let auto_scaling_configuration_to_yojson (x : auto_scaling_configuration) =
  match x with
  | TARGET_TRACKING_SCALING_MEMORY -> `String "TargetTrackingScalingMemory"
  | TARGET_TRACKING_SCALING_CPU -> `String "TargetTrackingScalingCpu"

let service_configuration_to_yojson (x : service_configuration) =
  assoc_to_yojson
    [
      ("taskDefinitionArn", option_to_yojson task_definition_arn_to_yojson x.task_definition_arn);
      ( "autoScalingConfiguration",
        option_to_yojson auto_scaling_configuration_to_yojson x.auto_scaling_configuration );
      ( "containerConfigurations",
        option_to_yojson container_configurations_to_yojson x.container_configurations );
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
    ]

let service_arn_to_yojson = string_to_yojson
let service_arns_to_yojson tree = list_to_yojson service_arn_to_yojson tree
let scope_value_to_yojson = string_to_yojson

let scope_name_to_yojson (x : scope_name) =
  match x with
  | RESOURCE_ARN -> `String "ResourceArn"
  | ACCOUNT_ID -> `String "AccountId"
  | ORGANIZATION -> `String "Organization"

let scope_to_yojson (x : scope) =
  assoc_to_yojson
    [
      ("value", option_to_yojson scope_value_to_yojson x.value);
      ("name", option_to_yojson scope_name_to_yojson x.name);
    ]

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | BEFORE_DISCOUNTS -> `String "BeforeDiscounts"
  | AFTER_DISCOUNTS -> `String "AfterDiscounts"

let destination_bucket_to_yojson = string_to_yojson
let destination_key_prefix_to_yojson = string_to_yojson

let s3_destination_config_to_yojson (x : s3_destination_config) =
  assoc_to_yojson
    [
      ("keyPrefix", option_to_yojson destination_key_prefix_to_yojson x.key_prefix);
      ("bucket", option_to_yojson destination_bucket_to_yojson x.bucket);
    ]

let destination_key_to_yojson = string_to_yojson
let metadata_key_to_yojson = string_to_yojson

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ("metadataKey", option_to_yojson metadata_key_to_yojson x.metadata_key);
      ("key", option_to_yojson destination_key_to_yojson x.key);
      ("bucket", option_to_yojson destination_bucket_to_yojson x.bucket);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | IDLE -> `String "Idle"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDBClusterStorage"
  | RDS_DB_INSTANCE -> `String "RdsDBInstance"
  | LICENSE -> `String "License"
  | ECS_SERVICE -> `String "EcsService"
  | NOT_APPLICABLE -> `String "NotApplicable"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | EBS_VOLUME -> `String "EbsVolume"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EC2_INSTANCE -> `String "Ec2Instance"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_id_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson
let resource_arns_to_yojson tree = list_to_yojson resource_arn_to_yojson tree
let recommended_instance_type_to_yojson = string_to_yojson
let metric_values_to_yojson tree = list_to_yojson metric_value_to_yojson tree

let projected_metric_to_yojson (x : projected_metric) =
  assoc_to_yojson
    [
      ("values", option_to_yojson metric_values_to_yojson x.values);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("name", option_to_yojson metric_name_to_yojson x.name);
    ]

let projected_metrics_to_yojson tree = list_to_yojson projected_metric_to_yojson tree

let recommended_option_projected_metric_to_yojson (x : recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ("projectedMetrics", option_to_yojson projected_metrics_to_yojson x.projected_metrics);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ( "recommendedInstanceType",
        option_to_yojson recommended_instance_type_to_yojson x.recommended_instance_type );
    ]

let recommended_option_projected_metrics_to_yojson tree =
  list_to_yojson recommended_option_projected_metric_to_yojson tree

let recommended_db_instance_class_to_yojson = string_to_yojson

let idle_finding_to_yojson (x : idle_finding) =
  match x with
  | UNUSED -> `String "Unused"
  | UNATTACHED -> `String "Unattached"
  | IDLE -> `String "Idle"

let idle_summary_to_yojson (x : idle_summary) =
  assoc_to_yojson
    [
      ("value", option_to_yojson summary_value_to_yojson x.value);
      ("name", option_to_yojson idle_finding_to_yojson x.name);
    ]

let idle_summaries_to_yojson tree = list_to_yojson idle_summary_to_yojson tree

let recommendation_source_type_to_yojson (x : recommendation_source_type) =
  match x with
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"
  | WORKSPACES -> `String "WorkSpaces"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | NAT_GATEWAY -> `String "NatGateway"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDBClusterStorage"
  | RDS_DB_INSTANCE_STORAGE -> `String "RdsDBInstanceStorage"
  | RDS_DB_INSTANCE -> `String "RdsDBInstance"
  | LICENSE -> `String "License"
  | ECS_SERVICE -> `String "EcsService"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | EBS_VOLUME -> `String "EbsVolume"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EC2_INSTANCE -> `String "Ec2Instance"

let high_to_yojson = long_to_yojson
let medium_to_yojson = long_to_yojson
let low_to_yojson = long_to_yojson

let current_performance_risk_ratings_to_yojson (x : current_performance_risk_ratings) =
  assoc_to_yojson
    [
      ("veryLow", option_to_yojson very_low_to_yojson x.very_low);
      ("low", option_to_yojson low_to_yojson x.low);
      ("medium", option_to_yojson medium_to_yojson x.medium);
      ("high", option_to_yojson high_to_yojson x.high);
    ]

let inferred_workload_type_to_yojson (x : inferred_workload_type) =
  match x with
  | SQLSERVER -> `String "SQLServer"
  | KAFKA -> `String "Kafka"
  | REDIS -> `String "Redis"
  | POSTGRE_SQL -> `String "PostgreSql"
  | NGINX -> `String "Nginx"
  | MEMCACHED -> `String "Memcached"
  | APACHE_HADOOP -> `String "ApacheHadoop"
  | APACHE_CASSANDRA -> `String "ApacheCassandra"
  | AMAZON_EMR -> `String "AmazonEmr"

let inferred_workload_types_to_yojson tree = list_to_yojson inferred_workload_type_to_yojson tree

let inferred_workload_saving_to_yojson (x : inferred_workload_saving) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
    ]

let inferred_workload_savings_to_yojson tree =
  list_to_yojson inferred_workload_saving_to_yojson tree

let recommendation_summary_to_yojson (x : recommendation_summary) =
  assoc_to_yojson
    [
      ( "inferredWorkloadSavings",
        option_to_yojson inferred_workload_savings_to_yojson x.inferred_workload_savings );
      ( "currentPerformanceRiskRatings",
        option_to_yojson current_performance_risk_ratings_to_yojson
          x.current_performance_risk_ratings );
      ( "aggregatedSavingsOpportunity",
        option_to_yojson savings_opportunity_to_yojson x.aggregated_savings_opportunity );
      ( "idleSavingsOpportunity",
        option_to_yojson savings_opportunity_to_yojson x.idle_savings_opportunity );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "recommendationResourceType",
        option_to_yojson recommendation_source_type_to_yojson x.recommendation_resource_type );
      ("idleSummaries", option_to_yojson idle_summaries_to_yojson x.idle_summaries);
      ("summaries", option_to_yojson summaries_to_yojson x.summaries);
    ]

let recommendation_summaries_to_yojson tree = list_to_yojson recommendation_summary_to_yojson tree
let recommendation_source_arn_to_yojson = string_to_yojson

let recommendation_source_to_yojson (x : recommendation_source) =
  assoc_to_yojson
    [
      ( "recommendationSourceType",
        option_to_yojson recommendation_source_type_to_yojson x.recommendation_source_type );
      ( "recommendationSourceArn",
        option_to_yojson recommendation_source_arn_to_yojson x.recommendation_source_arn );
    ]

let recommendation_sources_to_yojson tree = list_to_yojson recommendation_source_to_yojson tree

let enhanced_infrastructure_metrics_to_yojson (x : enhanced_infrastructure_metrics) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let inferred_workload_types_preference_to_yojson (x : inferred_workload_types_preference) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let external_metrics_source_to_yojson (x : external_metrics_source) =
  match x with
  | INSTANA -> `String "Instana"
  | NEWRELIC -> `String "NewRelic"
  | DYNATRACE -> `String "Dynatrace"
  | DATADOG -> `String "Datadog"

let external_metrics_preference_to_yojson (x : external_metrics_preference) =
  assoc_to_yojson [ ("source", option_to_yojson external_metrics_source_to_yojson x.source) ]

let preferred_resource_name_to_yojson (x : preferred_resource_name) =
  match x with EC2_INSTANCE_TYPES -> `String "Ec2InstanceTypes"

let preferred_resource_value_to_yojson = string_to_yojson

let preferred_resource_values_to_yojson tree =
  list_to_yojson preferred_resource_value_to_yojson tree

let effective_preferred_resource_to_yojson (x : effective_preferred_resource) =
  assoc_to_yojson
    [
      ("excludeList", option_to_yojson preferred_resource_values_to_yojson x.exclude_list);
      ( "effectiveIncludeList",
        option_to_yojson preferred_resource_values_to_yojson x.effective_include_list );
      ("includeList", option_to_yojson preferred_resource_values_to_yojson x.include_list);
      ("name", option_to_yojson preferred_resource_name_to_yojson x.name);
    ]

let effective_preferred_resources_to_yojson tree =
  list_to_yojson effective_preferred_resource_to_yojson tree

let recommendation_preferences_detail_to_yojson (x : recommendation_preferences_detail) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("scope", option_to_yojson scope_to_yojson x.scope);
    ]

let recommendation_preferences_details_to_yojson tree =
  list_to_yojson recommendation_preferences_detail_to_yojson tree

let cpu_vendor_architecture_to_yojson (x : cpu_vendor_architecture) =
  match x with CURRENT -> `String "CURRENT" | AWS_ARM64 -> `String "AWS_ARM64"

let cpu_vendor_architectures_to_yojson tree = list_to_yojson cpu_vendor_architecture_to_yojson tree

let recommendation_preferences_to_yojson (x : recommendation_preferences) =
  assoc_to_yojson
    [
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
    ]

let recommendation_preference_name_to_yojson (x : recommendation_preference_name) =
  match x with
  | UTILIZATION_PREFERENCES -> `String "UtilizationPreferences"
  | PREFERRED_RESOURCES -> `String "PreferredResources"
  | LOOKBACK_PERIOD_PREFERENCE -> `String "LookBackPeriodPreference"
  | EXTERNAL_METRICS_PREFERENCE -> `String "ExternalMetricsPreference"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | ENHANCED_INFRASTRUCTURE_METRICS -> `String "EnhancedInfrastructureMetrics"

let recommendation_preference_names_to_yojson tree =
  list_to_yojson recommendation_preference_name_to_yojson tree

let instance_type_to_yojson = string_to_yojson
let gpu_count_to_yojson = int_to_yojson
let gpu_memory_size_in_mi_b_to_yojson = int_to_yojson

let gpu_to_yojson (x : gpu) =
  assoc_to_yojson
    [
      ( "gpuMemorySizeInMiB",
        option_to_yojson gpu_memory_size_in_mi_b_to_yojson x.gpu_memory_size_in_mi_b );
      ("gpuCount", option_to_yojson gpu_count_to_yojson x.gpu_count);
    ]

let gpus_to_yojson tree = list_to_yojson gpu_to_yojson tree

let gpu_info_to_yojson (x : gpu_info) =
  assoc_to_yojson [ ("gpus", option_to_yojson gpus_to_yojson x.gpus) ]

let projected_utilization_metrics_to_yojson tree = list_to_yojson utilization_metric_to_yojson tree

let platform_difference_to_yojson (x : platform_difference) =
  match x with
  | ARCHITECTURE -> `String "Architecture"
  | VIRTUALIZATION_TYPE -> `String "VirtualizationType"
  | INSTANCE_STORE_AVAILABILITY -> `String "InstanceStoreAvailability"
  | STORAGE_INTERFACE -> `String "StorageInterface"
  | NETWORK_INTERFACE -> `String "NetworkInterface"
  | HYPERVISOR -> `String "Hypervisor"

let platform_differences_to_yojson tree = list_to_yojson platform_difference_to_yojson tree

let instance_estimated_monthly_savings_to_yojson (x : instance_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let instance_savings_opportunity_after_discounts_to_yojson
    (x : instance_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson instance_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let migration_effort_to_yojson (x : migration_effort) =
  match x with
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"
  | VERY_LOW -> `String "VeryLow"

let instance_recommendation_option_to_yojson (x : instance_recommendation_option) =
  assoc_to_yojson
    [
      ("migrationEffort", option_to_yojson migration_effort_to_yojson x.migration_effort);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson instance_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ("platformDifferences", option_to_yojson platform_differences_to_yojson x.platform_differences);
      ( "projectedUtilizationMetrics",
        option_to_yojson projected_utilization_metrics_to_yojson x.projected_utilization_metrics );
      ("instanceGpuInfo", option_to_yojson gpu_info_to_yojson x.instance_gpu_info);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
    ]

let recommendation_options_to_yojson tree =
  list_to_yojson instance_recommendation_option_to_yojson tree

let job_id_to_yojson = string_to_yojson

let export_destination_to_yojson (x : export_destination) =
  assoc_to_yojson [ ("s3", option_to_yojson s3_destination_to_yojson x.s3) ]

let job_status_to_yojson (x : job_status) =
  match x with
  | FAILED -> `String "Failed"
  | COMPLETE -> `String "Complete"
  | IN_PROGRESS -> `String "InProgress"
  | QUEUED -> `String "Queued"

let creation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let last_updated_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let failure_reason_to_yojson = string_to_yojson

let recommendation_export_job_to_yojson (x : recommendation_export_job) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
      ("creationTimestamp", option_to_yojson creation_timestamp_to_yojson x.creation_timestamp);
      ("status", option_to_yojson job_status_to_yojson x.status);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("destination", option_to_yojson export_destination_to_yojson x.destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let recommendation_export_jobs_to_yojson tree =
  list_to_yojson recommendation_export_job_to_yojson tree

let rds_storage_estimated_monthly_savings_to_yojson (x : rds_storage_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let rds_storage_savings_opportunity_after_discounts_to_yojson
    (x : rds_storage_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson rds_storage_estimated_monthly_savings_to_yojson x.estimated_monthly_savings
      );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let rds_storage_finding_reason_code_to_yojson (x : rds_storage_finding_reason_code) =
  match x with
  | DB_CLUSTER_STORAGE_SAVINGS_AVAILABLE -> `String "DBClusterStorageSavingsAvailable"
  | DB_CLUSTER_STORAGE_OPTION_AVAILABLE -> `String "DBClusterStorageOptionAvailable"
  | NEW_GENERATION_STORAGE_TYPE_AVAILABLE -> `String "NewGenerationStorageTypeAvailable"
  | EBS_VOLUME_THROUGHPUT_OVER_PROVISIONED -> `String "EBSVolumeThroughputOverprovisioned"
  | EBS_VOLUME_IOPS_OVER_PROVISIONED -> `String "EBSVolumeIOPSOverprovisioned"
  | EBS_VOLUME_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSVolumeThroughputUnderprovisioned"
  | EBS_VOLUME_ALLOCATED_STORAGE_UNDER_PROVISIONED ->
      `String "EBSVolumeAllocatedStorageUnderprovisioned"

let rds_storage_finding_reason_codes_to_yojson tree =
  list_to_yojson rds_storage_finding_reason_code_to_yojson tree

let rds_storage_finding_to_yojson (x : rds_storage_finding) =
  match x with
  | NOT_OPTIMIZED -> `String "NotOptimized"
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OPTIMIZED -> `String "Optimized"

let rds_savings_estimation_mode_source_to_yojson (x : rds_savings_estimation_mode_source) =
  match x with
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | PUBLIC_PRICING -> `String "PublicPricing"

let rds_savings_estimation_mode_to_yojson (x : rds_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson rds_savings_estimation_mode_source_to_yojson x.source) ]

let rds_instance_estimated_monthly_savings_to_yojson (x : rds_instance_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let rds_instance_savings_opportunity_after_discounts_to_yojson
    (x : rds_instance_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson rds_instance_estimated_monthly_savings_to_yojson
          x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let rds_instance_finding_reason_code_to_yojson (x : rds_instance_finding_reason_code) =
  match x with
  | INSTANCE_STORAGE_WRITE_IOPS_UNDER_PROVISIONED ->
      `String "InstanceStorageWriteIOPSUnderprovisioned"
  | INSTANCE_STORAGE_READ_IOPS_UNDER_PROVISIONED ->
      `String "InstanceStorageReadIOPSUnderprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | DB_CLUSTER_WRITER_UNDER_PROVISIONED -> `String "DBClusterWriterUnderprovisioned"
  | NEW_ENGINE_VERSION_AVAILABLE -> `String "NewEngineVersionAvailable"
  | NEW_GENERATION_DB_INSTANCE_CLASS_AVAILABLE -> `String "NewGenerationDBInstanceClassAvailable"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSThroughputUnderprovisioned"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NetworkBandwidthUnderprovisioned"
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBSThroughputOverprovisioned"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBSIOPSUnderprovisioned"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBSIOPSOverprovisioned"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NetworkBandwidthOverprovisioned"
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"

let rds_instance_finding_reason_codes_to_yojson tree =
  list_to_yojson rds_instance_finding_reason_code_to_yojson tree

let rds_instance_finding_to_yojson (x : rds_instance_finding) =
  match x with
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OPTIMIZED -> `String "Optimized"

let rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
    (x : rds_estimated_monthly_volume_io_ps_cost_variation) =
  match x with
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"
  | NONE -> `String "None"

let rds_effective_recommendation_preferences_to_yojson
    (x : rds_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson rds_savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
    ]

let rdsdb_metric_name_to_yojson (x : rdsdb_metric_name) =
  match x with
  | VOLUME_WRITE_IOPS -> `String "VolumeWriteIOPs"
  | VOLUME_BYTES_USED -> `String "VolumeBytesUsed"
  | VOLUME_READ_IOPS -> `String "VolumeReadIOPs"
  | WRITE_IOPS_EPHEMERAL_STORAGE -> `String "WriteIOPSEphemeralStorage"
  | READ_IOPS_EPHEMERAL_STORAGE -> `String "ReadIOPSEphemeralStorage"
  | AURORA_MEMORY_NUM_KILL_QUERY_TOTAL -> `String "AuroraMemoryNumKillQueryTotal"
  | AURORA_MEMORY_NUM_KILL_CONN_TOTAL -> `String "AuroraMemoryNumKillConnTotal"
  | AURORA_MEMORY_NUM_DECLINED_SQL -> `String "AuroraMemoryNumDeclinedSql"
  | AURORA_MEMORY_HEALTH_STATE -> `String "AuroraMemoryHealthState"
  | STORAGE_NETWORK_TRANSMIT_THROUGHPUT -> `String "StorageNetworkTransmitThroughput"
  | STORAGE_NETWORK_RECEIVE_THROUGHPUT -> `String "StorageNetworkReceiveThroughput"
  | DATABASE_CONNECTIONS -> `String "DatabaseConnections"
  | EBS_VOLUME_WRITE_THROUGHPUT -> `String "EBSVolumeWriteThroughput"
  | EBS_VOLUME_READ_THROUGHPUT -> `String "EBSVolumeReadThroughput"
  | EBS_VOLUME_WRITE_IOPS -> `String "EBSVolumeWriteIOPS"
  | EBS_VOLUME_READ_IOPS -> `String "EBSVolumeReadIOPS"
  | NETWORK_TRANSMIT_THROUGHPUT -> `String "NetworkTransmitThroughput"
  | NETWORK_RECEIVE_THROUGHPUT -> `String "NetworkReceiveThroughput"
  | EBS_VOLUME_STORAGE_SPACE_UTILIZATION -> `String "EBSVolumeStorageSpaceUtilization"
  | MEMORY -> `String "Memory"
  | CPU -> `String "CPU"

let rds_database_projected_metric_to_yojson (x : rds_database_projected_metric) =
  assoc_to_yojson
    [
      ("values", option_to_yojson metric_values_to_yojson x.values);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("name", option_to_yojson rdsdb_metric_name_to_yojson x.name);
    ]

let rds_database_projected_metrics_to_yojson tree =
  list_to_yojson rds_database_projected_metric_to_yojson tree

let rds_database_recommended_option_projected_metric_to_yojson
    (x : rds_database_recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ( "projectedMetrics",
        option_to_yojson rds_database_projected_metrics_to_yojson x.projected_metrics );
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ( "recommendedDBInstanceClass",
        option_to_yojson recommended_db_instance_class_to_yojson x.recommended_db_instance_class );
    ]

let rds_database_recommended_option_projected_metrics_to_yojson tree =
  list_to_yojson rds_database_recommended_option_projected_metric_to_yojson tree

let rdsdb_metric_statistic_to_yojson (x : rdsdb_metric_statistic) =
  match x with
  | AVERAGE -> `String "Average"
  | MINIMUM -> `String "Minimum"
  | MAXIMUM -> `String "Maximum"

let rdsdb_utilization_metric_to_yojson (x : rdsdb_utilization_metric) =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson rdsdb_metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson rdsdb_metric_name_to_yojson x.name);
    ]

let rdsdb_utilization_metrics_to_yojson tree =
  list_to_yojson rdsdb_utilization_metric_to_yojson tree

let allocated_storage_to_yojson = int_to_yojson
let nullable_iop_s_to_yojson = int_to_yojson
let nullable_max_allocated_storage_to_yojson = int_to_yojson
let nullable_storage_throughput_to_yojson = int_to_yojson

let db_storage_configuration_to_yojson (x : db_storage_configuration) =
  assoc_to_yojson
    [
      ( "storageThroughput",
        option_to_yojson nullable_storage_throughput_to_yojson x.storage_throughput );
      ( "maxAllocatedStorage",
        option_to_yojson nullable_max_allocated_storage_to_yojson x.max_allocated_storage );
      ("iops", option_to_yojson nullable_iop_s_to_yojson x.iops);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("storageType", option_to_yojson storage_type_to_yojson x.storage_type);
    ]

let rdsdb_storage_recommendation_option_to_yojson (x : rdsdb_storage_recommendation_option) =
  assoc_to_yojson
    [
      ( "estimatedMonthlyVolumeIOPsCostVariation",
        option_to_yojson rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
          x.estimated_monthly_volume_io_ps_cost_variation );
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson rds_storage_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ( "storageConfiguration",
        option_to_yojson db_storage_configuration_to_yojson x.storage_configuration );
    ]

let rdsdb_storage_recommendation_options_to_yojson tree =
  list_to_yojson rdsdb_storage_recommendation_option_to_yojson tree

let engine_to_yojson = string_to_yojson
let engine_version_to_yojson = string_to_yojson
let promotion_tier_to_yojson = int_to_yojson
let current_db_instance_class_to_yojson = string_to_yojson
let db_cluster_identifier_to_yojson = string_to_yojson
let idle_to_yojson (x : idle) = match x with FALSE -> `String "False" | TRUE -> `String "True"

let rds_current_instance_performance_risk_to_yojson (x : rds_current_instance_performance_risk) =
  match x with
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"
  | VERY_LOW -> `String "VeryLow"

let db_instance_class_to_yojson = string_to_yojson

let rdsdb_projected_utilization_metrics_to_yojson tree =
  list_to_yojson rdsdb_utilization_metric_to_yojson tree

let rdsdb_instance_recommendation_option_to_yojson (x : rdsdb_instance_recommendation_option) =
  assoc_to_yojson
    [
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson rds_instance_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ( "projectedUtilizationMetrics",
        option_to_yojson rdsdb_projected_utilization_metrics_to_yojson
          x.projected_utilization_metrics );
      ("dbInstanceClass", option_to_yojson db_instance_class_to_yojson x.db_instance_class);
    ]

let rdsdb_instance_recommendation_options_to_yojson tree =
  list_to_yojson rdsdb_instance_recommendation_option_to_yojson tree

let rdsdb_recommendation_to_yojson (x : rdsdb_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "effectiveRecommendationPreferences",
        option_to_yojson rds_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "utilizationMetrics",
        option_to_yojson rdsdb_utilization_metrics_to_yojson x.utilization_metrics );
      ( "storageRecommendationOptions",
        option_to_yojson rdsdb_storage_recommendation_options_to_yojson
          x.storage_recommendation_options );
      ( "instanceRecommendationOptions",
        option_to_yojson rdsdb_instance_recommendation_options_to_yojson
          x.instance_recommendation_options );
      ( "storageFindingReasonCodes",
        option_to_yojson rds_storage_finding_reason_codes_to_yojson x.storage_finding_reason_codes
      );
      ( "currentStorageEstimatedMonthlyVolumeIOPsCostVariation",
        option_to_yojson rds_estimated_monthly_volume_io_ps_cost_variation_to_yojson
          x.current_storage_estimated_monthly_volume_io_ps_cost_variation );
      ( "currentInstancePerformanceRisk",
        option_to_yojson rds_current_instance_performance_risk_to_yojson
          x.current_instance_performance_risk );
      ( "instanceFindingReasonCodes",
        option_to_yojson rds_instance_finding_reason_codes_to_yojson x.instance_finding_reason_codes
      );
      ("storageFinding", option_to_yojson rds_storage_finding_to_yojson x.storage_finding);
      ("instanceFinding", option_to_yojson rds_instance_finding_to_yojson x.instance_finding);
      ("idle", option_to_yojson idle_to_yojson x.idle);
      ( "dbClusterIdentifier",
        option_to_yojson db_cluster_identifier_to_yojson x.db_cluster_identifier );
      ( "currentStorageConfiguration",
        option_to_yojson db_storage_configuration_to_yojson x.current_storage_configuration );
      ( "currentDBInstanceClass",
        option_to_yojson current_db_instance_class_to_yojson x.current_db_instance_class );
      ("promotionTier", option_to_yojson promotion_tier_to_yojson x.promotion_tier);
      ("engineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("engine", option_to_yojson engine_to_yojson x.engine);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let rdsdb_recommendations_to_yojson tree = list_to_yojson rdsdb_recommendation_to_yojson tree

let rdsdb_recommendation_filter_name_to_yojson (x : rdsdb_recommendation_filter_name) =
  match x with
  | IDLE -> `String "Idle"
  | STORAGE_FINDING_REASON_CODE -> `String "StorageFindingReasonCode"
  | STORAGE_FINDING -> `String "StorageFinding"
  | INSTANCE_FINDING_REASON_CODE -> `String "InstanceFindingReasonCode"
  | INSTANCE_FINDING -> `String "InstanceFinding"

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let rdsdb_recommendation_filter_to_yojson (x : rdsdb_recommendation_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson rdsdb_recommendation_filter_name_to_yojson x.name);
    ]

let rdsdb_recommendation_filters_to_yojson tree =
  list_to_yojson rdsdb_recommendation_filter_to_yojson tree

let put_recommendation_preferences_response_to_yojson = unit_to_yojson

let preferred_resource_to_yojson (x : preferred_resource) =
  assoc_to_yojson
    [
      ("excludeList", option_to_yojson preferred_resource_values_to_yojson x.exclude_list);
      ("includeList", option_to_yojson preferred_resource_values_to_yojson x.include_list);
      ("name", option_to_yojson preferred_resource_name_to_yojson x.name);
    ]

let preferred_resources_to_yojson tree = list_to_yojson preferred_resource_to_yojson tree

let put_recommendation_preferences_request_to_yojson (x : put_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ("preferredResources", option_to_yojson preferred_resources_to_yojson x.preferred_resources);
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let opt_in_required_exception_to_yojson (x : opt_in_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let period_to_yojson = int_to_yojson

let dimension_to_yojson (x : dimension) =
  match x with
  | SAVINGS_VALUE_AFTER_DISCOUNT -> `String "SavingsValueAfterDiscount"
  | SAVINGS_VALUE -> `String "SavingsValue"

let order_to_yojson (x : order) = match x with DESC -> `String "Desc" | ASC -> `String "Asc"

let order_by_to_yojson (x : order_by) =
  assoc_to_yojson
    [
      ("order", option_to_yojson order_to_yojson x.order);
      ("dimension", option_to_yojson dimension_to_yojson x.dimension);
    ]

let operating_system_to_yojson = string_to_yojson
let number_of_member_accounts_opted_in_to_yojson = int_to_yojson
let number_of_invocations_to_yojson = long_to_yojson
let number_of_cores_to_yojson = int_to_yojson
let nullable_instance_type_to_yojson = string_to_yojson
let nullable_estimated_instance_hour_reduction_percentage_to_yojson = double_to_yojson
let next_token_to_yojson = string_to_yojson
let mixed_instance_type_to_yojson = string_to_yojson
let mixed_instance_types_to_yojson tree = list_to_yojson mixed_instance_type_to_yojson tree
let min_size_to_yojson = int_to_yojson

let metric_source_provider_to_yojson (x : metric_source_provider) =
  match x with CloudWatchAppInsights -> `String "CloudWatchApplicationInsights"

let metric_provider_arn_to_yojson = string_to_yojson

let metric_source_to_yojson (x : metric_source) =
  assoc_to_yojson
    [
      ("providerArn", option_to_yojson metric_provider_arn_to_yojson x.provider_arn);
      ("provider", option_to_yojson metric_source_provider_to_yojson x.provider);
    ]

let metrics_source_to_yojson tree = list_to_yojson metric_source_to_yojson tree
let message_to_yojson = string_to_yojson
let memory_size_to_yojson = int_to_yojson
let member_accounts_enrolled_to_yojson = bool_to_yojson
let max_size_to_yojson = int_to_yojson
let max_results_to_yojson = int_to_yojson
let lower_bound_value_to_yojson = double_to_yojson

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let license_version_to_yojson = string_to_yojson

let license_edition_to_yojson (x : license_edition) =
  match x with
  | NO_LICENSE_EDITION_FOUND -> `String "NoLicenseEditionFound"
  | FREE -> `String "Free"
  | STANDARD -> `String "Standard"
  | ENTERPRISE -> `String "Enterprise"

let license_name_to_yojson (x : license_name) = match x with SQLSERVER -> `String "SQLServer"

let license_model_to_yojson (x : license_model) =
  match x with
  | BRING_YOUR_OWN_LICENSE -> `String "BringYourOwnLicense"
  | LICENSE_INCLUDED -> `String "LicenseIncluded"

let license_configuration_to_yojson (x : license_configuration) =
  assoc_to_yojson
    [
      ("metricsSource", option_to_yojson metrics_source_to_yojson x.metrics_source);
      ("licenseVersion", option_to_yojson license_version_to_yojson x.license_version);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("licenseName", option_to_yojson license_name_to_yojson x.license_name);
      ("licenseEdition", option_to_yojson license_edition_to_yojson x.license_edition);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("numberOfCores", option_to_yojson number_of_cores_to_yojson x.number_of_cores);
    ]

let license_finding_to_yojson (x : license_finding) =
  match x with
  | NOT_OPTIMIZED -> `String "NotOptimized"
  | OPTIMIZED -> `String "Optimized"
  | INSUFFICIENT_METRICS -> `String "InsufficientMetrics"

let license_finding_reason_code_to_yojson (x : license_finding_reason_code) =
  match x with
  | OPTIMIZED -> `String "Optimized"
  | LICENSE_OVER_PROVISIONED -> `String "LicenseOverprovisioned"
  | CW_APP_INSIGHTS_ERROR -> `String "CloudWatchApplicationInsightsError"
  | CW_APP_INSIGHTS_DISABLED -> `String "InvalidCloudWatchApplicationInsightsSetup"

let license_finding_reason_codes_to_yojson tree =
  list_to_yojson license_finding_reason_code_to_yojson tree

let license_recommendation_option_to_yojson (x : license_recommendation_option) =
  assoc_to_yojson
    [
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("licenseEdition", option_to_yojson license_edition_to_yojson x.license_edition);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("rank", option_to_yojson rank_to_yojson x.rank);
    ]

let license_recommendation_options_to_yojson tree =
  list_to_yojson license_recommendation_option_to_yojson tree

let license_recommendation_to_yojson (x : license_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "licenseRecommendationOptions",
        option_to_yojson license_recommendation_options_to_yojson x.license_recommendation_options
      );
      ( "findingReasonCodes",
        option_to_yojson license_finding_reason_codes_to_yojson x.finding_reason_codes );
      ("finding", option_to_yojson license_finding_to_yojson x.finding);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "currentLicenseConfiguration",
        option_to_yojson license_configuration_to_yojson x.current_license_configuration );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let license_recommendations_to_yojson tree = list_to_yojson license_recommendation_to_yojson tree

let license_recommendation_filter_name_to_yojson (x : license_recommendation_filter_name) =
  match x with
  | LICENSE_NAME -> `String "LicenseName"
  | LICENSE_FINDING_REASON_CODE -> `String "FindingReasonCode"
  | LICENSE_FINDING -> `String "Finding"

let license_recommendation_filter_to_yojson (x : license_recommendation_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson license_recommendation_filter_name_to_yojson x.name);
    ]

let license_recommendation_filters_to_yojson tree =
  list_to_yojson license_recommendation_filter_to_yojson tree

let lambda_estimated_monthly_savings_to_yojson (x : lambda_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let lambda_savings_opportunity_after_discounts_to_yojson
    (x : lambda_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson lambda_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let lambda_savings_estimation_mode_source_to_yojson (x : lambda_savings_estimation_mode_source) =
  match x with
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | PUBLIC_PRICING -> `String "PublicPricing"

let lambda_savings_estimation_mode_to_yojson (x : lambda_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson lambda_savings_estimation_mode_source_to_yojson x.source) ]

let lambda_function_metric_name_to_yojson (x : lambda_function_metric_name) =
  match x with MEMORY -> `String "Memory" | DURATION -> `String "Duration"

let lambda_function_metric_statistic_to_yojson (x : lambda_function_metric_statistic) =
  match x with AVERAGE -> `String "Average" | MAXIMUM -> `String "Maximum"

let lambda_function_utilization_metric_to_yojson (x : lambda_function_utilization_metric) =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson lambda_function_metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson lambda_function_metric_name_to_yojson x.name);
    ]

let lambda_function_utilization_metrics_to_yojson tree =
  list_to_yojson lambda_function_utilization_metric_to_yojson tree

let function_arn_to_yojson = string_to_yojson
let function_version_to_yojson = string_to_yojson

let lambda_function_recommendation_finding_to_yojson (x : lambda_function_recommendation_finding) =
  match x with
  | UNAVAILABLE -> `String "Unavailable"
  | NOT_OPTIMIZED -> `String "NotOptimized"
  | OPTIMIZED -> `String "Optimized"

let lambda_function_recommendation_finding_reason_code_to_yojson
    (x : lambda_function_recommendation_finding_reason_code) =
  match x with
  | INCONCLUSIVE -> `String "Inconclusive"
  | INSUFFICIENT_DATA -> `String "InsufficientData"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"

let lambda_function_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson lambda_function_recommendation_finding_reason_code_to_yojson tree

let lambda_function_memory_metric_name_to_yojson (x : lambda_function_memory_metric_name) =
  match x with DURATION -> `String "Duration"

let lambda_function_memory_metric_statistic_to_yojson (x : lambda_function_memory_metric_statistic)
    =
  match x with
  | EXPECTED -> `String "Expected"
  | UPPER_BOUND -> `String "UpperBound"
  | LOWER_BOUND -> `String "LowerBound"

let lambda_function_memory_projected_metric_to_yojson (x : lambda_function_memory_projected_metric)
    =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson lambda_function_memory_metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson lambda_function_memory_metric_name_to_yojson x.name);
    ]

let lambda_function_memory_projected_metrics_to_yojson tree =
  list_to_yojson lambda_function_memory_projected_metric_to_yojson tree

let lambda_function_memory_recommendation_option_to_yojson
    (x : lambda_function_memory_recommendation_option) =
  assoc_to_yojson
    [
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson lambda_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ( "projectedUtilizationMetrics",
        option_to_yojson lambda_function_memory_projected_metrics_to_yojson
          x.projected_utilization_metrics );
      ("memorySize", option_to_yojson memory_size_to_yojson x.memory_size);
      ("rank", option_to_yojson rank_to_yojson x.rank);
    ]

let lambda_function_memory_recommendation_options_to_yojson tree =
  list_to_yojson lambda_function_memory_recommendation_option_to_yojson tree

let lambda_effective_recommendation_preferences_to_yojson
    (x : lambda_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson lambda_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let lambda_function_recommendation_to_yojson (x : lambda_function_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "effectiveRecommendationPreferences",
        option_to_yojson lambda_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "memorySizeRecommendationOptions",
        option_to_yojson lambda_function_memory_recommendation_options_to_yojson
          x.memory_size_recommendation_options );
      ( "findingReasonCodes",
        option_to_yojson lambda_function_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ("finding", option_to_yojson lambda_function_recommendation_finding_to_yojson x.finding);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "utilizationMetrics",
        option_to_yojson lambda_function_utilization_metrics_to_yojson x.utilization_metrics );
      ( "numberOfInvocations",
        option_to_yojson number_of_invocations_to_yojson x.number_of_invocations );
      ("currentMemorySize", option_to_yojson memory_size_to_yojson x.current_memory_size);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("functionVersion", option_to_yojson function_version_to_yojson x.function_version);
      ("functionArn", option_to_yojson function_arn_to_yojson x.function_arn);
    ]

let lambda_function_recommendations_to_yojson tree =
  list_to_yojson lambda_function_recommendation_to_yojson tree

let lambda_function_recommendation_filter_name_to_yojson
    (x : lambda_function_recommendation_filter_name) =
  match x with FINDING_REASON_CODE -> `String "FindingReasonCode" | FINDING -> `String "Finding"

let lambda_function_recommendation_filter_to_yojson (x : lambda_function_recommendation_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson lambda_function_recommendation_filter_name_to_yojson x.name);
    ]

let lambda_function_recommendation_filters_to_yojson tree =
  list_to_yojson lambda_function_recommendation_filter_to_yojson tree

let job_ids_to_yojson tree = list_to_yojson job_id_to_yojson tree

let job_filter_name_to_yojson (x : job_filter_name) =
  match x with JOB_STATUS -> `String "JobStatus" | RESOURCE_TYPE -> `String "ResourceType"

let job_filter_to_yojson (x : job_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson job_filter_name_to_yojson x.name);
    ]

let job_filters_to_yojson tree = list_to_yojson job_filter_to_yojson tree

let instance_state_to_yojson (x : instance_state) =
  match x with
  | STOPPED -> `String "stopped"
  | STOPPING -> `String "stopping"
  | TERMINATED -> `String "terminated"
  | SHUTTING_DOWN -> `String "shutting-down"
  | RUNNING -> `String "running"
  | PENDING -> `String "pending"

let instance_savings_estimation_mode_source_to_yojson (x : instance_savings_estimation_mode_source)
    =
  match x with
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | PUBLIC_PRICING -> `String "PublicPricing"

let instance_savings_estimation_mode_to_yojson (x : instance_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson instance_savings_estimation_mode_source_to_yojson x.source) ]

let instance_arn_to_yojson = string_to_yojson
let instance_name_to_yojson = string_to_yojson
let current_instance_type_to_yojson = string_to_yojson

let instance_recommendation_finding_reason_code_to_yojson
    (x : instance_recommendation_finding_reason_code) =
  match x with
  | GPU_MEMORY_OVER_PROVISIONED -> `String "GPUMemoryOverprovisioned"
  | GPU_MEMORY_UNDER_PROVISIONED -> `String "GPUMemoryUnderprovisioned"
  | GPU_OVER_PROVISIONED -> `String "GPUOverprovisioned"
  | GPU_UNDER_PROVISIONED -> `String "GPUUnderprovisioned"
  | DISK_THROUGHPUT_UNDER_PROVISIONED -> `String "DiskThroughputUnderprovisioned"
  | DISK_THROUGHPUT_OVER_PROVISIONED -> `String "DiskThroughputOverprovisioned"
  | DISK_IOPS_UNDER_PROVISIONED -> `String "DiskIOPSUnderprovisioned"
  | DISK_IOPS_OVER_PROVISIONED -> `String "DiskIOPSOverprovisioned"
  | NETWORK_PPS_UNDER_PROVISIONED -> `String "NetworkPPSUnderprovisioned"
  | NETWORK_PPS_OVER_PROVISIONED -> `String "NetworkPPSOverprovisioned"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NetworkBandwidthUnderprovisioned"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NetworkBandwidthOverprovisioned"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBSIOPSUnderprovisioned"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBSIOPSOverprovisioned"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBSThroughputUnderprovisioned"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBSThroughputOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"

let instance_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson instance_recommendation_finding_reason_code_to_yojson tree

let effective_recommendation_preferences_to_yojson (x : effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson instance_savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_preference_to_yojson x.inferred_workload_types );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
      ( "cpuVendorArchitectures",
        option_to_yojson cpu_vendor_architectures_to_yojson x.cpu_vendor_architectures );
    ]

let external_metric_status_code_to_yojson (x : external_metric_status_code) =
  match x with
  | INSUFFICIENT_INSTANA_METRICS -> `String "INSUFFICIENT_INSTANA_METRICS"
  | INSUFFICIENT_NEWRELIC_METRICS -> `String "INSUFFICIENT_NEWRELIC_METRICS"
  | INSUFFICIENT_DYNATRACE_METRICS -> `String "INSUFFICIENT_DYNATRACE_METRICS"
  | INSUFFICIENT_DATADOG_METRICS -> `String "INSUFFICIENT_DATADOG_METRICS"
  | INSTANA_INTEGRATION_ERROR -> `String "INSTANA_INTEGRATION_ERROR"
  | NEWRELIC_INTEGRATION_ERROR -> `String "NEWRELIC_INTEGRATION_ERROR"
  | DYNATRACE_INTEGRATION_ERROR -> `String "DYNATRACE_INTEGRATION_ERROR"
  | DATADOG_INTEGRATION_ERROR -> `String "DATADOG_INTEGRATION_ERROR"
  | INTEGRATION_SUCCESS -> `String "INTEGRATION_SUCCESS"
  | NO_EXTERNAL_METRIC_SET -> `String "NO_EXTERNAL_METRIC_SET"

let external_metric_status_reason_to_yojson = string_to_yojson

let external_metric_status_to_yojson (x : external_metric_status) =
  assoc_to_yojson
    [
      ("statusReason", option_to_yojson external_metric_status_reason_to_yojson x.status_reason);
      ("statusCode", option_to_yojson external_metric_status_code_to_yojson x.status_code);
    ]

let instance_idle_to_yojson (x : instance_idle) =
  match x with FALSE -> `String "False" | TRUE -> `String "True"

let instance_recommendation_to_yojson (x : instance_recommendation) =
  assoc_to_yojson
    [
      ("idle", option_to_yojson instance_idle_to_yojson x.idle);
      ("currentInstanceGpuInfo", option_to_yojson gpu_info_to_yojson x.current_instance_gpu_info);
      ( "externalMetricStatus",
        option_to_yojson external_metric_status_to_yojson x.external_metric_status );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("instanceState", option_to_yojson instance_state_to_yojson x.instance_state);
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
      ( "effectiveRecommendationPreferences",
        option_to_yojson effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "recommendationSources",
        option_to_yojson recommendation_sources_to_yojson x.recommendation_sources );
      ( "recommendationOptions",
        option_to_yojson recommendation_options_to_yojson x.recommendation_options );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ("utilizationMetrics", option_to_yojson utilization_metrics_to_yojson x.utilization_metrics);
      ( "findingReasonCodes",
        option_to_yojson instance_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ("finding", option_to_yojson finding_to_yojson x.finding);
      ( "currentInstanceType",
        option_to_yojson current_instance_type_to_yojson x.current_instance_type );
      ("instanceName", option_to_yojson instance_name_to_yojson x.instance_name);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("instanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let instance_recommendations_to_yojson tree = list_to_yojson instance_recommendation_to_yojson tree
let instance_arns_to_yojson tree = list_to_yojson instance_arn_to_yojson tree

let idle_metric_name_to_yojson (x : idle_metric_name) =
  match x with
  | CURR_CONNECTIONS -> `String "CurrConnections"
  | ELASTI_CACHE_PROCESSING_UNITS -> `String "ElastiCacheProcessingUnits"
  | SET_TYPE_CMDS -> `String "SetTypeCmds"
  | GET_TYPE_CMDS -> `String "GetTypeCmds"
  | INVOCATIONS -> `String "Invocations"
  | USER_CONNECTED -> `String "UserConnected"
  | IS_IDLE -> `String "IsIdle"
  | KEYSPACE_MISSES -> `String "KeyspaceMisses"
  | KEYSPACE_HITS -> `String "KeyspaceHits"
  | CACHE_MISSES -> `String "CacheMisses"
  | CACHE_HITS -> `String "CacheHits"
  | ENGINE_CPU_UTILIZATION -> `String "EngineCPUUtilization"
  | NEW_CONNECTIONS -> `String "NewConnections"
  | CONSUMED_CHANGE_DATA_CAPTURE_UNITS -> `String "ConsumedChangeDataCaptureUnits"
  | CONSUMED_WRITE_CAPACITY_UNITS -> `String "ConsumedWriteCapacityUnits"
  | CONSUMED_READ_CAPACITY_UNITS -> `String "ConsumedReadCapacityUnits"
  | PACKETS_IN_FROM_DESTINATION -> `String "PacketsInFromDestination"
  | PACKETS_IN_FROM_SOURCE -> `String "PacketsInFromSource"
  | ACTIVE_CONNECTION_COUNT -> `String "ActiveConnectionCount"
  | VOLUME_WRITE_OPS_PER_SECOND -> `String "VolumeWriteOpsPerSecond"
  | VOLUME_READ_OPS_PER_SECOND -> `String "VolumeReadOpsPerSecond"
  | EBS_VOLUME_WRITE_IOPS -> `String "EBSVolumeWriteIOPS"
  | EBS_VOLUME_READ_IOPS -> `String "EBSVolumeReadIOPS"
  | DATABASE_CONNECTIONS -> `String "DatabaseConnections"
  | NETWORK_IN_BYTES_PER_SECOND -> `String "NetworkInBytesPerSecond"
  | NETWORK_OUT_BYTES_PER_SECOND -> `String "NetworkOutBytesPerSecond"
  | MEMORY -> `String "Memory"
  | CPU -> `String "CPU"

let idle_dimension_key_to_yojson = string_to_yojson
let idle_dimension_value_to_yojson = string_to_yojson
let idle_dimension_values_to_yojson tree = list_to_yojson idle_dimension_value_to_yojson tree

let idle_dimension_to_yojson (x : idle_dimension) =
  assoc_to_yojson
    [
      ("values", option_to_yojson idle_dimension_values_to_yojson x.values);
      ("key", option_to_yojson idle_dimension_key_to_yojson x.key);
    ]

let idle_dimensions_to_yojson tree = list_to_yojson idle_dimension_to_yojson tree

let idle_utilization_metric_to_yojson (x : idle_utilization_metric) =
  assoc_to_yojson
    [
      ("dimensions", option_to_yojson idle_dimensions_to_yojson x.dimensions);
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson idle_metric_name_to_yojson x.name);
    ]

let idle_utilization_metrics_to_yojson tree = list_to_yojson idle_utilization_metric_to_yojson tree

let idle_estimated_monthly_savings_to_yojson (x : idle_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let idle_savings_opportunity_after_discounts_to_yojson
    (x : idle_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson idle_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let idle_savings_opportunity_to_yojson (x : idle_savings_opportunity) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson idle_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let idle_recommendation_resource_type_to_yojson (x : idle_recommendation_resource_type) =
  match x with
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"
  | WORKSPACES -> `String "WorkSpaces"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | NAT_GATEWAY -> `String "NatGateway"
  | RDS_DB_INSTANCE -> `String "RDSDBInstance"
  | ECS_SERVICE -> `String "ECSService"
  | EBS_VOLUME -> `String "EBSVolume"
  | AUTO_SCALING_GROUP -> `String "AutoScalingGroup"
  | EC2_INSTANCE -> `String "EC2Instance"

let idle_finding_description_to_yojson = string_to_yojson

let idle_recommendation_to_yojson (x : idle_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ( "utilizationMetrics",
        option_to_yojson idle_utilization_metrics_to_yojson x.utilization_metrics );
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson idle_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ( "savingsOpportunity",
        option_to_yojson idle_savings_opportunity_to_yojson x.savings_opportunity );
      ( "findingDescription",
        option_to_yojson idle_finding_description_to_yojson x.finding_description );
      ("finding", option_to_yojson idle_finding_to_yojson x.finding);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("resourceType", option_to_yojson idle_recommendation_resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let idle_recommendations_to_yojson tree = list_to_yojson idle_recommendation_to_yojson tree

let idle_recommendation_filter_name_to_yojson (x : idle_recommendation_filter_name) =
  match x with RESOURCE_TYPE -> `String "ResourceType" | FINDING -> `String "Finding"

let idle_recommendation_filter_to_yojson (x : idle_recommendation_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson idle_recommendation_filter_name_to_yojson x.name);
    ]

let idle_recommendation_filters_to_yojson tree =
  list_to_yojson idle_recommendation_filter_to_yojson tree

let identifier_to_yojson = string_to_yojson
let code_to_yojson = string_to_yojson

let idle_recommendation_error_to_yojson (x : idle_recommendation_error) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson idle_recommendation_resource_type_to_yojson x.resource_type);
      ("message", option_to_yojson message_to_yojson x.message);
      ("code", option_to_yojson code_to_yojson x.code);
      ("identifier", option_to_yojson identifier_to_yojson x.identifier);
    ]

let idle_recommendation_errors_to_yojson tree =
  list_to_yojson idle_recommendation_error_to_yojson tree

let idle_max_results_to_yojson = int_to_yojson

let get_recommendation_summaries_response_to_yojson (x : get_recommendation_summaries_response) =
  assoc_to_yojson
    [
      ( "recommendationSummaries",
        option_to_yojson recommendation_summaries_to_yojson x.recommendation_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree

let get_recommendation_summaries_request_to_yojson (x : get_recommendation_summaries_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let get_recommendation_preferences_response_to_yojson (x : get_recommendation_preferences_response)
    =
  assoc_to_yojson
    [
      ( "recommendationPreferencesDetails",
        option_to_yojson recommendation_preferences_details_to_yojson
          x.recommendation_preferences_details );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_recommendation_preferences_request_to_yojson (x : get_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let get_recommendation_error_to_yojson (x : get_recommendation_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("code", option_to_yojson code_to_yojson x.code);
      ("identifier", option_to_yojson identifier_to_yojson x.identifier);
    ]

let get_recommendation_errors_to_yojson tree =
  list_to_yojson get_recommendation_error_to_yojson tree

let get_rds_database_recommendations_response_to_yojson
    (x : get_rds_database_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "rdsDBRecommendations",
        option_to_yojson rdsdb_recommendations_to_yojson x.rds_db_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_rds_database_recommendations_request_to_yojson
    (x : get_rds_database_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson rdsdb_recommendation_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
    ]

let get_rds_database_recommendation_projected_metrics_response_to_yojson
    (x : get_rds_database_recommendation_projected_metrics_response) =
  assoc_to_yojson
    [
      ( "recommendedOptionProjectedMetrics",
        option_to_yojson rds_database_recommended_option_projected_metrics_to_yojson
          x.recommended_option_projected_metrics );
    ]

let get_rds_database_recommendation_projected_metrics_request_to_yojson
    (x : get_rds_database_recommendation_projected_metrics_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("period", Some (period_to_yojson x.period));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let get_license_recommendations_response_to_yojson (x : get_license_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "licenseRecommendations",
        option_to_yojson license_recommendations_to_yojson x.license_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_license_recommendations_request_to_yojson (x : get_license_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson license_recommendation_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
    ]

let get_lambda_function_recommendations_response_to_yojson
    (x : get_lambda_function_recommendations_response) =
  assoc_to_yojson
    [
      ( "lambdaFunctionRecommendations",
        option_to_yojson lambda_function_recommendations_to_yojson x.lambda_function_recommendations
      );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let function_arns_to_yojson tree = list_to_yojson function_arn_to_yojson tree

let get_lambda_function_recommendations_request_to_yojson
    (x : get_lambda_function_recommendations_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson lambda_function_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("functionArns", option_to_yojson function_arns_to_yojson x.function_arns);
    ]

let get_idle_recommendations_response_to_yojson (x : get_idle_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson idle_recommendation_errors_to_yojson x.errors);
      ("idleRecommendations", option_to_yojson idle_recommendations_to_yojson x.idle_recommendations);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_idle_recommendations_request_to_yojson (x : get_idle_recommendations_request) =
  assoc_to_yojson
    [
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson idle_recommendation_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson idle_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
    ]

let account_enrollment_status_to_yojson (x : account_enrollment_status) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let account_enrollment_statuses_to_yojson tree =
  list_to_yojson account_enrollment_status_to_yojson tree

let get_enrollment_statuses_for_organization_response_to_yojson
    (x : get_enrollment_statuses_for_organization_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "accountEnrollmentStatuses",
        option_to_yojson account_enrollment_statuses_to_yojson x.account_enrollment_statuses );
    ]

let enrollment_filter_name_to_yojson (x : enrollment_filter_name) =
  match x with STATUS -> `String "Status"

let enrollment_filter_to_yojson (x : enrollment_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson enrollment_filter_name_to_yojson x.name);
    ]

let enrollment_filters_to_yojson tree = list_to_yojson enrollment_filter_to_yojson tree

let get_enrollment_statuses_for_organization_request_to_yojson
    (x : get_enrollment_statuses_for_organization_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson enrollment_filters_to_yojson x.filters);
    ]

let get_enrollment_status_response_to_yojson (x : get_enrollment_status_response) =
  assoc_to_yojson
    [
      ( "numberOfMemberAccountsOptedIn",
        option_to_yojson number_of_member_accounts_opted_in_to_yojson
          x.number_of_member_accounts_opted_in );
      ( "lastUpdatedTimestamp",
        option_to_yojson last_updated_timestamp_to_yojson x.last_updated_timestamp );
      ( "memberAccountsEnrolled",
        option_to_yojson member_accounts_enrolled_to_yojson x.member_accounts_enrolled );
      ("statusReason", option_to_yojson status_reason_to_yojson x.status_reason);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let get_enrollment_status_request_to_yojson = unit_to_yojson

let get_effective_recommendation_preferences_response_to_yojson
    (x : get_effective_recommendation_preferences_response) =
  assoc_to_yojson
    [
      ( "preferredResources",
        option_to_yojson effective_preferred_resources_to_yojson x.preferred_resources );
      ( "utilizationPreferences",
        option_to_yojson utilization_preferences_to_yojson x.utilization_preferences );
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "externalMetricsPreference",
        option_to_yojson external_metrics_preference_to_yojson x.external_metrics_preference );
      ( "enhancedInfrastructureMetrics",
        option_to_yojson enhanced_infrastructure_metrics_to_yojson x.enhanced_infrastructure_metrics
      );
    ]

let get_effective_recommendation_preferences_request_to_yojson
    (x : get_effective_recommendation_preferences_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let ecs_service_metric_name_to_yojson (x : ecs_service_metric_name) =
  match x with MEMORY -> `String "Memory" | CPU -> `String "Cpu"

let ecs_service_metric_statistic_to_yojson (x : ecs_service_metric_statistic) =
  match x with AVERAGE -> `String "Average" | MAXIMUM -> `String "Maximum"

let ecs_service_utilization_metric_to_yojson (x : ecs_service_utilization_metric) =
  assoc_to_yojson
    [
      ("value", option_to_yojson metric_value_to_yojson x.value);
      ("statistic", option_to_yojson ecs_service_metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
    ]

let ecs_service_utilization_metrics_to_yojson tree =
  list_to_yojson ecs_service_utilization_metric_to_yojson tree

let ecs_service_launch_type_to_yojson (x : ecs_service_launch_type) =
  match x with FARGATE -> `String "Fargate" | EC2 -> `String "EC2"

let ecs_service_recommendation_finding_to_yojson (x : ecs_service_recommendation_finding) =
  match x with
  | OVER_PROVISIONED -> `String "Overprovisioned"
  | UNDER_PROVISIONED -> `String "Underprovisioned"
  | OPTIMIZED -> `String "Optimized"

let ecs_service_recommendation_finding_reason_code_to_yojson
    (x : ecs_service_recommendation_finding_reason_code) =
  match x with
  | CPU_UNDER_PROVISIONED -> `String "CPUUnderprovisioned"
  | CPU_OVER_PROVISIONED -> `String "CPUOverprovisioned"
  | MEMORY_UNDER_PROVISIONED -> `String "MemoryUnderprovisioned"
  | MEMORY_OVER_PROVISIONED -> `String "MemoryOverprovisioned"

let ecs_service_recommendation_finding_reason_codes_to_yojson tree =
  list_to_yojson ecs_service_recommendation_finding_reason_code_to_yojson tree

let ecs_estimated_monthly_savings_to_yojson (x : ecs_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let ecs_savings_opportunity_after_discounts_to_yojson (x : ecs_savings_opportunity_after_discounts)
    =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson ecs_estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let ecs_service_projected_utilization_metric_to_yojson
    (x : ecs_service_projected_utilization_metric) =
  assoc_to_yojson
    [
      ("upperBoundValue", option_to_yojson upper_bound_value_to_yojson x.upper_bound_value);
      ("lowerBoundValue", option_to_yojson lower_bound_value_to_yojson x.lower_bound_value);
      ("statistic", option_to_yojson ecs_service_metric_statistic_to_yojson x.statistic);
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
    ]

let ecs_service_projected_utilization_metrics_to_yojson tree =
  list_to_yojson ecs_service_projected_utilization_metric_to_yojson tree

let container_recommendation_to_yojson (x : container_recommendation) =
  assoc_to_yojson
    [
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ( "memorySizeConfiguration",
        option_to_yojson memory_size_configuration_to_yojson x.memory_size_configuration );
      ("containerName", option_to_yojson container_name_to_yojson x.container_name);
    ]

let container_recommendations_to_yojson tree =
  list_to_yojson container_recommendation_to_yojson tree

let ecs_service_recommendation_option_to_yojson (x : ecs_service_recommendation_option) =
  assoc_to_yojson
    [
      ( "containerRecommendations",
        option_to_yojson container_recommendations_to_yojson x.container_recommendations );
      ( "projectedUtilizationMetrics",
        option_to_yojson ecs_service_projected_utilization_metrics_to_yojson
          x.projected_utilization_metrics );
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson ecs_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("cpu", option_to_yojson nullable_cpu_to_yojson x.cpu);
      ("memory", option_to_yojson nullable_memory_to_yojson x.memory);
    ]

let ecs_service_recommendation_options_to_yojson tree =
  list_to_yojson ecs_service_recommendation_option_to_yojson tree

let ecs_savings_estimation_mode_source_to_yojson (x : ecs_savings_estimation_mode_source) =
  match x with
  | COST_OPTIMIZATION_HUB -> `String "CostOptimizationHub"
  | COST_EXPLORER_RIGHTSIZING -> `String "CostExplorerRightsizing"
  | PUBLIC_PRICING -> `String "PublicPricing"

let ecs_savings_estimation_mode_to_yojson (x : ecs_savings_estimation_mode) =
  assoc_to_yojson
    [ ("source", option_to_yojson ecs_savings_estimation_mode_source_to_yojson x.source) ]

let ecs_effective_recommendation_preferences_to_yojson
    (x : ecs_effective_recommendation_preferences) =
  assoc_to_yojson
    [
      ("lookBackPeriod", option_to_yojson look_back_period_preference_to_yojson x.look_back_period);
      ( "savingsEstimationMode",
        option_to_yojson ecs_savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let ecs_service_recommendation_to_yojson (x : ecs_service_recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "effectiveRecommendationPreferences",
        option_to_yojson ecs_effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "serviceRecommendationOptions",
        option_to_yojson ecs_service_recommendation_options_to_yojson
          x.service_recommendation_options );
      ( "findingReasonCodes",
        option_to_yojson ecs_service_recommendation_finding_reason_codes_to_yojson
          x.finding_reason_codes );
      ("finding", option_to_yojson ecs_service_recommendation_finding_to_yojson x.finding);
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ("launchType", option_to_yojson ecs_service_launch_type_to_yojson x.launch_type);
      ( "lookbackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.lookback_period_in_days );
      ( "utilizationMetrics",
        option_to_yojson ecs_service_utilization_metrics_to_yojson x.utilization_metrics );
      ( "currentServiceConfiguration",
        option_to_yojson service_configuration_to_yojson x.current_service_configuration );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("serviceArn", option_to_yojson service_arn_to_yojson x.service_arn);
    ]

let ecs_service_recommendations_to_yojson tree =
  list_to_yojson ecs_service_recommendation_to_yojson tree

let get_ecs_service_recommendations_response_to_yojson
    (x : get_ecs_service_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "ecsServiceRecommendations",
        option_to_yojson ecs_service_recommendations_to_yojson x.ecs_service_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ecs_service_recommendation_filter_name_to_yojson (x : ecs_service_recommendation_filter_name) =
  match x with FINDING_REASON_CODE -> `String "FindingReasonCode" | FINDING -> `String "Finding"

let ecs_service_recommendation_filter_to_yojson (x : ecs_service_recommendation_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson ecs_service_recommendation_filter_name_to_yojson x.name);
    ]

let ecs_service_recommendation_filters_to_yojson tree =
  list_to_yojson ecs_service_recommendation_filter_to_yojson tree

let get_ecs_service_recommendations_request_to_yojson (x : get_ecs_service_recommendations_request)
    =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson ecs_service_recommendation_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("serviceArns", option_to_yojson service_arns_to_yojson x.service_arns);
    ]

let cpu_size_to_yojson = int_to_yojson

let ecs_service_projected_metric_to_yojson (x : ecs_service_projected_metric) =
  assoc_to_yojson
    [
      ("lowerBoundValues", option_to_yojson metric_values_to_yojson x.lower_bound_values);
      ("upperBoundValues", option_to_yojson metric_values_to_yojson x.upper_bound_values);
      ("timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("name", option_to_yojson ecs_service_metric_name_to_yojson x.name);
    ]

let ecs_service_projected_metrics_to_yojson tree =
  list_to_yojson ecs_service_projected_metric_to_yojson tree

let ecs_service_recommended_option_projected_metric_to_yojson
    (x : ecs_service_recommended_option_projected_metric) =
  assoc_to_yojson
    [
      ( "projectedMetrics",
        option_to_yojson ecs_service_projected_metrics_to_yojson x.projected_metrics );
      ("recommendedMemorySize", option_to_yojson memory_size_to_yojson x.recommended_memory_size);
      ("recommendedCpuUnits", option_to_yojson cpu_size_to_yojson x.recommended_cpu_units);
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
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("period", Some (period_to_yojson x.period));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("serviceArn", Some (service_arn_to_yojson x.service_arn));
    ]

let get_ec2_recommendation_projected_metrics_response_to_yojson
    (x : get_ec2_recommendation_projected_metrics_response) =
  assoc_to_yojson
    [
      ( "recommendedOptionProjectedMetrics",
        option_to_yojson recommended_option_projected_metrics_to_yojson
          x.recommended_option_projected_metrics );
    ]

let get_ec2_recommendation_projected_metrics_request_to_yojson
    (x : get_ec2_recommendation_projected_metrics_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("period", Some (period_to_yojson x.period));
      ("stat", Some (metric_statistic_to_yojson x.stat));
      ("instanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let get_ec2_instance_recommendations_response_to_yojson
    (x : get_ec2_instance_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "instanceRecommendations",
        option_to_yojson instance_recommendations_to_yojson x.instance_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let filter_name_to_yojson (x : filter_name) =
  match x with
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | RECOMMENDATION_SOURCE_TYPE -> `String "RecommendationSourceType"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | FINDING -> `String "Finding"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson filter_name_to_yojson x.name);
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let get_ec2_instance_recommendations_request_to_yojson
    (x : get_ec2_instance_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("instanceArns", option_to_yojson instance_arns_to_yojson x.instance_arns);
    ]

let get_ebs_volume_recommendations_response_to_yojson (x : get_ebs_volume_recommendations_response)
    =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "volumeRecommendations",
        option_to_yojson volume_recommendations_to_yojson x.volume_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ebs_filter_name_to_yojson (x : ebs_filter_name) = match x with FINDING -> `String "Finding"

let ebs_filter_to_yojson (x : ebs_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_values_to_yojson x.values);
      ("name", option_to_yojson ebs_filter_name_to_yojson x.name);
    ]

let ebs_filters_to_yojson tree = list_to_yojson ebs_filter_to_yojson tree

let get_ebs_volume_recommendations_request_to_yojson (x : get_ebs_volume_recommendations_request) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("filters", option_to_yojson ebs_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("volumeArns", option_to_yojson volume_arns_to_yojson x.volume_arns);
    ]

let auto_scaling_group_arn_to_yojson = string_to_yojson
let auto_scaling_group_name_to_yojson = string_to_yojson
let desired_capacity_to_yojson = int_to_yojson

let allocation_strategy_to_yojson (x : allocation_strategy) =
  match x with LOWEST_PRICE -> `String "LowestPrice" | PRIORITIZED -> `String "Prioritized"

let asg_type_to_yojson (x : asg_type) =
  match x with
  | MIXED_INSTANCE_TYPE -> `String "MixedInstanceTypes"
  | SINGLE_INSTANCE_TYPE -> `String "SingleInstanceType"

let auto_scaling_group_configuration_to_yojson (x : auto_scaling_group_configuration) =
  assoc_to_yojson
    [
      ("mixedInstanceTypes", option_to_yojson mixed_instance_types_to_yojson x.mixed_instance_types);
      ("type", option_to_yojson asg_type_to_yojson x.type_);
      ( "estimatedInstanceHourReductionPercentage",
        option_to_yojson nullable_estimated_instance_hour_reduction_percentage_to_yojson
          x.estimated_instance_hour_reduction_percentage );
      ("allocationStrategy", option_to_yojson allocation_strategy_to_yojson x.allocation_strategy);
      ("instanceType", option_to_yojson nullable_instance_type_to_yojson x.instance_type);
      ("maxSize", option_to_yojson max_size_to_yojson x.max_size);
      ("minSize", option_to_yojson min_size_to_yojson x.min_size);
      ("desiredCapacity", option_to_yojson desired_capacity_to_yojson x.desired_capacity);
    ]

let auto_scaling_group_estimated_monthly_savings_to_yojson
    (x : auto_scaling_group_estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("currency", option_to_yojson currency_to_yojson x.currency);
    ]

let auto_scaling_group_savings_opportunity_after_discounts_to_yojson
    (x : auto_scaling_group_savings_opportunity_after_discounts) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson auto_scaling_group_estimated_monthly_savings_to_yojson
          x.estimated_monthly_savings );
      ( "savingsOpportunityPercentage",
        option_to_yojson savings_opportunity_percentage_to_yojson x.savings_opportunity_percentage
      );
    ]

let auto_scaling_group_recommendation_option_to_yojson
    (x : auto_scaling_group_recommendation_option) =
  assoc_to_yojson
    [
      ("migrationEffort", option_to_yojson migration_effort_to_yojson x.migration_effort);
      ( "savingsOpportunityAfterDiscounts",
        option_to_yojson auto_scaling_group_savings_opportunity_after_discounts_to_yojson
          x.savings_opportunity_after_discounts );
      ("savingsOpportunity", option_to_yojson savings_opportunity_to_yojson x.savings_opportunity);
      ("rank", option_to_yojson rank_to_yojson x.rank);
      ("performanceRisk", option_to_yojson performance_risk_to_yojson x.performance_risk);
      ( "projectedUtilizationMetrics",
        option_to_yojson projected_utilization_metrics_to_yojson x.projected_utilization_metrics );
      ("instanceGpuInfo", option_to_yojson gpu_info_to_yojson x.instance_gpu_info);
      ("configuration", option_to_yojson auto_scaling_group_configuration_to_yojson x.configuration);
    ]

let auto_scaling_group_recommendation_options_to_yojson tree =
  list_to_yojson auto_scaling_group_recommendation_option_to_yojson tree

let auto_scaling_group_recommendation_to_yojson (x : auto_scaling_group_recommendation) =
  assoc_to_yojson
    [
      ( "inferredWorkloadTypes",
        option_to_yojson inferred_workload_types_to_yojson x.inferred_workload_types );
      ( "effectiveRecommendationPreferences",
        option_to_yojson effective_recommendation_preferences_to_yojson
          x.effective_recommendation_preferences );
      ( "currentPerformanceRisk",
        option_to_yojson current_performance_risk_to_yojson x.current_performance_risk );
      ( "lastRefreshTimestamp",
        option_to_yojson last_refresh_timestamp_to_yojson x.last_refresh_timestamp );
      ( "recommendationOptions",
        option_to_yojson auto_scaling_group_recommendation_options_to_yojson
          x.recommendation_options );
      ("currentInstanceGpuInfo", option_to_yojson gpu_info_to_yojson x.current_instance_gpu_info);
      ( "currentConfiguration",
        option_to_yojson auto_scaling_group_configuration_to_yojson x.current_configuration );
      ( "lookBackPeriodInDays",
        option_to_yojson look_back_period_in_days_to_yojson x.look_back_period_in_days );
      ("utilizationMetrics", option_to_yojson utilization_metrics_to_yojson x.utilization_metrics);
      ("finding", option_to_yojson finding_to_yojson x.finding);
      ( "autoScalingGroupName",
        option_to_yojson auto_scaling_group_name_to_yojson x.auto_scaling_group_name );
      ( "autoScalingGroupArn",
        option_to_yojson auto_scaling_group_arn_to_yojson x.auto_scaling_group_arn );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let auto_scaling_group_recommendations_to_yojson tree =
  list_to_yojson auto_scaling_group_recommendation_to_yojson tree

let get_auto_scaling_group_recommendations_response_to_yojson
    (x : get_auto_scaling_group_recommendations_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson get_recommendation_errors_to_yojson x.errors);
      ( "autoScalingGroupRecommendations",
        option_to_yojson auto_scaling_group_recommendations_to_yojson
          x.auto_scaling_group_recommendations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let auto_scaling_group_arns_to_yojson tree = list_to_yojson auto_scaling_group_arn_to_yojson tree

let get_auto_scaling_group_recommendations_request_to_yojson
    (x : get_auto_scaling_group_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "autoScalingGroupArns",
        option_to_yojson auto_scaling_group_arns_to_yojson x.auto_scaling_group_arns );
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let file_format_to_yojson (x : file_format) = match x with CSV -> `String "Csv"

let exportable_volume_field_to_yojson (x : exportable_volume_field) =
  match x with
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | CURRENT_CONFIGURATION_ROOT_VOLUME -> `String "CurrentConfigurationRootVolume"
  | ROOT_VOLUME -> `String "RootVolume"
  | TAGS -> `String "Tags"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | RECOMMENDATION_OPTIONS_MONTHLY_PRICE -> `String "RecommendationOptionsMonthlyPrice"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_SIZE ->
      `String "RecommendationOptionsConfigurationVolumeSize"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_THROUGHPUT ->
      `String "RecommendationOptionsConfigurationVolumeBurstThroughput"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_IOPS ->
      `String "RecommendationOptionsConfigurationVolumeBurstIOPS"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT ->
      `String "RecommendationOptionsConfigurationVolumeBaselineThroughput"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_IOPS ->
      `String "RecommendationOptionsConfigurationVolumeBaselineIOPS"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_TYPE ->
      `String "RecommendationOptionsConfigurationVolumeType"
  | CURRENT_MONTHLY_PRICE -> `String "CurrentMonthlyPrice"
  | CURRENT_CONFIGURATION_VOLUME_SIZE -> `String "CurrentConfigurationVolumeSize"
  | CURRENT_CONFIGURATION_VOLUME_BURST_THROUGHPUT ->
      `String "CurrentConfigurationVolumeBurstThroughput"
  | CURRENT_CONFIGURATION_VOLUME_BURST_IOPS -> `String "CurrentConfigurationVolumeBurstIOPS"
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT ->
      `String "CurrentConfigurationVolumeBaselineThroughput"
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_IOPS -> `String "CurrentConfigurationVolumeBaselineIOPS"
  | CURRENT_CONFIGURATION_VOLUME_TYPE -> `String "CurrentConfigurationVolumeType"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | UTILIZATION_METRICS_VOLUME_THROUGHPUT_EXCEEDED_MAXIMUM ->
      `String "UtilizationMetricsVolumeThroughputExceededMaximum"
  | UTILIZATION_METRICS_VOLUME_IOPS_EXCEEDED_MAXIMUM ->
      `String "UtilizationMetricsVolumeIOPSExceededMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum"
  | FINDING -> `String "Finding"
  | VOLUME_ARN -> `String "VolumeArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_volume_fields_to_yojson tree = list_to_yojson exportable_volume_field_to_yojson tree

let exportable_rdsdb_field_to_yojson (x : exportable_rdsdb_field) =
  match x with
  | PROMOTION_TIER -> `String "PromotionTier"
  | DB_CLUSTER_IDENTIFIER -> `String "DBClusterIdentifier"
  | TAGS -> `String "Tags"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "StorageRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsValue"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrency"
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "StorageRecommendationOptionsSavingsOpportunityPercentage"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterStorageIOOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterStorageOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST ->
      `String "StorageRecommendationOptionsEstimatedClusterInstanceOnDemandMonthlyCost"
  | STORAGE_RECOMMENDATION_OPTIONS_ON_DEMAND_MONTHLY_PRICE ->
      `String "StorageRecommendationOptionsOnDemandMonthlyPrice"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "InstanceRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValue"
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrency"
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "InstanceRecommendationOptionsSavingsOpportunityPercentage"
  | INSTANCE_RECOMMENDATION_OPTIONS_INSTANCE_ON_DEMAND_HOURLY_PRICE ->
      `String "InstanceRecommendationOptionsInstanceOnDemandHourlyPrice"
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION ->
      `String "StorageRecommendationOptionsEstimatedMonthlyVolumeIOPsCostVariation"
  | STORAGE_RECOMMENDATION_OPTIONS_RANK -> `String "StorageRecommendationOptionsRank"
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_THROUGHPUT ->
      `String "StorageRecommendationOptionsStorageThroughput"
  | STORAGE_RECOMMENDATION_OPTIONS_IOPS -> `String "StorageRecommendationOptionsIOPS"
  | STORAGE_RECOMMENDATION_OPTIONS_MAX_ALLOCATED_STORAGE ->
      `String "StorageRecommendationOptionsMaxAllocatedStorage"
  | STORAGE_RECOMMENDATION_OPTIONS_ALLOCATED_STORAGE ->
      `String "StorageRecommendationOptionsAllocatedStorage"
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_TYPE -> `String "StorageRecommendationOptionsStorageType"
  | INSTANCE_RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "InstanceRecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | INSTANCE_RECOMMENDATION_OPTIONS_PERFORMANCE_RISK ->
      `String "InstanceRecommendationOptionsPerformanceRisk"
  | INSTANCE_RECOMMENDATION_OPTIONS_RANK -> `String "InstanceRecommendationOptionsRank"
  | INSTANCE_RECOMMENDATION_OPTIONS_DB_INSTANCE_CLASS ->
      `String "InstanceRecommendationOptionsDBInstanceClass"
  | STORAGE_FINDING_REASON_CODES -> `String "StorageFindingReasonCodes"
  | STORAGE_FINDING -> `String "StorageFinding"
  | INSTANCE_FINDING_REASON_CODES -> `String "InstanceFindingReasonCodes"
  | INSTANCE_FINDING -> `String "InstanceFinding"
  | UTILIZATION_METRICS_VOLUME_WRITE_IOPS_AVERAGE ->
      `String "UtilizationMetricsVolumeWriteIOPsAverage"
  | UTILIZATION_METRICS_VOLUME_READ_IOPS_AVERAGE ->
      `String "UtilizationMetricsVolumeReadIOPsAverage"
  | UTILIZATION_METRICS_VOLUME_BYTES_USED_AVERAGE ->
      `String "UtilizationMetricsVolumeBytesUsedAverage"
  | UTILIZATION_METRICS_WRITE_IOPS_EPHEMERAL_STORAGE_MAXIMUM ->
      `String "UtilizationMetricsWriteIOPSEphemeralStorageMaximum"
  | UTILIZATION_METRICS_READ_IOPS_EPHEMERAL_STORAGE_MAXIMUM ->
      `String "UtilizationMetricsReadIOPSEphemeralStorageMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_QUERY_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumKillQueryTotalMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_CONN_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumKillConnTotalMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_DECLINED_SQL_TOTAL_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryNumDeclinedSqlTotalMaximum"
  | UTILIZATION_METRICS_AURORA_MEMORY_HEALTH_STATE_MAXIMUM ->
      `String "UtilizationMetricsAuroraMemoryHealthStateMaximum"
  | UTILIZATION_METRICS_STORAGE_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsStorageNetworkTransmitThroughputMaximum"
  | UTILIZATION_METRICS_STORAGE_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsStorageNetworkReceiveThroughputMaximum"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM ->
      `String "UtilizationMetricsDatabaseConnectionsMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteThroughputMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadThroughputMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadIOPSMaximum"
  | UTILIZATION_METRICS_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsNetworkTransmitThroughputMaximum"
  | UTILIZATION_METRICS_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM ->
      `String "UtilizationMetricsNetworkReceiveThroughputMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_STORAGE_SPACE_UTILIZATION_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeStorageSpaceUtilizationMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | CURRENT_INSTANCE_PERFORMANCE_RISK -> `String "CurrentInstancePerformanceRisk"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterStorageIOOnDemandMonthlyCost"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterStorageOnDemandMonthlyCost"
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST ->
      `String "CurrentStorageEstimatedClusterInstanceOnDemandMonthlyCost"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | CURRENT_STORAGE_ON_DEMAND_MONTHLY_PRICE -> `String "CurrentStorageOnDemandMonthlyPrice"
  | CURRENT_INSTANCE_ON_DEMAND_HOURLY_PRICE -> `String "CurrentInstanceOnDemandHourlyPrice"
  | CURRENT_STORAGE_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION ->
      `String "CurrentStorageEstimatedMonthlyVolumeIOPsCostVariation"
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_THROUGHPUT ->
      `String "CurrentStorageConfigurationStorageThroughput"
  | CURRENT_STORAGE_CONFIGURATION_IOPS -> `String "CurrentStorageConfigurationIOPS"
  | CURRENT_STORAGE_CONFIGURATION_MAX_ALLOCATED_STORAGE ->
      `String "CurrentStorageConfigurationMaxAllocatedStorage"
  | CURRENT_STORAGE_CONFIGURATION_ALLOCATED_STORAGE ->
      `String "CurrentStorageConfigurationAllocatedStorage"
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_TYPE -> `String "CurrentStorageConfigurationStorageType"
  | CURRENT_DB_INSTANCE_CLASS -> `String "CurrentDBInstanceClass"
  | CLUSTER_WRITER -> `String "ClusterWriter"
  | MULTI_AZ_DB_INSTANCE -> `String "MultiAZDBInstance"
  | IDLE -> `String "Idle"
  | ENGINE_VERSION -> `String "EngineVersion"
  | ENGINE -> `String "Engine"
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_ARN -> `String "ResourceArn"

let exportable_rdsdb_fields_to_yojson tree = list_to_yojson exportable_rdsdb_field_to_yojson tree

let exportable_license_field_to_yojson (x : exportable_license_field) =
  match x with
  | TAGS -> `String "Tags"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_LICENSE_MODEL -> `String "RecommendationOptionsLicenseModel"
  | RECOMMENDATION_OPTIONS_LICENSE_EDITION -> `String "RecommendationOptionsLicenseEdition"
  | RECOMMENDATION_OPTIONS_OPERATING_SYSTEM -> `String "RecommendationOptionsOperatingSystem"
  | CURRENT_LICENSE_CONFIGURATION_METRICS_SOURCE ->
      `String "CurrentLicenseConfigurationMetricsSource"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_VERSION ->
      `String "CurrentLicenseConfigurationLicenseVersion"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_MODEL -> `String "CurrentLicenseConfigurationLicenseModel"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_EDITION ->
      `String "CurrentLicenseConfigurationLicenseEdition"
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_NAME -> `String "CurrentLicenseConfigurationLicenseName"
  | CURRENT_LICENSE_CONFIGURATION_OPERATING_SYSTEM ->
      `String "CurrentLicenseConfigurationOperatingSystem"
  | CURRENT_LICENSE_CONFIGURATION_INSTANCE_TYPE -> `String "CurrentLicenseConfigurationInstanceType"
  | CURRENT_LICENSE_CONFIGURATION_NUMBER_OF_CORES ->
      `String "CurrentLicenseConfigurationNumberOfCores"
  | LICENSE_FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | LICENSE_FINDING -> `String "Finding"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | RESOURCE_ARN -> `String "ResourceArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_license_fields_to_yojson tree =
  list_to_yojson exportable_license_field_to_yojson tree

let exportable_lambda_function_field_to_yojson (x : exportable_lambda_function_field) =
  match x with
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | TAGS -> `String "Tags"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_EXPECTED ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationExpected"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_UPPER_BOUND ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationUpperBound"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_LOWER_BOUND ->
      `String "RecommendationOptionsProjectedUtilizationMetricsDurationLowerBound"
  | RECOMMENDATION_OPTIONS_COST_HIGH -> `String "RecommendationOptionsCostHigh"
  | RECOMMENDATION_OPTIONS_COST_LOW -> `String "RecommendationOptionsCostLow"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MEMORY_SIZE ->
      `String "RecommendationOptionsConfigurationMemorySize"
  | CURRENT_COST_AVERAGE -> `String "CurrentCostAverage"
  | CURRENT_COST_TOTAL -> `String "CurrentCostTotal"
  | CURRENT_CONFIGURATION_TIMEOUT -> `String "CurrentConfigurationTimeout"
  | CURRENT_CONFIGURATION_MEMORY_SIZE -> `String "CurrentConfigurationMemorySize"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | UTILIZATION_METRICS_MEMORY_AVERAGE -> `String "UtilizationMetricsMemoryAverage"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_DURATION_AVERAGE -> `String "UtilizationMetricsDurationAverage"
  | UTILIZATION_METRICS_DURATION_MAXIMUM -> `String "UtilizationMetricsDurationMaximum"
  | NUMBER_OF_INVOCATIONS -> `String "NumberOfInvocations"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | FINDING -> `String "Finding"
  | FUNCTION_VERSION -> `String "FunctionVersion"
  | FUNCTION_ARN -> `String "FunctionArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_lambda_function_fields_to_yojson tree =
  list_to_yojson exportable_lambda_function_field_to_yojson tree

let exportable_instance_field_to_yojson (x : exportable_instance_field) =
  match x with
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_UTILIZATION_PREFERENCES ->
      `String "EffectiveRecommendationPreferencesUtilizationPreferences"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES ->
      `String "EffectiveRecommendationPreferencesPreferredResources"
  | IDLE -> `String "Idle"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum"
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "UtilizationMetricsGpuMemoryPercentageMaximum"
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM -> `String "UtilizationMetricsGpuPercentageMaximum"
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO -> `String "RecommendationOptionsInstanceGpuInfo"
  | CURRENT_INSTANCE_GPU_INFO -> `String "CurrentInstanceGpuInfo"
  | EXTERNAL_METRIC_STATUS_REASON -> `String "ExternalMetricStatusReason"
  | EXTERNAL_METRIC_STATUS_CODE -> `String "ExternalMetricStatusCode"
  | INSTANCE_STATE -> `String "InstanceState"
  | TAGS -> `String "Tags"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_EXTERNAL_METRICS_SOURCE ->
      `String "EffectiveRecommendationPreferencesExternalMetricsSource"
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT -> `String "RecommendationOptionsMigrationEffort"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES ->
      `String "EffectiveRecommendationPreferencesInferredWorkloadTypes"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_TYPE ->
      `String "RecommendationsSourcesRecommendationSourceType"
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_ARN ->
      `String "RecommendationsSourcesRecommendationSourceArn"
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE -> `String "RecommendationOptionsOnDemandPrice"
  | RECOMMENDATION_OPTIONS_NETWORK -> `String "RecommendationOptionsNetwork"
  | RECOMMENDATION_OPTIONS_STORAGE -> `String "RecommendationOptionsStorage"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | RECOMMENDATION_OPTIONS_VCPUS -> `String "RecommendationOptionsVcpus"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | RECOMMENDATION_OPTIONS_PLATFORM_DIFFERENCES ->
      `String "RecommendationOptionsPlatformDifferences"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_INSTANCE_TYPE -> `String "RecommendationOptionsInstanceType"
  | CURRENT_NETWORK -> `String "CurrentNetwork"
  | CURRENT_STORAGE -> `String "CurrentStorage"
  | CURRENT_MEMORY -> `String "CurrentMemory"
  | CURRENT_VCPUS -> `String "CurrentVCpus"
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardThreeYearNoUpfrontReservedPrice"
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardOneYearNoUpfrontReservedPrice"
  | CURRENT_ON_DEMAND_PRICE -> `String "CurrentOnDemandPrice"
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | CURRENT_INSTANCE_TYPE -> `String "CurrentInstanceType"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | Finding_Reason_Codes -> `String "FindingReasonCodes"
  | FINDING -> `String "Finding"
  | INSTANCE_NAME -> `String "InstanceName"
  | INSTANCE_ARN -> `String "InstanceArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_instance_fields_to_yojson tree =
  list_to_yojson exportable_instance_field_to_yojson tree

let exportable_idle_field_to_yojson (x : exportable_idle_field) =
  match x with
  | TAGS -> `String "Tags"
  | FINDING_DESCRIPTION -> `String "FindingDescription"
  | FINDING -> `String "Finding"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_SUM ->
      `String "UtilizationMetricsDatabaseConnectionsSum"
  | UTILIZATION_METRICS_CURR_CONNECTIONS_SUM -> `String "UtilizationMetricsCurrConnectionsSum"
  | UTILIZATION_METRICS_ELASTI_CACHE_PROCESSING_UNITS_SUM ->
      `String "UtilizationMetricsElastiCacheProcessingUnitsSum"
  | UTILIZATION_METRICS_SET_TYPE_CMDS_SUM -> `String "UtilizationMetricsSetTypeCmdsSum"
  | UTILIZATION_METRICS_GET_TYPE_CMDS_SUM -> `String "UtilizationMetricsGetTypeCmdsSum"
  | UTILIZATION_METRICS_INVOCATIONS_SUM -> `String "UtilizationMetricsInvocationsSum"
  | UTILIZATION_METRICS_USER_CONNECTED_SUM -> `String "UtilizationMetricsUserConnectedSum"
  | UTILIZATION_METRICS_IS_IDLE_MINIMUM -> `String "UtilizationMetricsIsIdleMinimum"
  | UTILIZATION_METRICS_KEYSPACE_MISSES_SUM -> `String "UtilizationMetricsKeyspaceMissesSum"
  | UTILIZATION_METRICS_KEYSPACE_HITS_SUM -> `String "UtilizationMetricsKeyspaceHitsSum"
  | UTILIZATION_METRICS_CACHE_MISSES_SUM -> `String "UtilizationMetricsCacheMissesSum"
  | UTILIZATION_METRICS_CACHE_HITS_SUM -> `String "UtilizationMetricsCacheHitsSum"
  | UTILIZATION_METRICS_ENGINE_CPU_UTILIZATION_MAXIMUM ->
      `String "UtilizationMetricsEngineCPUUtilizationMaximum"
  | UTILIZATION_METRICS_NEW_CONNECTIONS_SUM -> `String "UtilizationMetricsNewConnectionsSum"
  | UTILIZATION_METRICS_CONSUMED_WRITE_CAPACITY_UNITS_SUM ->
      `String "UtilizationMetricsConsumedWriteCapacityUnitsSum"
  | UTILIZATION_METRICS_CONSUMED_READ_CAPACITY_UNITS_SUM ->
      `String "UtilizationMetricsConsumedReadCapacityUnitsSum"
  | UTILIZATION_METRICS_PACKETS_IN_FROM_DESTINATION_MAXIMUM ->
      `String "UtilizationMetricsPacketsInFromDestinationMaximum"
  | UTILIZATION_METRICS_PACKETS_IN_FROM_SOURCE_MAXIMUM ->
      `String "UtilizationMetricsPacketsInFromSourceMaximum"
  | UTILIZATION_METRICS_ACTIVE_CONNECTION_COUNT_MAXIMUM ->
      `String "UtilizationMetricsActiveConnectionCountMaximum"
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum"
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM ->
      `String "UtilizationMetricsEBSVolumeReadIOPSMaximum"
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM ->
      `String "UtilizationMetricsDatabaseConnectionsMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | SAVINGS_OPPORTUNITY_AFTER_DISCOUNT -> `String "SavingsOpportunityAfterDiscount"
  | SAVINGS_OPPORTUNITY -> `String "SavingsOpportunity"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | RESOURCE_TYPE -> `String "ResourceType"
  | RESOURCE_ID -> `String "ResourceId"
  | RESOURCE_ARN -> `String "ResourceArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_idle_fields_to_yojson tree = list_to_yojson exportable_idle_field_to_yojson tree

let exportable_ecs_service_field_to_yojson (x : exportable_ecs_service_field) =
  match x with
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | TAGS -> `String "Tags"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_CONTAINER_RECOMMENDATIONS ->
      `String "RecommendationOptionsContainerRecommendations"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | RECOMMENDATION_OPTIONS_CPU -> `String "RecommendationOptionsCpu"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | FINDING_REASON_CODES -> `String "FindingReasonCodes"
  | FINDING -> `String "Finding"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | CURRENT_SERVICE_CONTAINER_CONFIGURATIONS -> `String "CurrentServiceContainerConfigurations"
  | CURRENT_SERVICE_CONFIGURATION_AUTO_SCALING_CONFIGURATION ->
      `String "CurrentServiceConfigurationAutoScalingConfiguration"
  | CURRENT_SERVICE_CONFIGURATION_TASK_DEFINITION_ARN ->
      `String "CurrentServiceConfigurationTaskDefinitionArn"
  | CURRENT_SERVICE_CONFIGURATION_CPU -> `String "CurrentServiceConfigurationCpu"
  | CURRENT_SERVICE_CONFIGURATION_MEMORY -> `String "CurrentServiceConfigurationMemory"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | LAUNCH_TYPE -> `String "LaunchType"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | SERVICE_ARN -> `String "ServiceArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_ecs_service_fields_to_yojson tree =
  list_to_yojson exportable_ecs_service_field_to_yojson tree

let exportable_auto_scaling_group_field_to_yojson (x : exportable_auto_scaling_group_field) =
  match x with
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE ->
      `String "EffectiveRecommendationPreferencesSavingsEstimationMode"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum"
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM ->
      `String "UtilizationMetricsGpuMemoryPercentageMaximum"
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM -> `String "UtilizationMetricsGpuPercentageMaximum"
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO -> `String "RecommendationOptionsInstanceGpuInfo"
  | CURRENT_INSTANCE_GPU_INFO -> `String "CurrentInstanceGpuInfo"
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT -> `String "RecommendationOptionsMigrationEffort"
  | INFERRED_WORKLOAD_TYPES -> `String "InferredWorkloadTypes"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD ->
      `String "EffectiveRecommendationPreferencesLookBackPeriod"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES ->
      `String "EffectiveRecommendationPreferencesPreferredResources"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES ->
      `String "EffectiveRecommendationPreferencesInferredWorkloadTypes"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS ->
      `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics"
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES ->
      `String "EffectiveRecommendationPreferencesCpuVendorArchitectures"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE ->
      `String "RecommendationOptionsEstimatedMonthlySavingsValue"
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY ->
      `String "RecommendationOptionsEstimatedMonthlySavingsCurrency"
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE ->
      `String "RecommendationOptionsSavingsOpportunityPercentage"
  | CURRENT_PERFORMANCE_RISK -> `String "CurrentPerformanceRisk"
  | LAST_REFRESH_TIMESTAMP -> `String "LastRefreshTimestamp"
  | RECOMMENDATION_OPTIONS_NETWORK -> `String "RecommendationOptionsNetwork"
  | RECOMMENDATION_OPTIONS_STORAGE -> `String "RecommendationOptionsStorage"
  | RECOMMENDATION_OPTIONS_MEMORY -> `String "RecommendationOptionsMemory"
  | RECOMMENDATION_OPTIONS_VCPUS -> `String "RecommendationOptionsVcpus"
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice"
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE -> `String "RecommendationOptionsOnDemandPrice"
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK -> `String "RecommendationOptionsPerformanceRisk"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum"
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM ->
      `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_TYPE -> `String "RecommendationOptionsConfigurationType"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIXED_INSTANCE_TYPES ->
      `String "RecommendationOptionsConfigurationMixedInstanceTypes"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ALLOCATION_STRATEGY ->
      `String "RecommendationOptionsConfigurationAllocationStrategy"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ESTIMATED_INSTANCE_HOUR_REDUCTION_PERCENTAGE ->
      `String "RecommendationOptionsConfigurationEstimatedInstanceHourReductionPercentage"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MAX_SIZE ->
      `String "RecommendationOptionsConfigurationMaxSize"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIN_SIZE ->
      `String "RecommendationOptionsConfigurationMinSize"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_DESIRED_CAPACITY ->
      `String "RecommendationOptionsConfigurationDesiredCapacity"
  | RECOMMENDATION_OPTIONS_CONFIGURATION_INSTANCE_TYPE ->
      `String "RecommendationOptionsConfigurationInstanceType"
  | CURRENT_NETWORK -> `String "CurrentNetwork"
  | CURRENT_STORAGE -> `String "CurrentStorage"
  | CURRENT_MEMORY -> `String "CurrentMemory"
  | CURRENT_VCPUS -> `String "CurrentVCpus"
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardThreeYearNoUpfrontReservedPrice"
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE ->
      `String "CurrentStandardOneYearNoUpfrontReservedPrice"
  | CURRENT_ON_DEMAND_PRICE -> `String "CurrentOnDemandPrice"
  | CURRENT_CONFIGURATION_TYPE -> `String "CurrentConfigurationType"
  | CURRENT_CONFIGURATION_MIXED_INSTANCE_TYPES -> `String "CurrentConfigurationMixedInstanceTypes"
  | CURRENT_CONFIGURATION_ALLOCATION_STRATEGY -> `String "CurrentConfigurationAllocationStrategy"
  | CURRENT_CONFIGURATION_MAX_SIZE -> `String "CurrentConfigurationMaxSize"
  | CURRENT_CONFIGURATION_MIN_SIZE -> `String "CurrentConfigurationMinSize"
  | CURRENT_CONFIGURATION_DESIRED_CAPACITY -> `String "CurrentConfigurationDesiredCapacity"
  | CURRENT_CONFIGURATION_INSTANCE_TYPE -> `String "CurrentConfigurationInstanceType"
  | LOOKBACK_PERIOD_IN_DAYS -> `String "LookbackPeriodInDays"
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum"
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsNetworkInBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsDiskReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadBytesPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum"
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM ->
      `String "UtilizationMetricsEbsReadOpsPerSecondMaximum"
  | UTILIZATION_METRICS_MEMORY_MAXIMUM -> `String "UtilizationMetricsMemoryMaximum"
  | UTILIZATION_METRICS_CPU_MAXIMUM -> `String "UtilizationMetricsCpuMaximum"
  | FINDING -> `String "Finding"
  | AUTO_SCALING_GROUP_NAME -> `String "AutoScalingGroupName"
  | AUTO_SCALING_GROUP_ARN -> `String "AutoScalingGroupArn"
  | ACCOUNT_ID -> `String "AccountId"

let exportable_auto_scaling_group_fields_to_yojson tree =
  list_to_yojson exportable_auto_scaling_group_field_to_yojson tree

let export_rds_database_recommendations_response_to_yojson
    (x : export_rds_database_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_rds_database_recommendations_request_to_yojson
    (x : export_rds_database_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_rdsdb_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson rdsdb_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_license_recommendations_response_to_yojson (x : export_license_recommendations_response)
    =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_license_recommendations_request_to_yojson (x : export_license_recommendations_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_license_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson license_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_lambda_function_recommendations_response_to_yojson
    (x : export_lambda_function_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_lambda_function_recommendations_request_to_yojson
    (x : export_lambda_function_recommendations_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ( "fieldsToExport",
        option_to_yojson exportable_lambda_function_fields_to_yojson x.fields_to_export );
      ("filters", option_to_yojson lambda_function_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_idle_recommendations_response_to_yojson (x : export_idle_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_idle_recommendations_request_to_yojson (x : export_idle_recommendations_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_idle_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson idle_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_ecs_service_recommendations_response_to_yojson
    (x : export_ecs_service_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_ecs_service_recommendations_request_to_yojson
    (x : export_ecs_service_recommendations_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_ecs_service_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson ecs_service_recommendation_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_ec2_instance_recommendations_response_to_yojson
    (x : export_ec2_instance_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_ec2_instance_recommendations_request_to_yojson
    (x : export_ec2_instance_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_instance_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_ebs_volume_recommendations_response_to_yojson
    (x : export_ebs_volume_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_ebs_volume_recommendations_request_to_yojson
    (x : export_ebs_volume_recommendations_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ("fieldsToExport", option_to_yojson exportable_volume_fields_to_yojson x.fields_to_export);
      ("filters", option_to_yojson ebs_filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let export_auto_scaling_group_recommendations_response_to_yojson
    (x : export_auto_scaling_group_recommendations_response) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let export_auto_scaling_group_recommendations_request_to_yojson
    (x : export_auto_scaling_group_recommendations_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferences",
        option_to_yojson recommendation_preferences_to_yojson x.recommendation_preferences );
      ( "includeMemberAccounts",
        option_to_yojson include_member_accounts_to_yojson x.include_member_accounts );
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("s3DestinationConfig", Some (s3_destination_config_to_yojson x.s3_destination_config));
      ( "fieldsToExport",
        option_to_yojson exportable_auto_scaling_group_fields_to_yojson x.fields_to_export );
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("accountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let describe_recommendation_export_jobs_response_to_yojson
    (x : describe_recommendation_export_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "recommendationExportJobs",
        option_to_yojson recommendation_export_jobs_to_yojson x.recommendation_export_jobs );
    ]

let describe_recommendation_export_jobs_request_to_yojson
    (x : describe_recommendation_export_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson job_filters_to_yojson x.filters);
      ("jobIds", option_to_yojson job_ids_to_yojson x.job_ids);
    ]

let delete_recommendation_preferences_response_to_yojson = unit_to_yojson

let delete_recommendation_preferences_request_to_yojson
    (x : delete_recommendation_preferences_request) =
  assoc_to_yojson
    [
      ( "recommendationPreferenceNames",
        Some (recommendation_preference_names_to_yojson x.recommendation_preference_names) );
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]
