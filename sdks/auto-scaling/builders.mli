open Types

val make_instance_reuse_policy :
  ?reuse_on_scale_in:reuse_on_scale_in -> unit -> instance_reuse_policy

val make_warm_pool_configuration :
  ?instance_reuse_policy:instance_reuse_policy ->
  ?status:warm_pool_status ->
  ?pool_state:warm_pool_state ->
  ?min_size:warm_pool_min_size ->
  ?max_group_prepared_capacity:max_group_prepared_capacity ->
  unit ->
  warm_pool_configuration

val make_v_cpu_count_request :
  ?max:nullable_positive_integer -> min:nullable_positive_integer -> unit -> v_cpu_count_request

val make_launch_template_specification :
  ?version:xml_string_max_len255 ->
  ?launch_template_name:launch_template_name ->
  ?launch_template_id:xml_string_max_len255 ->
  unit ->
  launch_template_specification

val make_memory_mi_b_request :
  ?max:nullable_positive_integer -> min:nullable_positive_integer -> unit -> memory_mi_b_request

val make_memory_gi_b_per_v_cpu_request :
  ?max:nullable_positive_double ->
  ?min:nullable_positive_double ->
  unit ->
  memory_gi_b_per_v_cpu_request

val make_network_interface_count_request :
  ?max:nullable_positive_integer ->
  ?min:nullable_positive_integer ->
  unit ->
  network_interface_count_request

val make_total_local_storage_gb_request :
  ?max:nullable_positive_double ->
  ?min:nullable_positive_double ->
  unit ->
  total_local_storage_gb_request

val make_baseline_ebs_bandwidth_mbps_request :
  ?max:nullable_positive_integer ->
  ?min:nullable_positive_integer ->
  unit ->
  baseline_ebs_bandwidth_mbps_request

val make_accelerator_count_request :
  ?max:nullable_positive_integer ->
  ?min:nullable_positive_integer ->
  unit ->
  accelerator_count_request

val make_accelerator_total_memory_mi_b_request :
  ?max:nullable_positive_integer ->
  ?min:nullable_positive_integer ->
  unit ->
  accelerator_total_memory_mi_b_request

val make_network_bandwidth_gbps_request :
  ?max:nullable_positive_double ->
  ?min:nullable_positive_double ->
  unit ->
  network_bandwidth_gbps_request

val make_performance_factor_reference_request :
  ?instance_family:string_ -> unit -> performance_factor_reference_request

val make_cpu_performance_factor_request :
  ?references:performance_factor_reference_set_request -> unit -> cpu_performance_factor_request

val make_baseline_performance_factors_request :
  ?cpu:cpu_performance_factor_request -> unit -> baseline_performance_factors_request

val make_instance_requirements :
  ?baseline_performance_factors:baseline_performance_factors_request ->
  ?allowed_instance_types:allowed_instance_types ->
  ?network_bandwidth_gbps:network_bandwidth_gbps_request ->
  ?accelerator_total_memory_mi_b:accelerator_total_memory_mi_b_request ->
  ?accelerator_names:accelerator_names ->
  ?accelerator_manufacturers:accelerator_manufacturers ->
  ?accelerator_count:accelerator_count_request ->
  ?accelerator_types:accelerator_types ->
  ?baseline_ebs_bandwidth_mbps:baseline_ebs_bandwidth_mbps_request ->
  ?total_local_storage_g_b:total_local_storage_gb_request ->
  ?local_storage_types:local_storage_types ->
  ?local_storage:local_storage ->
  ?network_interface_count:network_interface_count_request ->
  ?require_hibernate_support:nullable_boolean ->
  ?burstable_performance:burstable_performance ->
  ?bare_metal:bare_metal ->
  ?on_demand_max_price_percentage_over_lowest_price:nullable_positive_integer ->
  ?max_spot_price_as_percentage_of_optimal_on_demand_price:nullable_positive_integer ->
  ?spot_max_price_percentage_over_lowest_price:nullable_positive_integer ->
  ?instance_generations:instance_generations ->
  ?excluded_instance_types:excluded_instance_types ->
  ?memory_gi_b_per_v_cpu:memory_gi_b_per_v_cpu_request ->
  ?cpu_manufacturers:cpu_manufacturers ->
  memory_mi_b:memory_mi_b_request ->
  v_cpu_count:v_cpu_count_request ->
  unit ->
  instance_requirements

val make_launch_template_overrides :
  ?image_id:image_id ->
  ?instance_requirements:instance_requirements ->
  ?launch_template_specification:launch_template_specification ->
  ?weighted_capacity:xml_string_max_len32 ->
  ?instance_type:xml_string_max_len255 ->
  unit ->
  launch_template_overrides

val make_launch_template :
  ?overrides:overrides ->
  ?launch_template_specification:launch_template_specification ->
  unit ->
  launch_template

val make_instances_distribution :
  ?spot_max_price:mixed_instance_spot_price ->
  ?spot_instance_pools:spot_instance_pools ->
  ?spot_allocation_strategy:xml_string ->
  ?on_demand_percentage_above_base_capacity:on_demand_percentage_above_base_capacity ->
  ?on_demand_base_capacity:on_demand_base_capacity ->
  ?on_demand_allocation_strategy:xml_string ->
  unit ->
  instances_distribution

val make_mixed_instances_policy :
  ?instances_distribution:instances_distribution ->
  ?launch_template:launch_template ->
  unit ->
  mixed_instances_policy

val make_instance_maintenance_policy :
  ?max_healthy_percentage:int_percent100_to200_resettable ->
  ?min_healthy_percentage:int_percent_resettable ->
  unit ->
  instance_maintenance_policy

val make_availability_zone_distribution :
  ?capacity_distribution_strategy:capacity_distribution_strategy ->
  unit ->
  availability_zone_distribution

val make_availability_zone_impairment_policy :
  ?impaired_zone_health_check_behavior:impaired_zone_health_check_behavior ->
  ?zonal_shift_enabled:zonal_shift_enabled ->
  unit ->
  availability_zone_impairment_policy

val make_capacity_reservation_target :
  ?capacity_reservation_resource_group_arns:capacity_reservation_resource_group_arns ->
  ?capacity_reservation_ids:capacity_reservation_ids ->
  unit ->
  capacity_reservation_target

val make_capacity_reservation_specification :
  ?capacity_reservation_target:capacity_reservation_target ->
  ?capacity_reservation_preference:capacity_reservation_preference ->
  unit ->
  capacity_reservation_specification

val make_retention_triggers : ?terminate_hook_abandon:retention_action -> unit -> retention_triggers

val make_instance_lifecycle_policy :
  ?retention_triggers:retention_triggers -> unit -> instance_lifecycle_policy

val make_update_auto_scaling_group_type :
  ?deletion_protection:deletion_protection ->
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?default_instance_warmup:default_instance_warmup ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?context:context ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?service_linked_role_ar_n:resource_name ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?termination_policies:termination_policies ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?placement_group:update_placement_group_param ->
  ?health_check_grace_period:health_check_grace_period ->
  ?health_check_type:xml_string_max_len32 ->
  ?availability_zone_ids:availability_zone_ids ->
  ?availability_zones:availability_zones ->
  ?default_cooldown:cooldown ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?max_size:auto_scaling_group_max_size ->
  ?min_size:auto_scaling_group_min_size ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?launch_template:launch_template_specification ->
  ?launch_configuration_name:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  update_auto_scaling_group_type

val make_traffic_source_identifier :
  ?type_:xml_string_max_len511 ->
  identifier:xml_string_max_len511 ->
  unit ->
  traffic_source_identifier

val make_traffic_source_state :
  ?type_:xml_string_max_len511 ->
  ?identifier:xml_string_max_len511 ->
  ?state:xml_string_max_len255 ->
  ?traffic_source:xml_string_max_len511 ->
  unit ->
  traffic_source_state

val make_terminate_instance_in_auto_scaling_group_type :
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  instance_id:xml_string_max_len19 ->
  unit ->
  terminate_instance_in_auto_scaling_group_type

val make_activity :
  ?auto_scaling_group_ar_n:resource_name ->
  ?auto_scaling_group_state:auto_scaling_group_state ->
  ?details:xml_string ->
  ?progress:progress ->
  ?status_message:xml_string_max_len255 ->
  ?end_time:timestamp_type ->
  ?description:xml_string ->
  status_code:scaling_activity_status_code ->
  start_time:timestamp_type ->
  cause:xml_string_max_len1023 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  activity_id:xml_string ->
  unit ->
  activity

val make_activity_type : ?activity:activity -> unit -> activity_type

val make_metric_dimension :
  value:metric_dimension_value -> name:metric_dimension_name -> unit -> metric_dimension

val make_metric :
  ?dimensions:metric_dimensions ->
  metric_name:metric_name ->
  namespace:metric_namespace ->
  unit ->
  metric

val make_target_tracking_metric_stat :
  ?period:metric_granularity_in_seconds ->
  ?unit_:metric_unit ->
  stat:xml_string_metric_stat ->
  metric:metric ->
  unit ->
  target_tracking_metric_stat

val make_target_tracking_metric_data_query :
  ?return_data:return_data ->
  ?period:metric_granularity_in_seconds ->
  ?label:xml_string_metric_label ->
  ?metric_stat:target_tracking_metric_stat ->
  ?expression:xml_string_max_len2047 ->
  id:xml_string_max_len64 ->
  unit ->
  target_tracking_metric_data_query

val make_predefined_metric_specification :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:metric_type ->
  unit ->
  predefined_metric_specification

val make_customized_metric_specification :
  ?metrics:target_tracking_metric_data_queries ->
  ?period:metric_granularity_in_seconds ->
  ?unit_:metric_unit ->
  ?statistic:metric_statistic ->
  ?dimensions:metric_dimensions ->
  ?namespace:metric_namespace ->
  ?metric_name:metric_name ->
  unit ->
  customized_metric_specification

val make_target_tracking_configuration :
  ?disable_scale_in:disable_scale_in ->
  ?customized_metric_specification:customized_metric_specification ->
  ?predefined_metric_specification:predefined_metric_specification ->
  target_value:metric_scale ->
  unit ->
  target_tracking_configuration

val make_tag_description :
  ?propagate_at_launch:propagate_at_launch ->
  ?value:tag_value ->
  ?key:tag_key ->
  ?resource_type:xml_string ->
  ?resource_id:xml_string ->
  unit ->
  tag_description

val make_tags_type : ?next_token:xml_string -> ?tags:tag_description_list -> unit -> tags_type

val make_tag :
  ?propagate_at_launch:propagate_at_launch ->
  ?value:tag_value ->
  ?resource_type:xml_string ->
  ?resource_id:xml_string ->
  key:tag_key ->
  unit ->
  tag

val make_suspended_process :
  ?suspension_reason:xml_string_max_len255 ->
  ?process_name:xml_string_max_len255 ->
  unit ->
  suspended_process

val make_scaling_process_query :
  ?scaling_processes:process_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  scaling_process_query

val make_step_adjustment :
  ?metric_interval_upper_bound:metric_scale ->
  ?metric_interval_lower_bound:metric_scale ->
  scaling_adjustment:policy_increment ->
  unit ->
  step_adjustment

val make_desired_configuration :
  ?mixed_instances_policy:mixed_instances_policy ->
  ?launch_template:launch_template_specification ->
  unit ->
  desired_configuration

val make_alarm_specification : ?alarms:alarm_list -> unit -> alarm_specification

val make_refresh_preferences :
  ?bake_time:bake_time ->
  ?max_healthy_percentage:int_percent100_to200 ->
  ?alarm_specification:alarm_specification ->
  ?standby_instances:standby_instances ->
  ?scale_in_protected_instances:scale_in_protected_instances ->
  ?auto_rollback:auto_rollback ->
  ?skip_matching:skip_matching ->
  ?checkpoint_delay:checkpoint_delay ->
  ?checkpoint_percentages:checkpoint_percentages ->
  ?instance_warmup:refresh_instance_warmup ->
  ?min_healthy_percentage:int_percent ->
  unit ->
  refresh_preferences

val make_start_instance_refresh_type :
  ?preferences:refresh_preferences ->
  ?desired_configuration:desired_configuration ->
  ?strategy:refresh_strategy ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  start_instance_refresh_type

val make_start_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> start_instance_refresh_answer

val make_set_instance_protection_query :
  protected_from_scale_in:protected_from_scale_in ->
  auto_scaling_group_name:xml_string_max_len255 ->
  instance_ids:instance_ids ->
  unit ->
  set_instance_protection_query

val make_set_instance_protection_answer : unit -> unit

val make_set_instance_health_query :
  ?should_respect_grace_period:should_respect_grace_period ->
  health_status:xml_string_max_len32 ->
  instance_id:xml_string_max_len19 ->
  unit ->
  set_instance_health_query

val make_set_desired_capacity_type :
  ?honor_cooldown:honor_cooldown ->
  desired_capacity:auto_scaling_group_desired_capacity ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  set_desired_capacity_type

val make_scheduled_update_group_action :
  ?time_zone:xml_string_max_len255 ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?max_size:auto_scaling_group_max_size ->
  ?min_size:auto_scaling_group_min_size ->
  ?recurrence:xml_string_max_len255 ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?time:timestamp_type ->
  ?scheduled_action_ar_n:resource_name ->
  ?scheduled_action_name:xml_string_max_len255 ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  scheduled_update_group_action

val make_scheduled_update_group_action_request :
  ?time_zone:xml_string_max_len255 ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?max_size:auto_scaling_group_max_size ->
  ?min_size:auto_scaling_group_min_size ->
  ?recurrence:xml_string_max_len255 ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  scheduled_update_group_action_request

val make_scheduled_actions_type :
  ?next_token:xml_string ->
  ?scheduled_update_group_actions:scheduled_update_group_actions ->
  unit ->
  scheduled_actions_type

val make_alarm : ?alarm_ar_n:resource_name -> ?alarm_name:xml_string_max_len255 -> unit -> alarm

val make_predictive_scaling_predefined_metric_pair :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_metric_pair_type ->
  unit ->
  predictive_scaling_predefined_metric_pair

val make_predictive_scaling_predefined_scaling_metric :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_scaling_metric

val make_predictive_scaling_predefined_load_metric :
  ?resource_label:xml_string_max_len1023 ->
  predefined_metric_type:predefined_load_metric_type ->
  unit ->
  predictive_scaling_predefined_load_metric

val make_metric_stat :
  ?unit_:metric_unit -> stat:xml_string_metric_stat -> metric:metric -> unit -> metric_stat

val make_metric_data_query :
  ?return_data:return_data ->
  ?label:xml_string_metric_label ->
  ?metric_stat:metric_stat ->
  ?expression:xml_string_max_len1023 ->
  id:xml_string_max_len255 ->
  unit ->
  metric_data_query

val make_predictive_scaling_customized_scaling_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_scaling_metric

val make_predictive_scaling_customized_load_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_load_metric

val make_predictive_scaling_customized_capacity_metric :
  metric_data_queries:metric_data_queries -> unit -> predictive_scaling_customized_capacity_metric

val make_predictive_scaling_metric_specification :
  ?customized_capacity_metric_specification:predictive_scaling_customized_capacity_metric ->
  ?customized_load_metric_specification:predictive_scaling_customized_load_metric ->
  ?customized_scaling_metric_specification:predictive_scaling_customized_scaling_metric ->
  ?predefined_load_metric_specification:predictive_scaling_predefined_load_metric ->
  ?predefined_scaling_metric_specification:predictive_scaling_predefined_scaling_metric ->
  ?predefined_metric_pair_specification:predictive_scaling_predefined_metric_pair ->
  target_value:metric_scale ->
  unit ->
  predictive_scaling_metric_specification

val make_predictive_scaling_configuration :
  ?max_capacity_buffer:predictive_scaling_max_capacity_buffer ->
  ?max_capacity_breach_behavior:predictive_scaling_max_capacity_breach_behavior ->
  ?scheduling_buffer_time:predictive_scaling_scheduling_buffer_time ->
  ?mode:predictive_scaling_mode ->
  metric_specifications:predictive_scaling_metric_specifications ->
  unit ->
  predictive_scaling_configuration

val make_scaling_policy :
  ?predictive_scaling_configuration:predictive_scaling_configuration ->
  ?enabled:scaling_policy_enabled ->
  ?target_tracking_configuration:target_tracking_configuration ->
  ?alarms:alarms ->
  ?estimated_instance_warmup:estimated_instance_warmup ->
  ?metric_aggregation_type:xml_string_max_len32 ->
  ?step_adjustments:step_adjustments ->
  ?cooldown:cooldown ->
  ?scaling_adjustment:policy_increment ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?min_adjustment_step:min_adjustment_step ->
  ?adjustment_type:xml_string_max_len255 ->
  ?policy_type:xml_string_max_len64 ->
  ?policy_ar_n:resource_name ->
  ?policy_name:xml_string_max_len255 ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  scaling_policy

val make_rollback_instance_refresh_type :
  auto_scaling_group_name:xml_string_max_len255 -> unit -> rollback_instance_refresh_type

val make_rollback_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> rollback_instance_refresh_answer

val make_instance_refresh_live_pool_progress :
  ?instances_to_update:instances_to_update ->
  ?percentage_complete:int_percent ->
  unit ->
  instance_refresh_live_pool_progress

val make_instance_refresh_warm_pool_progress :
  ?instances_to_update:instances_to_update ->
  ?percentage_complete:int_percent ->
  unit ->
  instance_refresh_warm_pool_progress

val make_instance_refresh_progress_details :
  ?warm_pool_progress:instance_refresh_warm_pool_progress ->
  ?live_pool_progress:instance_refresh_live_pool_progress ->
  unit ->
  instance_refresh_progress_details

val make_rollback_details :
  ?progress_details_on_rollback:instance_refresh_progress_details ->
  ?instances_to_update_on_rollback:instances_to_update ->
  ?percentage_complete_on_rollback:int_percent ->
  ?rollback_start_time:timestamp_type ->
  ?rollback_reason:xml_string_max_len1023 ->
  unit ->
  rollback_details

val make_record_lifecycle_action_heartbeat_type :
  ?instance_id:xml_string_max_len19 ->
  ?lifecycle_action_token:lifecycle_action_token ->
  auto_scaling_group_name:resource_name ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  record_lifecycle_action_heartbeat_type

val make_record_lifecycle_action_heartbeat_answer : unit -> unit

val make_put_warm_pool_type :
  ?instance_reuse_policy:instance_reuse_policy ->
  ?pool_state:warm_pool_state ->
  ?min_size:warm_pool_min_size ->
  ?max_group_prepared_capacity:max_group_prepared_capacity ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_warm_pool_type

val make_put_warm_pool_answer : unit -> unit

val make_put_scheduled_update_group_action_type :
  ?time_zone:xml_string_max_len255 ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?max_size:auto_scaling_group_max_size ->
  ?min_size:auto_scaling_group_min_size ->
  ?recurrence:xml_string_max_len255 ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?time:timestamp_type ->
  scheduled_action_name:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_scheduled_update_group_action_type

val make_put_scaling_policy_type :
  ?predictive_scaling_configuration:predictive_scaling_configuration ->
  ?enabled:scaling_policy_enabled ->
  ?target_tracking_configuration:target_tracking_configuration ->
  ?estimated_instance_warmup:estimated_instance_warmup ->
  ?step_adjustments:step_adjustments ->
  ?metric_aggregation_type:xml_string_max_len32 ->
  ?cooldown:cooldown ->
  ?scaling_adjustment:policy_increment ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?min_adjustment_step:min_adjustment_step ->
  ?adjustment_type:xml_string_max_len255 ->
  ?policy_type:xml_string_max_len64 ->
  policy_name:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_scaling_policy_type

val make_policy_arn_type : ?alarms:alarms -> ?policy_ar_n:resource_name -> unit -> policy_arn_type

val make_put_notification_configuration_type :
  notification_types:auto_scaling_notification_types ->
  topic_ar_n:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  put_notification_configuration_type

val make_put_lifecycle_hook_type :
  ?default_result:lifecycle_action_result ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?role_ar_n:xml_string_max_len255 ->
  ?lifecycle_transition:lifecycle_transition ->
  auto_scaling_group_name:xml_string_max_len255 ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  put_lifecycle_hook_type

val make_put_lifecycle_hook_answer : unit -> unit
val make_process_type : process_name:xml_string_max_len255 -> unit -> process_type
val make_processes_type : ?processes:processes -> unit -> processes_type

val make_policies_type :
  ?next_token:xml_string -> ?scaling_policies:scaling_policies -> unit -> policies_type

val make_notification_configuration :
  ?notification_type:xml_string_max_len255 ->
  ?topic_ar_n:xml_string_max_len255 ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  notification_configuration

val make_metric_granularity_type :
  ?granularity:xml_string_max_len255 -> unit -> metric_granularity_type

val make_metric_collection_type : ?metric:xml_string_max_len255 -> unit -> metric_collection_type

val make_load_forecast :
  metric_specification:predictive_scaling_metric_specification ->
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  load_forecast

val make_load_balancer_target_group_state :
  ?state:xml_string_max_len255 ->
  ?load_balancer_target_group_ar_n:xml_string_max_len511 ->
  unit ->
  load_balancer_target_group_state

val make_load_balancer_state :
  ?state:xml_string_max_len255 ->
  ?load_balancer_name:xml_string_max_len255 ->
  unit ->
  load_balancer_state

val make_lifecycle_hook :
  ?default_result:lifecycle_action_result ->
  ?global_timeout:global_timeout ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  ?role_ar_n:xml_string_max_len255 ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?lifecycle_transition:lifecycle_transition ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  lifecycle_hook

val make_lifecycle_hook_specification :
  ?role_ar_n:xml_string_max_len255 ->
  ?notification_target_ar_n:notification_target_resource_name ->
  ?default_result:lifecycle_action_result ->
  ?heartbeat_timeout:heartbeat_timeout ->
  ?notification_metadata:any_printable_ascii_string_max_len4000 ->
  lifecycle_transition:lifecycle_transition ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  lifecycle_hook_specification

val make_instance_collection :
  ?instance_ids:instance_ids ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?availability_zone:xml_string_max_len255 ->
  ?subnet_id:xml_string_max_len255 ->
  ?market_type:xml_string_max_len64 ->
  ?instance_type:xml_string_max_len255 ->
  unit ->
  instance_collection

val make_launch_instances_error :
  ?error_message:xml_string ->
  ?error_code:xml_string_max_len64 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?availability_zone:xml_string_max_len255 ->
  ?subnet_id:xml_string_max_len255 ->
  ?market_type:xml_string_max_len64 ->
  ?instance_type:xml_string_max_len255 ->
  unit ->
  launch_instances_error

val make_launch_instances_request :
  ?retry_strategy:retry_strategy ->
  ?subnet_ids:subnet_ids_limit1 ->
  ?availability_zone_ids:availability_zone_ids_limit1 ->
  ?availability_zones:availability_zones_limit1 ->
  client_token:client_token ->
  requested_capacity:requested_capacity ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  launch_instances_request

val make_ebs :
  ?throughput:block_device_ebs_throughput ->
  ?encrypted:block_device_ebs_encrypted ->
  ?iops:block_device_ebs_iops ->
  ?delete_on_termination:block_device_ebs_delete_on_termination ->
  ?volume_type:block_device_ebs_volume_type ->
  ?volume_size:block_device_ebs_volume_size ->
  ?snapshot_id:xml_string_max_len255 ->
  unit ->
  ebs

val make_block_device_mapping :
  ?no_device:no_device ->
  ?ebs:ebs ->
  ?virtual_name:xml_string_max_len255 ->
  device_name:xml_string_max_len255 ->
  unit ->
  block_device_mapping

val make_instance_monitoring : ?enabled:monitoring_enabled -> unit -> instance_monitoring

val make_instance_metadata_options :
  ?http_endpoint:instance_metadata_endpoint_state ->
  ?http_put_response_hop_limit:instance_metadata_http_put_response_hop_limit ->
  ?http_tokens:instance_metadata_http_tokens_state ->
  unit ->
  instance_metadata_options

val make_launch_configuration :
  ?metadata_options:instance_metadata_options ->
  ?placement_tenancy:xml_string_max_len64 ->
  ?associate_public_ip_address:associate_public_ip_address ->
  ?ebs_optimized:ebs_optimized ->
  ?iam_instance_profile:xml_string_max_len1600 ->
  ?spot_price:spot_price ->
  ?instance_monitoring:instance_monitoring ->
  ?block_device_mappings:block_device_mappings ->
  ?ramdisk_id:xml_string_max_len255 ->
  ?kernel_id:xml_string_max_len255 ->
  ?user_data:xml_string_user_data ->
  ?classic_link_vpc_security_groups:classic_link_vpc_security_groups ->
  ?classic_link_vpc_id:xml_string_max_len255 ->
  ?security_groups:security_groups ->
  ?key_name:xml_string_max_len255 ->
  ?launch_configuration_ar_n:resource_name ->
  created_time:timestamp_type ->
  instance_type:xml_string_max_len255 ->
  image_id:xml_string_max_len255 ->
  launch_configuration_name:xml_string_max_len255 ->
  unit ->
  launch_configuration

val make_launch_configurations_type :
  ?next_token:xml_string ->
  launch_configurations:launch_configurations ->
  unit ->
  launch_configurations_type

val make_launch_configuration_names_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?launch_configuration_names:launch_configuration_names ->
  unit ->
  launch_configuration_names_type

val make_launch_configuration_name_type :
  launch_configuration_name:xml_string_max_len255 -> unit -> launch_configuration_name_type

val make_instance :
  ?weighted_capacity:xml_string_max_len32 ->
  ?image_id:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?instance_type:xml_string_max_len255 ->
  protected_from_scale_in:instance_protected ->
  health_status:xml_string_max_len32 ->
  lifecycle_state:lifecycle_state ->
  availability_zone:xml_string_max_len255 ->
  instance_id:xml_string_max_len19 ->
  unit ->
  instance

val make_instance_refresh :
  ?strategy:refresh_strategy ->
  ?rollback_details:rollback_details ->
  ?desired_configuration:desired_configuration ->
  ?preferences:refresh_preferences ->
  ?progress_details:instance_refresh_progress_details ->
  ?instances_to_update:instances_to_update ->
  ?percentage_complete:int_percent ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?status_reason:xml_string_max_len1023 ->
  ?status:instance_refresh_status ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?instance_refresh_id:xml_string_max_len255 ->
  unit ->
  instance_refresh

val make_get_predictive_scaling_forecast_type :
  end_time:timestamp_type ->
  start_time:timestamp_type ->
  policy_name:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  get_predictive_scaling_forecast_type

val make_capacity_forecast :
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  capacity_forecast

val make_get_predictive_scaling_forecast_answer :
  update_time:timestamp_type ->
  capacity_forecast:capacity_forecast ->
  load_forecast:load_forecasts ->
  unit ->
  get_predictive_scaling_forecast_answer

val make_filter : ?values:values -> ?name:xml_string -> unit -> filter

val make_failed_scheduled_update_group_action_request :
  ?error_message:xml_string ->
  ?error_code:xml_string_max_len64 ->
  scheduled_action_name:xml_string_max_len255 ->
  unit ->
  failed_scheduled_update_group_action_request

val make_exit_standby_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  exit_standby_query

val make_exit_standby_answer : ?activities:activities -> unit -> exit_standby_answer

val make_execute_policy_type :
  ?breach_threshold:metric_scale ->
  ?metric_value:metric_scale ->
  ?honor_cooldown:honor_cooldown ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  policy_name:resource_name ->
  unit ->
  execute_policy_type

val make_enter_standby_query :
  ?instance_ids:instance_ids ->
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  enter_standby_query

val make_enter_standby_answer : ?activities:activities -> unit -> enter_standby_answer

val make_enabled_metric :
  ?granularity:xml_string_max_len255 -> ?metric:xml_string_max_len255 -> unit -> enabled_metric

val make_enable_metrics_collection_query :
  ?metrics:metrics ->
  granularity:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  enable_metrics_collection_query

val make_disable_metrics_collection_query :
  ?metrics:metrics ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  disable_metrics_collection_query

val make_detach_traffic_sources_type :
  traffic_sources:traffic_sources ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  detach_traffic_sources_type

val make_detach_traffic_sources_result_type : unit -> unit

val make_detach_load_balancers_type :
  load_balancer_names:load_balancer_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  detach_load_balancers_type

val make_detach_load_balancers_result_type : unit -> unit

val make_detach_load_balancer_target_groups_type :
  target_group_ar_ns:target_group_ar_ns ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  detach_load_balancer_target_groups_type

val make_detach_load_balancer_target_groups_result_type : unit -> unit

val make_detach_instances_query :
  ?instance_ids:instance_ids ->
  should_decrement_desired_capacity:should_decrement_desired_capacity ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  detach_instances_query

val make_detach_instances_answer : ?activities:activities -> unit -> detach_instances_answer

val make_describe_warm_pool_type :
  ?next_token:xml_string ->
  ?max_records:max_records ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_warm_pool_type

val make_describe_warm_pool_answer :
  ?next_token:xml_string ->
  ?instances:instances ->
  ?warm_pool_configuration:warm_pool_configuration ->
  unit ->
  describe_warm_pool_answer

val make_describe_traffic_sources_response :
  ?next_token:xml_string ->
  ?traffic_sources:traffic_source_states ->
  unit ->
  describe_traffic_sources_response

val make_describe_traffic_sources_request :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?traffic_source_type:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_traffic_sources_request

val make_describe_termination_policy_types_answer :
  ?termination_policy_types:termination_policies -> unit -> describe_termination_policy_types_answer

val make_describe_tags_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?filters:filters ->
  unit ->
  describe_tags_type

val make_describe_scheduled_actions_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?scheduled_action_names:scheduled_action_names ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_scheduled_actions_type

val make_describe_scaling_activities_type :
  ?filters:filters ->
  ?next_token:xml_string ->
  ?max_records:max_records ->
  ?include_deleted_groups:include_deleted_groups ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  ?activity_ids:activity_ids ->
  unit ->
  describe_scaling_activities_type

val make_activities_type :
  ?next_token:xml_string -> activities:activities -> unit -> activities_type

val make_describe_policies_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?policy_types:policy_types ->
  ?policy_names:policy_names ->
  ?auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_policies_type

val make_describe_notification_configurations_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?auto_scaling_group_names:auto_scaling_group_names ->
  unit ->
  describe_notification_configurations_type

val make_describe_notification_configurations_answer :
  ?next_token:xml_string ->
  notification_configurations:notification_configurations ->
  unit ->
  describe_notification_configurations_answer

val make_describe_metric_collection_types_answer :
  ?granularities:metric_granularity_types ->
  ?metrics:metric_collection_types ->
  unit ->
  describe_metric_collection_types_answer

val make_describe_load_balancers_response :
  ?next_token:xml_string ->
  ?load_balancers:load_balancer_states ->
  unit ->
  describe_load_balancers_response

val make_describe_load_balancers_request :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_load_balancers_request

val make_describe_load_balancer_target_groups_response :
  ?next_token:xml_string ->
  ?load_balancer_target_groups:load_balancer_target_group_states ->
  unit ->
  describe_load_balancer_target_groups_response

val make_describe_load_balancer_target_groups_request :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_load_balancer_target_groups_request

val make_describe_lifecycle_hooks_type :
  ?lifecycle_hook_names:lifecycle_hook_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_lifecycle_hooks_type

val make_describe_lifecycle_hooks_answer :
  ?lifecycle_hooks:lifecycle_hooks -> unit -> describe_lifecycle_hooks_answer

val make_describe_lifecycle_hook_types_answer :
  ?lifecycle_hook_types:auto_scaling_notification_types ->
  unit ->
  describe_lifecycle_hook_types_answer

val make_describe_instance_refreshes_type :
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?instance_refresh_ids:instance_refresh_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  describe_instance_refreshes_type

val make_describe_instance_refreshes_answer :
  ?next_token:xml_string ->
  ?instance_refreshes:instance_refreshes ->
  unit ->
  describe_instance_refreshes_answer

val make_describe_auto_scaling_notification_types_answer :
  ?auto_scaling_notification_types:auto_scaling_notification_types ->
  unit ->
  describe_auto_scaling_notification_types_answer

val make_describe_auto_scaling_instances_type :
  ?next_token:xml_string ->
  ?max_records:max_records ->
  ?instance_ids:instance_ids ->
  unit ->
  describe_auto_scaling_instances_type

val make_auto_scaling_instance_details :
  ?weighted_capacity:xml_string_max_len32 ->
  ?image_id:xml_string_max_len255 ->
  ?launch_template:launch_template_specification ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?availability_zone_id:xml_string_max_len255 ->
  ?instance_type:xml_string_max_len255 ->
  protected_from_scale_in:instance_protected ->
  health_status:xml_string_max_len32 ->
  lifecycle_state:xml_string_max_len32 ->
  availability_zone:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  instance_id:xml_string_max_len19 ->
  unit ->
  auto_scaling_instance_details

val make_auto_scaling_instances_type :
  ?next_token:xml_string ->
  ?auto_scaling_instances:auto_scaling_instances ->
  unit ->
  auto_scaling_instances_type

val make_auto_scaling_group :
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?deletion_protection:deletion_protection ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?traffic_sources:traffic_sources ->
  ?default_instance_warmup:default_instance_warmup ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?context:context ->
  ?warm_pool_size:warm_pool_size ->
  ?warm_pool_configuration:warm_pool_configuration ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?service_linked_role_ar_n:resource_name ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?termination_policies:termination_policies ->
  ?tags:tag_description_list ->
  ?status:xml_string_max_len255 ->
  ?enabled_metrics:enabled_metrics ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?placement_group:xml_string_max_len255 ->
  ?suspended_processes:suspended_processes ->
  ?instances:instances ->
  ?health_check_grace_period:health_check_grace_period ->
  ?target_group_ar_ns:target_group_ar_ns ->
  ?load_balancer_names:load_balancer_names ->
  ?availability_zone_ids:availability_zone_ids ->
  ?predicted_capacity:auto_scaling_group_predicted_capacity ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?launch_template:launch_template_specification ->
  ?launch_configuration_name:xml_string_max_len255 ->
  ?auto_scaling_group_ar_n:resource_name ->
  created_time:timestamp_type ->
  health_check_type:xml_string_max_len32 ->
  availability_zones:availability_zones ->
  default_cooldown:cooldown ->
  desired_capacity:auto_scaling_group_desired_capacity ->
  max_size:auto_scaling_group_max_size ->
  min_size:auto_scaling_group_min_size ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  auto_scaling_group

val make_auto_scaling_groups_type :
  ?next_token:xml_string ->
  auto_scaling_groups:auto_scaling_groups ->
  unit ->
  auto_scaling_groups_type

val make_auto_scaling_group_names_type :
  ?filters:filters ->
  ?max_records:max_records ->
  ?next_token:xml_string ->
  ?include_instances:include_instances ->
  ?auto_scaling_group_names:auto_scaling_group_names ->
  unit ->
  auto_scaling_group_names_type

val make_adjustment_type : ?adjustment_type:xml_string_max_len255 -> unit -> adjustment_type

val make_describe_adjustment_types_answer :
  ?adjustment_types:adjustment_types -> unit -> describe_adjustment_types_answer

val make_describe_account_limits_answer :
  ?number_of_launch_configurations:number_of_launch_configurations ->
  ?number_of_auto_scaling_groups:number_of_auto_scaling_groups ->
  ?max_number_of_launch_configurations:max_number_of_launch_configurations ->
  ?max_number_of_auto_scaling_groups:max_number_of_auto_scaling_groups ->
  unit ->
  describe_account_limits_answer

val make_delete_warm_pool_type :
  ?force_delete:force_delete ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_warm_pool_type

val make_delete_warm_pool_answer : unit -> unit
val make_delete_tags_type : tags:tags -> unit -> delete_tags_type

val make_delete_scheduled_action_type :
  scheduled_action_name:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_scheduled_action_type

val make_delete_policy_type :
  ?auto_scaling_group_name:xml_string_max_len255 ->
  policy_name:resource_name ->
  unit ->
  delete_policy_type

val make_delete_notification_configuration_type :
  topic_ar_n:xml_string_max_len255 ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_notification_configuration_type

val make_delete_lifecycle_hook_type :
  auto_scaling_group_name:xml_string_max_len255 ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  delete_lifecycle_hook_type

val make_delete_lifecycle_hook_answer : unit -> unit

val make_delete_auto_scaling_group_type :
  ?force_delete:force_delete ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  delete_auto_scaling_group_type

val make_create_or_update_tags_type : tags:tags -> unit -> create_or_update_tags_type

val make_create_launch_configuration_type :
  ?metadata_options:instance_metadata_options ->
  ?placement_tenancy:xml_string_max_len64 ->
  ?associate_public_ip_address:associate_public_ip_address ->
  ?ebs_optimized:ebs_optimized ->
  ?iam_instance_profile:xml_string_max_len1600 ->
  ?spot_price:spot_price ->
  ?instance_monitoring:instance_monitoring ->
  ?block_device_mappings:block_device_mappings ->
  ?ramdisk_id:xml_string_max_len255 ->
  ?kernel_id:xml_string_max_len255 ->
  ?instance_type:xml_string_max_len255 ->
  ?instance_id:xml_string_max_len19 ->
  ?user_data:xml_string_user_data ->
  ?classic_link_vpc_security_groups:classic_link_vpc_security_groups ->
  ?classic_link_vpc_id:xml_string_max_len255 ->
  ?security_groups:security_groups ->
  ?key_name:xml_string_max_len255 ->
  ?image_id:xml_string_max_len255 ->
  launch_configuration_name:xml_string_max_len255 ->
  unit ->
  create_launch_configuration_type

val make_create_auto_scaling_group_type :
  ?instance_lifecycle_policy:instance_lifecycle_policy ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  ?availability_zone_impairment_policy:availability_zone_impairment_policy ->
  ?availability_zone_distribution:availability_zone_distribution ->
  ?instance_maintenance_policy:instance_maintenance_policy ->
  ?traffic_sources:traffic_sources ->
  ?default_instance_warmup:default_instance_warmup ->
  ?desired_capacity_type:xml_string_max_len255 ->
  ?context:context ->
  ?max_instance_lifetime:max_instance_lifetime ->
  ?service_linked_role_ar_n:resource_name ->
  ?tags:tags ->
  ?deletion_protection:deletion_protection ->
  ?lifecycle_hook_specification_list:lifecycle_hook_specifications ->
  ?capacity_rebalance:capacity_rebalance_enabled ->
  ?new_instances_protected_from_scale_in:instance_protected ->
  ?termination_policies:termination_policies ->
  ?vpc_zone_identifier:xml_string_max_len5000 ->
  ?placement_group:xml_string_max_len255 ->
  ?health_check_grace_period:health_check_grace_period ->
  ?health_check_type:xml_string_max_len32 ->
  ?target_group_ar_ns:target_group_ar_ns ->
  ?load_balancer_names:load_balancer_names ->
  ?availability_zone_ids:availability_zone_ids ->
  ?availability_zones:availability_zones ->
  ?default_cooldown:cooldown ->
  ?desired_capacity:auto_scaling_group_desired_capacity ->
  ?instance_id:xml_string_max_len19 ->
  ?mixed_instances_policy:mixed_instances_policy ->
  ?launch_template:launch_template_specification ->
  ?launch_configuration_name:xml_string_max_len255 ->
  max_size:auto_scaling_group_max_size ->
  min_size:auto_scaling_group_min_size ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  create_auto_scaling_group_type

val make_complete_lifecycle_action_type :
  ?instance_id:xml_string_max_len19 ->
  ?lifecycle_action_token:lifecycle_action_token ->
  lifecycle_action_result:lifecycle_action_result ->
  auto_scaling_group_name:resource_name ->
  lifecycle_hook_name:ascii_string_max_len255 ->
  unit ->
  complete_lifecycle_action_type

val make_complete_lifecycle_action_answer : unit -> unit

val make_cancel_instance_refresh_type :
  ?wait_for_transitioning_instances:boolean_type ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  cancel_instance_refresh_type

val make_cancel_instance_refresh_answer :
  ?instance_refresh_id:xml_string_max_len255 -> unit -> cancel_instance_refresh_answer

val make_batch_put_scheduled_update_group_action_type :
  scheduled_update_group_actions:scheduled_update_group_action_requests ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  batch_put_scheduled_update_group_action_type

val make_batch_put_scheduled_update_group_action_answer :
  ?failed_scheduled_update_group_actions:failed_scheduled_update_group_action_requests ->
  unit ->
  batch_put_scheduled_update_group_action_answer

val make_batch_delete_scheduled_action_type :
  scheduled_action_names:scheduled_action_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  batch_delete_scheduled_action_type

val make_batch_delete_scheduled_action_answer :
  ?failed_scheduled_actions:failed_scheduled_update_group_action_requests ->
  unit ->
  batch_delete_scheduled_action_answer

val make_attach_traffic_sources_result_type : unit -> unit

val make_attach_traffic_sources_type :
  ?skip_zonal_shift_validation:skip_zonal_shift_validation ->
  traffic_sources:traffic_sources ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  attach_traffic_sources_type

val make_attach_load_balancer_target_groups_result_type : unit -> unit

val make_attach_load_balancer_target_groups_type :
  target_group_ar_ns:target_group_ar_ns ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  attach_load_balancer_target_groups_type

val make_attach_load_balancers_result_type : unit -> unit

val make_attach_load_balancers_type :
  load_balancer_names:load_balancer_names ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  attach_load_balancers_type

val make_attach_instances_query :
  ?instance_ids:instance_ids ->
  auto_scaling_group_name:xml_string_max_len255 ->
  unit ->
  attach_instances_query
