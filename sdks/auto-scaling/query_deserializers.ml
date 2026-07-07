open Types

let unit_of_xml _ = ()

let zonal_shift_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let xml_string_user_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_metric_stat_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_metric_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len64_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len511_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len5000_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len32_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len255_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len2047_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len19_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len1600_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_max_len1023_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let xml_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let warm_pool_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PendingDelete" -> PendingDelete | _ -> failwith "unknown enum value"
    : warm_pool_status)

let warm_pool_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Hibernated" -> Hibernated
   | "Running" -> Running
   | "Stopped" -> Stopped
   | _ -> failwith "unknown enum value"
    : warm_pool_state)

let warm_pool_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let warm_pool_min_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_group_prepared_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reuse_on_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_reuse_policy_of_xml i =
  let r_reuse_on_scale_in = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReuseOnScaleIn" ] (fun tag _ ->
      match tag with
      | "ReuseOnScaleIn" ->
          r_reuse_on_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReuseOnScaleIn"
                 (fun i _ -> reuse_on_scale_in_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reuse_on_scale_in = ( ! ) r_reuse_on_scale_in } : instance_reuse_policy)

let warm_pool_configuration_of_xml i =
  let r_instance_reuse_policy = ref None in
  let r_status = ref None in
  let r_pool_state = ref None in
  let r_min_size = ref None in
  let r_max_group_prepared_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceReusePolicy"; "Status"; "PoolState"; "MinSize"; "MaxGroupPreparedCapacity" ]
    (fun tag _ ->
      match tag with
      | "InstanceReusePolicy" ->
          r_instance_reuse_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceReusePolicy"
                 (fun i _ -> instance_reuse_policy_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> warm_pool_status_of_xml i)
                 ())
      | "PoolState" ->
          r_pool_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PoolState"
                 (fun i _ -> warm_pool_state_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> warm_pool_min_size_of_xml i)
                 ())
      | "MaxGroupPreparedCapacity" ->
          r_max_group_prepared_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxGroupPreparedCapacity"
                 (fun i _ -> max_group_prepared_capacity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_reuse_policy = ( ! ) r_instance_reuse_policy;
     status = ( ! ) r_status;
     pool_state = ( ! ) r_pool_state;
     min_size = ( ! ) r_min_size;
     max_group_prepared_capacity = ( ! ) r_max_group_prepared_capacity;
   }
    : warm_pool_configuration)

let values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let nullable_positive_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let v_cpu_count_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = Smaws_Lib.Xml.Parse.required "Min" (( ! ) r_min) i }
    : v_cpu_count_request)

let update_placement_group_param_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let launch_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let launch_template_specification_of_xml i =
  let r_version = ref None in
  let r_launch_template_name = ref None in
  let r_launch_template_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Version"; "LaunchTemplateName"; "LaunchTemplateId" ] (fun tag _ ->
      match tag with
      | "Version" ->
          r_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Version"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplateName" ->
          r_launch_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateName"
                 (fun i _ -> launch_template_name_of_xml i)
                 ())
      | "LaunchTemplateId" ->
          r_launch_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version = ( ! ) r_version;
     launch_template_name = ( ! ) r_launch_template_name;
     launch_template_id = ( ! ) r_launch_template_id;
   }
    : launch_template_specification)

let memory_mi_b_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = Smaws_Lib.Xml.Parse.required "Min" (( ! ) r_min) i }
    : memory_mi_b_request)

let cpu_manufacturer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "apple" -> APPLE
   | "amazon-web-services" -> AMAZON_WEB_SERVICES
   | "amd" -> AMD
   | "intel" -> INTEL
   | _ -> failwith "unknown enum value"
    : cpu_manufacturer)

let cpu_manufacturers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cpu_manufacturer_of_xml i) ()

let nullable_positive_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let memory_gi_b_per_v_cpu_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : memory_gi_b_per_v_cpu_request)

let excluded_instance_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let excluded_instance_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> excluded_instance_of_xml i) ()

let instance_generation_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "previous" -> PREVIOUS | "current" -> CURRENT | _ -> failwith "unknown enum value"
    : instance_generation)

let instance_generations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_generation_of_xml i) ()

let bare_metal_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "required" -> REQUIRED
   | "excluded" -> EXCLUDED
   | "included" -> INCLUDED
   | _ -> failwith "unknown enum value"
    : bare_metal)

let burstable_performance_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "required" -> REQUIRED
   | "excluded" -> EXCLUDED
   | "included" -> INCLUDED
   | _ -> failwith "unknown enum value"
    : burstable_performance)

let nullable_boolean_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let network_interface_count_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : network_interface_count_request)

let local_storage_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "required" -> REQUIRED
   | "excluded" -> EXCLUDED
   | "included" -> INCLUDED
   | _ -> failwith "unknown enum value"
    : local_storage)

let local_storage_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ssd" -> SSD | "hdd" -> HDD | _ -> failwith "unknown enum value"
    : local_storage_type)

let local_storage_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> local_storage_type_of_xml i) ()

let total_local_storage_gb_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : total_local_storage_gb_request)

let baseline_ebs_bandwidth_mbps_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : baseline_ebs_bandwidth_mbps_request)

let accelerator_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "inference" -> INFERENCE
   | "fpga" -> FPGA
   | "gpu" -> GPU
   | _ -> failwith "unknown enum value"
    : accelerator_type)

let accelerator_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_type_of_xml i) ()

let accelerator_count_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : accelerator_count_request)

let accelerator_manufacturer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "xilinx" -> XILINX
   | "amazon-web-services" -> AMAZON_WEB_SERVICES
   | "amd" -> AMD
   | "nvidia" -> NVIDIA
   | _ -> failwith "unknown enum value"
    : accelerator_manufacturer)

let accelerator_manufacturers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_manufacturer_of_xml i) ()

let accelerator_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "vu9p" -> VU9P
   | "radeon-pro-v520" -> RADEON_PRO_V520
   | "m60" -> M60
   | "t4" -> T4
   | "k80" -> K80
   | "v100" -> V100
   | "a100" -> A100
   | _ -> failwith "unknown enum value"
    : accelerator_name)

let accelerator_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> accelerator_name_of_xml i) ()

let accelerator_total_memory_mi_b_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : accelerator_total_memory_mi_b_request)

let network_bandwidth_gbps_request_of_xml i =
  let r_max = ref None in
  let r_min = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Min" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | "Min" ->
          r_min :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Min"
                 (fun i _ -> nullable_positive_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; min = ( ! ) r_min } : network_bandwidth_gbps_request)

let allowed_instance_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let allowed_instance_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> allowed_instance_type_of_xml i) ()

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let performance_factor_reference_request_of_xml i =
  let r_instance_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceFamily" ] (fun tag _ ->
      match tag with
      | "InstanceFamily" ->
          r_instance_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_family = ( ! ) r_instance_family } : performance_factor_reference_request)

let performance_factor_reference_set_request_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item"
    (fun i _ -> performance_factor_reference_request_of_xml i)
    ()

let cpu_performance_factor_request_of_xml i =
  let r_references = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reference" ] (fun tag _ ->
      match tag with
      | "Reference" ->
          r_references :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reference"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item"
                     (fun i _ -> performance_factor_reference_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ references = ( ! ) r_references } : cpu_performance_factor_request)

let baseline_performance_factors_request_of_xml i =
  let r_cpu = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cpu" ] (fun tag _ ->
      match tag with
      | "Cpu" ->
          r_cpu :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Cpu"
                 (fun i _ -> cpu_performance_factor_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cpu = ( ! ) r_cpu } : baseline_performance_factors_request)

let instance_requirements_of_xml i =
  let r_baseline_performance_factors = ref None in
  let r_allowed_instance_types = ref None in
  let r_network_bandwidth_gbps = ref None in
  let r_accelerator_total_memory_mi_b = ref None in
  let r_accelerator_names = ref None in
  let r_accelerator_manufacturers = ref None in
  let r_accelerator_count = ref None in
  let r_accelerator_types = ref None in
  let r_baseline_ebs_bandwidth_mbps = ref None in
  let r_total_local_storage_g_b = ref None in
  let r_local_storage_types = ref None in
  let r_local_storage = ref None in
  let r_network_interface_count = ref None in
  let r_require_hibernate_support = ref None in
  let r_burstable_performance = ref None in
  let r_bare_metal = ref None in
  let r_on_demand_max_price_percentage_over_lowest_price = ref None in
  let r_max_spot_price_as_percentage_of_optimal_on_demand_price = ref None in
  let r_spot_max_price_percentage_over_lowest_price = ref None in
  let r_instance_generations = ref None in
  let r_excluded_instance_types = ref None in
  let r_memory_gi_b_per_v_cpu = ref None in
  let r_cpu_manufacturers = ref None in
  let r_memory_mi_b = ref None in
  let r_v_cpu_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "BaselinePerformanceFactors";
      "AllowedInstanceTypes";
      "NetworkBandwidthGbps";
      "AcceleratorTotalMemoryMiB";
      "AcceleratorNames";
      "AcceleratorManufacturers";
      "AcceleratorCount";
      "AcceleratorTypes";
      "BaselineEbsBandwidthMbps";
      "TotalLocalStorageGB";
      "LocalStorageTypes";
      "LocalStorage";
      "NetworkInterfaceCount";
      "RequireHibernateSupport";
      "BurstablePerformance";
      "BareMetal";
      "OnDemandMaxPricePercentageOverLowestPrice";
      "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice";
      "SpotMaxPricePercentageOverLowestPrice";
      "InstanceGenerations";
      "ExcludedInstanceTypes";
      "MemoryGiBPerVCpu";
      "CpuManufacturers";
      "MemoryMiB";
      "VCpuCount";
    ] (fun tag _ ->
      match tag with
      | "BaselinePerformanceFactors" ->
          r_baseline_performance_factors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BaselinePerformanceFactors"
                 (fun i _ -> baseline_performance_factors_request_of_xml i)
                 ())
      | "AllowedInstanceTypes" ->
          r_allowed_instance_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedInstanceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> allowed_instance_type_of_xml i)
                     ())
                 ())
      | "NetworkBandwidthGbps" ->
          r_network_bandwidth_gbps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkBandwidthGbps"
                 (fun i _ -> network_bandwidth_gbps_request_of_xml i)
                 ())
      | "AcceleratorTotalMemoryMiB" ->
          r_accelerator_total_memory_mi_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorTotalMemoryMiB"
                 (fun i _ -> accelerator_total_memory_mi_b_request_of_xml i)
                 ())
      | "AcceleratorNames" ->
          r_accelerator_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_name_of_xml i)
                     ())
                 ())
      | "AcceleratorManufacturers" ->
          r_accelerator_manufacturers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorManufacturers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_manufacturer_of_xml i)
                     ())
                 ())
      | "AcceleratorCount" ->
          r_accelerator_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorCount"
                 (fun i _ -> accelerator_count_request_of_xml i)
                 ())
      | "AcceleratorTypes" ->
          r_accelerator_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceleratorTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> accelerator_type_of_xml i)
                     ())
                 ())
      | "BaselineEbsBandwidthMbps" ->
          r_baseline_ebs_bandwidth_mbps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BaselineEbsBandwidthMbps"
                 (fun i _ -> baseline_ebs_bandwidth_mbps_request_of_xml i)
                 ())
      | "TotalLocalStorageGB" ->
          r_total_local_storage_g_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalLocalStorageGB"
                 (fun i _ -> total_local_storage_gb_request_of_xml i)
                 ())
      | "LocalStorageTypes" ->
          r_local_storage_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LocalStorageTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> local_storage_type_of_xml i)
                     ())
                 ())
      | "LocalStorage" ->
          r_local_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LocalStorage"
                 (fun i _ -> local_storage_of_xml i)
                 ())
      | "NetworkInterfaceCount" ->
          r_network_interface_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaceCount"
                 (fun i _ -> network_interface_count_request_of_xml i)
                 ())
      | "RequireHibernateSupport" ->
          r_require_hibernate_support :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireHibernateSupport"
                 (fun i _ -> nullable_boolean_of_xml i)
                 ())
      | "BurstablePerformance" ->
          r_burstable_performance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BurstablePerformance"
                 (fun i _ -> burstable_performance_of_xml i)
                 ())
      | "BareMetal" ->
          r_bare_metal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BareMetal" (fun i _ -> bare_metal_of_xml i) ())
      | "OnDemandMaxPricePercentageOverLowestPrice" ->
          r_on_demand_max_price_percentage_over_lowest_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandMaxPricePercentageOverLowestPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice" ->
          r_max_spot_price_as_percentage_of_optimal_on_demand_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "SpotMaxPricePercentageOverLowestPrice" ->
          r_spot_max_price_percentage_over_lowest_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotMaxPricePercentageOverLowestPrice"
                 (fun i _ -> nullable_positive_integer_of_xml i)
                 ())
      | "InstanceGenerations" ->
          r_instance_generations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceGenerations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_generation_of_xml i)
                     ())
                 ())
      | "ExcludedInstanceTypes" ->
          r_excluded_instance_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedInstanceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> excluded_instance_of_xml i)
                     ())
                 ())
      | "MemoryGiBPerVCpu" ->
          r_memory_gi_b_per_v_cpu :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemoryGiBPerVCpu"
                 (fun i _ -> memory_gi_b_per_v_cpu_request_of_xml i)
                 ())
      | "CpuManufacturers" ->
          r_cpu_manufacturers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CpuManufacturers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cpu_manufacturer_of_xml i)
                     ())
                 ())
      | "MemoryMiB" ->
          r_memory_mi_b :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemoryMiB"
                 (fun i _ -> memory_mi_b_request_of_xml i)
                 ())
      | "VCpuCount" ->
          r_v_cpu_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VCpuCount"
                 (fun i _ -> v_cpu_count_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     baseline_performance_factors = ( ! ) r_baseline_performance_factors;
     allowed_instance_types = ( ! ) r_allowed_instance_types;
     network_bandwidth_gbps = ( ! ) r_network_bandwidth_gbps;
     accelerator_total_memory_mi_b = ( ! ) r_accelerator_total_memory_mi_b;
     accelerator_names = ( ! ) r_accelerator_names;
     accelerator_manufacturers = ( ! ) r_accelerator_manufacturers;
     accelerator_count = ( ! ) r_accelerator_count;
     accelerator_types = ( ! ) r_accelerator_types;
     baseline_ebs_bandwidth_mbps = ( ! ) r_baseline_ebs_bandwidth_mbps;
     total_local_storage_g_b = ( ! ) r_total_local_storage_g_b;
     local_storage_types = ( ! ) r_local_storage_types;
     local_storage = ( ! ) r_local_storage;
     network_interface_count = ( ! ) r_network_interface_count;
     require_hibernate_support = ( ! ) r_require_hibernate_support;
     burstable_performance = ( ! ) r_burstable_performance;
     bare_metal = ( ! ) r_bare_metal;
     on_demand_max_price_percentage_over_lowest_price =
       ( ! ) r_on_demand_max_price_percentage_over_lowest_price;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       ( ! ) r_max_spot_price_as_percentage_of_optimal_on_demand_price;
     spot_max_price_percentage_over_lowest_price =
       ( ! ) r_spot_max_price_percentage_over_lowest_price;
     instance_generations = ( ! ) r_instance_generations;
     excluded_instance_types = ( ! ) r_excluded_instance_types;
     memory_gi_b_per_v_cpu = ( ! ) r_memory_gi_b_per_v_cpu;
     cpu_manufacturers = ( ! ) r_cpu_manufacturers;
     memory_mi_b = Smaws_Lib.Xml.Parse.required "MemoryMiB" (( ! ) r_memory_mi_b) i;
     v_cpu_count = Smaws_Lib.Xml.Parse.required "VCpuCount" (( ! ) r_v_cpu_count) i;
   }
    : instance_requirements)

let image_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let launch_template_overrides_of_xml i =
  let r_image_id = ref None in
  let r_instance_requirements = ref None in
  let r_launch_template_specification = ref None in
  let r_weighted_capacity = ref None in
  let r_instance_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ImageId";
      "InstanceRequirements";
      "LaunchTemplateSpecification";
      "WeightedCapacity";
      "InstanceType";
    ] (fun tag _ ->
      match tag with
      | "ImageId" ->
          r_image_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId" (fun i _ -> image_id_of_xml i) ())
      | "InstanceRequirements" ->
          r_instance_requirements :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRequirements"
                 (fun i _ -> instance_requirements_of_xml i)
                 ())
      | "LaunchTemplateSpecification" ->
          r_launch_template_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateSpecification"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     image_id = ( ! ) r_image_id;
     instance_requirements = ( ! ) r_instance_requirements;
     launch_template_specification = ( ! ) r_launch_template_specification;
     weighted_capacity = ( ! ) r_weighted_capacity;
     instance_type = ( ! ) r_instance_type;
   }
    : launch_template_overrides)

let overrides_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_template_overrides_of_xml i) ()

let launch_template_of_xml i =
  let r_overrides = ref None in
  let r_launch_template_specification = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Overrides"; "LaunchTemplateSpecification" ]
    (fun tag _ ->
      match tag with
      | "Overrides" ->
          r_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Overrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_template_overrides_of_xml i)
                     ())
                 ())
      | "LaunchTemplateSpecification" ->
          r_launch_template_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplateSpecification"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     overrides = ( ! ) r_overrides;
     launch_template_specification = ( ! ) r_launch_template_specification;
   }
    : launch_template)

let on_demand_base_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let on_demand_percentage_above_base_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let spot_instance_pools_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let mixed_instance_spot_price_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let instances_distribution_of_xml i =
  let r_spot_max_price = ref None in
  let r_spot_instance_pools = ref None in
  let r_spot_allocation_strategy = ref None in
  let r_on_demand_percentage_above_base_capacity = ref None in
  let r_on_demand_base_capacity = ref None in
  let r_on_demand_allocation_strategy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SpotMaxPrice";
      "SpotInstancePools";
      "SpotAllocationStrategy";
      "OnDemandPercentageAboveBaseCapacity";
      "OnDemandBaseCapacity";
      "OnDemandAllocationStrategy";
    ] (fun tag _ ->
      match tag with
      | "SpotMaxPrice" ->
          r_spot_max_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotMaxPrice"
                 (fun i _ -> mixed_instance_spot_price_of_xml i)
                 ())
      | "SpotInstancePools" ->
          r_spot_instance_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotInstancePools"
                 (fun i _ -> spot_instance_pools_of_xml i)
                 ())
      | "SpotAllocationStrategy" ->
          r_spot_allocation_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotAllocationStrategy"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "OnDemandPercentageAboveBaseCapacity" ->
          r_on_demand_percentage_above_base_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandPercentageAboveBaseCapacity"
                 (fun i _ -> on_demand_percentage_above_base_capacity_of_xml i)
                 ())
      | "OnDemandBaseCapacity" ->
          r_on_demand_base_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandBaseCapacity"
                 (fun i _ -> on_demand_base_capacity_of_xml i)
                 ())
      | "OnDemandAllocationStrategy" ->
          r_on_demand_allocation_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnDemandAllocationStrategy"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     spot_max_price = ( ! ) r_spot_max_price;
     spot_instance_pools = ( ! ) r_spot_instance_pools;
     spot_allocation_strategy = ( ! ) r_spot_allocation_strategy;
     on_demand_percentage_above_base_capacity = ( ! ) r_on_demand_percentage_above_base_capacity;
     on_demand_base_capacity = ( ! ) r_on_demand_base_capacity;
     on_demand_allocation_strategy = ( ! ) r_on_demand_allocation_strategy;
   }
    : instances_distribution)

let mixed_instances_policy_of_xml i =
  let r_instances_distribution = ref None in
  let r_launch_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstancesDistribution"; "LaunchTemplate" ]
    (fun tag _ ->
      match tag with
      | "InstancesDistribution" ->
          r_instances_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesDistribution"
                 (fun i _ -> instances_distribution_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances_distribution = ( ! ) r_instances_distribution;
     launch_template = ( ! ) r_launch_template;
   }
    : mixed_instances_policy)

let auto_scaling_group_min_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_max_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_desired_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cooldown_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let availability_zone_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let health_check_grace_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let termination_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len1600_of_xml i) ()

let instance_protected_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let max_instance_lifetime_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let capacity_rebalance_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let default_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_percent_resettable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_percent100_to200_resettable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_maintenance_policy_of_xml i =
  let r_max_healthy_percentage = ref None in
  let r_min_healthy_percentage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxHealthyPercentage"; "MinHealthyPercentage" ]
    (fun tag _ ->
      match tag with
      | "MaxHealthyPercentage" ->
          r_max_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxHealthyPercentage"
                 (fun i _ -> int_percent100_to200_resettable_of_xml i)
                 ())
      | "MinHealthyPercentage" ->
          r_min_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinHealthyPercentage"
                 (fun i _ -> int_percent_resettable_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_healthy_percentage = ( ! ) r_max_healthy_percentage;
     min_healthy_percentage = ( ! ) r_min_healthy_percentage;
   }
    : instance_maintenance_policy)

let capacity_distribution_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "reservations-then-balanced" -> RESERVATIONS_THEN_BALANCED
   | "balanced-best-effort" -> BALANCED_BEST_EFFORT
   | "balanced-only" -> BALANCED_ONLY
   | _ -> failwith "unknown enum value"
    : capacity_distribution_strategy)

let availability_zone_distribution_of_xml i =
  let r_capacity_distribution_strategy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CapacityDistributionStrategy" ] (fun tag _ ->
      match tag with
      | "CapacityDistributionStrategy" ->
          r_capacity_distribution_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityDistributionStrategy"
                 (fun i _ -> capacity_distribution_strategy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ capacity_distribution_strategy = ( ! ) r_capacity_distribution_strategy }
    : availability_zone_distribution)

let impaired_zone_health_check_behavior_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IgnoreUnhealthy" -> IgnoreUnhealthy
   | "ReplaceUnhealthy" -> ReplaceUnhealthy
   | _ -> failwith "unknown enum value"
    : impaired_zone_health_check_behavior)

let availability_zone_impairment_policy_of_xml i =
  let r_impaired_zone_health_check_behavior = ref None in
  let r_zonal_shift_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ImpairedZoneHealthCheckBehavior"; "ZonalShiftEnabled" ] (fun tag _ ->
      match tag with
      | "ImpairedZoneHealthCheckBehavior" ->
          r_impaired_zone_health_check_behavior :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImpairedZoneHealthCheckBehavior"
                 (fun i _ -> impaired_zone_health_check_behavior_of_xml i)
                 ())
      | "ZonalShiftEnabled" ->
          r_zonal_shift_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ZonalShiftEnabled"
                 (fun i _ -> zonal_shift_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     impaired_zone_health_check_behavior = ( ! ) r_impaired_zone_health_check_behavior;
     zonal_shift_enabled = ( ! ) r_zonal_shift_enabled;
   }
    : availability_zone_impairment_policy)

let skip_zonal_shift_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let capacity_reservation_preference_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "default" -> Default
   | "none" -> None_
   | "capacity-reservations-first" -> CapacityReservationsFirst
   | "capacity-reservations-only" -> CapacityReservationsOnly
   | _ -> failwith "unknown enum value"
    : capacity_reservation_preference)

let ascii_string_max_len255_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let capacity_reservation_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ascii_string_max_len255_of_xml i) ()

let capacity_reservation_resource_group_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

let capacity_reservation_target_of_xml i =
  let r_capacity_reservation_resource_group_arns = ref None in
  let r_capacity_reservation_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CapacityReservationResourceGroupArns"; "CapacityReservationIds" ] (fun tag _ ->
      match tag with
      | "CapacityReservationResourceGroupArns" ->
          r_capacity_reservation_resource_group_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationResourceGroupArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "CapacityReservationIds" ->
          r_capacity_reservation_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ascii_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_resource_group_arns = ( ! ) r_capacity_reservation_resource_group_arns;
     capacity_reservation_ids = ( ! ) r_capacity_reservation_ids;
   }
    : capacity_reservation_target)

let capacity_reservation_specification_of_xml i =
  let r_capacity_reservation_target = ref None in
  let r_capacity_reservation_preference = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CapacityReservationTarget"; "CapacityReservationPreference" ] (fun tag _ ->
      match tag with
      | "CapacityReservationTarget" ->
          r_capacity_reservation_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationTarget"
                 (fun i _ -> capacity_reservation_target_of_xml i)
                 ())
      | "CapacityReservationPreference" ->
          r_capacity_reservation_preference :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationPreference"
                 (fun i _ -> capacity_reservation_preference_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_target = ( ! ) r_capacity_reservation_target;
     capacity_reservation_preference = ( ! ) r_capacity_reservation_preference;
   }
    : capacity_reservation_specification)

let retention_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "terminate" -> Terminate | "retain" -> Retain | _ -> failwith "unknown enum value"
    : retention_action)

let retention_triggers_of_xml i =
  let r_terminate_hook_abandon = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TerminateHookAbandon" ] (fun tag _ ->
      match tag with
      | "TerminateHookAbandon" ->
          r_terminate_hook_abandon :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateHookAbandon"
                 (fun i _ -> retention_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ terminate_hook_abandon = ( ! ) r_terminate_hook_abandon } : retention_triggers)

let instance_lifecycle_policy_of_xml i =
  let r_retention_triggers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RetentionTriggers" ] (fun tag _ ->
      match tag with
      | "RetentionTriggers" ->
          r_retention_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionTriggers"
                 (fun i _ -> retention_triggers_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ retention_triggers = ( ! ) r_retention_triggers } : instance_lifecycle_policy)

let deletion_protection_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "prevent-all-deletion" -> PreventAllDeletion
   | "prevent-force-deletion" -> PreventForceDeletion
   | "none" -> None_
   | _ -> failwith "unknown enum value"
    : deletion_protection)

let update_auto_scaling_group_type_of_xml i =
  let r_deletion_protection = ref None in
  let r_instance_lifecycle_policy = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_skip_zonal_shift_validation = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_availability_zone_distribution = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_default_instance_warmup = ref None in
  let r_desired_capacity_type = ref None in
  let r_context = ref None in
  let r_capacity_rebalance = ref None in
  let r_max_instance_lifetime = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_termination_policies = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_placement_group = ref None in
  let r_health_check_grace_period = ref None in
  let r_health_check_type = ref None in
  let r_availability_zone_ids = ref None in
  let r_availability_zones = ref None in
  let r_default_cooldown = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_mixed_instances_policy = ref None in
  let r_launch_template = ref None in
  let r_launch_configuration_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeletionProtection";
      "InstanceLifecyclePolicy";
      "CapacityReservationSpecification";
      "SkipZonalShiftValidation";
      "AvailabilityZoneImpairmentPolicy";
      "AvailabilityZoneDistribution";
      "InstanceMaintenancePolicy";
      "DefaultInstanceWarmup";
      "DesiredCapacityType";
      "Context";
      "CapacityRebalance";
      "MaxInstanceLifetime";
      "ServiceLinkedRoleARN";
      "NewInstancesProtectedFromScaleIn";
      "TerminationPolicies";
      "VPCZoneIdentifier";
      "PlacementGroup";
      "HealthCheckGracePeriod";
      "HealthCheckType";
      "AvailabilityZoneIds";
      "AvailabilityZones";
      "DefaultCooldown";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "MixedInstancesPolicy";
      "LaunchTemplate";
      "LaunchConfigurationName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> update_placement_group_param_of_xml i)
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deletion_protection = ( ! ) r_deletion_protection;
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     context = ( ! ) r_context;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     termination_policies = ( ! ) r_termination_policies;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     placement_group = ( ! ) r_placement_group;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     health_check_type = ( ! ) r_health_check_type;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     availability_zones = ( ! ) r_availability_zones;
     default_cooldown = ( ! ) r_default_cooldown;
     desired_capacity = ( ! ) r_desired_capacity;
     max_size = ( ! ) r_max_size;
     min_size = ( ! ) r_min_size;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     launch_template = ( ! ) r_launch_template;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : update_auto_scaling_group_type)

let service_linked_role_failure_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : service_linked_role_failure)

let scaling_activity_in_progress_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scaling_activity_in_progress_fault)

let resource_contention_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_contention_fault)

let traffic_source_identifier_of_xml i =
  let r_type_ = ref None in
  let r_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Identifier" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "Identifier" ->
          r_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identifier"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     identifier = Smaws_Lib.Xml.Parse.required "Identifier" (( ! ) r_identifier) i;
   }
    : traffic_source_identifier)

let traffic_sources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> traffic_source_identifier_of_xml i) ()

let traffic_source_state_of_xml i =
  let r_type_ = ref None in
  let r_identifier = ref None in
  let r_state = ref None in
  let r_traffic_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Identifier"; "State"; "TrafficSource" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "Identifier" ->
          r_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identifier"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TrafficSource" ->
          r_traffic_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSource"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     identifier = ( ! ) r_identifier;
     state = ( ! ) r_state;
     traffic_source = ( ! ) r_traffic_source;
   }
    : traffic_source_state)

let traffic_source_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> traffic_source_state_of_xml i) ()

let timestamp_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let should_decrement_desired_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_instance_in_auto_scaling_group_type_of_xml i =
  let r_should_decrement_desired_capacity = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ShouldDecrementDesiredCapacity"; "InstanceId" ]
    (fun tag _ ->
      match tag with
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
   }
    : terminate_instance_in_auto_scaling_group_type)

let scaling_activity_status_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "InPlaceUpdateInProgress" -> InPlaceUpdateInProgress
   | "WaitingForInPlaceUpdateToFinalize" -> WaitingForInPlaceUpdateToFinalize
   | "WaitingForInPlaceUpdateToStart" -> WaitingForInPlaceUpdateToStart
   | "WaitingForConnectionDraining" -> WaitingForConnectionDraining
   | "Cancelled" -> Cancelled
   | "Failed" -> Failed
   | "Successful" -> Successful
   | "WaitingForInstanceWarmup" -> WaitingForInstanceWarmup
   | "MidLifecycleAction" -> MidLifecycleAction
   | "WaitingForELBConnectionDraining" -> WaitingForELBConnectionDraining
   | "InProgress" -> InProgress
   | "PreInService" -> PreInService
   | "WaitingForInstanceId" -> WaitingForInstanceId
   | "WaitingForSpotInstanceId" -> WaitingForSpotInstanceId
   | "WaitingForSpotInstanceRequestId" -> WaitingForSpotInstanceRequestId
   | "PendingSpotBidPlacement" -> PendingSpotBidPlacement
   | _ -> failwith "unknown enum value"
    : scaling_activity_status_code)

let progress_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let activity_of_xml i =
  let r_auto_scaling_group_ar_n = ref None in
  let r_auto_scaling_group_state = ref None in
  let r_details = ref None in
  let r_progress = ref None in
  let r_status_message = ref None in
  let r_status_code = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_cause = ref None in
  let r_description = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_activity_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoScalingGroupARN";
      "AutoScalingGroupState";
      "Details";
      "Progress";
      "StatusMessage";
      "StatusCode";
      "EndTime";
      "StartTime";
      "Cause";
      "Description";
      "AutoScalingGroupName";
      "ActivityId";
    ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupARN" ->
          r_auto_scaling_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "AutoScalingGroupState" ->
          r_auto_scaling_group_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupState"
                 (fun i _ -> auto_scaling_group_state_of_xml i)
                 ())
      | "Details" ->
          r_details :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Details" (fun i _ -> xml_string_of_xml i) ())
      | "Progress" ->
          r_progress :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Progress" (fun i _ -> progress_of_xml i) ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> scaling_activity_status_code_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Cause" ->
          r_cause :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Cause"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ActivityId" ->
          r_activity_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActivityId" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_ar_n = ( ! ) r_auto_scaling_group_ar_n;
     auto_scaling_group_state = ( ! ) r_auto_scaling_group_state;
     details = ( ! ) r_details;
     progress = ( ! ) r_progress;
     status_message = ( ! ) r_status_message;
     status_code = Smaws_Lib.Xml.Parse.required "StatusCode" (( ! ) r_status_code) i;
     end_time = ( ! ) r_end_time;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     cause = Smaws_Lib.Xml.Parse.required "Cause" (( ! ) r_cause) i;
     description = ( ! ) r_description;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     activity_id = Smaws_Lib.Xml.Parse.required "ActivityId" (( ! ) r_activity_id) i;
   }
    : activity)

let activity_type_of_xml i =
  let r_activity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activity" ] (fun tag _ ->
      match tag with
      | "Activity" ->
          r_activity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Activity" (fun i _ -> activity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activity = ( ! ) r_activity } : activity_type)

let metric_namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let metric_dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_dimension_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> metric_dimension_value_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> metric_dimension_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : metric_dimension)

let metric_dimensions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_dimension_of_xml i) ()

let metric_of_xml i =
  let r_dimensions = ref None in
  let r_metric_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Dimensions"; "MetricName"; "Namespace" ]
    (fun tag _ ->
      match tag with
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_dimension_of_xml i)
                     ())
                 ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> metric_namespace_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dimensions = ( ! ) r_dimensions;
     metric_name = Smaws_Lib.Xml.Parse.required "MetricName" (( ! ) r_metric_name) i;
     namespace = Smaws_Lib.Xml.Parse.required "Namespace" (( ! ) r_namespace) i;
   }
    : metric)

let metric_unit_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let metric_granularity_in_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_tracking_metric_stat_of_xml i =
  let r_period = ref None in
  let r_unit_ = ref None in
  let r_stat = ref None in
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Period"; "Unit"; "Stat"; "Metric" ] (fun tag _ ->
      match tag with
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> xml_string_metric_stat_of_xml i)
                 ())
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     period = ( ! ) r_period;
     unit_ = ( ! ) r_unit_;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
   }
    : target_tracking_metric_stat)

let return_data_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_tracking_metric_data_query_of_xml i =
  let r_return_data = ref None in
  let r_period = ref None in
  let r_label = ref None in
  let r_metric_stat = ref None in
  let r_expression = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnData"; "Period"; "Label"; "MetricStat"; "Expression"; "Id" ] (fun tag _ ->
      match tag with
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Label"
                 (fun i _ -> xml_string_metric_label_of_xml i)
                 ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> target_tracking_metric_stat_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> xml_string_max_len2047_of_xml i)
                 ())
      | "Id" ->
          r_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Id"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_data = ( ! ) r_return_data;
     period = ( ! ) r_period;
     label = ( ! ) r_label;
     metric_stat = ( ! ) r_metric_stat;
     expression = ( ! ) r_expression;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : target_tracking_metric_data_query)

let target_tracking_metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> target_tracking_metric_data_query_of_xml i)
    ()

let metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
   | "ASGAverageNetworkOut" -> ASGAverageNetworkOut
   | "ASGAverageNetworkIn" -> ASGAverageNetworkIn
   | "ASGAverageCPUUtilization" -> ASGAverageCPUUtilization
   | _ -> failwith "unknown enum value"
    : metric_type)

let predefined_metric_specification_of_xml i =
  let r_resource_label = ref None in
  let r_predefined_metric_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLabel"; "PredefinedMetricType" ]
    (fun tag _ ->
      match tag with
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> metric_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_label = ( ! ) r_resource_label;
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
   }
    : predefined_metric_specification)

let metric_statistic_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Sum" -> Sum
   | "SampleCount" -> SampleCount
   | "Maximum" -> Maximum
   | "Minimum" -> Minimum
   | "Average" -> Average
   | _ -> failwith "unknown enum value"
    : metric_statistic)

let customized_metric_specification_of_xml i =
  let r_metrics = ref None in
  let r_period = ref None in
  let r_unit_ = ref None in
  let r_statistic = ref None in
  let r_dimensions = ref None in
  let r_namespace = ref None in
  let r_metric_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Metrics"; "Period"; "Unit"; "Statistic"; "Dimensions"; "Namespace"; "MetricName" ]
    (fun tag _ ->
      match tag with
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_tracking_metric_data_query_of_xml i)
                     ())
                 ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> metric_granularity_in_seconds_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | "Statistic" ->
          r_statistic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Statistic"
                 (fun i _ -> metric_statistic_of_xml i)
                 ())
      | "Dimensions" ->
          r_dimensions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Dimensions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_dimension_of_xml i)
                     ())
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> metric_namespace_of_xml i)
                 ())
      | "MetricName" ->
          r_metric_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricName"
                 (fun i _ -> metric_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metrics = ( ! ) r_metrics;
     period = ( ! ) r_period;
     unit_ = ( ! ) r_unit_;
     statistic = ( ! ) r_statistic;
     dimensions = ( ! ) r_dimensions;
     namespace = ( ! ) r_namespace;
     metric_name = ( ! ) r_metric_name;
   }
    : customized_metric_specification)

let metric_scale_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let disable_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_tracking_configuration_of_xml i =
  let r_disable_scale_in = ref None in
  let r_target_value = ref None in
  let r_customized_metric_specification = ref None in
  let r_predefined_metric_specification = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DisableScaleIn";
      "TargetValue";
      "CustomizedMetricSpecification";
      "PredefinedMetricSpecification";
    ] (fun tag _ ->
      match tag with
      | "DisableScaleIn" ->
          r_disable_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableScaleIn"
                 (fun i _ -> disable_scale_in_of_xml i)
                 ())
      | "TargetValue" ->
          r_target_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "CustomizedMetricSpecification" ->
          r_customized_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedMetricSpecification"
                 (fun i _ -> customized_metric_specification_of_xml i)
                 ())
      | "PredefinedMetricSpecification" ->
          r_predefined_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricSpecification"
                 (fun i _ -> predefined_metric_specification_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     disable_scale_in = ( ! ) r_disable_scale_in;
     target_value = Smaws_Lib.Xml.Parse.required "TargetValue" (( ! ) r_target_value) i;
     customized_metric_specification = ( ! ) r_customized_metric_specification;
     predefined_metric_specification = ( ! ) r_predefined_metric_specification;
   }
    : target_tracking_configuration)

let target_group_ar_ns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len511_of_xml i) ()

let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let propagate_at_launch_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tag_description_of_xml i =
  let r_propagate_at_launch = ref None in
  let r_value = ref None in
  let r_key = ref None in
  let r_resource_type = ref None in
  let r_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PropagateAtLaunch"; "Value"; "Key"; "ResourceType"; "ResourceId" ] (fun tag _ ->
      match tag with
      | "PropagateAtLaunch" ->
          r_propagate_at_launch :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropagateAtLaunch"
                 (fun i _ -> propagate_at_launch_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     propagate_at_launch = ( ! ) r_propagate_at_launch;
     value = ( ! ) r_value;
     key = ( ! ) r_key;
     resource_type = ( ! ) r_resource_type;
     resource_id = ( ! ) r_resource_id;
   }
    : tag_description)

let tag_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_description_of_xml i) ()

let tags_type_of_xml i =
  let r_next_token = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Tags" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; tags = ( ! ) r_tags } : tags_type)

let tag_of_xml i =
  let r_propagate_at_launch = ref None in
  let r_value = ref None in
  let r_key = ref None in
  let r_resource_type = ref None in
  let r_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PropagateAtLaunch"; "Value"; "Key"; "ResourceType"; "ResourceId" ] (fun tag _ ->
      match tag with
      | "PropagateAtLaunch" ->
          r_propagate_at_launch :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropagateAtLaunch"
                 (fun i _ -> propagate_at_launch_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "ResourceId" ->
          r_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceId" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     propagate_at_launch = ( ! ) r_propagate_at_launch;
     value = ( ! ) r_value;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     resource_type = ( ! ) r_resource_type;
     resource_id = ( ! ) r_resource_id;
   }
    : tag)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let suspended_process_of_xml i =
  let r_suspension_reason = ref None in
  let r_process_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SuspensionReason"; "ProcessName" ] (fun tag _ ->
      match tag with
      | "SuspensionReason" ->
          r_suspension_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuspensionReason"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ProcessName" ->
          r_process_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProcessName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ suspension_reason = ( ! ) r_suspension_reason; process_name = ( ! ) r_process_name }
    : suspended_process)

let suspended_processes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> suspended_process_of_xml i) ()

let resource_in_use_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_in_use_fault)

let process_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let scaling_process_query_of_xml i =
  let r_scaling_processes = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalingProcesses"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "ScalingProcesses" ->
          r_scaling_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingProcesses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scaling_processes = ( ! ) r_scaling_processes;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : scaling_process_query)

let subnet_ids_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let policy_increment_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let step_adjustment_of_xml i =
  let r_scaling_adjustment = ref None in
  let r_metric_interval_upper_bound = ref None in
  let r_metric_interval_lower_bound = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ScalingAdjustment"; "MetricIntervalUpperBound"; "MetricIntervalLowerBound" ] (fun tag _ ->
      match tag with
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | "MetricIntervalUpperBound" ->
          r_metric_interval_upper_bound :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricIntervalUpperBound"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "MetricIntervalLowerBound" ->
          r_metric_interval_lower_bound :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricIntervalLowerBound"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scaling_adjustment =
       Smaws_Lib.Xml.Parse.required "ScalingAdjustment" (( ! ) r_scaling_adjustment) i;
     metric_interval_upper_bound = ( ! ) r_metric_interval_upper_bound;
     metric_interval_lower_bound = ( ! ) r_metric_interval_lower_bound;
   }
    : step_adjustment)

let step_adjustments_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> step_adjustment_of_xml i) ()

let refresh_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ReplaceRootVolume" -> ReplaceRootVolume
   | "Rolling" -> Rolling
   | _ -> failwith "unknown enum value"
    : refresh_strategy)

let desired_configuration_of_xml i =
  let r_mixed_instances_policy = ref None in
  let r_launch_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MixedInstancesPolicy"; "LaunchTemplate" ]
    (fun tag _ ->
      match tag with
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     launch_template = ( ! ) r_launch_template;
   }
    : desired_configuration)

let int_percent_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let refresh_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let non_zero_int_percent_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let checkpoint_percentages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> non_zero_int_percent_of_xml i) ()

let checkpoint_delay_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let skip_matching_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_rollback_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let scale_in_protected_instances_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Wait" -> Wait
   | "Ignore" -> Ignore
   | "Refresh" -> Refresh
   | _ -> failwith "unknown enum value"
    : scale_in_protected_instances)

let standby_instances_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Wait" -> Wait
   | "Ignore" -> Ignore
   | "Terminate" -> Terminate
   | _ -> failwith "unknown enum value"
    : standby_instances)

let alarm_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let alarm_specification_of_xml i =
  let r_alarms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Alarms" ] (fun tag _ ->
      match tag with
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarms = ( ! ) r_alarms } : alarm_specification)

let int_percent100_to200_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let bake_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let refresh_preferences_of_xml i =
  let r_bake_time = ref None in
  let r_max_healthy_percentage = ref None in
  let r_alarm_specification = ref None in
  let r_standby_instances = ref None in
  let r_scale_in_protected_instances = ref None in
  let r_auto_rollback = ref None in
  let r_skip_matching = ref None in
  let r_checkpoint_delay = ref None in
  let r_checkpoint_percentages = ref None in
  let r_instance_warmup = ref None in
  let r_min_healthy_percentage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "BakeTime";
      "MaxHealthyPercentage";
      "AlarmSpecification";
      "StandbyInstances";
      "ScaleInProtectedInstances";
      "AutoRollback";
      "SkipMatching";
      "CheckpointDelay";
      "CheckpointPercentages";
      "InstanceWarmup";
      "MinHealthyPercentage";
    ] (fun tag _ ->
      match tag with
      | "BakeTime" ->
          r_bake_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BakeTime" (fun i _ -> bake_time_of_xml i) ())
      | "MaxHealthyPercentage" ->
          r_max_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxHealthyPercentage"
                 (fun i _ -> int_percent100_to200_of_xml i)
                 ())
      | "AlarmSpecification" ->
          r_alarm_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmSpecification"
                 (fun i _ -> alarm_specification_of_xml i)
                 ())
      | "StandbyInstances" ->
          r_standby_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StandbyInstances"
                 (fun i _ -> standby_instances_of_xml i)
                 ())
      | "ScaleInProtectedInstances" ->
          r_scale_in_protected_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleInProtectedInstances"
                 (fun i _ -> scale_in_protected_instances_of_xml i)
                 ())
      | "AutoRollback" ->
          r_auto_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoRollback"
                 (fun i _ -> auto_rollback_of_xml i)
                 ())
      | "SkipMatching" ->
          r_skip_matching :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipMatching"
                 (fun i _ -> skip_matching_of_xml i)
                 ())
      | "CheckpointDelay" ->
          r_checkpoint_delay :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CheckpointDelay"
                 (fun i _ -> checkpoint_delay_of_xml i)
                 ())
      | "CheckpointPercentages" ->
          r_checkpoint_percentages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CheckpointPercentages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> non_zero_int_percent_of_xml i)
                     ())
                 ())
      | "InstanceWarmup" ->
          r_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceWarmup"
                 (fun i _ -> refresh_instance_warmup_of_xml i)
                 ())
      | "MinHealthyPercentage" ->
          r_min_healthy_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinHealthyPercentage"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     bake_time = ( ! ) r_bake_time;
     max_healthy_percentage = ( ! ) r_max_healthy_percentage;
     alarm_specification = ( ! ) r_alarm_specification;
     standby_instances = ( ! ) r_standby_instances;
     scale_in_protected_instances = ( ! ) r_scale_in_protected_instances;
     auto_rollback = ( ! ) r_auto_rollback;
     skip_matching = ( ! ) r_skip_matching;
     checkpoint_delay = ( ! ) r_checkpoint_delay;
     checkpoint_percentages = ( ! ) r_checkpoint_percentages;
     instance_warmup = ( ! ) r_instance_warmup;
     min_healthy_percentage = ( ! ) r_min_healthy_percentage;
   }
    : refresh_preferences)

let start_instance_refresh_type_of_xml i =
  let r_preferences = ref None in
  let r_desired_configuration = ref None in
  let r_strategy = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Preferences"; "DesiredConfiguration"; "Strategy"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "Preferences" ->
          r_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Preferences"
                 (fun i _ -> refresh_preferences_of_xml i)
                 ())
      | "DesiredConfiguration" ->
          r_desired_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredConfiguration"
                 (fun i _ -> desired_configuration_of_xml i)
                 ())
      | "Strategy" ->
          r_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Strategy"
                 (fun i _ -> refresh_strategy_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     preferences = ( ! ) r_preferences;
     desired_configuration = ( ! ) r_desired_configuration;
     strategy = ( ! ) r_strategy;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : start_instance_refresh_type)

let start_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : start_instance_refresh_answer)

let limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_fault)

let instance_refresh_in_progress_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : instance_refresh_in_progress_fault)

let spot_price_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let should_respect_grace_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len19_of_xml i) ()

let protected_from_scale_in_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_instance_protection_query_of_xml i =
  let r_protected_from_scale_in = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ProtectedFromScaleIn"; "AutoScalingGroupName"; "InstanceIds" ] (fun tag _ ->
      match tag with
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> protected_from_scale_in_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_ids = Smaws_Lib.Xml.Parse.required "InstanceIds" (( ! ) r_instance_ids) i;
   }
    : set_instance_protection_query)

let set_instance_protection_answer_of_xml i = ()

let set_instance_health_query_of_xml i =
  let r_should_respect_grace_period = ref None in
  let r_health_status = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ShouldRespectGracePeriod"; "HealthStatus"; "InstanceId" ] (fun tag _ ->
      match tag with
      | "ShouldRespectGracePeriod" ->
          r_should_respect_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldRespectGracePeriod"
                 (fun i _ -> should_respect_grace_period_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     should_respect_grace_period = ( ! ) r_should_respect_grace_period;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
   }
    : set_instance_health_query)

let honor_cooldown_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_desired_capacity_type_of_xml i =
  let r_honor_cooldown = ref None in
  let r_desired_capacity = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HonorCooldown"; "DesiredCapacity"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "HonorCooldown" ->
          r_honor_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HonorCooldown"
                 (fun i _ -> honor_cooldown_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     honor_cooldown = ( ! ) r_honor_cooldown;
     desired_capacity = Smaws_Lib.Xml.Parse.required "DesiredCapacity" (( ! ) r_desired_capacity) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : set_desired_capacity_type)

let security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let scheduled_update_group_action_of_xml i =
  let r_time_zone = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_recurrence = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_time = ref None in
  let r_scheduled_action_ar_n = ref None in
  let r_scheduled_action_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TimeZone";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "Recurrence";
      "EndTime";
      "StartTime";
      "Time";
      "ScheduledActionARN";
      "ScheduledActionName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Time" ->
          r_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Time" (fun i _ -> timestamp_type_of_xml i) ())
      | "ScheduledActionARN" ->
          r_scheduled_action_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     time_zone = ( ! ) r_time_zone;
     desired_capacity = ( ! ) r_desired_capacity;
     max_size = ( ! ) r_max_size;
     min_size = ( ! ) r_min_size;
     recurrence = ( ! ) r_recurrence;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     time = ( ! ) r_time;
     scheduled_action_ar_n = ( ! ) r_scheduled_action_ar_n;
     scheduled_action_name = ( ! ) r_scheduled_action_name;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : scheduled_update_group_action)

let scheduled_update_group_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> scheduled_update_group_action_of_xml i)
    ()

let scheduled_update_group_action_request_of_xml i =
  let r_time_zone = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_recurrence = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TimeZone";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "Recurrence";
      "EndTime";
      "StartTime";
      "ScheduledActionName";
    ] (fun tag _ ->
      match tag with
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     time_zone = ( ! ) r_time_zone;
     desired_capacity = ( ! ) r_desired_capacity;
     max_size = ( ! ) r_max_size;
     min_size = ( ! ) r_min_size;
     recurrence = ( ! ) r_recurrence;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : scheduled_update_group_action_request)

let scheduled_update_group_action_requests_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> scheduled_update_group_action_request_of_xml i)
    ()

let scheduled_actions_type_of_xml i =
  let r_next_token = ref None in
  let r_scheduled_update_group_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ScheduledUpdateGroupActions" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "ScheduledUpdateGroupActions" ->
          r_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scheduled_update_group_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     scheduled_update_group_actions = ( ! ) r_scheduled_update_group_actions;
   }
    : scheduled_actions_type)

let scheduled_action_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let scaling_policy_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let min_adjustment_step_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let min_adjustment_magnitude_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let estimated_instance_warmup_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let alarm_of_xml i =
  let r_alarm_ar_n = ref None in
  let r_alarm_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AlarmARN"; "AlarmName" ] (fun tag _ ->
      match tag with
      | "AlarmARN" ->
          r_alarm_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "AlarmName" ->
          r_alarm_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlarmName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarm_ar_n = ( ! ) r_alarm_ar_n; alarm_name = ( ! ) r_alarm_name } : alarm)

let alarms_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ()

let predefined_metric_pair_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ALBRequestCount" -> ALBRequestCount
   | "ASGNetworkOut" -> ASGNetworkOut
   | "ASGNetworkIn" -> ASGNetworkIn
   | "ASGCPUUtilization" -> ASGCPUUtilization
   | _ -> failwith "unknown enum value"
    : predefined_metric_pair_type)

let predictive_scaling_predefined_metric_pair_of_xml i =
  let r_resource_label = ref None in
  let r_predefined_metric_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLabel"; "PredefinedMetricType" ]
    (fun tag _ ->
      match tag with
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_metric_pair_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_label = ( ! ) r_resource_label;
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
   }
    : predictive_scaling_predefined_metric_pair)

let predefined_scaling_metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ALBRequestCountPerTarget" -> ALBRequestCountPerTarget
   | "ASGAverageNetworkOut" -> ASGAverageNetworkOut
   | "ASGAverageNetworkIn" -> ASGAverageNetworkIn
   | "ASGAverageCPUUtilization" -> ASGAverageCPUUtilization
   | _ -> failwith "unknown enum value"
    : predefined_scaling_metric_type)

let predictive_scaling_predefined_scaling_metric_of_xml i =
  let r_resource_label = ref None in
  let r_predefined_metric_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLabel"; "PredefinedMetricType" ]
    (fun tag _ ->
      match tag with
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_scaling_metric_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_label = ( ! ) r_resource_label;
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
   }
    : predictive_scaling_predefined_scaling_metric)

let predefined_load_metric_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ALBTargetGroupRequestCount" -> ALBTargetGroupRequestCount
   | "ASGTotalNetworkOut" -> ASGTotalNetworkOut
   | "ASGTotalNetworkIn" -> ASGTotalNetworkIn
   | "ASGTotalCPUUtilization" -> ASGTotalCPUUtilization
   | _ -> failwith "unknown enum value"
    : predefined_load_metric_type)

let predictive_scaling_predefined_load_metric_of_xml i =
  let r_resource_label = ref None in
  let r_predefined_metric_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLabel"; "PredefinedMetricType" ]
    (fun tag _ ->
      match tag with
      | "ResourceLabel" ->
          r_resource_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLabel"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "PredefinedMetricType" ->
          r_predefined_metric_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricType"
                 (fun i _ -> predefined_load_metric_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_label = ( ! ) r_resource_label;
     predefined_metric_type =
       Smaws_Lib.Xml.Parse.required "PredefinedMetricType" (( ! ) r_predefined_metric_type) i;
   }
    : predictive_scaling_predefined_load_metric)

let metric_stat_of_xml i =
  let r_unit_ = ref None in
  let r_stat = ref None in
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Unit"; "Stat"; "Metric" ] (fun tag _ ->
      match tag with
      | "Unit" ->
          r_unit_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Unit" (fun i _ -> metric_unit_of_xml i) ())
      | "Stat" ->
          r_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stat"
                 (fun i _ -> xml_string_metric_stat_of_xml i)
                 ())
      | "Metric" ->
          r_metric :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metric" (fun i _ -> metric_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     unit_ = ( ! ) r_unit_;
     stat = Smaws_Lib.Xml.Parse.required "Stat" (( ! ) r_stat) i;
     metric = Smaws_Lib.Xml.Parse.required "Metric" (( ! ) r_metric) i;
   }
    : metric_stat)

let metric_data_query_of_xml i =
  let r_return_data = ref None in
  let r_label = ref None in
  let r_metric_stat = ref None in
  let r_expression = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnData"; "Label"; "MetricStat"; "Expression"; "Id" ] (fun tag _ ->
      match tag with
      | "ReturnData" ->
          r_return_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnData"
                 (fun i _ -> return_data_of_xml i)
                 ())
      | "Label" ->
          r_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Label"
                 (fun i _ -> xml_string_metric_label_of_xml i)
                 ())
      | "MetricStat" ->
          r_metric_stat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricStat"
                 (fun i _ -> metric_stat_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "Id" ->
          r_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Id"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_data = ( ! ) r_return_data;
     label = ( ! ) r_label;
     metric_stat = ( ! ) r_metric_stat;
     expression = ( ! ) r_expression;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : metric_data_query)

let metric_data_queries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_data_query_of_xml i) ()

let predictive_scaling_customized_scaling_metric_of_xml i =
  let r_metric_data_queries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricDataQueries" ] (fun tag _ ->
      match tag with
      | "MetricDataQueries" ->
          r_metric_data_queries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataQueries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_scaling_metric)

let predictive_scaling_customized_load_metric_of_xml i =
  let r_metric_data_queries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricDataQueries" ] (fun tag _ ->
      match tag with
      | "MetricDataQueries" ->
          r_metric_data_queries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataQueries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_load_metric)

let predictive_scaling_customized_capacity_metric_of_xml i =
  let r_metric_data_queries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricDataQueries" ] (fun tag _ ->
      match tag with
      | "MetricDataQueries" ->
          r_metric_data_queries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricDataQueries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_data_query_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_data_queries =
       Smaws_Lib.Xml.Parse.required "MetricDataQueries" (( ! ) r_metric_data_queries) i;
   }
    : predictive_scaling_customized_capacity_metric)

let predictive_scaling_metric_specification_of_xml i =
  let r_customized_capacity_metric_specification = ref None in
  let r_customized_load_metric_specification = ref None in
  let r_customized_scaling_metric_specification = ref None in
  let r_predefined_load_metric_specification = ref None in
  let r_predefined_scaling_metric_specification = ref None in
  let r_predefined_metric_pair_specification = ref None in
  let r_target_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomizedCapacityMetricSpecification";
      "CustomizedLoadMetricSpecification";
      "CustomizedScalingMetricSpecification";
      "PredefinedLoadMetricSpecification";
      "PredefinedScalingMetricSpecification";
      "PredefinedMetricPairSpecification";
      "TargetValue";
    ] (fun tag _ ->
      match tag with
      | "CustomizedCapacityMetricSpecification" ->
          r_customized_capacity_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedCapacityMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_capacity_metric_of_xml i)
                 ())
      | "CustomizedLoadMetricSpecification" ->
          r_customized_load_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedLoadMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_load_metric_of_xml i)
                 ())
      | "CustomizedScalingMetricSpecification" ->
          r_customized_scaling_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomizedScalingMetricSpecification"
                 (fun i _ -> predictive_scaling_customized_scaling_metric_of_xml i)
                 ())
      | "PredefinedLoadMetricSpecification" ->
          r_predefined_load_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedLoadMetricSpecification"
                 (fun i _ -> predictive_scaling_predefined_load_metric_of_xml i)
                 ())
      | "PredefinedScalingMetricSpecification" ->
          r_predefined_scaling_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedScalingMetricSpecification"
                 (fun i _ -> predictive_scaling_predefined_scaling_metric_of_xml i)
                 ())
      | "PredefinedMetricPairSpecification" ->
          r_predefined_metric_pair_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredefinedMetricPairSpecification"
                 (fun i _ -> predictive_scaling_predefined_metric_pair_of_xml i)
                 ())
      | "TargetValue" ->
          r_target_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     customized_capacity_metric_specification = ( ! ) r_customized_capacity_metric_specification;
     customized_load_metric_specification = ( ! ) r_customized_load_metric_specification;
     customized_scaling_metric_specification = ( ! ) r_customized_scaling_metric_specification;
     predefined_load_metric_specification = ( ! ) r_predefined_load_metric_specification;
     predefined_scaling_metric_specification = ( ! ) r_predefined_scaling_metric_specification;
     predefined_metric_pair_specification = ( ! ) r_predefined_metric_pair_specification;
     target_value = Smaws_Lib.Xml.Parse.required "TargetValue" (( ! ) r_target_value) i;
   }
    : predictive_scaling_metric_specification)

let predictive_scaling_metric_specifications_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> predictive_scaling_metric_specification_of_xml i)
    ()

let predictive_scaling_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ForecastOnly" -> ForecastOnly
   | "ForecastAndScale" -> ForecastAndScale
   | _ -> failwith "unknown enum value"
    : predictive_scaling_mode)

let predictive_scaling_scheduling_buffer_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let predictive_scaling_max_capacity_breach_behavior_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IncreaseMaxCapacity" -> IncreaseMaxCapacity
   | "HonorMaxCapacity" -> HonorMaxCapacity
   | _ -> failwith "unknown enum value"
    : predictive_scaling_max_capacity_breach_behavior)

let predictive_scaling_max_capacity_buffer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let predictive_scaling_configuration_of_xml i =
  let r_max_capacity_buffer = ref None in
  let r_max_capacity_breach_behavior = ref None in
  let r_scheduling_buffer_time = ref None in
  let r_mode = ref None in
  let r_metric_specifications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxCapacityBuffer";
      "MaxCapacityBreachBehavior";
      "SchedulingBufferTime";
      "Mode";
      "MetricSpecifications";
    ] (fun tag _ ->
      match tag with
      | "MaxCapacityBuffer" ->
          r_max_capacity_buffer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacityBuffer"
                 (fun i _ -> predictive_scaling_max_capacity_buffer_of_xml i)
                 ())
      | "MaxCapacityBreachBehavior" ->
          r_max_capacity_breach_behavior :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacityBreachBehavior"
                 (fun i _ -> predictive_scaling_max_capacity_breach_behavior_of_xml i)
                 ())
      | "SchedulingBufferTime" ->
          r_scheduling_buffer_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SchedulingBufferTime"
                 (fun i _ -> predictive_scaling_scheduling_buffer_time_of_xml i)
                 ())
      | "Mode" ->
          r_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Mode"
                 (fun i _ -> predictive_scaling_mode_of_xml i)
                 ())
      | "MetricSpecifications" ->
          r_metric_specifications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricSpecifications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> predictive_scaling_metric_specification_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_capacity_buffer = ( ! ) r_max_capacity_buffer;
     max_capacity_breach_behavior = ( ! ) r_max_capacity_breach_behavior;
     scheduling_buffer_time = ( ! ) r_scheduling_buffer_time;
     mode = ( ! ) r_mode;
     metric_specifications =
       Smaws_Lib.Xml.Parse.required "MetricSpecifications" (( ! ) r_metric_specifications) i;
   }
    : predictive_scaling_configuration)

let scaling_policy_of_xml i =
  let r_predictive_scaling_configuration = ref None in
  let r_enabled = ref None in
  let r_target_tracking_configuration = ref None in
  let r_alarms = ref None in
  let r_estimated_instance_warmup = ref None in
  let r_metric_aggregation_type = ref None in
  let r_step_adjustments = ref None in
  let r_cooldown = ref None in
  let r_scaling_adjustment = ref None in
  let r_min_adjustment_magnitude = ref None in
  let r_min_adjustment_step = ref None in
  let r_adjustment_type = ref None in
  let r_policy_type = ref None in
  let r_policy_ar_n = ref None in
  let r_policy_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PredictiveScalingConfiguration";
      "Enabled";
      "TargetTrackingConfiguration";
      "Alarms";
      "EstimatedInstanceWarmup";
      "MetricAggregationType";
      "StepAdjustments";
      "Cooldown";
      "ScalingAdjustment";
      "MinAdjustmentMagnitude";
      "MinAdjustmentStep";
      "AdjustmentType";
      "PolicyType";
      "PolicyARN";
      "PolicyName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "PredictiveScalingConfiguration" ->
          r_predictive_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictiveScalingConfiguration"
                 (fun i _ -> predictive_scaling_configuration_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> scaling_policy_enabled_of_xml i)
                 ())
      | "TargetTrackingConfiguration" ->
          r_target_tracking_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTrackingConfiguration"
                 (fun i _ -> target_tracking_configuration_of_xml i)
                 ())
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ())
                 ())
      | "EstimatedInstanceWarmup" ->
          r_estimated_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedInstanceWarmup"
                 (fun i _ -> estimated_instance_warmup_of_xml i)
                 ())
      | "MetricAggregationType" ->
          r_metric_aggregation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAggregationType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "StepAdjustments" ->
          r_step_adjustments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StepAdjustments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> step_adjustment_of_xml i)
                     ())
                 ())
      | "Cooldown" ->
          r_cooldown :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cooldown" (fun i _ -> cooldown_of_xml i) ())
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | "MinAdjustmentMagnitude" ->
          r_min_adjustment_magnitude :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentMagnitude"
                 (fun i _ -> min_adjustment_magnitude_of_xml i)
                 ())
      | "MinAdjustmentStep" ->
          r_min_adjustment_step :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentStep"
                 (fun i _ -> min_adjustment_step_of_xml i)
                 ())
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyType" ->
          r_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "PolicyARN" ->
          r_policy_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predictive_scaling_configuration = ( ! ) r_predictive_scaling_configuration;
     enabled = ( ! ) r_enabled;
     target_tracking_configuration = ( ! ) r_target_tracking_configuration;
     alarms = ( ! ) r_alarms;
     estimated_instance_warmup = ( ! ) r_estimated_instance_warmup;
     metric_aggregation_type = ( ! ) r_metric_aggregation_type;
     step_adjustments = ( ! ) r_step_adjustments;
     cooldown = ( ! ) r_cooldown;
     scaling_adjustment = ( ! ) r_scaling_adjustment;
     min_adjustment_magnitude = ( ! ) r_min_adjustment_magnitude;
     min_adjustment_step = ( ! ) r_min_adjustment_step;
     adjustment_type = ( ! ) r_adjustment_type;
     policy_type = ( ! ) r_policy_type;
     policy_ar_n = ( ! ) r_policy_ar_n;
     policy_name = ( ! ) r_policy_name;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : scaling_policy)

let scaling_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scaling_policy_of_xml i) ()

let rollback_instance_refresh_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : rollback_instance_refresh_type)

let rollback_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : rollback_instance_refresh_answer)

let irreversible_instance_refresh_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : irreversible_instance_refresh_fault)

let active_instance_refresh_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : active_instance_refresh_not_found_fault)

let instances_to_update_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_refresh_live_pool_progress_of_xml i =
  let r_instances_to_update = ref None in
  let r_percentage_complete = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstancesToUpdate"; "PercentageComplete" ]
    (fun tag _ ->
      match tag with
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances_to_update = ( ! ) r_instances_to_update;
     percentage_complete = ( ! ) r_percentage_complete;
   }
    : instance_refresh_live_pool_progress)

let instance_refresh_warm_pool_progress_of_xml i =
  let r_instances_to_update = ref None in
  let r_percentage_complete = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstancesToUpdate"; "PercentageComplete" ]
    (fun tag _ ->
      match tag with
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances_to_update = ( ! ) r_instances_to_update;
     percentage_complete = ( ! ) r_percentage_complete;
   }
    : instance_refresh_warm_pool_progress)

let instance_refresh_progress_details_of_xml i =
  let r_warm_pool_progress = ref None in
  let r_live_pool_progress = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "WarmPoolProgress"; "LivePoolProgress" ]
    (fun tag _ ->
      match tag with
      | "WarmPoolProgress" ->
          r_warm_pool_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolProgress"
                 (fun i _ -> instance_refresh_warm_pool_progress_of_xml i)
                 ())
      | "LivePoolProgress" ->
          r_live_pool_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LivePoolProgress"
                 (fun i _ -> instance_refresh_live_pool_progress_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     warm_pool_progress = ( ! ) r_warm_pool_progress;
     live_pool_progress = ( ! ) r_live_pool_progress;
   }
    : instance_refresh_progress_details)

let rollback_details_of_xml i =
  let r_progress_details_on_rollback = ref None in
  let r_instances_to_update_on_rollback = ref None in
  let r_percentage_complete_on_rollback = ref None in
  let r_rollback_start_time = ref None in
  let r_rollback_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ProgressDetailsOnRollback";
      "InstancesToUpdateOnRollback";
      "PercentageCompleteOnRollback";
      "RollbackStartTime";
      "RollbackReason";
    ] (fun tag _ ->
      match tag with
      | "ProgressDetailsOnRollback" ->
          r_progress_details_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressDetailsOnRollback"
                 (fun i _ -> instance_refresh_progress_details_of_xml i)
                 ())
      | "InstancesToUpdateOnRollback" ->
          r_instances_to_update_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdateOnRollback"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "PercentageCompleteOnRollback" ->
          r_percentage_complete_on_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleteOnRollback"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "RollbackStartTime" ->
          r_rollback_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackStartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "RollbackReason" ->
          r_rollback_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackReason"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     progress_details_on_rollback = ( ! ) r_progress_details_on_rollback;
     instances_to_update_on_rollback = ( ! ) r_instances_to_update_on_rollback;
     percentage_complete_on_rollback = ( ! ) r_percentage_complete_on_rollback;
     rollback_start_time = ( ! ) r_rollback_start_time;
     rollback_reason = ( ! ) r_rollback_reason;
   }
    : rollback_details)

let retry_strategy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "none" -> NONE
   | "retry-with-group-configuration" -> RETRY_WITH_GROUP_CONFIGURATION
   | _ -> failwith "unknown enum value"
    : retry_strategy)

let requested_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let lifecycle_action_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let record_lifecycle_action_heartbeat_type_of_xml i =
  let r_instance_id = ref None in
  let r_lifecycle_action_token = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InstanceId"; "LifecycleActionToken"; "AutoScalingGroupName"; "LifecycleHookName" ]
    (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "LifecycleActionToken" ->
          r_lifecycle_action_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionToken"
                 (fun i _ -> lifecycle_action_token_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = ( ! ) r_instance_id;
     lifecycle_action_token = ( ! ) r_lifecycle_action_token;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
   }
    : record_lifecycle_action_heartbeat_type)

let record_lifecycle_action_heartbeat_answer_of_xml i = ()

let put_warm_pool_type_of_xml i =
  let r_instance_reuse_policy = ref None in
  let r_pool_state = ref None in
  let r_min_size = ref None in
  let r_max_group_prepared_capacity = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceReusePolicy";
      "PoolState";
      "MinSize";
      "MaxGroupPreparedCapacity";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "InstanceReusePolicy" ->
          r_instance_reuse_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceReusePolicy"
                 (fun i _ -> instance_reuse_policy_of_xml i)
                 ())
      | "PoolState" ->
          r_pool_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PoolState"
                 (fun i _ -> warm_pool_state_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> warm_pool_min_size_of_xml i)
                 ())
      | "MaxGroupPreparedCapacity" ->
          r_max_group_prepared_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxGroupPreparedCapacity"
                 (fun i _ -> max_group_prepared_capacity_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_reuse_policy = ( ! ) r_instance_reuse_policy;
     pool_state = ( ! ) r_pool_state;
     min_size = ( ! ) r_min_size;
     max_group_prepared_capacity = ( ! ) r_max_group_prepared_capacity;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : put_warm_pool_type)

let put_warm_pool_answer_of_xml i = ()

let put_scheduled_update_group_action_type_of_xml i =
  let r_time_zone = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_recurrence = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_time = ref None in
  let r_scheduled_action_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TimeZone";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "Recurrence";
      "EndTime";
      "StartTime";
      "Time";
      "ScheduledActionName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "TimeZone" ->
          r_time_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "Recurrence" ->
          r_recurrence :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recurrence"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Time" ->
          r_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Time" (fun i _ -> timestamp_type_of_xml i) ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     time_zone = ( ! ) r_time_zone;
     desired_capacity = ( ! ) r_desired_capacity;
     max_size = ( ! ) r_max_size;
     min_size = ( ! ) r_min_size;
     recurrence = ( ! ) r_recurrence;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     time = ( ! ) r_time;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : put_scheduled_update_group_action_type)

let already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : already_exists_fault)

let put_scaling_policy_type_of_xml i =
  let r_predictive_scaling_configuration = ref None in
  let r_enabled = ref None in
  let r_target_tracking_configuration = ref None in
  let r_estimated_instance_warmup = ref None in
  let r_step_adjustments = ref None in
  let r_metric_aggregation_type = ref None in
  let r_cooldown = ref None in
  let r_scaling_adjustment = ref None in
  let r_min_adjustment_magnitude = ref None in
  let r_min_adjustment_step = ref None in
  let r_adjustment_type = ref None in
  let r_policy_type = ref None in
  let r_policy_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PredictiveScalingConfiguration";
      "Enabled";
      "TargetTrackingConfiguration";
      "EstimatedInstanceWarmup";
      "StepAdjustments";
      "MetricAggregationType";
      "Cooldown";
      "ScalingAdjustment";
      "MinAdjustmentMagnitude";
      "MinAdjustmentStep";
      "AdjustmentType";
      "PolicyType";
      "PolicyName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "PredictiveScalingConfiguration" ->
          r_predictive_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictiveScalingConfiguration"
                 (fun i _ -> predictive_scaling_configuration_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> scaling_policy_enabled_of_xml i)
                 ())
      | "TargetTrackingConfiguration" ->
          r_target_tracking_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTrackingConfiguration"
                 (fun i _ -> target_tracking_configuration_of_xml i)
                 ())
      | "EstimatedInstanceWarmup" ->
          r_estimated_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedInstanceWarmup"
                 (fun i _ -> estimated_instance_warmup_of_xml i)
                 ())
      | "StepAdjustments" ->
          r_step_adjustments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StepAdjustments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> step_adjustment_of_xml i)
                     ())
                 ())
      | "MetricAggregationType" ->
          r_metric_aggregation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricAggregationType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "Cooldown" ->
          r_cooldown :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cooldown" (fun i _ -> cooldown_of_xml i) ())
      | "ScalingAdjustment" ->
          r_scaling_adjustment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingAdjustment"
                 (fun i _ -> policy_increment_of_xml i)
                 ())
      | "MinAdjustmentMagnitude" ->
          r_min_adjustment_magnitude :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentMagnitude"
                 (fun i _ -> min_adjustment_magnitude_of_xml i)
                 ())
      | "MinAdjustmentStep" ->
          r_min_adjustment_step :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinAdjustmentStep"
                 (fun i _ -> min_adjustment_step_of_xml i)
                 ())
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "PolicyType" ->
          r_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     predictive_scaling_configuration = ( ! ) r_predictive_scaling_configuration;
     enabled = ( ! ) r_enabled;
     target_tracking_configuration = ( ! ) r_target_tracking_configuration;
     estimated_instance_warmup = ( ! ) r_estimated_instance_warmup;
     step_adjustments = ( ! ) r_step_adjustments;
     metric_aggregation_type = ( ! ) r_metric_aggregation_type;
     cooldown = ( ! ) r_cooldown;
     scaling_adjustment = ( ! ) r_scaling_adjustment;
     min_adjustment_magnitude = ( ! ) r_min_adjustment_magnitude;
     min_adjustment_step = ( ! ) r_min_adjustment_step;
     adjustment_type = ( ! ) r_adjustment_type;
     policy_type = ( ! ) r_policy_type;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : put_scaling_policy_type)

let policy_arn_type_of_xml i =
  let r_alarms = ref None in
  let r_policy_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Alarms"; "PolicyARN" ] (fun tag _ ->
      match tag with
      | "Alarms" ->
          r_alarms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alarms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alarm_of_xml i) ())
                 ())
      | "PolicyARN" ->
          r_policy_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ alarms = ( ! ) r_alarms; policy_ar_n = ( ! ) r_policy_ar_n } : policy_arn_type)

let auto_scaling_notification_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let put_notification_configuration_type_of_xml i =
  let r_notification_types = ref None in
  let r_topic_ar_n = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NotificationTypes"; "TopicARN"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "NotificationTypes" ->
          r_notification_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     notification_types =
       Smaws_Lib.Xml.Parse.required "NotificationTypes" (( ! ) r_notification_types) i;
     topic_ar_n = Smaws_Lib.Xml.Parse.required "TopicARN" (( ! ) r_topic_ar_n) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : put_notification_configuration_type)

let lifecycle_transition_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let notification_target_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let any_printable_ascii_string_max_len4000_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let heartbeat_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let lifecycle_action_result_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_lifecycle_hook_type_of_xml i =
  let r_default_result = ref None in
  let r_heartbeat_timeout = ref None in
  let r_notification_metadata = ref None in
  let r_notification_target_ar_n = ref None in
  let r_role_ar_n = ref None in
  let r_lifecycle_transition = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultResult";
      "HeartbeatTimeout";
      "NotificationMetadata";
      "NotificationTargetARN";
      "RoleARN";
      "LifecycleTransition";
      "AutoScalingGroupName";
      "LifecycleHookName";
    ] (fun tag _ ->
      match tag with
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_result = ( ! ) r_default_result;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     notification_metadata = ( ! ) r_notification_metadata;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     role_ar_n = ( ! ) r_role_ar_n;
     lifecycle_transition = ( ! ) r_lifecycle_transition;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
   }
    : put_lifecycle_hook_type)

let put_lifecycle_hook_answer_of_xml i = ()

let process_type_of_xml i =
  let r_process_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProcessName" ] (fun tag _ ->
      match tag with
      | "ProcessName" ->
          r_process_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProcessName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ process_name = Smaws_Lib.Xml.Parse.required "ProcessName" (( ! ) r_process_name) i }
    : process_type)

let processes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> process_type_of_xml i) ()

let processes_type_of_xml i =
  let r_processes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Processes" ] (fun tag _ ->
      match tag with
      | "Processes" ->
          r_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Processes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> process_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ processes = ( ! ) r_processes } : processes_type)

let predictive_scaling_forecast_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_scale_of_xml i) ()

let predictive_scaling_forecast_timestamps_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> timestamp_type_of_xml i) ()

let policy_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len64_of_xml i) ()

let policy_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_of_xml i) ()

let policies_type_of_xml i =
  let r_next_token = ref None in
  let r_scaling_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ScalingPolicies" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "ScalingPolicies" ->
          r_scaling_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scaling_policy_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; scaling_policies = ( ! ) r_scaling_policies } : policies_type)

let number_of_launch_configurations_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let number_of_auto_scaling_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let notification_configuration_of_xml i =
  let r_notification_type = ref None in
  let r_topic_ar_n = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NotificationType"; "TopicARN"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     notification_type = ( ! ) r_notification_type;
     topic_ar_n = ( ! ) r_topic_ar_n;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : notification_configuration)

let notification_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> notification_configuration_of_xml i) ()

let no_device_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let monitoring_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let metric_granularity_type_of_xml i =
  let r_granularity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Granularity" ] (fun tag _ ->
      match tag with
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ granularity = ( ! ) r_granularity } : metric_granularity_type)

let metric_granularity_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_granularity_type_of_xml i) ()

let metric_collection_type_of_xml i =
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metric" ] (fun tag _ ->
      match tag with
      | "Metric" ->
          r_metric :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metric"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metric = ( ! ) r_metric } : metric_collection_type)

let metric_collection_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> metric_collection_type_of_xml i) ()

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_number_of_launch_configurations_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_number_of_auto_scaling_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let load_forecast_of_xml i =
  let r_metric_specification = ref None in
  let r_values = ref None in
  let r_timestamps = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MetricSpecification"; "Values"; "Timestamps" ]
    (fun tag _ ->
      match tag with
      | "MetricSpecification" ->
          r_metric_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricSpecification"
                 (fun i _ -> predictive_scaling_metric_specification_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_scale_of_xml i)
                     ())
                 ())
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> timestamp_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metric_specification =
       Smaws_Lib.Xml.Parse.required "MetricSpecification" (( ! ) r_metric_specification) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     timestamps = Smaws_Lib.Xml.Parse.required "Timestamps" (( ! ) r_timestamps) i;
   }
    : load_forecast)

let load_forecasts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_forecast_of_xml i) ()

let load_balancer_target_group_state_of_xml i =
  let r_state = ref None in
  let r_load_balancer_target_group_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "State"; "LoadBalancerTargetGroupARN" ]
    (fun tag _ ->
      match tag with
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LoadBalancerTargetGroupARN" ->
          r_load_balancer_target_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerTargetGroupARN"
                 (fun i _ -> xml_string_max_len511_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     state = ( ! ) r_state;
     load_balancer_target_group_ar_n = ( ! ) r_load_balancer_target_group_ar_n;
   }
    : load_balancer_target_group_state)

let load_balancer_target_group_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> load_balancer_target_group_state_of_xml i)
    ()

let load_balancer_state_of_xml i =
  let r_state = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "State"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ state = ( ! ) r_state; load_balancer_name = ( ! ) r_load_balancer_name } : load_balancer_state)

let load_balancer_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_state_of_xml i) ()

let load_balancer_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let lifecycle_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Warmed:Hibernated" -> WARMED_HIBERNATED
   | "Warmed:Running" -> WARMED_RUNNING
   | "Warmed:Stopped" -> WARMED_STOPPED
   | "Warmed:Terminated" -> WARMED_TERMINATED
   | "Warmed:Terminating:Retained" -> WARMED_TERMINATING_RETAINED
   | "Warmed:Terminating:Proceed" -> WARMED_TERMINATING_PROCEED
   | "Warmed:Terminating:Wait" -> WARMED_TERMINATING_WAIT
   | "Warmed:Terminating" -> WARMED_TERMINATING
   | "Warmed:Pending:Retained" -> WARMED_PENDING_RETAINED
   | "Warmed:Pending:Proceed" -> WARMED_PENDING_PROCEED
   | "Warmed:Pending:Wait" -> WARMED_PENDING_WAIT
   | "Warmed:Pending" -> WARMED_PENDING
   | "RootVolumeReplaced" -> ROOT_VOLUME_REPLACED
   | "ReplacingRootVolume:Proceed" -> REPLACING_ROOT_VOLUME_PROCEED
   | "ReplacingRootVolume:Wait" -> REPLACING_ROOT_VOLUME_WAIT
   | "ReplacingRootVolume" -> REPLACING_ROOT_VOLUME
   | "Standby" -> STANDBY
   | "EnteringStandby" -> ENTERING_STANDBY
   | "Detached" -> DETACHED
   | "Detaching" -> DETACHING
   | "Terminated" -> TERMINATED
   | "Terminating:Retained" -> TERMINATING_RETAINED
   | "Terminating:Proceed" -> TERMINATING_PROCEED
   | "Terminating:Wait" -> TERMINATING_WAIT
   | "Terminating" -> TERMINATING
   | "InService" -> IN_SERVICE
   | "Quarantined" -> QUARANTINED
   | "Pending:Proceed" -> PENDING_PROCEED
   | "Pending:Wait" -> PENDING_WAIT
   | "Pending" -> PENDING
   | _ -> failwith "unknown enum value"
    : lifecycle_state)

let global_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let lifecycle_hook_of_xml i =
  let r_default_result = ref None in
  let r_global_timeout = ref None in
  let r_heartbeat_timeout = ref None in
  let r_notification_metadata = ref None in
  let r_role_ar_n = ref None in
  let r_notification_target_ar_n = ref None in
  let r_lifecycle_transition = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultResult";
      "GlobalTimeout";
      "HeartbeatTimeout";
      "NotificationMetadata";
      "RoleARN";
      "NotificationTargetARN";
      "LifecycleTransition";
      "AutoScalingGroupName";
      "LifecycleHookName";
    ] (fun tag _ ->
      match tag with
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "GlobalTimeout" ->
          r_global_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalTimeout"
                 (fun i _ -> global_timeout_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_result = ( ! ) r_default_result;
     global_timeout = ( ! ) r_global_timeout;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     notification_metadata = ( ! ) r_notification_metadata;
     role_ar_n = ( ! ) r_role_ar_n;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     lifecycle_transition = ( ! ) r_lifecycle_transition;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     lifecycle_hook_name = ( ! ) r_lifecycle_hook_name;
   }
    : lifecycle_hook)

let lifecycle_hooks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> lifecycle_hook_of_xml i) ()

let lifecycle_hook_specification_of_xml i =
  let r_role_ar_n = ref None in
  let r_notification_target_ar_n = ref None in
  let r_default_result = ref None in
  let r_heartbeat_timeout = ref None in
  let r_notification_metadata = ref None in
  let r_lifecycle_transition = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RoleARN";
      "NotificationTargetARN";
      "DefaultResult";
      "HeartbeatTimeout";
      "NotificationMetadata";
      "LifecycleTransition";
      "LifecycleHookName";
    ] (fun tag _ ->
      match tag with
      | "RoleARN" ->
          r_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "NotificationTargetARN" ->
          r_notification_target_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTargetARN"
                 (fun i _ -> notification_target_resource_name_of_xml i)
                 ())
      | "DefaultResult" ->
          r_default_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "HeartbeatTimeout" ->
          r_heartbeat_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeartbeatTimeout"
                 (fun i _ -> heartbeat_timeout_of_xml i)
                 ())
      | "NotificationMetadata" ->
          r_notification_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationMetadata"
                 (fun i _ -> any_printable_ascii_string_max_len4000_of_xml i)
                 ())
      | "LifecycleTransition" ->
          r_lifecycle_transition :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleTransition"
                 (fun i _ -> lifecycle_transition_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_ar_n = ( ! ) r_role_ar_n;
     notification_target_ar_n = ( ! ) r_notification_target_ar_n;
     default_result = ( ! ) r_default_result;
     heartbeat_timeout = ( ! ) r_heartbeat_timeout;
     notification_metadata = ( ! ) r_notification_metadata;
     lifecycle_transition =
       Smaws_Lib.Xml.Parse.required "LifecycleTransition" (( ! ) r_lifecycle_transition) i;
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
   }
    : lifecycle_hook_specification)

let lifecycle_hook_specifications_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> lifecycle_hook_specification_of_xml i)
    ()

let lifecycle_hook_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ascii_string_max_len255_of_xml i) ()

let client_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let instance_collection_of_xml i =
  let r_instance_ids = ref None in
  let r_availability_zone_id = ref None in
  let r_availability_zone = ref None in
  let r_subnet_id = ref None in
  let r_market_type = ref None in
  let r_instance_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceIds";
      "AvailabilityZoneId";
      "AvailabilityZone";
      "SubnetId";
      "MarketType";
      "InstanceType";
    ] (fun tag _ ->
      match tag with
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MarketType" ->
          r_market_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MarketType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ids = ( ! ) r_instance_ids;
     availability_zone_id = ( ! ) r_availability_zone_id;
     availability_zone = ( ! ) r_availability_zone;
     subnet_id = ( ! ) r_subnet_id;
     market_type = ( ! ) r_market_type;
     instance_type = ( ! ) r_instance_type;
   }
    : instance_collection)

let instance_collections_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_collection_of_xml i) ()

let launch_instances_error_of_xml i =
  let r_error_message = ref None in
  let r_error_code = ref None in
  let r_availability_zone_id = ref None in
  let r_availability_zone = ref None in
  let r_subnet_id = ref None in
  let r_market_type = ref None in
  let r_instance_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ErrorMessage";
      "ErrorCode";
      "AvailabilityZoneId";
      "AvailabilityZone";
      "SubnetId";
      "MarketType";
      "InstanceType";
    ] (fun tag _ ->
      match tag with
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "MarketType" ->
          r_market_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MarketType"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     error_message = ( ! ) r_error_message;
     error_code = ( ! ) r_error_code;
     availability_zone_id = ( ! ) r_availability_zone_id;
     availability_zone = ( ! ) r_availability_zone;
     subnet_id = ( ! ) r_subnet_id;
     market_type = ( ! ) r_market_type;
     instance_type = ( ! ) r_instance_type;
   }
    : launch_instances_error)

let launch_instances_errors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_instances_error_of_xml i) ()

let launch_instances_result_of_xml i =
  let r_errors = ref None in
  let r_instances = ref None in
  let r_client_token = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Errors"; "Instances"; "ClientToken"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_instances_error_of_xml i)
                     ())
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_collection_of_xml i)
                     ())
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     errors = ( ! ) r_errors;
     instances = ( ! ) r_instances;
     client_token = ( ! ) r_client_token;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : launch_instances_result)

let availability_zones_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let availability_zone_ids_limit1_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let launch_instances_request_of_xml i =
  let r_retry_strategy = ref None in
  let r_subnet_ids = ref None in
  let r_availability_zone_ids = ref None in
  let r_availability_zones = ref None in
  let r_client_token = ref None in
  let r_requested_capacity = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RetryStrategy";
      "SubnetIds";
      "AvailabilityZoneIds";
      "AvailabilityZones";
      "ClientToken";
      "RequestedCapacity";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "RetryStrategy" ->
          r_retry_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetryStrategy"
                 (fun i _ -> retry_strategy_of_xml i)
                 ())
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "RequestedCapacity" ->
          r_requested_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestedCapacity"
                 (fun i _ -> requested_capacity_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     retry_strategy = ( ! ) r_retry_strategy;
     subnet_ids = ( ! ) r_subnet_ids;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     availability_zones = ( ! ) r_availability_zones;
     client_token = Smaws_Lib.Xml.Parse.required "ClientToken" (( ! ) r_client_token) i;
     requested_capacity =
       Smaws_Lib.Xml.Parse.required "RequestedCapacity" (( ! ) r_requested_capacity) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : launch_instances_request)

let idempotent_parameter_mismatch_error_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : idempotent_parameter_mismatch_error)

let classic_link_vpc_security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let block_device_ebs_volume_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_volume_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let block_device_ebs_delete_on_termination_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_iops_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_encrypted_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let block_device_ebs_throughput_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let ebs_of_xml i =
  let r_throughput = ref None in
  let r_encrypted = ref None in
  let r_iops = ref None in
  let r_delete_on_termination = ref None in
  let r_volume_type = ref None in
  let r_volume_size = ref None in
  let r_snapshot_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Throughput";
      "Encrypted";
      "Iops";
      "DeleteOnTermination";
      "VolumeType";
      "VolumeSize";
      "SnapshotId";
    ] (fun tag _ ->
      match tag with
      | "Throughput" ->
          r_throughput :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Throughput"
                 (fun i _ -> block_device_ebs_throughput_of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> block_device_ebs_encrypted_of_xml i)
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops"
                 (fun i _ -> block_device_ebs_iops_of_xml i)
                 ())
      | "DeleteOnTermination" ->
          r_delete_on_termination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteOnTermination"
                 (fun i _ -> block_device_ebs_delete_on_termination_of_xml i)
                 ())
      | "VolumeType" ->
          r_volume_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VolumeType"
                 (fun i _ -> block_device_ebs_volume_type_of_xml i)
                 ())
      | "VolumeSize" ->
          r_volume_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VolumeSize"
                 (fun i _ -> block_device_ebs_volume_size_of_xml i)
                 ())
      | "SnapshotId" ->
          r_snapshot_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     throughput = ( ! ) r_throughput;
     encrypted = ( ! ) r_encrypted;
     iops = ( ! ) r_iops;
     delete_on_termination = ( ! ) r_delete_on_termination;
     volume_type = ( ! ) r_volume_type;
     volume_size = ( ! ) r_volume_size;
     snapshot_id = ( ! ) r_snapshot_id;
   }
    : ebs)

let block_device_mapping_of_xml i =
  let r_no_device = ref None in
  let r_ebs = ref None in
  let r_device_name = ref None in
  let r_virtual_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NoDevice"; "Ebs"; "DeviceName"; "VirtualName" ]
    (fun tag _ ->
      match tag with
      | "NoDevice" ->
          r_no_device :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoDevice" (fun i _ -> no_device_of_xml i) ())
      | "Ebs" ->
          r_ebs := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Ebs" (fun i _ -> ebs_of_xml i) ())
      | "DeviceName" ->
          r_device_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeviceName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "VirtualName" ->
          r_virtual_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     no_device = ( ! ) r_no_device;
     ebs = ( ! ) r_ebs;
     device_name = Smaws_Lib.Xml.Parse.required "DeviceName" (( ! ) r_device_name) i;
     virtual_name = ( ! ) r_virtual_name;
   }
    : block_device_mapping)

let block_device_mappings_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> block_device_mapping_of_xml i) ()

let instance_monitoring_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> monitoring_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : instance_monitoring)

let ebs_optimized_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let associate_public_ip_address_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_metadata_http_tokens_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "required" -> Required
   | "optional" -> Optional
   | _ -> failwith "unknown enum value"
    : instance_metadata_http_tokens_state)

let instance_metadata_http_put_response_hop_limit_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let instance_metadata_endpoint_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "enabled" -> Enabled | "disabled" -> Disabled | _ -> failwith "unknown enum value"
    : instance_metadata_endpoint_state)

let instance_metadata_options_of_xml i =
  let r_http_endpoint = ref None in
  let r_http_put_response_hop_limit = ref None in
  let r_http_tokens = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HttpEndpoint"; "HttpPutResponseHopLimit"; "HttpTokens" ] (fun tag _ ->
      match tag with
      | "HttpEndpoint" ->
          r_http_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpEndpoint"
                 (fun i _ -> instance_metadata_endpoint_state_of_xml i)
                 ())
      | "HttpPutResponseHopLimit" ->
          r_http_put_response_hop_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpPutResponseHopLimit"
                 (fun i _ -> instance_metadata_http_put_response_hop_limit_of_xml i)
                 ())
      | "HttpTokens" ->
          r_http_tokens :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpTokens"
                 (fun i _ -> instance_metadata_http_tokens_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     http_endpoint = ( ! ) r_http_endpoint;
     http_put_response_hop_limit = ( ! ) r_http_put_response_hop_limit;
     http_tokens = ( ! ) r_http_tokens;
   }
    : instance_metadata_options)

let launch_configuration_of_xml i =
  let r_metadata_options = ref None in
  let r_placement_tenancy = ref None in
  let r_associate_public_ip_address = ref None in
  let r_ebs_optimized = ref None in
  let r_created_time = ref None in
  let r_iam_instance_profile = ref None in
  let r_spot_price = ref None in
  let r_instance_monitoring = ref None in
  let r_block_device_mappings = ref None in
  let r_ramdisk_id = ref None in
  let r_kernel_id = ref None in
  let r_instance_type = ref None in
  let r_user_data = ref None in
  let r_classic_link_vpc_security_groups = ref None in
  let r_classic_link_vpc_id = ref None in
  let r_security_groups = ref None in
  let r_key_name = ref None in
  let r_image_id = ref None in
  let r_launch_configuration_ar_n = ref None in
  let r_launch_configuration_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetadataOptions";
      "PlacementTenancy";
      "AssociatePublicIpAddress";
      "EbsOptimized";
      "CreatedTime";
      "IamInstanceProfile";
      "SpotPrice";
      "InstanceMonitoring";
      "BlockDeviceMappings";
      "RamdiskId";
      "KernelId";
      "InstanceType";
      "UserData";
      "ClassicLinkVPCSecurityGroups";
      "ClassicLinkVPCId";
      "SecurityGroups";
      "KeyName";
      "ImageId";
      "LaunchConfigurationARN";
      "LaunchConfigurationName";
    ] (fun tag _ ->
      match tag with
      | "MetadataOptions" ->
          r_metadata_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetadataOptions"
                 (fun i _ -> instance_metadata_options_of_xml i)
                 ())
      | "PlacementTenancy" ->
          r_placement_tenancy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementTenancy"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "AssociatePublicIpAddress" ->
          r_associate_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatePublicIpAddress"
                 (fun i _ -> associate_public_ip_address_of_xml i)
                 ())
      | "EbsOptimized" ->
          r_ebs_optimized :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EbsOptimized"
                 (fun i _ -> ebs_optimized_of_xml i)
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "IamInstanceProfile" ->
          r_iam_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamInstanceProfile"
                 (fun i _ -> xml_string_max_len1600_of_xml i)
                 ())
      | "SpotPrice" ->
          r_spot_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotPrice" (fun i _ -> spot_price_of_xml i) ())
      | "InstanceMonitoring" ->
          r_instance_monitoring :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMonitoring"
                 (fun i _ -> instance_monitoring_of_xml i)
                 ())
      | "BlockDeviceMappings" ->
          r_block_device_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BlockDeviceMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> block_device_mapping_of_xml i)
                     ())
                 ())
      | "RamdiskId" ->
          r_ramdisk_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RamdiskId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KernelId" ->
          r_kernel_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KernelId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "UserData" ->
          r_user_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserData"
                 (fun i _ -> xml_string_user_data_of_xml i)
                 ())
      | "ClassicLinkVPCSecurityGroups" ->
          r_classic_link_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "ClassicLinkVPCId" ->
          r_classic_link_vpc_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "KeyName" ->
          r_key_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchConfigurationARN" ->
          r_launch_configuration_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metadata_options = ( ! ) r_metadata_options;
     placement_tenancy = ( ! ) r_placement_tenancy;
     associate_public_ip_address = ( ! ) r_associate_public_ip_address;
     ebs_optimized = ( ! ) r_ebs_optimized;
     created_time = Smaws_Lib.Xml.Parse.required "CreatedTime" (( ! ) r_created_time) i;
     iam_instance_profile = ( ! ) r_iam_instance_profile;
     spot_price = ( ! ) r_spot_price;
     instance_monitoring = ( ! ) r_instance_monitoring;
     block_device_mappings = ( ! ) r_block_device_mappings;
     ramdisk_id = ( ! ) r_ramdisk_id;
     kernel_id = ( ! ) r_kernel_id;
     instance_type = Smaws_Lib.Xml.Parse.required "InstanceType" (( ! ) r_instance_type) i;
     user_data = ( ! ) r_user_data;
     classic_link_vpc_security_groups = ( ! ) r_classic_link_vpc_security_groups;
     classic_link_vpc_id = ( ! ) r_classic_link_vpc_id;
     security_groups = ( ! ) r_security_groups;
     key_name = ( ! ) r_key_name;
     image_id = Smaws_Lib.Xml.Parse.required "ImageId" (( ! ) r_image_id) i;
     launch_configuration_ar_n = ( ! ) r_launch_configuration_ar_n;
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
   }
    : launch_configuration)

let launch_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_configuration_of_xml i) ()

let launch_configurations_type_of_xml i =
  let r_next_token = ref None in
  let r_launch_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "LaunchConfigurations" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "LaunchConfigurations" ->
          r_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_configuration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     launch_configurations =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurations" (( ! ) r_launch_configurations) i;
   }
    : launch_configurations_type)

let launch_configuration_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let launch_configuration_names_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_launch_configuration_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "NextToken"; "LaunchConfigurationNames" ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "LaunchConfigurationNames" ->
          r_launch_configuration_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     launch_configuration_names = ( ! ) r_launch_configuration_names;
   }
    : launch_configuration_names_type)

let launch_configuration_name_type_of_xml i =
  let r_launch_configuration_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LaunchConfigurationName" ] (fun tag _ ->
      match tag with
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
   }
    : launch_configuration_name_type)

let invalid_next_token_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_next_token)

let instance_of_xml i =
  let r_weighted_capacity = ref None in
  let r_protected_from_scale_in = ref None in
  let r_image_id = ref None in
  let r_launch_template = ref None in
  let r_launch_configuration_name = ref None in
  let r_health_status = ref None in
  let r_lifecycle_state = ref None in
  let r_availability_zone_id = ref None in
  let r_availability_zone = ref None in
  let r_instance_type = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "WeightedCapacity";
      "ProtectedFromScaleIn";
      "ImageId";
      "LaunchTemplate";
      "LaunchConfigurationName";
      "HealthStatus";
      "LifecycleState";
      "AvailabilityZoneId";
      "AvailabilityZone";
      "InstanceType";
      "InstanceId";
    ] (fun tag _ ->
      match tag with
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> lifecycle_state_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     weighted_capacity = ( ! ) r_weighted_capacity;
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
     image_id = ( ! ) r_image_id;
     launch_template = ( ! ) r_launch_template;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     lifecycle_state = Smaws_Lib.Xml.Parse.required "LifecycleState" (( ! ) r_lifecycle_state) i;
     availability_zone_id = ( ! ) r_availability_zone_id;
     availability_zone =
       Smaws_Lib.Xml.Parse.required "AvailabilityZone" (( ! ) r_availability_zone) i;
     instance_type = ( ! ) r_instance_type;
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
   }
    : instance)

let instances_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ()

let instance_refresh_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Baking" -> Baking
   | "RollbackSuccessful" -> RollbackSuccessful
   | "RollbackFailed" -> RollbackFailed
   | "RollbackInProgress" -> RollbackInProgress
   | "Cancelled" -> Cancelled
   | "Cancelling" -> Cancelling
   | "Failed" -> Failed
   | "Successful" -> Successful
   | "InProgress" -> InProgress
   | "Pending" -> Pending
   | _ -> failwith "unknown enum value"
    : instance_refresh_status)

let instance_refresh_of_xml i =
  let r_strategy = ref None in
  let r_rollback_details = ref None in
  let r_desired_configuration = ref None in
  let r_preferences = ref None in
  let r_progress_details = ref None in
  let r_instances_to_update = ref None in
  let r_percentage_complete = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Strategy";
      "RollbackDetails";
      "DesiredConfiguration";
      "Preferences";
      "ProgressDetails";
      "InstancesToUpdate";
      "PercentageComplete";
      "EndTime";
      "StartTime";
      "StatusReason";
      "Status";
      "AutoScalingGroupName";
      "InstanceRefreshId";
    ] (fun tag _ ->
      match tag with
      | "Strategy" ->
          r_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Strategy"
                 (fun i _ -> refresh_strategy_of_xml i)
                 ())
      | "RollbackDetails" ->
          r_rollback_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackDetails"
                 (fun i _ -> rollback_details_of_xml i)
                 ())
      | "DesiredConfiguration" ->
          r_desired_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredConfiguration"
                 (fun i _ -> desired_configuration_of_xml i)
                 ())
      | "Preferences" ->
          r_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Preferences"
                 (fun i _ -> refresh_preferences_of_xml i)
                 ())
      | "ProgressDetails" ->
          r_progress_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressDetails"
                 (fun i _ -> instance_refresh_progress_details_of_xml i)
                 ())
      | "InstancesToUpdate" ->
          r_instances_to_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesToUpdate"
                 (fun i _ -> instances_to_update_of_xml i)
                 ())
      | "PercentageComplete" ->
          r_percentage_complete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageComplete"
                 (fun i _ -> int_percent_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> xml_string_max_len1023_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> instance_refresh_status_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     strategy = ( ! ) r_strategy;
     rollback_details = ( ! ) r_rollback_details;
     desired_configuration = ( ! ) r_desired_configuration;
     preferences = ( ! ) r_preferences;
     progress_details = ( ! ) r_progress_details;
     instances_to_update = ( ! ) r_instances_to_update;
     percentage_complete = ( ! ) r_percentage_complete;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     instance_refresh_id = ( ! ) r_instance_refresh_id;
   }
    : instance_refresh)

let instance_refreshes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_refresh_of_xml i) ()

let instance_refresh_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let include_instances_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let include_deleted_groups_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_predictive_scaling_forecast_type_of_xml i =
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_policy_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EndTime"; "StartTime"; "PolicyName"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     end_time = Smaws_Lib.Xml.Parse.required "EndTime" (( ! ) r_end_time) i;
     start_time = Smaws_Lib.Xml.Parse.required "StartTime" (( ! ) r_start_time) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : get_predictive_scaling_forecast_type)

let capacity_forecast_of_xml i =
  let r_values = ref None in
  let r_timestamps = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Timestamps" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_scale_of_xml i)
                     ())
                 ())
      | "Timestamps" ->
          r_timestamps :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamps"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> timestamp_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     timestamps = Smaws_Lib.Xml.Parse.required "Timestamps" (( ! ) r_timestamps) i;
   }
    : capacity_forecast)

let get_predictive_scaling_forecast_answer_of_xml i =
  let r_update_time = ref None in
  let r_capacity_forecast = ref None in
  let r_load_forecast = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UpdateTime"; "CapacityForecast"; "LoadForecast" ]
    (fun tag _ ->
      match tag with
      | "UpdateTime" ->
          r_update_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "CapacityForecast" ->
          r_capacity_forecast :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityForecast"
                 (fun i _ -> capacity_forecast_of_xml i)
                 ())
      | "LoadForecast" ->
          r_load_forecast :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadForecast"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_forecast_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     update_time = Smaws_Lib.Xml.Parse.required "UpdateTime" (( ! ) r_update_time) i;
     capacity_forecast =
       Smaws_Lib.Xml.Parse.required "CapacityForecast" (( ! ) r_capacity_forecast) i;
     load_forecast = Smaws_Lib.Xml.Parse.required "LoadForecast" (( ! ) r_load_forecast) i;
   }
    : get_predictive_scaling_forecast_answer)

let force_delete_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let filter_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> xml_string_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; name = ( ! ) r_name } : filter)

let filters_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ()

let failed_scheduled_update_group_action_request_of_xml i =
  let r_error_message = ref None in
  let r_error_code = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ErrorMessage"; "ErrorCode"; "ScheduledActionName" ] (fun tag _ ->
      match tag with
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> xml_string_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     error_message = ( ! ) r_error_message;
     error_code = ( ! ) r_error_code;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : failed_scheduled_update_group_action_request)

let failed_scheduled_update_group_action_requests_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
    ()

let exit_standby_query_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "InstanceIds" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_ids = ( ! ) r_instance_ids;
   }
    : exit_standby_query)

let activities_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ()

let exit_standby_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : exit_standby_answer)

let execute_policy_type_of_xml i =
  let r_breach_threshold = ref None in
  let r_metric_value = ref None in
  let r_honor_cooldown = ref None in
  let r_policy_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "BreachThreshold"; "MetricValue"; "HonorCooldown"; "PolicyName"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "BreachThreshold" ->
          r_breach_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachThreshold"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "MetricValue" ->
          r_metric_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetricValue"
                 (fun i _ -> metric_scale_of_xml i)
                 ())
      | "HonorCooldown" ->
          r_honor_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HonorCooldown"
                 (fun i _ -> honor_cooldown_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     breach_threshold = ( ! ) r_breach_threshold;
     metric_value = ( ! ) r_metric_value;
     honor_cooldown = ( ! ) r_honor_cooldown;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : execute_policy_type)

let enter_standby_query_of_xml i =
  let r_should_decrement_desired_capacity = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ShouldDecrementDesiredCapacity"; "AutoScalingGroupName"; "InstanceIds" ] (fun tag _ ->
      match tag with
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_ids = ( ! ) r_instance_ids;
   }
    : enter_standby_query)

let enter_standby_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : enter_standby_answer)

let enabled_metric_of_xml i =
  let r_granularity = ref None in
  let r_metric = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Granularity"; "Metric" ] (fun tag _ ->
      match tag with
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Metric" ->
          r_metric :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metric"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ granularity = ( ! ) r_granularity; metric = ( ! ) r_metric } : enabled_metric)

let enabled_metrics_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> enabled_metric_of_xml i) ()

let enable_metrics_collection_query_of_xml i =
  let r_granularity = ref None in
  let r_metrics = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Granularity"; "Metrics"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     granularity = Smaws_Lib.Xml.Parse.required "Granularity" (( ! ) r_granularity) i;
     metrics = ( ! ) r_metrics;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : enable_metrics_collection_query)

let disable_metrics_collection_query_of_xml i =
  let r_metrics = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metrics"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metrics = ( ! ) r_metrics;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : disable_metrics_collection_query)

let detach_traffic_sources_type_of_xml i =
  let r_traffic_sources = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrafficSources"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     traffic_sources = Smaws_Lib.Xml.Parse.required "TrafficSources" (( ! ) r_traffic_sources) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : detach_traffic_sources_type)

let detach_traffic_sources_result_type_of_xml i = ()

let detach_load_balancers_type_of_xml i =
  let r_load_balancer_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerNames"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : detach_load_balancers_type)

let detach_load_balancers_result_type_of_xml i = ()

let detach_load_balancer_target_groups_type_of_xml i =
  let r_target_group_ar_ns = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroupARNs"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_group_ar_ns =
       Smaws_Lib.Xml.Parse.required "TargetGroupARNs" (( ! ) r_target_group_ar_ns) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : detach_load_balancer_target_groups_type)

let detach_load_balancer_target_groups_result_type_of_xml i = ()

let detach_instances_query_of_xml i =
  let r_should_decrement_desired_capacity = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ShouldDecrementDesiredCapacity"; "AutoScalingGroupName"; "InstanceIds" ] (fun tag _ ->
      match tag with
      | "ShouldDecrementDesiredCapacity" ->
          r_should_decrement_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShouldDecrementDesiredCapacity"
                 (fun i _ -> should_decrement_desired_capacity_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     should_decrement_desired_capacity =
       Smaws_Lib.Xml.Parse.required "ShouldDecrementDesiredCapacity"
         (( ! ) r_should_decrement_desired_capacity)
         i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_ids = ( ! ) r_instance_ids;
   }
    : detach_instances_query)

let detach_instances_answer_of_xml i =
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Activities" ] (fun tag _ ->
      match tag with
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ activities = ( ! ) r_activities } : detach_instances_answer)

let describe_warm_pool_type_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxRecords"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_warm_pool_type)

let describe_warm_pool_answer_of_xml i =
  let r_next_token = ref None in
  let r_instances = ref None in
  let r_warm_pool_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Instances"; "WarmPoolConfiguration" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "WarmPoolConfiguration" ->
          r_warm_pool_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolConfiguration"
                 (fun i _ -> warm_pool_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     instances = ( ! ) r_instances;
     warm_pool_configuration = ( ! ) r_warm_pool_configuration;
   }
    : describe_warm_pool_answer)

let describe_traffic_sources_response_of_xml i =
  let r_next_token = ref None in
  let r_traffic_sources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "TrafficSources" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_state_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; traffic_sources = ( ! ) r_traffic_sources }
    : describe_traffic_sources_response)

let describe_traffic_sources_request_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_traffic_source_type = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "NextToken"; "TrafficSourceType"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "TrafficSourceType" ->
          r_traffic_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSourceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     traffic_source_type = ( ! ) r_traffic_source_type;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_traffic_sources_request)

let describe_termination_policy_types_answer_of_xml i =
  let r_termination_policy_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TerminationPolicyTypes" ] (fun tag _ ->
      match tag with
      | "TerminationPolicyTypes" ->
          r_termination_policy_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicyTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ termination_policy_types = ( ! ) r_termination_policy_types }
    : describe_termination_policy_types_answer)

let describe_tags_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxRecords"; "NextToken"; "Filters" ]
    (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_records = ( ! ) r_max_records; next_token = ( ! ) r_next_token; filters = ( ! ) r_filters }
    : describe_tags_type)

let describe_scheduled_actions_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_scheduled_action_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxRecords";
      "NextToken";
      "EndTime";
      "StartTime";
      "ScheduledActionNames";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "ScheduledActionNames" ->
          r_scheduled_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     scheduled_action_names = ( ! ) r_scheduled_action_names;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : describe_scheduled_actions_type)

let activity_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ()

let describe_scaling_activities_type_of_xml i =
  let r_filters = ref None in
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_include_deleted_groups = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_activity_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Filters";
      "NextToken";
      "MaxRecords";
      "IncludeDeletedGroups";
      "AutoScalingGroupName";
      "ActivityIds";
    ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "IncludeDeletedGroups" ->
          r_include_deleted_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeDeletedGroups"
                 (fun i _ -> include_deleted_groups_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ActivityIds" ->
          r_activity_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActivityIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     filters = ( ! ) r_filters;
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     include_deleted_groups = ( ! ) r_include_deleted_groups;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
     activity_ids = ( ! ) r_activity_ids;
   }
    : describe_scaling_activities_type)

let activities_type_of_xml i =
  let r_next_token = ref None in
  let r_activities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Activities" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "Activities" ->
          r_activities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Activities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> activity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     activities = Smaws_Lib.Xml.Parse.required "Activities" (( ! ) r_activities) i;
   }
    : activities_type)

let describe_policies_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_policy_types = ref None in
  let r_policy_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "NextToken"; "PolicyTypes"; "PolicyNames"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "PolicyTypes" ->
          r_policy_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len64_of_xml i)
                     ())
                 ())
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     policy_types = ( ! ) r_policy_types;
     policy_names = ( ! ) r_policy_names;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : describe_policies_type)

let auto_scaling_group_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_max_len255_of_xml i) ()

let describe_notification_configurations_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_auto_scaling_group_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "NextToken"; "AutoScalingGroupNames" ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroupNames" ->
          r_auto_scaling_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     auto_scaling_group_names = ( ! ) r_auto_scaling_group_names;
   }
    : describe_notification_configurations_type)

let describe_notification_configurations_answer_of_xml i =
  let r_next_token = ref None in
  let r_notification_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "NotificationConfigurations" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "NotificationConfigurations" ->
          r_notification_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_configuration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     notification_configurations =
       Smaws_Lib.Xml.Parse.required "NotificationConfigurations"
         (( ! ) r_notification_configurations)
         i;
   }
    : describe_notification_configurations_answer)

let describe_metric_collection_types_answer_of_xml i =
  let r_granularities = ref None in
  let r_metrics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Granularities"; "Metrics" ] (fun tag _ ->
      match tag with
      | "Granularities" ->
          r_granularities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_granularity_type_of_xml i)
                     ())
                 ())
      | "Metrics" ->
          r_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> metric_collection_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ granularities = ( ! ) r_granularities; metrics = ( ! ) r_metrics }
    : describe_metric_collection_types_answer)

let describe_load_balancers_response_of_xml i =
  let r_next_token = ref None in
  let r_load_balancers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "LoadBalancers" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "LoadBalancers" ->
          r_load_balancers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_state_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; load_balancers = ( ! ) r_load_balancers }
    : describe_load_balancers_response)

let describe_load_balancers_request_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxRecords"; "NextToken"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_load_balancers_request)

let describe_load_balancer_target_groups_response_of_xml i =
  let r_next_token = ref None in
  let r_load_balancer_target_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "LoadBalancerTargetGroups" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "LoadBalancerTargetGroups" ->
          r_load_balancer_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerTargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_target_group_state_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     load_balancer_target_groups = ( ! ) r_load_balancer_target_groups;
   }
    : describe_load_balancer_target_groups_response)

let describe_load_balancer_target_groups_request_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxRecords"; "NextToken"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_load_balancer_target_groups_request)

let describe_lifecycle_hooks_type_of_xml i =
  let r_lifecycle_hook_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHookNames"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "LifecycleHookNames" ->
          r_lifecycle_hook_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ascii_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     lifecycle_hook_names = ( ! ) r_lifecycle_hook_names;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_lifecycle_hooks_type)

let describe_lifecycle_hooks_answer_of_xml i =
  let r_lifecycle_hooks = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHooks" ] (fun tag _ ->
      match tag with
      | "LifecycleHooks" ->
          r_lifecycle_hooks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHooks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lifecycle_hook_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ lifecycle_hooks = ( ! ) r_lifecycle_hooks } : describe_lifecycle_hooks_answer)

let describe_lifecycle_hook_types_answer_of_xml i =
  let r_lifecycle_hook_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LifecycleHookTypes" ] (fun tag _ ->
      match tag with
      | "LifecycleHookTypes" ->
          r_lifecycle_hook_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ lifecycle_hook_types = ( ! ) r_lifecycle_hook_types } : describe_lifecycle_hook_types_answer)

let describe_instance_refreshes_type_of_xml i =
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_instance_refresh_ids = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "NextToken"; "InstanceRefreshIds"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "InstanceRefreshIds" ->
          r_instance_refresh_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     instance_refresh_ids = ( ! ) r_instance_refresh_ids;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : describe_instance_refreshes_type)

let describe_instance_refreshes_answer_of_xml i =
  let r_next_token = ref None in
  let r_instance_refreshes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "InstanceRefreshes" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "InstanceRefreshes" ->
          r_instance_refreshes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_refresh_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; instance_refreshes = ( ! ) r_instance_refreshes }
    : describe_instance_refreshes_answer)

let describe_auto_scaling_notification_types_answer_of_xml i =
  let r_auto_scaling_notification_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingNotificationTypes" ] (fun tag _ ->
      match tag with
      | "AutoScalingNotificationTypes" ->
          r_auto_scaling_notification_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingNotificationTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ auto_scaling_notification_types = ( ! ) r_auto_scaling_notification_types }
    : describe_auto_scaling_notification_types_answer)

let describe_auto_scaling_instances_type_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxRecords"; "InstanceIds" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     instance_ids = ( ! ) r_instance_ids;
   }
    : describe_auto_scaling_instances_type)

let auto_scaling_instance_details_of_xml i =
  let r_weighted_capacity = ref None in
  let r_protected_from_scale_in = ref None in
  let r_image_id = ref None in
  let r_launch_template = ref None in
  let r_launch_configuration_name = ref None in
  let r_health_status = ref None in
  let r_lifecycle_state = ref None in
  let r_availability_zone_id = ref None in
  let r_availability_zone = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_instance_type = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "WeightedCapacity";
      "ProtectedFromScaleIn";
      "ImageId";
      "LaunchTemplate";
      "LaunchConfigurationName";
      "HealthStatus";
      "LifecycleState";
      "AvailabilityZoneId";
      "AvailabilityZone";
      "AutoScalingGroupName";
      "InstanceType";
      "InstanceId";
    ] (fun tag _ ->
      match tag with
      | "WeightedCapacity" ->
          r_weighted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WeightedCapacity"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "ProtectedFromScaleIn" ->
          r_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "AvailabilityZoneId" ->
          r_availability_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     weighted_capacity = ( ! ) r_weighted_capacity;
     protected_from_scale_in =
       Smaws_Lib.Xml.Parse.required "ProtectedFromScaleIn" (( ! ) r_protected_from_scale_in) i;
     image_id = ( ! ) r_image_id;
     launch_template = ( ! ) r_launch_template;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     health_status = Smaws_Lib.Xml.Parse.required "HealthStatus" (( ! ) r_health_status) i;
     lifecycle_state = Smaws_Lib.Xml.Parse.required "LifecycleState" (( ! ) r_lifecycle_state) i;
     availability_zone_id = ( ! ) r_availability_zone_id;
     availability_zone =
       Smaws_Lib.Xml.Parse.required "AvailabilityZone" (( ! ) r_availability_zone) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_type = ( ! ) r_instance_type;
     instance_id = Smaws_Lib.Xml.Parse.required "InstanceId" (( ! ) r_instance_id) i;
   }
    : auto_scaling_instance_details)

let auto_scaling_instances_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> auto_scaling_instance_details_of_xml i)
    ()

let auto_scaling_instances_type_of_xml i =
  let r_next_token = ref None in
  let r_auto_scaling_instances = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AutoScalingInstances" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingInstances" ->
          r_auto_scaling_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingInstances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> auto_scaling_instance_details_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; auto_scaling_instances = ( ! ) r_auto_scaling_instances }
    : auto_scaling_instances_type)

let auto_scaling_group_predicted_capacity_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_scaling_group_of_xml i =
  let r_instance_lifecycle_policy = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_availability_zone_distribution = ref None in
  let r_deletion_protection = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_traffic_sources = ref None in
  let r_default_instance_warmup = ref None in
  let r_desired_capacity_type = ref None in
  let r_context = ref None in
  let r_warm_pool_size = ref None in
  let r_warm_pool_configuration = ref None in
  let r_capacity_rebalance = ref None in
  let r_max_instance_lifetime = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_termination_policies = ref None in
  let r_tags = ref None in
  let r_status = ref None in
  let r_enabled_metrics = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_placement_group = ref None in
  let r_suspended_processes = ref None in
  let r_created_time = ref None in
  let r_instances = ref None in
  let r_health_check_grace_period = ref None in
  let r_health_check_type = ref None in
  let r_target_group_ar_ns = ref None in
  let r_load_balancer_names = ref None in
  let r_availability_zone_ids = ref None in
  let r_availability_zones = ref None in
  let r_default_cooldown = ref None in
  let r_predicted_capacity = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_mixed_instances_policy = ref None in
  let r_launch_template = ref None in
  let r_launch_configuration_name = ref None in
  let r_auto_scaling_group_ar_n = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceLifecyclePolicy";
      "CapacityReservationSpecification";
      "AvailabilityZoneImpairmentPolicy";
      "AvailabilityZoneDistribution";
      "DeletionProtection";
      "InstanceMaintenancePolicy";
      "TrafficSources";
      "DefaultInstanceWarmup";
      "DesiredCapacityType";
      "Context";
      "WarmPoolSize";
      "WarmPoolConfiguration";
      "CapacityRebalance";
      "MaxInstanceLifetime";
      "ServiceLinkedRoleARN";
      "NewInstancesProtectedFromScaleIn";
      "TerminationPolicies";
      "Tags";
      "Status";
      "EnabledMetrics";
      "VPCZoneIdentifier";
      "PlacementGroup";
      "SuspendedProcesses";
      "CreatedTime";
      "Instances";
      "HealthCheckGracePeriod";
      "HealthCheckType";
      "TargetGroupARNs";
      "LoadBalancerNames";
      "AvailabilityZoneIds";
      "AvailabilityZones";
      "DefaultCooldown";
      "PredictedCapacity";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "MixedInstancesPolicy";
      "LaunchTemplate";
      "LaunchConfigurationName";
      "AutoScalingGroupARN";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "WarmPoolSize" ->
          r_warm_pool_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolSize"
                 (fun i _ -> warm_pool_size_of_xml i)
                 ())
      | "WarmPoolConfiguration" ->
          r_warm_pool_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WarmPoolConfiguration"
                 (fun i _ -> warm_pool_configuration_of_xml i)
                 ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "EnabledMetrics" ->
          r_enabled_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledMetrics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> enabled_metric_of_xml i)
                     ())
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SuspendedProcesses" ->
          r_suspended_processes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuspendedProcesses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> suspended_process_of_xml i)
                     ())
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> timestamp_type_of_xml i)
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "PredictedCapacity" ->
          r_predicted_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PredictedCapacity"
                 (fun i _ -> auto_scaling_group_predicted_capacity_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupARN" ->
          r_auto_scaling_group_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     deletion_protection = ( ! ) r_deletion_protection;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     traffic_sources = ( ! ) r_traffic_sources;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     context = ( ! ) r_context;
     warm_pool_size = ( ! ) r_warm_pool_size;
     warm_pool_configuration = ( ! ) r_warm_pool_configuration;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     termination_policies = ( ! ) r_termination_policies;
     tags = ( ! ) r_tags;
     status = ( ! ) r_status;
     enabled_metrics = ( ! ) r_enabled_metrics;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     placement_group = ( ! ) r_placement_group;
     suspended_processes = ( ! ) r_suspended_processes;
     created_time = Smaws_Lib.Xml.Parse.required "CreatedTime" (( ! ) r_created_time) i;
     instances = ( ! ) r_instances;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     health_check_type =
       Smaws_Lib.Xml.Parse.required "HealthCheckType" (( ! ) r_health_check_type) i;
     target_group_ar_ns = ( ! ) r_target_group_ar_ns;
     load_balancer_names = ( ! ) r_load_balancer_names;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     availability_zones =
       Smaws_Lib.Xml.Parse.required "AvailabilityZones" (( ! ) r_availability_zones) i;
     default_cooldown = Smaws_Lib.Xml.Parse.required "DefaultCooldown" (( ! ) r_default_cooldown) i;
     predicted_capacity = ( ! ) r_predicted_capacity;
     desired_capacity = Smaws_Lib.Xml.Parse.required "DesiredCapacity" (( ! ) r_desired_capacity) i;
     max_size = Smaws_Lib.Xml.Parse.required "MaxSize" (( ! ) r_max_size) i;
     min_size = Smaws_Lib.Xml.Parse.required "MinSize" (( ! ) r_min_size) i;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     launch_template = ( ! ) r_launch_template;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     auto_scaling_group_ar_n = ( ! ) r_auto_scaling_group_ar_n;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : auto_scaling_group)

let auto_scaling_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> auto_scaling_group_of_xml i) ()

let auto_scaling_groups_type_of_xml i =
  let r_next_token = ref None in
  let r_auto_scaling_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AutoScalingGroups" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "AutoScalingGroups" ->
          r_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> auto_scaling_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     auto_scaling_groups =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroups" (( ! ) r_auto_scaling_groups) i;
   }
    : auto_scaling_groups_type)

let auto_scaling_group_names_type_of_xml i =
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  let r_include_instances = ref None in
  let r_auto_scaling_group_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Filters"; "MaxRecords"; "NextToken"; "IncludeInstances"; "AutoScalingGroupNames" ]
    (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> xml_string_of_xml i) ())
      | "IncludeInstances" ->
          r_include_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeInstances"
                 (fun i _ -> include_instances_of_xml i)
                 ())
      | "AutoScalingGroupNames" ->
          r_auto_scaling_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
     include_instances = ( ! ) r_include_instances;
     auto_scaling_group_names = ( ! ) r_auto_scaling_group_names;
   }
    : auto_scaling_group_names_type)

let adjustment_type_of_xml i =
  let r_adjustment_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdjustmentType" ] (fun tag _ ->
      match tag with
      | "AdjustmentType" ->
          r_adjustment_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ adjustment_type = ( ! ) r_adjustment_type } : adjustment_type)

let adjustment_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> adjustment_type_of_xml i) ()

let describe_adjustment_types_answer_of_xml i =
  let r_adjustment_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdjustmentTypes" ] (fun tag _ ->
      match tag with
      | "AdjustmentTypes" ->
          r_adjustment_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdjustmentTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> adjustment_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ adjustment_types = ( ! ) r_adjustment_types } : describe_adjustment_types_answer)

let describe_account_limits_answer_of_xml i =
  let r_number_of_launch_configurations = ref None in
  let r_number_of_auto_scaling_groups = ref None in
  let r_max_number_of_launch_configurations = ref None in
  let r_max_number_of_auto_scaling_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NumberOfLaunchConfigurations";
      "NumberOfAutoScalingGroups";
      "MaxNumberOfLaunchConfigurations";
      "MaxNumberOfAutoScalingGroups";
    ] (fun tag _ ->
      match tag with
      | "NumberOfLaunchConfigurations" ->
          r_number_of_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfLaunchConfigurations"
                 (fun i _ -> number_of_launch_configurations_of_xml i)
                 ())
      | "NumberOfAutoScalingGroups" ->
          r_number_of_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfAutoScalingGroups"
                 (fun i _ -> number_of_auto_scaling_groups_of_xml i)
                 ())
      | "MaxNumberOfLaunchConfigurations" ->
          r_max_number_of_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxNumberOfLaunchConfigurations"
                 (fun i _ -> max_number_of_launch_configurations_of_xml i)
                 ())
      | "MaxNumberOfAutoScalingGroups" ->
          r_max_number_of_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxNumberOfAutoScalingGroups"
                 (fun i _ -> max_number_of_auto_scaling_groups_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     number_of_launch_configurations = ( ! ) r_number_of_launch_configurations;
     number_of_auto_scaling_groups = ( ! ) r_number_of_auto_scaling_groups;
     max_number_of_launch_configurations = ( ! ) r_max_number_of_launch_configurations;
     max_number_of_auto_scaling_groups = ( ! ) r_max_number_of_auto_scaling_groups;
   }
    : describe_account_limits_answer)

let delete_warm_pool_type_of_xml i =
  let r_force_delete = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ForceDelete"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "ForceDelete" ->
          r_force_delete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceDelete"
                 (fun i _ -> force_delete_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force_delete = ( ! ) r_force_delete;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : delete_warm_pool_type)

let delete_warm_pool_answer_of_xml i = ()

let delete_tags_type_of_xml i =
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i } : delete_tags_type)

let delete_scheduled_action_type_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduledActionName"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : delete_scheduled_action_type)

let delete_policy_type_of_xml i =
  let r_policy_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyName"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     auto_scaling_group_name = ( ! ) r_auto_scaling_group_name;
   }
    : delete_policy_type)

let delete_notification_configuration_type_of_xml i =
  let r_topic_ar_n = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicARN"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_ar_n = Smaws_Lib.Xml.Parse.required "TopicARN" (( ! ) r_topic_ar_n) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : delete_notification_configuration_type)

let delete_lifecycle_hook_type_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "LifecycleHookName" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
   }
    : delete_lifecycle_hook_type)

let delete_lifecycle_hook_answer_of_xml i = ()

let delete_auto_scaling_group_type_of_xml i =
  let r_force_delete = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ForceDelete"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "ForceDelete" ->
          r_force_delete :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceDelete"
                 (fun i _ -> force_delete_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force_delete = ( ! ) r_force_delete;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : delete_auto_scaling_group_type)

let create_or_update_tags_type_of_xml i =
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i } : create_or_update_tags_type)

let create_launch_configuration_type_of_xml i =
  let r_metadata_options = ref None in
  let r_placement_tenancy = ref None in
  let r_associate_public_ip_address = ref None in
  let r_ebs_optimized = ref None in
  let r_iam_instance_profile = ref None in
  let r_spot_price = ref None in
  let r_instance_monitoring = ref None in
  let r_block_device_mappings = ref None in
  let r_ramdisk_id = ref None in
  let r_kernel_id = ref None in
  let r_instance_type = ref None in
  let r_instance_id = ref None in
  let r_user_data = ref None in
  let r_classic_link_vpc_security_groups = ref None in
  let r_classic_link_vpc_id = ref None in
  let r_security_groups = ref None in
  let r_key_name = ref None in
  let r_image_id = ref None in
  let r_launch_configuration_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MetadataOptions";
      "PlacementTenancy";
      "AssociatePublicIpAddress";
      "EbsOptimized";
      "IamInstanceProfile";
      "SpotPrice";
      "InstanceMonitoring";
      "BlockDeviceMappings";
      "RamdiskId";
      "KernelId";
      "InstanceType";
      "InstanceId";
      "UserData";
      "ClassicLinkVPCSecurityGroups";
      "ClassicLinkVPCId";
      "SecurityGroups";
      "KeyName";
      "ImageId";
      "LaunchConfigurationName";
    ] (fun tag _ ->
      match tag with
      | "MetadataOptions" ->
          r_metadata_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MetadataOptions"
                 (fun i _ -> instance_metadata_options_of_xml i)
                 ())
      | "PlacementTenancy" ->
          r_placement_tenancy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementTenancy"
                 (fun i _ -> xml_string_max_len64_of_xml i)
                 ())
      | "AssociatePublicIpAddress" ->
          r_associate_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatePublicIpAddress"
                 (fun i _ -> associate_public_ip_address_of_xml i)
                 ())
      | "EbsOptimized" ->
          r_ebs_optimized :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EbsOptimized"
                 (fun i _ -> ebs_optimized_of_xml i)
                 ())
      | "IamInstanceProfile" ->
          r_iam_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamInstanceProfile"
                 (fun i _ -> xml_string_max_len1600_of_xml i)
                 ())
      | "SpotPrice" ->
          r_spot_price :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SpotPrice" (fun i _ -> spot_price_of_xml i) ())
      | "InstanceMonitoring" ->
          r_instance_monitoring :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMonitoring"
                 (fun i _ -> instance_monitoring_of_xml i)
                 ())
      | "BlockDeviceMappings" ->
          r_block_device_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BlockDeviceMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> block_device_mapping_of_xml i)
                     ())
                 ())
      | "RamdiskId" ->
          r_ramdisk_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RamdiskId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "KernelId" ->
          r_kernel_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KernelId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "UserData" ->
          r_user_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserData"
                 (fun i _ -> xml_string_user_data_of_xml i)
                 ())
      | "ClassicLinkVPCSecurityGroups" ->
          r_classic_link_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "ClassicLinkVPCId" ->
          r_classic_link_vpc_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClassicLinkVPCId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> xml_string_of_xml i) ())
                 ())
      | "KeyName" ->
          r_key_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     metadata_options = ( ! ) r_metadata_options;
     placement_tenancy = ( ! ) r_placement_tenancy;
     associate_public_ip_address = ( ! ) r_associate_public_ip_address;
     ebs_optimized = ( ! ) r_ebs_optimized;
     iam_instance_profile = ( ! ) r_iam_instance_profile;
     spot_price = ( ! ) r_spot_price;
     instance_monitoring = ( ! ) r_instance_monitoring;
     block_device_mappings = ( ! ) r_block_device_mappings;
     ramdisk_id = ( ! ) r_ramdisk_id;
     kernel_id = ( ! ) r_kernel_id;
     instance_type = ( ! ) r_instance_type;
     instance_id = ( ! ) r_instance_id;
     user_data = ( ! ) r_user_data;
     classic_link_vpc_security_groups = ( ! ) r_classic_link_vpc_security_groups;
     classic_link_vpc_id = ( ! ) r_classic_link_vpc_id;
     security_groups = ( ! ) r_security_groups;
     key_name = ( ! ) r_key_name;
     image_id = ( ! ) r_image_id;
     launch_configuration_name =
       Smaws_Lib.Xml.Parse.required "LaunchConfigurationName" (( ! ) r_launch_configuration_name) i;
   }
    : create_launch_configuration_type)

let create_auto_scaling_group_type_of_xml i =
  let r_instance_lifecycle_policy = ref None in
  let r_capacity_reservation_specification = ref None in
  let r_skip_zonal_shift_validation = ref None in
  let r_availability_zone_impairment_policy = ref None in
  let r_availability_zone_distribution = ref None in
  let r_instance_maintenance_policy = ref None in
  let r_traffic_sources = ref None in
  let r_default_instance_warmup = ref None in
  let r_desired_capacity_type = ref None in
  let r_context = ref None in
  let r_max_instance_lifetime = ref None in
  let r_service_linked_role_ar_n = ref None in
  let r_tags = ref None in
  let r_deletion_protection = ref None in
  let r_lifecycle_hook_specification_list = ref None in
  let r_capacity_rebalance = ref None in
  let r_new_instances_protected_from_scale_in = ref None in
  let r_termination_policies = ref None in
  let r_vpc_zone_identifier = ref None in
  let r_placement_group = ref None in
  let r_health_check_grace_period = ref None in
  let r_health_check_type = ref None in
  let r_target_group_ar_ns = ref None in
  let r_load_balancer_names = ref None in
  let r_availability_zone_ids = ref None in
  let r_availability_zones = ref None in
  let r_default_cooldown = ref None in
  let r_desired_capacity = ref None in
  let r_max_size = ref None in
  let r_min_size = ref None in
  let r_instance_id = ref None in
  let r_mixed_instances_policy = ref None in
  let r_launch_template = ref None in
  let r_launch_configuration_name = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceLifecyclePolicy";
      "CapacityReservationSpecification";
      "SkipZonalShiftValidation";
      "AvailabilityZoneImpairmentPolicy";
      "AvailabilityZoneDistribution";
      "InstanceMaintenancePolicy";
      "TrafficSources";
      "DefaultInstanceWarmup";
      "DesiredCapacityType";
      "Context";
      "MaxInstanceLifetime";
      "ServiceLinkedRoleARN";
      "Tags";
      "DeletionProtection";
      "LifecycleHookSpecificationList";
      "CapacityRebalance";
      "NewInstancesProtectedFromScaleIn";
      "TerminationPolicies";
      "VPCZoneIdentifier";
      "PlacementGroup";
      "HealthCheckGracePeriod";
      "HealthCheckType";
      "TargetGroupARNs";
      "LoadBalancerNames";
      "AvailabilityZoneIds";
      "AvailabilityZones";
      "DefaultCooldown";
      "DesiredCapacity";
      "MaxSize";
      "MinSize";
      "InstanceId";
      "MixedInstancesPolicy";
      "LaunchTemplate";
      "LaunchConfigurationName";
      "AutoScalingGroupName";
    ] (fun tag _ ->
      match tag with
      | "InstanceLifecyclePolicy" ->
          r_instance_lifecycle_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceLifecyclePolicy"
                 (fun i _ -> instance_lifecycle_policy_of_xml i)
                 ())
      | "CapacityReservationSpecification" ->
          r_capacity_reservation_specification :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationSpecification"
                 (fun i _ -> capacity_reservation_specification_of_xml i)
                 ())
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | "AvailabilityZoneImpairmentPolicy" ->
          r_availability_zone_impairment_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneImpairmentPolicy"
                 (fun i _ -> availability_zone_impairment_policy_of_xml i)
                 ())
      | "AvailabilityZoneDistribution" ->
          r_availability_zone_distribution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneDistribution"
                 (fun i _ -> availability_zone_distribution_of_xml i)
                 ())
      | "InstanceMaintenancePolicy" ->
          r_instance_maintenance_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceMaintenancePolicy"
                 (fun i _ -> instance_maintenance_policy_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "DefaultInstanceWarmup" ->
          r_default_instance_warmup :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultInstanceWarmup"
                 (fun i _ -> default_instance_warmup_of_xml i)
                 ())
      | "DesiredCapacityType" ->
          r_desired_capacity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacityType"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "Context" ->
          r_context :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Context" (fun i _ -> context_of_xml i) ())
      | "MaxInstanceLifetime" ->
          r_max_instance_lifetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxInstanceLifetime"
                 (fun i _ -> max_instance_lifetime_of_xml i)
                 ())
      | "ServiceLinkedRoleARN" ->
          r_service_linked_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceLinkedRoleARN"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> deletion_protection_of_xml i)
                 ())
      | "LifecycleHookSpecificationList" ->
          r_lifecycle_hook_specification_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookSpecificationList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lifecycle_hook_specification_of_xml i)
                     ())
                 ())
      | "CapacityRebalance" ->
          r_capacity_rebalance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityRebalance"
                 (fun i _ -> capacity_rebalance_enabled_of_xml i)
                 ())
      | "NewInstancesProtectedFromScaleIn" ->
          r_new_instances_protected_from_scale_in :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewInstancesProtectedFromScaleIn"
                 (fun i _ -> instance_protected_of_xml i)
                 ())
      | "TerminationPolicies" ->
          r_termination_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminationPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len1600_of_xml i)
                     ())
                 ())
      | "VPCZoneIdentifier" ->
          r_vpc_zone_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VPCZoneIdentifier"
                 (fun i _ -> xml_string_max_len5000_of_xml i)
                 ())
      | "PlacementGroup" ->
          r_placement_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlacementGroup"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "HealthCheckGracePeriod" ->
          r_health_check_grace_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckGracePeriod"
                 (fun i _ -> health_check_grace_period_of_xml i)
                 ())
      | "HealthCheckType" ->
          r_health_check_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckType"
                 (fun i _ -> xml_string_max_len32_of_xml i)
                 ())
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZoneIds" ->
          r_availability_zone_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "DefaultCooldown" ->
          r_default_cooldown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCooldown"
                 (fun i _ -> cooldown_of_xml i)
                 ())
      | "DesiredCapacity" ->
          r_desired_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredCapacity"
                 (fun i _ -> auto_scaling_group_desired_capacity_of_xml i)
                 ())
      | "MaxSize" ->
          r_max_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSize"
                 (fun i _ -> auto_scaling_group_max_size_of_xml i)
                 ())
      | "MinSize" ->
          r_min_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinSize"
                 (fun i _ -> auto_scaling_group_min_size_of_xml i)
                 ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "MixedInstancesPolicy" ->
          r_mixed_instances_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MixedInstancesPolicy"
                 (fun i _ -> mixed_instances_policy_of_xml i)
                 ())
      | "LaunchTemplate" ->
          r_launch_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplate"
                 (fun i _ -> launch_template_specification_of_xml i)
                 ())
      | "LaunchConfigurationName" ->
          r_launch_configuration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurationName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_lifecycle_policy = ( ! ) r_instance_lifecycle_policy;
     capacity_reservation_specification = ( ! ) r_capacity_reservation_specification;
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
     availability_zone_impairment_policy = ( ! ) r_availability_zone_impairment_policy;
     availability_zone_distribution = ( ! ) r_availability_zone_distribution;
     instance_maintenance_policy = ( ! ) r_instance_maintenance_policy;
     traffic_sources = ( ! ) r_traffic_sources;
     default_instance_warmup = ( ! ) r_default_instance_warmup;
     desired_capacity_type = ( ! ) r_desired_capacity_type;
     context = ( ! ) r_context;
     max_instance_lifetime = ( ! ) r_max_instance_lifetime;
     service_linked_role_ar_n = ( ! ) r_service_linked_role_ar_n;
     tags = ( ! ) r_tags;
     deletion_protection = ( ! ) r_deletion_protection;
     lifecycle_hook_specification_list = ( ! ) r_lifecycle_hook_specification_list;
     capacity_rebalance = ( ! ) r_capacity_rebalance;
     new_instances_protected_from_scale_in = ( ! ) r_new_instances_protected_from_scale_in;
     termination_policies = ( ! ) r_termination_policies;
     vpc_zone_identifier = ( ! ) r_vpc_zone_identifier;
     placement_group = ( ! ) r_placement_group;
     health_check_grace_period = ( ! ) r_health_check_grace_period;
     health_check_type = ( ! ) r_health_check_type;
     target_group_ar_ns = ( ! ) r_target_group_ar_ns;
     load_balancer_names = ( ! ) r_load_balancer_names;
     availability_zone_ids = ( ! ) r_availability_zone_ids;
     availability_zones = ( ! ) r_availability_zones;
     default_cooldown = ( ! ) r_default_cooldown;
     desired_capacity = ( ! ) r_desired_capacity;
     max_size = Smaws_Lib.Xml.Parse.required "MaxSize" (( ! ) r_max_size) i;
     min_size = Smaws_Lib.Xml.Parse.required "MinSize" (( ! ) r_min_size) i;
     instance_id = ( ! ) r_instance_id;
     mixed_instances_policy = ( ! ) r_mixed_instances_policy;
     launch_template = ( ! ) r_launch_template;
     launch_configuration_name = ( ! ) r_launch_configuration_name;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : create_auto_scaling_group_type)

let complete_lifecycle_action_type_of_xml i =
  let r_instance_id = ref None in
  let r_lifecycle_action_result = ref None in
  let r_lifecycle_action_token = ref None in
  let r_auto_scaling_group_name = ref None in
  let r_lifecycle_hook_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceId";
      "LifecycleActionResult";
      "LifecycleActionToken";
      "AutoScalingGroupName";
      "LifecycleHookName";
    ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> xml_string_max_len19_of_xml i)
                 ())
      | "LifecycleActionResult" ->
          r_lifecycle_action_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionResult"
                 (fun i _ -> lifecycle_action_result_of_xml i)
                 ())
      | "LifecycleActionToken" ->
          r_lifecycle_action_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleActionToken"
                 (fun i _ -> lifecycle_action_token_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "LifecycleHookName" ->
          r_lifecycle_hook_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleHookName"
                 (fun i _ -> ascii_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = ( ! ) r_instance_id;
     lifecycle_action_result =
       Smaws_Lib.Xml.Parse.required "LifecycleActionResult" (( ! ) r_lifecycle_action_result) i;
     lifecycle_action_token = ( ! ) r_lifecycle_action_token;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     lifecycle_hook_name =
       Smaws_Lib.Xml.Parse.required "LifecycleHookName" (( ! ) r_lifecycle_hook_name) i;
   }
    : complete_lifecycle_action_type)

let complete_lifecycle_action_answer_of_xml i = ()

let boolean_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cancel_instance_refresh_type_of_xml i =
  let r_wait_for_transitioning_instances = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "WaitForTransitioningInstances"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "WaitForTransitioningInstances" ->
          r_wait_for_transitioning_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WaitForTransitioningInstances"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     wait_for_transitioning_instances = ( ! ) r_wait_for_transitioning_instances;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : cancel_instance_refresh_type)

let cancel_instance_refresh_answer_of_xml i =
  let r_instance_refresh_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceRefreshId" ] (fun tag _ ->
      match tag with
      | "InstanceRefreshId" ->
          r_instance_refresh_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceRefreshId"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_refresh_id = ( ! ) r_instance_refresh_id } : cancel_instance_refresh_answer)

let batch_put_scheduled_update_group_action_type_of_xml i =
  let r_scheduled_update_group_actions = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ScheduledUpdateGroupActions"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "ScheduledUpdateGroupActions" ->
          r_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_update_group_actions =
       Smaws_Lib.Xml.Parse.required "ScheduledUpdateGroupActions"
         (( ! ) r_scheduled_update_group_actions)
         i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : batch_put_scheduled_update_group_action_type)

let batch_put_scheduled_update_group_action_answer_of_xml i =
  let r_failed_scheduled_update_group_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedScheduledUpdateGroupActions" ] (fun tag _ ->
      match tag with
      | "FailedScheduledUpdateGroupActions" ->
          r_failed_scheduled_update_group_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedScheduledUpdateGroupActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_scheduled_update_group_actions = ( ! ) r_failed_scheduled_update_group_actions }
    : batch_put_scheduled_update_group_action_answer)

let batch_delete_scheduled_action_type_of_xml i =
  let r_scheduled_action_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduledActionNames"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "ScheduledActionNames" ->
          r_scheduled_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_names =
       Smaws_Lib.Xml.Parse.required "ScheduledActionNames" (( ! ) r_scheduled_action_names) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : batch_delete_scheduled_action_type)

let batch_delete_scheduled_action_answer_of_xml i =
  let r_failed_scheduled_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedScheduledActions" ] (fun tag _ ->
      match tag with
      | "FailedScheduledActions" ->
          r_failed_scheduled_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedScheduledActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> failed_scheduled_update_group_action_request_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_scheduled_actions = ( ! ) r_failed_scheduled_actions }
    : batch_delete_scheduled_action_answer)

let attach_traffic_sources_result_type_of_xml i = ()

let attach_traffic_sources_type_of_xml i =
  let r_skip_zonal_shift_validation = ref None in
  let r_traffic_sources = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SkipZonalShiftValidation"; "TrafficSources"; "AutoScalingGroupName" ] (fun tag _ ->
      match tag with
      | "SkipZonalShiftValidation" ->
          r_skip_zonal_shift_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipZonalShiftValidation"
                 (fun i _ -> skip_zonal_shift_validation_of_xml i)
                 ())
      | "TrafficSources" ->
          r_traffic_sources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrafficSources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> traffic_source_identifier_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     skip_zonal_shift_validation = ( ! ) r_skip_zonal_shift_validation;
     traffic_sources = Smaws_Lib.Xml.Parse.required "TrafficSources" (( ! ) r_traffic_sources) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : attach_traffic_sources_type)

let attach_load_balancer_target_groups_result_type_of_xml i = ()

let attach_load_balancer_target_groups_type_of_xml i =
  let r_target_group_ar_ns = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroupARNs"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "TargetGroupARNs" ->
          r_target_group_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len511_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_group_ar_ns =
       Smaws_Lib.Xml.Parse.required "TargetGroupARNs" (( ! ) r_target_group_ar_ns) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : attach_load_balancer_target_groups_type)

let attach_load_balancers_result_type_of_xml i = ()

let attach_load_balancers_type_of_xml i =
  let r_load_balancer_names = ref None in
  let r_auto_scaling_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerNames"; "AutoScalingGroupName" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len255_of_xml i)
                     ())
                 ())
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
   }
    : attach_load_balancers_type)

let attach_instances_query_of_xml i =
  let r_auto_scaling_group_name = ref None in
  let r_instance_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AutoScalingGroupName"; "InstanceIds" ]
    (fun tag _ ->
      match tag with
      | "AutoScalingGroupName" ->
          r_auto_scaling_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroupName"
                 (fun i _ -> xml_string_max_len255_of_xml i)
                 ())
      | "InstanceIds" ->
          r_instance_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> xml_string_max_len19_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_scaling_group_name =
       Smaws_Lib.Xml.Parse.required "AutoScalingGroupName" (( ! ) r_auto_scaling_group_name) i;
     instance_ids = ( ! ) r_instance_ids;
   }
    : attach_instances_query)
