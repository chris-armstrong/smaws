open Types

let make_instance_reuse_policy ?reuse_on_scale_in:(reuse_on_scale_in_ : reuse_on_scale_in option) ()
    =
  ({ reuse_on_scale_in = reuse_on_scale_in_ } : instance_reuse_policy)

let make_warm_pool_configuration
    ?instance_reuse_policy:(instance_reuse_policy_ : instance_reuse_policy option)
    ?status:(status_ : warm_pool_status option) ?pool_state:(pool_state_ : warm_pool_state option)
    ?min_size:(min_size_ : warm_pool_min_size option)
    ?max_group_prepared_capacity:(max_group_prepared_capacity_ : max_group_prepared_capacity option)
    () =
  ({
     instance_reuse_policy = instance_reuse_policy_;
     status = status_;
     pool_state = pool_state_;
     min_size = min_size_;
     max_group_prepared_capacity = max_group_prepared_capacity_;
   }
    : warm_pool_configuration)

let make_v_cpu_count_request ?max:(max_ : nullable_positive_integer option)
    ~min:(min_ : nullable_positive_integer) () =
  ({ max = max_; min = min_ } : v_cpu_count_request)

let make_launch_template_specification ?version:(version_ : xml_string_max_len255 option)
    ?launch_template_name:(launch_template_name_ : launch_template_name option)
    ?launch_template_id:(launch_template_id_ : xml_string_max_len255 option) () =
  ({
     version = version_;
     launch_template_name = launch_template_name_;
     launch_template_id = launch_template_id_;
   }
    : launch_template_specification)

let make_memory_mi_b_request ?max:(max_ : nullable_positive_integer option)
    ~min:(min_ : nullable_positive_integer) () =
  ({ max = max_; min = min_ } : memory_mi_b_request)

let make_memory_gi_b_per_v_cpu_request ?max:(max_ : nullable_positive_double option)
    ?min:(min_ : nullable_positive_double option) () =
  ({ max = max_; min = min_ } : memory_gi_b_per_v_cpu_request)

let make_network_interface_count_request ?max:(max_ : nullable_positive_integer option)
    ?min:(min_ : nullable_positive_integer option) () =
  ({ max = max_; min = min_ } : network_interface_count_request)

let make_total_local_storage_gb_request ?max:(max_ : nullable_positive_double option)
    ?min:(min_ : nullable_positive_double option) () =
  ({ max = max_; min = min_ } : total_local_storage_gb_request)

let make_baseline_ebs_bandwidth_mbps_request ?max:(max_ : nullable_positive_integer option)
    ?min:(min_ : nullable_positive_integer option) () =
  ({ max = max_; min = min_ } : baseline_ebs_bandwidth_mbps_request)

let make_accelerator_count_request ?max:(max_ : nullable_positive_integer option)
    ?min:(min_ : nullable_positive_integer option) () =
  ({ max = max_; min = min_ } : accelerator_count_request)

let make_accelerator_total_memory_mi_b_request ?max:(max_ : nullable_positive_integer option)
    ?min:(min_ : nullable_positive_integer option) () =
  ({ max = max_; min = min_ } : accelerator_total_memory_mi_b_request)

let make_network_bandwidth_gbps_request ?max:(max_ : nullable_positive_double option)
    ?min:(min_ : nullable_positive_double option) () =
  ({ max = max_; min = min_ } : network_bandwidth_gbps_request)

let make_performance_factor_reference_request ?instance_family:(instance_family_ : string_ option)
    () =
  ({ instance_family = instance_family_ } : performance_factor_reference_request)

let make_cpu_performance_factor_request
    ?references:(references_ : performance_factor_reference_set_request option) () =
  ({ references = references_ } : cpu_performance_factor_request)

let make_baseline_performance_factors_request ?cpu:(cpu_ : cpu_performance_factor_request option) ()
    =
  ({ cpu = cpu_ } : baseline_performance_factors_request)

let make_instance_requirements
    ?baseline_performance_factors:
      (baseline_performance_factors_ : baseline_performance_factors_request option)
    ?allowed_instance_types:(allowed_instance_types_ : allowed_instance_types option)
    ?network_bandwidth_gbps:(network_bandwidth_gbps_ : network_bandwidth_gbps_request option)
    ?accelerator_total_memory_mi_b:
      (accelerator_total_memory_mi_b_ : accelerator_total_memory_mi_b_request option)
    ?accelerator_names:(accelerator_names_ : accelerator_names option)
    ?accelerator_manufacturers:(accelerator_manufacturers_ : accelerator_manufacturers option)
    ?accelerator_count:(accelerator_count_ : accelerator_count_request option)
    ?accelerator_types:(accelerator_types_ : accelerator_types option)
    ?baseline_ebs_bandwidth_mbps:
      (baseline_ebs_bandwidth_mbps_ : baseline_ebs_bandwidth_mbps_request option)
    ?total_local_storage_g_b:(total_local_storage_g_b_ : total_local_storage_gb_request option)
    ?local_storage_types:(local_storage_types_ : local_storage_types option)
    ?local_storage:(local_storage_ : local_storage option)
    ?network_interface_count:(network_interface_count_ : network_interface_count_request option)
    ?require_hibernate_support:(require_hibernate_support_ : nullable_boolean option)
    ?burstable_performance:(burstable_performance_ : burstable_performance option)
    ?bare_metal:(bare_metal_ : bare_metal option)
    ?on_demand_max_price_percentage_over_lowest_price:
      (on_demand_max_price_percentage_over_lowest_price_ : nullable_positive_integer option)
    ?max_spot_price_as_percentage_of_optimal_on_demand_price:
      (max_spot_price_as_percentage_of_optimal_on_demand_price_ : nullable_positive_integer option)
    ?spot_max_price_percentage_over_lowest_price:
      (spot_max_price_percentage_over_lowest_price_ : nullable_positive_integer option)
    ?instance_generations:(instance_generations_ : instance_generations option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_types option)
    ?memory_gi_b_per_v_cpu:(memory_gi_b_per_v_cpu_ : memory_gi_b_per_v_cpu_request option)
    ?cpu_manufacturers:(cpu_manufacturers_ : cpu_manufacturers option)
    ~memory_mi_b:(memory_mi_b_ : memory_mi_b_request)
    ~v_cpu_count:(v_cpu_count_ : v_cpu_count_request) () =
  ({
     baseline_performance_factors = baseline_performance_factors_;
     allowed_instance_types = allowed_instance_types_;
     network_bandwidth_gbps = network_bandwidth_gbps_;
     accelerator_total_memory_mi_b = accelerator_total_memory_mi_b_;
     accelerator_names = accelerator_names_;
     accelerator_manufacturers = accelerator_manufacturers_;
     accelerator_count = accelerator_count_;
     accelerator_types = accelerator_types_;
     baseline_ebs_bandwidth_mbps = baseline_ebs_bandwidth_mbps_;
     total_local_storage_g_b = total_local_storage_g_b_;
     local_storage_types = local_storage_types_;
     local_storage = local_storage_;
     network_interface_count = network_interface_count_;
     require_hibernate_support = require_hibernate_support_;
     burstable_performance = burstable_performance_;
     bare_metal = bare_metal_;
     on_demand_max_price_percentage_over_lowest_price =
       on_demand_max_price_percentage_over_lowest_price_;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       max_spot_price_as_percentage_of_optimal_on_demand_price_;
     spot_max_price_percentage_over_lowest_price = spot_max_price_percentage_over_lowest_price_;
     instance_generations = instance_generations_;
     excluded_instance_types = excluded_instance_types_;
     memory_gi_b_per_v_cpu = memory_gi_b_per_v_cpu_;
     cpu_manufacturers = cpu_manufacturers_;
     memory_mi_b = memory_mi_b_;
     v_cpu_count = v_cpu_count_;
   }
    : instance_requirements)

let make_launch_template_overrides ?image_id:(image_id_ : image_id option)
    ?instance_requirements:(instance_requirements_ : instance_requirements option)
    ?launch_template_specification:
      (launch_template_specification_ : launch_template_specification option)
    ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option) () =
  ({
     image_id = image_id_;
     instance_requirements = instance_requirements_;
     launch_template_specification = launch_template_specification_;
     weighted_capacity = weighted_capacity_;
     instance_type = instance_type_;
   }
    : launch_template_overrides)

let make_launch_template ?overrides:(overrides_ : overrides option)
    ?launch_template_specification:
      (launch_template_specification_ : launch_template_specification option) () =
  ({ overrides = overrides_; launch_template_specification = launch_template_specification_ }
    : launch_template)

let make_instances_distribution ?spot_max_price:(spot_max_price_ : mixed_instance_spot_price option)
    ?spot_instance_pools:(spot_instance_pools_ : spot_instance_pools option)
    ?spot_allocation_strategy:(spot_allocation_strategy_ : xml_string option)
    ?on_demand_percentage_above_base_capacity:
      (on_demand_percentage_above_base_capacity_ : on_demand_percentage_above_base_capacity option)
    ?on_demand_base_capacity:(on_demand_base_capacity_ : on_demand_base_capacity option)
    ?on_demand_allocation_strategy:(on_demand_allocation_strategy_ : xml_string option) () =
  ({
     spot_max_price = spot_max_price_;
     spot_instance_pools = spot_instance_pools_;
     spot_allocation_strategy = spot_allocation_strategy_;
     on_demand_percentage_above_base_capacity = on_demand_percentage_above_base_capacity_;
     on_demand_base_capacity = on_demand_base_capacity_;
     on_demand_allocation_strategy = on_demand_allocation_strategy_;
   }
    : instances_distribution)

let make_mixed_instances_policy
    ?instances_distribution:(instances_distribution_ : instances_distribution option)
    ?launch_template:(launch_template_ : launch_template option) () =
  ({ instances_distribution = instances_distribution_; launch_template = launch_template_ }
    : mixed_instances_policy)

let make_instance_maintenance_policy
    ?max_healthy_percentage:(max_healthy_percentage_ : int_percent100_to200_resettable option)
    ?min_healthy_percentage:(min_healthy_percentage_ : int_percent_resettable option) () =
  ({
     max_healthy_percentage = max_healthy_percentage_;
     min_healthy_percentage = min_healthy_percentage_;
   }
    : instance_maintenance_policy)

let make_availability_zone_distribution
    ?capacity_distribution_strategy:
      (capacity_distribution_strategy_ : capacity_distribution_strategy option) () =
  ({ capacity_distribution_strategy = capacity_distribution_strategy_ }
    : availability_zone_distribution)

let make_availability_zone_impairment_policy
    ?impaired_zone_health_check_behavior:
      (impaired_zone_health_check_behavior_ : impaired_zone_health_check_behavior option)
    ?zonal_shift_enabled:(zonal_shift_enabled_ : zonal_shift_enabled option) () =
  ({
     impaired_zone_health_check_behavior = impaired_zone_health_check_behavior_;
     zonal_shift_enabled = zonal_shift_enabled_;
   }
    : availability_zone_impairment_policy)

let make_capacity_reservation_target
    ?capacity_reservation_resource_group_arns:
      (capacity_reservation_resource_group_arns_ : capacity_reservation_resource_group_arns option)
    ?capacity_reservation_ids:(capacity_reservation_ids_ : capacity_reservation_ids option) () =
  ({
     capacity_reservation_resource_group_arns = capacity_reservation_resource_group_arns_;
     capacity_reservation_ids = capacity_reservation_ids_;
   }
    : capacity_reservation_target)

let make_capacity_reservation_specification
    ?capacity_reservation_target:(capacity_reservation_target_ : capacity_reservation_target option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option) () =
  ({
     capacity_reservation_target = capacity_reservation_target_;
     capacity_reservation_preference = capacity_reservation_preference_;
   }
    : capacity_reservation_specification)

let make_retention_triggers
    ?terminate_hook_abandon:(terminate_hook_abandon_ : retention_action option) () =
  ({ terminate_hook_abandon = terminate_hook_abandon_ } : retention_triggers)

let make_instance_lifecycle_policy
    ?retention_triggers:(retention_triggers_ : retention_triggers option) () =
  ({ retention_triggers = retention_triggers_ } : instance_lifecycle_policy)

let make_update_auto_scaling_group_type
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?context:(context_ : context option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?placement_group:(placement_group_ : update_placement_group_param option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?health_check_type:(health_check_type_ : xml_string_max_len32 option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?default_cooldown:(default_cooldown_ : cooldown option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     deletion_protection = deletion_protection_;
     instance_lifecycle_policy = instance_lifecycle_policy_;
     capacity_reservation_specification = capacity_reservation_specification_;
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     availability_zone_distribution = availability_zone_distribution_;
     instance_maintenance_policy = instance_maintenance_policy_;
     default_instance_warmup = default_instance_warmup_;
     desired_capacity_type = desired_capacity_type_;
     context = context_;
     capacity_rebalance = capacity_rebalance_;
     max_instance_lifetime = max_instance_lifetime_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     termination_policies = termination_policies_;
     vpc_zone_identifier = vpc_zone_identifier_;
     placement_group = placement_group_;
     health_check_grace_period = health_check_grace_period_;
     health_check_type = health_check_type_;
     availability_zone_ids = availability_zone_ids_;
     availability_zones = availability_zones_;
     default_cooldown = default_cooldown_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     mixed_instances_policy = mixed_instances_policy_;
     launch_template = launch_template_;
     launch_configuration_name = launch_configuration_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : update_auto_scaling_group_type)

let make_traffic_source_identifier ?type_:(type__ : xml_string_max_len511 option)
    ~identifier:(identifier_ : xml_string_max_len511) () =
  ({ type_ = type__; identifier = identifier_ } : traffic_source_identifier)

let make_traffic_source_state ?type_:(type__ : xml_string_max_len511 option)
    ?identifier:(identifier_ : xml_string_max_len511 option)
    ?state:(state_ : xml_string_max_len255 option)
    ?traffic_source:(traffic_source_ : xml_string_max_len511 option) () =
  ({ type_ = type__; identifier = identifier_; state = state_; traffic_source = traffic_source_ }
    : traffic_source_state)

let make_terminate_instance_in_auto_scaling_group_type
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity)
    ~instance_id:(instance_id_ : xml_string_max_len19) () =
  ({
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
     instance_id = instance_id_;
   }
    : terminate_instance_in_auto_scaling_group_type)

let make_activity ?auto_scaling_group_ar_n:(auto_scaling_group_ar_n_ : resource_name option)
    ?auto_scaling_group_state:(auto_scaling_group_state_ : auto_scaling_group_state option)
    ?details:(details_ : xml_string option) ?progress:(progress_ : progress option)
    ?status_message:(status_message_ : xml_string_max_len255 option)
    ?end_time:(end_time_ : timestamp_type option) ?description:(description_ : xml_string option)
    ~status_code:(status_code_ : scaling_activity_status_code)
    ~start_time:(start_time_ : timestamp_type) ~cause:(cause_ : xml_string_max_len1023)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~activity_id:(activity_id_ : xml_string) () =
  ({
     auto_scaling_group_ar_n = auto_scaling_group_ar_n_;
     auto_scaling_group_state = auto_scaling_group_state_;
     details = details_;
     progress = progress_;
     status_message = status_message_;
     status_code = status_code_;
     end_time = end_time_;
     start_time = start_time_;
     cause = cause_;
     description = description_;
     auto_scaling_group_name = auto_scaling_group_name_;
     activity_id = activity_id_;
   }
    : activity)

let make_activity_type ?activity:(activity_ : activity option) () =
  ({ activity = activity_ } : activity_type)

let make_metric_dimension ~value:(value_ : metric_dimension_value)
    ~name:(name_ : metric_dimension_name) () =
  ({ value = value_; name = name_ } : metric_dimension)

let make_metric ?dimensions:(dimensions_ : metric_dimensions option)
    ~metric_name:(metric_name_ : metric_name) ~namespace:(namespace_ : metric_namespace) () =
  ({ dimensions = dimensions_; metric_name = metric_name_; namespace = namespace_ } : metric)

let make_target_tracking_metric_stat ?period:(period_ : metric_granularity_in_seconds option)
    ?unit_:(unit__ : metric_unit option) ~stat:(stat_ : xml_string_metric_stat)
    ~metric:(metric_ : metric) () =
  ({ period = period_; unit_ = unit__; stat = stat_; metric = metric_ }
    : target_tracking_metric_stat)

let make_target_tracking_metric_data_query ?return_data:(return_data_ : return_data option)
    ?period:(period_ : metric_granularity_in_seconds option)
    ?label:(label_ : xml_string_metric_label option)
    ?metric_stat:(metric_stat_ : target_tracking_metric_stat option)
    ?expression:(expression_ : xml_string_max_len2047 option) ~id:(id_ : xml_string_max_len64) () =
  ({
     return_data = return_data_;
     period = period_;
     label = label_;
     metric_stat = metric_stat_;
     expression = expression_;
     id = id_;
   }
    : target_tracking_metric_data_query)

let make_predefined_metric_specification
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predefined_metric_specification)

let make_customized_metric_specification
    ?metrics:(metrics_ : target_tracking_metric_data_queries option)
    ?period:(period_ : metric_granularity_in_seconds option) ?unit_:(unit__ : metric_unit option)
    ?statistic:(statistic_ : metric_statistic option)
    ?dimensions:(dimensions_ : metric_dimensions option)
    ?namespace:(namespace_ : metric_namespace option)
    ?metric_name:(metric_name_ : metric_name option) () =
  ({
     metrics = metrics_;
     period = period_;
     unit_ = unit__;
     statistic = statistic_;
     dimensions = dimensions_;
     namespace = namespace_;
     metric_name = metric_name_;
   }
    : customized_metric_specification)

let make_target_tracking_configuration
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ?customized_metric_specification:
      (customized_metric_specification_ : customized_metric_specification option)
    ?predefined_metric_specification:
      (predefined_metric_specification_ : predefined_metric_specification option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     disable_scale_in = disable_scale_in_;
     target_value = target_value_;
     customized_metric_specification = customized_metric_specification_;
     predefined_metric_specification = predefined_metric_specification_;
   }
    : target_tracking_configuration)

let make_tag_description ?propagate_at_launch:(propagate_at_launch_ : propagate_at_launch option)
    ?value:(value_ : tag_value option) ?key:(key_ : tag_key option)
    ?resource_type:(resource_type_ : xml_string option)
    ?resource_id:(resource_id_ : xml_string option) () =
  ({
     propagate_at_launch = propagate_at_launch_;
     value = value_;
     key = key_;
     resource_type = resource_type_;
     resource_id = resource_id_;
   }
    : tag_description)

let make_tags_type ?next_token:(next_token_ : xml_string option)
    ?tags:(tags_ : tag_description_list option) () =
  ({ next_token = next_token_; tags = tags_ } : tags_type)

let make_tag ?propagate_at_launch:(propagate_at_launch_ : propagate_at_launch option)
    ?value:(value_ : tag_value option) ?resource_type:(resource_type_ : xml_string option)
    ?resource_id:(resource_id_ : xml_string option) ~key:(key_ : tag_key) () =
  ({
     propagate_at_launch = propagate_at_launch_;
     value = value_;
     key = key_;
     resource_type = resource_type_;
     resource_id = resource_id_;
   }
    : tag)

let make_suspended_process ?suspension_reason:(suspension_reason_ : xml_string_max_len255 option)
    ?process_name:(process_name_ : xml_string_max_len255 option) () =
  ({ suspension_reason = suspension_reason_; process_name = process_name_ } : suspended_process)

let make_scaling_process_query ?scaling_processes:(scaling_processes_ : process_names option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ scaling_processes = scaling_processes_; auto_scaling_group_name = auto_scaling_group_name_ }
    : scaling_process_query)

let make_step_adjustment
    ?metric_interval_upper_bound:(metric_interval_upper_bound_ : metric_scale option)
    ?metric_interval_lower_bound:(metric_interval_lower_bound_ : metric_scale option)
    ~scaling_adjustment:(scaling_adjustment_ : policy_increment) () =
  ({
     scaling_adjustment = scaling_adjustment_;
     metric_interval_upper_bound = metric_interval_upper_bound_;
     metric_interval_lower_bound = metric_interval_lower_bound_;
   }
    : step_adjustment)

let make_desired_configuration
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?launch_template:(launch_template_ : launch_template_specification option) () =
  ({ mixed_instances_policy = mixed_instances_policy_; launch_template = launch_template_ }
    : desired_configuration)

let make_alarm_specification ?alarms:(alarms_ : alarm_list option) () =
  ({ alarms = alarms_ } : alarm_specification)

let make_refresh_preferences ?bake_time:(bake_time_ : bake_time option)
    ?max_healthy_percentage:(max_healthy_percentage_ : int_percent100_to200 option)
    ?alarm_specification:(alarm_specification_ : alarm_specification option)
    ?standby_instances:(standby_instances_ : standby_instances option)
    ?scale_in_protected_instances:
      (scale_in_protected_instances_ : scale_in_protected_instances option)
    ?auto_rollback:(auto_rollback_ : auto_rollback option)
    ?skip_matching:(skip_matching_ : skip_matching option)
    ?checkpoint_delay:(checkpoint_delay_ : checkpoint_delay option)
    ?checkpoint_percentages:(checkpoint_percentages_ : checkpoint_percentages option)
    ?instance_warmup:(instance_warmup_ : refresh_instance_warmup option)
    ?min_healthy_percentage:(min_healthy_percentage_ : int_percent option) () =
  ({
     bake_time = bake_time_;
     max_healthy_percentage = max_healthy_percentage_;
     alarm_specification = alarm_specification_;
     standby_instances = standby_instances_;
     scale_in_protected_instances = scale_in_protected_instances_;
     auto_rollback = auto_rollback_;
     skip_matching = skip_matching_;
     checkpoint_delay = checkpoint_delay_;
     checkpoint_percentages = checkpoint_percentages_;
     instance_warmup = instance_warmup_;
     min_healthy_percentage = min_healthy_percentage_;
   }
    : refresh_preferences)

let make_start_instance_refresh_type ?preferences:(preferences_ : refresh_preferences option)
    ?desired_configuration:(desired_configuration_ : desired_configuration option)
    ?strategy:(strategy_ : refresh_strategy option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     preferences = preferences_;
     desired_configuration = desired_configuration_;
     strategy = strategy_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : start_instance_refresh_type)

let make_start_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : start_instance_refresh_answer)

let make_set_instance_protection_query
    ~protected_from_scale_in:(protected_from_scale_in_ : protected_from_scale_in)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~instance_ids:(instance_ids_ : instance_ids) () =
  ({
     protected_from_scale_in = protected_from_scale_in_;
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_ids = instance_ids_;
   }
    : set_instance_protection_query)

let make_set_instance_protection_answer () = (() : unit)

let make_set_instance_health_query
    ?should_respect_grace_period:(should_respect_grace_period_ : should_respect_grace_period option)
    ~health_status:(health_status_ : xml_string_max_len32)
    ~instance_id:(instance_id_ : xml_string_max_len19) () =
  ({
     should_respect_grace_period = should_respect_grace_period_;
     health_status = health_status_;
     instance_id = instance_id_;
   }
    : set_instance_health_query)

let make_set_desired_capacity_type ?honor_cooldown:(honor_cooldown_ : honor_cooldown option)
    ~desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     honor_cooldown = honor_cooldown_;
     desired_capacity = desired_capacity_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : set_desired_capacity_type)

let make_scheduled_update_group_action ?time_zone:(time_zone_ : xml_string_max_len255 option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?time:(time_ : timestamp_type option)
    ?scheduled_action_ar_n:(scheduled_action_ar_n_ : resource_name option)
    ?scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255 option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option) () =
  ({
     time_zone = time_zone_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     recurrence = recurrence_;
     end_time = end_time_;
     start_time = start_time_;
     time = time_;
     scheduled_action_ar_n = scheduled_action_ar_n_;
     scheduled_action_name = scheduled_action_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : scheduled_update_group_action)

let make_scheduled_update_group_action_request
    ?time_zone:(time_zone_ : xml_string_max_len255 option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     time_zone = time_zone_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     recurrence = recurrence_;
     end_time = end_time_;
     start_time = start_time_;
     scheduled_action_name = scheduled_action_name_;
   }
    : scheduled_update_group_action_request)

let make_scheduled_actions_type ?next_token:(next_token_ : xml_string option)
    ?scheduled_update_group_actions:
      (scheduled_update_group_actions_ : scheduled_update_group_actions option) () =
  ({ next_token = next_token_; scheduled_update_group_actions = scheduled_update_group_actions_ }
    : scheduled_actions_type)

let make_alarm ?alarm_ar_n:(alarm_ar_n_ : resource_name option)
    ?alarm_name:(alarm_name_ : xml_string_max_len255 option) () =
  ({ alarm_ar_n = alarm_ar_n_; alarm_name = alarm_name_ } : alarm)

let make_predictive_scaling_predefined_metric_pair
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_metric_pair_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_metric_pair)

let make_predictive_scaling_predefined_scaling_metric
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_scaling_metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_scaling_metric)

let make_predictive_scaling_predefined_load_metric
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_load_metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_load_metric)

let make_metric_stat ?unit_:(unit__ : metric_unit option) ~stat:(stat_ : xml_string_metric_stat)
    ~metric:(metric_ : metric) () =
  ({ unit_ = unit__; stat = stat_; metric = metric_ } : metric_stat)

let make_metric_data_query ?return_data:(return_data_ : return_data option)
    ?label:(label_ : xml_string_metric_label option)
    ?metric_stat:(metric_stat_ : metric_stat option)
    ?expression:(expression_ : xml_string_max_len1023 option) ~id:(id_ : xml_string_max_len255) () =
  ({
     return_data = return_data_;
     label = label_;
     metric_stat = metric_stat_;
     expression = expression_;
     id = id_;
   }
    : metric_data_query)

let make_predictive_scaling_customized_scaling_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_scaling_metric)

let make_predictive_scaling_customized_load_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_load_metric)

let make_predictive_scaling_customized_capacity_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_capacity_metric)

let make_predictive_scaling_metric_specification
    ?customized_capacity_metric_specification:
      (customized_capacity_metric_specification_ :
         predictive_scaling_customized_capacity_metric option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ : predictive_scaling_customized_load_metric option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ :
         predictive_scaling_customized_scaling_metric option)
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ : predictive_scaling_predefined_load_metric option)
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ :
         predictive_scaling_predefined_scaling_metric option)
    ?predefined_metric_pair_specification:
      (predefined_metric_pair_specification_ : predictive_scaling_predefined_metric_pair option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     customized_capacity_metric_specification = customized_capacity_metric_specification_;
     customized_load_metric_specification = customized_load_metric_specification_;
     customized_scaling_metric_specification = customized_scaling_metric_specification_;
     predefined_load_metric_specification = predefined_load_metric_specification_;
     predefined_scaling_metric_specification = predefined_scaling_metric_specification_;
     predefined_metric_pair_specification = predefined_metric_pair_specification_;
     target_value = target_value_;
   }
    : predictive_scaling_metric_specification)

let make_predictive_scaling_configuration
    ?max_capacity_buffer:(max_capacity_buffer_ : predictive_scaling_max_capacity_buffer option)
    ?max_capacity_breach_behavior:
      (max_capacity_breach_behavior_ : predictive_scaling_max_capacity_breach_behavior option)
    ?scheduling_buffer_time:
      (scheduling_buffer_time_ : predictive_scaling_scheduling_buffer_time option)
    ?mode:(mode_ : predictive_scaling_mode option)
    ~metric_specifications:(metric_specifications_ : predictive_scaling_metric_specifications) () =
  ({
     max_capacity_buffer = max_capacity_buffer_;
     max_capacity_breach_behavior = max_capacity_breach_behavior_;
     scheduling_buffer_time = scheduling_buffer_time_;
     mode = mode_;
     metric_specifications = metric_specifications_;
   }
    : predictive_scaling_configuration)

let make_scaling_policy
    ?predictive_scaling_configuration:
      (predictive_scaling_configuration_ : predictive_scaling_configuration option)
    ?enabled:(enabled_ : scaling_policy_enabled option)
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ?alarms:(alarms_ : alarms option)
    ?estimated_instance_warmup:(estimated_instance_warmup_ : estimated_instance_warmup option)
    ?metric_aggregation_type:(metric_aggregation_type_ : xml_string_max_len32 option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?cooldown:(cooldown_ : cooldown option)
    ?scaling_adjustment:(scaling_adjustment_ : policy_increment option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?min_adjustment_step:(min_adjustment_step_ : min_adjustment_step option)
    ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option)
    ?policy_type:(policy_type_ : xml_string_max_len64 option)
    ?policy_ar_n:(policy_ar_n_ : resource_name option)
    ?policy_name:(policy_name_ : xml_string_max_len255 option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option) () =
  ({
     predictive_scaling_configuration = predictive_scaling_configuration_;
     enabled = enabled_;
     target_tracking_configuration = target_tracking_configuration_;
     alarms = alarms_;
     estimated_instance_warmup = estimated_instance_warmup_;
     metric_aggregation_type = metric_aggregation_type_;
     step_adjustments = step_adjustments_;
     cooldown = cooldown_;
     scaling_adjustment = scaling_adjustment_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     min_adjustment_step = min_adjustment_step_;
     adjustment_type = adjustment_type_;
     policy_type = policy_type_;
     policy_ar_n = policy_ar_n_;
     policy_name = policy_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : scaling_policy)

let make_rollback_instance_refresh_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_ } : rollback_instance_refresh_type)

let make_rollback_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : rollback_instance_refresh_answer)

let make_instance_refresh_live_pool_progress
    ?instances_to_update:(instances_to_update_ : instances_to_update option)
    ?percentage_complete:(percentage_complete_ : int_percent option) () =
  ({ instances_to_update = instances_to_update_; percentage_complete = percentage_complete_ }
    : instance_refresh_live_pool_progress)

let make_instance_refresh_warm_pool_progress
    ?instances_to_update:(instances_to_update_ : instances_to_update option)
    ?percentage_complete:(percentage_complete_ : int_percent option) () =
  ({ instances_to_update = instances_to_update_; percentage_complete = percentage_complete_ }
    : instance_refresh_warm_pool_progress)

let make_instance_refresh_progress_details
    ?warm_pool_progress:(warm_pool_progress_ : instance_refresh_warm_pool_progress option)
    ?live_pool_progress:(live_pool_progress_ : instance_refresh_live_pool_progress option) () =
  ({ warm_pool_progress = warm_pool_progress_; live_pool_progress = live_pool_progress_ }
    : instance_refresh_progress_details)

let make_rollback_details
    ?progress_details_on_rollback:
      (progress_details_on_rollback_ : instance_refresh_progress_details option)
    ?instances_to_update_on_rollback:(instances_to_update_on_rollback_ : instances_to_update option)
    ?percentage_complete_on_rollback:(percentage_complete_on_rollback_ : int_percent option)
    ?rollback_start_time:(rollback_start_time_ : timestamp_type option)
    ?rollback_reason:(rollback_reason_ : xml_string_max_len1023 option) () =
  ({
     progress_details_on_rollback = progress_details_on_rollback_;
     instances_to_update_on_rollback = instances_to_update_on_rollback_;
     percentage_complete_on_rollback = percentage_complete_on_rollback_;
     rollback_start_time = rollback_start_time_;
     rollback_reason = rollback_reason_;
   }
    : rollback_details)

let make_record_lifecycle_action_heartbeat_type
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?lifecycle_action_token:(lifecycle_action_token_ : lifecycle_action_token option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : resource_name)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255) () =
  ({
     instance_id = instance_id_;
     lifecycle_action_token = lifecycle_action_token_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : record_lifecycle_action_heartbeat_type)

let make_record_lifecycle_action_heartbeat_answer () = (() : unit)

let make_put_warm_pool_type
    ?instance_reuse_policy:(instance_reuse_policy_ : instance_reuse_policy option)
    ?pool_state:(pool_state_ : warm_pool_state option)
    ?min_size:(min_size_ : warm_pool_min_size option)
    ?max_group_prepared_capacity:(max_group_prepared_capacity_ : max_group_prepared_capacity option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     instance_reuse_policy = instance_reuse_policy_;
     pool_state = pool_state_;
     min_size = min_size_;
     max_group_prepared_capacity = max_group_prepared_capacity_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : put_warm_pool_type)

let make_put_warm_pool_answer () = (() : unit)

let make_put_scheduled_update_group_action_type
    ?time_zone:(time_zone_ : xml_string_max_len255 option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?time:(time_ : timestamp_type option)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     time_zone = time_zone_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     recurrence = recurrence_;
     end_time = end_time_;
     start_time = start_time_;
     time = time_;
     scheduled_action_name = scheduled_action_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : put_scheduled_update_group_action_type)

let make_put_scaling_policy_type
    ?predictive_scaling_configuration:
      (predictive_scaling_configuration_ : predictive_scaling_configuration option)
    ?enabled:(enabled_ : scaling_policy_enabled option)
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ?estimated_instance_warmup:(estimated_instance_warmup_ : estimated_instance_warmup option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?metric_aggregation_type:(metric_aggregation_type_ : xml_string_max_len32 option)
    ?cooldown:(cooldown_ : cooldown option)
    ?scaling_adjustment:(scaling_adjustment_ : policy_increment option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?min_adjustment_step:(min_adjustment_step_ : min_adjustment_step option)
    ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option)
    ?policy_type:(policy_type_ : xml_string_max_len64 option)
    ~policy_name:(policy_name_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     predictive_scaling_configuration = predictive_scaling_configuration_;
     enabled = enabled_;
     target_tracking_configuration = target_tracking_configuration_;
     estimated_instance_warmup = estimated_instance_warmup_;
     step_adjustments = step_adjustments_;
     metric_aggregation_type = metric_aggregation_type_;
     cooldown = cooldown_;
     scaling_adjustment = scaling_adjustment_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     min_adjustment_step = min_adjustment_step_;
     adjustment_type = adjustment_type_;
     policy_type = policy_type_;
     policy_name = policy_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : put_scaling_policy_type)

let make_policy_arn_type ?alarms:(alarms_ : alarms option)
    ?policy_ar_n:(policy_ar_n_ : resource_name option) () =
  ({ alarms = alarms_; policy_ar_n = policy_ar_n_ } : policy_arn_type)

let make_put_notification_configuration_type
    ~notification_types:(notification_types_ : auto_scaling_notification_types)
    ~topic_ar_n:(topic_ar_n_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     notification_types = notification_types_;
     topic_ar_n = topic_ar_n_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : put_notification_configuration_type)

let make_put_lifecycle_hook_type ?default_result:(default_result_ : lifecycle_action_result option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ?lifecycle_transition:(lifecycle_transition_ : lifecycle_transition option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255) () =
  ({
     default_result = default_result_;
     heartbeat_timeout = heartbeat_timeout_;
     notification_metadata = notification_metadata_;
     notification_target_ar_n = notification_target_ar_n_;
     role_ar_n = role_ar_n_;
     lifecycle_transition = lifecycle_transition_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : put_lifecycle_hook_type)

let make_put_lifecycle_hook_answer () = (() : unit)

let make_process_type ~process_name:(process_name_ : xml_string_max_len255) () =
  ({ process_name = process_name_ } : process_type)

let make_processes_type ?processes:(processes_ : processes option) () =
  ({ processes = processes_ } : processes_type)

let make_policies_type ?next_token:(next_token_ : xml_string option)
    ?scaling_policies:(scaling_policies_ : scaling_policies option) () =
  ({ next_token = next_token_; scaling_policies = scaling_policies_ } : policies_type)

let make_notification_configuration
    ?notification_type:(notification_type_ : xml_string_max_len255 option)
    ?topic_ar_n:(topic_ar_n_ : xml_string_max_len255 option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option) () =
  ({
     notification_type = notification_type_;
     topic_ar_n = topic_ar_n_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : notification_configuration)

let make_metric_granularity_type ?granularity:(granularity_ : xml_string_max_len255 option) () =
  ({ granularity = granularity_ } : metric_granularity_type)

let make_metric_collection_type ?metric:(metric_ : xml_string_max_len255 option) () =
  ({ metric = metric_ } : metric_collection_type)

let make_load_forecast
    ~metric_specification:(metric_specification_ : predictive_scaling_metric_specification)
    ~values:(values_ : predictive_scaling_forecast_values)
    ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps) () =
  ({ metric_specification = metric_specification_; values = values_; timestamps = timestamps_ }
    : load_forecast)

let make_load_balancer_target_group_state ?state:(state_ : xml_string_max_len255 option)
    ?load_balancer_target_group_ar_n:
      (load_balancer_target_group_ar_n_ : xml_string_max_len511 option) () =
  ({ state = state_; load_balancer_target_group_ar_n = load_balancer_target_group_ar_n_ }
    : load_balancer_target_group_state)

let make_load_balancer_state ?state:(state_ : xml_string_max_len255 option)
    ?load_balancer_name:(load_balancer_name_ : xml_string_max_len255 option) () =
  ({ state = state_; load_balancer_name = load_balancer_name_ } : load_balancer_state)

let make_lifecycle_hook ?default_result:(default_result_ : lifecycle_action_result option)
    ?global_timeout:(global_timeout_ : global_timeout option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?lifecycle_transition:(lifecycle_transition_ : lifecycle_transition option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255 option) () =
  ({
     default_result = default_result_;
     global_timeout = global_timeout_;
     heartbeat_timeout = heartbeat_timeout_;
     notification_metadata = notification_metadata_;
     role_ar_n = role_ar_n_;
     notification_target_ar_n = notification_target_ar_n_;
     lifecycle_transition = lifecycle_transition_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : lifecycle_hook)

let make_lifecycle_hook_specification ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?default_result:(default_result_ : lifecycle_action_result option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ~lifecycle_transition:(lifecycle_transition_ : lifecycle_transition)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255) () =
  ({
     role_ar_n = role_ar_n_;
     notification_target_ar_n = notification_target_ar_n_;
     default_result = default_result_;
     heartbeat_timeout = heartbeat_timeout_;
     notification_metadata = notification_metadata_;
     lifecycle_transition = lifecycle_transition_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : lifecycle_hook_specification)

let make_instance_collection ?instance_ids:(instance_ids_ : instance_ids option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?availability_zone:(availability_zone_ : xml_string_max_len255 option)
    ?subnet_id:(subnet_id_ : xml_string_max_len255 option)
    ?market_type:(market_type_ : xml_string_max_len64 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option) () =
  ({
     instance_ids = instance_ids_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     subnet_id = subnet_id_;
     market_type = market_type_;
     instance_type = instance_type_;
   }
    : instance_collection)

let make_launch_instances_error ?error_message:(error_message_ : xml_string option)
    ?error_code:(error_code_ : xml_string_max_len64 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?availability_zone:(availability_zone_ : xml_string_max_len255 option)
    ?subnet_id:(subnet_id_ : xml_string_max_len255 option)
    ?market_type:(market_type_ : xml_string_max_len64 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     subnet_id = subnet_id_;
     market_type = market_type_;
     instance_type = instance_type_;
   }
    : launch_instances_error)

let make_launch_instances_request ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_limit1 option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids_limit1 option)
    ?availability_zones:(availability_zones_ : availability_zones_limit1 option)
    ~client_token:(client_token_ : client_token)
    ~requested_capacity:(requested_capacity_ : requested_capacity)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     retry_strategy = retry_strategy_;
     subnet_ids = subnet_ids_;
     availability_zone_ids = availability_zone_ids_;
     availability_zones = availability_zones_;
     client_token = client_token_;
     requested_capacity = requested_capacity_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : launch_instances_request)

let make_ebs ?throughput:(throughput_ : block_device_ebs_throughput option)
    ?encrypted:(encrypted_ : block_device_ebs_encrypted option)
    ?iops:(iops_ : block_device_ebs_iops option)
    ?delete_on_termination:(delete_on_termination_ : block_device_ebs_delete_on_termination option)
    ?volume_type:(volume_type_ : block_device_ebs_volume_type option)
    ?volume_size:(volume_size_ : block_device_ebs_volume_size option)
    ?snapshot_id:(snapshot_id_ : xml_string_max_len255 option) () =
  ({
     throughput = throughput_;
     encrypted = encrypted_;
     iops = iops_;
     delete_on_termination = delete_on_termination_;
     volume_type = volume_type_;
     volume_size = volume_size_;
     snapshot_id = snapshot_id_;
   }
    : ebs)

let make_block_device_mapping ?no_device:(no_device_ : no_device option) ?ebs:(ebs_ : ebs option)
    ?virtual_name:(virtual_name_ : xml_string_max_len255 option)
    ~device_name:(device_name_ : xml_string_max_len255) () =
  ({ no_device = no_device_; ebs = ebs_; device_name = device_name_; virtual_name = virtual_name_ }
    : block_device_mapping)

let make_instance_monitoring ?enabled:(enabled_ : monitoring_enabled option) () =
  ({ enabled = enabled_ } : instance_monitoring)

let make_instance_metadata_options
    ?http_endpoint:(http_endpoint_ : instance_metadata_endpoint_state option)
    ?http_put_response_hop_limit:
      (http_put_response_hop_limit_ : instance_metadata_http_put_response_hop_limit option)
    ?http_tokens:(http_tokens_ : instance_metadata_http_tokens_state option) () =
  ({
     http_endpoint = http_endpoint_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_tokens = http_tokens_;
   }
    : instance_metadata_options)

let make_launch_configuration
    ?metadata_options:(metadata_options_ : instance_metadata_options option)
    ?placement_tenancy:(placement_tenancy_ : xml_string_max_len64 option)
    ?associate_public_ip_address:(associate_public_ip_address_ : associate_public_ip_address option)
    ?ebs_optimized:(ebs_optimized_ : ebs_optimized option)
    ?iam_instance_profile:(iam_instance_profile_ : xml_string_max_len1600 option)
    ?spot_price:(spot_price_ : spot_price option)
    ?instance_monitoring:(instance_monitoring_ : instance_monitoring option)
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option)
    ?ramdisk_id:(ramdisk_id_ : xml_string_max_len255 option)
    ?kernel_id:(kernel_id_ : xml_string_max_len255 option)
    ?user_data:(user_data_ : xml_string_user_data option)
    ?classic_link_vpc_security_groups:
      (classic_link_vpc_security_groups_ : classic_link_vpc_security_groups option)
    ?classic_link_vpc_id:(classic_link_vpc_id_ : xml_string_max_len255 option)
    ?security_groups:(security_groups_ : security_groups option)
    ?key_name:(key_name_ : xml_string_max_len255 option)
    ?launch_configuration_ar_n:(launch_configuration_ar_n_ : resource_name option)
    ~created_time:(created_time_ : timestamp_type)
    ~instance_type:(instance_type_ : xml_string_max_len255)
    ~image_id:(image_id_ : xml_string_max_len255)
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255) () =
  ({
     metadata_options = metadata_options_;
     placement_tenancy = placement_tenancy_;
     associate_public_ip_address = associate_public_ip_address_;
     ebs_optimized = ebs_optimized_;
     created_time = created_time_;
     iam_instance_profile = iam_instance_profile_;
     spot_price = spot_price_;
     instance_monitoring = instance_monitoring_;
     block_device_mappings = block_device_mappings_;
     ramdisk_id = ramdisk_id_;
     kernel_id = kernel_id_;
     instance_type = instance_type_;
     user_data = user_data_;
     classic_link_vpc_security_groups = classic_link_vpc_security_groups_;
     classic_link_vpc_id = classic_link_vpc_id_;
     security_groups = security_groups_;
     key_name = key_name_;
     image_id = image_id_;
     launch_configuration_ar_n = launch_configuration_ar_n_;
     launch_configuration_name = launch_configuration_name_;
   }
    : launch_configuration)

let make_launch_configurations_type ?next_token:(next_token_ : xml_string option)
    ~launch_configurations:(launch_configurations_ : launch_configurations) () =
  ({ next_token = next_token_; launch_configurations = launch_configurations_ }
    : launch_configurations_type)

let make_launch_configuration_names_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ?launch_configuration_names:(launch_configuration_names_ : launch_configuration_names option) ()
    =
  ({
     max_records = max_records_;
     next_token = next_token_;
     launch_configuration_names = launch_configuration_names_;
   }
    : launch_configuration_names_type)

let make_launch_configuration_name_type
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255) () =
  ({ launch_configuration_name = launch_configuration_name_ } : launch_configuration_name_type)

let make_instance ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ?image_id:(image_id_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ~protected_from_scale_in:(protected_from_scale_in_ : instance_protected)
    ~health_status:(health_status_ : xml_string_max_len32)
    ~lifecycle_state:(lifecycle_state_ : lifecycle_state)
    ~availability_zone:(availability_zone_ : xml_string_max_len255)
    ~instance_id:(instance_id_ : xml_string_max_len19) () =
  ({
     weighted_capacity = weighted_capacity_;
     protected_from_scale_in = protected_from_scale_in_;
     image_id = image_id_;
     launch_template = launch_template_;
     launch_configuration_name = launch_configuration_name_;
     health_status = health_status_;
     lifecycle_state = lifecycle_state_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     instance_type = instance_type_;
     instance_id = instance_id_;
   }
    : instance)

let make_instance_refresh ?strategy:(strategy_ : refresh_strategy option)
    ?rollback_details:(rollback_details_ : rollback_details option)
    ?desired_configuration:(desired_configuration_ : desired_configuration option)
    ?preferences:(preferences_ : refresh_preferences option)
    ?progress_details:(progress_details_ : instance_refresh_progress_details option)
    ?instances_to_update:(instances_to_update_ : instances_to_update option)
    ?percentage_complete:(percentage_complete_ : int_percent option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?status_reason:(status_reason_ : xml_string_max_len1023 option)
    ?status:(status_ : instance_refresh_status option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({
     strategy = strategy_;
     rollback_details = rollback_details_;
     desired_configuration = desired_configuration_;
     preferences = preferences_;
     progress_details = progress_details_;
     instances_to_update = instances_to_update_;
     percentage_complete = percentage_complete_;
     end_time = end_time_;
     start_time = start_time_;
     status_reason = status_reason_;
     status = status_;
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_refresh_id = instance_refresh_id_;
   }
    : instance_refresh)

let make_get_predictive_scaling_forecast_type ~end_time:(end_time_ : timestamp_type)
    ~start_time:(start_time_ : timestamp_type) ~policy_name:(policy_name_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     policy_name = policy_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : get_predictive_scaling_forecast_type)

let make_capacity_forecast ~values:(values_ : predictive_scaling_forecast_values)
    ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps) () =
  ({ values = values_; timestamps = timestamps_ } : capacity_forecast)

let make_get_predictive_scaling_forecast_answer ~update_time:(update_time_ : timestamp_type)
    ~capacity_forecast:(capacity_forecast_ : capacity_forecast)
    ~load_forecast:(load_forecast_ : load_forecasts) () =
  ({
     update_time = update_time_;
     capacity_forecast = capacity_forecast_;
     load_forecast = load_forecast_;
   }
    : get_predictive_scaling_forecast_answer)

let make_filter ?values:(values_ : values option) ?name:(name_ : xml_string option) () =
  ({ values = values_; name = name_ } : filter)

let make_failed_scheduled_update_group_action_request
    ?error_message:(error_message_ : xml_string option)
    ?error_code:(error_code_ : xml_string_max_len64 option)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     scheduled_action_name = scheduled_action_name_;
   }
    : failed_scheduled_update_group_action_request)

let make_exit_standby_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; instance_ids = instance_ids_ }
    : exit_standby_query)

let make_exit_standby_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : exit_standby_answer)

let make_execute_policy_type ?breach_threshold:(breach_threshold_ : metric_scale option)
    ?metric_value:(metric_value_ : metric_scale option)
    ?honor_cooldown:(honor_cooldown_ : honor_cooldown option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ~policy_name:(policy_name_ : resource_name) () =
  ({
     breach_threshold = breach_threshold_;
     metric_value = metric_value_;
     honor_cooldown = honor_cooldown_;
     policy_name = policy_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : execute_policy_type)

let make_enter_standby_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_ids = instance_ids_;
   }
    : enter_standby_query)

let make_enter_standby_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : enter_standby_answer)

let make_enabled_metric ?granularity:(granularity_ : xml_string_max_len255 option)
    ?metric:(metric_ : xml_string_max_len255 option) () =
  ({ granularity = granularity_; metric = metric_ } : enabled_metric)

let make_enable_metrics_collection_query ?metrics:(metrics_ : metrics option)
    ~granularity:(granularity_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     granularity = granularity_;
     metrics = metrics_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : enable_metrics_collection_query)

let make_disable_metrics_collection_query ?metrics:(metrics_ : metrics option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ metrics = metrics_; auto_scaling_group_name = auto_scaling_group_name_ }
    : disable_metrics_collection_query)

let make_detach_traffic_sources_type ~traffic_sources:(traffic_sources_ : traffic_sources)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ traffic_sources = traffic_sources_; auto_scaling_group_name = auto_scaling_group_name_ }
    : detach_traffic_sources_type)

let make_detach_traffic_sources_result_type () = (() : unit)

let make_detach_load_balancers_type
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     load_balancer_names = load_balancer_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : detach_load_balancers_type)

let make_detach_load_balancers_result_type () = (() : unit)

let make_detach_load_balancer_target_groups_type
    ~target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ target_group_ar_ns = target_group_ar_ns_; auto_scaling_group_name = auto_scaling_group_name_ }
    : detach_load_balancer_target_groups_type)

let make_detach_load_balancer_target_groups_result_type () = (() : unit)

let make_detach_instances_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_ids = instance_ids_;
   }
    : detach_instances_query)

let make_detach_instances_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : detach_instances_answer)

let make_describe_warm_pool_type ?next_token:(next_token_ : xml_string option)
    ?max_records:(max_records_ : max_records option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_warm_pool_type)

let make_describe_warm_pool_answer ?next_token:(next_token_ : xml_string option)
    ?instances:(instances_ : instances option)
    ?warm_pool_configuration:(warm_pool_configuration_ : warm_pool_configuration option) () =
  ({
     next_token = next_token_;
     instances = instances_;
     warm_pool_configuration = warm_pool_configuration_;
   }
    : describe_warm_pool_answer)

let make_describe_traffic_sources_response ?next_token:(next_token_ : xml_string option)
    ?traffic_sources:(traffic_sources_ : traffic_source_states option) () =
  ({ next_token = next_token_; traffic_sources = traffic_sources_ }
    : describe_traffic_sources_response)

let make_describe_traffic_sources_request ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ?traffic_source_type:(traffic_source_type_ : xml_string_max_len255 option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     traffic_source_type = traffic_source_type_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_traffic_sources_request)

let make_describe_termination_policy_types_answer
    ?termination_policy_types:(termination_policy_types_ : termination_policies option) () =
  ({ termination_policy_types = termination_policy_types_ }
    : describe_termination_policy_types_answer)

let make_describe_tags_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option) ?filters:(filters_ : filters option) () =
  ({ max_records = max_records_; next_token = next_token_; filters = filters_ }
    : describe_tags_type)

let make_describe_scheduled_actions_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option) ?end_time:(end_time_ : timestamp_type option)
    ?start_time:(start_time_ : timestamp_type option)
    ?scheduled_action_names:(scheduled_action_names_ : scheduled_action_names option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     scheduled_action_names = scheduled_action_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_scheduled_actions_type)

let make_describe_scaling_activities_type ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    ?include_deleted_groups:(include_deleted_groups_ : include_deleted_groups option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?activity_ids:(activity_ids_ : activity_ids option) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_records = max_records_;
     include_deleted_groups = include_deleted_groups_;
     auto_scaling_group_name = auto_scaling_group_name_;
     activity_ids = activity_ids_;
   }
    : describe_scaling_activities_type)

let make_activities_type ?next_token:(next_token_ : xml_string option)
    ~activities:(activities_ : activities) () =
  ({ next_token = next_token_; activities = activities_ } : activities_type)

let make_describe_policies_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ?policy_types:(policy_types_ : policy_types option)
    ?policy_names:(policy_names_ : policy_names option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     policy_types = policy_types_;
     policy_names = policy_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_policies_type)

let make_describe_notification_configurations_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ?auto_scaling_group_names:(auto_scaling_group_names_ : auto_scaling_group_names option) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     auto_scaling_group_names = auto_scaling_group_names_;
   }
    : describe_notification_configurations_type)

let make_describe_notification_configurations_answer ?next_token:(next_token_ : xml_string option)
    ~notification_configurations:(notification_configurations_ : notification_configurations) () =
  ({ next_token = next_token_; notification_configurations = notification_configurations_ }
    : describe_notification_configurations_answer)

let make_describe_metric_collection_types_answer
    ?granularities:(granularities_ : metric_granularity_types option)
    ?metrics:(metrics_ : metric_collection_types option) () =
  ({ granularities = granularities_; metrics = metrics_ } : describe_metric_collection_types_answer)

let make_describe_load_balancers_response ?next_token:(next_token_ : xml_string option)
    ?load_balancers:(load_balancers_ : load_balancer_states option) () =
  ({ next_token = next_token_; load_balancers = load_balancers_ }
    : describe_load_balancers_response)

let make_describe_load_balancers_request ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_load_balancers_request)

let make_describe_load_balancer_target_groups_response ?next_token:(next_token_ : xml_string option)
    ?load_balancer_target_groups:
      (load_balancer_target_groups_ : load_balancer_target_group_states option) () =
  ({ next_token = next_token_; load_balancer_target_groups = load_balancer_target_groups_ }
    : describe_load_balancer_target_groups_response)

let make_describe_load_balancer_target_groups_request
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : xml_string option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_load_balancer_target_groups_request)

let make_describe_lifecycle_hooks_type
    ?lifecycle_hook_names:(lifecycle_hook_names_ : lifecycle_hook_names option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     lifecycle_hook_names = lifecycle_hook_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_lifecycle_hooks_type)

let make_describe_lifecycle_hooks_answer
    ?lifecycle_hooks:(lifecycle_hooks_ : lifecycle_hooks option) () =
  ({ lifecycle_hooks = lifecycle_hooks_ } : describe_lifecycle_hooks_answer)

let make_describe_lifecycle_hook_types_answer
    ?lifecycle_hook_types:(lifecycle_hook_types_ : auto_scaling_notification_types option) () =
  ({ lifecycle_hook_types = lifecycle_hook_types_ } : describe_lifecycle_hook_types_answer)

let make_describe_instance_refreshes_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ?instance_refresh_ids:(instance_refresh_ids_ : instance_refresh_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     max_records = max_records_;
     next_token = next_token_;
     instance_refresh_ids = instance_refresh_ids_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : describe_instance_refreshes_type)

let make_describe_instance_refreshes_answer ?next_token:(next_token_ : xml_string option)
    ?instance_refreshes:(instance_refreshes_ : instance_refreshes option) () =
  ({ next_token = next_token_; instance_refreshes = instance_refreshes_ }
    : describe_instance_refreshes_answer)

let make_describe_auto_scaling_notification_types_answer
    ?auto_scaling_notification_types:
      (auto_scaling_notification_types_ : auto_scaling_notification_types option) () =
  ({ auto_scaling_notification_types = auto_scaling_notification_types_ }
    : describe_auto_scaling_notification_types_answer)

let make_describe_auto_scaling_instances_type ?next_token:(next_token_ : xml_string option)
    ?max_records:(max_records_ : max_records option)
    ?instance_ids:(instance_ids_ : instance_ids option) () =
  ({ next_token = next_token_; max_records = max_records_; instance_ids = instance_ids_ }
    : describe_auto_scaling_instances_type)

let make_auto_scaling_instance_details
    ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ?image_id:(image_id_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ~protected_from_scale_in:(protected_from_scale_in_ : instance_protected)
    ~health_status:(health_status_ : xml_string_max_len32)
    ~lifecycle_state:(lifecycle_state_ : xml_string_max_len32)
    ~availability_zone:(availability_zone_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~instance_id:(instance_id_ : xml_string_max_len19) () =
  ({
     weighted_capacity = weighted_capacity_;
     protected_from_scale_in = protected_from_scale_in_;
     image_id = image_id_;
     launch_template = launch_template_;
     launch_configuration_name = launch_configuration_name_;
     health_status = health_status_;
     lifecycle_state = lifecycle_state_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_type = instance_type_;
     instance_id = instance_id_;
   }
    : auto_scaling_instance_details)

let make_auto_scaling_instances_type ?next_token:(next_token_ : xml_string option)
    ?auto_scaling_instances:(auto_scaling_instances_ : auto_scaling_instances option) () =
  ({ next_token = next_token_; auto_scaling_instances = auto_scaling_instances_ }
    : auto_scaling_instances_type)

let make_auto_scaling_group
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?traffic_sources:(traffic_sources_ : traffic_sources option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?context:(context_ : context option) ?warm_pool_size:(warm_pool_size_ : warm_pool_size option)
    ?warm_pool_configuration:(warm_pool_configuration_ : warm_pool_configuration option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?tags:(tags_ : tag_description_list option) ?status:(status_ : xml_string_max_len255 option)
    ?enabled_metrics:(enabled_metrics_ : enabled_metrics option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?placement_group:(placement_group_ : xml_string_max_len255 option)
    ?suspended_processes:(suspended_processes_ : suspended_processes option)
    ?instances:(instances_ : instances option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns option)
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?predicted_capacity:(predicted_capacity_ : auto_scaling_group_predicted_capacity option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?auto_scaling_group_ar_n:(auto_scaling_group_ar_n_ : resource_name option)
    ~created_time:(created_time_ : timestamp_type)
    ~health_check_type:(health_check_type_ : xml_string_max_len32)
    ~availability_zones:(availability_zones_ : availability_zones)
    ~default_cooldown:(default_cooldown_ : cooldown)
    ~desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity)
    ~max_size:(max_size_ : auto_scaling_group_max_size)
    ~min_size:(min_size_ : auto_scaling_group_min_size)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     instance_lifecycle_policy = instance_lifecycle_policy_;
     capacity_reservation_specification = capacity_reservation_specification_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     availability_zone_distribution = availability_zone_distribution_;
     deletion_protection = deletion_protection_;
     instance_maintenance_policy = instance_maintenance_policy_;
     traffic_sources = traffic_sources_;
     default_instance_warmup = default_instance_warmup_;
     desired_capacity_type = desired_capacity_type_;
     context = context_;
     warm_pool_size = warm_pool_size_;
     warm_pool_configuration = warm_pool_configuration_;
     capacity_rebalance = capacity_rebalance_;
     max_instance_lifetime = max_instance_lifetime_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     termination_policies = termination_policies_;
     tags = tags_;
     status = status_;
     enabled_metrics = enabled_metrics_;
     vpc_zone_identifier = vpc_zone_identifier_;
     placement_group = placement_group_;
     suspended_processes = suspended_processes_;
     created_time = created_time_;
     instances = instances_;
     health_check_grace_period = health_check_grace_period_;
     health_check_type = health_check_type_;
     target_group_ar_ns = target_group_ar_ns_;
     load_balancer_names = load_balancer_names_;
     availability_zone_ids = availability_zone_ids_;
     availability_zones = availability_zones_;
     default_cooldown = default_cooldown_;
     predicted_capacity = predicted_capacity_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     mixed_instances_policy = mixed_instances_policy_;
     launch_template = launch_template_;
     launch_configuration_name = launch_configuration_name_;
     auto_scaling_group_ar_n = auto_scaling_group_ar_n_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : auto_scaling_group)

let make_auto_scaling_groups_type ?next_token:(next_token_ : xml_string option)
    ~auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_groups) () =
  ({ next_token = next_token_; auto_scaling_groups = auto_scaling_groups_ }
    : auto_scaling_groups_type)

let make_auto_scaling_group_names_type ?filters:(filters_ : filters option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : xml_string option)
    ?include_instances:(include_instances_ : include_instances option)
    ?auto_scaling_group_names:(auto_scaling_group_names_ : auto_scaling_group_names option) () =
  ({
     filters = filters_;
     max_records = max_records_;
     next_token = next_token_;
     include_instances = include_instances_;
     auto_scaling_group_names = auto_scaling_group_names_;
   }
    : auto_scaling_group_names_type)

let make_adjustment_type ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option) () =
  ({ adjustment_type = adjustment_type_ } : adjustment_type)

let make_describe_adjustment_types_answer
    ?adjustment_types:(adjustment_types_ : adjustment_types option) () =
  ({ adjustment_types = adjustment_types_ } : describe_adjustment_types_answer)

let make_describe_account_limits_answer
    ?number_of_launch_configurations:
      (number_of_launch_configurations_ : number_of_launch_configurations option)
    ?number_of_auto_scaling_groups:
      (number_of_auto_scaling_groups_ : number_of_auto_scaling_groups option)
    ?max_number_of_launch_configurations:
      (max_number_of_launch_configurations_ : max_number_of_launch_configurations option)
    ?max_number_of_auto_scaling_groups:
      (max_number_of_auto_scaling_groups_ : max_number_of_auto_scaling_groups option) () =
  ({
     number_of_launch_configurations = number_of_launch_configurations_;
     number_of_auto_scaling_groups = number_of_auto_scaling_groups_;
     max_number_of_launch_configurations = max_number_of_launch_configurations_;
     max_number_of_auto_scaling_groups = max_number_of_auto_scaling_groups_;
   }
    : describe_account_limits_answer)

let make_delete_warm_pool_type ?force_delete:(force_delete_ : force_delete option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ force_delete = force_delete_; auto_scaling_group_name = auto_scaling_group_name_ }
    : delete_warm_pool_type)

let make_delete_warm_pool_answer () = (() : unit)
let make_delete_tags_type ~tags:(tags_ : tags) () = ({ tags = tags_ } : delete_tags_type)

let make_delete_scheduled_action_type
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : delete_scheduled_action_type)

let make_delete_policy_type
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ~policy_name:(policy_name_ : resource_name) () =
  ({ policy_name = policy_name_; auto_scaling_group_name = auto_scaling_group_name_ }
    : delete_policy_type)

let make_delete_notification_configuration_type ~topic_ar_n:(topic_ar_n_ : xml_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ topic_ar_n = topic_ar_n_; auto_scaling_group_name = auto_scaling_group_name_ }
    : delete_notification_configuration_type)

let make_delete_lifecycle_hook_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : delete_lifecycle_hook_type)

let make_delete_lifecycle_hook_answer () = (() : unit)

let make_delete_auto_scaling_group_type ?force_delete:(force_delete_ : force_delete option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ force_delete = force_delete_; auto_scaling_group_name = auto_scaling_group_name_ }
    : delete_auto_scaling_group_type)

let make_create_or_update_tags_type ~tags:(tags_ : tags) () =
  ({ tags = tags_ } : create_or_update_tags_type)

let make_create_launch_configuration_type
    ?metadata_options:(metadata_options_ : instance_metadata_options option)
    ?placement_tenancy:(placement_tenancy_ : xml_string_max_len64 option)
    ?associate_public_ip_address:(associate_public_ip_address_ : associate_public_ip_address option)
    ?ebs_optimized:(ebs_optimized_ : ebs_optimized option)
    ?iam_instance_profile:(iam_instance_profile_ : xml_string_max_len1600 option)
    ?spot_price:(spot_price_ : spot_price option)
    ?instance_monitoring:(instance_monitoring_ : instance_monitoring option)
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option)
    ?ramdisk_id:(ramdisk_id_ : xml_string_max_len255 option)
    ?kernel_id:(kernel_id_ : xml_string_max_len255 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?user_data:(user_data_ : xml_string_user_data option)
    ?classic_link_vpc_security_groups:
      (classic_link_vpc_security_groups_ : classic_link_vpc_security_groups option)
    ?classic_link_vpc_id:(classic_link_vpc_id_ : xml_string_max_len255 option)
    ?security_groups:(security_groups_ : security_groups option)
    ?key_name:(key_name_ : xml_string_max_len255 option)
    ?image_id:(image_id_ : xml_string_max_len255 option)
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255) () =
  ({
     metadata_options = metadata_options_;
     placement_tenancy = placement_tenancy_;
     associate_public_ip_address = associate_public_ip_address_;
     ebs_optimized = ebs_optimized_;
     iam_instance_profile = iam_instance_profile_;
     spot_price = spot_price_;
     instance_monitoring = instance_monitoring_;
     block_device_mappings = block_device_mappings_;
     ramdisk_id = ramdisk_id_;
     kernel_id = kernel_id_;
     instance_type = instance_type_;
     instance_id = instance_id_;
     user_data = user_data_;
     classic_link_vpc_security_groups = classic_link_vpc_security_groups_;
     classic_link_vpc_id = classic_link_vpc_id_;
     security_groups = security_groups_;
     key_name = key_name_;
     image_id = image_id_;
     launch_configuration_name = launch_configuration_name_;
   }
    : create_launch_configuration_type)

let make_create_auto_scaling_group_type
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?traffic_sources:(traffic_sources_ : traffic_sources option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?context:(context_ : context option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?tags:(tags_ : tags option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?lifecycle_hook_specification_list:
      (lifecycle_hook_specification_list_ : lifecycle_hook_specifications option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?placement_group:(placement_group_ : xml_string_max_len255 option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?health_check_type:(health_check_type_ : xml_string_max_len32 option)
    ?target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns option)
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?default_cooldown:(default_cooldown_ : cooldown option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ~max_size:(max_size_ : auto_scaling_group_max_size)
    ~min_size:(min_size_ : auto_scaling_group_min_size)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     instance_lifecycle_policy = instance_lifecycle_policy_;
     capacity_reservation_specification = capacity_reservation_specification_;
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     availability_zone_distribution = availability_zone_distribution_;
     instance_maintenance_policy = instance_maintenance_policy_;
     traffic_sources = traffic_sources_;
     default_instance_warmup = default_instance_warmup_;
     desired_capacity_type = desired_capacity_type_;
     context = context_;
     max_instance_lifetime = max_instance_lifetime_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     tags = tags_;
     deletion_protection = deletion_protection_;
     lifecycle_hook_specification_list = lifecycle_hook_specification_list_;
     capacity_rebalance = capacity_rebalance_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     termination_policies = termination_policies_;
     vpc_zone_identifier = vpc_zone_identifier_;
     placement_group = placement_group_;
     health_check_grace_period = health_check_grace_period_;
     health_check_type = health_check_type_;
     target_group_ar_ns = target_group_ar_ns_;
     load_balancer_names = load_balancer_names_;
     availability_zone_ids = availability_zone_ids_;
     availability_zones = availability_zones_;
     default_cooldown = default_cooldown_;
     desired_capacity = desired_capacity_;
     max_size = max_size_;
     min_size = min_size_;
     instance_id = instance_id_;
     mixed_instances_policy = mixed_instances_policy_;
     launch_template = launch_template_;
     launch_configuration_name = launch_configuration_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : create_auto_scaling_group_type)

let make_complete_lifecycle_action_type ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?lifecycle_action_token:(lifecycle_action_token_ : lifecycle_action_token option)
    ~lifecycle_action_result:(lifecycle_action_result_ : lifecycle_action_result)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : resource_name)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255) () =
  ({
     instance_id = instance_id_;
     lifecycle_action_result = lifecycle_action_result_;
     lifecycle_action_token = lifecycle_action_token_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_name = lifecycle_hook_name_;
   }
    : complete_lifecycle_action_type)

let make_complete_lifecycle_action_answer () = (() : unit)

let make_cancel_instance_refresh_type
    ?wait_for_transitioning_instances:(wait_for_transitioning_instances_ : boolean_type option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     wait_for_transitioning_instances = wait_for_transitioning_instances_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : cancel_instance_refresh_type)

let make_cancel_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : cancel_instance_refresh_answer)

let make_batch_put_scheduled_update_group_action_type
    ~scheduled_update_group_actions:
      (scheduled_update_group_actions_ : scheduled_update_group_action_requests)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     scheduled_update_group_actions = scheduled_update_group_actions_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : batch_put_scheduled_update_group_action_type)

let make_batch_put_scheduled_update_group_action_answer
    ?failed_scheduled_update_group_actions:
      (failed_scheduled_update_group_actions_ : failed_scheduled_update_group_action_requests option)
    () =
  ({ failed_scheduled_update_group_actions = failed_scheduled_update_group_actions_ }
    : batch_put_scheduled_update_group_action_answer)

let make_batch_delete_scheduled_action_type
    ~scheduled_action_names:(scheduled_action_names_ : scheduled_action_names)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     scheduled_action_names = scheduled_action_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : batch_delete_scheduled_action_type)

let make_batch_delete_scheduled_action_answer
    ?failed_scheduled_actions:
      (failed_scheduled_actions_ : failed_scheduled_update_group_action_requests option) () =
  ({ failed_scheduled_actions = failed_scheduled_actions_ } : batch_delete_scheduled_action_answer)

let make_attach_traffic_sources_result_type () = (() : unit)

let make_attach_traffic_sources_type
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ~traffic_sources:(traffic_sources_ : traffic_sources)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
     traffic_sources = traffic_sources_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : attach_traffic_sources_type)

let make_attach_load_balancer_target_groups_result_type () = (() : unit)

let make_attach_load_balancer_target_groups_type
    ~target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ target_group_ar_ns = target_group_ar_ns_; auto_scaling_group_name = auto_scaling_group_name_ }
    : attach_load_balancer_target_groups_type)

let make_attach_load_balancers_result_type () = (() : unit)

let make_attach_load_balancers_type
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     load_balancer_names = load_balancer_names_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : attach_load_balancers_type)

let make_attach_instances_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; instance_ids = instance_ids_ }
    : attach_instances_query)
