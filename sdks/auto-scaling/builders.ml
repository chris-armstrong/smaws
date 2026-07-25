open Types

let make_accelerator_count_request ?min:(min_ : nullable_positive_integer option)
    ?max:(max_ : nullable_positive_integer option) () =
  ({ min = min_; max = max_ } : accelerator_count_request)

let make_accelerator_total_memory_mi_b_request ?min:(min_ : nullable_positive_integer option)
    ?max:(max_ : nullable_positive_integer option) () =
  ({ min = min_; max = max_ } : accelerator_total_memory_mi_b_request)

let make_activity ?description:(description_ : xml_string option)
    ?end_time:(end_time_ : timestamp_type option)
    ?status_message:(status_message_ : xml_string_max_len255 option)
    ?progress:(progress_ : progress option) ?details:(details_ : xml_string option)
    ?auto_scaling_group_state:(auto_scaling_group_state_ : auto_scaling_group_state option)
    ?auto_scaling_group_ar_n:(auto_scaling_group_ar_n_ : resource_name option)
    ~activity_id:(activity_id_ : xml_string)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~cause:(cause_ : xml_string_max_len1023) ~start_time:(start_time_ : timestamp_type)
    ~status_code:(status_code_ : scaling_activity_status_code) () =
  ({
     activity_id = activity_id_;
     auto_scaling_group_name = auto_scaling_group_name_;
     description = description_;
     cause = cause_;
     start_time = start_time_;
     end_time = end_time_;
     status_code = status_code_;
     status_message = status_message_;
     progress = progress_;
     details = details_;
     auto_scaling_group_state = auto_scaling_group_state_;
     auto_scaling_group_ar_n = auto_scaling_group_ar_n_;
   }
    : activity)

let make_activities_type ?next_token:(next_token_ : xml_string option)
    ~activities:(activities_ : activities) () =
  ({ activities = activities_; next_token = next_token_ } : activities_type)

let make_activity_type ?activity:(activity_ : activity option) () =
  ({ activity = activity_ } : activity_type)

let make_adjustment_type ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option) () =
  ({ adjustment_type = adjustment_type_ } : adjustment_type)

let make_alarm ?alarm_name:(alarm_name_ : xml_string_max_len255 option)
    ?alarm_ar_n:(alarm_ar_n_ : resource_name option) () =
  ({ alarm_name = alarm_name_; alarm_ar_n = alarm_ar_n_ } : alarm)

let make_alarm_specification ?alarms:(alarms_ : alarm_list option) () =
  ({ alarms = alarms_ } : alarm_specification)

let make_attach_instances_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ instance_ids = instance_ids_; auto_scaling_group_name = auto_scaling_group_name_ }
    : attach_instances_query)

let make_attach_load_balancer_target_groups_result_type () = (() : unit)

let make_attach_load_balancer_target_groups_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; target_group_ar_ns = target_group_ar_ns_ }
    : attach_load_balancer_target_groups_type)

let make_attach_load_balancers_result_type () = (() : unit)

let make_attach_load_balancers_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     load_balancer_names = load_balancer_names_;
   }
    : attach_load_balancers_type)

let make_attach_traffic_sources_result_type () = (() : unit)

let make_traffic_source_identifier ?type_:(type__ : xml_string_max_len511 option)
    ~identifier:(identifier_ : xml_string_max_len511) () =
  ({ identifier = identifier_; type_ = type__ } : traffic_source_identifier)

let make_attach_traffic_sources_type
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~traffic_sources:(traffic_sources_ : traffic_sources) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     traffic_sources = traffic_sources_;
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
   }
    : attach_traffic_sources_type)

let make_retention_triggers
    ?terminate_hook_abandon:(terminate_hook_abandon_ : retention_action option) () =
  ({ terminate_hook_abandon = terminate_hook_abandon_ } : retention_triggers)

let make_instance_lifecycle_policy
    ?retention_triggers:(retention_triggers_ : retention_triggers option) () =
  ({ retention_triggers = retention_triggers_ } : instance_lifecycle_policy)

let make_capacity_reservation_target
    ?capacity_reservation_ids:(capacity_reservation_ids_ : capacity_reservation_ids option)
    ?capacity_reservation_resource_group_arns:
      (capacity_reservation_resource_group_arns_ : capacity_reservation_resource_group_arns option)
    () =
  ({
     capacity_reservation_ids = capacity_reservation_ids_;
     capacity_reservation_resource_group_arns = capacity_reservation_resource_group_arns_;
   }
    : capacity_reservation_target)

let make_capacity_reservation_specification
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option)
    ?capacity_reservation_target:(capacity_reservation_target_ : capacity_reservation_target option)
    () =
  ({
     capacity_reservation_preference = capacity_reservation_preference_;
     capacity_reservation_target = capacity_reservation_target_;
   }
    : capacity_reservation_specification)

let make_availability_zone_impairment_policy
    ?zonal_shift_enabled:(zonal_shift_enabled_ : zonal_shift_enabled option)
    ?impaired_zone_health_check_behavior:
      (impaired_zone_health_check_behavior_ : impaired_zone_health_check_behavior option) () =
  ({
     zonal_shift_enabled = zonal_shift_enabled_;
     impaired_zone_health_check_behavior = impaired_zone_health_check_behavior_;
   }
    : availability_zone_impairment_policy)

let make_availability_zone_distribution
    ?capacity_distribution_strategy:
      (capacity_distribution_strategy_ : capacity_distribution_strategy option) () =
  ({ capacity_distribution_strategy = capacity_distribution_strategy_ }
    : availability_zone_distribution)

let make_instance_maintenance_policy
    ?min_healthy_percentage:(min_healthy_percentage_ : int_percent_resettable option)
    ?max_healthy_percentage:(max_healthy_percentage_ : int_percent100_to200_resettable option) () =
  ({
     min_healthy_percentage = min_healthy_percentage_;
     max_healthy_percentage = max_healthy_percentage_;
   }
    : instance_maintenance_policy)

let make_instance_reuse_policy ?reuse_on_scale_in:(reuse_on_scale_in_ : reuse_on_scale_in option) ()
    =
  ({ reuse_on_scale_in = reuse_on_scale_in_ } : instance_reuse_policy)

let make_warm_pool_configuration
    ?max_group_prepared_capacity:(max_group_prepared_capacity_ : max_group_prepared_capacity option)
    ?min_size:(min_size_ : warm_pool_min_size option)
    ?pool_state:(pool_state_ : warm_pool_state option) ?status:(status_ : warm_pool_status option)
    ?instance_reuse_policy:(instance_reuse_policy_ : instance_reuse_policy option) () =
  ({
     max_group_prepared_capacity = max_group_prepared_capacity_;
     min_size = min_size_;
     pool_state = pool_state_;
     status = status_;
     instance_reuse_policy = instance_reuse_policy_;
   }
    : warm_pool_configuration)

let make_tag_description ?resource_id:(resource_id_ : xml_string option)
    ?resource_type:(resource_type_ : xml_string option) ?key:(key_ : tag_key option)
    ?value:(value_ : tag_value option)
    ?propagate_at_launch:(propagate_at_launch_ : propagate_at_launch option) () =
  ({
     resource_id = resource_id_;
     resource_type = resource_type_;
     key = key_;
     value = value_;
     propagate_at_launch = propagate_at_launch_;
   }
    : tag_description)

let make_enabled_metric ?metric:(metric_ : xml_string_max_len255 option)
    ?granularity:(granularity_ : xml_string_max_len255 option) () =
  ({ metric = metric_; granularity = granularity_ } : enabled_metric)

let make_suspended_process ?process_name:(process_name_ : xml_string_max_len255 option)
    ?suspension_reason:(suspension_reason_ : xml_string_max_len255 option) () =
  ({ process_name = process_name_; suspension_reason = suspension_reason_ } : suspended_process)

let make_launch_template_specification
    ?launch_template_id:(launch_template_id_ : xml_string_max_len255 option)
    ?launch_template_name:(launch_template_name_ : launch_template_name option)
    ?version:(version_ : xml_string_max_len255 option) () =
  ({
     launch_template_id = launch_template_id_;
     launch_template_name = launch_template_name_;
     version = version_;
   }
    : launch_template_specification)

let make_instance ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?image_id:(image_id_ : xml_string_max_len255 option)
    ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ~instance_id:(instance_id_ : xml_string_max_len19)
    ~availability_zone:(availability_zone_ : xml_string_max_len255)
    ~lifecycle_state:(lifecycle_state_ : lifecycle_state)
    ~health_status:(health_status_ : xml_string_max_len32)
    ~protected_from_scale_in:(protected_from_scale_in_ : instance_protected) () =
  ({
     instance_id = instance_id_;
     instance_type = instance_type_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     lifecycle_state = lifecycle_state_;
     health_status = health_status_;
     launch_configuration_name = launch_configuration_name_;
     launch_template = launch_template_;
     image_id = image_id_;
     protected_from_scale_in = protected_from_scale_in_;
     weighted_capacity = weighted_capacity_;
   }
    : instance)

let make_instances_distribution
    ?on_demand_allocation_strategy:(on_demand_allocation_strategy_ : xml_string option)
    ?on_demand_base_capacity:(on_demand_base_capacity_ : on_demand_base_capacity option)
    ?on_demand_percentage_above_base_capacity:
      (on_demand_percentage_above_base_capacity_ : on_demand_percentage_above_base_capacity option)
    ?spot_allocation_strategy:(spot_allocation_strategy_ : xml_string option)
    ?spot_instance_pools:(spot_instance_pools_ : spot_instance_pools option)
    ?spot_max_price:(spot_max_price_ : mixed_instance_spot_price option) () =
  ({
     on_demand_allocation_strategy = on_demand_allocation_strategy_;
     on_demand_base_capacity = on_demand_base_capacity_;
     on_demand_percentage_above_base_capacity = on_demand_percentage_above_base_capacity_;
     spot_allocation_strategy = spot_allocation_strategy_;
     spot_instance_pools = spot_instance_pools_;
     spot_max_price = spot_max_price_;
   }
    : instances_distribution)

let make_performance_factor_reference_request ?instance_family:(instance_family_ : string_ option)
    () =
  ({ instance_family = instance_family_ } : performance_factor_reference_request)

let make_cpu_performance_factor_request
    ?references:(references_ : performance_factor_reference_set_request option) () =
  ({ references = references_ } : cpu_performance_factor_request)

let make_baseline_performance_factors_request ?cpu:(cpu_ : cpu_performance_factor_request option) ()
    =
  ({ cpu = cpu_ } : baseline_performance_factors_request)

let make_network_bandwidth_gbps_request ?min:(min_ : nullable_positive_double option)
    ?max:(max_ : nullable_positive_double option) () =
  ({ min = min_; max = max_ } : network_bandwidth_gbps_request)

let make_baseline_ebs_bandwidth_mbps_request ?min:(min_ : nullable_positive_integer option)
    ?max:(max_ : nullable_positive_integer option) () =
  ({ min = min_; max = max_ } : baseline_ebs_bandwidth_mbps_request)

let make_total_local_storage_gb_request ?min:(min_ : nullable_positive_double option)
    ?max:(max_ : nullable_positive_double option) () =
  ({ min = min_; max = max_ } : total_local_storage_gb_request)

let make_network_interface_count_request ?min:(min_ : nullable_positive_integer option)
    ?max:(max_ : nullable_positive_integer option) () =
  ({ min = min_; max = max_ } : network_interface_count_request)

let make_memory_gi_b_per_v_cpu_request ?min:(min_ : nullable_positive_double option)
    ?max:(max_ : nullable_positive_double option) () =
  ({ min = min_; max = max_ } : memory_gi_b_per_v_cpu_request)

let make_memory_mi_b_request ?max:(max_ : nullable_positive_integer option)
    ~min:(min_ : nullable_positive_integer) () =
  ({ min = min_; max = max_ } : memory_mi_b_request)

let make_v_cpu_count_request ?max:(max_ : nullable_positive_integer option)
    ~min:(min_ : nullable_positive_integer) () =
  ({ min = min_; max = max_ } : v_cpu_count_request)

let make_instance_requirements ?cpu_manufacturers:(cpu_manufacturers_ : cpu_manufacturers option)
    ?memory_gi_b_per_v_cpu:(memory_gi_b_per_v_cpu_ : memory_gi_b_per_v_cpu_request option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_types option)
    ?instance_generations:(instance_generations_ : instance_generations option)
    ?spot_max_price_percentage_over_lowest_price:
      (spot_max_price_percentage_over_lowest_price_ : nullable_positive_integer option)
    ?max_spot_price_as_percentage_of_optimal_on_demand_price:
      (max_spot_price_as_percentage_of_optimal_on_demand_price_ : nullable_positive_integer option)
    ?on_demand_max_price_percentage_over_lowest_price:
      (on_demand_max_price_percentage_over_lowest_price_ : nullable_positive_integer option)
    ?bare_metal:(bare_metal_ : bare_metal option)
    ?burstable_performance:(burstable_performance_ : burstable_performance option)
    ?require_hibernate_support:(require_hibernate_support_ : nullable_boolean option)
    ?network_interface_count:(network_interface_count_ : network_interface_count_request option)
    ?local_storage:(local_storage_ : local_storage option)
    ?local_storage_types:(local_storage_types_ : local_storage_types option)
    ?total_local_storage_g_b:(total_local_storage_g_b_ : total_local_storage_gb_request option)
    ?baseline_ebs_bandwidth_mbps:
      (baseline_ebs_bandwidth_mbps_ : baseline_ebs_bandwidth_mbps_request option)
    ?accelerator_types:(accelerator_types_ : accelerator_types option)
    ?accelerator_count:(accelerator_count_ : accelerator_count_request option)
    ?accelerator_manufacturers:(accelerator_manufacturers_ : accelerator_manufacturers option)
    ?accelerator_names:(accelerator_names_ : accelerator_names option)
    ?accelerator_total_memory_mi_b:
      (accelerator_total_memory_mi_b_ : accelerator_total_memory_mi_b_request option)
    ?network_bandwidth_gbps:(network_bandwidth_gbps_ : network_bandwidth_gbps_request option)
    ?allowed_instance_types:(allowed_instance_types_ : allowed_instance_types option)
    ?baseline_performance_factors:
      (baseline_performance_factors_ : baseline_performance_factors_request option)
    ~v_cpu_count:(v_cpu_count_ : v_cpu_count_request)
    ~memory_mi_b:(memory_mi_b_ : memory_mi_b_request) () =
  ({
     v_cpu_count = v_cpu_count_;
     memory_mi_b = memory_mi_b_;
     cpu_manufacturers = cpu_manufacturers_;
     memory_gi_b_per_v_cpu = memory_gi_b_per_v_cpu_;
     excluded_instance_types = excluded_instance_types_;
     instance_generations = instance_generations_;
     spot_max_price_percentage_over_lowest_price = spot_max_price_percentage_over_lowest_price_;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       max_spot_price_as_percentage_of_optimal_on_demand_price_;
     on_demand_max_price_percentage_over_lowest_price =
       on_demand_max_price_percentage_over_lowest_price_;
     bare_metal = bare_metal_;
     burstable_performance = burstable_performance_;
     require_hibernate_support = require_hibernate_support_;
     network_interface_count = network_interface_count_;
     local_storage = local_storage_;
     local_storage_types = local_storage_types_;
     total_local_storage_g_b = total_local_storage_g_b_;
     baseline_ebs_bandwidth_mbps = baseline_ebs_bandwidth_mbps_;
     accelerator_types = accelerator_types_;
     accelerator_count = accelerator_count_;
     accelerator_manufacturers = accelerator_manufacturers_;
     accelerator_names = accelerator_names_;
     accelerator_total_memory_mi_b = accelerator_total_memory_mi_b_;
     network_bandwidth_gbps = network_bandwidth_gbps_;
     allowed_instance_types = allowed_instance_types_;
     baseline_performance_factors = baseline_performance_factors_;
   }
    : instance_requirements)

let make_launch_template_overrides ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ?launch_template_specification:
      (launch_template_specification_ : launch_template_specification option)
    ?instance_requirements:(instance_requirements_ : instance_requirements option)
    ?image_id:(image_id_ : image_id option) () =
  ({
     instance_type = instance_type_;
     weighted_capacity = weighted_capacity_;
     launch_template_specification = launch_template_specification_;
     instance_requirements = instance_requirements_;
     image_id = image_id_;
   }
    : launch_template_overrides)

let make_launch_template
    ?launch_template_specification:
      (launch_template_specification_ : launch_template_specification option)
    ?overrides:(overrides_ : overrides option) () =
  ({ launch_template_specification = launch_template_specification_; overrides = overrides_ }
    : launch_template)

let make_mixed_instances_policy ?launch_template:(launch_template_ : launch_template option)
    ?instances_distribution:(instances_distribution_ : instances_distribution option) () =
  ({ launch_template = launch_template_; instances_distribution = instances_distribution_ }
    : mixed_instances_policy)

let make_auto_scaling_group
    ?auto_scaling_group_ar_n:(auto_scaling_group_ar_n_ : resource_name option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?predicted_capacity:(predicted_capacity_ : auto_scaling_group_predicted_capacity option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option)
    ?target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?instances:(instances_ : instances option)
    ?suspended_processes:(suspended_processes_ : suspended_processes option)
    ?placement_group:(placement_group_ : xml_string_max_len255 option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?enabled_metrics:(enabled_metrics_ : enabled_metrics option)
    ?status:(status_ : xml_string_max_len255 option) ?tags:(tags_ : tag_description_list option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?warm_pool_configuration:(warm_pool_configuration_ : warm_pool_configuration option)
    ?warm_pool_size:(warm_pool_size_ : warm_pool_size option) ?context:(context_ : context option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?traffic_sources:(traffic_sources_ : traffic_sources option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~min_size:(min_size_ : auto_scaling_group_min_size)
    ~max_size:(max_size_ : auto_scaling_group_max_size)
    ~desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity)
    ~default_cooldown:(default_cooldown_ : cooldown)
    ~availability_zones:(availability_zones_ : availability_zones)
    ~health_check_type:(health_check_type_ : xml_string_max_len32)
    ~created_time:(created_time_ : timestamp_type) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     auto_scaling_group_ar_n = auto_scaling_group_ar_n_;
     launch_configuration_name = launch_configuration_name_;
     launch_template = launch_template_;
     mixed_instances_policy = mixed_instances_policy_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     predicted_capacity = predicted_capacity_;
     default_cooldown = default_cooldown_;
     availability_zones = availability_zones_;
     availability_zone_ids = availability_zone_ids_;
     load_balancer_names = load_balancer_names_;
     target_group_ar_ns = target_group_ar_ns_;
     health_check_type = health_check_type_;
     health_check_grace_period = health_check_grace_period_;
     instances = instances_;
     created_time = created_time_;
     suspended_processes = suspended_processes_;
     placement_group = placement_group_;
     vpc_zone_identifier = vpc_zone_identifier_;
     enabled_metrics = enabled_metrics_;
     status = status_;
     tags = tags_;
     termination_policies = termination_policies_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     max_instance_lifetime = max_instance_lifetime_;
     capacity_rebalance = capacity_rebalance_;
     warm_pool_configuration = warm_pool_configuration_;
     warm_pool_size = warm_pool_size_;
     context = context_;
     desired_capacity_type = desired_capacity_type_;
     default_instance_warmup = default_instance_warmup_;
     traffic_sources = traffic_sources_;
     instance_maintenance_policy = instance_maintenance_policy_;
     deletion_protection = deletion_protection_;
     availability_zone_distribution = availability_zone_distribution_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     capacity_reservation_specification = capacity_reservation_specification_;
     instance_lifecycle_policy = instance_lifecycle_policy_;
   }
    : auto_scaling_group)

let make_filter ?name:(name_ : xml_string option) ?values:(values_ : values option) () =
  ({ name = name_; values = values_ } : filter)

let make_auto_scaling_group_names_type
    ?auto_scaling_group_names:(auto_scaling_group_names_ : auto_scaling_group_names option)
    ?include_instances:(include_instances_ : include_instances option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    ?filters:(filters_ : filters option) () =
  ({
     auto_scaling_group_names = auto_scaling_group_names_;
     include_instances = include_instances_;
     next_token = next_token_;
     max_records = max_records_;
     filters = filters_;
   }
    : auto_scaling_group_names_type)

let make_auto_scaling_groups_type ?next_token:(next_token_ : xml_string option)
    ~auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_groups) () =
  ({ auto_scaling_groups = auto_scaling_groups_; next_token = next_token_ }
    : auto_scaling_groups_type)

let make_auto_scaling_instance_details
    ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?image_id:(image_id_ : xml_string_max_len255 option)
    ?weighted_capacity:(weighted_capacity_ : xml_string_max_len32 option)
    ~instance_id:(instance_id_ : xml_string_max_len19)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~availability_zone:(availability_zone_ : xml_string_max_len255)
    ~lifecycle_state:(lifecycle_state_ : xml_string_max_len32)
    ~health_status:(health_status_ : xml_string_max_len32)
    ~protected_from_scale_in:(protected_from_scale_in_ : instance_protected) () =
  ({
     instance_id = instance_id_;
     instance_type = instance_type_;
     auto_scaling_group_name = auto_scaling_group_name_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     lifecycle_state = lifecycle_state_;
     health_status = health_status_;
     launch_configuration_name = launch_configuration_name_;
     launch_template = launch_template_;
     image_id = image_id_;
     protected_from_scale_in = protected_from_scale_in_;
     weighted_capacity = weighted_capacity_;
   }
    : auto_scaling_instance_details)

let make_auto_scaling_instances_type
    ?auto_scaling_instances:(auto_scaling_instances_ : auto_scaling_instances option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ auto_scaling_instances = auto_scaling_instances_; next_token = next_token_ }
    : auto_scaling_instances_type)

let make_update_auto_scaling_group_type
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?default_cooldown:(default_cooldown_ : cooldown option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?health_check_type:(health_check_type_ : xml_string_max_len32 option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?placement_group:(placement_group_ : update_placement_group_param option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?context:(context_ : context option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     launch_configuration_name = launch_configuration_name_;
     launch_template = launch_template_;
     mixed_instances_policy = mixed_instances_policy_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     default_cooldown = default_cooldown_;
     availability_zones = availability_zones_;
     availability_zone_ids = availability_zone_ids_;
     health_check_type = health_check_type_;
     health_check_grace_period = health_check_grace_period_;
     placement_group = placement_group_;
     vpc_zone_identifier = vpc_zone_identifier_;
     termination_policies = termination_policies_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     max_instance_lifetime = max_instance_lifetime_;
     capacity_rebalance = capacity_rebalance_;
     context = context_;
     desired_capacity_type = desired_capacity_type_;
     default_instance_warmup = default_instance_warmup_;
     instance_maintenance_policy = instance_maintenance_policy_;
     availability_zone_distribution = availability_zone_distribution_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
     capacity_reservation_specification = capacity_reservation_specification_;
     instance_lifecycle_policy = instance_lifecycle_policy_;
     deletion_protection = deletion_protection_;
   }
    : update_auto_scaling_group_type)

let make_terminate_instance_in_auto_scaling_group_type
    ~instance_id:(instance_id_ : xml_string_max_len19)
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity) () =
  ({
     instance_id = instance_id_;
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
   }
    : terminate_instance_in_auto_scaling_group_type)

let make_scaling_process_query ?scaling_processes:(scaling_processes_ : process_names option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; scaling_processes = scaling_processes_ }
    : scaling_process_query)

let make_start_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : start_instance_refresh_answer)

let make_refresh_preferences ?min_healthy_percentage:(min_healthy_percentage_ : int_percent option)
    ?instance_warmup:(instance_warmup_ : refresh_instance_warmup option)
    ?checkpoint_percentages:(checkpoint_percentages_ : checkpoint_percentages option)
    ?checkpoint_delay:(checkpoint_delay_ : checkpoint_delay option)
    ?skip_matching:(skip_matching_ : skip_matching option)
    ?auto_rollback:(auto_rollback_ : auto_rollback option)
    ?scale_in_protected_instances:
      (scale_in_protected_instances_ : scale_in_protected_instances option)
    ?standby_instances:(standby_instances_ : standby_instances option)
    ?alarm_specification:(alarm_specification_ : alarm_specification option)
    ?max_healthy_percentage:(max_healthy_percentage_ : int_percent100_to200 option)
    ?bake_time:(bake_time_ : bake_time option) () =
  ({
     min_healthy_percentage = min_healthy_percentage_;
     instance_warmup = instance_warmup_;
     checkpoint_percentages = checkpoint_percentages_;
     checkpoint_delay = checkpoint_delay_;
     skip_matching = skip_matching_;
     auto_rollback = auto_rollback_;
     scale_in_protected_instances = scale_in_protected_instances_;
     standby_instances = standby_instances_;
     alarm_specification = alarm_specification_;
     max_healthy_percentage = max_healthy_percentage_;
     bake_time = bake_time_;
   }
    : refresh_preferences)

let make_desired_configuration
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option) () =
  ({ launch_template = launch_template_; mixed_instances_policy = mixed_instances_policy_ }
    : desired_configuration)

let make_start_instance_refresh_type ?strategy:(strategy_ : refresh_strategy option)
    ?desired_configuration:(desired_configuration_ : desired_configuration option)
    ?preferences:(preferences_ : refresh_preferences option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     strategy = strategy_;
     desired_configuration = desired_configuration_;
     preferences = preferences_;
   }
    : start_instance_refresh_type)

let make_set_instance_protection_answer () = (() : unit)

let make_set_instance_protection_query ~instance_ids:(instance_ids_ : instance_ids)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~protected_from_scale_in:(protected_from_scale_in_ : protected_from_scale_in) () =
  ({
     instance_ids = instance_ids_;
     auto_scaling_group_name = auto_scaling_group_name_;
     protected_from_scale_in = protected_from_scale_in_;
   }
    : set_instance_protection_query)

let make_set_instance_health_query
    ?should_respect_grace_period:(should_respect_grace_period_ : should_respect_grace_period option)
    ~instance_id:(instance_id_ : xml_string_max_len19)
    ~health_status:(health_status_ : xml_string_max_len32) () =
  ({
     instance_id = instance_id_;
     health_status = health_status_;
     should_respect_grace_period = should_respect_grace_period_;
   }
    : set_instance_health_query)

let make_set_desired_capacity_type ?honor_cooldown:(honor_cooldown_ : honor_cooldown option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     desired_capacity = desired_capacity_;
     honor_cooldown = honor_cooldown_;
   }
    : set_desired_capacity_type)

let make_rollback_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : rollback_instance_refresh_answer)

let make_rollback_instance_refresh_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_ } : rollback_instance_refresh_type)

let make_record_lifecycle_action_heartbeat_answer () = (() : unit)

let make_record_lifecycle_action_heartbeat_type
    ?lifecycle_action_token:(lifecycle_action_token_ : lifecycle_action_token option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : resource_name) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_action_token = lifecycle_action_token_;
     instance_id = instance_id_;
   }
    : record_lifecycle_action_heartbeat_type)

let make_put_warm_pool_answer () = (() : unit)

let make_put_warm_pool_type
    ?max_group_prepared_capacity:(max_group_prepared_capacity_ : max_group_prepared_capacity option)
    ?min_size:(min_size_ : warm_pool_min_size option)
    ?pool_state:(pool_state_ : warm_pool_state option)
    ?instance_reuse_policy:(instance_reuse_policy_ : instance_reuse_policy option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     max_group_prepared_capacity = max_group_prepared_capacity_;
     min_size = min_size_;
     pool_state = pool_state_;
     instance_reuse_policy = instance_reuse_policy_;
   }
    : put_warm_pool_type)

let make_put_scheduled_update_group_action_type ?time:(time_ : timestamp_type option)
    ?start_time:(start_time_ : timestamp_type option) ?end_time:(end_time_ : timestamp_type option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?time_zone:(time_zone_ : xml_string_max_len255 option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_action_name = scheduled_action_name_;
     time = time_;
     start_time = start_time_;
     end_time = end_time_;
     recurrence = recurrence_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     time_zone = time_zone_;
   }
    : put_scheduled_update_group_action_type)

let make_policy_arn_type ?policy_ar_n:(policy_ar_n_ : resource_name option)
    ?alarms:(alarms_ : alarms option) () =
  ({ policy_ar_n = policy_ar_n_; alarms = alarms_ } : policy_arn_type)

let make_metric_dimension ~name:(name_ : metric_dimension_name)
    ~value:(value_ : metric_dimension_value) () =
  ({ name = name_; value = value_ } : metric_dimension)

let make_metric ?dimensions:(dimensions_ : metric_dimensions option)
    ~namespace:(namespace_ : metric_namespace) ~metric_name:(metric_name_ : metric_name) () =
  ({ namespace = namespace_; metric_name = metric_name_; dimensions = dimensions_ } : metric)

let make_metric_stat ?unit_:(unit__ : metric_unit option) ~metric:(metric_ : metric)
    ~stat:(stat_ : xml_string_metric_stat) () =
  ({ metric = metric_; stat = stat_; unit_ = unit__ } : metric_stat)

let make_metric_data_query ?expression:(expression_ : xml_string_max_len1023 option)
    ?metric_stat:(metric_stat_ : metric_stat option)
    ?label:(label_ : xml_string_metric_label option)
    ?return_data:(return_data_ : return_data option) ~id:(id_ : xml_string_max_len255) () =
  ({
     id = id_;
     expression = expression_;
     metric_stat = metric_stat_;
     label = label_;
     return_data = return_data_;
   }
    : metric_data_query)

let make_predictive_scaling_customized_capacity_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_capacity_metric)

let make_predictive_scaling_customized_load_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_load_metric)

let make_predictive_scaling_customized_scaling_metric
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ } : predictive_scaling_customized_scaling_metric)

let make_predictive_scaling_predefined_load_metric
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_load_metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_load_metric)

let make_predictive_scaling_predefined_scaling_metric
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_scaling_metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_scaling_metric)

let make_predictive_scaling_predefined_metric_pair
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : predefined_metric_pair_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_metric_pair)

let make_predictive_scaling_metric_specification
    ?predefined_metric_pair_specification:
      (predefined_metric_pair_specification_ : predictive_scaling_predefined_metric_pair option)
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ :
         predictive_scaling_predefined_scaling_metric option)
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ : predictive_scaling_predefined_load_metric option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ :
         predictive_scaling_customized_scaling_metric option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ : predictive_scaling_customized_load_metric option)
    ?customized_capacity_metric_specification:
      (customized_capacity_metric_specification_ :
         predictive_scaling_customized_capacity_metric option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     target_value = target_value_;
     predefined_metric_pair_specification = predefined_metric_pair_specification_;
     predefined_scaling_metric_specification = predefined_scaling_metric_specification_;
     predefined_load_metric_specification = predefined_load_metric_specification_;
     customized_scaling_metric_specification = customized_scaling_metric_specification_;
     customized_load_metric_specification = customized_load_metric_specification_;
     customized_capacity_metric_specification = customized_capacity_metric_specification_;
   }
    : predictive_scaling_metric_specification)

let make_predictive_scaling_configuration ?mode:(mode_ : predictive_scaling_mode option)
    ?scheduling_buffer_time:
      (scheduling_buffer_time_ : predictive_scaling_scheduling_buffer_time option)
    ?max_capacity_breach_behavior:
      (max_capacity_breach_behavior_ : predictive_scaling_max_capacity_breach_behavior option)
    ?max_capacity_buffer:(max_capacity_buffer_ : predictive_scaling_max_capacity_buffer option)
    ~metric_specifications:(metric_specifications_ : predictive_scaling_metric_specifications) () =
  ({
     metric_specifications = metric_specifications_;
     mode = mode_;
     scheduling_buffer_time = scheduling_buffer_time_;
     max_capacity_breach_behavior = max_capacity_breach_behavior_;
     max_capacity_buffer = max_capacity_buffer_;
   }
    : predictive_scaling_configuration)

let make_target_tracking_metric_stat ?unit_:(unit__ : metric_unit option)
    ?period:(period_ : metric_granularity_in_seconds option) ~metric:(metric_ : metric)
    ~stat:(stat_ : xml_string_metric_stat) () =
  ({ metric = metric_; stat = stat_; unit_ = unit__; period = period_ }
    : target_tracking_metric_stat)

let make_target_tracking_metric_data_query ?expression:(expression_ : xml_string_max_len2047 option)
    ?metric_stat:(metric_stat_ : target_tracking_metric_stat option)
    ?label:(label_ : xml_string_metric_label option)
    ?period:(period_ : metric_granularity_in_seconds option)
    ?return_data:(return_data_ : return_data option) ~id:(id_ : xml_string_max_len64) () =
  ({
     id = id_;
     expression = expression_;
     metric_stat = metric_stat_;
     label = label_;
     period = period_;
     return_data = return_data_;
   }
    : target_tracking_metric_data_query)

let make_customized_metric_specification ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : metric_namespace option)
    ?dimensions:(dimensions_ : metric_dimensions option)
    ?statistic:(statistic_ : metric_statistic option) ?unit_:(unit__ : metric_unit option)
    ?period:(period_ : metric_granularity_in_seconds option)
    ?metrics:(metrics_ : target_tracking_metric_data_queries option) () =
  ({
     metric_name = metric_name_;
     namespace = namespace_;
     dimensions = dimensions_;
     statistic = statistic_;
     unit_ = unit__;
     period = period_;
     metrics = metrics_;
   }
    : customized_metric_specification)

let make_predefined_metric_specification
    ?resource_label:(resource_label_ : xml_string_max_len1023 option)
    ~predefined_metric_type:(predefined_metric_type_ : metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predefined_metric_specification)

let make_target_tracking_configuration
    ?predefined_metric_specification:
      (predefined_metric_specification_ : predefined_metric_specification option)
    ?customized_metric_specification:
      (customized_metric_specification_ : customized_metric_specification option)
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     predefined_metric_specification = predefined_metric_specification_;
     customized_metric_specification = customized_metric_specification_;
     target_value = target_value_;
     disable_scale_in = disable_scale_in_;
   }
    : target_tracking_configuration)

let make_step_adjustment
    ?metric_interval_lower_bound:(metric_interval_lower_bound_ : metric_scale option)
    ?metric_interval_upper_bound:(metric_interval_upper_bound_ : metric_scale option)
    ~scaling_adjustment:(scaling_adjustment_ : policy_increment) () =
  ({
     metric_interval_lower_bound = metric_interval_lower_bound_;
     metric_interval_upper_bound = metric_interval_upper_bound_;
     scaling_adjustment = scaling_adjustment_;
   }
    : step_adjustment)

let make_put_scaling_policy_type ?policy_type:(policy_type_ : xml_string_max_len64 option)
    ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option)
    ?min_adjustment_step:(min_adjustment_step_ : min_adjustment_step option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?scaling_adjustment:(scaling_adjustment_ : policy_increment option)
    ?cooldown:(cooldown_ : cooldown option)
    ?metric_aggregation_type:(metric_aggregation_type_ : xml_string_max_len32 option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?estimated_instance_warmup:(estimated_instance_warmup_ : estimated_instance_warmup option)
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ?enabled:(enabled_ : scaling_policy_enabled option)
    ?predictive_scaling_configuration:
      (predictive_scaling_configuration_ : predictive_scaling_configuration option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~policy_name:(policy_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     policy_name = policy_name_;
     policy_type = policy_type_;
     adjustment_type = adjustment_type_;
     min_adjustment_step = min_adjustment_step_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     scaling_adjustment = scaling_adjustment_;
     cooldown = cooldown_;
     metric_aggregation_type = metric_aggregation_type_;
     step_adjustments = step_adjustments_;
     estimated_instance_warmup = estimated_instance_warmup_;
     target_tracking_configuration = target_tracking_configuration_;
     enabled = enabled_;
     predictive_scaling_configuration = predictive_scaling_configuration_;
   }
    : put_scaling_policy_type)

let make_put_notification_configuration_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~topic_ar_n:(topic_ar_n_ : xml_string_max_len255)
    ~notification_types:(notification_types_ : auto_scaling_notification_types) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     topic_ar_n = topic_ar_n_;
     notification_types = notification_types_;
   }
    : put_notification_configuration_type)

let make_put_lifecycle_hook_answer () = (() : unit)

let make_put_lifecycle_hook_type
    ?lifecycle_transition:(lifecycle_transition_ : lifecycle_transition option)
    ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?default_result:(default_result_ : lifecycle_action_result option)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_transition = lifecycle_transition_;
     role_ar_n = role_ar_n_;
     notification_target_ar_n = notification_target_ar_n_;
     notification_metadata = notification_metadata_;
     heartbeat_timeout = heartbeat_timeout_;
     default_result = default_result_;
   }
    : put_lifecycle_hook_type)

let make_launch_instances_error ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?market_type:(market_type_ : xml_string_max_len64 option)
    ?subnet_id:(subnet_id_ : xml_string_max_len255 option)
    ?availability_zone:(availability_zone_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?error_code:(error_code_ : xml_string_max_len64 option)
    ?error_message:(error_message_ : xml_string option) () =
  ({
     instance_type = instance_type_;
     market_type = market_type_;
     subnet_id = subnet_id_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : launch_instances_error)

let make_instance_collection ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?market_type:(market_type_ : xml_string_max_len64 option)
    ?subnet_id:(subnet_id_ : xml_string_max_len255 option)
    ?availability_zone:(availability_zone_ : xml_string_max_len255 option)
    ?availability_zone_id:(availability_zone_id_ : xml_string_max_len255 option)
    ?instance_ids:(instance_ids_ : instance_ids option) () =
  ({
     instance_type = instance_type_;
     market_type = market_type_;
     subnet_id = subnet_id_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     instance_ids = instance_ids_;
   }
    : instance_collection)

let make_launch_instances_request
    ?availability_zones:(availability_zones_ : availability_zones_limit1 option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids_limit1 option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_limit1 option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~requested_capacity:(requested_capacity_ : requested_capacity)
    ~client_token:(client_token_ : client_token) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     requested_capacity = requested_capacity_;
     client_token = client_token_;
     availability_zones = availability_zones_;
     availability_zone_ids = availability_zone_ids_;
     subnet_ids = subnet_ids_;
     retry_strategy = retry_strategy_;
   }
    : launch_instances_request)

let make_capacity_forecast ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps)
    ~values:(values_ : predictive_scaling_forecast_values) () =
  ({ timestamps = timestamps_; values = values_ } : capacity_forecast)

let make_load_forecast ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps)
    ~values:(values_ : predictive_scaling_forecast_values)
    ~metric_specification:(metric_specification_ : predictive_scaling_metric_specification) () =
  ({ timestamps = timestamps_; values = values_; metric_specification = metric_specification_ }
    : load_forecast)

let make_get_predictive_scaling_forecast_answer ~load_forecast:(load_forecast_ : load_forecasts)
    ~capacity_forecast:(capacity_forecast_ : capacity_forecast)
    ~update_time:(update_time_ : timestamp_type) () =
  ({
     load_forecast = load_forecast_;
     capacity_forecast = capacity_forecast_;
     update_time = update_time_;
   }
    : get_predictive_scaling_forecast_answer)

let make_get_predictive_scaling_forecast_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~policy_name:(policy_name_ : xml_string_max_len255) ~start_time:(start_time_ : timestamp_type)
    ~end_time:(end_time_ : timestamp_type) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     policy_name = policy_name_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : get_predictive_scaling_forecast_type)

let make_exit_standby_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : exit_standby_answer)

let make_exit_standby_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ instance_ids = instance_ids_; auto_scaling_group_name = auto_scaling_group_name_ }
    : exit_standby_query)

let make_execute_policy_type
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?honor_cooldown:(honor_cooldown_ : honor_cooldown option)
    ?metric_value:(metric_value_ : metric_scale option)
    ?breach_threshold:(breach_threshold_ : metric_scale option)
    ~policy_name:(policy_name_ : resource_name) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     policy_name = policy_name_;
     honor_cooldown = honor_cooldown_;
     metric_value = metric_value_;
     breach_threshold = breach_threshold_;
   }
    : execute_policy_type)

let make_enter_standby_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : enter_standby_answer)

let make_enter_standby_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity) () =
  ({
     instance_ids = instance_ids_;
     auto_scaling_group_name = auto_scaling_group_name_;
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
   }
    : enter_standby_query)

let make_enable_metrics_collection_query ?metrics:(metrics_ : metrics option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~granularity:(granularity_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     metrics = metrics_;
     granularity = granularity_;
   }
    : enable_metrics_collection_query)

let make_disable_metrics_collection_query ?metrics:(metrics_ : metrics option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; metrics = metrics_ }
    : disable_metrics_collection_query)

let make_detach_traffic_sources_result_type () = (() : unit)

let make_detach_traffic_sources_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~traffic_sources:(traffic_sources_ : traffic_sources) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; traffic_sources = traffic_sources_ }
    : detach_traffic_sources_type)

let make_detach_load_balancer_target_groups_result_type () = (() : unit)

let make_detach_load_balancer_target_groups_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; target_group_ar_ns = target_group_ar_ns_ }
    : detach_load_balancer_target_groups_type)

let make_detach_load_balancers_result_type () = (() : unit)

let make_detach_load_balancers_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     load_balancer_names = load_balancer_names_;
   }
    : detach_load_balancers_type)

let make_detach_instances_answer ?activities:(activities_ : activities option) () =
  ({ activities = activities_ } : detach_instances_answer)

let make_detach_instances_query ?instance_ids:(instance_ids_ : instance_ids option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~should_decrement_desired_capacity:
      (should_decrement_desired_capacity_ : should_decrement_desired_capacity) () =
  ({
     instance_ids = instance_ids_;
     auto_scaling_group_name = auto_scaling_group_name_;
     should_decrement_desired_capacity = should_decrement_desired_capacity_;
   }
    : detach_instances_query)

let make_describe_warm_pool_answer
    ?warm_pool_configuration:(warm_pool_configuration_ : warm_pool_configuration option)
    ?instances:(instances_ : instances option) ?next_token:(next_token_ : xml_string option) () =
  ({
     warm_pool_configuration = warm_pool_configuration_;
     instances = instances_;
     next_token = next_token_;
   }
    : describe_warm_pool_answer)

let make_describe_warm_pool_type ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : xml_string option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : describe_warm_pool_type)

let make_traffic_source_state ?traffic_source:(traffic_source_ : xml_string_max_len511 option)
    ?state:(state_ : xml_string_max_len255 option)
    ?identifier:(identifier_ : xml_string_max_len511 option)
    ?type_:(type__ : xml_string_max_len511 option) () =
  ({ traffic_source = traffic_source_; state = state_; identifier = identifier_; type_ = type__ }
    : traffic_source_state)

let make_describe_traffic_sources_response
    ?traffic_sources:(traffic_sources_ : traffic_source_states option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ traffic_sources = traffic_sources_; next_token = next_token_ }
    : describe_traffic_sources_response)

let make_describe_traffic_sources_request
    ?traffic_source_type:(traffic_source_type_ : xml_string_max_len255 option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     traffic_source_type = traffic_source_type_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_traffic_sources_request)

let make_describe_termination_policy_types_answer
    ?termination_policy_types:(termination_policy_types_ : termination_policies option) () =
  ({ termination_policy_types = termination_policy_types_ }
    : describe_termination_policy_types_answer)

let make_tags_type ?tags:(tags_ : tag_description_list option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ tags = tags_; next_token = next_token_ } : tags_type)

let make_describe_tags_type ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    () =
  ({ filters = filters_; next_token = next_token_; max_records = max_records_ }
    : describe_tags_type)

let make_scheduled_update_group_action
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255 option)
    ?scheduled_action_ar_n:(scheduled_action_ar_n_ : resource_name option)
    ?time:(time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?end_time:(end_time_ : timestamp_type option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?time_zone:(time_zone_ : xml_string_max_len255 option) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_action_name = scheduled_action_name_;
     scheduled_action_ar_n = scheduled_action_ar_n_;
     time = time_;
     start_time = start_time_;
     end_time = end_time_;
     recurrence = recurrence_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     time_zone = time_zone_;
   }
    : scheduled_update_group_action)

let make_scheduled_actions_type
    ?scheduled_update_group_actions:
      (scheduled_update_group_actions_ : scheduled_update_group_actions option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scheduled_update_group_actions = scheduled_update_group_actions_; next_token = next_token_ }
    : scheduled_actions_type)

let make_describe_scheduled_actions_type
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?scheduled_action_names:(scheduled_action_names_ : scheduled_action_names option)
    ?start_time:(start_time_ : timestamp_type option) ?end_time:(end_time_ : timestamp_type option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_action_names = scheduled_action_names_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_scheduled_actions_type)

let make_process_type ~process_name:(process_name_ : xml_string_max_len255) () =
  ({ process_name = process_name_ } : process_type)

let make_processes_type ?processes:(processes_ : processes option) () =
  ({ processes = processes_ } : processes_type)

let make_describe_scaling_activities_type ?activity_ids:(activity_ids_ : activity_ids option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?include_deleted_groups:(include_deleted_groups_ : include_deleted_groups option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : xml_string option)
    ?filters:(filters_ : filters option) () =
  ({
     activity_ids = activity_ids_;
     auto_scaling_group_name = auto_scaling_group_name_;
     include_deleted_groups = include_deleted_groups_;
     max_records = max_records_;
     next_token = next_token_;
     filters = filters_;
   }
    : describe_scaling_activities_type)

let make_scaling_policy
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?policy_name:(policy_name_ : xml_string_max_len255 option)
    ?policy_ar_n:(policy_ar_n_ : resource_name option)
    ?policy_type:(policy_type_ : xml_string_max_len64 option)
    ?adjustment_type:(adjustment_type_ : xml_string_max_len255 option)
    ?min_adjustment_step:(min_adjustment_step_ : min_adjustment_step option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?scaling_adjustment:(scaling_adjustment_ : policy_increment option)
    ?cooldown:(cooldown_ : cooldown option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?metric_aggregation_type:(metric_aggregation_type_ : xml_string_max_len32 option)
    ?estimated_instance_warmup:(estimated_instance_warmup_ : estimated_instance_warmup option)
    ?alarms:(alarms_ : alarms option)
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ?enabled:(enabled_ : scaling_policy_enabled option)
    ?predictive_scaling_configuration:
      (predictive_scaling_configuration_ : predictive_scaling_configuration option) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     policy_name = policy_name_;
     policy_ar_n = policy_ar_n_;
     policy_type = policy_type_;
     adjustment_type = adjustment_type_;
     min_adjustment_step = min_adjustment_step_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     scaling_adjustment = scaling_adjustment_;
     cooldown = cooldown_;
     step_adjustments = step_adjustments_;
     metric_aggregation_type = metric_aggregation_type_;
     estimated_instance_warmup = estimated_instance_warmup_;
     alarms = alarms_;
     target_tracking_configuration = target_tracking_configuration_;
     enabled = enabled_;
     predictive_scaling_configuration = predictive_scaling_configuration_;
   }
    : scaling_policy)

let make_policies_type ?scaling_policies:(scaling_policies_ : scaling_policies option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scaling_policies = scaling_policies_; next_token = next_token_ } : policies_type)

let make_describe_policies_type
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?policy_names:(policy_names_ : policy_names option)
    ?policy_types:(policy_types_ : policy_types option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     policy_names = policy_names_;
     policy_types = policy_types_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_policies_type)

let make_notification_configuration
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?topic_ar_n:(topic_ar_n_ : xml_string_max_len255 option)
    ?notification_type:(notification_type_ : xml_string_max_len255 option) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     topic_ar_n = topic_ar_n_;
     notification_type = notification_type_;
   }
    : notification_configuration)

let make_describe_notification_configurations_answer ?next_token:(next_token_ : xml_string option)
    ~notification_configurations:(notification_configurations_ : notification_configurations) () =
  ({ notification_configurations = notification_configurations_; next_token = next_token_ }
    : describe_notification_configurations_answer)

let make_describe_notification_configurations_type
    ?auto_scaling_group_names:(auto_scaling_group_names_ : auto_scaling_group_names option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    () =
  ({
     auto_scaling_group_names = auto_scaling_group_names_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_notification_configurations_type)

let make_metric_granularity_type ?granularity:(granularity_ : xml_string_max_len255 option) () =
  ({ granularity = granularity_ } : metric_granularity_type)

let make_metric_collection_type ?metric:(metric_ : xml_string_max_len255 option) () =
  ({ metric = metric_ } : metric_collection_type)

let make_describe_metric_collection_types_answer
    ?metrics:(metrics_ : metric_collection_types option)
    ?granularities:(granularities_ : metric_granularity_types option) () =
  ({ metrics = metrics_; granularities = granularities_ } : describe_metric_collection_types_answer)

let make_load_balancer_target_group_state
    ?load_balancer_target_group_ar_n:
      (load_balancer_target_group_ar_n_ : xml_string_max_len511 option)
    ?state:(state_ : xml_string_max_len255 option) () =
  ({ load_balancer_target_group_ar_n = load_balancer_target_group_ar_n_; state = state_ }
    : load_balancer_target_group_state)

let make_describe_load_balancer_target_groups_response
    ?load_balancer_target_groups:
      (load_balancer_target_groups_ : load_balancer_target_group_states option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ load_balancer_target_groups = load_balancer_target_groups_; next_token = next_token_ }
    : describe_load_balancer_target_groups_response)

let make_describe_load_balancer_target_groups_request ?next_token:(next_token_ : xml_string option)
    ?max_records:(max_records_ : max_records option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_load_balancer_target_groups_request)

let make_load_balancer_state
    ?load_balancer_name:(load_balancer_name_ : xml_string_max_len255 option)
    ?state:(state_ : xml_string_max_len255 option) () =
  ({ load_balancer_name = load_balancer_name_; state = state_ } : load_balancer_state)

let make_describe_load_balancers_response
    ?load_balancers:(load_balancers_ : load_balancer_states option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ load_balancers = load_balancers_; next_token = next_token_ }
    : describe_load_balancers_response)

let make_describe_load_balancers_request ?next_token:(next_token_ : xml_string option)
    ?max_records:(max_records_ : max_records option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_load_balancers_request)

let make_describe_lifecycle_hook_types_answer
    ?lifecycle_hook_types:(lifecycle_hook_types_ : auto_scaling_notification_types option) () =
  ({ lifecycle_hook_types = lifecycle_hook_types_ } : describe_lifecycle_hook_types_answer)

let make_lifecycle_hook ?lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255 option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?lifecycle_transition:(lifecycle_transition_ : lifecycle_transition option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?global_timeout:(global_timeout_ : global_timeout option)
    ?default_result:(default_result_ : lifecycle_action_result option) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_transition = lifecycle_transition_;
     notification_target_ar_n = notification_target_ar_n_;
     role_ar_n = role_ar_n_;
     notification_metadata = notification_metadata_;
     heartbeat_timeout = heartbeat_timeout_;
     global_timeout = global_timeout_;
     default_result = default_result_;
   }
    : lifecycle_hook)

let make_describe_lifecycle_hooks_answer
    ?lifecycle_hooks:(lifecycle_hooks_ : lifecycle_hooks option) () =
  ({ lifecycle_hooks = lifecycle_hooks_ } : describe_lifecycle_hooks_answer)

let make_describe_lifecycle_hooks_type
    ?lifecycle_hook_names:(lifecycle_hook_names_ : lifecycle_hook_names option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_hook_names = lifecycle_hook_names_;
   }
    : describe_lifecycle_hooks_type)

let make_instance_metadata_options
    ?http_tokens:(http_tokens_ : instance_metadata_http_tokens_state option)
    ?http_put_response_hop_limit:
      (http_put_response_hop_limit_ : instance_metadata_http_put_response_hop_limit option)
    ?http_endpoint:(http_endpoint_ : instance_metadata_endpoint_state option) () =
  ({
     http_tokens = http_tokens_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_endpoint = http_endpoint_;
   }
    : instance_metadata_options)

let make_instance_monitoring ?enabled:(enabled_ : monitoring_enabled option) () =
  ({ enabled = enabled_ } : instance_monitoring)

let make_ebs ?snapshot_id:(snapshot_id_ : xml_string_max_len255 option)
    ?volume_size:(volume_size_ : block_device_ebs_volume_size option)
    ?volume_type:(volume_type_ : block_device_ebs_volume_type option)
    ?delete_on_termination:(delete_on_termination_ : block_device_ebs_delete_on_termination option)
    ?iops:(iops_ : block_device_ebs_iops option)
    ?encrypted:(encrypted_ : block_device_ebs_encrypted option)
    ?throughput:(throughput_ : block_device_ebs_throughput option) () =
  ({
     snapshot_id = snapshot_id_;
     volume_size = volume_size_;
     volume_type = volume_type_;
     delete_on_termination = delete_on_termination_;
     iops = iops_;
     encrypted = encrypted_;
     throughput = throughput_;
   }
    : ebs)

let make_block_device_mapping ?virtual_name:(virtual_name_ : xml_string_max_len255 option)
    ?ebs:(ebs_ : ebs option) ?no_device:(no_device_ : no_device option)
    ~device_name:(device_name_ : xml_string_max_len255) () =
  ({ virtual_name = virtual_name_; device_name = device_name_; ebs = ebs_; no_device = no_device_ }
    : block_device_mapping)

let make_launch_configuration
    ?launch_configuration_ar_n:(launch_configuration_ar_n_ : resource_name option)
    ?key_name:(key_name_ : xml_string_max_len255 option)
    ?security_groups:(security_groups_ : security_groups option)
    ?classic_link_vpc_id:(classic_link_vpc_id_ : xml_string_max_len255 option)
    ?classic_link_vpc_security_groups:
      (classic_link_vpc_security_groups_ : classic_link_vpc_security_groups option)
    ?user_data:(user_data_ : xml_string_user_data option)
    ?kernel_id:(kernel_id_ : xml_string_max_len255 option)
    ?ramdisk_id:(ramdisk_id_ : xml_string_max_len255 option)
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option)
    ?instance_monitoring:(instance_monitoring_ : instance_monitoring option)
    ?spot_price:(spot_price_ : spot_price option)
    ?iam_instance_profile:(iam_instance_profile_ : xml_string_max_len1600 option)
    ?ebs_optimized:(ebs_optimized_ : ebs_optimized option)
    ?associate_public_ip_address:(associate_public_ip_address_ : associate_public_ip_address option)
    ?placement_tenancy:(placement_tenancy_ : xml_string_max_len64 option)
    ?metadata_options:(metadata_options_ : instance_metadata_options option)
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255)
    ~image_id:(image_id_ : xml_string_max_len255)
    ~instance_type:(instance_type_ : xml_string_max_len255)
    ~created_time:(created_time_ : timestamp_type) () =
  ({
     launch_configuration_name = launch_configuration_name_;
     launch_configuration_ar_n = launch_configuration_ar_n_;
     image_id = image_id_;
     key_name = key_name_;
     security_groups = security_groups_;
     classic_link_vpc_id = classic_link_vpc_id_;
     classic_link_vpc_security_groups = classic_link_vpc_security_groups_;
     user_data = user_data_;
     instance_type = instance_type_;
     kernel_id = kernel_id_;
     ramdisk_id = ramdisk_id_;
     block_device_mappings = block_device_mappings_;
     instance_monitoring = instance_monitoring_;
     spot_price = spot_price_;
     iam_instance_profile = iam_instance_profile_;
     created_time = created_time_;
     ebs_optimized = ebs_optimized_;
     associate_public_ip_address = associate_public_ip_address_;
     placement_tenancy = placement_tenancy_;
     metadata_options = metadata_options_;
   }
    : launch_configuration)

let make_launch_configurations_type ?next_token:(next_token_ : xml_string option)
    ~launch_configurations:(launch_configurations_ : launch_configurations) () =
  ({ launch_configurations = launch_configurations_; next_token = next_token_ }
    : launch_configurations_type)

let make_launch_configuration_names_type
    ?launch_configuration_names:(launch_configuration_names_ : launch_configuration_names option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    () =
  ({
     launch_configuration_names = launch_configuration_names_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : launch_configuration_names_type)

let make_instance_refresh_warm_pool_progress
    ?percentage_complete:(percentage_complete_ : int_percent option)
    ?instances_to_update:(instances_to_update_ : instances_to_update option) () =
  ({ percentage_complete = percentage_complete_; instances_to_update = instances_to_update_ }
    : instance_refresh_warm_pool_progress)

let make_instance_refresh_live_pool_progress
    ?percentage_complete:(percentage_complete_ : int_percent option)
    ?instances_to_update:(instances_to_update_ : instances_to_update option) () =
  ({ percentage_complete = percentage_complete_; instances_to_update = instances_to_update_ }
    : instance_refresh_live_pool_progress)

let make_instance_refresh_progress_details
    ?live_pool_progress:(live_pool_progress_ : instance_refresh_live_pool_progress option)
    ?warm_pool_progress:(warm_pool_progress_ : instance_refresh_warm_pool_progress option) () =
  ({ live_pool_progress = live_pool_progress_; warm_pool_progress = warm_pool_progress_ }
    : instance_refresh_progress_details)

let make_rollback_details ?rollback_reason:(rollback_reason_ : xml_string_max_len1023 option)
    ?rollback_start_time:(rollback_start_time_ : timestamp_type option)
    ?percentage_complete_on_rollback:(percentage_complete_on_rollback_ : int_percent option)
    ?instances_to_update_on_rollback:(instances_to_update_on_rollback_ : instances_to_update option)
    ?progress_details_on_rollback:
      (progress_details_on_rollback_ : instance_refresh_progress_details option) () =
  ({
     rollback_reason = rollback_reason_;
     rollback_start_time = rollback_start_time_;
     percentage_complete_on_rollback = percentage_complete_on_rollback_;
     instances_to_update_on_rollback = instances_to_update_on_rollback_;
     progress_details_on_rollback = progress_details_on_rollback_;
   }
    : rollback_details)

let make_instance_refresh ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ?status:(status_ : instance_refresh_status option)
    ?status_reason:(status_reason_ : xml_string_max_len1023 option)
    ?start_time:(start_time_ : timestamp_type option) ?end_time:(end_time_ : timestamp_type option)
    ?percentage_complete:(percentage_complete_ : int_percent option)
    ?instances_to_update:(instances_to_update_ : instances_to_update option)
    ?progress_details:(progress_details_ : instance_refresh_progress_details option)
    ?preferences:(preferences_ : refresh_preferences option)
    ?desired_configuration:(desired_configuration_ : desired_configuration option)
    ?rollback_details:(rollback_details_ : rollback_details option)
    ?strategy:(strategy_ : refresh_strategy option) () =
  ({
     instance_refresh_id = instance_refresh_id_;
     auto_scaling_group_name = auto_scaling_group_name_;
     status = status_;
     status_reason = status_reason_;
     start_time = start_time_;
     end_time = end_time_;
     percentage_complete = percentage_complete_;
     instances_to_update = instances_to_update_;
     progress_details = progress_details_;
     preferences = preferences_;
     desired_configuration = desired_configuration_;
     rollback_details = rollback_details_;
     strategy = strategy_;
   }
    : instance_refresh)

let make_describe_instance_refreshes_answer
    ?instance_refreshes:(instance_refreshes_ : instance_refreshes option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ instance_refreshes = instance_refreshes_; next_token = next_token_ }
    : describe_instance_refreshes_answer)

let make_describe_instance_refreshes_type
    ?instance_refresh_ids:(instance_refresh_ids_ : instance_refresh_ids option)
    ?next_token:(next_token_ : xml_string option) ?max_records:(max_records_ : max_records option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     instance_refresh_ids = instance_refresh_ids_;
     next_token = next_token_;
     max_records = max_records_;
   }
    : describe_instance_refreshes_type)

let make_describe_auto_scaling_notification_types_answer
    ?auto_scaling_notification_types:
      (auto_scaling_notification_types_ : auto_scaling_notification_types option) () =
  ({ auto_scaling_notification_types = auto_scaling_notification_types_ }
    : describe_auto_scaling_notification_types_answer)

let make_describe_auto_scaling_instances_type ?instance_ids:(instance_ids_ : instance_ids option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : xml_string option)
    () =
  ({ instance_ids = instance_ids_; max_records = max_records_; next_token = next_token_ }
    : describe_auto_scaling_instances_type)

let make_describe_adjustment_types_answer
    ?adjustment_types:(adjustment_types_ : adjustment_types option) () =
  ({ adjustment_types = adjustment_types_ } : describe_adjustment_types_answer)

let make_describe_account_limits_answer
    ?max_number_of_auto_scaling_groups:
      (max_number_of_auto_scaling_groups_ : max_number_of_auto_scaling_groups option)
    ?max_number_of_launch_configurations:
      (max_number_of_launch_configurations_ : max_number_of_launch_configurations option)
    ?number_of_auto_scaling_groups:
      (number_of_auto_scaling_groups_ : number_of_auto_scaling_groups option)
    ?number_of_launch_configurations:
      (number_of_launch_configurations_ : number_of_launch_configurations option) () =
  ({
     max_number_of_auto_scaling_groups = max_number_of_auto_scaling_groups_;
     max_number_of_launch_configurations = max_number_of_launch_configurations_;
     number_of_auto_scaling_groups = number_of_auto_scaling_groups_;
     number_of_launch_configurations = number_of_launch_configurations_;
   }
    : describe_account_limits_answer)

let make_delete_warm_pool_answer () = (() : unit)

let make_delete_warm_pool_type ?force_delete:(force_delete_ : force_delete option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; force_delete = force_delete_ }
    : delete_warm_pool_type)

let make_tag ?resource_id:(resource_id_ : xml_string option)
    ?resource_type:(resource_type_ : xml_string option) ?value:(value_ : tag_value option)
    ?propagate_at_launch:(propagate_at_launch_ : propagate_at_launch option) ~key:(key_ : tag_key)
    () =
  ({
     resource_id = resource_id_;
     resource_type = resource_type_;
     key = key_;
     value = value_;
     propagate_at_launch = propagate_at_launch_;
   }
    : tag)

let make_delete_tags_type ~tags:(tags_ : tags) () = ({ tags = tags_ } : delete_tags_type)

let make_delete_scheduled_action_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_action_name = scheduled_action_name_;
   }
    : delete_scheduled_action_type)

let make_delete_policy_type
    ?auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255 option)
    ~policy_name:(policy_name_ : resource_name) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; policy_name = policy_name_ }
    : delete_policy_type)

let make_delete_notification_configuration_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~topic_ar_n:(topic_ar_n_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; topic_ar_n = topic_ar_n_ }
    : delete_notification_configuration_type)

let make_delete_lifecycle_hook_answer () = (() : unit)

let make_delete_lifecycle_hook_type
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
   }
    : delete_lifecycle_hook_type)

let make_launch_configuration_name_type
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255) () =
  ({ launch_configuration_name = launch_configuration_name_ } : launch_configuration_name_type)

let make_delete_auto_scaling_group_type ?force_delete:(force_delete_ : force_delete option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({ auto_scaling_group_name = auto_scaling_group_name_; force_delete = force_delete_ }
    : delete_auto_scaling_group_type)

let make_create_or_update_tags_type ~tags:(tags_ : tags) () =
  ({ tags = tags_ } : create_or_update_tags_type)

let make_create_launch_configuration_type ?image_id:(image_id_ : xml_string_max_len255 option)
    ?key_name:(key_name_ : xml_string_max_len255 option)
    ?security_groups:(security_groups_ : security_groups option)
    ?classic_link_vpc_id:(classic_link_vpc_id_ : xml_string_max_len255 option)
    ?classic_link_vpc_security_groups:
      (classic_link_vpc_security_groups_ : classic_link_vpc_security_groups option)
    ?user_data:(user_data_ : xml_string_user_data option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?instance_type:(instance_type_ : xml_string_max_len255 option)
    ?kernel_id:(kernel_id_ : xml_string_max_len255 option)
    ?ramdisk_id:(ramdisk_id_ : xml_string_max_len255 option)
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option)
    ?instance_monitoring:(instance_monitoring_ : instance_monitoring option)
    ?spot_price:(spot_price_ : spot_price option)
    ?iam_instance_profile:(iam_instance_profile_ : xml_string_max_len1600 option)
    ?ebs_optimized:(ebs_optimized_ : ebs_optimized option)
    ?associate_public_ip_address:(associate_public_ip_address_ : associate_public_ip_address option)
    ?placement_tenancy:(placement_tenancy_ : xml_string_max_len64 option)
    ?metadata_options:(metadata_options_ : instance_metadata_options option)
    ~launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255) () =
  ({
     launch_configuration_name = launch_configuration_name_;
     image_id = image_id_;
     key_name = key_name_;
     security_groups = security_groups_;
     classic_link_vpc_id = classic_link_vpc_id_;
     classic_link_vpc_security_groups = classic_link_vpc_security_groups_;
     user_data = user_data_;
     instance_id = instance_id_;
     instance_type = instance_type_;
     kernel_id = kernel_id_;
     ramdisk_id = ramdisk_id_;
     block_device_mappings = block_device_mappings_;
     instance_monitoring = instance_monitoring_;
     spot_price = spot_price_;
     iam_instance_profile = iam_instance_profile_;
     ebs_optimized = ebs_optimized_;
     associate_public_ip_address = associate_public_ip_address_;
     placement_tenancy = placement_tenancy_;
     metadata_options = metadata_options_;
   }
    : create_launch_configuration_type)

let make_lifecycle_hook_specification
    ?notification_metadata:(notification_metadata_ : any_printable_ascii_string_max_len4000 option)
    ?heartbeat_timeout:(heartbeat_timeout_ : heartbeat_timeout option)
    ?default_result:(default_result_ : lifecycle_action_result option)
    ?notification_target_ar_n:(notification_target_ar_n_ : notification_target_resource_name option)
    ?role_ar_n:(role_ar_n_ : xml_string_max_len255 option)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255)
    ~lifecycle_transition:(lifecycle_transition_ : lifecycle_transition) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     lifecycle_transition = lifecycle_transition_;
     notification_metadata = notification_metadata_;
     heartbeat_timeout = heartbeat_timeout_;
     default_result = default_result_;
     notification_target_ar_n = notification_target_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : lifecycle_hook_specification)

let make_create_auto_scaling_group_type
    ?launch_configuration_name:(launch_configuration_name_ : xml_string_max_len255 option)
    ?launch_template:(launch_template_ : launch_template_specification option)
    ?mixed_instances_policy:(mixed_instances_policy_ : mixed_instances_policy option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?default_cooldown:(default_cooldown_ : cooldown option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?availability_zone_ids:(availability_zone_ids_ : availability_zone_ids option)
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option)
    ?target_group_ar_ns:(target_group_ar_ns_ : target_group_ar_ns option)
    ?health_check_type:(health_check_type_ : xml_string_max_len32 option)
    ?health_check_grace_period:(health_check_grace_period_ : health_check_grace_period option)
    ?placement_group:(placement_group_ : xml_string_max_len255 option)
    ?vpc_zone_identifier:(vpc_zone_identifier_ : xml_string_max_len5000 option)
    ?termination_policies:(termination_policies_ : termination_policies option)
    ?new_instances_protected_from_scale_in:
      (new_instances_protected_from_scale_in_ : instance_protected option)
    ?capacity_rebalance:(capacity_rebalance_ : capacity_rebalance_enabled option)
    ?lifecycle_hook_specification_list:
      (lifecycle_hook_specification_list_ : lifecycle_hook_specifications option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?tags:(tags_ : tags option)
    ?service_linked_role_ar_n:(service_linked_role_ar_n_ : resource_name option)
    ?max_instance_lifetime:(max_instance_lifetime_ : max_instance_lifetime option)
    ?context:(context_ : context option)
    ?desired_capacity_type:(desired_capacity_type_ : xml_string_max_len255 option)
    ?default_instance_warmup:(default_instance_warmup_ : default_instance_warmup option)
    ?traffic_sources:(traffic_sources_ : traffic_sources option)
    ?instance_maintenance_policy:(instance_maintenance_policy_ : instance_maintenance_policy option)
    ?availability_zone_distribution:
      (availability_zone_distribution_ : availability_zone_distribution option)
    ?availability_zone_impairment_policy:
      (availability_zone_impairment_policy_ : availability_zone_impairment_policy option)
    ?skip_zonal_shift_validation:(skip_zonal_shift_validation_ : skip_zonal_shift_validation option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?instance_lifecycle_policy:(instance_lifecycle_policy_ : instance_lifecycle_policy option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~min_size:(min_size_ : auto_scaling_group_min_size)
    ~max_size:(max_size_ : auto_scaling_group_max_size) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     launch_configuration_name = launch_configuration_name_;
     launch_template = launch_template_;
     mixed_instances_policy = mixed_instances_policy_;
     instance_id = instance_id_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     default_cooldown = default_cooldown_;
     availability_zones = availability_zones_;
     availability_zone_ids = availability_zone_ids_;
     load_balancer_names = load_balancer_names_;
     target_group_ar_ns = target_group_ar_ns_;
     health_check_type = health_check_type_;
     health_check_grace_period = health_check_grace_period_;
     placement_group = placement_group_;
     vpc_zone_identifier = vpc_zone_identifier_;
     termination_policies = termination_policies_;
     new_instances_protected_from_scale_in = new_instances_protected_from_scale_in_;
     capacity_rebalance = capacity_rebalance_;
     lifecycle_hook_specification_list = lifecycle_hook_specification_list_;
     deletion_protection = deletion_protection_;
     tags = tags_;
     service_linked_role_ar_n = service_linked_role_ar_n_;
     max_instance_lifetime = max_instance_lifetime_;
     context = context_;
     desired_capacity_type = desired_capacity_type_;
     default_instance_warmup = default_instance_warmup_;
     traffic_sources = traffic_sources_;
     instance_maintenance_policy = instance_maintenance_policy_;
     availability_zone_distribution = availability_zone_distribution_;
     availability_zone_impairment_policy = availability_zone_impairment_policy_;
     skip_zonal_shift_validation = skip_zonal_shift_validation_;
     capacity_reservation_specification = capacity_reservation_specification_;
     instance_lifecycle_policy = instance_lifecycle_policy_;
   }
    : create_auto_scaling_group_type)

let make_complete_lifecycle_action_answer () = (() : unit)

let make_complete_lifecycle_action_type
    ?lifecycle_action_token:(lifecycle_action_token_ : lifecycle_action_token option)
    ?instance_id:(instance_id_ : xml_string_max_len19 option)
    ~lifecycle_hook_name:(lifecycle_hook_name_ : ascii_string_max_len255)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : resource_name)
    ~lifecycle_action_result:(lifecycle_action_result_ : lifecycle_action_result) () =
  ({
     lifecycle_hook_name = lifecycle_hook_name_;
     auto_scaling_group_name = auto_scaling_group_name_;
     lifecycle_action_token = lifecycle_action_token_;
     lifecycle_action_result = lifecycle_action_result_;
     instance_id = instance_id_;
   }
    : complete_lifecycle_action_type)

let make_cancel_instance_refresh_answer
    ?instance_refresh_id:(instance_refresh_id_ : xml_string_max_len255 option) () =
  ({ instance_refresh_id = instance_refresh_id_ } : cancel_instance_refresh_answer)

let make_cancel_instance_refresh_type
    ?wait_for_transitioning_instances:(wait_for_transitioning_instances_ : boolean_type option)
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     wait_for_transitioning_instances = wait_for_transitioning_instances_;
   }
    : cancel_instance_refresh_type)

let make_failed_scheduled_update_group_action_request
    ?error_code:(error_code_ : xml_string_max_len64 option)
    ?error_message:(error_message_ : xml_string option)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : failed_scheduled_update_group_action_request)

let make_batch_put_scheduled_update_group_action_answer
    ?failed_scheduled_update_group_actions:
      (failed_scheduled_update_group_actions_ : failed_scheduled_update_group_action_requests option)
    () =
  ({ failed_scheduled_update_group_actions = failed_scheduled_update_group_actions_ }
    : batch_put_scheduled_update_group_action_answer)

let make_scheduled_update_group_action_request ?start_time:(start_time_ : timestamp_type option)
    ?end_time:(end_time_ : timestamp_type option)
    ?recurrence:(recurrence_ : xml_string_max_len255 option)
    ?min_size:(min_size_ : auto_scaling_group_min_size option)
    ?max_size:(max_size_ : auto_scaling_group_max_size option)
    ?desired_capacity:(desired_capacity_ : auto_scaling_group_desired_capacity option)
    ?time_zone:(time_zone_ : xml_string_max_len255 option)
    ~scheduled_action_name:(scheduled_action_name_ : xml_string_max_len255) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     start_time = start_time_;
     end_time = end_time_;
     recurrence = recurrence_;
     min_size = min_size_;
     max_size = max_size_;
     desired_capacity = desired_capacity_;
     time_zone = time_zone_;
   }
    : scheduled_update_group_action_request)

let make_batch_put_scheduled_update_group_action_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~scheduled_update_group_actions:
      (scheduled_update_group_actions_ : scheduled_update_group_action_requests) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_update_group_actions = scheduled_update_group_actions_;
   }
    : batch_put_scheduled_update_group_action_type)

let make_batch_delete_scheduled_action_answer
    ?failed_scheduled_actions:
      (failed_scheduled_actions_ : failed_scheduled_update_group_action_requests option) () =
  ({ failed_scheduled_actions = failed_scheduled_actions_ } : batch_delete_scheduled_action_answer)

let make_batch_delete_scheduled_action_type
    ~auto_scaling_group_name:(auto_scaling_group_name_ : xml_string_max_len255)
    ~scheduled_action_names:(scheduled_action_names_ : scheduled_action_names) () =
  ({
     auto_scaling_group_name = auto_scaling_group_name_;
     scheduled_action_names = scheduled_action_names_;
   }
    : batch_delete_scheduled_action_type)
