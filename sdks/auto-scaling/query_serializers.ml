open Types

let zonal_shift_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let xml_string_user_data_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_metric_stat_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_metric_label_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len64_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len511_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len5000_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len32_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len255_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len2047_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len19_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len1600_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_max_len1023_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let xml_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let warm_pool_status_to_query path (x : warm_pool_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PendingDelete -> "PendingDelete")

let warm_pool_state_to_query path (x : warm_pool_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Hibernated -> "Hibernated" | Running -> "Running" | Stopped -> "Stopped")

let warm_pool_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let warm_pool_min_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_group_prepared_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let reuse_on_scale_in_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let instance_reuse_policy_to_query path (x : instance_reuse_policy) =
  List.concat
    [
      (match x.reuse_on_scale_in with
      | None -> []
      | Some v -> reuse_on_scale_in_to_query (List.append path [ "ReuseOnScaleIn" ]) v);
    ]

let warm_pool_configuration_to_query path (x : warm_pool_configuration) =
  List.concat
    [
      (match x.instance_reuse_policy with
      | None -> []
      | Some v -> instance_reuse_policy_to_query (List.append path [ "InstanceReusePolicy" ]) v);
      (match x.status with
      | None -> []
      | Some v -> warm_pool_status_to_query (List.append path [ "Status" ]) v);
      (match x.pool_state with
      | None -> []
      | Some v -> warm_pool_state_to_query (List.append path [ "PoolState" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> warm_pool_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_group_prepared_capacity with
      | None -> []
      | Some v ->
          max_group_prepared_capacity_to_query (List.append path [ "MaxGroupPreparedCapacity" ]) v);
    ]

let values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let nullable_positive_integer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let v_cpu_count_request_to_query path (x : v_cpu_count_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      nullable_positive_integer_to_query (List.append path [ "Min" ]) x.min;
    ]

let update_placement_group_param_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_template_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_template_specification_to_query path (x : launch_template_specification) =
  List.concat
    [
      (match x.version with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Version" ]) v);
      (match x.launch_template_name with
      | None -> []
      | Some v -> launch_template_name_to_query (List.append path [ "LaunchTemplateName" ]) v);
      (match x.launch_template_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchTemplateId" ]) v);
    ]

let memory_mi_b_request_to_query path (x : memory_mi_b_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      nullable_positive_integer_to_query (List.append path [ "Min" ]) x.min;
    ]

let cpu_manufacturer_to_query path (x : cpu_manufacturer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | APPLE -> "apple"
    | AMAZON_WEB_SERVICES -> "amazon-web-services"
    | AMD -> "amd"
    | INTEL -> "intel")

let cpu_manufacturers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cpu_manufacturer_to_query path xs

let nullable_positive_double_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let memory_gi_b_per_v_cpu_request_to_query path (x : memory_gi_b_per_v_cpu_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
    ]

let excluded_instance_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let excluded_instance_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" excluded_instance_to_query path xs

let instance_generation_to_query path (x : instance_generation) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PREVIOUS -> "previous" | CURRENT -> "current")

let instance_generations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_generation_to_query path xs

let bare_metal_to_query path (x : bare_metal) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REQUIRED -> "required" | EXCLUDED -> "excluded" | INCLUDED -> "included")

let burstable_performance_to_query path (x : burstable_performance) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REQUIRED -> "required" | EXCLUDED -> "excluded" | INCLUDED -> "included")

let nullable_boolean_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let network_interface_count_request_to_query path (x : network_interface_count_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
    ]

let local_storage_to_query path (x : local_storage) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REQUIRED -> "required" | EXCLUDED -> "excluded" | INCLUDED -> "included")

let local_storage_type_to_query path (x : local_storage_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SSD -> "ssd" | HDD -> "hdd")

let local_storage_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" local_storage_type_to_query path xs

let total_local_storage_gb_request_to_query path (x : total_local_storage_gb_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
    ]

let baseline_ebs_bandwidth_mbps_request_to_query path (x : baseline_ebs_bandwidth_mbps_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
    ]

let accelerator_type_to_query path (x : accelerator_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INFERENCE -> "inference" | FPGA -> "fpga" | GPU -> "gpu")

let accelerator_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_type_to_query path xs

let accelerator_count_request_to_query path (x : accelerator_count_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
    ]

let accelerator_manufacturer_to_query path (x : accelerator_manufacturer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | XILINX -> "xilinx"
    | AMAZON_WEB_SERVICES -> "amazon-web-services"
    | AMD -> "amd"
    | NVIDIA -> "nvidia")

let accelerator_manufacturers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_manufacturer_to_query
    path xs

let accelerator_name_to_query path (x : accelerator_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | VU9P -> "vu9p"
    | RADEON_PRO_V520 -> "radeon-pro-v520"
    | M60 -> "m60"
    | T4 -> "t4"
    | K80 -> "k80"
    | V100 -> "v100"
    | A100 -> "a100")

let accelerator_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" accelerator_name_to_query path xs

let accelerator_total_memory_mi_b_request_to_query path (x : accelerator_total_memory_mi_b_request)
    =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_integer_to_query (List.append path [ "Min" ]) v);
    ]

let network_bandwidth_gbps_request_to_query path (x : network_bandwidth_gbps_request) =
  List.concat
    [
      (match x.max with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Max" ]) v);
      (match x.min with
      | None -> []
      | Some v -> nullable_positive_double_to_query (List.append path [ "Min" ]) v);
    ]

let allowed_instance_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let allowed_instance_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" allowed_instance_type_to_query path
    xs

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let performance_factor_reference_request_to_query path (x : performance_factor_reference_request) =
  List.concat
    [
      (match x.instance_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "InstanceFamily" ]) v);
    ]

let performance_factor_reference_set_request_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item"
    performance_factor_reference_request_to_query path xs

let cpu_performance_factor_request_to_query path (x : cpu_performance_factor_request) =
  List.concat
    [
      (match x.references with
      | None -> []
      | Some v ->
          performance_factor_reference_set_request_to_query (List.append path [ "Reference" ]) v);
    ]

let baseline_performance_factors_request_to_query path (x : baseline_performance_factors_request) =
  List.concat
    [
      (match x.cpu with
      | None -> []
      | Some v -> cpu_performance_factor_request_to_query (List.append path [ "Cpu" ]) v);
    ]

let instance_requirements_to_query path (x : instance_requirements) =
  List.concat
    [
      (match x.baseline_performance_factors with
      | None -> []
      | Some v ->
          baseline_performance_factors_request_to_query
            (List.append path [ "BaselinePerformanceFactors" ])
            v);
      (match x.allowed_instance_types with
      | None -> []
      | Some v -> allowed_instance_types_to_query (List.append path [ "AllowedInstanceTypes" ]) v);
      (match x.network_bandwidth_gbps with
      | None -> []
      | Some v ->
          network_bandwidth_gbps_request_to_query (List.append path [ "NetworkBandwidthGbps" ]) v);
      (match x.accelerator_total_memory_mi_b with
      | None -> []
      | Some v ->
          accelerator_total_memory_mi_b_request_to_query
            (List.append path [ "AcceleratorTotalMemoryMiB" ])
            v);
      (match x.accelerator_names with
      | None -> []
      | Some v -> accelerator_names_to_query (List.append path [ "AcceleratorNames" ]) v);
      (match x.accelerator_manufacturers with
      | None -> []
      | Some v ->
          accelerator_manufacturers_to_query (List.append path [ "AcceleratorManufacturers" ]) v);
      (match x.accelerator_count with
      | None -> []
      | Some v -> accelerator_count_request_to_query (List.append path [ "AcceleratorCount" ]) v);
      (match x.accelerator_types with
      | None -> []
      | Some v -> accelerator_types_to_query (List.append path [ "AcceleratorTypes" ]) v);
      (match x.baseline_ebs_bandwidth_mbps with
      | None -> []
      | Some v ->
          baseline_ebs_bandwidth_mbps_request_to_query
            (List.append path [ "BaselineEbsBandwidthMbps" ])
            v);
      (match x.total_local_storage_g_b with
      | None -> []
      | Some v ->
          total_local_storage_gb_request_to_query (List.append path [ "TotalLocalStorageGB" ]) v);
      (match x.local_storage_types with
      | None -> []
      | Some v -> local_storage_types_to_query (List.append path [ "LocalStorageTypes" ]) v);
      (match x.local_storage with
      | None -> []
      | Some v -> local_storage_to_query (List.append path [ "LocalStorage" ]) v);
      (match x.network_interface_count with
      | None -> []
      | Some v ->
          network_interface_count_request_to_query (List.append path [ "NetworkInterfaceCount" ]) v);
      (match x.require_hibernate_support with
      | None -> []
      | Some v -> nullable_boolean_to_query (List.append path [ "RequireHibernateSupport" ]) v);
      (match x.burstable_performance with
      | None -> []
      | Some v -> burstable_performance_to_query (List.append path [ "BurstablePerformance" ]) v);
      (match x.bare_metal with
      | None -> []
      | Some v -> bare_metal_to_query (List.append path [ "BareMetal" ]) v);
      (match x.on_demand_max_price_percentage_over_lowest_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "OnDemandMaxPricePercentageOverLowestPrice" ])
            v);
      (match x.max_spot_price_as_percentage_of_optimal_on_demand_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice" ])
            v);
      (match x.spot_max_price_percentage_over_lowest_price with
      | None -> []
      | Some v ->
          nullable_positive_integer_to_query
            (List.append path [ "SpotMaxPricePercentageOverLowestPrice" ])
            v);
      (match x.instance_generations with
      | None -> []
      | Some v -> instance_generations_to_query (List.append path [ "InstanceGenerations" ]) v);
      (match x.excluded_instance_types with
      | None -> []
      | Some v -> excluded_instance_types_to_query (List.append path [ "ExcludedInstanceTypes" ]) v);
      (match x.memory_gi_b_per_v_cpu with
      | None -> []
      | Some v -> memory_gi_b_per_v_cpu_request_to_query (List.append path [ "MemoryGiBPerVCpu" ]) v);
      (match x.cpu_manufacturers with
      | None -> []
      | Some v -> cpu_manufacturers_to_query (List.append path [ "CpuManufacturers" ]) v);
      memory_mi_b_request_to_query (List.append path [ "MemoryMiB" ]) x.memory_mi_b;
      v_cpu_count_request_to_query (List.append path [ "VCpuCount" ]) x.v_cpu_count;
    ]

let image_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let launch_template_overrides_to_query path (x : launch_template_overrides) =
  List.concat
    [
      (match x.image_id with
      | None -> []
      | Some v -> image_id_to_query (List.append path [ "ImageId" ]) v);
      (match x.instance_requirements with
      | None -> []
      | Some v -> instance_requirements_to_query (List.append path [ "InstanceRequirements" ]) v);
      (match x.launch_template_specification with
      | None -> []
      | Some v ->
          launch_template_specification_to_query
            (List.append path [ "LaunchTemplateSpecification" ])
            v);
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
    ]

let overrides_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_template_overrides_to_query
    path xs

let launch_template_to_query path (x : launch_template) =
  List.concat
    [
      (match x.overrides with
      | None -> []
      | Some v -> overrides_to_query (List.append path [ "Overrides" ]) v);
      (match x.launch_template_specification with
      | None -> []
      | Some v ->
          launch_template_specification_to_query
            (List.append path [ "LaunchTemplateSpecification" ])
            v);
    ]

let on_demand_base_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let on_demand_percentage_above_base_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let spot_instance_pools_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let mixed_instance_spot_price_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let instances_distribution_to_query path (x : instances_distribution) =
  List.concat
    [
      (match x.spot_max_price with
      | None -> []
      | Some v -> mixed_instance_spot_price_to_query (List.append path [ "SpotMaxPrice" ]) v);
      (match x.spot_instance_pools with
      | None -> []
      | Some v -> spot_instance_pools_to_query (List.append path [ "SpotInstancePools" ]) v);
      (match x.spot_allocation_strategy with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "SpotAllocationStrategy" ]) v);
      (match x.on_demand_percentage_above_base_capacity with
      | None -> []
      | Some v ->
          on_demand_percentage_above_base_capacity_to_query
            (List.append path [ "OnDemandPercentageAboveBaseCapacity" ])
            v);
      (match x.on_demand_base_capacity with
      | None -> []
      | Some v -> on_demand_base_capacity_to_query (List.append path [ "OnDemandBaseCapacity" ]) v);
      (match x.on_demand_allocation_strategy with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "OnDemandAllocationStrategy" ]) v);
    ]

let mixed_instances_policy_to_query path (x : mixed_instances_policy) =
  List.concat
    [
      (match x.instances_distribution with
      | None -> []
      | Some v -> instances_distribution_to_query (List.append path [ "InstancesDistribution" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_to_query (List.append path [ "LaunchTemplate" ]) v);
    ]

let auto_scaling_group_min_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_max_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_desired_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let cooldown_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let availability_zone_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let health_check_grace_period_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let termination_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len1600_to_query path
    xs

let instance_protected_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let resource_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let max_instance_lifetime_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let capacity_rebalance_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let context_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let default_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let int_percent_resettable_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let int_percent100_to200_resettable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_maintenance_policy_to_query path (x : instance_maintenance_policy) =
  List.concat
    [
      (match x.max_healthy_percentage with
      | None -> []
      | Some v ->
          int_percent100_to200_resettable_to_query (List.append path [ "MaxHealthyPercentage" ]) v);
      (match x.min_healthy_percentage with
      | None -> []
      | Some v -> int_percent_resettable_to_query (List.append path [ "MinHealthyPercentage" ]) v);
    ]

let capacity_distribution_strategy_to_query path (x : capacity_distribution_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RESERVATIONS_THEN_BALANCED -> "reservations-then-balanced"
    | BALANCED_BEST_EFFORT -> "balanced-best-effort"
    | BALANCED_ONLY -> "balanced-only")

let availability_zone_distribution_to_query path (x : availability_zone_distribution) =
  List.concat
    [
      (match x.capacity_distribution_strategy with
      | None -> []
      | Some v ->
          capacity_distribution_strategy_to_query
            (List.append path [ "CapacityDistributionStrategy" ])
            v);
    ]

let impaired_zone_health_check_behavior_to_query path (x : impaired_zone_health_check_behavior) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IgnoreUnhealthy -> "IgnoreUnhealthy" | ReplaceUnhealthy -> "ReplaceUnhealthy")

let availability_zone_impairment_policy_to_query path (x : availability_zone_impairment_policy) =
  List.concat
    [
      (match x.impaired_zone_health_check_behavior with
      | None -> []
      | Some v ->
          impaired_zone_health_check_behavior_to_query
            (List.append path [ "ImpairedZoneHealthCheckBehavior" ])
            v);
      (match x.zonal_shift_enabled with
      | None -> []
      | Some v -> zonal_shift_enabled_to_query (List.append path [ "ZonalShiftEnabled" ]) v);
    ]

let skip_zonal_shift_validation_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let capacity_reservation_preference_to_query path (x : capacity_reservation_preference) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Default -> "default"
    | None_ -> "none"
    | CapacityReservationsFirst -> "capacity-reservations-first"
    | CapacityReservationsOnly -> "capacity-reservations-only")

let ascii_string_max_len255_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let capacity_reservation_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ascii_string_max_len255_to_query
    path xs

let capacity_reservation_resource_group_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_to_query path xs

let capacity_reservation_target_to_query path (x : capacity_reservation_target) =
  List.concat
    [
      (match x.capacity_reservation_resource_group_arns with
      | None -> []
      | Some v ->
          capacity_reservation_resource_group_arns_to_query
            (List.append path [ "CapacityReservationResourceGroupArns" ])
            v);
      (match x.capacity_reservation_ids with
      | None -> []
      | Some v ->
          capacity_reservation_ids_to_query (List.append path [ "CapacityReservationIds" ]) v);
    ]

let capacity_reservation_specification_to_query path (x : capacity_reservation_specification) =
  List.concat
    [
      (match x.capacity_reservation_target with
      | None -> []
      | Some v ->
          capacity_reservation_target_to_query (List.append path [ "CapacityReservationTarget" ]) v);
      (match x.capacity_reservation_preference with
      | None -> []
      | Some v ->
          capacity_reservation_preference_to_query
            (List.append path [ "CapacityReservationPreference" ])
            v);
    ]

let retention_action_to_query path (x : retention_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Terminate -> "terminate" | Retain -> "retain")

let retention_triggers_to_query path (x : retention_triggers) =
  List.concat
    [
      (match x.terminate_hook_abandon with
      | None -> []
      | Some v -> retention_action_to_query (List.append path [ "TerminateHookAbandon" ]) v);
    ]

let instance_lifecycle_policy_to_query path (x : instance_lifecycle_policy) =
  List.concat
    [
      (match x.retention_triggers with
      | None -> []
      | Some v -> retention_triggers_to_query (List.append path [ "RetentionTriggers" ]) v);
    ]

let deletion_protection_to_query path (x : deletion_protection) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PreventAllDeletion -> "prevent-all-deletion"
    | PreventForceDeletion -> "prevent-force-deletion"
    | None_ -> "none")

let update_auto_scaling_group_type_to_query path (x : update_auto_scaling_group_type) =
  List.concat
    [
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> update_placement_group_param_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      (match x.health_check_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.default_cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "DefaultCooldown" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let service_linked_role_failure_to_query path (x : service_linked_role_failure) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let scaling_activity_in_progress_fault_to_query path (x : scaling_activity_in_progress_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let resource_contention_fault_to_query path (x : resource_contention_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let traffic_source_identifier_to_query path (x : traffic_source_identifier) =
  List.concat
    [
      (match x.type_ with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Type" ]) v);
      xml_string_max_len511_to_query (List.append path [ "Identifier" ]) x.identifier;
    ]

let traffic_sources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" traffic_source_identifier_to_query
    path xs

let traffic_source_state_to_query path (x : traffic_source_state) =
  List.concat
    [
      (match x.type_ with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Type" ]) v);
      (match x.identifier with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "Identifier" ]) v);
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
      (match x.traffic_source with
      | None -> []
      | Some v -> xml_string_max_len511_to_query (List.append path [ "TrafficSource" ]) v);
    ]

let traffic_source_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" traffic_source_state_to_query path
    xs

let timestamp_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let should_decrement_desired_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let terminate_instance_in_auto_scaling_group_type_to_query path
    (x : terminate_instance_in_auto_scaling_group_type) =
  List.concat
    [
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
    ]

let scaling_activity_status_code_to_query path (x : scaling_activity_status_code) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | InPlaceUpdateInProgress -> "InPlaceUpdateInProgress"
    | WaitingForInPlaceUpdateToFinalize -> "WaitingForInPlaceUpdateToFinalize"
    | WaitingForInPlaceUpdateToStart -> "WaitingForInPlaceUpdateToStart"
    | WaitingForConnectionDraining -> "WaitingForConnectionDraining"
    | Cancelled -> "Cancelled"
    | Failed -> "Failed"
    | Successful -> "Successful"
    | WaitingForInstanceWarmup -> "WaitingForInstanceWarmup"
    | MidLifecycleAction -> "MidLifecycleAction"
    | WaitingForELBConnectionDraining -> "WaitingForELBConnectionDraining"
    | InProgress -> "InProgress"
    | PreInService -> "PreInService"
    | WaitingForInstanceId -> "WaitingForInstanceId"
    | WaitingForSpotInstanceId -> "WaitingForSpotInstanceId"
    | WaitingForSpotInstanceRequestId -> "WaitingForSpotInstanceRequestId"
    | PendingSpotBidPlacement -> "PendingSpotBidPlacement")

let progress_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_state_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let activity_to_query path (x : activity) =
  List.concat
    [
      (match x.auto_scaling_group_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AutoScalingGroupARN" ]) v);
      (match x.auto_scaling_group_state with
      | None -> []
      | Some v -> auto_scaling_group_state_to_query (List.append path [ "AutoScalingGroupState" ]) v);
      (match x.details with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Details" ]) v);
      (match x.progress with
      | None -> []
      | Some v -> progress_to_query (List.append path [ "Progress" ]) v);
      (match x.status_message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "StatusMessage" ]) v);
      scaling_activity_status_code_to_query (List.append path [ "StatusCode" ]) x.status_code;
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      timestamp_type_to_query (List.append path [ "StartTime" ]) x.start_time;
      xml_string_max_len1023_to_query (List.append path [ "Cause" ]) x.cause;
      (match x.description with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Description" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      xml_string_to_query (List.append path [ "ActivityId" ]) x.activity_id;
    ]

let activity_type_to_query path (x : activity_type) =
  List.concat
    [
      (match x.activity with
      | None -> []
      | Some v -> activity_to_query (List.append path [ "Activity" ]) v);
    ]

let metric_namespace_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let metric_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_dimension_to_query path (x : metric_dimension) =
  List.concat
    [
      metric_dimension_value_to_query (List.append path [ "Value" ]) x.value;
      metric_dimension_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let metric_dimensions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_dimension_to_query path xs

let metric_to_query path (x : metric) =
  List.concat
    [
      (match x.dimensions with
      | None -> []
      | Some v -> metric_dimensions_to_query (List.append path [ "Dimensions" ]) v);
      metric_name_to_query (List.append path [ "MetricName" ]) x.metric_name;
      metric_namespace_to_query (List.append path [ "Namespace" ]) x.namespace;
    ]

let metric_unit_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let metric_granularity_in_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let target_tracking_metric_stat_to_query path (x : target_tracking_metric_stat) =
  List.concat
    [
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
      xml_string_metric_stat_to_query (List.append path [ "Stat" ]) x.stat;
      metric_to_query (List.append path [ "Metric" ]) x.metric;
    ]

let return_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let target_tracking_metric_data_query_to_query path (x : target_tracking_metric_data_query) =
  List.concat
    [
      (match x.return_data with
      | None -> []
      | Some v -> return_data_to_query (List.append path [ "ReturnData" ]) v);
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
      (match x.label with
      | None -> []
      | Some v -> xml_string_metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.metric_stat with
      | None -> []
      | Some v -> target_tracking_metric_stat_to_query (List.append path [ "MetricStat" ]) v);
      (match x.expression with
      | None -> []
      | Some v -> xml_string_max_len2047_to_query (List.append path [ "Expression" ]) v);
      xml_string_max_len64_to_query (List.append path [ "Id" ]) x.id;
    ]

let target_tracking_metric_data_queries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    target_tracking_metric_data_query_to_query path xs

let metric_type_to_query path (x : metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ALBRequestCountPerTarget -> "ALBRequestCountPerTarget"
    | ASGAverageNetworkOut -> "ASGAverageNetworkOut"
    | ASGAverageNetworkIn -> "ASGAverageNetworkIn"
    | ASGAverageCPUUtilization -> "ASGAverageCPUUtilization")

let predefined_metric_specification_to_query path (x : predefined_metric_specification) =
  List.concat
    [
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
      metric_type_to_query (List.append path [ "PredefinedMetricType" ]) x.predefined_metric_type;
    ]

let metric_statistic_to_query path (x : metric_statistic) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Sum -> "Sum"
    | SampleCount -> "SampleCount"
    | Maximum -> "Maximum"
    | Minimum -> "Minimum"
    | Average -> "Average")

let customized_metric_specification_to_query path (x : customized_metric_specification) =
  List.concat
    [
      (match x.metrics with
      | None -> []
      | Some v -> target_tracking_metric_data_queries_to_query (List.append path [ "Metrics" ]) v);
      (match x.period with
      | None -> []
      | Some v -> metric_granularity_in_seconds_to_query (List.append path [ "Period" ]) v);
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
      (match x.statistic with
      | None -> []
      | Some v -> metric_statistic_to_query (List.append path [ "Statistic" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> metric_dimensions_to_query (List.append path [ "Dimensions" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> metric_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.metric_name with
      | None -> []
      | Some v -> metric_name_to_query (List.append path [ "MetricName" ]) v);
    ]

let metric_scale_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v
let disable_scale_in_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let target_tracking_configuration_to_query path (x : target_tracking_configuration) =
  List.concat
    [
      (match x.disable_scale_in with
      | None -> []
      | Some v -> disable_scale_in_to_query (List.append path [ "DisableScaleIn" ]) v);
      metric_scale_to_query (List.append path [ "TargetValue" ]) x.target_value;
      (match x.customized_metric_specification with
      | None -> []
      | Some v ->
          customized_metric_specification_to_query
            (List.append path [ "CustomizedMetricSpecification" ])
            v);
      (match x.predefined_metric_specification with
      | None -> []
      | Some v ->
          predefined_metric_specification_to_query
            (List.append path [ "PredefinedMetricSpecification" ])
            v);
    ]

let target_group_ar_ns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len511_to_query path
    xs

let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let propagate_at_launch_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let tag_description_to_query path (x : tag_description) =
  List.concat
    [
      (match x.propagate_at_launch with
      | None -> []
      | Some v -> propagate_at_launch_to_query (List.append path [ "PropagateAtLaunch" ]) v);
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
      (match x.key with None -> [] | Some v -> tag_key_to_query (List.append path [ "Key" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceType" ]) v);
      (match x.resource_id with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceId" ]) v);
    ]

let tag_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_description_to_query path xs

let tags_type_to_query path (x : tags_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_description_list_to_query (List.append path [ "Tags" ]) v);
    ]

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.propagate_at_launch with
      | None -> []
      | Some v -> propagate_at_launch_to_query (List.append path [ "PropagateAtLaunch" ]) v);
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
      tag_key_to_query (List.append path [ "Key" ]) x.key;
      (match x.resource_type with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceType" ]) v);
      (match x.resource_id with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ResourceId" ]) v);
    ]

let tags_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let suspended_process_to_query path (x : suspended_process) =
  List.concat
    [
      (match x.suspension_reason with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SuspensionReason" ]) v);
      (match x.process_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ProcessName" ]) v);
    ]

let suspended_processes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" suspended_process_to_query path xs

let resource_in_use_fault_to_query path (x : resource_in_use_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let process_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let scaling_process_query_to_query path (x : scaling_process_query) =
  List.concat
    [
      (match x.scaling_processes with
      | None -> []
      | Some v -> process_names_to_query (List.append path [ "ScalingProcesses" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let subnet_ids_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let policy_increment_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let step_adjustment_to_query path (x : step_adjustment) =
  List.concat
    [
      policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) x.scaling_adjustment;
      (match x.metric_interval_upper_bound with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricIntervalUpperBound" ]) v);
      (match x.metric_interval_lower_bound with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricIntervalLowerBound" ]) v);
    ]

let step_adjustments_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" step_adjustment_to_query path xs

let refresh_strategy_to_query path (x : refresh_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ReplaceRootVolume -> "ReplaceRootVolume" | Rolling -> "Rolling")

let desired_configuration_to_query path (x : desired_configuration) =
  List.concat
    [
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
    ]

let int_percent_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let refresh_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let non_zero_int_percent_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let checkpoint_percentages_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" non_zero_int_percent_to_query path
    xs

let checkpoint_delay_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let skip_matching_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let auto_rollback_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let scale_in_protected_instances_to_query path (x : scale_in_protected_instances) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Wait -> "Wait" | Ignore -> "Ignore" | Refresh -> "Refresh")

let standby_instances_to_query path (x : standby_instances) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Wait -> "Wait" | Ignore -> "Ignore" | Terminate -> "Terminate")

let alarm_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let alarm_specification_to_query path (x : alarm_specification) =
  List.concat
    [
      (match x.alarms with
      | None -> []
      | Some v -> alarm_list_to_query (List.append path [ "Alarms" ]) v);
    ]

let int_percent100_to200_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let bake_time_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let refresh_preferences_to_query path (x : refresh_preferences) =
  List.concat
    [
      (match x.bake_time with
      | None -> []
      | Some v -> bake_time_to_query (List.append path [ "BakeTime" ]) v);
      (match x.max_healthy_percentage with
      | None -> []
      | Some v -> int_percent100_to200_to_query (List.append path [ "MaxHealthyPercentage" ]) v);
      (match x.alarm_specification with
      | None -> []
      | Some v -> alarm_specification_to_query (List.append path [ "AlarmSpecification" ]) v);
      (match x.standby_instances with
      | None -> []
      | Some v -> standby_instances_to_query (List.append path [ "StandbyInstances" ]) v);
      (match x.scale_in_protected_instances with
      | None -> []
      | Some v ->
          scale_in_protected_instances_to_query (List.append path [ "ScaleInProtectedInstances" ]) v);
      (match x.auto_rollback with
      | None -> []
      | Some v -> auto_rollback_to_query (List.append path [ "AutoRollback" ]) v);
      (match x.skip_matching with
      | None -> []
      | Some v -> skip_matching_to_query (List.append path [ "SkipMatching" ]) v);
      (match x.checkpoint_delay with
      | None -> []
      | Some v -> checkpoint_delay_to_query (List.append path [ "CheckpointDelay" ]) v);
      (match x.checkpoint_percentages with
      | None -> []
      | Some v -> checkpoint_percentages_to_query (List.append path [ "CheckpointPercentages" ]) v);
      (match x.instance_warmup with
      | None -> []
      | Some v -> refresh_instance_warmup_to_query (List.append path [ "InstanceWarmup" ]) v);
      (match x.min_healthy_percentage with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "MinHealthyPercentage" ]) v);
    ]

let start_instance_refresh_type_to_query path (x : start_instance_refresh_type) =
  List.concat
    [
      (match x.preferences with
      | None -> []
      | Some v -> refresh_preferences_to_query (List.append path [ "Preferences" ]) v);
      (match x.desired_configuration with
      | None -> []
      | Some v -> desired_configuration_to_query (List.append path [ "DesiredConfiguration" ]) v);
      (match x.strategy with
      | None -> []
      | Some v -> refresh_strategy_to_query (List.append path [ "Strategy" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let start_instance_refresh_answer_to_query path (x : start_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let limit_exceeded_fault_to_query path (x : limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let instance_refresh_in_progress_fault_to_query path (x : instance_refresh_in_progress_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let spot_price_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let should_respect_grace_period_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let instance_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len19_to_query path
    xs

let protected_from_scale_in_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let set_instance_protection_query_to_query path (x : set_instance_protection_query) =
  List.concat
    [
      protected_from_scale_in_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      instance_ids_to_query (List.append path [ "InstanceIds" ]) x.instance_ids;
    ]

let set_instance_protection_answer_to_query path _x = []

let set_instance_health_query_to_query path (x : set_instance_health_query) =
  List.concat
    [
      (match x.should_respect_grace_period with
      | None -> []
      | Some v ->
          should_respect_grace_period_to_query (List.append path [ "ShouldRespectGracePeriod" ]) v);
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
    ]

let honor_cooldown_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let set_desired_capacity_type_to_query path (x : set_desired_capacity_type) =
  List.concat
    [
      (match x.honor_cooldown with
      | None -> []
      | Some v -> honor_cooldown_to_query (List.append path [ "HonorCooldown" ]) v);
      auto_scaling_group_desired_capacity_to_query
        (List.append path [ "DesiredCapacity" ])
        x.desired_capacity;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let scheduled_update_group_action_to_query path (x : scheduled_update_group_action) =
  List.concat
    [
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "Time" ]) v);
      (match x.scheduled_action_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ScheduledActionARN" ]) v);
      (match x.scheduled_action_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ScheduledActionName" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let scheduled_update_group_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    scheduled_update_group_action_to_query path xs

let scheduled_update_group_action_request_to_query path (x : scheduled_update_group_action_request)
    =
  List.concat
    [
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
    ]

let scheduled_update_group_action_requests_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    scheduled_update_group_action_request_to_query path xs

let scheduled_actions_type_to_query path (x : scheduled_actions_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.scheduled_update_group_actions with
      | None -> []
      | Some v ->
          scheduled_update_group_actions_to_query
            (List.append path [ "ScheduledUpdateGroupActions" ])
            v);
    ]

let scheduled_action_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let scaling_policy_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let min_adjustment_step_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let min_adjustment_magnitude_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let estimated_instance_warmup_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let alarm_to_query path (x : alarm) =
  List.concat
    [
      (match x.alarm_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AlarmARN" ]) v);
      (match x.alarm_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AlarmName" ]) v);
    ]

let alarms_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alarm_to_query path xs

let predefined_metric_pair_type_to_query path (x : predefined_metric_pair_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ALBRequestCount -> "ALBRequestCount"
    | ASGNetworkOut -> "ASGNetworkOut"
    | ASGNetworkIn -> "ASGNetworkIn"
    | ASGCPUUtilization -> "ASGCPUUtilization")

let predictive_scaling_predefined_metric_pair_to_query path
    (x : predictive_scaling_predefined_metric_pair) =
  List.concat
    [
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
      predefined_metric_pair_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
    ]

let predefined_scaling_metric_type_to_query path (x : predefined_scaling_metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ALBRequestCountPerTarget -> "ALBRequestCountPerTarget"
    | ASGAverageNetworkOut -> "ASGAverageNetworkOut"
    | ASGAverageNetworkIn -> "ASGAverageNetworkIn"
    | ASGAverageCPUUtilization -> "ASGAverageCPUUtilization")

let predictive_scaling_predefined_scaling_metric_to_query path
    (x : predictive_scaling_predefined_scaling_metric) =
  List.concat
    [
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
      predefined_scaling_metric_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
    ]

let predefined_load_metric_type_to_query path (x : predefined_load_metric_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ALBTargetGroupRequestCount -> "ALBTargetGroupRequestCount"
    | ASGTotalNetworkOut -> "ASGTotalNetworkOut"
    | ASGTotalNetworkIn -> "ASGTotalNetworkIn"
    | ASGTotalCPUUtilization -> "ASGTotalCPUUtilization")

let predictive_scaling_predefined_load_metric_to_query path
    (x : predictive_scaling_predefined_load_metric) =
  List.concat
    [
      (match x.resource_label with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "ResourceLabel" ]) v);
      predefined_load_metric_type_to_query
        (List.append path [ "PredefinedMetricType" ])
        x.predefined_metric_type;
    ]

let metric_stat_to_query path (x : metric_stat) =
  List.concat
    [
      (match x.unit_ with
      | None -> []
      | Some v -> metric_unit_to_query (List.append path [ "Unit" ]) v);
      xml_string_metric_stat_to_query (List.append path [ "Stat" ]) x.stat;
      metric_to_query (List.append path [ "Metric" ]) x.metric;
    ]

let metric_data_query_to_query path (x : metric_data_query) =
  List.concat
    [
      (match x.return_data with
      | None -> []
      | Some v -> return_data_to_query (List.append path [ "ReturnData" ]) v);
      (match x.label with
      | None -> []
      | Some v -> xml_string_metric_label_to_query (List.append path [ "Label" ]) v);
      (match x.metric_stat with
      | None -> []
      | Some v -> metric_stat_to_query (List.append path [ "MetricStat" ]) v);
      (match x.expression with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "Expression" ]) v);
      xml_string_max_len255_to_query (List.append path [ "Id" ]) x.id;
    ]

let metric_data_queries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_data_query_to_query path xs

let predictive_scaling_customized_scaling_metric_to_query path
    (x : predictive_scaling_customized_scaling_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predictive_scaling_customized_load_metric_to_query path
    (x : predictive_scaling_customized_load_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predictive_scaling_customized_capacity_metric_to_query path
    (x : predictive_scaling_customized_capacity_metric) =
  List.concat
    [
      metric_data_queries_to_query (List.append path [ "MetricDataQueries" ]) x.metric_data_queries;
    ]

let predictive_scaling_metric_specification_to_query path
    (x : predictive_scaling_metric_specification) =
  List.concat
    [
      (match x.customized_capacity_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_capacity_metric_to_query
            (List.append path [ "CustomizedCapacityMetricSpecification" ])
            v);
      (match x.customized_load_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_load_metric_to_query
            (List.append path [ "CustomizedLoadMetricSpecification" ])
            v);
      (match x.customized_scaling_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_customized_scaling_metric_to_query
            (List.append path [ "CustomizedScalingMetricSpecification" ])
            v);
      (match x.predefined_load_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_load_metric_to_query
            (List.append path [ "PredefinedLoadMetricSpecification" ])
            v);
      (match x.predefined_scaling_metric_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_scaling_metric_to_query
            (List.append path [ "PredefinedScalingMetricSpecification" ])
            v);
      (match x.predefined_metric_pair_specification with
      | None -> []
      | Some v ->
          predictive_scaling_predefined_metric_pair_to_query
            (List.append path [ "PredefinedMetricPairSpecification" ])
            v);
      metric_scale_to_query (List.append path [ "TargetValue" ]) x.target_value;
    ]

let predictive_scaling_metric_specifications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    predictive_scaling_metric_specification_to_query path xs

let predictive_scaling_mode_to_query path (x : predictive_scaling_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ForecastOnly -> "ForecastOnly" | ForecastAndScale -> "ForecastAndScale")

let predictive_scaling_scheduling_buffer_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let predictive_scaling_max_capacity_breach_behavior_to_query path
    (x : predictive_scaling_max_capacity_breach_behavior) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | IncreaseMaxCapacity -> "IncreaseMaxCapacity"
    | HonorMaxCapacity -> "HonorMaxCapacity")

let predictive_scaling_max_capacity_buffer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let predictive_scaling_configuration_to_query path (x : predictive_scaling_configuration) =
  List.concat
    [
      (match x.max_capacity_buffer with
      | None -> []
      | Some v ->
          predictive_scaling_max_capacity_buffer_to_query
            (List.append path [ "MaxCapacityBuffer" ])
            v);
      (match x.max_capacity_breach_behavior with
      | None -> []
      | Some v ->
          predictive_scaling_max_capacity_breach_behavior_to_query
            (List.append path [ "MaxCapacityBreachBehavior" ])
            v);
      (match x.scheduling_buffer_time with
      | None -> []
      | Some v ->
          predictive_scaling_scheduling_buffer_time_to_query
            (List.append path [ "SchedulingBufferTime" ])
            v);
      (match x.mode with
      | None -> []
      | Some v -> predictive_scaling_mode_to_query (List.append path [ "Mode" ]) v);
      predictive_scaling_metric_specifications_to_query
        (List.append path [ "MetricSpecifications" ])
        x.metric_specifications;
    ]

let scaling_policy_to_query path (x : scaling_policy) =
  List.concat
    [
      (match x.predictive_scaling_configuration with
      | None -> []
      | Some v ->
          predictive_scaling_configuration_to_query
            (List.append path [ "PredictiveScalingConfiguration" ])
            v);
      (match x.enabled with
      | None -> []
      | Some v -> scaling_policy_enabled_to_query (List.append path [ "Enabled" ]) v);
      (match x.target_tracking_configuration with
      | None -> []
      | Some v ->
          target_tracking_configuration_to_query
            (List.append path [ "TargetTrackingConfiguration" ])
            v);
      (match x.alarms with
      | None -> []
      | Some v -> alarms_to_query (List.append path [ "Alarms" ]) v);
      (match x.estimated_instance_warmup with
      | None -> []
      | Some v ->
          estimated_instance_warmup_to_query (List.append path [ "EstimatedInstanceWarmup" ]) v);
      (match x.metric_aggregation_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "MetricAggregationType" ]) v);
      (match x.step_adjustments with
      | None -> []
      | Some v -> step_adjustments_to_query (List.append path [ "StepAdjustments" ]) v);
      (match x.cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "Cooldown" ]) v);
      (match x.scaling_adjustment with
      | None -> []
      | Some v -> policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) v);
      (match x.min_adjustment_magnitude with
      | None -> []
      | Some v ->
          min_adjustment_magnitude_to_query (List.append path [ "MinAdjustmentMagnitude" ]) v);
      (match x.min_adjustment_step with
      | None -> []
      | Some v -> min_adjustment_step_to_query (List.append path [ "MinAdjustmentStep" ]) v);
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
      (match x.policy_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PolicyType" ]) v);
      (match x.policy_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "PolicyARN" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let scaling_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scaling_policy_to_query path xs

let rollback_instance_refresh_type_to_query path (x : rollback_instance_refresh_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let rollback_instance_refresh_answer_to_query path (x : rollback_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let irreversible_instance_refresh_fault_to_query path (x : irreversible_instance_refresh_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let active_instance_refresh_not_found_fault_to_query path
    (x : active_instance_refresh_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let instances_to_update_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_refresh_live_pool_progress_to_query path (x : instance_refresh_live_pool_progress) =
  List.concat
    [
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
    ]

let instance_refresh_warm_pool_progress_to_query path (x : instance_refresh_warm_pool_progress) =
  List.concat
    [
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
    ]

let instance_refresh_progress_details_to_query path (x : instance_refresh_progress_details) =
  List.concat
    [
      (match x.warm_pool_progress with
      | None -> []
      | Some v ->
          instance_refresh_warm_pool_progress_to_query (List.append path [ "WarmPoolProgress" ]) v);
      (match x.live_pool_progress with
      | None -> []
      | Some v ->
          instance_refresh_live_pool_progress_to_query (List.append path [ "LivePoolProgress" ]) v);
    ]

let rollback_details_to_query path (x : rollback_details) =
  List.concat
    [
      (match x.progress_details_on_rollback with
      | None -> []
      | Some v ->
          instance_refresh_progress_details_to_query
            (List.append path [ "ProgressDetailsOnRollback" ])
            v);
      (match x.instances_to_update_on_rollback with
      | None -> []
      | Some v ->
          instances_to_update_to_query (List.append path [ "InstancesToUpdateOnRollback" ]) v);
      (match x.percentage_complete_on_rollback with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageCompleteOnRollback" ]) v);
      (match x.rollback_start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "RollbackStartTime" ]) v);
      (match x.rollback_reason with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "RollbackReason" ]) v);
    ]

let retry_strategy_to_query path (x : retry_strategy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NONE -> "none"
    | RETRY_WITH_GROUP_CONFIGURATION -> "retry-with-group-configuration")

let requested_capacity_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let lifecycle_action_token_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let record_lifecycle_action_heartbeat_type_to_query path
    (x : record_lifecycle_action_heartbeat_type) =
  List.concat
    [
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      (match x.lifecycle_action_token with
      | None -> []
      | Some v -> lifecycle_action_token_to_query (List.append path [ "LifecycleActionToken" ]) v);
      resource_name_to_query (List.append path [ "AutoScalingGroupName" ]) x.auto_scaling_group_name;
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
    ]

let record_lifecycle_action_heartbeat_answer_to_query path _x = []

let put_warm_pool_type_to_query path (x : put_warm_pool_type) =
  List.concat
    [
      (match x.instance_reuse_policy with
      | None -> []
      | Some v -> instance_reuse_policy_to_query (List.append path [ "InstanceReusePolicy" ]) v);
      (match x.pool_state with
      | None -> []
      | Some v -> warm_pool_state_to_query (List.append path [ "PoolState" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> warm_pool_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.max_group_prepared_capacity with
      | None -> []
      | Some v ->
          max_group_prepared_capacity_to_query (List.append path [ "MaxGroupPreparedCapacity" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let put_warm_pool_answer_to_query path _x = []

let put_scheduled_update_group_action_type_to_query path
    (x : put_scheduled_update_group_action_type) =
  List.concat
    [
      (match x.time_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TimeZone" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      (match x.max_size with
      | None -> []
      | Some v -> auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) v);
      (match x.min_size with
      | None -> []
      | Some v -> auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) v);
      (match x.recurrence with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Recurrence" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "Time" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let already_exists_fault_to_query path (x : already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let put_scaling_policy_type_to_query path (x : put_scaling_policy_type) =
  List.concat
    [
      (match x.predictive_scaling_configuration with
      | None -> []
      | Some v ->
          predictive_scaling_configuration_to_query
            (List.append path [ "PredictiveScalingConfiguration" ])
            v);
      (match x.enabled with
      | None -> []
      | Some v -> scaling_policy_enabled_to_query (List.append path [ "Enabled" ]) v);
      (match x.target_tracking_configuration with
      | None -> []
      | Some v ->
          target_tracking_configuration_to_query
            (List.append path [ "TargetTrackingConfiguration" ])
            v);
      (match x.estimated_instance_warmup with
      | None -> []
      | Some v ->
          estimated_instance_warmup_to_query (List.append path [ "EstimatedInstanceWarmup" ]) v);
      (match x.step_adjustments with
      | None -> []
      | Some v -> step_adjustments_to_query (List.append path [ "StepAdjustments" ]) v);
      (match x.metric_aggregation_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "MetricAggregationType" ]) v);
      (match x.cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "Cooldown" ]) v);
      (match x.scaling_adjustment with
      | None -> []
      | Some v -> policy_increment_to_query (List.append path [ "ScalingAdjustment" ]) v);
      (match x.min_adjustment_magnitude with
      | None -> []
      | Some v ->
          min_adjustment_magnitude_to_query (List.append path [ "MinAdjustmentMagnitude" ]) v);
      (match x.min_adjustment_step with
      | None -> []
      | Some v -> min_adjustment_step_to_query (List.append path [ "MinAdjustmentStep" ]) v);
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
      (match x.policy_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PolicyType" ]) v);
      xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let policy_arn_type_to_query path (x : policy_arn_type) =
  List.concat
    [
      (match x.alarms with
      | None -> []
      | Some v -> alarms_to_query (List.append path [ "Alarms" ]) v);
      (match x.policy_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "PolicyARN" ]) v);
    ]

let auto_scaling_notification_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let put_notification_configuration_type_to_query path (x : put_notification_configuration_type) =
  List.concat
    [
      auto_scaling_notification_types_to_query
        (List.append path [ "NotificationTypes" ])
        x.notification_types;
      xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) x.topic_ar_n;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let lifecycle_transition_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let notification_target_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let any_printable_ascii_string_max_len4000_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let heartbeat_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let lifecycle_action_result_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let put_lifecycle_hook_type_to_query path (x : put_lifecycle_hook_type) =
  List.concat
    [
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
      (match x.lifecycle_transition with
      | None -> []
      | Some v -> lifecycle_transition_to_query (List.append path [ "LifecycleTransition" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
    ]

let put_lifecycle_hook_answer_to_query path _x = []

let process_type_to_query path (x : process_type) =
  List.concat [ xml_string_max_len255_to_query (List.append path [ "ProcessName" ]) x.process_name ]

let processes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" process_type_to_query path xs

let processes_type_to_query path (x : processes_type) =
  List.concat
    [
      (match x.processes with
      | None -> []
      | Some v -> processes_to_query (List.append path [ "Processes" ]) v);
    ]

let predictive_scaling_forecast_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_scale_to_query path xs

let predictive_scaling_forecast_timestamps_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" timestamp_type_to_query path xs

let policy_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len64_to_query path
    xs

let policy_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_to_query path xs

let policies_type_to_query path (x : policies_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.scaling_policies with
      | None -> []
      | Some v -> scaling_policies_to_query (List.append path [ "ScalingPolicies" ]) v);
    ]

let number_of_launch_configurations_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let number_of_auto_scaling_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let notification_configuration_to_query path (x : notification_configuration) =
  List.concat
    [
      (match x.notification_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "NotificationType" ]) v);
      (match x.topic_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let notification_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" notification_configuration_to_query
    path xs

let no_device_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let monitoring_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let metric_granularity_type_to_query path (x : metric_granularity_type) =
  List.concat
    [
      (match x.granularity with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Granularity" ]) v);
    ]

let metric_granularity_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_granularity_type_to_query
    path xs

let metric_collection_type_to_query path (x : metric_collection_type) =
  List.concat
    [
      (match x.metric with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Metric" ]) v);
    ]

let metric_collection_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_collection_type_to_query path
    xs

let max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_number_of_launch_configurations_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_number_of_auto_scaling_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let load_forecast_to_query path (x : load_forecast) =
  List.concat
    [
      predictive_scaling_metric_specification_to_query
        (List.append path [ "MetricSpecification" ])
        x.metric_specification;
      predictive_scaling_forecast_values_to_query (List.append path [ "Values" ]) x.values;
      predictive_scaling_forecast_timestamps_to_query
        (List.append path [ "Timestamps" ])
        x.timestamps;
    ]

let load_forecasts_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_forecast_to_query path xs

let load_balancer_target_group_state_to_query path (x : load_balancer_target_group_state) =
  List.concat
    [
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
      (match x.load_balancer_target_group_ar_n with
      | None -> []
      | Some v ->
          xml_string_max_len511_to_query (List.append path [ "LoadBalancerTargetGroupARN" ]) v);
    ]

let load_balancer_target_group_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    load_balancer_target_group_state_to_query path xs

let load_balancer_state_to_query path (x : load_balancer_state) =
  List.concat
    [
      (match x.state with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "State" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LoadBalancerName" ]) v);
    ]

let load_balancer_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_state_to_query path xs

let load_balancer_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let lifecycle_state_to_query path (x : lifecycle_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | WARMED_HIBERNATED -> "Warmed:Hibernated"
    | WARMED_RUNNING -> "Warmed:Running"
    | WARMED_STOPPED -> "Warmed:Stopped"
    | WARMED_TERMINATED -> "Warmed:Terminated"
    | WARMED_TERMINATING_RETAINED -> "Warmed:Terminating:Retained"
    | WARMED_TERMINATING_PROCEED -> "Warmed:Terminating:Proceed"
    | WARMED_TERMINATING_WAIT -> "Warmed:Terminating:Wait"
    | WARMED_TERMINATING -> "Warmed:Terminating"
    | WARMED_PENDING_RETAINED -> "Warmed:Pending:Retained"
    | WARMED_PENDING_PROCEED -> "Warmed:Pending:Proceed"
    | WARMED_PENDING_WAIT -> "Warmed:Pending:Wait"
    | WARMED_PENDING -> "Warmed:Pending"
    | ROOT_VOLUME_REPLACED -> "RootVolumeReplaced"
    | REPLACING_ROOT_VOLUME_PROCEED -> "ReplacingRootVolume:Proceed"
    | REPLACING_ROOT_VOLUME_WAIT -> "ReplacingRootVolume:Wait"
    | REPLACING_ROOT_VOLUME -> "ReplacingRootVolume"
    | STANDBY -> "Standby"
    | ENTERING_STANDBY -> "EnteringStandby"
    | DETACHED -> "Detached"
    | DETACHING -> "Detaching"
    | TERMINATED -> "Terminated"
    | TERMINATING_RETAINED -> "Terminating:Retained"
    | TERMINATING_PROCEED -> "Terminating:Proceed"
    | TERMINATING_WAIT -> "Terminating:Wait"
    | TERMINATING -> "Terminating"
    | IN_SERVICE -> "InService"
    | QUARANTINED -> "Quarantined"
    | PENDING_PROCEED -> "Pending:Proceed"
    | PENDING_WAIT -> "Pending:Wait"
    | PENDING -> "Pending")

let global_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let lifecycle_hook_to_query path (x : lifecycle_hook) =
  List.concat
    [
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
      (match x.global_timeout with
      | None -> []
      | Some v -> global_timeout_to_query (List.append path [ "GlobalTimeout" ]) v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.lifecycle_transition with
      | None -> []
      | Some v -> lifecycle_transition_to_query (List.append path [ "LifecycleTransition" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.lifecycle_hook_name with
      | None -> []
      | Some v -> ascii_string_max_len255_to_query (List.append path [ "LifecycleHookName" ]) v);
    ]

let lifecycle_hooks_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" lifecycle_hook_to_query path xs

let lifecycle_hook_specification_to_query path (x : lifecycle_hook_specification) =
  List.concat
    [
      (match x.role_ar_n with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RoleARN" ]) v);
      (match x.notification_target_ar_n with
      | None -> []
      | Some v ->
          notification_target_resource_name_to_query
            (List.append path [ "NotificationTargetARN" ])
            v);
      (match x.default_result with
      | None -> []
      | Some v -> lifecycle_action_result_to_query (List.append path [ "DefaultResult" ]) v);
      (match x.heartbeat_timeout with
      | None -> []
      | Some v -> heartbeat_timeout_to_query (List.append path [ "HeartbeatTimeout" ]) v);
      (match x.notification_metadata with
      | None -> []
      | Some v ->
          any_printable_ascii_string_max_len4000_to_query
            (List.append path [ "NotificationMetadata" ])
            v);
      lifecycle_transition_to_query
        (List.append path [ "LifecycleTransition" ])
        x.lifecycle_transition;
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
    ]

let lifecycle_hook_specifications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    lifecycle_hook_specification_to_query path xs

let lifecycle_hook_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ascii_string_max_len255_to_query
    path xs

let client_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let instance_collection_to_query path (x : instance_collection) =
  List.concat
    [
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SubnetId" ]) v);
      (match x.market_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "MarketType" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
    ]

let instance_collections_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_collection_to_query path xs

let launch_instances_error_to_query path (x : launch_instances_error) =
  List.concat
    [
      (match x.error_message with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ErrorMessage" ]) v);
      (match x.error_code with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "ErrorCode" ]) v);
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SubnetId" ]) v);
      (match x.market_type with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "MarketType" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
    ]

let launch_instances_errors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_instances_error_to_query path
    xs

let launch_instances_result_to_query path (x : launch_instances_result) =
  List.concat
    [
      (match x.errors with
      | None -> []
      | Some v -> launch_instances_errors_to_query (List.append path [ "Errors" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instance_collections_to_query (List.append path [ "Instances" ]) v);
      (match x.client_token with
      | None -> []
      | Some v -> client_token_to_query (List.append path [ "ClientToken" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let availability_zones_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let availability_zone_ids_limit1_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let launch_instances_request_to_query path (x : launch_instances_request) =
  List.concat
    [
      (match x.retry_strategy with
      | None -> []
      | Some v -> retry_strategy_to_query (List.append path [ "RetryStrategy" ]) v);
      (match x.subnet_ids with
      | None -> []
      | Some v -> subnet_ids_limit1_to_query (List.append path [ "SubnetIds" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v ->
          availability_zone_ids_limit1_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_limit1_to_query (List.append path [ "AvailabilityZones" ]) v);
      client_token_to_query (List.append path [ "ClientToken" ]) x.client_token;
      requested_capacity_to_query (List.append path [ "RequestedCapacity" ]) x.requested_capacity;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let idempotent_parameter_mismatch_error_to_query path (x : idempotent_parameter_mismatch_error) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Message" ]) v);
    ]

let classic_link_vpc_security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let block_device_ebs_volume_size_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let block_device_ebs_volume_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let block_device_ebs_delete_on_termination_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let block_device_ebs_iops_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let block_device_ebs_encrypted_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let block_device_ebs_throughput_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let ebs_to_query path (x : ebs) =
  List.concat
    [
      (match x.throughput with
      | None -> []
      | Some v -> block_device_ebs_throughput_to_query (List.append path [ "Throughput" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> block_device_ebs_encrypted_to_query (List.append path [ "Encrypted" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> block_device_ebs_iops_to_query (List.append path [ "Iops" ]) v);
      (match x.delete_on_termination with
      | None -> []
      | Some v ->
          block_device_ebs_delete_on_termination_to_query
            (List.append path [ "DeleteOnTermination" ])
            v);
      (match x.volume_type with
      | None -> []
      | Some v -> block_device_ebs_volume_type_to_query (List.append path [ "VolumeType" ]) v);
      (match x.volume_size with
      | None -> []
      | Some v -> block_device_ebs_volume_size_to_query (List.append path [ "VolumeSize" ]) v);
      (match x.snapshot_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "SnapshotId" ]) v);
    ]

let block_device_mapping_to_query path (x : block_device_mapping) =
  List.concat
    [
      (match x.no_device with
      | None -> []
      | Some v -> no_device_to_query (List.append path [ "NoDevice" ]) v);
      (match x.ebs with None -> [] | Some v -> ebs_to_query (List.append path [ "Ebs" ]) v);
      xml_string_max_len255_to_query (List.append path [ "DeviceName" ]) x.device_name;
      (match x.virtual_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "VirtualName" ]) v);
    ]

let block_device_mappings_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" block_device_mapping_to_query path
    xs

let instance_monitoring_to_query path (x : instance_monitoring) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> monitoring_enabled_to_query (List.append path [ "Enabled" ]) v);
    ]

let ebs_optimized_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let associate_public_ip_address_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let instance_metadata_http_tokens_state_to_query path (x : instance_metadata_http_tokens_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Required -> "required" | Optional -> "optional")

let instance_metadata_http_put_response_hop_limit_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let instance_metadata_endpoint_state_to_query path (x : instance_metadata_endpoint_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Enabled -> "enabled" | Disabled -> "disabled")

let instance_metadata_options_to_query path (x : instance_metadata_options) =
  List.concat
    [
      (match x.http_endpoint with
      | None -> []
      | Some v -> instance_metadata_endpoint_state_to_query (List.append path [ "HttpEndpoint" ]) v);
      (match x.http_put_response_hop_limit with
      | None -> []
      | Some v ->
          instance_metadata_http_put_response_hop_limit_to_query
            (List.append path [ "HttpPutResponseHopLimit" ])
            v);
      (match x.http_tokens with
      | None -> []
      | Some v -> instance_metadata_http_tokens_state_to_query (List.append path [ "HttpTokens" ]) v);
    ]

let launch_configuration_to_query path (x : launch_configuration) =
  List.concat
    [
      (match x.metadata_options with
      | None -> []
      | Some v -> instance_metadata_options_to_query (List.append path [ "MetadataOptions" ]) v);
      (match x.placement_tenancy with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PlacementTenancy" ]) v);
      (match x.associate_public_ip_address with
      | None -> []
      | Some v ->
          associate_public_ip_address_to_query (List.append path [ "AssociatePublicIpAddress" ]) v);
      (match x.ebs_optimized with
      | None -> []
      | Some v -> ebs_optimized_to_query (List.append path [ "EbsOptimized" ]) v);
      timestamp_type_to_query (List.append path [ "CreatedTime" ]) x.created_time;
      (match x.iam_instance_profile with
      | None -> []
      | Some v -> xml_string_max_len1600_to_query (List.append path [ "IamInstanceProfile" ]) v);
      (match x.spot_price with
      | None -> []
      | Some v -> spot_price_to_query (List.append path [ "SpotPrice" ]) v);
      (match x.instance_monitoring with
      | None -> []
      | Some v -> instance_monitoring_to_query (List.append path [ "InstanceMonitoring" ]) v);
      (match x.block_device_mappings with
      | None -> []
      | Some v -> block_device_mappings_to_query (List.append path [ "BlockDeviceMappings" ]) v);
      (match x.ramdisk_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RamdiskId" ]) v);
      (match x.kernel_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KernelId" ]) v);
      xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) x.instance_type;
      (match x.user_data with
      | None -> []
      | Some v -> xml_string_user_data_to_query (List.append path [ "UserData" ]) v);
      (match x.classic_link_vpc_security_groups with
      | None -> []
      | Some v ->
          classic_link_vpc_security_groups_to_query
            (List.append path [ "ClassicLinkVPCSecurityGroups" ])
            v);
      (match x.classic_link_vpc_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ClassicLinkVPCId" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.key_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KeyName" ]) v);
      xml_string_max_len255_to_query (List.append path [ "ImageId" ]) x.image_id;
      (match x.launch_configuration_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "LaunchConfigurationARN" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
    ]

let launch_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_configuration_to_query path
    xs

let launch_configurations_type_to_query path (x : launch_configurations_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      launch_configurations_to_query
        (List.append path [ "LaunchConfigurations" ])
        x.launch_configurations;
    ]

let launch_configuration_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let launch_configuration_names_type_to_query path (x : launch_configuration_names_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.launch_configuration_names with
      | None -> []
      | Some v ->
          launch_configuration_names_to_query (List.append path [ "LaunchConfigurationNames" ]) v);
    ]

let launch_configuration_name_type_to_query path (x : launch_configuration_name_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
    ]

let invalid_next_token_to_query path (x : invalid_next_token) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "message" ]) v);
    ]

let instance_to_query path (x : instance) =
  List.concat
    [
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
      instance_protected_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      lifecycle_state_to_query (List.append path [ "LifecycleState" ]) x.lifecycle_state;
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) x.availability_zone;
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
    ]

let instances_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_to_query path xs

let instance_refresh_status_to_query path (x : instance_refresh_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Baking -> "Baking"
    | RollbackSuccessful -> "RollbackSuccessful"
    | RollbackFailed -> "RollbackFailed"
    | RollbackInProgress -> "RollbackInProgress"
    | Cancelled -> "Cancelled"
    | Cancelling -> "Cancelling"
    | Failed -> "Failed"
    | Successful -> "Successful"
    | InProgress -> "InProgress"
    | Pending -> "Pending")

let instance_refresh_to_query path (x : instance_refresh) =
  List.concat
    [
      (match x.strategy with
      | None -> []
      | Some v -> refresh_strategy_to_query (List.append path [ "Strategy" ]) v);
      (match x.rollback_details with
      | None -> []
      | Some v -> rollback_details_to_query (List.append path [ "RollbackDetails" ]) v);
      (match x.desired_configuration with
      | None -> []
      | Some v -> desired_configuration_to_query (List.append path [ "DesiredConfiguration" ]) v);
      (match x.preferences with
      | None -> []
      | Some v -> refresh_preferences_to_query (List.append path [ "Preferences" ]) v);
      (match x.progress_details with
      | None -> []
      | Some v ->
          instance_refresh_progress_details_to_query (List.append path [ "ProgressDetails" ]) v);
      (match x.instances_to_update with
      | None -> []
      | Some v -> instances_to_update_to_query (List.append path [ "InstancesToUpdate" ]) v);
      (match x.percentage_complete with
      | None -> []
      | Some v -> int_percent_to_query (List.append path [ "PercentageComplete" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> xml_string_max_len1023_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> instance_refresh_status_to_query (List.append path [ "Status" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let instance_refreshes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_refresh_to_query path xs

let instance_refresh_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let include_instances_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let include_deleted_groups_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let get_predictive_scaling_forecast_type_to_query path (x : get_predictive_scaling_forecast_type) =
  List.concat
    [
      timestamp_type_to_query (List.append path [ "EndTime" ]) x.end_time;
      timestamp_type_to_query (List.append path [ "StartTime" ]) x.start_time;
      xml_string_max_len255_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let capacity_forecast_to_query path (x : capacity_forecast) =
  List.concat
    [
      predictive_scaling_forecast_values_to_query (List.append path [ "Values" ]) x.values;
      predictive_scaling_forecast_timestamps_to_query
        (List.append path [ "Timestamps" ])
        x.timestamps;
    ]

let get_predictive_scaling_forecast_answer_to_query path
    (x : get_predictive_scaling_forecast_answer) =
  List.concat
    [
      timestamp_type_to_query (List.append path [ "UpdateTime" ]) x.update_time;
      capacity_forecast_to_query (List.append path [ "CapacityForecast" ]) x.capacity_forecast;
      load_forecasts_to_query (List.append path [ "LoadForecast" ]) x.load_forecast;
    ]

let force_delete_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let filter_to_query path (x : filter) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> values_to_query (List.append path [ "Values" ]) v);
      (match x.name with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "Name" ]) v);
    ]

let filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" filter_to_query path xs

let failed_scheduled_update_group_action_request_to_query path
    (x : failed_scheduled_update_group_action_request) =
  List.concat
    [
      (match x.error_message with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "ErrorMessage" ]) v);
      (match x.error_code with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "ErrorCode" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
    ]

let failed_scheduled_update_group_action_requests_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    failed_scheduled_update_group_action_request_to_query path xs

let exit_standby_query_to_query path (x : exit_standby_query) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]

let activities_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" activity_to_query path xs

let exit_standby_answer_to_query path (x : exit_standby_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let execute_policy_type_to_query path (x : execute_policy_type) =
  List.concat
    [
      (match x.breach_threshold with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "BreachThreshold" ]) v);
      (match x.metric_value with
      | None -> []
      | Some v -> metric_scale_to_query (List.append path [ "MetricValue" ]) v);
      (match x.honor_cooldown with
      | None -> []
      | Some v -> honor_cooldown_to_query (List.append path [ "HonorCooldown" ]) v);
      resource_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let enter_standby_query_to_query path (x : enter_standby_query) =
  List.concat
    [
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]

let enter_standby_answer_to_query path (x : enter_standby_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let enabled_metric_to_query path (x : enabled_metric) =
  List.concat
    [
      (match x.granularity with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Granularity" ]) v);
      (match x.metric with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Metric" ]) v);
    ]

let enabled_metrics_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" enabled_metric_to_query path xs

let enable_metrics_collection_query_to_query path (x : enable_metrics_collection_query) =
  List.concat
    [
      xml_string_max_len255_to_query (List.append path [ "Granularity" ]) x.granularity;
      (match x.metrics with
      | None -> []
      | Some v -> metrics_to_query (List.append path [ "Metrics" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let disable_metrics_collection_query_to_query path (x : disable_metrics_collection_query) =
  List.concat
    [
      (match x.metrics with
      | None -> []
      | Some v -> metrics_to_query (List.append path [ "Metrics" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let detach_traffic_sources_type_to_query path (x : detach_traffic_sources_type) =
  List.concat
    [
      traffic_sources_to_query (List.append path [ "TrafficSources" ]) x.traffic_sources;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let detach_traffic_sources_result_type_to_query path _x = []

let detach_load_balancers_type_to_query path (x : detach_load_balancers_type) =
  List.concat
    [
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let detach_load_balancers_result_type_to_query path _x = []

let detach_load_balancer_target_groups_type_to_query path
    (x : detach_load_balancer_target_groups_type) =
  List.concat
    [
      target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) x.target_group_ar_ns;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let detach_load_balancer_target_groups_result_type_to_query path _x = []

let detach_instances_query_to_query path (x : detach_instances_query) =
  List.concat
    [
      should_decrement_desired_capacity_to_query
        (List.append path [ "ShouldDecrementDesiredCapacity" ])
        x.should_decrement_desired_capacity;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]

let detach_instances_answer_to_query path (x : detach_instances_answer) =
  List.concat
    [
      (match x.activities with
      | None -> []
      | Some v -> activities_to_query (List.append path [ "Activities" ]) v);
    ]

let describe_warm_pool_type_to_query path (x : describe_warm_pool_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_warm_pool_answer_to_query path (x : describe_warm_pool_answer) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      (match x.warm_pool_configuration with
      | None -> []
      | Some v -> warm_pool_configuration_to_query (List.append path [ "WarmPoolConfiguration" ]) v);
    ]

let describe_traffic_sources_response_to_query path (x : describe_traffic_sources_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_source_states_to_query (List.append path [ "TrafficSources" ]) v);
    ]

let describe_traffic_sources_request_to_query path (x : describe_traffic_sources_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.traffic_source_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "TrafficSourceType" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_termination_policy_types_answer_to_query path
    (x : describe_termination_policy_types_answer) =
  List.concat
    [
      (match x.termination_policy_types with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicyTypes" ]) v);
    ]

let describe_tags_type_to_query path (x : describe_tags_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
    ]

let describe_scheduled_actions_type_to_query path (x : describe_scheduled_actions_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_type_to_query (List.append path [ "StartTime" ]) v);
      (match x.scheduled_action_names with
      | None -> []
      | Some v -> scheduled_action_names_to_query (List.append path [ "ScheduledActionNames" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let activity_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_to_query path xs

let describe_scaling_activities_type_to_query path (x : describe_scaling_activities_type) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.include_deleted_groups with
      | None -> []
      | Some v -> include_deleted_groups_to_query (List.append path [ "IncludeDeletedGroups" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
      (match x.activity_ids with
      | None -> []
      | Some v -> activity_ids_to_query (List.append path [ "ActivityIds" ]) v);
    ]

let activities_type_to_query path (x : activities_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      activities_to_query (List.append path [ "Activities" ]) x.activities;
    ]

let describe_policies_type_to_query path (x : describe_policies_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.policy_types with
      | None -> []
      | Some v -> policy_types_to_query (List.append path [ "PolicyTypes" ]) v);
      (match x.policy_names with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "PolicyNames" ]) v);
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let auto_scaling_group_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" xml_string_max_len255_to_query path
    xs

let describe_notification_configurations_type_to_query path
    (x : describe_notification_configurations_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.auto_scaling_group_names with
      | None -> []
      | Some v -> auto_scaling_group_names_to_query (List.append path [ "AutoScalingGroupNames" ]) v);
    ]

let describe_notification_configurations_answer_to_query path
    (x : describe_notification_configurations_answer) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      notification_configurations_to_query
        (List.append path [ "NotificationConfigurations" ])
        x.notification_configurations;
    ]

let describe_metric_collection_types_answer_to_query path
    (x : describe_metric_collection_types_answer) =
  List.concat
    [
      (match x.granularities with
      | None -> []
      | Some v -> metric_granularity_types_to_query (List.append path [ "Granularities" ]) v);
      (match x.metrics with
      | None -> []
      | Some v -> metric_collection_types_to_query (List.append path [ "Metrics" ]) v);
    ]

let describe_load_balancers_response_to_query path (x : describe_load_balancers_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.load_balancers with
      | None -> []
      | Some v -> load_balancer_states_to_query (List.append path [ "LoadBalancers" ]) v);
    ]

let describe_load_balancers_request_to_query path (x : describe_load_balancers_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_load_balancer_target_groups_response_to_query path
    (x : describe_load_balancer_target_groups_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.load_balancer_target_groups with
      | None -> []
      | Some v ->
          load_balancer_target_group_states_to_query
            (List.append path [ "LoadBalancerTargetGroups" ])
            v);
    ]

let describe_load_balancer_target_groups_request_to_query path
    (x : describe_load_balancer_target_groups_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_lifecycle_hooks_type_to_query path (x : describe_lifecycle_hooks_type) =
  List.concat
    [
      (match x.lifecycle_hook_names with
      | None -> []
      | Some v -> lifecycle_hook_names_to_query (List.append path [ "LifecycleHookNames" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_lifecycle_hooks_answer_to_query path (x : describe_lifecycle_hooks_answer) =
  List.concat
    [
      (match x.lifecycle_hooks with
      | None -> []
      | Some v -> lifecycle_hooks_to_query (List.append path [ "LifecycleHooks" ]) v);
    ]

let describe_lifecycle_hook_types_answer_to_query path (x : describe_lifecycle_hook_types_answer) =
  List.concat
    [
      (match x.lifecycle_hook_types with
      | None -> []
      | Some v ->
          auto_scaling_notification_types_to_query (List.append path [ "LifecycleHookTypes" ]) v);
    ]

let describe_instance_refreshes_type_to_query path (x : describe_instance_refreshes_type) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.instance_refresh_ids with
      | None -> []
      | Some v -> instance_refresh_ids_to_query (List.append path [ "InstanceRefreshIds" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let describe_instance_refreshes_answer_to_query path (x : describe_instance_refreshes_answer) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.instance_refreshes with
      | None -> []
      | Some v -> instance_refreshes_to_query (List.append path [ "InstanceRefreshes" ]) v);
    ]

let describe_auto_scaling_notification_types_answer_to_query path
    (x : describe_auto_scaling_notification_types_answer) =
  List.concat
    [
      (match x.auto_scaling_notification_types with
      | None -> []
      | Some v ->
          auto_scaling_notification_types_to_query
            (List.append path [ "AutoScalingNotificationTypes" ])
            v);
    ]

let describe_auto_scaling_instances_type_to_query path (x : describe_auto_scaling_instances_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]

let auto_scaling_instance_details_to_query path (x : auto_scaling_instance_details) =
  List.concat
    [
      (match x.weighted_capacity with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "WeightedCapacity" ]) v);
      instance_protected_to_query
        (List.append path [ "ProtectedFromScaleIn" ])
        x.protected_from_scale_in;
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      xml_string_max_len32_to_query (List.append path [ "HealthStatus" ]) x.health_status;
      xml_string_max_len32_to_query (List.append path [ "LifecycleState" ]) x.lifecycle_state;
      (match x.availability_zone_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AvailabilityZoneId" ]) v);
      xml_string_max_len255_to_query (List.append path [ "AvailabilityZone" ]) x.availability_zone;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) x.instance_id;
    ]

let auto_scaling_instances_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    auto_scaling_instance_details_to_query path xs

let auto_scaling_instances_type_to_query path (x : auto_scaling_instances_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.auto_scaling_instances with
      | None -> []
      | Some v -> auto_scaling_instances_to_query (List.append path [ "AutoScalingInstances" ]) v);
    ]

let auto_scaling_group_predicted_capacity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let auto_scaling_group_to_query path (x : auto_scaling_group) =
  List.concat
    [
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_sources_to_query (List.append path [ "TrafficSources" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.warm_pool_size with
      | None -> []
      | Some v -> warm_pool_size_to_query (List.append path [ "WarmPoolSize" ]) v);
      (match x.warm_pool_configuration with
      | None -> []
      | Some v -> warm_pool_configuration_to_query (List.append path [ "WarmPoolConfiguration" ]) v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_description_list_to_query (List.append path [ "Tags" ]) v);
      (match x.status with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "Status" ]) v);
      (match x.enabled_metrics with
      | None -> []
      | Some v -> enabled_metrics_to_query (List.append path [ "EnabledMetrics" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.suspended_processes with
      | None -> []
      | Some v -> suspended_processes_to_query (List.append path [ "SuspendedProcesses" ]) v);
      timestamp_type_to_query (List.append path [ "CreatedTime" ]) x.created_time;
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) x.health_check_type;
      (match x.target_group_ar_ns with
      | None -> []
      | Some v -> target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) v);
      (match x.load_balancer_names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      availability_zones_to_query (List.append path [ "AvailabilityZones" ]) x.availability_zones;
      cooldown_to_query (List.append path [ "DefaultCooldown" ]) x.default_cooldown;
      (match x.predicted_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_predicted_capacity_to_query
            (List.append path [ "PredictedCapacity" ])
            v);
      auto_scaling_group_desired_capacity_to_query
        (List.append path [ "DesiredCapacity" ])
        x.desired_capacity;
      auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) x.max_size;
      auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) x.min_size;
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      (match x.auto_scaling_group_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "AutoScalingGroupARN" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let auto_scaling_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" auto_scaling_group_to_query path xs

let auto_scaling_groups_type_to_query path (x : auto_scaling_groups_type) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      auto_scaling_groups_to_query (List.append path [ "AutoScalingGroups" ]) x.auto_scaling_groups;
    ]

let auto_scaling_group_names_type_to_query path (x : auto_scaling_group_names_type) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filters_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> xml_string_to_query (List.append path [ "NextToken" ]) v);
      (match x.include_instances with
      | None -> []
      | Some v -> include_instances_to_query (List.append path [ "IncludeInstances" ]) v);
      (match x.auto_scaling_group_names with
      | None -> []
      | Some v -> auto_scaling_group_names_to_query (List.append path [ "AutoScalingGroupNames" ]) v);
    ]

let adjustment_type_to_query path (x : adjustment_type) =
  List.concat
    [
      (match x.adjustment_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AdjustmentType" ]) v);
    ]

let adjustment_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" adjustment_type_to_query path xs

let describe_adjustment_types_answer_to_query path (x : describe_adjustment_types_answer) =
  List.concat
    [
      (match x.adjustment_types with
      | None -> []
      | Some v -> adjustment_types_to_query (List.append path [ "AdjustmentTypes" ]) v);
    ]

let describe_account_limits_answer_to_query path (x : describe_account_limits_answer) =
  List.concat
    [
      (match x.number_of_launch_configurations with
      | None -> []
      | Some v ->
          number_of_launch_configurations_to_query
            (List.append path [ "NumberOfLaunchConfigurations" ])
            v);
      (match x.number_of_auto_scaling_groups with
      | None -> []
      | Some v ->
          number_of_auto_scaling_groups_to_query
            (List.append path [ "NumberOfAutoScalingGroups" ])
            v);
      (match x.max_number_of_launch_configurations with
      | None -> []
      | Some v ->
          max_number_of_launch_configurations_to_query
            (List.append path [ "MaxNumberOfLaunchConfigurations" ])
            v);
      (match x.max_number_of_auto_scaling_groups with
      | None -> []
      | Some v ->
          max_number_of_auto_scaling_groups_to_query
            (List.append path [ "MaxNumberOfAutoScalingGroups" ])
            v);
    ]

let delete_warm_pool_type_to_query path (x : delete_warm_pool_type) =
  List.concat
    [
      (match x.force_delete with
      | None -> []
      | Some v -> force_delete_to_query (List.append path [ "ForceDelete" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let delete_warm_pool_answer_to_query path _x = []

let delete_tags_type_to_query path (x : delete_tags_type) =
  List.concat [ tags_to_query (List.append path [ "Tags" ]) x.tags ]

let delete_scheduled_action_type_to_query path (x : delete_scheduled_action_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "ScheduledActionName" ])
        x.scheduled_action_name;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let delete_policy_type_to_query path (x : delete_policy_type) =
  List.concat
    [
      resource_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      (match x.auto_scaling_group_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "AutoScalingGroupName" ]) v);
    ]

let delete_notification_configuration_type_to_query path
    (x : delete_notification_configuration_type) =
  List.concat
    [
      xml_string_max_len255_to_query (List.append path [ "TopicARN" ]) x.topic_ar_n;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let delete_lifecycle_hook_type_to_query path (x : delete_lifecycle_hook_type) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
    ]

let delete_lifecycle_hook_answer_to_query path _x = []

let delete_auto_scaling_group_type_to_query path (x : delete_auto_scaling_group_type) =
  List.concat
    [
      (match x.force_delete with
      | None -> []
      | Some v -> force_delete_to_query (List.append path [ "ForceDelete" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let create_or_update_tags_type_to_query path (x : create_or_update_tags_type) =
  List.concat [ tags_to_query (List.append path [ "Tags" ]) x.tags ]

let create_launch_configuration_type_to_query path (x : create_launch_configuration_type) =
  List.concat
    [
      (match x.metadata_options with
      | None -> []
      | Some v -> instance_metadata_options_to_query (List.append path [ "MetadataOptions" ]) v);
      (match x.placement_tenancy with
      | None -> []
      | Some v -> xml_string_max_len64_to_query (List.append path [ "PlacementTenancy" ]) v);
      (match x.associate_public_ip_address with
      | None -> []
      | Some v ->
          associate_public_ip_address_to_query (List.append path [ "AssociatePublicIpAddress" ]) v);
      (match x.ebs_optimized with
      | None -> []
      | Some v -> ebs_optimized_to_query (List.append path [ "EbsOptimized" ]) v);
      (match x.iam_instance_profile with
      | None -> []
      | Some v -> xml_string_max_len1600_to_query (List.append path [ "IamInstanceProfile" ]) v);
      (match x.spot_price with
      | None -> []
      | Some v -> spot_price_to_query (List.append path [ "SpotPrice" ]) v);
      (match x.instance_monitoring with
      | None -> []
      | Some v -> instance_monitoring_to_query (List.append path [ "InstanceMonitoring" ]) v);
      (match x.block_device_mappings with
      | None -> []
      | Some v -> block_device_mappings_to_query (List.append path [ "BlockDeviceMappings" ]) v);
      (match x.ramdisk_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "RamdiskId" ]) v);
      (match x.kernel_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KernelId" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceType" ]) v);
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      (match x.user_data with
      | None -> []
      | Some v -> xml_string_user_data_to_query (List.append path [ "UserData" ]) v);
      (match x.classic_link_vpc_security_groups with
      | None -> []
      | Some v ->
          classic_link_vpc_security_groups_to_query
            (List.append path [ "ClassicLinkVPCSecurityGroups" ])
            v);
      (match x.classic_link_vpc_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ClassicLinkVPCId" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.key_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "KeyName" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "ImageId" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "LaunchConfigurationName" ])
        x.launch_configuration_name;
    ]

let create_auto_scaling_group_type_to_query path (x : create_auto_scaling_group_type) =
  List.concat
    [
      (match x.instance_lifecycle_policy with
      | None -> []
      | Some v ->
          instance_lifecycle_policy_to_query (List.append path [ "InstanceLifecyclePolicy" ]) v);
      (match x.capacity_reservation_specification with
      | None -> []
      | Some v ->
          capacity_reservation_specification_to_query
            (List.append path [ "CapacityReservationSpecification" ])
            v);
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
      (match x.availability_zone_impairment_policy with
      | None -> []
      | Some v ->
          availability_zone_impairment_policy_to_query
            (List.append path [ "AvailabilityZoneImpairmentPolicy" ])
            v);
      (match x.availability_zone_distribution with
      | None -> []
      | Some v ->
          availability_zone_distribution_to_query
            (List.append path [ "AvailabilityZoneDistribution" ])
            v);
      (match x.instance_maintenance_policy with
      | None -> []
      | Some v ->
          instance_maintenance_policy_to_query (List.append path [ "InstanceMaintenancePolicy" ]) v);
      (match x.traffic_sources with
      | None -> []
      | Some v -> traffic_sources_to_query (List.append path [ "TrafficSources" ]) v);
      (match x.default_instance_warmup with
      | None -> []
      | Some v -> default_instance_warmup_to_query (List.append path [ "DefaultInstanceWarmup" ]) v);
      (match x.desired_capacity_type with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "DesiredCapacityType" ]) v);
      (match x.context with
      | None -> []
      | Some v -> context_to_query (List.append path [ "Context" ]) v);
      (match x.max_instance_lifetime with
      | None -> []
      | Some v -> max_instance_lifetime_to_query (List.append path [ "MaxInstanceLifetime" ]) v);
      (match x.service_linked_role_ar_n with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ServiceLinkedRoleARN" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> deletion_protection_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.lifecycle_hook_specification_list with
      | None -> []
      | Some v ->
          lifecycle_hook_specifications_to_query
            (List.append path [ "LifecycleHookSpecificationList" ])
            v);
      (match x.capacity_rebalance with
      | None -> []
      | Some v -> capacity_rebalance_enabled_to_query (List.append path [ "CapacityRebalance" ]) v);
      (match x.new_instances_protected_from_scale_in with
      | None -> []
      | Some v ->
          instance_protected_to_query (List.append path [ "NewInstancesProtectedFromScaleIn" ]) v);
      (match x.termination_policies with
      | None -> []
      | Some v -> termination_policies_to_query (List.append path [ "TerminationPolicies" ]) v);
      (match x.vpc_zone_identifier with
      | None -> []
      | Some v -> xml_string_max_len5000_to_query (List.append path [ "VPCZoneIdentifier" ]) v);
      (match x.placement_group with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "PlacementGroup" ]) v);
      (match x.health_check_grace_period with
      | None -> []
      | Some v ->
          health_check_grace_period_to_query (List.append path [ "HealthCheckGracePeriod" ]) v);
      (match x.health_check_type with
      | None -> []
      | Some v -> xml_string_max_len32_to_query (List.append path [ "HealthCheckType" ]) v);
      (match x.target_group_ar_ns with
      | None -> []
      | Some v -> target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) v);
      (match x.load_balancer_names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) v);
      (match x.availability_zone_ids with
      | None -> []
      | Some v -> availability_zone_ids_to_query (List.append path [ "AvailabilityZoneIds" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.default_cooldown with
      | None -> []
      | Some v -> cooldown_to_query (List.append path [ "DefaultCooldown" ]) v);
      (match x.desired_capacity with
      | None -> []
      | Some v ->
          auto_scaling_group_desired_capacity_to_query (List.append path [ "DesiredCapacity" ]) v);
      auto_scaling_group_max_size_to_query (List.append path [ "MaxSize" ]) x.max_size;
      auto_scaling_group_min_size_to_query (List.append path [ "MinSize" ]) x.min_size;
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      (match x.mixed_instances_policy with
      | None -> []
      | Some v -> mixed_instances_policy_to_query (List.append path [ "MixedInstancesPolicy" ]) v);
      (match x.launch_template with
      | None -> []
      | Some v -> launch_template_specification_to_query (List.append path [ "LaunchTemplate" ]) v);
      (match x.launch_configuration_name with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "LaunchConfigurationName" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let complete_lifecycle_action_type_to_query path (x : complete_lifecycle_action_type) =
  List.concat
    [
      (match x.instance_id with
      | None -> []
      | Some v -> xml_string_max_len19_to_query (List.append path [ "InstanceId" ]) v);
      lifecycle_action_result_to_query
        (List.append path [ "LifecycleActionResult" ])
        x.lifecycle_action_result;
      (match x.lifecycle_action_token with
      | None -> []
      | Some v -> lifecycle_action_token_to_query (List.append path [ "LifecycleActionToken" ]) v);
      resource_name_to_query (List.append path [ "AutoScalingGroupName" ]) x.auto_scaling_group_name;
      ascii_string_max_len255_to_query
        (List.append path [ "LifecycleHookName" ])
        x.lifecycle_hook_name;
    ]

let complete_lifecycle_action_answer_to_query path _x = []
let boolean_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let cancel_instance_refresh_type_to_query path (x : cancel_instance_refresh_type) =
  List.concat
    [
      (match x.wait_for_transitioning_instances with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "WaitForTransitioningInstances" ]) v);
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let cancel_instance_refresh_answer_to_query path (x : cancel_instance_refresh_answer) =
  List.concat
    [
      (match x.instance_refresh_id with
      | None -> []
      | Some v -> xml_string_max_len255_to_query (List.append path [ "InstanceRefreshId" ]) v);
    ]

let batch_put_scheduled_update_group_action_type_to_query path
    (x : batch_put_scheduled_update_group_action_type) =
  List.concat
    [
      scheduled_update_group_action_requests_to_query
        (List.append path [ "ScheduledUpdateGroupActions" ])
        x.scheduled_update_group_actions;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let batch_put_scheduled_update_group_action_answer_to_query path
    (x : batch_put_scheduled_update_group_action_answer) =
  List.concat
    [
      (match x.failed_scheduled_update_group_actions with
      | None -> []
      | Some v ->
          failed_scheduled_update_group_action_requests_to_query
            (List.append path [ "FailedScheduledUpdateGroupActions" ])
            v);
    ]

let batch_delete_scheduled_action_type_to_query path (x : batch_delete_scheduled_action_type) =
  List.concat
    [
      scheduled_action_names_to_query
        (List.append path [ "ScheduledActionNames" ])
        x.scheduled_action_names;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let batch_delete_scheduled_action_answer_to_query path (x : batch_delete_scheduled_action_answer) =
  List.concat
    [
      (match x.failed_scheduled_actions with
      | None -> []
      | Some v ->
          failed_scheduled_update_group_action_requests_to_query
            (List.append path [ "FailedScheduledActions" ])
            v);
    ]

let attach_traffic_sources_result_type_to_query path _x = []

let attach_traffic_sources_type_to_query path (x : attach_traffic_sources_type) =
  List.concat
    [
      (match x.skip_zonal_shift_validation with
      | None -> []
      | Some v ->
          skip_zonal_shift_validation_to_query (List.append path [ "SkipZonalShiftValidation" ]) v);
      traffic_sources_to_query (List.append path [ "TrafficSources" ]) x.traffic_sources;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let attach_load_balancer_target_groups_result_type_to_query path _x = []

let attach_load_balancer_target_groups_type_to_query path
    (x : attach_load_balancer_target_groups_type) =
  List.concat
    [
      target_group_ar_ns_to_query (List.append path [ "TargetGroupARNs" ]) x.target_group_ar_ns;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let attach_load_balancers_result_type_to_query path _x = []

let attach_load_balancers_type_to_query path (x : attach_load_balancers_type) =
  List.concat
    [
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
    ]

let attach_instances_query_to_query path (x : attach_instances_query) =
  List.concat
    [
      xml_string_max_len255_to_query
        (List.append path [ "AutoScalingGroupName" ])
        x.auto_scaling_group_name;
      (match x.instance_ids with
      | None -> []
      | Some v -> instance_ids_to_query (List.append path [ "InstanceIds" ]) v);
    ]
