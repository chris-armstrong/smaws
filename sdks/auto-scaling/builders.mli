open Types

val make_accelerator_count_request :
  ?min:nullable_positive_integer ->
  ?max:nullable_positive_integer ->
  unit ->
  accelerator_count_request

val make_accelerator_total_memory_mi_b_request :
  ?min:nullable_positive_integer ->
  ?max:nullable_positive_integer ->
  unit ->
  accelerator_total_memory_mi_b_request

val make_activity :
  ?description:xml_string ->
  ?end_time:timestamp_type ->
  ?status_message:xml_string_max_len255 ->
  ?progress:progress ->
  ?details:xml_string ->
  ?auto_scaling_group_state:auto_scaling_group_state ->
  ?auto_scaling_group_ar_n:resource_name ->
  activity_id:xml_string ->
  auto_scaling_group_name:xml_string_max_len255 ->
  cause:xml_string_max_len1023 ->
  start_time:timestamp_type ->
  status_code:scaling_activity_status_code ->
  unit ->
  activity

val make_activities_type :
  ?next_token:xml_string -> activities:activities -> unit -> activities_type

val make_activity_type : ?activity:activity -> unit -> activity_type
val make_adjustment_type : ?adjustment_type:xml_string_max_len255 -> unit -> adjustment_type
val make_alarm : ?alarm_name:xml_string_max_len255 -> ?alarm_ar_n:resource_name -> unit -> alarm
val make_alarm_specification : ?alarms:alarm_list -> unit -> alarm_specification

val make_attach_instances_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  attach_instances_query

val make_attach_load_balancer_target_groups_result_type : unit -> unit

val make_attach_load_balancer_target_groups_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  target_group_ar_ns:target_group_ar_ns ->
  unit ->
  attach_load_balancer_target_groups_type

val make_attach_load_balancers_result_type : unit -> unit

val make_attach_load_balancers_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  load_balancer_names:load_balancer_names ->
  unit ->
  attach_load_balancers_type

val make_attach_traffic_sources_result_type : unit -> unit

val make_traffic_source_identifier :
  ?type_:xml_string_max_len511 ->
  identifier:xml_string_max_len511 ->
  unit ->
  traffic_source_identifier

val make_attach_traffic_sources_type :
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  auto_scaling_group_name:xml_string_max_len255 ->
  traffic_sources:traffic_sources ->
  unit ->
  attach_traffic_sources_type

val make_retention_triggers : ?terminate_hook_abandon:retention_action -> unit -> retention_triggers

val make_instance_lifecycle_policy :
  ?retention_triggers:retention_triggers -> unit -> instance_lifecycle_policy

val make_capacity_reservation_target :
  ?capacity_reservation_ids:capacity_reservation_ids ->
  ?capacity_reservation_resource_group_arns:capacity_reservation_resource_group_arns ->
  unit ->
  capacity_reservation_target

val make_capacity_reservation_specification :
  ?capacity_reservation_preference:capacity_reservation_preference ->
  ?capacity_reservation_target:capacity_reservation_target ->
  unit ->
  capacity_reservation_specification

val make_availability_zone_impairment_policy :
  ?zonal_shift_enabled:zonal_shift_enabled ->
  ?impaired_zone_health_check_behavior:impaired_zone_health_check_behavior ->
  unit ->
  availability_zone_impairment_policy

val make_availability_zone_distribution :
  ?capacity_distribution_strategy:capacity_distribution_strategy ->
  unit ->
  availability_zone_distribution

val make_instance_maintenance_policy :
  ?min_healthy_percentage:int_percent_resettable ->
  ?max_healthy_percentage:int_percent100_to200_resettable ->
  unit ->
  instance_maintenance_policy

val make_instance_reuse_policy :
  ?reuse_on_scale_in:reuse_on_scale_in -> unit -> instance_reuse_policy

val make_warm_pool_configuration :
  ?max_group_prepared_capacity:max_group_prepared_capacity ->
  ?min_size:warm_pool_min_size ->
  ?pool_state:warm_pool_state ->
  ?status:warm_pool_status ->
  ?instance_reuse_policy:instance_reuse_policy ->
  unit ->
  warm_pool_configuration

val make_tag_description :
  ?resource_id:xml_string ->
  ?resource_type:xml_string ->
  ?key:tag_key ->
  ?value:tag_value ->
  ?propagate_at_launch:propagate_at_launch ->
  unit ->
  tag_description

val make_enabled_metric :
  ?metric:xml_string_max_len255 -> ?granularity:xml_string_max_len255 -> unit -> enabled_metric

val make_suspended_process :
  ?process_name:xml_string_max_len255 ->
  ?suspension_reason:xml_string_max_len255 ->
  unit ->
  suspended_process

val make_launch_template_specification :
  ?launch_template_id:xml_string_max_len255 ->
  ?launch_template_name:launch_template_name ->
  ?version:xml_string_max_len255 ->
  unit ->
  launch_template_specification

val make_instance :
  ?instance_type:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?image_id:xml_string_max_len255 ->
  ?weighted_capacity:xml_string_max_len32 ->
  instance_id:xml_string_max_len19 ->
  availability_zone:xml_string_max_len255 ->
  lifecycle_state:lifecycle_state ->
  health_status:xml_string_max_len32 ->
  protected_from_scale_in:instance_protected ->
  unit ->
  instance

val make_instances_distribution :
  ?on_demand_allocation_strategy:xml_string ->
  ?on_demand_base_capacity:on_demand_base_capacity ->
  ?on_demand_percentage_above_base_capacity:on_demand_percentage_above_base_capacity ->
  ?spot_allocation_strategy:xml_string ->
  ?spot_instance_pools:spot_instance_pools ->
  ?spot_max_price:mixed_instance_spot_price ->
  unit ->
  instances_distribution

val make_performance_factor_reference_request :
  ?instance_family:string_ -> unit -> performance_factor_reference_request

val make_cpu_performance_factor_request :
  ?references:performance_factor_reference_set_request -> unit -> cpu_performance_factor_request

val make_baseline_performance_factors_request :
  ?cpu:cpu_performance_factor_request -> unit -> baseline_performance_factors_request

val make_network_bandwidth_gbps_request :
  ?min:nullable_positive_double ->
  ?max:nullable_positive_double ->
  unit ->
  network_bandwidth_gbps_request

val make_baseline_ebs_bandwidth_mbps_request :
  ?min:nullable_positive_integer ->
  ?max:nullable_positive_integer ->
  unit ->
  baseline_ebs_bandwidth_mbps_request

val make_total_local_storage_gb_request :
  ?min:nullable_positive_double ->
  ?max:nullable_positive_double ->
  unit ->
  total_local_storage_gb_request

val make_network_interface_count_request :
  ?min:nullable_positive_integer ->
  ?max:nullable_positive_integer ->
  unit ->
  network_interface_count_request

val make_memory_gi_b_per_v_cpu_request :
  ?min:nullable_positive_double ->
  ?max:nullable_positive_double ->
  unit ->
  memory_gi_b_per_v_cpu_request

val make_memory_mi_b_request :
  ?max:nullable_positive_integer -> min:nullable_positive_integer -> unit -> memory_mi_b_request

val make_v_cpu_count_request :
  ?max:nullable_positive_integer -> min:nullable_positive_integer -> unit -> v_cpu_count_request

val make_instance_requirements :
  ?cpu_manufacturers:cpu_manufacturers ->
  ?memory_gi_b_per_v_cpu:memory_gi_b_per_v_cpu_request ->
  ?excluded_instance_types:excluded_instance_types ->
  ?instance_generations:instance_generations ->
  ?spot_max_price_percentage_over_lowest_price:nullable_positive_integer ->
  ?max_spot_price_as_percentage_of_optimal_on_demand_price:nullable_positive_integer ->
  ?on_demand_max_price_percentage_over_lowest_price:nullable_positive_integer ->
  ?bare_metal:bare_metal ->
  ?burstable_performance:burstable_performance ->
  ?require_hibernate_support:nullable_boolean ->
  ?network_interface_count:network_interface_count_request ->
  ?local_storage:local_storage ->
  ?local_storage_types:local_storage_types ->
  ?total_local_storage_g_b:total_local_storage_gb_request ->
  ?baseline_ebs_bandwidth_mbps:baseline_ebs_bandwidth_mbps_request ->
  ?accelerator_types:accelerator_types ->
  ?accelerator_count:accelerator_count_request ->
  ?accelerator_manufacturers:accelerator_manufacturers ->
  ?accelerator_names:accelerator_names ->
  ?accelerator_total_memory_mi_b:accelerator_total_memory_mi_b_request ->
  ?network_bandwidth_gbps:network_bandwidth_gbps_request ->
  ?allowed_instance_types:allowed_instance_types ->
  ?baseline_performance_factors:baseline_performance_factors_request ->
  v_cpu_count:v_cpu_count_request ->
  memory_mi_b:memory_mi_b_request ->
  unit ->
  instance_requirements

val make_launch_template_overrides :
  ?instance_type:xml_string_max_len255 ->
  ?weighted_capacity:xml_string_max_len32 ->
  ?launch_template_specification:launch_template_specification ->
  ?instance_requirements:instance_requirements ->
  ?image_id:image_id ->
  unit ->
  launch_template_overrides

val make_launch_template :
  ?launch_template_specification:launch_template_specification ->
  ?overrides:overrides ->
  unit ->
  launch_template

val make_mixed_instances_policy :
  ?launch_template:launch_template ->
  ?instances_distribution:instances_distribution ->
  unit ->
  mixed_instances_policy

val make_auto_scaling_group :
  ?auto_scaling_group_ar_n:resource_name ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?predicted_capacity:auto_scaling_group_predicted_capacity ->
  ?availability_zone_ids:availability_zone_ids ->
  ?load_balancer_names:load_balancer_names ->
  ?target_group_ar_ns:target_group_ar_ns ->
  ?health_check_grace_period:health_check_grace_period ->
  ?instances:instances ->
  ?suspended_processes:suspended_processes ->
  ?placement_group:xml_string_max_len255 ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?enabled_metrics:enabled_metrics ->
  ?status:xml_string_max_len255 ->
  ?tags:tag_description_list ->
  ?termination_policies:termination_policies ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?service_linked_role_ar_n:resource_name ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?warm_pool_configuration:warm_pool_configuration ->
  ?warm_pool_size:warm_pool_size ->
  ?context:context ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?default_instance_warmup:default_instance_warmup ->
  ?traffic_sources:traffic_sources ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?deletion_protection:deletion_protection ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  auto_scaling_group_name:xml_string_max_len255 ->
  min_size:auto_scaling_group_min_size ->
  max_size:auto_scaling_group_max_size ->
  desired_capacity:auto_scaling_group_desired_capacity ->
  default_cooldown:cooldown ->
  availability_zones:availability_zones ->
  health_check_type:xml_string_max_len32 ->
  created_time:timestamp_type ->
  unit ->
  auto_scaling_group

val make_filter : ?name:xml_string -> ?values:values -> unit -> filter

val make_auto_scaling_group_names_type :
  ?auto_scaling_group_names:auto_scaling_group_names ->
  ?include_instances:include_instances ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  ?filters:filters ->
  unit ->
  auto_scaling_group_names_type

val make_auto_scaling_groups_type :
  ?next_token:xml_string ->
  auto_scaling_groups:auto_scaling_groups ->
  unit ->
  auto_scaling_groups_type

val make_auto_scaling_instance_details :
  ?instance_type:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?image_id:xml_string_max_len255 ->
  ?weighted_capacity:xml_string_max_len32 ->
  instance_id:xml_string_max_len19 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  availability_zone:xml_string_max_len255 ->
  lifecycle_state:xml_string_max_len32 ->
  health_status:xml_string_max_len32 ->
  protected_from_scale_in:instance_protected ->
  unit ->
  auto_scaling_instance_details

val make_auto_scaling_instances_type :
  ?auto_scaling_instances:auto_scaling_instances ->
  ?next_token:xml_string ->
  unit ->
  auto_scaling_instances_type

val make_update_auto_scaling_group_type :
  ?launch_configuration_name:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?min_size:auto_scaling_group_min_size ->
  ?max_size:auto_scaling_group_max_size ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?default_cooldown:cooldown ->
  ?availability_zones:availability_zones ->
  ?availability_zone_ids:availability_zone_ids ->
  ?health_check_type:xml_string_max_len32 ->
  ?health_check_grace_period:health_check_grace_period ->
  ?placement_group:update_placement_group_param ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?termination_policies:termination_policies ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?service_linked_role_ar_n:resource_name ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?context:context ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?default_instance_warmup:default_instance_warmup ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  ?deletion_protection:deletion_protection ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  update_auto_scaling_group_type

val make_terminate_instance_in_auto_scaling_group_type :
  instance_id:xml_string_max_len19 ->
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  unit ->
  terminate_instance_in_auto_scaling_group_type

val make_scaling_process_query :
  ?scaling_processes:process_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  scaling_process_query

val make_start_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> start_instance_refresh_answer

val make_refresh_preferences :
  ?min_healthy_percentage:int_percent ->
  ?instance_warmup:refresh_instance_warmup ->
  ?checkpoint_percentages:checkpoint_percentages ->
  ?checkpoint_delay:checkpoint_delay ->
  ?skip_matching:skip_matching ->
  ?auto_rollback:auto_rollback ->
  ?scale_in_protected_instances:scale_in_protected_instances ->
  ?standby_instances:standby_instances ->
  ?alarm_specification:alarm_specification ->
  ?max_healthy_percentage:int_percent100_to200 ->
  ?bake_time:bake_time ->
  unit ->
  refresh_preferences

val make_desired_configuration :
  ?launch_template:launch_template_specification ->
  ?mixed_instances_policy:mixed_instances_policy ->
  unit ->
  desired_configuration

val make_start_instance_refresh_type :
  ?strategy:refresh_strategy ->
  ?desired_configuration:desired_configuration ->
  ?preferences:refresh_preferences ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  start_instance_refresh_type

val make_set_instance_protection_answer : unit -> unit

val make_set_instance_protection_query :
  instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  protected_from_scale_in:protected_from_scale_in ->
  unit ->
  set_instance_protection_query

val make_set_instance_health_query :
  ?should_respect_grace_period:should_respect_grace_period ->
  instance_id:xml_string_max_len19 ->
  health_status:xml_string_max_len32 ->
  unit ->
  set_instance_health_query

val make_set_desired_capacity_type :
  ?honor_cooldown:honor_cooldown ->
  auto_scaling_group_name:xml_string_max_len255 ->
  desired_capacity:auto_scaling_group_desired_capacity ->
  unit ->
  set_desired_capacity_type

val make_rollback_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> rollback_instance_refresh_answer

val make_rollback_instance_refresh_type :
  auto_scaling_group_name:xml_string_max_len255 -> unit -> rollback_instance_refresh_type

val make_record_lifecycle_action_heartbeat_answer : unit -> unit

val make_record_lifecycle_action_heartbeat_type :
  ?lifecycle_action_token:lifecycle_action_token ->
  ?instance_id:xml_string_max_len19 ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  auto_scaling_group_name:resource_name ->
  unit ->
  record_lifecycle_action_heartbeat_type

val make_put_warm_pool_answer : unit -> unit

val make_put_warm_pool_type :
  ?max_group_prepared_capacity:max_group_prepared_capacity ->
  ?min_size:warm_pool_min_size ->
  ?pool_state:warm_pool_state ->
  ?instance_reuse_policy:instance_reuse_policy ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_warm_pool_type

val make_put_scheduled_update_group_action_type :
  ?time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?recurrence:xml_string_max_len255 ->
  ?min_size:auto_scaling_group_min_size ->
  ?max_size:auto_scaling_group_max_size ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?time_zone:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  put_scheduled_update_group_action_type

val make_policy_arn_type : ?policy_ar_n:resource_name -> ?alarms:alarms -> unit -> policy_arn_type

val make_metric_dimension :
  name:metric_dimension_name -> value:metric_dimension_value -> unit -> metric_dimension

val make_metric :
  ?dimensions:metric_dimensions ->
  namespace:metric_namespace ->
  metric_name:metric_name ->
  unit ->
  metric

val make_metric_stat :
  ?unit_:metric_unit -> metric:metric -> stat:xml_string_metric_stat -> unit -> metric_stat

val make_metric_data_query :
  ?expression:xml_string_max_len1023 ->
  ?metric_stat:metric_stat ->
  ?label:xml_string_metric_label ->
  ?return_data:return_data ->
  id:xml_string_max_len255 ->
  unit ->
  metric_data_query

val make_predictive_scaling_customized_capacity_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_capacity_metric

val make_predictive_scaling_customized_load_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_load_metric

val make_predictive_scaling_customized_scaling_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_scaling_metric

val make_predictive_scaling_predefined_load_metric :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_load_metric_type ->
  unit ->
  predictive_scaling_predefined_load_metric

val make_predictive_scaling_predefined_scaling_metric :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_scaling_metric

val make_predictive_scaling_predefined_metric_pair :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_metric_pair_type ->
  unit ->
  predictive_scaling_predefined_metric_pair

val make_predictive_scaling_metric_specification :
  ?predefined_metric_pair_specification:predictive_scaling_predefined_metric_pair ->
  ?predefined_scaling_metric_specification:predictive_scaling_predefined_scaling_metric ->
  ?predefined_load_metric_specification:predictive_scaling_predefined_load_metric ->
  ?customized_scaling_metric_specification:predictive_scaling_customized_scaling_metric ->
  ?customized_load_metric_specification:predictive_scaling_customized_load_metric ->
  ?customized_capacity_metric_specification:predictive_scaling_customized_capacity_metric ->
  target_value:metric_scale ->
  unit ->
  predictive_scaling_metric_specification

val make_predictive_scaling_configuration :
  ?mode:predictive_scaling_mode ->
  ?scheduling_buffer_time:predictive_scaling_scheduling_buffer_time ->
  ?max_capacity_breach_behavior:predictive_scaling_max_capacity_breach_behavior ->
  ?max_capacity_buffer:predictive_scaling_max_capacity_buffer ->
  metric_specifications:predictive_scaling_metric_specifications ->
  unit ->
  predictive_scaling_configuration

val make_target_tracking_metric_stat :
  ?unit_:metric_unit ->
  ?period:metric_granularity_in_seconds ->
  metric:metric ->
  stat:xml_string_metric_stat ->
  unit ->
  target_tracking_metric_stat

val make_target_tracking_metric_data_query :
  ?expression:xml_string_max_len2047 ->
  ?metric_stat:target_tracking_metric_stat ->
  ?label:xml_string_metric_label ->
  ?period:metric_granularity_in_seconds ->
  ?return_data:return_data ->
  id:xml_string_max_len64 ->
  unit ->
  target_tracking_metric_data_query

val make_customized_metric_specification :
  ?metric_name:metric_name ->
  ?namespace:metric_namespace ->
  ?dimensions:metric_dimensions ->
  ?statistic:metric_statistic ->
  ?unit_:metric_unit ->
  ?period:metric_granularity_in_seconds ->
  ?metrics:target_tracking_metric_data_queries ->
  unit ->
  customized_metric_specification

val make_predefined_metric_specification :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:metric_type ->
  unit ->
  predefined_metric_specification

val make_target_tracking_configuration :
  ?predefined_metric_specification:predefined_metric_specification ->
  ?customized_metric_specification:customized_metric_specification ->
  ?disable_scale_in:disable_scale_in ->
  target_value:metric_scale ->
  unit ->
  target_tracking_configuration

val make_step_adjustment :
  ?metric_interval_lower_bound:metric_scale ->
  ?metric_interval_upper_bound:metric_scale ->
  scaling_adjustment:policy_increment ->
  unit ->
  step_adjustment

val make_put_scaling_policy_type :
  ?policy_type:xml_string_max_len64 ->
  ?adjustment_type:xml_string_max_len255 ->
  ?min_adjustment_step:min_adjustment_step ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?scaling_adjustment:policy_increment ->
  ?cooldown:cooldown ->
  ?metric_aggregation_type:xml_string_max_len32 ->
  ?step_adjustments:step_adjustments ->
  ?estimated_instance_warmup:estimated_instance_warmup ->
  ?target_tracking_configuration:target_tracking_configuration ->
  ?enabled:scaling_policy_enabled ->
  ?predictive_scaling_configuration:predictive_scaling_configuration ->
  auto_scaling_group_name:xml_string_max_len255 ->
  policy_name:xml_string_max_len255 ->
  unit ->
  put_scaling_policy_type

val make_put_notification_configuration_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  topic_ar_n:xml_string_max_len255 ->
  notification_types:auto_scaling_notification_types ->
  unit ->
  put_notification_configuration_type

val make_put_lifecycle_hook_answer : unit -> unit

val make_put_lifecycle_hook_type :
  ?lifecycle_transition:lifecycle_transition ->
  ?role_ar_n:xml_string_max_len255 ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?default_result:lifecycle_action_result ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_lifecycle_hook_type

val make_launch_instances_error :
  ?instance_type:xml_string_max_len255 ->
  ?market_type:xml_string_max_len64 ->
  ?subnet_id:xml_string_max_len255 ->
  ?availability_zone:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?error_code:xml_string_max_len64 ->
  ?error_message:xml_string ->
  unit ->
  launch_instances_error

val make_instance_collection :
  ?instance_type:xml_string_max_len255 ->
  ?market_type:xml_string_max_len64 ->
  ?subnet_id:xml_string_max_len255 ->
  ?availability_zone:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?instance_ids:instance_ids ->
  unit ->
  instance_collection

val make_launch_instances_request :
  ?availability_zones:availability_zones_limit1 ->
  ?availability_zone_ids:availability_zone_ids_limit1 ->
  ?subnet_ids:subnet_ids_limit1 ->
  ?retry_strategy:retry_strategy ->
  auto_scaling_group_name:xml_string_max_len255 ->
  requested_capacity:requested_capacity ->
  client_token:client_token ->
  unit ->
  launch_instances_request

val make_capacity_forecast :
  timestamps:predictive_scaling_forecast_timestamps ->
  values:predictive_scaling_forecast_values ->
  unit ->
  capacity_forecast

val make_load_forecast :
  timestamps:predictive_scaling_forecast_timestamps ->
  values:predictive_scaling_forecast_values ->
  metric_specification:predictive_scaling_metric_specification ->
  unit ->
  load_forecast

val make_get_predictive_scaling_forecast_answer :
  load_forecast:load_forecasts ->
  capacity_forecast:capacity_forecast ->
  update_time:timestamp_type ->
  unit ->
  get_predictive_scaling_forecast_answer

val make_get_predictive_scaling_forecast_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  policy_name:xml_string_max_len255 ->
  start_time:timestamp_type ->
  end_time:timestamp_type ->
  unit ->
  get_predictive_scaling_forecast_type

val make_exit_standby_answer : ?activities:activities -> unit -> exit_standby_answer

val make_exit_standby_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  exit_standby_query

val make_execute_policy_type :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?honor_cooldown:honor_cooldown ->
  ?metric_value:metric_scale ->
  ?breach_threshold:metric_scale ->
  policy_name:resource_name ->
  unit ->
  execute_policy_type

val make_enter_standby_answer : ?activities:activities -> unit -> enter_standby_answer

val make_enter_standby_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  unit ->
  enter_standby_query

val make_enable_metrics_collection_query :
  ?metrics:metrics ->
  auto_scaling_group_name:xml_string_max_len255 ->
  granularity:xml_string_max_len255 ->
  unit ->
  enable_metrics_collection_query

val make_disable_metrics_collection_query :
  ?metrics:metrics ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  disable_metrics_collection_query

val make_detach_traffic_sources_result_type : unit -> unit

val make_detach_traffic_sources_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  traffic_sources:traffic_sources ->
  unit ->
  detach_traffic_sources_type

val make_detach_load_balancer_target_groups_result_type : unit -> unit

val make_detach_load_balancer_target_groups_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  target_group_ar_ns:target_group_ar_ns ->
  unit ->
  detach_load_balancer_target_groups_type

val make_detach_load_balancers_result_type : unit -> unit

val make_detach_load_balancers_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  load_balancer_names:load_balancer_names ->
  unit ->
  detach_load_balancers_type

val make_detach_instances_answer : ?activities:activities -> unit -> detach_instances_answer

val make_detach_instances_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  unit ->
  detach_instances_query

val make_describe_warm_pool_answer :
  ?warm_pool_configuration:warm_pool_configuration ->
  ?instances:instances ->
  ?next_token:xml_string ->
  unit ->
  describe_warm_pool_answer

val make_describe_warm_pool_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_warm_pool_type

val make_traffic_source_state :
  ?traffic_source:xml_string_max_len511 ->
  ?state:xml_string_max_len255 ->
  ?identifier:xml_string_max_len511 ->
  ?type_:xml_string_max_len511 ->
  unit ->
  traffic_source_state

val make_describe_traffic_sources_response :
  ?traffic_sources:traffic_source_states ->
  ?next_token:xml_string ->
  unit ->
  describe_traffic_sources_response

val make_describe_traffic_sources_request :
  ?traffic_source_type:xml_string_max_len255 ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_traffic_sources_request

val make_describe_termination_policy_types_answer :
  ?termination_policy_types:termination_policies -> unit -> describe_termination_policy_types_answer

val make_tags_type : ?tags:tag_description_list -> ?next_token:xml_string -> unit -> tags_type

val make_describe_tags_type :
  ?filters:filters ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  unit ->
  describe_tags_type

val make_scheduled_update_group_action :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?scheduled_action_name:xml_string_max_len255 ->
  ?scheduled_action_ar_n:resource_name ->
  ?time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?recurrence:xml_string_max_len255 ->
  ?min_size:auto_scaling_group_min_size ->
  ?max_size:auto_scaling_group_max_size ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?time_zone:xml_string_max_len255 ->
  unit ->
  scheduled_update_group_action

val make_scheduled_actions_type :
  ?scheduled_update_group_actions:scheduled_update_group_actions ->
  ?next_token:xml_string ->
  unit ->
  scheduled_actions_type

val make_describe_scheduled_actions_type :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?scheduled_action_names:scheduled_action_names ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  unit ->
  describe_scheduled_actions_type

val make_process_type : process_name:xml_string_max_len255 -> unit -> process_type
val make_processes_type : ?processes:processes -> unit -> processes_type

val make_describe_scaling_activities_type :
  ?activity_ids:activity_ids ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?include_deleted_groups:include_deleted_groups ->
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?filters:filters ->
  unit ->
  describe_scaling_activities_type

val make_scaling_policy :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?policy_name:xml_string_max_len255 ->
  ?policy_ar_n:resource_name ->
  ?policy_type:xml_string_max_len64 ->
  ?adjustment_type:xml_string_max_len255 ->
  ?min_adjustment_step:min_adjustment_step ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?scaling_adjustment:policy_increment ->
  ?cooldown:cooldown ->
  ?step_adjustments:step_adjustments ->
  ?metric_aggregation_type:xml_string_max_len32 ->
  ?estimated_instance_warmup:estimated_instance_warmup ->
  ?alarms:alarms ->
  ?target_tracking_configuration:target_tracking_configuration ->
  ?enabled:scaling_policy_enabled ->
  ?predictive_scaling_configuration:predictive_scaling_configuration ->
  unit ->
  scaling_policy

val make_policies_type :
  ?scaling_policies:scaling_policies -> ?next_token:xml_string -> unit -> policies_type

val make_describe_policies_type :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?policy_names:policy_names ->
  ?policy_types:policy_types ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  unit ->
  describe_policies_type

val make_notification_configuration :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?topic_ar_n:xml_string_max_len255 ->
  ?notification_type:xml_string_max_len255 ->
  unit ->
  notification_configuration

val make_describe_notification_configurations_answer :
  ?next_token:xml_string ->
  notification_configurations:notification_configurations ->
  unit ->
  describe_notification_configurations_answer

val make_describe_notification_configurations_type :
  ?auto_scaling_group_names:auto_scaling_group_names ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  unit ->
  describe_notification_configurations_type

val make_metric_granularity_type :
  ?granularity:xml_string_max_len255 -> unit -> metric_granularity_type

val make_metric_collection_type : ?metric:xml_string_max_len255 -> unit -> metric_collection_type

val make_describe_metric_collection_types_answer :
  ?metrics:metric_collection_types ->
  ?granularities:metric_granularity_types ->
  unit ->
  describe_metric_collection_types_answer

val make_load_balancer_target_group_state :
  ?load_balancer_target_group_ar_n:xml_string_max_len511 ->
  ?state:xml_string_max_len255 ->
  unit ->
  load_balancer_target_group_state

val make_describe_load_balancer_target_groups_response :
  ?load_balancer_target_groups:load_balancer_target_group_states ->
  ?next_token:xml_string ->
  unit ->
  describe_load_balancer_target_groups_response

val make_describe_load_balancer_target_groups_request :
  ?next_token:xml_string ->
  ?max_records:max_records ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_load_balancer_target_groups_request

val make_load_balancer_state :
  ?load_balancer_name:xml_string_max_len255 ->
  ?state:xml_string_max_len255 ->
  unit ->
  load_balancer_state

val make_describe_load_balancers_response :
  ?load_balancers:load_balancer_states ->
  ?next_token:xml_string ->
  unit ->
  describe_load_balancers_response

val make_describe_load_balancers_request :
  ?next_token:xml_string ->
  ?max_records:max_records ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_load_balancers_request

val make_describe_lifecycle_hook_types_answer :
  ?lifecycle_hook_types:auto_scaling_notification_types ->
  unit ->
  describe_lifecycle_hook_types_answer

val make_lifecycle_hook :
  ?lifecycle_hook_name:ascii_string_max_len255 ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?lifecycle_transition:lifecycle_transition ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?role_ar_n:xml_string_max_len255 ->
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?global_timeout:global_timeout ->
  ?default_result:lifecycle_action_result ->
  unit ->
  lifecycle_hook

val make_describe_lifecycle_hooks_answer :
  ?lifecycle_hooks:lifecycle_hooks -> unit -> describe_lifecycle_hooks_answer

val make_describe_lifecycle_hooks_type :
  ?lifecycle_hook_names:lifecycle_hook_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_lifecycle_hooks_type

val make_instance_metadata_options :
  ?http_tokens:instance_metadata_http_tokens_state ->
  ?http_put_response_hop_limit:instance_metadata_http_put_response_hop_limit ->
  ?http_endpoint:instance_metadata_endpoint_state ->
  unit ->
  instance_metadata_options

val make_instance_monitoring : ?enabled:monitoring_enabled -> unit -> instance_monitoring

val make_ebs :
  ?snapshot_id:xml_string_max_len255 ->
  ?volume_size:block_device_ebs_volume_size ->
  ?volume_type:block_device_ebs_volume_type ->
  ?delete_on_termination:block_device_ebs_delete_on_termination ->
  ?iops:block_device_ebs_iops ->
  ?encrypted:block_device_ebs_encrypted ->
  ?throughput:block_device_ebs_throughput ->
  unit ->
  ebs

val make_block_device_mapping :
  ?virtual_name:xml_string_max_len255 ->
  ?ebs:ebs ->
  ?no_device:no_device ->
  device_name:xml_string_max_len255 ->
  unit ->
  block_device_mapping

val make_launch_configuration :
  ?launch_configuration_ar_n:resource_name ->
  ?key_name:xml_string_max_len255 ->
  ?security_groups:security_groups ->
  ?classic_link_vpc_id:xml_string_max_len255 ->
  ?classic_link_vpc_security_groups:classic_link_vpc_security_groups ->
  ?user_data:xml_string_user_data ->
  ?kernel_id:xml_string_max_len255 ->
  ?ramdisk_id:xml_string_max_len255 ->
  ?block_device_mappings:block_device_mappings ->
  ?instance_monitoring:instance_monitoring ->
  ?spot_price:spot_price ->
  ?iam_instance_profile:xml_string_max_len1600 ->
  ?ebs_optimized:ebs_optimized ->
  ?associate_public_ip_address:associate_public_ip_address ->
  ?placement_tenancy:xml_string_max_len64 ->
  ?metadata_options:instance_metadata_options ->
  launch_configuration_name:xml_string_max_len255 ->
  image_id:xml_string_max_len255 ->
  instance_type:xml_string_max_len255 ->
  created_time:timestamp_type ->
  unit ->
  launch_configuration

val make_launch_configurations_type :
  ?next_token:xml_string ->
  launch_configurations:launch_configurations ->
  unit ->
  launch_configurations_type

val make_launch_configuration_names_type :
  ?launch_configuration_names:launch_configuration_names ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  unit ->
  launch_configuration_names_type

val make_instance_refresh_warm_pool_progress :
  ?percentage_complete:int_percent ->
  ?instances_to_update:instances_to_update ->
  unit ->
  instance_refresh_warm_pool_progress

val make_instance_refresh_live_pool_progress :
  ?percentage_complete:int_percent ->
  ?instances_to_update:instances_to_update ->
  unit ->
  instance_refresh_live_pool_progress

val make_instance_refresh_progress_details :
  ?live_pool_progress:instance_refresh_live_pool_progress ->
  ?warm_pool_progress:instance_refresh_warm_pool_progress ->
  unit ->
  instance_refresh_progress_details

val make_rollback_details :
  ?rollback_reason:xml_string_max_len1023 ->
  ?rollback_start_time:timestamp_type ->
  ?percentage_complete_on_rollback:int_percent ->
  ?instances_to_update_on_rollback:instances_to_update ->
  ?progress_details_on_rollback:instance_refresh_progress_details ->
  unit ->
  rollback_details

val make_instance_refresh :
  ?instance_refresh_id:xml_string_max_len255 ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?status:instance_refresh_status ->
  ?status_reason:xml_string_max_len1023 ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?percentage_complete:int_percent ->
  ?instances_to_update:instances_to_update ->
  ?progress_details:instance_refresh_progress_details ->
  ?preferences:refresh_preferences ->
  ?desired_configuration:desired_configuration ->
  ?rollback_details:rollback_details ->
  ?strategy:refresh_strategy ->
  unit ->
  instance_refresh

val make_describe_instance_refreshes_answer :
  ?instance_refreshes:instance_refreshes ->
  ?next_token:xml_string ->
  unit ->
  describe_instance_refreshes_answer

val make_describe_instance_refreshes_type :
  ?instance_refresh_ids:instance_refresh_ids ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_instance_refreshes_type

val make_describe_auto_scaling_notification_types_answer :
  ?auto_scaling_notification_types:auto_scaling_notification_types ->
  unit ->
  describe_auto_scaling_notification_types_answer

val make_describe_auto_scaling_instances_type :
  ?instance_ids:instance_ids ->
  ?max_records:max_records ->
  ?next_token:xml_string ->
  unit ->
  describe_auto_scaling_instances_type

val make_describe_adjustment_types_answer :
  ?adjustment_types:adjustment_types -> unit -> describe_adjustment_types_answer

val make_describe_account_limits_answer :
  ?max_number_of_auto_scaling_groups:max_number_of_auto_scaling_groups ->
  ?max_number_of_launch_configurations:max_number_of_launch_configurations ->
  ?number_of_auto_scaling_groups:number_of_auto_scaling_groups ->
  ?number_of_launch_configurations:number_of_launch_configurations ->
  unit ->
  describe_account_limits_answer

val make_delete_warm_pool_answer : unit -> unit

val make_delete_warm_pool_type :
  ?force_delete:force_delete ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_warm_pool_type

val make_tag :
  ?resource_id:xml_string ->
  ?resource_type:xml_string ->
  ?value:tag_value ->
  ?propagate_at_launch:propagate_at_launch ->
  key:tag_key ->
  unit ->
  tag

val make_delete_tags_type : tags:tags -> unit -> delete_tags_type

val make_delete_scheduled_action_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  delete_scheduled_action_type

val make_delete_policy_type :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  policy_name:resource_name ->
  unit ->
  delete_policy_type

val make_delete_notification_configuration_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  topic_ar_n:xml_string_max_len255 ->
  unit ->
  delete_notification_configuration_type

val make_delete_lifecycle_hook_answer : unit -> unit

val make_delete_lifecycle_hook_type :
  lifecycle_hook_name:ascii_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_lifecycle_hook_type

val make_launch_configuration_name_type :
  launch_configuration_name:xml_string_max_len255 -> unit -> launch_configuration_name_type

val make_delete_auto_scaling_group_type :
  ?force_delete:force_delete ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_auto_scaling_group_type

val make_create_or_update_tags_type : tags:tags -> unit -> create_or_update_tags_type

val make_create_launch_configuration_type :
  ?image_id:xml_string_max_len255 ->
  ?key_name:xml_string_max_len255 ->
  ?security_groups:security_groups ->
  ?classic_link_vpc_id:xml_string_max_len255 ->
  ?classic_link_vpc_security_groups:classic_link_vpc_security_groups ->
  ?user_data:xml_string_user_data ->
  ?instance_id:xml_string_max_len19 ->
  ?instance_type:xml_string_max_len255 ->
  ?kernel_id:xml_string_max_len255 ->
  ?ramdisk_id:xml_string_max_len255 ->
  ?block_device_mappings:block_device_mappings ->
  ?instance_monitoring:instance_monitoring ->
  ?spot_price:spot_price ->
  ?iam_instance_profile:xml_string_max_len1600 ->
  ?ebs_optimized:ebs_optimized ->
  ?associate_public_ip_address:associate_public_ip_address ->
  ?placement_tenancy:xml_string_max_len64 ->
  ?metadata_options:instance_metadata_options ->
  launch_configuration_name:xml_string_max_len255 ->
  unit ->
  create_launch_configuration_type

val make_lifecycle_hook_specification :
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?default_result:lifecycle_action_result ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?role_ar_n:xml_string_max_len255 ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  lifecycle_transition:lifecycle_transition ->
  unit ->
  lifecycle_hook_specification

val make_create_auto_scaling_group_type :
  ?launch_configuration_name:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?instance_id:xml_string_max_len19 ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?default_cooldown:cooldown ->
  ?availability_zones:availability_zones ->
  ?availability_zone_ids:availability_zone_ids ->
  ?load_balancer_names:load_balancer_names ->
  ?target_group_ar_ns:target_group_ar_ns ->
  ?health_check_type:xml_string_max_len32 ->
  ?health_check_grace_period:health_check_grace_period ->
  ?placement_group:xml_string_max_len255 ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?termination_policies:termination_policies ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?lifecycle_hook_specification_list:lifecycle_hook_specifications ->
  ?deletion_protection:deletion_protection ->
  ?tags:tags ->
  ?service_linked_role_ar_n:resource_name ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?context:context ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?default_instance_warmup:default_instance_warmup ->
  ?traffic_sources:traffic_sources ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  auto_scaling_group_name:xml_string_max_len255 ->
  min_size:auto_scaling_group_min_size ->
  max_size:auto_scaling_group_max_size ->
  unit ->
  create_auto_scaling_group_type

val make_complete_lifecycle_action_answer : unit -> unit

val make_complete_lifecycle_action_type :
  ?lifecycle_action_token:lifecycle_action_token ->
  ?instance_id:xml_string_max_len19 ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  auto_scaling_group_name:resource_name ->
  lifecycle_action_result:lifecycle_action_result ->
  unit ->
  complete_lifecycle_action_type

val make_cancel_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> cancel_instance_refresh_answer

val make_cancel_instance_refresh_type :
  ?wait_for_transitioning_instances:boolean_type ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  cancel_instance_refresh_type

val make_failed_scheduled_update_group_action_request :
  ?error_code:xml_string_max_len64 ->
  ?error_message:xml_string ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  failed_scheduled_update_group_action_request

val make_batch_put_scheduled_update_group_action_answer :
  ?failed_scheduled_update_group_actions:failed_scheduled_update_group_action_requests ->
  unit ->
  batch_put_scheduled_update_group_action_answer

val make_scheduled_update_group_action_request :
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?recurrence:xml_string_max_len255 ->
  ?min_size:auto_scaling_group_min_size ->
  ?max_size:auto_scaling_group_max_size ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?time_zone:xml_string_max_len255 ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  scheduled_update_group_action_request

val make_batch_put_scheduled_update_group_action_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  scheduled_update_group_actions:scheduled_update_group_action_requests ->
  unit ->
  batch_put_scheduled_update_group_action_type

val make_batch_delete_scheduled_action_answer :
  ?failed_scheduled_actions:failed_scheduled_update_group_action_requests ->
  unit ->
  batch_delete_scheduled_action_answer

val make_batch_delete_scheduled_action_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  scheduled_action_names:scheduled_action_names ->
  unit ->
  batch_delete_scheduled_action_type
