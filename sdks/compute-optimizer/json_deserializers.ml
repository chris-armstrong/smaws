open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : access_denied_exception)

let last_updated_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let status_reason_of_yojson = string_of_yojson

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String "Pending" -> PENDING
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let account_id_of_yojson = string_of_yojson

let account_enrollment_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_of_yojson "statusReason") _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key last_updated_timestamp_of_yojson "lastUpdatedTimestamp")
         _list path;
   }
    : account_enrollment_status)

let account_enrollment_statuses_of_yojson tree path =
  list_of_yojson account_enrollment_status_of_yojson tree path

let account_ids_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let allocated_storage_of_yojson = int_of_yojson

let allocation_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "Prioritized" -> PRIORITIZED
    | `String "LowestPrice" -> LOWEST_PRICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AllocationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "AllocationStrategy")
     : allocation_strategy)
    : allocation_strategy)

let asg_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SingleInstanceType" -> SINGLE_INSTANCE_TYPE
    | `String "MixedInstanceTypes" -> MIXED_INSTANCE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AsgType" value)
    | _ -> raise (deserialize_wrong_type_error path "AsgType")
     : asg_type)
    : asg_type)

let auto_scaling_configuration_of_yojson (tree : t) path =
  ((match tree with
    | `String "TargetTrackingScalingCpu" -> TARGET_TRACKING_SCALING_CPU
    | `String "TargetTrackingScalingMemory" -> TARGET_TRACKING_SCALING_MEMORY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoScalingConfiguration" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoScalingConfiguration")
     : auto_scaling_configuration)
    : auto_scaling_configuration)

let auto_scaling_group_arn_of_yojson = string_of_yojson

let auto_scaling_group_arns_of_yojson tree path =
  list_of_yojson auto_scaling_group_arn_of_yojson tree path

let mixed_instance_type_of_yojson = string_of_yojson

let mixed_instance_types_of_yojson tree path =
  list_of_yojson mixed_instance_type_of_yojson tree path

let nullable_estimated_instance_hour_reduction_percentage_of_yojson = double_of_yojson
let nullable_instance_type_of_yojson = string_of_yojson
let max_size_of_yojson = int_of_yojson
let min_size_of_yojson = int_of_yojson
let desired_capacity_of_yojson = int_of_yojson

let auto_scaling_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_capacity =
       option_of_yojson (value_for_key desired_capacity_of_yojson "desiredCapacity") _list path;
     min_size = option_of_yojson (value_for_key min_size_of_yojson "minSize") _list path;
     max_size = option_of_yojson (value_for_key max_size_of_yojson "maxSize") _list path;
     instance_type =
       option_of_yojson (value_for_key nullable_instance_type_of_yojson "instanceType") _list path;
     allocation_strategy =
       option_of_yojson
         (value_for_key allocation_strategy_of_yojson "allocationStrategy")
         _list path;
     estimated_instance_hour_reduction_percentage =
       option_of_yojson
         (value_for_key nullable_estimated_instance_hour_reduction_percentage_of_yojson
            "estimatedInstanceHourReductionPercentage")
         _list path;
     type_ = option_of_yojson (value_for_key asg_type_of_yojson "type") _list path;
     mixed_instance_types =
       option_of_yojson
         (value_for_key mixed_instance_types_of_yojson "mixedInstanceTypes")
         _list path;
   }
    : auto_scaling_group_configuration)

let value_of_yojson = double_of_yojson

let currency_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String "CNY" -> CNY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Currency" value)
    | _ -> raise (deserialize_wrong_type_error path "Currency")
     : currency)
    : currency)

let auto_scaling_group_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : auto_scaling_group_estimated_monthly_savings)

let auto_scaling_group_name_of_yojson = string_of_yojson

let inferred_workload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AmazonEmr" -> AMAZON_EMR
    | `String "ApacheCassandra" -> APACHE_CASSANDRA
    | `String "ApacheHadoop" -> APACHE_HADOOP
    | `String "Memcached" -> MEMCACHED
    | `String "Nginx" -> NGINX
    | `String "PostgreSql" -> POSTGRE_SQL
    | `String "Redis" -> REDIS
    | `String "Kafka" -> KAFKA
    | `String "SQLServer" -> SQLSERVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InferredWorkloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "InferredWorkloadType")
     : inferred_workload_type)
    : inferred_workload_type)

let inferred_workload_types_of_yojson tree path =
  list_of_yojson inferred_workload_type_of_yojson tree path

let instance_savings_estimation_mode_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "PublicPricing" -> PUBLIC_PRICING
    | `String "CostExplorerRightsizing" -> COST_EXPLORER_RIGHTSIZING
    | `String "CostOptimizationHub" -> COST_OPTIMIZATION_HUB
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "InstanceSavingsEstimationModeSource" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceSavingsEstimationModeSource")
     : instance_savings_estimation_mode_source)
    : instance_savings_estimation_mode_source)

let instance_savings_estimation_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source =
       option_of_yojson
         (value_for_key instance_savings_estimation_mode_source_of_yojson "source")
         _list path;
   }
    : instance_savings_estimation_mode)

let preferred_resource_value_of_yojson = string_of_yojson

let preferred_resource_values_of_yojson tree path =
  list_of_yojson preferred_resource_value_of_yojson tree path

let preferred_resource_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ec2InstanceTypes" -> EC2_INSTANCE_TYPES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PreferredResourceName" value)
    | _ -> raise (deserialize_wrong_type_error path "PreferredResourceName")
     : preferred_resource_name)
    : preferred_resource_name)

let effective_preferred_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key preferred_resource_name_of_yojson "name") _list path;
     include_list =
       option_of_yojson (value_for_key preferred_resource_values_of_yojson "includeList") _list path;
     effective_include_list =
       option_of_yojson
         (value_for_key preferred_resource_values_of_yojson "effectiveIncludeList")
         _list path;
     exclude_list =
       option_of_yojson (value_for_key preferred_resource_values_of_yojson "excludeList") _list path;
   }
    : effective_preferred_resource)

let effective_preferred_resources_of_yojson tree path =
  list_of_yojson effective_preferred_resource_of_yojson tree path

let customizable_metric_headroom_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERCENT_30" -> PERCENT_30
    | `String "PERCENT_20" -> PERCENT_20
    | `String "PERCENT_10" -> PERCENT_10
    | `String "PERCENT_0" -> PERCENT_0
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomizableMetricHeadroom" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomizableMetricHeadroom")
     : customizable_metric_headroom)
    : customizable_metric_headroom)

let customizable_metric_threshold_of_yojson (tree : t) path =
  ((match tree with
    | `String "P90" -> P90
    | `String "P95" -> P95
    | `String "P99_5" -> P99_5
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomizableMetricThreshold" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomizableMetricThreshold")
     : customizable_metric_threshold)
    : customizable_metric_threshold)

let customizable_metric_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold =
       option_of_yojson
         (value_for_key customizable_metric_threshold_of_yojson "threshold")
         _list path;
     headroom =
       option_of_yojson (value_for_key customizable_metric_headroom_of_yojson "headroom") _list path;
   }
    : customizable_metric_parameters)

let customizable_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CpuUtilization" -> CPU_UTILIZATION
    | `String "MemoryUtilization" -> MEMORY_UTILIZATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomizableMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomizableMetricName")
     : customizable_metric_name)
    : customizable_metric_name)

let utilization_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson (value_for_key customizable_metric_name_of_yojson "metricName") _list path;
     metric_parameters =
       option_of_yojson
         (value_for_key customizable_metric_parameters_of_yojson "metricParameters")
         _list path;
   }
    : utilization_preference)

let utilization_preferences_of_yojson tree path =
  list_of_yojson utilization_preference_of_yojson tree path

let look_back_period_preference_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAYS_14" -> DAYS_14
    | `String "DAYS_32" -> DAYS_32
    | `String "DAYS_93" -> DAYS_93
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LookBackPeriodPreference" value)
    | _ -> raise (deserialize_wrong_type_error path "LookBackPeriodPreference")
     : look_back_period_preference)
    : look_back_period_preference)

let external_metrics_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "Datadog" -> DATADOG
    | `String "Dynatrace" -> DYNATRACE
    | `String "NewRelic" -> NEWRELIC
    | `String "Instana" -> INSTANA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExternalMetricsSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ExternalMetricsSource")
     : external_metrics_source)
    : external_metrics_source)

let external_metrics_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key external_metrics_source_of_yojson "source") _list path;
   }
    : external_metrics_preference)

let inferred_workload_types_preference_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InferredWorkloadTypesPreference" value)
    | _ -> raise (deserialize_wrong_type_error path "InferredWorkloadTypesPreference")
     : inferred_workload_types_preference)
    : inferred_workload_types_preference)

let enhanced_infrastructure_metrics_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnhancedInfrastructureMetrics" value)
    | _ -> raise (deserialize_wrong_type_error path "EnhancedInfrastructureMetrics")
     : enhanced_infrastructure_metrics)
    : enhanced_infrastructure_metrics)

let cpu_vendor_architecture_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_ARM64" -> AWS_ARM64
    | `String "CURRENT" -> CURRENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CpuVendorArchitecture" value)
    | _ -> raise (deserialize_wrong_type_error path "CpuVendorArchitecture")
     : cpu_vendor_architecture)
    : cpu_vendor_architecture)

let cpu_vendor_architectures_of_yojson tree path =
  list_of_yojson cpu_vendor_architecture_of_yojson tree path

let effective_recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_vendor_architectures =
       option_of_yojson
         (value_for_key cpu_vendor_architectures_of_yojson "cpuVendorArchitectures")
         _list path;
     enhanced_infrastructure_metrics =
       option_of_yojson
         (value_for_key enhanced_infrastructure_metrics_of_yojson "enhancedInfrastructureMetrics")
         _list path;
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_preference_of_yojson "inferredWorkloadTypes")
         _list path;
     external_metrics_preference =
       option_of_yojson
         (value_for_key external_metrics_preference_of_yojson "externalMetricsPreference")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
     utilization_preferences =
       option_of_yojson
         (value_for_key utilization_preferences_of_yojson "utilizationPreferences")
         _list path;
     preferred_resources =
       option_of_yojson
         (value_for_key effective_preferred_resources_of_yojson "preferredResources")
         _list path;
     savings_estimation_mode =
       option_of_yojson
         (value_for_key instance_savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
   }
    : effective_recommendation_preferences)

let current_performance_risk_of_yojson (tree : t) path =
  ((match tree with
    | `String "VeryLow" -> VERY_LOW
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CurrentPerformanceRisk" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrentPerformanceRisk")
     : current_performance_risk)
    : current_performance_risk)

let last_refresh_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let migration_effort_of_yojson (tree : t) path =
  ((match tree with
    | `String "VeryLow" -> VERY_LOW
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "MigrationEffort" value)
    | _ -> raise (deserialize_wrong_type_error path "MigrationEffort")
     : migration_effort)
    : migration_effort)

let savings_opportunity_percentage_of_yojson = double_of_yojson

let auto_scaling_group_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key auto_scaling_group_estimated_monthly_savings_of_yojson
            "estimatedMonthlySavings")
         _list path;
   }
    : auto_scaling_group_savings_opportunity_after_discounts)

let estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : estimated_monthly_savings)

let savings_opportunity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : savings_opportunity)

let rank_of_yojson = int_of_yojson
let performance_risk_of_yojson = double_of_yojson
let metric_value_of_yojson = double_of_yojson

let metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Maximum" -> MAXIMUM
    | `String "Average" -> AVERAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricStatistic")
     : metric_statistic)
    : metric_statistic)

let metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cpu" -> CPU
    | `String "Memory" -> MEMORY
    | `String "EBS_READ_OPS_PER_SECOND" -> EBS_READ_OPS_PER_SECOND
    | `String "EBS_WRITE_OPS_PER_SECOND" -> EBS_WRITE_OPS_PER_SECOND
    | `String "EBS_READ_BYTES_PER_SECOND" -> EBS_READ_BYTES_PER_SECOND
    | `String "EBS_WRITE_BYTES_PER_SECOND" -> EBS_WRITE_BYTES_PER_SECOND
    | `String "DISK_READ_OPS_PER_SECOND" -> DISK_READ_OPS_PER_SECOND
    | `String "DISK_WRITE_OPS_PER_SECOND" -> DISK_WRITE_OPS_PER_SECOND
    | `String "DISK_READ_BYTES_PER_SECOND" -> DISK_READ_BYTES_PER_SECOND
    | `String "DISK_WRITE_BYTES_PER_SECOND" -> DISK_WRITE_BYTES_PER_SECOND
    | `String "NETWORK_IN_BYTES_PER_SECOND" -> NETWORK_IN_BYTES_PER_SECOND
    | `String "NETWORK_OUT_BYTES_PER_SECOND" -> NETWORK_OUT_BYTES_PER_SECOND
    | `String "NETWORK_PACKETS_IN_PER_SECOND" -> NETWORK_PACKETS_IN_PER_SECOND
    | `String "NETWORK_PACKETS_OUT_PER_SECOND" -> NETWORK_PACKETS_OUT_PER_SECOND
    | `String "GPU_PERCENTAGE" -> GPU_PERCENTAGE
    | `String "GPU_MEMORY_PERCENTAGE" -> GPU_MEMORY_PERCENTAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")
     : metric_name)
    : metric_name)

let utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key metric_name_of_yojson "name") _list path;
     statistic = option_of_yojson (value_for_key metric_statistic_of_yojson "statistic") _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : utilization_metric)

let projected_utilization_metrics_of_yojson tree path =
  list_of_yojson utilization_metric_of_yojson tree path

let gpu_memory_size_in_mi_b_of_yojson = int_of_yojson
let gpu_count_of_yojson = int_of_yojson

let gpu_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gpu_count = option_of_yojson (value_for_key gpu_count_of_yojson "gpuCount") _list path;
     gpu_memory_size_in_mi_b =
       option_of_yojson
         (value_for_key gpu_memory_size_in_mi_b_of_yojson "gpuMemorySizeInMiB")
         _list path;
   }
    : gpu)

let gpus_of_yojson tree path = list_of_yojson gpu_of_yojson tree path

let gpu_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gpus = option_of_yojson (value_for_key gpus_of_yojson "gpus") _list path } : gpu_info)

let auto_scaling_group_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key auto_scaling_group_configuration_of_yojson "configuration")
         _list path;
     instance_gpu_info =
       option_of_yojson (value_for_key gpu_info_of_yojson "instanceGpuInfo") _list path;
     projected_utilization_metrics =
       option_of_yojson
         (value_for_key projected_utilization_metrics_of_yojson "projectedUtilizationMetrics")
         _list path;
     performance_risk =
       option_of_yojson (value_for_key performance_risk_of_yojson "performanceRisk") _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key auto_scaling_group_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
     migration_effort =
       option_of_yojson (value_for_key migration_effort_of_yojson "migrationEffort") _list path;
   }
    : auto_scaling_group_recommendation_option)

let auto_scaling_group_recommendation_options_of_yojson tree path =
  list_of_yojson auto_scaling_group_recommendation_option_of_yojson tree path

let look_back_period_in_days_of_yojson = double_of_yojson
let utilization_metrics_of_yojson tree path = list_of_yojson utilization_metric_of_yojson tree path

let finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Underprovisioned" -> UNDER_PROVISIONED
    | `String "Overprovisioned" -> OVER_PROVISIONED
    | `String "Optimized" -> OPTIMIZED
    | `String "NotOptimized" -> NOT_OPTIMIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Finding" value)
    | _ -> raise (deserialize_wrong_type_error path "Finding")
     : finding)
    : finding)

let auto_scaling_group_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     auto_scaling_group_arn =
       option_of_yojson
         (value_for_key auto_scaling_group_arn_of_yojson "autoScalingGroupArn")
         _list path;
     auto_scaling_group_name =
       option_of_yojson
         (value_for_key auto_scaling_group_name_of_yojson "autoScalingGroupName")
         _list path;
     finding = option_of_yojson (value_for_key finding_of_yojson "finding") _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookBackPeriodInDays")
         _list path;
     current_configuration =
       option_of_yojson
         (value_for_key auto_scaling_group_configuration_of_yojson "currentConfiguration")
         _list path;
     current_instance_gpu_info =
       option_of_yojson (value_for_key gpu_info_of_yojson "currentInstanceGpuInfo") _list path;
     recommendation_options =
       option_of_yojson
         (value_for_key auto_scaling_group_recommendation_options_of_yojson "recommendationOptions")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     current_performance_risk =
       option_of_yojson
         (value_for_key current_performance_risk_of_yojson "currentPerformanceRisk")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_of_yojson "inferredWorkloadTypes")
         _list path;
   }
    : auto_scaling_group_recommendation)

let auto_scaling_group_recommendations_of_yojson tree path =
  list_of_yojson auto_scaling_group_recommendation_of_yojson tree path

let code_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : throttling_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : service_unavailable_exception)

let missing_authentication_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : missing_authentication_token)

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_parameter_value_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_server_exception)

let update_enrollment_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_of_yojson "statusReason") _list path;
   }
    : update_enrollment_status_response)

let include_member_accounts_of_yojson = bool_of_yojson

let update_enrollment_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key status_of_yojson "status" _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : update_enrollment_status_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let opt_in_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : opt_in_required_exception)

let put_recommendation_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let savings_estimation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "AfterDiscounts" -> AFTER_DISCOUNTS
    | `String "BeforeDiscounts" -> BEFORE_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SavingsEstimationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SavingsEstimationMode")
     : savings_estimation_mode)
    : savings_estimation_mode)

let preferred_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key preferred_resource_name_of_yojson "name") _list path;
     include_list =
       option_of_yojson (value_for_key preferred_resource_values_of_yojson "includeList") _list path;
     exclude_list =
       option_of_yojson (value_for_key preferred_resource_values_of_yojson "excludeList") _list path;
   }
    : preferred_resource)

let preferred_resources_of_yojson tree path = list_of_yojson preferred_resource_of_yojson tree path
let scope_value_of_yojson = string_of_yojson

let scope_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Organization" -> ORGANIZATION
    | `String "AccountId" -> ACCOUNT_ID
    | `String "ResourceArn" -> RESOURCE_ARN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScopeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ScopeName")
     : scope_name)
    : scope_name)

let scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key scope_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key scope_value_of_yojson "value") _list path;
   }
    : scope)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ec2Instance" -> EC2_INSTANCE
    | `String "AutoScalingGroup" -> AUTO_SCALING_GROUP
    | `String "EbsVolume" -> EBS_VOLUME
    | `String "LambdaFunction" -> LAMBDA_FUNCTION
    | `String "NotApplicable" -> NOT_APPLICABLE
    | `String "EcsService" -> ECS_SERVICE
    | `String "License" -> LICENSE
    | `String "RdsDBInstance" -> RDS_DB_INSTANCE
    | `String "AuroraDBClusterStorage" -> AURORA_DB_CLUSTER_STORAGE
    | `String "Idle" -> IDLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let put_recommendation_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     enhanced_infrastructure_metrics =
       option_of_yojson
         (value_for_key enhanced_infrastructure_metrics_of_yojson "enhancedInfrastructureMetrics")
         _list path;
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_preference_of_yojson "inferredWorkloadTypes")
         _list path;
     external_metrics_preference =
       option_of_yojson
         (value_for_key external_metrics_preference_of_yojson "externalMetricsPreference")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
     utilization_preferences =
       option_of_yojson
         (value_for_key utilization_preferences_of_yojson "utilizationPreferences")
         _list path;
     preferred_resources =
       option_of_yojson
         (value_for_key preferred_resources_of_yojson "preferredResources")
         _list path;
     savings_estimation_mode =
       option_of_yojson
         (value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
   }
    : put_recommendation_preferences_request)

let inferred_workload_saving_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_of_yojson "inferredWorkloadTypes")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : inferred_workload_saving)

let inferred_workload_savings_of_yojson tree path =
  list_of_yojson inferred_workload_saving_of_yojson tree path

let very_low_of_yojson = long_of_yojson
let low_of_yojson = long_of_yojson
let medium_of_yojson = long_of_yojson
let high_of_yojson = long_of_yojson

let current_performance_risk_ratings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     high = option_of_yojson (value_for_key high_of_yojson "high") _list path;
     medium = option_of_yojson (value_for_key medium_of_yojson "medium") _list path;
     low = option_of_yojson (value_for_key low_of_yojson "low") _list path;
     very_low = option_of_yojson (value_for_key very_low_of_yojson "veryLow") _list path;
   }
    : current_performance_risk_ratings)

let recommendation_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ec2Instance" -> EC2_INSTANCE
    | `String "AutoScalingGroup" -> AUTO_SCALING_GROUP
    | `String "EbsVolume" -> EBS_VOLUME
    | `String "LambdaFunction" -> LAMBDA_FUNCTION
    | `String "EcsService" -> ECS_SERVICE
    | `String "License" -> LICENSE
    | `String "RdsDBInstance" -> RDS_DB_INSTANCE
    | `String "RdsDBInstanceStorage" -> RDS_DB_INSTANCE_STORAGE
    | `String "AuroraDBClusterStorage" -> AURORA_DB_CLUSTER_STORAGE
    | `String "NatGateway" -> NAT_GATEWAY
    | `String "DynamoDBTable" -> DYNAMO_DB_TABLE
    | `String "ElastiCacheCluster" -> ELASTI_CACHE_CLUSTER
    | `String "MemoryDBCluster" -> MEMORY_DB_CLUSTER
    | `String "DocumentDBCluster" -> DOCUMENT_DB_CLUSTER
    | `String "WorkSpaces" -> WORKSPACES
    | `String "SageMakerEndpoint" -> SAGE_MAKER_ENDPOINT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecommendationSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendationSourceType")
     : recommendation_source_type)
    : recommendation_source_type)

let summary_value_of_yojson = double_of_yojson

let idle_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Idle" -> IDLE
    | `String "Unattached" -> UNATTACHED
    | `String "Unused" -> UNUSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "IdleFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "IdleFinding")
     : idle_finding)
    : idle_finding)

let idle_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key idle_finding_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key summary_value_of_yojson "value") _list path;
   }
    : idle_summary)

let idle_summaries_of_yojson tree path = list_of_yojson idle_summary_of_yojson tree path

let finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "MemoryOverprovisioned" -> MEMORY_OVER_PROVISIONED
    | `String "MemoryUnderprovisioned" -> MEMORY_UNDER_PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FindingReasonCode")
     : finding_reason_code)
    : finding_reason_code)

let reason_code_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key finding_reason_code_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key summary_value_of_yojson "value") _list path;
   }
    : reason_code_summary)

let reason_code_summaries_of_yojson tree path =
  list_of_yojson reason_code_summary_of_yojson tree path

let summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key finding_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key summary_value_of_yojson "value") _list path;
     reason_code_summaries =
       option_of_yojson
         (value_for_key reason_code_summaries_of_yojson "reasonCodeSummaries")
         _list path;
   }
    : summary)

let summaries_of_yojson tree path = list_of_yojson summary_of_yojson tree path

let recommendation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries = option_of_yojson (value_for_key summaries_of_yojson "summaries") _list path;
     idle_summaries =
       option_of_yojson (value_for_key idle_summaries_of_yojson "idleSummaries") _list path;
     recommendation_resource_type =
       option_of_yojson
         (value_for_key recommendation_source_type_of_yojson "recommendationResourceType")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     idle_savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "idleSavingsOpportunity")
         _list path;
     aggregated_savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "aggregatedSavingsOpportunity")
         _list path;
     current_performance_risk_ratings =
       option_of_yojson
         (value_for_key current_performance_risk_ratings_of_yojson "currentPerformanceRiskRatings")
         _list path;
     inferred_workload_savings =
       option_of_yojson
         (value_for_key inferred_workload_savings_of_yojson "inferredWorkloadSavings")
         _list path;
   }
    : recommendation_summary)

let recommendation_summaries_of_yojson tree path =
  list_of_yojson recommendation_summary_of_yojson tree path

let next_token_of_yojson = string_of_yojson

let get_recommendation_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     recommendation_summaries =
       option_of_yojson
         (value_for_key recommendation_summaries_of_yojson "recommendationSummaries")
         _list path;
   }
    : get_recommendation_summaries_response)

let max_results_of_yojson = int_of_yojson

let get_recommendation_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_recommendation_summaries_request)

let recommendation_preferences_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     enhanced_infrastructure_metrics =
       option_of_yojson
         (value_for_key enhanced_infrastructure_metrics_of_yojson "enhancedInfrastructureMetrics")
         _list path;
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_preference_of_yojson "inferredWorkloadTypes")
         _list path;
     external_metrics_preference =
       option_of_yojson
         (value_for_key external_metrics_preference_of_yojson "externalMetricsPreference")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
     utilization_preferences =
       option_of_yojson
         (value_for_key utilization_preferences_of_yojson "utilizationPreferences")
         _list path;
     preferred_resources =
       option_of_yojson
         (value_for_key effective_preferred_resources_of_yojson "preferredResources")
         _list path;
     savings_estimation_mode =
       option_of_yojson
         (value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
   }
    : recommendation_preferences_detail)

let recommendation_preferences_details_of_yojson tree path =
  list_of_yojson recommendation_preferences_detail_of_yojson tree path

let get_recommendation_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     recommendation_preferences_details =
       option_of_yojson
         (value_for_key recommendation_preferences_details_of_yojson
            "recommendationPreferencesDetails")
         _list path;
   }
    : get_recommendation_preferences_response)

let get_recommendation_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_recommendation_preferences_request)

let message_of_yojson = string_of_yojson
let identifier_of_yojson = string_of_yojson

let get_recommendation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = option_of_yojson (value_for_key identifier_of_yojson "identifier") _list path;
     code = option_of_yojson (value_for_key code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : get_recommendation_error)

let get_recommendation_errors_of_yojson tree path =
  list_of_yojson get_recommendation_error_of_yojson tree path

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let rds_savings_estimation_mode_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "PublicPricing" -> PUBLIC_PRICING
    | `String "CostExplorerRightsizing" -> COST_EXPLORER_RIGHTSIZING
    | `String "CostOptimizationHub" -> COST_OPTIMIZATION_HUB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSSavingsEstimationModeSource" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSSavingsEstimationModeSource")
     : rds_savings_estimation_mode_source)
    : rds_savings_estimation_mode_source)

let rds_savings_estimation_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source =
       option_of_yojson
         (value_for_key rds_savings_estimation_mode_source_of_yojson "source")
         _list path;
   }
    : rds_savings_estimation_mode)

let rds_effective_recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_vendor_architectures =
       option_of_yojson
         (value_for_key cpu_vendor_architectures_of_yojson "cpuVendorArchitectures")
         _list path;
     enhanced_infrastructure_metrics =
       option_of_yojson
         (value_for_key enhanced_infrastructure_metrics_of_yojson "enhancedInfrastructureMetrics")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
     savings_estimation_mode =
       option_of_yojson
         (value_for_key rds_savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
   }
    : rds_effective_recommendation_preferences)

let rdsdb_metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Maximum" -> MAXIMUM
    | `String "Minimum" -> MINIMUM
    | `String "Average" -> AVERAGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSDBMetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSDBMetricStatistic")
     : rdsdb_metric_statistic)
    : rdsdb_metric_statistic)

let rdsdb_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPU" -> CPU
    | `String "Memory" -> MEMORY
    | `String "EBSVolumeStorageSpaceUtilization" -> EBS_VOLUME_STORAGE_SPACE_UTILIZATION
    | `String "NetworkReceiveThroughput" -> NETWORK_RECEIVE_THROUGHPUT
    | `String "NetworkTransmitThroughput" -> NETWORK_TRANSMIT_THROUGHPUT
    | `String "EBSVolumeReadIOPS" -> EBS_VOLUME_READ_IOPS
    | `String "EBSVolumeWriteIOPS" -> EBS_VOLUME_WRITE_IOPS
    | `String "EBSVolumeReadThroughput" -> EBS_VOLUME_READ_THROUGHPUT
    | `String "EBSVolumeWriteThroughput" -> EBS_VOLUME_WRITE_THROUGHPUT
    | `String "DatabaseConnections" -> DATABASE_CONNECTIONS
    | `String "StorageNetworkReceiveThroughput" -> STORAGE_NETWORK_RECEIVE_THROUGHPUT
    | `String "StorageNetworkTransmitThroughput" -> STORAGE_NETWORK_TRANSMIT_THROUGHPUT
    | `String "AuroraMemoryHealthState" -> AURORA_MEMORY_HEALTH_STATE
    | `String "AuroraMemoryNumDeclinedSql" -> AURORA_MEMORY_NUM_DECLINED_SQL
    | `String "AuroraMemoryNumKillConnTotal" -> AURORA_MEMORY_NUM_KILL_CONN_TOTAL
    | `String "AuroraMemoryNumKillQueryTotal" -> AURORA_MEMORY_NUM_KILL_QUERY_TOTAL
    | `String "ReadIOPSEphemeralStorage" -> READ_IOPS_EPHEMERAL_STORAGE
    | `String "WriteIOPSEphemeralStorage" -> WRITE_IOPS_EPHEMERAL_STORAGE
    | `String "VolumeReadIOPs" -> VOLUME_READ_IOPS
    | `String "VolumeBytesUsed" -> VOLUME_BYTES_USED
    | `String "VolumeWriteIOPs" -> VOLUME_WRITE_IOPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RDSDBMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSDBMetricName")
     : rdsdb_metric_name)
    : rdsdb_metric_name)

let rdsdb_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key rdsdb_metric_name_of_yojson "name") _list path;
     statistic =
       option_of_yojson (value_for_key rdsdb_metric_statistic_of_yojson "statistic") _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : rdsdb_utilization_metric)

let rdsdb_utilization_metrics_of_yojson tree path =
  list_of_yojson rdsdb_utilization_metric_of_yojson tree path

let rds_estimated_monthly_volume_io_ps_cost_variation_of_yojson (tree : t) path =
  ((match tree with
    | `String "None" -> NONE
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RDSEstimatedMonthlyVolumeIOPsCostVariation"
             value)
    | _ -> raise (deserialize_wrong_type_error path "RDSEstimatedMonthlyVolumeIOPsCostVariation")
     : rds_estimated_monthly_volume_io_ps_cost_variation)
    : rds_estimated_monthly_volume_io_ps_cost_variation)

let rds_storage_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : rds_storage_estimated_monthly_savings)

let rds_storage_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key rds_storage_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : rds_storage_savings_opportunity_after_discounts)

let nullable_storage_throughput_of_yojson = int_of_yojson
let nullable_max_allocated_storage_of_yojson = int_of_yojson
let nullable_iop_s_of_yojson = int_of_yojson
let storage_type_of_yojson = string_of_yojson

let db_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_type = option_of_yojson (value_for_key storage_type_of_yojson "storageType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     iops = option_of_yojson (value_for_key nullable_iop_s_of_yojson "iops") _list path;
     max_allocated_storage =
       option_of_yojson
         (value_for_key nullable_max_allocated_storage_of_yojson "maxAllocatedStorage")
         _list path;
     storage_throughput =
       option_of_yojson
         (value_for_key nullable_storage_throughput_of_yojson "storageThroughput")
         _list path;
   }
    : db_storage_configuration)

let rdsdb_storage_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_configuration =
       option_of_yojson
         (value_for_key db_storage_configuration_of_yojson "storageConfiguration")
         _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key rds_storage_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
     estimated_monthly_volume_io_ps_cost_variation =
       option_of_yojson
         (value_for_key rds_estimated_monthly_volume_io_ps_cost_variation_of_yojson
            "estimatedMonthlyVolumeIOPsCostVariation")
         _list path;
   }
    : rdsdb_storage_recommendation_option)

let rdsdb_storage_recommendation_options_of_yojson tree path =
  list_of_yojson rdsdb_storage_recommendation_option_of_yojson tree path

let rds_instance_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : rds_instance_estimated_monthly_savings)

let rds_instance_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key rds_instance_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : rds_instance_savings_opportunity_after_discounts)

let rdsdb_projected_utilization_metrics_of_yojson tree path =
  list_of_yojson rdsdb_utilization_metric_of_yojson tree path

let db_instance_class_of_yojson = string_of_yojson

let rdsdb_instance_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_instance_class =
       option_of_yojson (value_for_key db_instance_class_of_yojson "dbInstanceClass") _list path;
     projected_utilization_metrics =
       option_of_yojson
         (value_for_key rdsdb_projected_utilization_metrics_of_yojson "projectedUtilizationMetrics")
         _list path;
     performance_risk =
       option_of_yojson (value_for_key performance_risk_of_yojson "performanceRisk") _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key rds_instance_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
   }
    : rdsdb_instance_recommendation_option)

let rdsdb_instance_recommendation_options_of_yojson tree path =
  list_of_yojson rdsdb_instance_recommendation_option_of_yojson tree path

let rds_storage_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "EBSVolumeAllocatedStorageUnderprovisioned" ->
        EBS_VOLUME_ALLOCATED_STORAGE_UNDER_PROVISIONED
    | `String "EBSVolumeThroughputUnderprovisioned" -> EBS_VOLUME_THROUGHPUT_UNDER_PROVISIONED
    | `String "EBSVolumeIOPSOverprovisioned" -> EBS_VOLUME_IOPS_OVER_PROVISIONED
    | `String "EBSVolumeThroughputOverprovisioned" -> EBS_VOLUME_THROUGHPUT_OVER_PROVISIONED
    | `String "NewGenerationStorageTypeAvailable" -> NEW_GENERATION_STORAGE_TYPE_AVAILABLE
    | `String "DBClusterStorageOptionAvailable" -> DB_CLUSTER_STORAGE_OPTION_AVAILABLE
    | `String "DBClusterStorageSavingsAvailable" -> DB_CLUSTER_STORAGE_SAVINGS_AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSStorageFindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSStorageFindingReasonCode")
     : rds_storage_finding_reason_code)
    : rds_storage_finding_reason_code)

let rds_storage_finding_reason_codes_of_yojson tree path =
  list_of_yojson rds_storage_finding_reason_code_of_yojson tree path

let rds_current_instance_performance_risk_of_yojson (tree : t) path =
  ((match tree with
    | `String "VeryLow" -> VERY_LOW
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSCurrentInstancePerformanceRisk" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSCurrentInstancePerformanceRisk")
     : rds_current_instance_performance_risk)
    : rds_current_instance_performance_risk)

let rds_instance_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUOverprovisioned" -> CPU_OVER_PROVISIONED
    | `String "NetworkBandwidthOverprovisioned" -> NETWORK_BANDWIDTH_OVER_PROVISIONED
    | `String "EBSIOPSOverprovisioned" -> EBS_IOPS_OVER_PROVISIONED
    | `String "EBSIOPSUnderprovisioned" -> EBS_IOPS_UNDER_PROVISIONED
    | `String "EBSThroughputOverprovisioned" -> EBS_THROUGHPUT_OVER_PROVISIONED
    | `String "CPUUnderprovisioned" -> CPU_UNDER_PROVISIONED
    | `String "NetworkBandwidthUnderprovisioned" -> NETWORK_BANDWIDTH_UNDER_PROVISIONED
    | `String "EBSThroughputUnderprovisioned" -> EBS_THROUGHPUT_UNDER_PROVISIONED
    | `String "NewGenerationDBInstanceClassAvailable" -> NEW_GENERATION_DB_INSTANCE_CLASS_AVAILABLE
    | `String "NewEngineVersionAvailable" -> NEW_ENGINE_VERSION_AVAILABLE
    | `String "DBClusterWriterUnderprovisioned" -> DB_CLUSTER_WRITER_UNDER_PROVISIONED
    | `String "MemoryUnderprovisioned" -> MEMORY_UNDER_PROVISIONED
    | `String "InstanceStorageReadIOPSUnderprovisioned" ->
        INSTANCE_STORAGE_READ_IOPS_UNDER_PROVISIONED
    | `String "InstanceStorageWriteIOPSUnderprovisioned" ->
        INSTANCE_STORAGE_WRITE_IOPS_UNDER_PROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSInstanceFindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSInstanceFindingReasonCode")
     : rds_instance_finding_reason_code)
    : rds_instance_finding_reason_code)

let rds_instance_finding_reason_codes_of_yojson tree path =
  list_of_yojson rds_instance_finding_reason_code_of_yojson tree path

let rds_storage_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Optimized" -> OPTIMIZED
    | `String "Underprovisioned" -> UNDER_PROVISIONED
    | `String "Overprovisioned" -> OVER_PROVISIONED
    | `String "NotOptimized" -> NOT_OPTIMIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RDSStorageFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSStorageFinding")
     : rds_storage_finding)
    : rds_storage_finding)

let rds_instance_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Optimized" -> OPTIMIZED
    | `String "Underprovisioned" -> UNDER_PROVISIONED
    | `String "Overprovisioned" -> OVER_PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RDSInstanceFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSInstanceFinding")
     : rds_instance_finding)
    : rds_instance_finding)

let idle_of_yojson (tree : t) path =
  ((match tree with
    | `String "True" -> TRUE
    | `String "False" -> FALSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Idle" value)
    | _ -> raise (deserialize_wrong_type_error path "Idle")
     : idle)
    : idle)

let db_cluster_identifier_of_yojson = string_of_yojson
let current_db_instance_class_of_yojson = string_of_yojson
let promotion_tier_of_yojson = int_of_yojson
let engine_version_of_yojson = string_of_yojson
let engine_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let rdsdb_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     engine = option_of_yojson (value_for_key engine_of_yojson "engine") _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "engineVersion") _list path;
     promotion_tier =
       option_of_yojson (value_for_key promotion_tier_of_yojson "promotionTier") _list path;
     current_db_instance_class =
       option_of_yojson
         (value_for_key current_db_instance_class_of_yojson "currentDBInstanceClass")
         _list path;
     current_storage_configuration =
       option_of_yojson
         (value_for_key db_storage_configuration_of_yojson "currentStorageConfiguration")
         _list path;
     db_cluster_identifier =
       option_of_yojson
         (value_for_key db_cluster_identifier_of_yojson "dbClusterIdentifier")
         _list path;
     idle = option_of_yojson (value_for_key idle_of_yojson "idle") _list path;
     instance_finding =
       option_of_yojson (value_for_key rds_instance_finding_of_yojson "instanceFinding") _list path;
     storage_finding =
       option_of_yojson (value_for_key rds_storage_finding_of_yojson "storageFinding") _list path;
     instance_finding_reason_codes =
       option_of_yojson
         (value_for_key rds_instance_finding_reason_codes_of_yojson "instanceFindingReasonCodes")
         _list path;
     current_instance_performance_risk =
       option_of_yojson
         (value_for_key rds_current_instance_performance_risk_of_yojson
            "currentInstancePerformanceRisk")
         _list path;
     current_storage_estimated_monthly_volume_io_ps_cost_variation =
       option_of_yojson
         (value_for_key rds_estimated_monthly_volume_io_ps_cost_variation_of_yojson
            "currentStorageEstimatedMonthlyVolumeIOPsCostVariation")
         _list path;
     storage_finding_reason_codes =
       option_of_yojson
         (value_for_key rds_storage_finding_reason_codes_of_yojson "storageFindingReasonCodes")
         _list path;
     instance_recommendation_options =
       option_of_yojson
         (value_for_key rdsdb_instance_recommendation_options_of_yojson
            "instanceRecommendationOptions")
         _list path;
     storage_recommendation_options =
       option_of_yojson
         (value_for_key rdsdb_storage_recommendation_options_of_yojson
            "storageRecommendationOptions")
         _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key rdsdb_utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key rds_effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookbackPeriodInDays")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : rdsdb_recommendation)

let rdsdb_recommendations_of_yojson tree path =
  list_of_yojson rdsdb_recommendation_of_yojson tree path

let get_rds_database_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     rds_db_recommendations =
       option_of_yojson
         (value_for_key rdsdb_recommendations_of_yojson "rdsDBRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_rds_database_recommendations_response)

let recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_vendor_architectures =
       option_of_yojson
         (value_for_key cpu_vendor_architectures_of_yojson "cpuVendorArchitectures")
         _list path;
   }
    : recommendation_preferences)

let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let rdsdb_recommendation_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceFinding" -> INSTANCE_FINDING
    | `String "InstanceFindingReasonCode" -> INSTANCE_FINDING_REASON_CODE
    | `String "StorageFinding" -> STORAGE_FINDING
    | `String "StorageFindingReasonCode" -> STORAGE_FINDING_REASON_CODE
    | `String "Idle" -> IDLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RDSDBRecommendationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RDSDBRecommendationFilterName")
     : rdsdb_recommendation_filter_name)
    : rdsdb_recommendation_filter_name)

let rdsdb_recommendation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson (value_for_key rdsdb_recommendation_filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : rdsdb_recommendation_filter)

let rdsdb_recommendation_filters_of_yojson tree path =
  list_of_yojson rdsdb_recommendation_filter_of_yojson tree path

let resource_arns_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let get_rds_database_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "resourceArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters =
       option_of_yojson (value_for_key rdsdb_recommendation_filters_of_yojson "filters") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : get_rds_database_recommendations_request)

let metric_values_of_yojson tree path = list_of_yojson metric_value_of_yojson tree path
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let timestamps_of_yojson tree path = list_of_yojson timestamp_of_yojson tree path

let rds_database_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key rdsdb_metric_name_of_yojson "name") _list path;
     timestamps = option_of_yojson (value_for_key timestamps_of_yojson "timestamps") _list path;
     values = option_of_yojson (value_for_key metric_values_of_yojson "values") _list path;
   }
    : rds_database_projected_metric)

let rds_database_projected_metrics_of_yojson tree path =
  list_of_yojson rds_database_projected_metric_of_yojson tree path

let recommended_db_instance_class_of_yojson = string_of_yojson

let rds_database_recommended_option_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_db_instance_class =
       option_of_yojson
         (value_for_key recommended_db_instance_class_of_yojson "recommendedDBInstanceClass")
         _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     projected_metrics =
       option_of_yojson
         (value_for_key rds_database_projected_metrics_of_yojson "projectedMetrics")
         _list path;
   }
    : rds_database_recommended_option_projected_metric)

let rds_database_recommended_option_projected_metrics_of_yojson tree path =
  list_of_yojson rds_database_recommended_option_projected_metric_of_yojson tree path

let get_rds_database_recommendation_projected_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_option_projected_metrics =
       option_of_yojson
         (value_for_key rds_database_recommended_option_projected_metrics_of_yojson
            "recommendedOptionProjectedMetrics")
         _list path;
   }
    : get_rds_database_recommendation_projected_metrics_response)

let period_of_yojson = int_of_yojson

let get_rds_database_recommendation_projected_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     stat = value_for_key metric_statistic_of_yojson "stat" _list path;
     period = value_for_key period_of_yojson "period" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : get_rds_database_recommendation_projected_metrics_request)

let license_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "LicenseIncluded" -> LICENSE_INCLUDED
    | `String "BringYourOwnLicense" -> BRING_YOUR_OWN_LICENSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseModel" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseModel")
     : license_model)
    : license_model)

let license_edition_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enterprise" -> ENTERPRISE
    | `String "Standard" -> STANDARD
    | `String "Free" -> FREE
    | `String "NoLicenseEditionFound" -> NO_LICENSE_EDITION_FOUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseEdition" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseEdition")
     : license_edition)
    : license_edition)

let operating_system_of_yojson = string_of_yojson

let license_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "operatingSystem") _list path;
     license_edition =
       option_of_yojson (value_for_key license_edition_of_yojson "licenseEdition") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
   }
    : license_recommendation_option)

let license_recommendation_options_of_yojson tree path =
  list_of_yojson license_recommendation_option_of_yojson tree path

let license_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvalidCloudWatchApplicationInsightsSetup" -> CW_APP_INSIGHTS_DISABLED
    | `String "CloudWatchApplicationInsightsError" -> CW_APP_INSIGHTS_ERROR
    | `String "LicenseOverprovisioned" -> LICENSE_OVER_PROVISIONED
    | `String "Optimized" -> OPTIMIZED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseFindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseFindingReasonCode")
     : license_finding_reason_code)
    : license_finding_reason_code)

let license_finding_reason_codes_of_yojson tree path =
  list_of_yojson license_finding_reason_code_of_yojson tree path

let license_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "InsufficientMetrics" -> INSUFFICIENT_METRICS
    | `String "Optimized" -> OPTIMIZED
    | `String "NotOptimized" -> NOT_OPTIMIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseFinding")
     : license_finding)
    : license_finding)

let metric_provider_arn_of_yojson = string_of_yojson

let metric_source_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "CloudWatchApplicationInsights" -> CloudWatchAppInsights
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MetricSourceProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricSourceProvider")
     : metric_source_provider)
    : metric_source_provider)

let metric_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider =
       option_of_yojson (value_for_key metric_source_provider_of_yojson "provider") _list path;
     provider_arn =
       option_of_yojson (value_for_key metric_provider_arn_of_yojson "providerArn") _list path;
   }
    : metric_source)

let metrics_source_of_yojson tree path = list_of_yojson metric_source_of_yojson tree path
let license_version_of_yojson = string_of_yojson

let license_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SQLServer" -> SQLSERVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseName" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseName")
     : license_name)
    : license_name)

let instance_type_of_yojson = string_of_yojson
let number_of_cores_of_yojson = int_of_yojson

let license_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_cores =
       option_of_yojson (value_for_key number_of_cores_of_yojson "numberOfCores") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "instanceType") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "operatingSystem") _list path;
     license_edition =
       option_of_yojson (value_for_key license_edition_of_yojson "licenseEdition") _list path;
     license_name = option_of_yojson (value_for_key license_name_of_yojson "licenseName") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     license_version =
       option_of_yojson (value_for_key license_version_of_yojson "licenseVersion") _list path;
     metrics_source =
       option_of_yojson (value_for_key metrics_source_of_yojson "metricsSource") _list path;
   }
    : license_configuration)

let license_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     current_license_configuration =
       option_of_yojson
         (value_for_key license_configuration_of_yojson "currentLicenseConfiguration")
         _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookbackPeriodInDays")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     finding = option_of_yojson (value_for_key license_finding_of_yojson "finding") _list path;
     finding_reason_codes =
       option_of_yojson
         (value_for_key license_finding_reason_codes_of_yojson "findingReasonCodes")
         _list path;
     license_recommendation_options =
       option_of_yojson
         (value_for_key license_recommendation_options_of_yojson "licenseRecommendationOptions")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : license_recommendation)

let license_recommendations_of_yojson tree path =
  list_of_yojson license_recommendation_of_yojson tree path

let get_license_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     license_recommendations =
       option_of_yojson
         (value_for_key license_recommendations_of_yojson "licenseRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_license_recommendations_response)

let license_recommendation_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> LICENSE_FINDING
    | `String "FindingReasonCode" -> LICENSE_FINDING_REASON_CODE
    | `String "LicenseName" -> LICENSE_NAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseRecommendationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseRecommendationFilterName")
     : license_recommendation_filter_name)
    : license_recommendation_filter_name)

let license_recommendation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key license_recommendation_filter_name_of_yojson "name")
         _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : license_recommendation_filter)

let license_recommendation_filters_of_yojson tree path =
  list_of_yojson license_recommendation_filter_of_yojson tree path

let get_license_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "resourceArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters =
       option_of_yojson
         (value_for_key license_recommendation_filters_of_yojson "filters")
         _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
   }
    : get_license_recommendations_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let lambda_savings_estimation_mode_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "PublicPricing" -> PUBLIC_PRICING
    | `String "CostExplorerRightsizing" -> COST_EXPLORER_RIGHTSIZING
    | `String "CostOptimizationHub" -> COST_OPTIMIZATION_HUB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaSavingsEstimationModeSource" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaSavingsEstimationModeSource")
     : lambda_savings_estimation_mode_source)
    : lambda_savings_estimation_mode_source)

let lambda_savings_estimation_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source =
       option_of_yojson
         (value_for_key lambda_savings_estimation_mode_source_of_yojson "source")
         _list path;
   }
    : lambda_savings_estimation_mode)

let lambda_effective_recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key lambda_savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
   }
    : lambda_effective_recommendation_preferences)

let lambda_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : lambda_estimated_monthly_savings)

let lambda_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key lambda_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : lambda_savings_opportunity_after_discounts)

let lambda_function_memory_metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "LowerBound" -> LOWER_BOUND
    | `String "UpperBound" -> UPPER_BOUND
    | `String "Expected" -> EXPECTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LambdaFunctionMemoryMetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionMemoryMetricStatistic")
     : lambda_function_memory_metric_statistic)
    : lambda_function_memory_metric_statistic)

let lambda_function_memory_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Duration" -> DURATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaFunctionMemoryMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionMemoryMetricName")
     : lambda_function_memory_metric_name)
    : lambda_function_memory_metric_name)

let lambda_function_memory_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key lambda_function_memory_metric_name_of_yojson "name")
         _list path;
     statistic =
       option_of_yojson
         (value_for_key lambda_function_memory_metric_statistic_of_yojson "statistic")
         _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : lambda_function_memory_projected_metric)

let lambda_function_memory_projected_metrics_of_yojson tree path =
  list_of_yojson lambda_function_memory_projected_metric_of_yojson tree path

let memory_size_of_yojson = int_of_yojson

let lambda_function_memory_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     memory_size = option_of_yojson (value_for_key memory_size_of_yojson "memorySize") _list path;
     projected_utilization_metrics =
       option_of_yojson
         (value_for_key lambda_function_memory_projected_metrics_of_yojson
            "projectedUtilizationMetrics")
         _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key lambda_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
   }
    : lambda_function_memory_recommendation_option)

let lambda_function_memory_recommendation_options_of_yojson tree path =
  list_of_yojson lambda_function_memory_recommendation_option_of_yojson tree path

let lambda_function_recommendation_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "MemoryOverprovisioned" -> MEMORY_OVER_PROVISIONED
    | `String "MemoryUnderprovisioned" -> MEMORY_UNDER_PROVISIONED
    | `String "InsufficientData" -> INSUFFICIENT_DATA
    | `String "Inconclusive" -> INCONCLUSIVE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LambdaFunctionRecommendationFindingReasonCode"
             value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionRecommendationFindingReasonCode")
     : lambda_function_recommendation_finding_reason_code)
    : lambda_function_recommendation_finding_reason_code)

let lambda_function_recommendation_finding_reason_codes_of_yojson tree path =
  list_of_yojson lambda_function_recommendation_finding_reason_code_of_yojson tree path

let lambda_function_recommendation_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Optimized" -> OPTIMIZED
    | `String "NotOptimized" -> NOT_OPTIMIZED
    | `String "Unavailable" -> UNAVAILABLE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LambdaFunctionRecommendationFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionRecommendationFinding")
     : lambda_function_recommendation_finding)
    : lambda_function_recommendation_finding)

let lambda_function_metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Maximum" -> MAXIMUM
    | `String "Average" -> AVERAGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaFunctionMetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionMetricStatistic")
     : lambda_function_metric_statistic)
    : lambda_function_metric_statistic)

let lambda_function_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Duration" -> DURATION
    | `String "Memory" -> MEMORY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaFunctionMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionMetricName")
     : lambda_function_metric_name)
    : lambda_function_metric_name)

let lambda_function_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key lambda_function_metric_name_of_yojson "name") _list path;
     statistic =
       option_of_yojson
         (value_for_key lambda_function_metric_statistic_of_yojson "statistic")
         _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : lambda_function_utilization_metric)

let lambda_function_utilization_metrics_of_yojson tree path =
  list_of_yojson lambda_function_utilization_metric_of_yojson tree path

let number_of_invocations_of_yojson = long_of_yojson
let function_version_of_yojson = string_of_yojson
let function_arn_of_yojson = string_of_yojson

let lambda_function_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_arn = option_of_yojson (value_for_key function_arn_of_yojson "functionArn") _list path;
     function_version =
       option_of_yojson (value_for_key function_version_of_yojson "functionVersion") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     current_memory_size =
       option_of_yojson (value_for_key memory_size_of_yojson "currentMemorySize") _list path;
     number_of_invocations =
       option_of_yojson
         (value_for_key number_of_invocations_of_yojson "numberOfInvocations")
         _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key lambda_function_utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookbackPeriodInDays")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     finding =
       option_of_yojson
         (value_for_key lambda_function_recommendation_finding_of_yojson "finding")
         _list path;
     finding_reason_codes =
       option_of_yojson
         (value_for_key lambda_function_recommendation_finding_reason_codes_of_yojson
            "findingReasonCodes")
         _list path;
     memory_size_recommendation_options =
       option_of_yojson
         (value_for_key lambda_function_memory_recommendation_options_of_yojson
            "memorySizeRecommendationOptions")
         _list path;
     current_performance_risk =
       option_of_yojson
         (value_for_key current_performance_risk_of_yojson "currentPerformanceRisk")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key lambda_effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : lambda_function_recommendation)

let lambda_function_recommendations_of_yojson tree path =
  list_of_yojson lambda_function_recommendation_of_yojson tree path

let get_lambda_function_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     lambda_function_recommendations =
       option_of_yojson
         (value_for_key lambda_function_recommendations_of_yojson "lambdaFunctionRecommendations")
         _list path;
   }
    : get_lambda_function_recommendations_response)

let lambda_function_recommendation_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> FINDING
    | `String "FindingReasonCode" -> FINDING_REASON_CODE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LambdaFunctionRecommendationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionRecommendationFilterName")
     : lambda_function_recommendation_filter_name)
    : lambda_function_recommendation_filter_name)

let lambda_function_recommendation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key lambda_function_recommendation_filter_name_of_yojson "name")
         _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : lambda_function_recommendation_filter)

let lambda_function_recommendation_filters_of_yojson tree path =
  list_of_yojson lambda_function_recommendation_filter_of_yojson tree path

let function_arns_of_yojson tree path = list_of_yojson function_arn_of_yojson tree path

let get_lambda_function_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_arns =
       option_of_yojson (value_for_key function_arns_of_yojson "functionArns") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson
         (value_for_key lambda_function_recommendation_filters_of_yojson "filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_lambda_function_recommendations_request)

let idle_recommendation_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2Instance" -> EC2_INSTANCE
    | `String "AutoScalingGroup" -> AUTO_SCALING_GROUP
    | `String "EBSVolume" -> EBS_VOLUME
    | `String "ECSService" -> ECS_SERVICE
    | `String "RDSDBInstance" -> RDS_DB_INSTANCE
    | `String "NatGateway" -> NAT_GATEWAY
    | `String "DynamoDBTable" -> DYNAMO_DB_TABLE
    | `String "ElastiCacheCluster" -> ELASTI_CACHE_CLUSTER
    | `String "MemoryDBCluster" -> MEMORY_DB_CLUSTER
    | `String "DocumentDBCluster" -> DOCUMENT_DB_CLUSTER
    | `String "WorkSpaces" -> WORKSPACES
    | `String "SageMakerEndpoint" -> SAGE_MAKER_ENDPOINT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IdleRecommendationResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "IdleRecommendationResourceType")
     : idle_recommendation_resource_type)
    : idle_recommendation_resource_type)

let idle_recommendation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = option_of_yojson (value_for_key identifier_of_yojson "identifier") _list path;
     code = option_of_yojson (value_for_key code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     resource_type =
       option_of_yojson
         (value_for_key idle_recommendation_resource_type_of_yojson "resourceType")
         _list path;
   }
    : idle_recommendation_error)

let idle_recommendation_errors_of_yojson tree path =
  list_of_yojson idle_recommendation_error_of_yojson tree path

let idle_dimension_value_of_yojson = string_of_yojson

let idle_dimension_values_of_yojson tree path =
  list_of_yojson idle_dimension_value_of_yojson tree path

let idle_dimension_key_of_yojson = string_of_yojson

let idle_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key idle_dimension_key_of_yojson "key") _list path;
     values = option_of_yojson (value_for_key idle_dimension_values_of_yojson "values") _list path;
   }
    : idle_dimension)

let idle_dimensions_of_yojson tree path = list_of_yojson idle_dimension_of_yojson tree path

let idle_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPU" -> CPU
    | `String "Memory" -> MEMORY
    | `String "NetworkOutBytesPerSecond" -> NETWORK_OUT_BYTES_PER_SECOND
    | `String "NetworkInBytesPerSecond" -> NETWORK_IN_BYTES_PER_SECOND
    | `String "DatabaseConnections" -> DATABASE_CONNECTIONS
    | `String "EBSVolumeReadIOPS" -> EBS_VOLUME_READ_IOPS
    | `String "EBSVolumeWriteIOPS" -> EBS_VOLUME_WRITE_IOPS
    | `String "VolumeReadOpsPerSecond" -> VOLUME_READ_OPS_PER_SECOND
    | `String "VolumeWriteOpsPerSecond" -> VOLUME_WRITE_OPS_PER_SECOND
    | `String "ActiveConnectionCount" -> ACTIVE_CONNECTION_COUNT
    | `String "PacketsInFromSource" -> PACKETS_IN_FROM_SOURCE
    | `String "PacketsInFromDestination" -> PACKETS_IN_FROM_DESTINATION
    | `String "ConsumedReadCapacityUnits" -> CONSUMED_READ_CAPACITY_UNITS
    | `String "ConsumedWriteCapacityUnits" -> CONSUMED_WRITE_CAPACITY_UNITS
    | `String "ConsumedChangeDataCaptureUnits" -> CONSUMED_CHANGE_DATA_CAPTURE_UNITS
    | `String "NewConnections" -> NEW_CONNECTIONS
    | `String "EngineCPUUtilization" -> ENGINE_CPU_UTILIZATION
    | `String "CacheHits" -> CACHE_HITS
    | `String "CacheMisses" -> CACHE_MISSES
    | `String "KeyspaceHits" -> KEYSPACE_HITS
    | `String "KeyspaceMisses" -> KEYSPACE_MISSES
    | `String "IsIdle" -> IS_IDLE
    | `String "UserConnected" -> USER_CONNECTED
    | `String "Invocations" -> INVOCATIONS
    | `String "GetTypeCmds" -> GET_TYPE_CMDS
    | `String "SetTypeCmds" -> SET_TYPE_CMDS
    | `String "ElastiCacheProcessingUnits" -> ELASTI_CACHE_PROCESSING_UNITS
    | `String "CurrConnections" -> CURR_CONNECTIONS
    | `String value -> raise (deserialize_unknown_enum_value_error path "IdleMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "IdleMetricName")
     : idle_metric_name)
    : idle_metric_name)

let idle_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key idle_metric_name_of_yojson "name") _list path;
     statistic = option_of_yojson (value_for_key metric_statistic_of_yojson "statistic") _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
     dimensions = option_of_yojson (value_for_key idle_dimensions_of_yojson "dimensions") _list path;
   }
    : idle_utilization_metric)

let idle_utilization_metrics_of_yojson tree path =
  list_of_yojson idle_utilization_metric_of_yojson tree path

let idle_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : idle_estimated_monthly_savings)

let idle_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key idle_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : idle_savings_opportunity_after_discounts)

let idle_savings_opportunity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key idle_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : idle_savings_opportunity)

let idle_finding_description_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson

let idle_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_type =
       option_of_yojson
         (value_for_key idle_recommendation_resource_type_of_yojson "resourceType")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     finding = option_of_yojson (value_for_key idle_finding_of_yojson "finding") _list path;
     finding_description =
       option_of_yojson
         (value_for_key idle_finding_description_of_yojson "findingDescription")
         _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key idle_savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key idle_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key idle_utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookBackPeriodInDays")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : idle_recommendation)

let idle_recommendations_of_yojson tree path =
  list_of_yojson idle_recommendation_of_yojson tree path

let get_idle_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     idle_recommendations =
       option_of_yojson
         (value_for_key idle_recommendations_of_yojson "idleRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key idle_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_idle_recommendations_response)

let order_of_yojson (tree : t) path =
  ((match tree with
    | `String "Asc" -> ASC
    | `String "Desc" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "Order" value)
    | _ -> raise (deserialize_wrong_type_error path "Order")
     : order)
    : order)

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "SavingsValue" -> SAVINGS_VALUE
    | `String "SavingsValueAfterDiscount" -> SAVINGS_VALUE_AFTER_DISCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let order_by_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension = option_of_yojson (value_for_key dimension_of_yojson "dimension") _list path;
     order = option_of_yojson (value_for_key order_of_yojson "order") _list path;
   }
    : order_by)

let idle_recommendation_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> FINDING
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IdleRecommendationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "IdleRecommendationFilterName")
     : idle_recommendation_filter_name)
    : idle_recommendation_filter_name)

let idle_recommendation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson (value_for_key idle_recommendation_filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : idle_recommendation_filter)

let idle_recommendation_filters_of_yojson tree path =
  list_of_yojson idle_recommendation_filter_of_yojson tree path

let idle_max_results_of_yojson = int_of_yojson

let get_idle_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "resourceArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key idle_max_results_of_yojson "maxResults") _list path;
     filters =
       option_of_yojson (value_for_key idle_recommendation_filters_of_yojson "filters") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     order_by = option_of_yojson (value_for_key order_by_of_yojson "orderBy") _list path;
   }
    : get_idle_recommendations_request)

let get_enrollment_statuses_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_enrollment_statuses =
       option_of_yojson
         (value_for_key account_enrollment_statuses_of_yojson "accountEnrollmentStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_enrollment_statuses_for_organization_response)

let enrollment_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Status" -> STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnrollmentFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "EnrollmentFilterName")
     : enrollment_filter_name)
    : enrollment_filter_name)

let enrollment_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key enrollment_filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : enrollment_filter)

let enrollment_filters_of_yojson tree path = list_of_yojson enrollment_filter_of_yojson tree path

let get_enrollment_statuses_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key enrollment_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_enrollment_statuses_for_organization_request)

let number_of_member_accounts_opted_in_of_yojson = int_of_yojson
let member_accounts_enrolled_of_yojson = bool_of_yojson

let get_enrollment_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_of_yojson "statusReason") _list path;
     member_accounts_enrolled =
       option_of_yojson
         (value_for_key member_accounts_enrolled_of_yojson "memberAccountsEnrolled")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key last_updated_timestamp_of_yojson "lastUpdatedTimestamp")
         _list path;
     number_of_member_accounts_opted_in =
       option_of_yojson
         (value_for_key number_of_member_accounts_opted_in_of_yojson "numberOfMemberAccountsOptedIn")
         _list path;
   }
    : get_enrollment_status_response)

let get_enrollment_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_effective_recommendation_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enhanced_infrastructure_metrics =
       option_of_yojson
         (value_for_key enhanced_infrastructure_metrics_of_yojson "enhancedInfrastructureMetrics")
         _list path;
     external_metrics_preference =
       option_of_yojson
         (value_for_key external_metrics_preference_of_yojson "externalMetricsPreference")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
     utilization_preferences =
       option_of_yojson
         (value_for_key utilization_preferences_of_yojson "utilizationPreferences")
         _list path;
     preferred_resources =
       option_of_yojson
         (value_for_key effective_preferred_resources_of_yojson "preferredResources")
         _list path;
   }
    : get_effective_recommendation_preferences_response)

let get_effective_recommendation_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path }
    : get_effective_recommendation_preferences_request)

let ecs_savings_estimation_mode_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "PublicPricing" -> PUBLIC_PRICING
    | `String "CostExplorerRightsizing" -> COST_EXPLORER_RIGHTSIZING
    | `String "CostOptimizationHub" -> COST_OPTIMIZATION_HUB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSSavingsEstimationModeSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSSavingsEstimationModeSource")
     : ecs_savings_estimation_mode_source)
    : ecs_savings_estimation_mode_source)

let ecs_savings_estimation_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source =
       option_of_yojson
         (value_for_key ecs_savings_estimation_mode_source_of_yojson "source")
         _list path;
   }
    : ecs_savings_estimation_mode)

let ecs_effective_recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key ecs_savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
   }
    : ecs_effective_recommendation_preferences)

let nullable_cpu_of_yojson = int_of_yojson
let nullable_memory_reservation_of_yojson = int_of_yojson
let nullable_memory_of_yojson = int_of_yojson

let memory_size_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     memory = option_of_yojson (value_for_key nullable_memory_of_yojson "memory") _list path;
     memory_reservation =
       option_of_yojson
         (value_for_key nullable_memory_reservation_of_yojson "memoryReservation")
         _list path;
   }
    : memory_size_configuration)

let container_name_of_yojson = string_of_yojson

let container_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson (value_for_key container_name_of_yojson "containerName") _list path;
     memory_size_configuration =
       option_of_yojson
         (value_for_key memory_size_configuration_of_yojson "memorySizeConfiguration")
         _list path;
     cpu = option_of_yojson (value_for_key nullable_cpu_of_yojson "cpu") _list path;
   }
    : container_recommendation)

let container_recommendations_of_yojson tree path =
  list_of_yojson container_recommendation_of_yojson tree path

let upper_bound_value_of_yojson = double_of_yojson
let lower_bound_value_of_yojson = double_of_yojson

let ecs_service_metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Maximum" -> MAXIMUM
    | `String "Average" -> AVERAGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSServiceMetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceMetricStatistic")
     : ecs_service_metric_statistic)
    : ecs_service_metric_statistic)

let ecs_service_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cpu" -> CPU
    | `String "Memory" -> MEMORY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSServiceMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceMetricName")
     : ecs_service_metric_name)
    : ecs_service_metric_name)

let ecs_service_projected_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ecs_service_metric_name_of_yojson "name") _list path;
     statistic =
       option_of_yojson
         (value_for_key ecs_service_metric_statistic_of_yojson "statistic")
         _list path;
     lower_bound_value =
       option_of_yojson (value_for_key lower_bound_value_of_yojson "lowerBoundValue") _list path;
     upper_bound_value =
       option_of_yojson (value_for_key upper_bound_value_of_yojson "upperBoundValue") _list path;
   }
    : ecs_service_projected_utilization_metric)

let ecs_service_projected_utilization_metrics_of_yojson tree path =
  list_of_yojson ecs_service_projected_utilization_metric_of_yojson tree path

let ecs_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : ecs_estimated_monthly_savings)

let ecs_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key ecs_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : ecs_savings_opportunity_after_discounts)

let ecs_service_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     memory = option_of_yojson (value_for_key nullable_memory_of_yojson "memory") _list path;
     cpu = option_of_yojson (value_for_key nullable_cpu_of_yojson "cpu") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key ecs_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
     projected_utilization_metrics =
       option_of_yojson
         (value_for_key ecs_service_projected_utilization_metrics_of_yojson
            "projectedUtilizationMetrics")
         _list path;
     container_recommendations =
       option_of_yojson
         (value_for_key container_recommendations_of_yojson "containerRecommendations")
         _list path;
   }
    : ecs_service_recommendation_option)

let ecs_service_recommendation_options_of_yojson tree path =
  list_of_yojson ecs_service_recommendation_option_of_yojson tree path

let ecs_service_recommendation_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "MemoryOverprovisioned" -> MEMORY_OVER_PROVISIONED
    | `String "MemoryUnderprovisioned" -> MEMORY_UNDER_PROVISIONED
    | `String "CPUOverprovisioned" -> CPU_OVER_PROVISIONED
    | `String "CPUUnderprovisioned" -> CPU_UNDER_PROVISIONED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ECSServiceRecommendationFindingReasonCode"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceRecommendationFindingReasonCode")
     : ecs_service_recommendation_finding_reason_code)
    : ecs_service_recommendation_finding_reason_code)

let ecs_service_recommendation_finding_reason_codes_of_yojson tree path =
  list_of_yojson ecs_service_recommendation_finding_reason_code_of_yojson tree path

let ecs_service_recommendation_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Optimized" -> OPTIMIZED
    | `String "Underprovisioned" -> UNDER_PROVISIONED
    | `String "Overprovisioned" -> OVER_PROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSServiceRecommendationFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceRecommendationFinding")
     : ecs_service_recommendation_finding)
    : ecs_service_recommendation_finding)

let ecs_service_launch_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2" -> EC2
    | `String "Fargate" -> FARGATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSServiceLaunchType" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceLaunchType")
     : ecs_service_launch_type)
    : ecs_service_launch_type)

let ecs_service_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ecs_service_metric_name_of_yojson "name") _list path;
     statistic =
       option_of_yojson
         (value_for_key ecs_service_metric_statistic_of_yojson "statistic")
         _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : ecs_service_utilization_metric)

let ecs_service_utilization_metrics_of_yojson tree path =
  list_of_yojson ecs_service_utilization_metric_of_yojson tree path

let task_definition_arn_of_yojson = string_of_yojson

let container_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson (value_for_key container_name_of_yojson "containerName") _list path;
     memory_size_configuration =
       option_of_yojson
         (value_for_key memory_size_configuration_of_yojson "memorySizeConfiguration")
         _list path;
     cpu = option_of_yojson (value_for_key nullable_cpu_of_yojson "cpu") _list path;
   }
    : container_configuration)

let container_configurations_of_yojson tree path =
  list_of_yojson container_configuration_of_yojson tree path

let service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     memory = option_of_yojson (value_for_key nullable_memory_of_yojson "memory") _list path;
     cpu = option_of_yojson (value_for_key nullable_cpu_of_yojson "cpu") _list path;
     container_configurations =
       option_of_yojson
         (value_for_key container_configurations_of_yojson "containerConfigurations")
         _list path;
     auto_scaling_configuration =
       option_of_yojson
         (value_for_key auto_scaling_configuration_of_yojson "autoScalingConfiguration")
         _list path;
     task_definition_arn =
       option_of_yojson (value_for_key task_definition_arn_of_yojson "taskDefinitionArn") _list path;
   }
    : service_configuration)

let service_arn_of_yojson = string_of_yojson

let ecs_service_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = option_of_yojson (value_for_key service_arn_of_yojson "serviceArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     current_service_configuration =
       option_of_yojson
         (value_for_key service_configuration_of_yojson "currentServiceConfiguration")
         _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key ecs_service_utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookbackPeriodInDays")
         _list path;
     launch_type =
       option_of_yojson (value_for_key ecs_service_launch_type_of_yojson "launchType") _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     finding =
       option_of_yojson
         (value_for_key ecs_service_recommendation_finding_of_yojson "finding")
         _list path;
     finding_reason_codes =
       option_of_yojson
         (value_for_key ecs_service_recommendation_finding_reason_codes_of_yojson
            "findingReasonCodes")
         _list path;
     service_recommendation_options =
       option_of_yojson
         (value_for_key ecs_service_recommendation_options_of_yojson "serviceRecommendationOptions")
         _list path;
     current_performance_risk =
       option_of_yojson
         (value_for_key current_performance_risk_of_yojson "currentPerformanceRisk")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key ecs_effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : ecs_service_recommendation)

let ecs_service_recommendations_of_yojson tree path =
  list_of_yojson ecs_service_recommendation_of_yojson tree path

let get_ecs_service_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     ecs_service_recommendations =
       option_of_yojson
         (value_for_key ecs_service_recommendations_of_yojson "ecsServiceRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_ecs_service_recommendations_response)

let ecs_service_recommendation_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> FINDING
    | `String "FindingReasonCode" -> FINDING_REASON_CODE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ECSServiceRecommendationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ECSServiceRecommendationFilterName")
     : ecs_service_recommendation_filter_name)
    : ecs_service_recommendation_filter_name)

let ecs_service_recommendation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key ecs_service_recommendation_filter_name_of_yojson "name")
         _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : ecs_service_recommendation_filter)

let ecs_service_recommendation_filters_of_yojson tree path =
  list_of_yojson ecs_service_recommendation_filter_of_yojson tree path

let service_arns_of_yojson tree path = list_of_yojson service_arn_of_yojson tree path

let get_ecs_service_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arns = option_of_yojson (value_for_key service_arns_of_yojson "serviceArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters =
       option_of_yojson
         (value_for_key ecs_service_recommendation_filters_of_yojson "filters")
         _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
   }
    : get_ecs_service_recommendations_request)

let ecs_service_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ecs_service_metric_name_of_yojson "name") _list path;
     timestamps = option_of_yojson (value_for_key timestamps_of_yojson "timestamps") _list path;
     upper_bound_values =
       option_of_yojson (value_for_key metric_values_of_yojson "upperBoundValues") _list path;
     lower_bound_values =
       option_of_yojson (value_for_key metric_values_of_yojson "lowerBoundValues") _list path;
   }
    : ecs_service_projected_metric)

let ecs_service_projected_metrics_of_yojson tree path =
  list_of_yojson ecs_service_projected_metric_of_yojson tree path

let cpu_size_of_yojson = int_of_yojson

let ecs_service_recommended_option_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_cpu_units =
       option_of_yojson (value_for_key cpu_size_of_yojson "recommendedCpuUnits") _list path;
     recommended_memory_size =
       option_of_yojson (value_for_key memory_size_of_yojson "recommendedMemorySize") _list path;
     projected_metrics =
       option_of_yojson
         (value_for_key ecs_service_projected_metrics_of_yojson "projectedMetrics")
         _list path;
   }
    : ecs_service_recommended_option_projected_metric)

let ecs_service_recommended_option_projected_metrics_of_yojson tree path =
  list_of_yojson ecs_service_recommended_option_projected_metric_of_yojson tree path

let get_ecs_service_recommendation_projected_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_option_projected_metrics =
       option_of_yojson
         (value_for_key ecs_service_recommended_option_projected_metrics_of_yojson
            "recommendedOptionProjectedMetrics")
         _list path;
   }
    : get_ecs_service_recommendation_projected_metrics_response)

let get_ecs_service_recommendation_projected_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = value_for_key service_arn_of_yojson "serviceArn" _list path;
     stat = value_for_key metric_statistic_of_yojson "stat" _list path;
     period = value_for_key period_of_yojson "period" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
   }
    : get_ecs_service_recommendation_projected_metrics_request)

let projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key metric_name_of_yojson "name") _list path;
     timestamps = option_of_yojson (value_for_key timestamps_of_yojson "timestamps") _list path;
     values = option_of_yojson (value_for_key metric_values_of_yojson "values") _list path;
   }
    : projected_metric)

let projected_metrics_of_yojson tree path = list_of_yojson projected_metric_of_yojson tree path
let recommended_instance_type_of_yojson = string_of_yojson

let recommended_option_projected_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_instance_type =
       option_of_yojson
         (value_for_key recommended_instance_type_of_yojson "recommendedInstanceType")
         _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     projected_metrics =
       option_of_yojson (value_for_key projected_metrics_of_yojson "projectedMetrics") _list path;
   }
    : recommended_option_projected_metric)

let recommended_option_projected_metrics_of_yojson tree path =
  list_of_yojson recommended_option_projected_metric_of_yojson tree path

let get_ec2_recommendation_projected_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_option_projected_metrics =
       option_of_yojson
         (value_for_key recommended_option_projected_metrics_of_yojson
            "recommendedOptionProjectedMetrics")
         _list path;
   }
    : get_ec2_recommendation_projected_metrics_response)

let instance_arn_of_yojson = string_of_yojson

let get_ec2_recommendation_projected_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_arn = value_for_key instance_arn_of_yojson "instanceArn" _list path;
     stat = value_for_key metric_statistic_of_yojson "stat" _list path;
     period = value_for_key period_of_yojson "period" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : get_ec2_recommendation_projected_metrics_request)

let instance_idle_of_yojson (tree : t) path =
  ((match tree with
    | `String "True" -> TRUE
    | `String "False" -> FALSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceIdle" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceIdle")
     : instance_idle)
    : instance_idle)

let external_metric_status_reason_of_yojson = string_of_yojson

let external_metric_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_EXTERNAL_METRIC_SET" -> NO_EXTERNAL_METRIC_SET
    | `String "INTEGRATION_SUCCESS" -> INTEGRATION_SUCCESS
    | `String "DATADOG_INTEGRATION_ERROR" -> DATADOG_INTEGRATION_ERROR
    | `String "DYNATRACE_INTEGRATION_ERROR" -> DYNATRACE_INTEGRATION_ERROR
    | `String "NEWRELIC_INTEGRATION_ERROR" -> NEWRELIC_INTEGRATION_ERROR
    | `String "INSTANA_INTEGRATION_ERROR" -> INSTANA_INTEGRATION_ERROR
    | `String "INSUFFICIENT_DATADOG_METRICS" -> INSUFFICIENT_DATADOG_METRICS
    | `String "INSUFFICIENT_DYNATRACE_METRICS" -> INSUFFICIENT_DYNATRACE_METRICS
    | `String "INSUFFICIENT_NEWRELIC_METRICS" -> INSUFFICIENT_NEWRELIC_METRICS
    | `String "INSUFFICIENT_INSTANA_METRICS" -> INSUFFICIENT_INSTANA_METRICS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExternalMetricStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExternalMetricStatusCode")
     : external_metric_status_code)
    : external_metric_status_code)

let external_metric_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson
         (value_for_key external_metric_status_code_of_yojson "statusCode")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key external_metric_status_reason_of_yojson "statusReason")
         _list path;
   }
    : external_metric_status)

let instance_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> PENDING
    | `String "running" -> RUNNING
    | `String "shutting-down" -> SHUTTING_DOWN
    | `String "terminated" -> TERMINATED
    | `String "stopping" -> STOPPING
    | `String "stopped" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceState")
     : instance_state)
    : instance_state)

let recommendation_source_arn_of_yojson = string_of_yojson

let recommendation_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_source_arn =
       option_of_yojson
         (value_for_key recommendation_source_arn_of_yojson "recommendationSourceArn")
         _list path;
     recommendation_source_type =
       option_of_yojson
         (value_for_key recommendation_source_type_of_yojson "recommendationSourceType")
         _list path;
   }
    : recommendation_source)

let recommendation_sources_of_yojson tree path =
  list_of_yojson recommendation_source_of_yojson tree path

let instance_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : instance_estimated_monthly_savings)

let instance_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key instance_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : instance_savings_opportunity_after_discounts)

let platform_difference_of_yojson (tree : t) path =
  ((match tree with
    | `String "Hypervisor" -> HYPERVISOR
    | `String "NetworkInterface" -> NETWORK_INTERFACE
    | `String "StorageInterface" -> STORAGE_INTERFACE
    | `String "InstanceStoreAvailability" -> INSTANCE_STORE_AVAILABILITY
    | `String "VirtualizationType" -> VIRTUALIZATION_TYPE
    | `String "Architecture" -> ARCHITECTURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformDifference" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformDifference")
     : platform_difference)
    : platform_difference)

let platform_differences_of_yojson tree path =
  list_of_yojson platform_difference_of_yojson tree path

let instance_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "instanceType") _list path;
     instance_gpu_info =
       option_of_yojson (value_for_key gpu_info_of_yojson "instanceGpuInfo") _list path;
     projected_utilization_metrics =
       option_of_yojson
         (value_for_key projected_utilization_metrics_of_yojson "projectedUtilizationMetrics")
         _list path;
     platform_differences =
       option_of_yojson
         (value_for_key platform_differences_of_yojson "platformDifferences")
         _list path;
     performance_risk =
       option_of_yojson (value_for_key performance_risk_of_yojson "performanceRisk") _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key instance_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
     migration_effort =
       option_of_yojson (value_for_key migration_effort_of_yojson "migrationEffort") _list path;
   }
    : instance_recommendation_option)

let recommendation_options_of_yojson tree path =
  list_of_yojson instance_recommendation_option_of_yojson tree path

let instance_recommendation_finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUOverprovisioned" -> CPU_OVER_PROVISIONED
    | `String "CPUUnderprovisioned" -> CPU_UNDER_PROVISIONED
    | `String "MemoryOverprovisioned" -> MEMORY_OVER_PROVISIONED
    | `String "MemoryUnderprovisioned" -> MEMORY_UNDER_PROVISIONED
    | `String "EBSThroughputOverprovisioned" -> EBS_THROUGHPUT_OVER_PROVISIONED
    | `String "EBSThroughputUnderprovisioned" -> EBS_THROUGHPUT_UNDER_PROVISIONED
    | `String "EBSIOPSOverprovisioned" -> EBS_IOPS_OVER_PROVISIONED
    | `String "EBSIOPSUnderprovisioned" -> EBS_IOPS_UNDER_PROVISIONED
    | `String "NetworkBandwidthOverprovisioned" -> NETWORK_BANDWIDTH_OVER_PROVISIONED
    | `String "NetworkBandwidthUnderprovisioned" -> NETWORK_BANDWIDTH_UNDER_PROVISIONED
    | `String "NetworkPPSOverprovisioned" -> NETWORK_PPS_OVER_PROVISIONED
    | `String "NetworkPPSUnderprovisioned" -> NETWORK_PPS_UNDER_PROVISIONED
    | `String "DiskIOPSOverprovisioned" -> DISK_IOPS_OVER_PROVISIONED
    | `String "DiskIOPSUnderprovisioned" -> DISK_IOPS_UNDER_PROVISIONED
    | `String "DiskThroughputOverprovisioned" -> DISK_THROUGHPUT_OVER_PROVISIONED
    | `String "DiskThroughputUnderprovisioned" -> DISK_THROUGHPUT_UNDER_PROVISIONED
    | `String "GPUUnderprovisioned" -> GPU_UNDER_PROVISIONED
    | `String "GPUOverprovisioned" -> GPU_OVER_PROVISIONED
    | `String "GPUMemoryUnderprovisioned" -> GPU_MEMORY_UNDER_PROVISIONED
    | `String "GPUMemoryOverprovisioned" -> GPU_MEMORY_OVER_PROVISIONED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "InstanceRecommendationFindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceRecommendationFindingReasonCode")
     : instance_recommendation_finding_reason_code)
    : instance_recommendation_finding_reason_code)

let instance_recommendation_finding_reason_codes_of_yojson tree path =
  list_of_yojson instance_recommendation_finding_reason_code_of_yojson tree path

let current_instance_type_of_yojson = string_of_yojson
let instance_name_of_yojson = string_of_yojson

let instance_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "instanceArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     instance_name =
       option_of_yojson (value_for_key instance_name_of_yojson "instanceName") _list path;
     current_instance_type =
       option_of_yojson
         (value_for_key current_instance_type_of_yojson "currentInstanceType")
         _list path;
     finding = option_of_yojson (value_for_key finding_of_yojson "finding") _list path;
     finding_reason_codes =
       option_of_yojson
         (value_for_key instance_recommendation_finding_reason_codes_of_yojson "findingReasonCodes")
         _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookBackPeriodInDays")
         _list path;
     recommendation_options =
       option_of_yojson
         (value_for_key recommendation_options_of_yojson "recommendationOptions")
         _list path;
     recommendation_sources =
       option_of_yojson
         (value_for_key recommendation_sources_of_yojson "recommendationSources")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     current_performance_risk =
       option_of_yojson
         (value_for_key current_performance_risk_of_yojson "currentPerformanceRisk")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     inferred_workload_types =
       option_of_yojson
         (value_for_key inferred_workload_types_of_yojson "inferredWorkloadTypes")
         _list path;
     instance_state =
       option_of_yojson (value_for_key instance_state_of_yojson "instanceState") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     external_metric_status =
       option_of_yojson
         (value_for_key external_metric_status_of_yojson "externalMetricStatus")
         _list path;
     current_instance_gpu_info =
       option_of_yojson (value_for_key gpu_info_of_yojson "currentInstanceGpuInfo") _list path;
     idle = option_of_yojson (value_for_key instance_idle_of_yojson "idle") _list path;
   }
    : instance_recommendation)

let instance_recommendations_of_yojson tree path =
  list_of_yojson instance_recommendation_of_yojson tree path

let get_ec2_instance_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     instance_recommendations =
       option_of_yojson
         (value_for_key instance_recommendations_of_yojson "instanceRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_ec2_instance_recommendations_response)

let filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> FINDING
    | `String "FindingReasonCodes" -> FINDING_REASON_CODES
    | `String "RecommendationSourceType" -> RECOMMENDATION_SOURCE_TYPE
    | `String "InferredWorkloadTypes" -> INFERRED_WORKLOAD_TYPES
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterName")
     : filter_name)
    : filter_name)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let instance_arns_of_yojson tree path = list_of_yojson instance_arn_of_yojson tree path

let get_ec2_instance_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_arns =
       option_of_yojson (value_for_key instance_arns_of_yojson "instanceArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : get_ec2_instance_recommendations_request)

let ebs_savings_estimation_mode_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "PublicPricing" -> PUBLIC_PRICING
    | `String "CostExplorerRightsizing" -> COST_EXPLORER_RIGHTSIZING
    | `String "CostOptimizationHub" -> COST_OPTIMIZATION_HUB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EBSSavingsEstimationModeSource" value)
    | _ -> raise (deserialize_wrong_type_error path "EBSSavingsEstimationModeSource")
     : ebs_savings_estimation_mode_source)
    : ebs_savings_estimation_mode_source)

let ebs_savings_estimation_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source =
       option_of_yojson
         (value_for_key ebs_savings_estimation_mode_source_of_yojson "source")
         _list path;
   }
    : ebs_savings_estimation_mode)

let ebs_effective_recommendation_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key ebs_savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
     look_back_period =
       option_of_yojson
         (value_for_key look_back_period_preference_of_yojson "lookBackPeriod")
         _list path;
   }
    : ebs_effective_recommendation_preferences)

let ebs_estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
   }
    : ebs_estimated_monthly_savings)

let ebs_savings_opportunity_after_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_opportunity_percentage =
       option_of_yojson
         (value_for_key savings_opportunity_percentage_of_yojson "savingsOpportunityPercentage")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key ebs_estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : ebs_savings_opportunity_after_discounts)

let root_volume_of_yojson = bool_of_yojson
let volume_burst_throughput_of_yojson = int_of_yojson
let volume_baseline_throughput_of_yojson = int_of_yojson
let volume_burst_iop_s_of_yojson = int_of_yojson
let volume_baseline_iop_s_of_yojson = int_of_yojson
let volume_size_of_yojson = int_of_yojson
let volume_type_of_yojson = string_of_yojson

let volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_type = option_of_yojson (value_for_key volume_type_of_yojson "volumeType") _list path;
     volume_size = option_of_yojson (value_for_key volume_size_of_yojson "volumeSize") _list path;
     volume_baseline_iop_s =
       option_of_yojson
         (value_for_key volume_baseline_iop_s_of_yojson "volumeBaselineIOPS")
         _list path;
     volume_burst_iop_s =
       option_of_yojson (value_for_key volume_burst_iop_s_of_yojson "volumeBurstIOPS") _list path;
     volume_baseline_throughput =
       option_of_yojson
         (value_for_key volume_baseline_throughput_of_yojson "volumeBaselineThroughput")
         _list path;
     volume_burst_throughput =
       option_of_yojson
         (value_for_key volume_burst_throughput_of_yojson "volumeBurstThroughput")
         _list path;
     root_volume = option_of_yojson (value_for_key root_volume_of_yojson "rootVolume") _list path;
   }
    : volume_configuration)

let volume_recommendation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson (value_for_key volume_configuration_of_yojson "configuration") _list path;
     performance_risk =
       option_of_yojson (value_for_key performance_risk_of_yojson "performanceRisk") _list path;
     rank = option_of_yojson (value_for_key rank_of_yojson "rank") _list path;
     savings_opportunity =
       option_of_yojson
         (value_for_key savings_opportunity_of_yojson "savingsOpportunity")
         _list path;
     savings_opportunity_after_discounts =
       option_of_yojson
         (value_for_key ebs_savings_opportunity_after_discounts_of_yojson
            "savingsOpportunityAfterDiscounts")
         _list path;
   }
    : volume_recommendation_option)

let volume_recommendation_options_of_yojson tree path =
  list_of_yojson volume_recommendation_option_of_yojson tree path

let ebs_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "VolumeReadOpsPerSecond" -> VOLUME_READ_OPS_PER_SECOND
    | `String "VolumeWriteOpsPerSecond" -> VOLUME_WRITE_OPS_PER_SECOND
    | `String "VolumeReadBytesPerSecond" -> VOLUME_READ_BYTES_PER_SECOND
    | `String "VolumeWriteBytesPerSecond" -> VOLUME_WRITE_BYTES_PER_SECOND
    | `String "VolumeIOPSExceeded" -> VOLUME_IOPS_EXCEEDED
    | `String "VolumeThroughputExceeded" -> VOLUME_THROUGHPUT_EXCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EBSMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "EBSMetricName")
     : ebs_metric_name)
    : ebs_metric_name)

let ebs_utilization_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ebs_metric_name_of_yojson "name") _list path;
     statistic = option_of_yojson (value_for_key metric_statistic_of_yojson "statistic") _list path;
     value = option_of_yojson (value_for_key metric_value_of_yojson "value") _list path;
   }
    : ebs_utilization_metric)

let ebs_utilization_metrics_of_yojson tree path =
  list_of_yojson ebs_utilization_metric_of_yojson tree path

let ebs_finding_of_yojson (tree : t) path =
  ((match tree with
    | `String "Optimized" -> OPTIMIZED
    | `String "NotOptimized" -> NOT_OPTIMIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EBSFinding" value)
    | _ -> raise (deserialize_wrong_type_error path "EBSFinding")
     : ebs_finding)
    : ebs_finding)

let volume_arn_of_yojson = string_of_yojson

let volume_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_arn = option_of_yojson (value_for_key volume_arn_of_yojson "volumeArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     current_configuration =
       option_of_yojson
         (value_for_key volume_configuration_of_yojson "currentConfiguration")
         _list path;
     finding = option_of_yojson (value_for_key ebs_finding_of_yojson "finding") _list path;
     utilization_metrics =
       option_of_yojson
         (value_for_key ebs_utilization_metrics_of_yojson "utilizationMetrics")
         _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key look_back_period_in_days_of_yojson "lookBackPeriodInDays")
         _list path;
     volume_recommendation_options =
       option_of_yojson
         (value_for_key volume_recommendation_options_of_yojson "volumeRecommendationOptions")
         _list path;
     last_refresh_timestamp =
       option_of_yojson
         (value_for_key last_refresh_timestamp_of_yojson "lastRefreshTimestamp")
         _list path;
     current_performance_risk =
       option_of_yojson
         (value_for_key current_performance_risk_of_yojson "currentPerformanceRisk")
         _list path;
     effective_recommendation_preferences =
       option_of_yojson
         (value_for_key ebs_effective_recommendation_preferences_of_yojson
            "effectiveRecommendationPreferences")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : volume_recommendation)

let volume_recommendations_of_yojson tree path =
  list_of_yojson volume_recommendation_of_yojson tree path

let get_ebs_volume_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     volume_recommendations =
       option_of_yojson
         (value_for_key volume_recommendations_of_yojson "volumeRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_ebs_volume_recommendations_response)

let ebs_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Finding" -> FINDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EBSFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "EBSFilterName")
     : ebs_filter_name)
    : ebs_filter_name)

let ebs_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ebs_filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : ebs_filter)

let ebs_filters_of_yojson tree path = list_of_yojson ebs_filter_of_yojson tree path
let volume_arns_of_yojson tree path = list_of_yojson volume_arn_of_yojson tree path

let get_ebs_volume_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_arns = option_of_yojson (value_for_key volume_arns_of_yojson "volumeArns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters = option_of_yojson (value_for_key ebs_filters_of_yojson "filters") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
   }
    : get_ebs_volume_recommendations_request)

let get_auto_scaling_group_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     auto_scaling_group_recommendations =
       option_of_yojson
         (value_for_key auto_scaling_group_recommendations_of_yojson
            "autoScalingGroupRecommendations")
         _list path;
     errors =
       option_of_yojson (value_for_key get_recommendation_errors_of_yojson "errors") _list path;
   }
    : get_auto_scaling_group_recommendations_response)

let get_auto_scaling_group_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     auto_scaling_group_arns =
       option_of_yojson
         (value_for_key auto_scaling_group_arns_of_yojson "autoScalingGroupArns")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : get_auto_scaling_group_recommendations_request)

let metadata_key_of_yojson = string_of_yojson
let destination_key_of_yojson = string_of_yojson
let destination_bucket_of_yojson = string_of_yojson

let s3_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key destination_bucket_of_yojson "bucket") _list path;
     key = option_of_yojson (value_for_key destination_key_of_yojson "key") _list path;
     metadata_key = option_of_yojson (value_for_key metadata_key_of_yojson "metadataKey") _list path;
   }
    : s3_destination)

let job_id_of_yojson = string_of_yojson

let export_rds_database_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_rds_database_recommendations_response)

let file_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "Csv" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "FileFormat")
     : file_format)
    : file_format)

let destination_key_prefix_of_yojson = string_of_yojson

let s3_destination_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key destination_bucket_of_yojson "bucket") _list path;
     key_prefix =
       option_of_yojson (value_for_key destination_key_prefix_of_yojson "keyPrefix") _list path;
   }
    : s3_destination_config)

let exportable_rdsdb_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResourceArn" -> RESOURCE_ARN
    | `String "AccountId" -> ACCOUNT_ID
    | `String "Engine" -> ENGINE
    | `String "EngineVersion" -> ENGINE_VERSION
    | `String "Idle" -> IDLE
    | `String "MultiAZDBInstance" -> MULTI_AZ_DB_INSTANCE
    | `String "ClusterWriter" -> CLUSTER_WRITER
    | `String "CurrentDBInstanceClass" -> CURRENT_DB_INSTANCE_CLASS
    | `String "CurrentStorageConfigurationStorageType" -> CURRENT_STORAGE_CONFIGURATION_STORAGE_TYPE
    | `String "CurrentStorageConfigurationAllocatedStorage" ->
        CURRENT_STORAGE_CONFIGURATION_ALLOCATED_STORAGE
    | `String "CurrentStorageConfigurationMaxAllocatedStorage" ->
        CURRENT_STORAGE_CONFIGURATION_MAX_ALLOCATED_STORAGE
    | `String "CurrentStorageConfigurationIOPS" -> CURRENT_STORAGE_CONFIGURATION_IOPS
    | `String "CurrentStorageConfigurationStorageThroughput" ->
        CURRENT_STORAGE_CONFIGURATION_STORAGE_THROUGHPUT
    | `String "CurrentStorageEstimatedMonthlyVolumeIOPsCostVariation" ->
        CURRENT_STORAGE_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION
    | `String "CurrentInstanceOnDemandHourlyPrice" -> CURRENT_INSTANCE_ON_DEMAND_HOURLY_PRICE
    | `String "CurrentStorageOnDemandMonthlyPrice" -> CURRENT_STORAGE_ON_DEMAND_MONTHLY_PRICE
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "CurrentStorageEstimatedClusterInstanceOnDemandMonthlyCost" ->
        CURRENT_STORAGE_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST
    | `String "CurrentStorageEstimatedClusterStorageOnDemandMonthlyCost" ->
        CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST
    | `String "CurrentStorageEstimatedClusterStorageIOOnDemandMonthlyCost" ->
        CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST
    | `String "CurrentInstancePerformanceRisk" -> CURRENT_INSTANCE_PERFORMANCE_RISK
    | `String "UtilizationMetricsCpuMaximum" -> UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeStorageSpaceUtilizationMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_STORAGE_SPACE_UTILIZATION_MAXIMUM
    | `String "UtilizationMetricsNetworkReceiveThroughputMaximum" ->
        UTILIZATION_METRICS_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsNetworkTransmitThroughputMaximum" ->
        UTILIZATION_METRICS_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeReadIOPSMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeReadThroughputMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_READ_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeWriteThroughputMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_WRITE_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsDatabaseConnectionsMaximum" ->
        UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM
    | `String "UtilizationMetricsStorageNetworkReceiveThroughputMaximum" ->
        UTILIZATION_METRICS_STORAGE_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsStorageNetworkTransmitThroughputMaximum" ->
        UTILIZATION_METRICS_STORAGE_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM
    | `String "UtilizationMetricsAuroraMemoryHealthStateMaximum" ->
        UTILIZATION_METRICS_AURORA_MEMORY_HEALTH_STATE_MAXIMUM
    | `String "UtilizationMetricsAuroraMemoryNumDeclinedSqlTotalMaximum" ->
        UTILIZATION_METRICS_AURORA_MEMORY_NUM_DECLINED_SQL_TOTAL_MAXIMUM
    | `String "UtilizationMetricsAuroraMemoryNumKillConnTotalMaximum" ->
        UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_CONN_TOTAL_MAXIMUM
    | `String "UtilizationMetricsAuroraMemoryNumKillQueryTotalMaximum" ->
        UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_QUERY_TOTAL_MAXIMUM
    | `String "UtilizationMetricsReadIOPSEphemeralStorageMaximum" ->
        UTILIZATION_METRICS_READ_IOPS_EPHEMERAL_STORAGE_MAXIMUM
    | `String "UtilizationMetricsWriteIOPSEphemeralStorageMaximum" ->
        UTILIZATION_METRICS_WRITE_IOPS_EPHEMERAL_STORAGE_MAXIMUM
    | `String "UtilizationMetricsVolumeBytesUsedAverage" ->
        UTILIZATION_METRICS_VOLUME_BYTES_USED_AVERAGE
    | `String "UtilizationMetricsVolumeReadIOPsAverage" ->
        UTILIZATION_METRICS_VOLUME_READ_IOPS_AVERAGE
    | `String "UtilizationMetricsVolumeWriteIOPsAverage" ->
        UTILIZATION_METRICS_VOLUME_WRITE_IOPS_AVERAGE
    | `String "InstanceFinding" -> INSTANCE_FINDING
    | `String "InstanceFindingReasonCodes" -> INSTANCE_FINDING_REASON_CODES
    | `String "StorageFinding" -> STORAGE_FINDING
    | `String "StorageFindingReasonCodes" -> STORAGE_FINDING_REASON_CODES
    | `String "InstanceRecommendationOptionsDBInstanceClass" ->
        INSTANCE_RECOMMENDATION_OPTIONS_DB_INSTANCE_CLASS
    | `String "InstanceRecommendationOptionsRank" -> INSTANCE_RECOMMENDATION_OPTIONS_RANK
    | `String "InstanceRecommendationOptionsPerformanceRisk" ->
        INSTANCE_RECOMMENDATION_OPTIONS_PERFORMANCE_RISK
    | `String "InstanceRecommendationOptionsProjectedUtilizationMetricsCpuMaximum" ->
        INSTANCE_RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "StorageRecommendationOptionsStorageType" ->
        STORAGE_RECOMMENDATION_OPTIONS_STORAGE_TYPE
    | `String "StorageRecommendationOptionsAllocatedStorage" ->
        STORAGE_RECOMMENDATION_OPTIONS_ALLOCATED_STORAGE
    | `String "StorageRecommendationOptionsMaxAllocatedStorage" ->
        STORAGE_RECOMMENDATION_OPTIONS_MAX_ALLOCATED_STORAGE
    | `String "StorageRecommendationOptionsIOPS" -> STORAGE_RECOMMENDATION_OPTIONS_IOPS
    | `String "StorageRecommendationOptionsStorageThroughput" ->
        STORAGE_RECOMMENDATION_OPTIONS_STORAGE_THROUGHPUT
    | `String "StorageRecommendationOptionsRank" -> STORAGE_RECOMMENDATION_OPTIONS_RANK
    | `String "StorageRecommendationOptionsEstimatedMonthlyVolumeIOPsCostVariation" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION
    | `String "InstanceRecommendationOptionsInstanceOnDemandHourlyPrice" ->
        INSTANCE_RECOMMENDATION_OPTIONS_INSTANCE_ON_DEMAND_HOURLY_PRICE
    | `String "InstanceRecommendationOptionsSavingsOpportunityPercentage" ->
        INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValue" ->
        INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "InstanceRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "InstanceRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "InstanceRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String "StorageRecommendationOptionsOnDemandMonthlyPrice" ->
        STORAGE_RECOMMENDATION_OPTIONS_ON_DEMAND_MONTHLY_PRICE
    | `String "StorageRecommendationOptionsEstimatedClusterInstanceOnDemandMonthlyCost" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST
    | `String "StorageRecommendationOptionsEstimatedClusterStorageOnDemandMonthlyCost" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST
    | `String "StorageRecommendationOptionsEstimatedClusterStorageIOOnDemandMonthlyCost" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST
    | `String "StorageRecommendationOptionsSavingsOpportunityPercentage" ->
        STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "StorageRecommendationOptionsEstimatedMonthlySavingsValue" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "StorageRecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "StorageRecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "StorageRecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String "EffectiveRecommendationPreferencesCpuVendorArchitectures" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES
    | `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS
    | `String "EffectiveRecommendationPreferencesLookBackPeriod" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "Tags" -> TAGS
    | `String "DBClusterIdentifier" -> DB_CLUSTER_IDENTIFIER
    | `String "PromotionTier" -> PROMOTION_TIER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableRDSDBField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableRDSDBField")
     : exportable_rdsdb_field)
    : exportable_rdsdb_field)

let exportable_rdsdb_fields_of_yojson tree path =
  list_of_yojson exportable_rdsdb_field_of_yojson tree path

let export_rds_database_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson (value_for_key rdsdb_recommendation_filters_of_yojson "filters") _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_rdsdb_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : export_rds_database_recommendations_request)

let export_license_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_license_recommendations_response)

let exportable_license_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "ResourceArn" -> RESOURCE_ARN
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "Finding" -> LICENSE_FINDING
    | `String "FindingReasonCodes" -> LICENSE_FINDING_REASON_CODES
    | `String "CurrentLicenseConfigurationNumberOfCores" ->
        CURRENT_LICENSE_CONFIGURATION_NUMBER_OF_CORES
    | `String "CurrentLicenseConfigurationInstanceType" ->
        CURRENT_LICENSE_CONFIGURATION_INSTANCE_TYPE
    | `String "CurrentLicenseConfigurationOperatingSystem" ->
        CURRENT_LICENSE_CONFIGURATION_OPERATING_SYSTEM
    | `String "CurrentLicenseConfigurationLicenseName" -> CURRENT_LICENSE_CONFIGURATION_LICENSE_NAME
    | `String "CurrentLicenseConfigurationLicenseEdition" ->
        CURRENT_LICENSE_CONFIGURATION_LICENSE_EDITION
    | `String "CurrentLicenseConfigurationLicenseModel" ->
        CURRENT_LICENSE_CONFIGURATION_LICENSE_MODEL
    | `String "CurrentLicenseConfigurationLicenseVersion" ->
        CURRENT_LICENSE_CONFIGURATION_LICENSE_VERSION
    | `String "CurrentLicenseConfigurationMetricsSource" ->
        CURRENT_LICENSE_CONFIGURATION_METRICS_SOURCE
    | `String "RecommendationOptionsOperatingSystem" -> RECOMMENDATION_OPTIONS_OPERATING_SYSTEM
    | `String "RecommendationOptionsLicenseEdition" -> RECOMMENDATION_OPTIONS_LICENSE_EDITION
    | `String "RecommendationOptionsLicenseModel" -> RECOMMENDATION_OPTIONS_LICENSE_MODEL
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "Tags" -> TAGS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableLicenseField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableLicenseField")
     : exportable_license_field)
    : exportable_license_field)

let exportable_license_fields_of_yojson tree path =
  list_of_yojson exportable_license_field_of_yojson tree path

let export_license_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson
         (value_for_key license_recommendation_filters_of_yojson "filters")
         _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_license_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : export_license_recommendations_request)

let export_lambda_function_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_lambda_function_recommendations_response)

let exportable_lambda_function_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "FunctionArn" -> FUNCTION_ARN
    | `String "FunctionVersion" -> FUNCTION_VERSION
    | `String "Finding" -> FINDING
    | `String "FindingReasonCodes" -> FINDING_REASON_CODES
    | `String "NumberOfInvocations" -> NUMBER_OF_INVOCATIONS
    | `String "UtilizationMetricsDurationMaximum" -> UTILIZATION_METRICS_DURATION_MAXIMUM
    | `String "UtilizationMetricsDurationAverage" -> UTILIZATION_METRICS_DURATION_AVERAGE
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "UtilizationMetricsMemoryAverage" -> UTILIZATION_METRICS_MEMORY_AVERAGE
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "CurrentConfigurationMemorySize" -> CURRENT_CONFIGURATION_MEMORY_SIZE
    | `String "CurrentConfigurationTimeout" -> CURRENT_CONFIGURATION_TIMEOUT
    | `String "CurrentCostTotal" -> CURRENT_COST_TOTAL
    | `String "CurrentCostAverage" -> CURRENT_COST_AVERAGE
    | `String "RecommendationOptionsConfigurationMemorySize" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_MEMORY_SIZE
    | `String "RecommendationOptionsCostLow" -> RECOMMENDATION_OPTIONS_COST_LOW
    | `String "RecommendationOptionsCostHigh" -> RECOMMENDATION_OPTIONS_COST_HIGH
    | `String "RecommendationOptionsProjectedUtilizationMetricsDurationLowerBound" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_LOWER_BOUND
    | `String "RecommendationOptionsProjectedUtilizationMetricsDurationUpperBound" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_UPPER_BOUND
    | `String "RecommendationOptionsProjectedUtilizationMetricsDurationExpected" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_EXPECTED
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "CurrentPerformanceRisk" -> CURRENT_PERFORMANCE_RISK
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "Tags" -> TAGS
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableLambdaFunctionField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableLambdaFunctionField")
     : exportable_lambda_function_field)
    : exportable_lambda_function_field)

let exportable_lambda_function_fields_of_yojson tree path =
  list_of_yojson exportable_lambda_function_field_of_yojson tree path

let export_lambda_function_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson
         (value_for_key lambda_function_recommendation_filters_of_yojson "filters")
         _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_lambda_function_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : export_lambda_function_recommendations_request)

let export_idle_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_idle_recommendations_response)

let exportable_idle_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "ResourceArn" -> RESOURCE_ARN
    | `String "ResourceId" -> RESOURCE_ID
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "SavingsOpportunity" -> SAVINGS_OPPORTUNITY
    | `String "SavingsOpportunityAfterDiscount" -> SAVINGS_OPPORTUNITY_AFTER_DISCOUNT
    | `String "UtilizationMetricsCpuMaximum" -> UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkInBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDatabaseConnectionsMaximum" ->
        UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeReadIOPSMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM
    | `String "UtilizationMetricsEBSVolumeWriteIOPSMaximum" ->
        UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM
    | `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsActiveConnectionCountMaximum" ->
        UTILIZATION_METRICS_ACTIVE_CONNECTION_COUNT_MAXIMUM
    | `String "UtilizationMetricsPacketsInFromSourceMaximum" ->
        UTILIZATION_METRICS_PACKETS_IN_FROM_SOURCE_MAXIMUM
    | `String "UtilizationMetricsPacketsInFromDestinationMaximum" ->
        UTILIZATION_METRICS_PACKETS_IN_FROM_DESTINATION_MAXIMUM
    | `String "UtilizationMetricsConsumedReadCapacityUnitsSum" ->
        UTILIZATION_METRICS_CONSUMED_READ_CAPACITY_UNITS_SUM
    | `String "UtilizationMetricsConsumedWriteCapacityUnitsSum" ->
        UTILIZATION_METRICS_CONSUMED_WRITE_CAPACITY_UNITS_SUM
    | `String "UtilizationMetricsNewConnectionsSum" -> UTILIZATION_METRICS_NEW_CONNECTIONS_SUM
    | `String "UtilizationMetricsEngineCPUUtilizationMaximum" ->
        UTILIZATION_METRICS_ENGINE_CPU_UTILIZATION_MAXIMUM
    | `String "UtilizationMetricsCacheHitsSum" -> UTILIZATION_METRICS_CACHE_HITS_SUM
    | `String "UtilizationMetricsCacheMissesSum" -> UTILIZATION_METRICS_CACHE_MISSES_SUM
    | `String "UtilizationMetricsKeyspaceHitsSum" -> UTILIZATION_METRICS_KEYSPACE_HITS_SUM
    | `String "UtilizationMetricsKeyspaceMissesSum" -> UTILIZATION_METRICS_KEYSPACE_MISSES_SUM
    | `String "UtilizationMetricsIsIdleMinimum" -> UTILIZATION_METRICS_IS_IDLE_MINIMUM
    | `String "UtilizationMetricsUserConnectedSum" -> UTILIZATION_METRICS_USER_CONNECTED_SUM
    | `String "UtilizationMetricsInvocationsSum" -> UTILIZATION_METRICS_INVOCATIONS_SUM
    | `String "UtilizationMetricsGetTypeCmdsSum" -> UTILIZATION_METRICS_GET_TYPE_CMDS_SUM
    | `String "UtilizationMetricsSetTypeCmdsSum" -> UTILIZATION_METRICS_SET_TYPE_CMDS_SUM
    | `String "UtilizationMetricsElastiCacheProcessingUnitsSum" ->
        UTILIZATION_METRICS_ELASTI_CACHE_PROCESSING_UNITS_SUM
    | `String "UtilizationMetricsCurrConnectionsSum" -> UTILIZATION_METRICS_CURR_CONNECTIONS_SUM
    | `String "UtilizationMetricsDatabaseConnectionsSum" ->
        UTILIZATION_METRICS_DATABASE_CONNECTIONS_SUM
    | `String "Finding" -> FINDING
    | `String "FindingDescription" -> FINDING_DESCRIPTION
    | `String "Tags" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportableIdleField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableIdleField")
     : exportable_idle_field)
    : exportable_idle_field)

let exportable_idle_fields_of_yojson tree path =
  list_of_yojson exportable_idle_field_of_yojson tree path

let export_idle_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson (value_for_key idle_recommendation_filters_of_yojson "filters") _list path;
     fields_to_export =
       option_of_yojson (value_for_key exportable_idle_fields_of_yojson "fieldsToExport") _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : export_idle_recommendations_request)

let export_ecs_service_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_ecs_service_recommendations_response)

let exportable_ecs_service_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "ServiceArn" -> SERVICE_ARN
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "LaunchType" -> LAUNCH_TYPE
    | `String "CurrentPerformanceRisk" -> CURRENT_PERFORMANCE_RISK
    | `String "CurrentServiceConfigurationMemory" -> CURRENT_SERVICE_CONFIGURATION_MEMORY
    | `String "CurrentServiceConfigurationCpu" -> CURRENT_SERVICE_CONFIGURATION_CPU
    | `String "CurrentServiceConfigurationTaskDefinitionArn" ->
        CURRENT_SERVICE_CONFIGURATION_TASK_DEFINITION_ARN
    | `String "CurrentServiceConfigurationAutoScalingConfiguration" ->
        CURRENT_SERVICE_CONFIGURATION_AUTO_SCALING_CONFIGURATION
    | `String "CurrentServiceContainerConfigurations" -> CURRENT_SERVICE_CONTAINER_CONFIGURATIONS
    | `String "UtilizationMetricsCpuMaximum" -> UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "Finding" -> FINDING
    | `String "FindingReasonCodes" -> FINDING_REASON_CODES
    | `String "RecommendationOptionsMemory" -> RECOMMENDATION_OPTIONS_MEMORY
    | `String "RecommendationOptionsCpu" -> RECOMMENDATION_OPTIONS_CPU
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "RecommendationOptionsContainerRecommendations" ->
        RECOMMENDATION_OPTIONS_CONTAINER_RECOMMENDATIONS
    | `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "Tags" -> TAGS
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String "EffectiveRecommendationPreferencesLookBackPeriod" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableECSServiceField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableECSServiceField")
     : exportable_ecs_service_field)
    : exportable_ecs_service_field)

let exportable_ecs_service_fields_of_yojson tree path =
  list_of_yojson exportable_ecs_service_field_of_yojson tree path

let export_ecs_service_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters =
       option_of_yojson
         (value_for_key ecs_service_recommendation_filters_of_yojson "filters")
         _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_ecs_service_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : export_ecs_service_recommendations_request)

let export_ec2_instance_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_ec2_instance_recommendations_response)

let exportable_instance_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "InstanceArn" -> INSTANCE_ARN
    | `String "InstanceName" -> INSTANCE_NAME
    | `String "Finding" -> FINDING
    | `String "FindingReasonCodes" -> Finding_Reason_Codes
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "CurrentInstanceType" -> CURRENT_INSTANCE_TYPE
    | `String "UtilizationMetricsCpuMaximum" -> UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "UtilizationMetricsEbsReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsReadBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskReadBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkInBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM
    | `String "CurrentOnDemandPrice" -> CURRENT_ON_DEMAND_PRICE
    | `String "CurrentStandardOneYearNoUpfrontReservedPrice" ->
        CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "CurrentStandardThreeYearNoUpfrontReservedPrice" ->
        CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "CurrentVCpus" -> CURRENT_VCPUS
    | `String "CurrentMemory" -> CURRENT_MEMORY
    | `String "CurrentStorage" -> CURRENT_STORAGE
    | `String "CurrentNetwork" -> CURRENT_NETWORK
    | `String "RecommendationOptionsInstanceType" -> RECOMMENDATION_OPTIONS_INSTANCE_TYPE
    | `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "RecommendationOptionsPlatformDifferences" ->
        RECOMMENDATION_OPTIONS_PLATFORM_DIFFERENCES
    | `String "RecommendationOptionsPerformanceRisk" -> RECOMMENDATION_OPTIONS_PERFORMANCE_RISK
    | `String "RecommendationOptionsVcpus" -> RECOMMENDATION_OPTIONS_VCPUS
    | `String "RecommendationOptionsMemory" -> RECOMMENDATION_OPTIONS_MEMORY
    | `String "RecommendationOptionsStorage" -> RECOMMENDATION_OPTIONS_STORAGE
    | `String "RecommendationOptionsNetwork" -> RECOMMENDATION_OPTIONS_NETWORK
    | `String "RecommendationOptionsOnDemandPrice" -> RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE
    | `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice" ->
        RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice" ->
        RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "RecommendationsSourcesRecommendationSourceArn" ->
        RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_ARN
    | `String "RecommendationsSourcesRecommendationSourceType" ->
        RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_TYPE
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "CurrentPerformanceRisk" -> CURRENT_PERFORMANCE_RISK
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "EffectiveRecommendationPreferencesCpuVendorArchitectures" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES
    | `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS
    | `String "EffectiveRecommendationPreferencesInferredWorkloadTypes" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES
    | `String "InferredWorkloadTypes" -> INFERRED_WORKLOAD_TYPES
    | `String "RecommendationOptionsMigrationEffort" -> RECOMMENDATION_OPTIONS_MIGRATION_EFFORT
    | `String "EffectiveRecommendationPreferencesExternalMetricsSource" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_EXTERNAL_METRICS_SOURCE
    | `String "Tags" -> TAGS
    | `String "InstanceState" -> INSTANCE_STATE
    | `String "ExternalMetricStatusCode" -> EXTERNAL_METRIC_STATUS_CODE
    | `String "ExternalMetricStatusReason" -> EXTERNAL_METRIC_STATUS_REASON
    | `String "CurrentInstanceGpuInfo" -> CURRENT_INSTANCE_GPU_INFO
    | `String "RecommendationOptionsInstanceGpuInfo" -> RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO
    | `String "UtilizationMetricsGpuPercentageMaximum" -> UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM
    | `String "UtilizationMetricsGpuMemoryPercentageMaximum" ->
        UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM
    | `String "Idle" -> IDLE
    | `String "EffectiveRecommendationPreferencesPreferredResources" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES
    | `String "EffectiveRecommendationPreferencesLookBackPeriod" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD
    | `String "EffectiveRecommendationPreferencesUtilizationPreferences" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_UTILIZATION_PREFERENCES
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableInstanceField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableInstanceField")
     : exportable_instance_field)
    : exportable_instance_field)

let exportable_instance_fields_of_yojson tree path =
  list_of_yojson exportable_instance_field_of_yojson tree path

let export_ec2_instance_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_instance_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : export_ec2_instance_recommendations_request)

let export_ebs_volume_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_ebs_volume_recommendations_response)

let exportable_volume_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "VolumeArn" -> VOLUME_ARN
    | `String "Finding" -> FINDING
    | `String "UtilizationMetricsVolumeReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsVolumeWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsVolumeReadBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_READ_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsVolumeWriteBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_VOLUME_WRITE_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsVolumeIOPSExceededMaximum" ->
        UTILIZATION_METRICS_VOLUME_IOPS_EXCEEDED_MAXIMUM
    | `String "UtilizationMetricsVolumeThroughputExceededMaximum" ->
        UTILIZATION_METRICS_VOLUME_THROUGHPUT_EXCEEDED_MAXIMUM
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "CurrentConfigurationVolumeType" -> CURRENT_CONFIGURATION_VOLUME_TYPE
    | `String "CurrentConfigurationVolumeBaselineIOPS" -> CURRENT_CONFIGURATION_VOLUME_BASELINE_IOPS
    | `String "CurrentConfigurationVolumeBaselineThroughput" ->
        CURRENT_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT
    | `String "CurrentConfigurationVolumeBurstIOPS" -> CURRENT_CONFIGURATION_VOLUME_BURST_IOPS
    | `String "CurrentConfigurationVolumeBurstThroughput" ->
        CURRENT_CONFIGURATION_VOLUME_BURST_THROUGHPUT
    | `String "CurrentConfigurationVolumeSize" -> CURRENT_CONFIGURATION_VOLUME_SIZE
    | `String "CurrentMonthlyPrice" -> CURRENT_MONTHLY_PRICE
    | `String "RecommendationOptionsConfigurationVolumeType" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_TYPE
    | `String "RecommendationOptionsConfigurationVolumeBaselineIOPS" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_IOPS
    | `String "RecommendationOptionsConfigurationVolumeBaselineThroughput" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT
    | `String "RecommendationOptionsConfigurationVolumeBurstIOPS" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_IOPS
    | `String "RecommendationOptionsConfigurationVolumeBurstThroughput" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_THROUGHPUT
    | `String "RecommendationOptionsConfigurationVolumeSize" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_SIZE
    | `String "RecommendationOptionsMonthlyPrice" -> RECOMMENDATION_OPTIONS_MONTHLY_PRICE
    | `String "RecommendationOptionsPerformanceRisk" -> RECOMMENDATION_OPTIONS_PERFORMANCE_RISK
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "CurrentPerformanceRisk" -> CURRENT_PERFORMANCE_RISK
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "Tags" -> TAGS
    | `String "RootVolume" -> ROOT_VOLUME
    | `String "CurrentConfigurationRootVolume" -> CURRENT_CONFIGURATION_ROOT_VOLUME
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String "EffectiveRecommendationPreferencesLookBackPeriod" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableVolumeField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableVolumeField")
     : exportable_volume_field)
    : exportable_volume_field)

let exportable_volume_fields_of_yojson tree path =
  list_of_yojson exportable_volume_field_of_yojson tree path

let export_ebs_volume_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters = option_of_yojson (value_for_key ebs_filters_of_yojson "filters") _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_volume_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
   }
    : export_ebs_volume_recommendations_request)

let export_auto_scaling_group_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "s3Destination") _list path;
   }
    : export_auto_scaling_group_recommendations_response)

let exportable_auto_scaling_group_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "AutoScalingGroupArn" -> AUTO_SCALING_GROUP_ARN
    | `String "AutoScalingGroupName" -> AUTO_SCALING_GROUP_NAME
    | `String "Finding" -> FINDING
    | `String "UtilizationMetricsCpuMaximum" -> UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "UtilizationMetricsMemoryMaximum" -> UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "UtilizationMetricsEbsReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsReadBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsEbsWriteBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskReadOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskWriteOpsPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskReadBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsDiskWriteBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkInBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkOutBytesPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkPacketsInPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM
    | `String "UtilizationMetricsNetworkPacketsOutPerSecondMaximum" ->
        UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM
    | `String "LookbackPeriodInDays" -> LOOKBACK_PERIOD_IN_DAYS
    | `String "CurrentConfigurationInstanceType" -> CURRENT_CONFIGURATION_INSTANCE_TYPE
    | `String "CurrentConfigurationDesiredCapacity" -> CURRENT_CONFIGURATION_DESIRED_CAPACITY
    | `String "CurrentConfigurationMinSize" -> CURRENT_CONFIGURATION_MIN_SIZE
    | `String "CurrentConfigurationMaxSize" -> CURRENT_CONFIGURATION_MAX_SIZE
    | `String "CurrentConfigurationAllocationStrategy" -> CURRENT_CONFIGURATION_ALLOCATION_STRATEGY
    | `String "CurrentConfigurationMixedInstanceTypes" -> CURRENT_CONFIGURATION_MIXED_INSTANCE_TYPES
    | `String "CurrentConfigurationType" -> CURRENT_CONFIGURATION_TYPE
    | `String "CurrentOnDemandPrice" -> CURRENT_ON_DEMAND_PRICE
    | `String "CurrentStandardOneYearNoUpfrontReservedPrice" ->
        CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "CurrentStandardThreeYearNoUpfrontReservedPrice" ->
        CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "CurrentVCpus" -> CURRENT_VCPUS
    | `String "CurrentMemory" -> CURRENT_MEMORY
    | `String "CurrentStorage" -> CURRENT_STORAGE
    | `String "CurrentNetwork" -> CURRENT_NETWORK
    | `String "RecommendationOptionsConfigurationInstanceType" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_INSTANCE_TYPE
    | `String "RecommendationOptionsConfigurationDesiredCapacity" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_DESIRED_CAPACITY
    | `String "RecommendationOptionsConfigurationMinSize" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_MIN_SIZE
    | `String "RecommendationOptionsConfigurationMaxSize" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_MAX_SIZE
    | `String "RecommendationOptionsConfigurationEstimatedInstanceHourReductionPercentage" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_ESTIMATED_INSTANCE_HOUR_REDUCTION_PERCENTAGE
    | `String "RecommendationOptionsConfigurationAllocationStrategy" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_ALLOCATION_STRATEGY
    | `String "RecommendationOptionsConfigurationMixedInstanceTypes" ->
        RECOMMENDATION_OPTIONS_CONFIGURATION_MIXED_INSTANCE_TYPES
    | `String "RecommendationOptionsConfigurationType" -> RECOMMENDATION_OPTIONS_CONFIGURATION_TYPE
    | `String "RecommendationOptionsProjectedUtilizationMetricsCpuMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM
    | `String "RecommendationOptionsPerformanceRisk" -> RECOMMENDATION_OPTIONS_PERFORMANCE_RISK
    | `String "RecommendationOptionsOnDemandPrice" -> RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE
    | `String "RecommendationOptionsStandardOneYearNoUpfrontReservedPrice" ->
        RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice" ->
        RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE
    | `String "RecommendationOptionsVcpus" -> RECOMMENDATION_OPTIONS_VCPUS
    | `String "RecommendationOptionsMemory" -> RECOMMENDATION_OPTIONS_MEMORY
    | `String "RecommendationOptionsStorage" -> RECOMMENDATION_OPTIONS_STORAGE
    | `String "RecommendationOptionsNetwork" -> RECOMMENDATION_OPTIONS_NETWORK
    | `String "LastRefreshTimestamp" -> LAST_REFRESH_TIMESTAMP
    | `String "CurrentPerformanceRisk" -> CURRENT_PERFORMANCE_RISK
    | `String "RecommendationOptionsSavingsOpportunityPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrency" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY
    | `String "RecommendationOptionsEstimatedMonthlySavingsValue" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE
    | `String "EffectiveRecommendationPreferencesCpuVendorArchitectures" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES
    | `String "EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS
    | `String "EffectiveRecommendationPreferencesInferredWorkloadTypes" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES
    | `String "EffectiveRecommendationPreferencesPreferredResources" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES
    | `String "EffectiveRecommendationPreferencesLookBackPeriod" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD
    | `String "InferredWorkloadTypes" -> INFERRED_WORKLOAD_TYPES
    | `String "RecommendationOptionsMigrationEffort" -> RECOMMENDATION_OPTIONS_MIGRATION_EFFORT
    | `String "CurrentInstanceGpuInfo" -> CURRENT_INSTANCE_GPU_INFO
    | `String "RecommendationOptionsInstanceGpuInfo" -> RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO
    | `String "UtilizationMetricsGpuPercentageMaximum" -> UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM
    | `String "UtilizationMetricsGpuMemoryPercentageMaximum" ->
        UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MAXIMUM
    | `String "RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum" ->
        RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_MAXIMUM
    | `String "EffectiveRecommendationPreferencesSavingsEstimationMode" ->
        EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE
    | `String "RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage" ->
        RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE
    | `String "RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
    | `String "RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts" ->
        RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportableAutoScalingGroupField" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportableAutoScalingGroupField")
     : exportable_auto_scaling_group_field)
    : exportable_auto_scaling_group_field)

let exportable_auto_scaling_group_fields_of_yojson tree path =
  list_of_yojson exportable_auto_scaling_group_field_of_yojson tree path

let export_auto_scaling_group_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "accountIds") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     fields_to_export =
       option_of_yojson
         (value_for_key exportable_auto_scaling_group_fields_of_yojson "fieldsToExport")
         _list path;
     s3_destination_config =
       value_for_key s3_destination_config_of_yojson "s3DestinationConfig" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key include_member_accounts_of_yojson "includeMemberAccounts")
         _list path;
     recommendation_preferences =
       option_of_yojson
         (value_for_key recommendation_preferences_of_yojson "recommendationPreferences")
         _list path;
   }
    : export_auto_scaling_group_recommendations_request)

let failure_reason_of_yojson = string_of_yojson
let creation_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Queued" -> QUEUED
    | `String "InProgress" -> IN_PROGRESS
    | `String "Complete" -> COMPLETE
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let export_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3 = option_of_yojson (value_for_key s3_destination_of_yojson "s3") _list path }
    : export_destination)

let recommendation_export_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
     destination =
       option_of_yojson (value_for_key export_destination_of_yojson "destination") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     status = option_of_yojson (value_for_key job_status_of_yojson "status") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "creationTimestamp") _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key last_updated_timestamp_of_yojson "lastUpdatedTimestamp")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : recommendation_export_job)

let recommendation_export_jobs_of_yojson tree path =
  list_of_yojson recommendation_export_job_of_yojson tree path

let describe_recommendation_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_export_jobs =
       option_of_yojson
         (value_for_key recommendation_export_jobs_of_yojson "recommendationExportJobs")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_recommendation_export_jobs_response)

let job_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "JobStatus" -> JOB_STATUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "JobFilterName")
     : job_filter_name)
    : job_filter_name)

let job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key job_filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "values") _list path;
   }
    : job_filter)

let job_filters_of_yojson tree path = list_of_yojson job_filter_of_yojson tree path
let job_ids_of_yojson tree path = list_of_yojson job_id_of_yojson tree path

let describe_recommendation_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_ids = option_of_yojson (value_for_key job_ids_of_yojson "jobIds") _list path;
     filters = option_of_yojson (value_for_key job_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_recommendation_export_jobs_request)

let delete_recommendation_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let recommendation_preference_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "EnhancedInfrastructureMetrics" -> ENHANCED_INFRASTRUCTURE_METRICS
    | `String "InferredWorkloadTypes" -> INFERRED_WORKLOAD_TYPES
    | `String "ExternalMetricsPreference" -> EXTERNAL_METRICS_PREFERENCE
    | `String "LookBackPeriodPreference" -> LOOKBACK_PERIOD_PREFERENCE
    | `String "PreferredResources" -> PREFERRED_RESOURCES
    | `String "UtilizationPreferences" -> UTILIZATION_PREFERENCES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecommendationPreferenceName" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendationPreferenceName")
     : recommendation_preference_name)
    : recommendation_preference_name)

let recommendation_preference_names_of_yojson tree path =
  list_of_yojson recommendation_preference_name_of_yojson tree path

let delete_recommendation_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     recommendation_preference_names =
       value_for_key recommendation_preference_names_of_yojson "recommendationPreferenceNames" _list
         path;
   }
    : delete_recommendation_preferences_request)
