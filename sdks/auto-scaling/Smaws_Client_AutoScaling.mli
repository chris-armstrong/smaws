(** Auto Scaling client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AttachInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_instances_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_instances_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches one or more EC2 instances to the specified Auto Scaling group.\n\n\
  \ When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group \
   by the number of instances being attached. If the number of instances being attached plus the \
   desired capacity of the group exceeds the maximum size of the group, the operation fails.\n\
  \ \n\
  \  If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are \
   also registered with the load balancer. If there are target groups attached to your Auto \
   Scaling group, the instances are also registered with the target groups.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-detach-attach-instances.html}Detach \
   or attach instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module AttachLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancers_type ->
    ( attach_load_balancers_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancers_type ->
    ( attach_load_balancers_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}, \
   which can attach multiple traffic sources types. We recommend using [AttachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support [AttachLoadBalancers]. \
   You can use both the original [AttachLoadBalancers] API operation and [AttachTrafficSources] on \
   the same Auto Scaling group.\n\
  \ \n\
  \   Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 \
   Auto Scaling registers the running instances with these Classic Load Balancers.\n\
  \   \n\
  \    To describe the load balancers for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
   API. To detach a load balancer from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancers.html}DetachLoadBalancers} \
   API.\n\
  \    \n\
  \     This operation is additive and does not detach existing Classic Load Balancers or target \
   groups from the Auto Scaling group.\n\
  \     \n\
  \      For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \      "]

module AttachLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_target_groups_type ->
    ( attach_load_balancer_target_groups_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_target_groups_type ->
    ( attach_load_balancer_target_groups_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}, \
   which can attach multiple traffic sources types. We recommend using [AttachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [AttachLoadBalancerTargetGroups]. You can use both the original \
   [AttachLoadBalancerTargetGroups] API operation and [AttachTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Attaches one or more target groups to the specified Auto Scaling group.\n\
  \   \n\
  \    This operation is used with the following load balancer types: \n\
  \    \n\
  \     {ul\n\
  \           {-  Application Load Balancer - Operates at the application layer (layer 7) and \
   supports HTTP and HTTPS. \n\
  \               \n\
  \                }\n\
  \           {-  Network Load Balancer - Operates at the transport layer (layer 4) and supports \
   TCP, TLS, and UDP. \n\
  \               \n\
  \                }\n\
  \           {-  Gateway Load Balancer - Operates at the network layer (layer 3).\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To describe the target groups for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API. To detach the target group from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancerTargetGroups.html}DetachLoadBalancerTargetGroups} \
   API.\n\
  \   \n\
  \    This operation is additive and does not detach existing target groups or Classic Load \
   Balancers from the Auto Scaling group.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \     "]

module AttachTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_traffic_sources_type ->
    ( attach_traffic_sources_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_traffic_sources_type ->
    ( attach_traffic_sources_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches one or more traffic sources to the specified Auto Scaling group.\n\n\
  \ You can use any of the following as traffic sources for an Auto Scaling group:\n\
  \ \n\
  \  {ul\n\
  \        {-  Application Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Classic Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Gateway Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Network Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  VPC Lattice\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is additive and does not detach existing traffic sources from the Auto \
   Scaling group. \n\
  \   \n\
  \    After the operation completes, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources} \
   API to return details about the state of the attachments between traffic sources and your Auto \
   Scaling group. To detach a traffic source from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources} \
   API.\n\
  \    "]

module BatchDeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_scheduled_action_type ->
    ( batch_delete_scheduled_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_scheduled_action_type ->
    ( batch_delete_scheduled_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more scheduled actions for the specified Auto Scaling group.\n"]

module BatchPutScheduledUpdateGroupAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_put_scheduled_update_group_action_type ->
    ( batch_put_scheduled_update_group_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_put_scheduled_update_group_action_type ->
    ( batch_put_scheduled_update_group_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates one or more scheduled scaling actions for an Auto Scaling group.\n"]

module CancelInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_instance_refresh_type ->
    ( cancel_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_instance_refresh_type ->
    ( cancel_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback \
   is not in progress, an [ActiveInstanceRefreshNotFound] error occurs.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  When you cancel an instance refresh, this does not roll back any changes that it made. Use \
   the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RollbackInstanceRefresh.html}RollbackInstanceRefresh} \
   API to roll back instead.\n\
  \  "]

module CompleteLifecycleAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_lifecycle_action_type ->
    ( complete_lifecycle_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_lifecycle_action_type ->
    ( complete_lifecycle_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Completes the lifecycle action for the specified token or instance with the specified result.\n\n\
  \ This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \ \n\
  \  {ol\n\
  \        {-  (Optional) Create a launch template or launch configuration with a user data script \
   that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \            \n\
  \             }\n\
  \        {-  Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.\n\
  \            \n\
  \             }\n\
  \        {-  If you need more time, record the lifecycle action heartbeat to keep the instance \
   in a wait state.\n\
  \            \n\
  \             }\n\
  \        {-   {b If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/completing-lifecycle-hooks.html}Complete \
   a lifecycle action} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module CreateAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b We strongly recommend using a launch template when calling this operation to ensure full \
   functionality for Amazon EC2 Auto Scaling and Amazon EC2.} \n\n\
  \ Creates an Auto Scaling group with the specified name and attributes. \n\
  \ \n\
  \  If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, \
   call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html}DescribeAccountLimits} \
   API. For information about updating this limit, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \   If you're new to Amazon EC2 Auto Scaling, see the introductory tutorials in \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/get-started-with-ec2-auto-scaling.html}Get \
   started with Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   \n\
  \    Every Auto Scaling group has three size properties ([DesiredCapacity], [MaxSize], and \
   [MinSize]). Usually, you set these sizes based on a specific number of instances. However, if \
   you configure a mixed instances policy that defines weights for the instance types, you must \
   specify these sizes with the same units that you use for weighting instances.\n\
  \    "]

module CreateLaunchConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_launch_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_launch_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a launch configuration.\n\n\
  \ If you exceed your maximum limit of launch configurations, the call fails. To query this \
   limit, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html}DescribeAccountLimits} \
   API. For information about updating this limit, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-configurations.html}Launch \
   configurations} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \    Amazon EC2 Auto Scaling configures instances launched as part of an Auto Scaling group \
   using either a launch template or a launch configuration. We strongly recommend that you do not \
   use launch configurations. They do not provide full functionality for Amazon EC2 Auto Scaling \
   or Amazon EC2. For information about using launch templates, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html}Launch \
   templates} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \    \n\
  \     "]

module CreateOrUpdateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_or_update_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_or_update_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates tags for the specified Auto Scaling group.\n\n\
  \ When you specify a tag with a key that already exists, the operation overwrites the previous \
   tag definition, and you do not get an error message.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag Auto \
   Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module DeleteAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Auto Scaling group.\n\n\
  \ If the group has instances or scaling activities in progress, you must specify the option to \
   force the deletion in order for it to succeed. The force delete operation will also terminate \
   the EC2 instances. If the group has a warm pool, the force delete option also deletes the warm \
   pool.\n\
  \ \n\
  \  To remove instances from the Auto Scaling group before deleting it, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachInstances.html}DetachInstances} \
   API with the list of instances and the option to decrement the desired capacity. This ensures \
   that Amazon EC2 Auto Scaling does not launch replacement instances.\n\
  \  \n\
  \   To terminate all instances before deleting the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_UpdateAutoScalingGroup.html}UpdateAutoScalingGroup} \
   API and set the minimum size and desired capacity of the Auto Scaling group to zero.\n\
  \   \n\
  \    If the group has scaling policies, deleting the group deletes the policies, the underlying \
   alarm actions, and any alarm that no longer has an associated action.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-process-shutdown.html}Delete your \
   Auto Scaling infrastructure} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \     "]

module DeleteLaunchConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_name_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_name_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified launch configuration.\n\n\
  \ The launch configuration must not be attached to an Auto Scaling group. When this call \
   completes, the launch configuration is no longer available for use.\n\
  \ "]

module DeleteLifecycleHook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_hook_type ->
    ( delete_lifecycle_hook_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_hook_type ->
    ( delete_lifecycle_hook_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified lifecycle hook.\n\n\
  \ If there are any outstanding lifecycle actions, they are completed first ([ABANDON] for \
   launching instances, [CONTINUE] for terminating instances).\n\
  \ "]

module DeleteNotificationConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified notification.\n"]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified scaling policy.\n\n\
  \ Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm \
   action, but does not delete the alarm, even if it no longer has an associated action.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html}Delete a \
   scaling policy} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified scheduled action.\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags.\n"]

module DeleteWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_warm_pool_type ->
    ( delete_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_warm_pool_type ->
    ( delete_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the warm pool for the specified Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeAccountLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_limits_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_limits_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current Amazon EC2 Auto Scaling resource quotas for your account.\n\n\
  \ When you establish an Amazon Web Services account, the account has initial quotas on the \
   maximum number of Auto Scaling groups and launch configurations that you can create in a given \
   Region. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeAdjustmentTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_adjustment_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_adjustment_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the available adjustment types for step scaling and simple scaling policies.\n\n\
  \ The following adjustment types are supported:\n\
  \ \n\
  \  {ul\n\
  \        {-   [ChangeInCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [ExactCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [PercentChangeInCapacity] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeAutoScalingGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    auto_scaling_group_names_type ->
    ( auto_scaling_groups_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    auto_scaling_group_names_type ->
    ( auto_scaling_groups_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the Auto Scaling groups in the account and Region.\n\n\
  \ If you specify Auto Scaling group names, the output includes information for only the \
   specified Auto Scaling groups. If you specify filters, the output includes information for only \
   those Auto Scaling groups that meet the filter criteria. If you do not specify group names or \
   filters, the output includes information for all Auto Scaling groups. \n\
  \ \n\
  \  This operation also returns information about instances in Auto Scaling groups. To retrieve \
   information about the instances in a warm pool, you must call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeWarmPool.html}DescribeWarmPool} \
   API. \n\
  \  "]

module DescribeAutoScalingInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_scaling_instances_type ->
    ( auto_scaling_instances_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_scaling_instances_type ->
    ( auto_scaling_instances_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the Auto Scaling instances in the account and Region.\n"]

module DescribeAutoScalingNotificationTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_auto_scaling_notification_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_auto_scaling_notification_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the notification types that are supported by Amazon EC2 Auto Scaling.\n"]

module DescribeInstanceRefreshes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_refreshes_type ->
    ( describe_instance_refreshes_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_refreshes_type ->
    ( describe_instance_refreshes_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the instance refreshes for the specified Auto Scaling group from the \
   previous six weeks.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  To help you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns \
   information about the instance refreshes you previously initiated, including their status, \
   start time, end time, the percentage of the instance refresh that is complete, and the number \
   of instances remaining to update before the instance refresh is complete. If a rollback is \
   initiated while an instance refresh is in progress, Amazon EC2 Auto Scaling also returns \
   information about the rollback of the instance refresh.\n\
  \  "]

module DescribeLaunchConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_names_type ->
    ( launch_configurations_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_names_type ->
    ( launch_configurations_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the launch configurations in the account and Region.\n"]

module DescribeLifecycleHookTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_lifecycle_hook_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_lifecycle_hook_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the available types of lifecycle hooks.\n\n\
  \ The following hook types are supported:\n\
  \ \n\
  \  {ul\n\
  \        {-   [autoscaling:EC2_INSTANCE_LAUNCHING] \n\
  \            \n\
  \             }\n\
  \        {-   [autoscaling:EC2_INSTANCE_TERMINATING] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeLifecycleHooks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lifecycle_hooks_type ->
    ( describe_lifecycle_hooks_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lifecycle_hooks_type ->
    ( describe_lifecycle_hooks_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the lifecycle hooks for the specified Auto Scaling group.\n"]

module DescribeLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_target_groups_request ->
    ( describe_load_balancer_target_groups_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_target_groups_request ->
    ( describe_load_balancer_target_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources}, \
   which can describe multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [DescribeLoadBalancerTargetGroups]. You can use both the original \
   [DescribeLoadBalancerTargetGroups] API operation and [DescribeTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Gets information about the Elastic Load Balancing target groups for the specified Auto \
   Scaling group.\n\
  \   \n\
  \    To determine the attachment status of the target group, use the [State] element in the \
   response. When you attach a target group to an Auto Scaling group, the initial [State] value is \
   [Adding]. The state transitions to [Added] after all Auto Scaling instances are registered with \
   the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling \
   group, the state transitions to [InService] after at least one Auto Scaling instance passes the \
   health check. When the target group is in the [InService] state, Amazon EC2 Auto Scaling can \
   terminate and replace any instances that are reported as unhealthy. If no registered instances \
   pass the health checks, the target group doesn't enter the [InService] state. \n\
  \    \n\
  \     Target groups also have an [InService] state if you attach them in the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html}CreateAutoScalingGroup} \
   API call. If your target group state is [InService], but it is not working properly, check the \
   scaling activities by calling \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   and take any corrective actions necessary.\n\
  \     \n\
  \      For help with failed health checks, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html}Troubleshooting \
   Amazon EC2 Auto Scaling: Health checks} in the {i Amazon EC2 Auto Scaling User Guide}. For more \
   information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \      \n\
  \        You can use this operation to describe target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachLoadBalancerTargetGroups.html}AttachLoadBalancerTargetGroups}, \
   but not for target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}.\n\
  \        \n\
  \         "]

module DescribeLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_request ->
    ( describe_load_balancers_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_request ->
    ( describe_load_balancers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources}, \
   which can describe multiple traffic sources types. We recommend using [DescribeTrafficSources] \
   to simplify how you manage traffic sources. However, we continue to support \
   [DescribeLoadBalancers]. You can use both the original [DescribeLoadBalancers] API operation \
   and [DescribeTrafficSources] on the same Auto Scaling group.\n\
  \ \n\
  \   Gets information about the load balancers for the specified Auto Scaling group.\n\
  \   \n\
  \    This operation describes only Classic Load Balancers. If you have Application Load \
   Balancers, Network Load Balancers, or Gateway Load Balancers, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API instead.\n\
  \    \n\
  \     To determine the attachment status of the load balancer, use the [State] element in the \
   response. When you attach a load balancer to an Auto Scaling group, the initial [State] value \
   is [Adding]. The state transitions to [Added] after all Auto Scaling instances are registered \
   with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto \
   Scaling group, the state transitions to [InService] after at least one Auto Scaling instance \
   passes the health check. When the load balancer is in the [InService] state, Amazon EC2 Auto \
   Scaling can terminate and replace any instances that are reported as unhealthy. If no \
   registered instances pass the health checks, the load balancer doesn't enter the [InService] \
   state. \n\
  \     \n\
  \      Load balancers also have an [InService] state if you attach them in the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html}CreateAutoScalingGroup} \
   API call. If your load balancer state is [InService], but it is not working properly, check the \
   scaling activities by calling \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   and take any corrective actions necessary.\n\
  \      \n\
  \       For help with failed health checks, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html}Troubleshooting \
   Amazon EC2 Auto Scaling: Health checks} in the {i Amazon EC2 Auto Scaling User Guide}. For more \
   information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \       "]

module DescribeMetricCollectionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_metric_collection_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_metric_collection_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.\n"]

module DescribeNotificationConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notification_configurations_type ->
    ( describe_notification_configurations_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notification_configurations_type ->
    ( describe_notification_configurations_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the Amazon SNS notifications that are configured for one or more Auto \
   Scaling groups.\n"]

module DescribePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_policies_type ->
    ( policies_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_policies_type ->
    ( policies_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the scaling policies in the account and Region.\n"]

module DescribeScalingActivities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_type ->
    ( activities_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_type ->
    ( activities_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the scaling activities in the account and Region.\n\n\
  \ When scaling events occur, you see a record of the scaling activity in the scaling activities. \
   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html}Verify \
   a scaling activity for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  If the scaling event succeeds, the value of the [StatusCode] element in the response is \
   [Successful]. If an attempt to launch instances failed, the [StatusCode] value is [Failed] or \
   [Cancelled] and the [StatusMessage] element in the response indicates the cause of the failure. \
   For help interpreting the [StatusMessage], see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html}Troubleshooting \
   Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \  "]

module DescribeScalingProcessTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( processes_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( processes_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the scaling process types for use with the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_ResumeProcesses.html}ResumeProcesses} \
   and \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_SuspendProcesses.html}SuspendProcesses} \
   APIs.\n"]

module DescribeScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_type ->
    ( scheduled_actions_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_type ->
    ( scheduled_actions_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the scheduled actions that haven't run or that have not reached their \
   end time.\n\n\
  \ To describe the scaling activities for scheduled actions that have already run, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   API.\n\
  \ "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_type ->
    ( tags_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_type ->
    ( tags_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified tags.\n\n\
  \ You can use filters to limit the results. For example, you can query for the tags for a \
   specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at \
   least one of the specified values for it to be included in the results.\n\
  \ \n\
  \  You can also specify multiple filters. The result includes information for a particular tag \
   only if it matches all the filters. If there's no match, no special message is returned.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag Auto \
   Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module DescribeTerminationPolicyTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_termination_policy_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_termination_policy_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the termination policies supported by Amazon EC2 Auto Scaling.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html}Configure \
   termination policies for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_traffic_sources_request ->
    ( describe_traffic_sources_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_traffic_sources_request ->
    ( describe_traffic_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the traffic sources for the specified Auto Scaling group.\n\n\
  \ You can optionally provide a traffic source type. If you provide a traffic source type, then \
   the results only include that traffic source type.\n\
  \ \n\
  \  If you do not provide a traffic source type, then the results include all the traffic sources \
   for the specified Auto Scaling group. \n\
  \  "]

module DescribeWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_warm_pool_type ->
    ( describe_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_warm_pool_type ->
    ( describe_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a warm pool and its instances.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DetachInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_instances_query ->
    ( detach_instances_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_instances_query ->
    ( detach_instances_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more instances from the specified Auto Scaling group.\n\n\
  \ After the instances are detached, you can manage them independent of the Auto Scaling group.\n\
  \ \n\
  \  If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling \
   launches instances to replace the ones that are detached.\n\
  \  \n\
  \   If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are \
   deregistered from the load balancer. If there are target groups attached to the Auto Scaling \
   group, the instances are deregistered from the target groups.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-detach-attach-instances.html}Detach \
   or attach instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \    "]

module DetachLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_target_groups_type ->
    ( detach_load_balancer_target_groups_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_target_groups_type ->
    ( detach_load_balancer_target_groups_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources}, \
   which can detach multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [DetachLoadBalancerTargetGroups]. You can use both the original \
   [DetachLoadBalancerTargetGroups] API operation and [DetachTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Detaches one or more target groups from the specified Auto Scaling group.\n\
  \   \n\
  \    When you detach a target group, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the target group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API call. The instances remain running.\n\
  \    \n\
  \      You can use this operation to detach target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachLoadBalancerTargetGroups.html}AttachLoadBalancerTargetGroups}, \
   but not for target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}.\n\
  \      \n\
  \       "]

module DetachLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancers_type ->
    ( detach_load_balancers_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancers_type ->
    ( detach_load_balancers_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources}, \
   which can detach multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support [DetachLoadBalancers]. \
   You can use both the original [DetachLoadBalancers] API operation and [DetachTrafficSources] on \
   the same Auto Scaling group.\n\
  \ \n\
  \   Detaches one or more Classic Load Balancers from the specified Auto Scaling group.\n\
  \   \n\
  \    This operation detaches only Classic Load Balancers. If you have Application Load \
   Balancers, Network Load Balancers, or Gateway Load Balancers, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancerTargetGroups.html}DetachLoadBalancerTargetGroups} \
   API instead.\n\
  \    \n\
  \     When you detach a load balancer, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the load balancer using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
   API call. The instances remain running.\n\
  \     "]

module DetachTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_traffic_sources_type ->
    ( detach_traffic_sources_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_traffic_sources_type ->
    ( detach_traffic_sources_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches one or more traffic sources from the specified Auto Scaling group.\n\n\
  \ When you detach a traffic source, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the traffic source using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources} \
   API call. The instances continue to run.\n\
  \ "]

module DisableMetricsCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables group metrics collection for the specified Auto Scaling group.\n"]

module EnableMetricsCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables group metrics collection for the specified Auto Scaling group.\n\n\
  \ You can use these metrics to track changes in an Auto Scaling group and to set alarms on \
   threshold values. You can view group metrics using the Amazon EC2 Auto Scaling console or the \
   CloudWatch console. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html}Monitor \
   CloudWatch metrics for your Auto Scaling groups and instances} in the {i Amazon EC2 Auto \
   Scaling User Guide}.\n\
  \ "]

module EnterStandby : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enter_standby_query ->
    ( enter_standby_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enter_standby_query ->
    ( enter_standby_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves the specified instances into the standby state.\n\n\
  \ If you choose to decrement the desired capacity of the Auto Scaling group, the instances can \
   enter standby as long as the desired capacity of the Auto Scaling group after the instances are \
   placed into standby is equal to or greater than the minimum capacity of the group.\n\
  \ \n\
  \  If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto \
   Scaling group launches new instances to replace the instances on standby.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html}Temporarily \
   removing instances from your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module ExecutePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Executes the specified policy. This can be useful for testing the design of your scaling policy.\n"]

module ExitStandby : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    exit_standby_query ->
    ( exit_standby_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    exit_standby_query ->
    ( exit_standby_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves the specified instances out of the standby state.\n\n\
  \ After you put the instances back in service, the desired capacity is incremented.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html}Temporarily \
   removing instances from your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module GetPredictiveScalingForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_type ->
    ( get_predictive_scaling_forecast_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_type ->
    ( get_predictive_scaling_forecast_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the forecast data for a predictive scaling policy.\n\n\
  \ Load forecasts are predictions of the hourly load values using historical load data from \
   CloudWatch and an analysis of historical trends. Capacity forecasts are represented as \
   predicted values for the minimum capacity that is needed on an hourly basis, based on the \
   hourly load forecast.\n\
  \ \n\
  \  A minimum of 24 hours of data is required to create the initial forecasts. However, having a \
   full 14 days of historical data results in more accurate forecasts.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html}Predictive \
   scaling for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module LaunchInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_instances_request ->
    ( launch_instances_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_instances_request ->
    ( launch_instances_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Launches a specified number of instances in an Auto Scaling group. Returns instance IDs and \
   other details if launch is successful or error details if launch is unsuccessful. \n"]

module PutLifecycleHook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_hook_type ->
    ( put_lifecycle_hook_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_hook_type ->
    ( put_lifecycle_hook_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a lifecycle hook for the specified Auto Scaling group.\n\n\
  \ Lifecycle hooks let you create solutions that are aware of events in the Auto Scaling instance \
   lifecycle, and then perform a custom action on instances when the corresponding lifecycle event \
   occurs.\n\
  \ \n\
  \  This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \  \n\
  \   {ol\n\
  \         {-  (Optional) Create a launch template or launch configuration with a user data \
   script that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \             \n\
  \              }\n\
  \         {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \             \n\
  \              }\n\
  \         {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \             \n\
  \              }\n\
  \         {-   {b Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.} \n\
  \             \n\
  \              }\n\
  \         {-  If you need more time, record the lifecycle action heartbeat to keep the instance \
   in a wait state using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RecordLifecycleActionHeartbeat.html}RecordLifecycleActionHeartbeat} \
   API call.\n\
  \             \n\
  \              }\n\
  \         {-  If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html}Amazon EC2 Auto \
   Scaling lifecycle hooks} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   \n\
  \    If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto \
   Scaling group, the call fails.\n\
  \    \n\
  \     You can view the lifecycle hooks for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLifecycleHooks.html}DescribeLifecycleHooks} \
   API call. If you are no longer using a lifecycle hook, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteLifecycleHook.html}DeleteLifecycleHook} \
   API.\n\
  \     "]

module PutNotificationConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures an Auto Scaling group to send notifications when specified events take place. \
   Subscribers to the specified topic can have messages delivered to an endpoint such as a web \
   server or an email address.\n\n\
  \ This configuration overwrites any existing configuration.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-sns-notifications.html}Amazon \
   SNS notification options for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
   Guide}.\n\
  \  \n\
  \   If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call \
   fails.\n\
  \   "]

module PutScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_type ->
    ( policy_arn_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_type ->
    ( policy_arn_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to \
   scale an Auto Scaling group based on configurable metrics. If no policies are defined, the \
   dynamic scaling and predictive scaling features are not used. \n\n\
  \ For more information about using dynamic scaling, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html}Target \
   tracking scaling policies} and \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html}Step and \
   simple scaling policies} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  For more information about using predictive scaling, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html}Predictive \
   scaling for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \   You can view the scaling policies for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribePolicies.html}DescribePolicies} \
   API call. If you are no longer using a scaling policy, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeletePolicy.html}DeletePolicy} \
   API.\n\
  \   "]

module PutScheduledUpdateGroupAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_update_group_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_update_group_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scheduled scaling action for an Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html}Scheduled \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  You can view the scheduled actions for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScheduledActions.html}DescribeScheduledActions} \
   API call. If you are no longer using a scheduled action, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteScheduledAction.html}DeleteScheduledAction} \
   API.\n\
  \  \n\
  \   If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error \
   message.\n\
  \   "]

module PutWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_warm_pool_type ->
    ( put_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_warm_pool_type ->
    ( put_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of \
   pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your \
   application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its \
   new desired capacity.\n\n\
  \ This operation must be called from the Region in which the Auto Scaling group was created.\n\
  \ \n\
  \  You can view the instances in the warm pool using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeWarmPool.html}DescribeWarmPool} \
   API call. If you are no longer using a warm pool, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteWarmPool.html}DeleteWarmPool} \
   API.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module RecordLifecycleActionHeartbeat : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    record_lifecycle_action_heartbeat_type ->
    ( record_lifecycle_action_heartbeat_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    record_lifecycle_action_heartbeat_type ->
    ( record_lifecycle_action_heartbeat_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Records a heartbeat for the lifecycle action associated with the specified token or instance. \
   This extends the timeout by the length of time defined using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutLifecycleHook.html}PutLifecycleHook} \
   API call.\n\n\
  \ This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \ \n\
  \  {ol\n\
  \        {-  (Optional) Create a launch template or launch configuration with a user data script \
   that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \            \n\
  \             }\n\
  \        {-  Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.\n\
  \            \n\
  \             }\n\
  \        {-   {b If you need more time, record the lifecycle action heartbeat to keep the \
   instance in a wait state.} \n\
  \            \n\
  \             }\n\
  \        {-  If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html}Amazon EC2 Auto \
   Scaling lifecycle hooks} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module ResumeProcesses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resumes the specified suspended auto scaling processes, or all suspended process, for the \
   specified Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html}Suspend \
   and resume Amazon EC2 Auto Scaling processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module RollbackInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
    | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_instance_refresh_type ->
    ( rollback_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_instance_refresh_type ->
    ( rollback_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon \
   EC2 Auto Scaling replaces any instances that were replaced during the instance refresh. This \
   restores your Auto Scaling group to the configuration that it was using before the start of the \
   instance refresh. \n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  A rollback is not supported in the following situations: \n\
  \  \n\
  \   {ul\n\
  \         {-  There is no desired configuration specified for the instance refresh.\n\
  \             \n\
  \              }\n\
  \         {-  The Auto Scaling group has a launch template that uses an Amazon Web Services \
   Systems Manager parameter instead of an AMI ID for the [ImageId] property.\n\
  \             \n\
  \              }\n\
  \         {-  The Auto Scaling group uses the launch template's [$Latest] or [$Default] version.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   When you receive a successful response from this operation, Amazon EC2 Auto Scaling \
   immediately begins replacing instances. You can check the status of this operation through the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API operation. \n\
  \   "]

module SetDesiredCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_desired_capacity_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_desired_capacity_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the size of the specified Auto Scaling group.\n\n\
  \ If a scale-in activity occurs as a result of a new [DesiredCapacity] value that is lower than \
   the current size of the group, the Auto Scaling group uses its termination policy to determine \
   which instances to terminate. \n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-manually.html}Manual \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module SetInstanceHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_instance_health_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_instance_health_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the health status of the specified instance.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/set-up-a-custom-health-check.html}Set \
   up a custom health check for your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User \
   Guide}.\n\
  \ "]

module SetInstanceProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_instance_protection_query ->
    ( set_instance_protection_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_instance_protection_query ->
    ( set_instance_protection_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the instance protection settings of the specified instances. This operation cannot be \
   called on instances in a warm pool.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html}Use \
   instance scale-in protection} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the \
   call fails.\n\
  \  "]

module StartInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_instance_refresh_type ->
    ( start_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_instance_refresh_type ->
    ( start_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an instance refresh.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data \
   script. You just need to create a new launch template that specifies the new AMI or user data \
   script. Then start an instance refresh to immediately begin the process of updating instances \
   in the group. \n\
  \ \n\
  \  If successful, the request's response contains a unique ID that you can use to track the \
   progress of the instance refresh. To query its status, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API. To describe the instance refreshes that have already run, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API. To cancel an instance refresh that is in progress, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CancelInstanceRefresh.html}CancelInstanceRefresh} \
   API. \n\
  \  \n\
  \   An instance refresh might fail for several reasons, such as EC2 launch failures, \
   misconfigured health checks, or not ignoring or allowing the termination of instances that are \
   in [Standby] state or protected from scale in. You can monitor for failed EC2 launches using \
   the scaling activities. To find the scaling activities, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   API.\n\
  \   \n\
  \    If you enable auto rollback, your Auto Scaling group will be rolled back automatically when \
   the instance refresh fails. You can enable this feature before starting an instance refresh by \
   specifying the [AutoRollback] property in the instance refresh preferences. Otherwise, to roll \
   back an instance refresh before it finishes, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RollbackInstanceRefresh.html}RollbackInstanceRefresh} \
   API. \n\
  \    "]

module SuspendProcesses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling \
   group.\n\n\
  \ If you suspend either the [Launch] or [Terminate] process types, it can prevent other process \
   types from functioning properly. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html}Suspend \
   and resume Amazon EC2 Auto Scaling processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  To resume processes that have been suspended, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_ResumeProcesses.html}ResumeProcesses} \
   API.\n\
  \  "]

module TerminateInstanceInAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_instance_in_auto_scaling_group_type ->
    ( activity_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_instance_in_auto_scaling_group_type ->
    ( activity_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the specified instance and optionally adjusts the desired group size. This operation \
   cannot be called on instances in a warm pool.\n\n\
  \ This call simply makes a termination request. The instance is not terminated immediately. When \
   an instance is terminated, the instance status changes to [terminated]. You can't connect to or \
   start an instance after you've terminated it.\n\
  \ \n\
  \  If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling \
   launches instances to replace the ones that are terminated. \n\
  \  \n\
  \   By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you \
   decrement the desired capacity, your Auto Scaling group can become unbalanced between \
   Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might \
   terminate instances in other zones. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-manually.html}Manual \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b We strongly recommend that all Auto Scaling groups use launch templates to ensure full \
   functionality for Amazon EC2 Auto Scaling and Amazon EC2.} \n\n\
  \ Updates the configuration for the specified Auto Scaling group.\n\
  \ \n\
  \  To update an Auto Scaling group, specify the name of the group and the property that you want \
   to change. Any properties that you don't specify are not changed by this update request. The \
   new settings take effect on any scaling activities after this call returns. \n\
  \  \n\
  \   If you associate a new launch configuration or template with an Auto Scaling group, all new \
   instances will get the updated configuration. Existing instances continue to run with the \
   configuration that they were originally launched with. When you update a group to specify a \
   mixed instances policy instead of a launch configuration or template, existing instances may be \
   replaced to match the new purchasing options that you specified in the policy. For example, if \
   the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, \
   this means that half of your instances will be gradually terminated and relaunched as Spot \
   Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before \
   terminating the old ones, so that updating your group does not compromise the performance or \
   availability of your application.\n\
  \   \n\
  \    Note the following about changing [DesiredCapacity], [MaxSize], or [MinSize]:\n\
  \    \n\
  \     {ul\n\
  \           {-  If a scale-in activity occurs as a result of a new [DesiredCapacity] value that \
   is lower than the current size of the group, the Auto Scaling group uses its termination policy \
   to determine which instances to terminate.\n\
  \               \n\
  \                }\n\
  \           {-  If you specify a new value for [MinSize] without specifying a value for \
   [DesiredCapacity], and the new [MinSize] is larger than the current size of the group, this \
   sets the group's [DesiredCapacity] to the new [MinSize] value.\n\
  \               \n\
  \                }\n\
  \           {-  If you specify a new value for [MaxSize] without specifying a value for \
   [DesiredCapacity], and the new [MaxSize] is smaller than the current size of the group, this \
   sets the group's [DesiredCapacity] to the new [MaxSize] value.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To see which properties have been set, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAutoScalingGroups.html}DescribeAutoScalingGroups} \
   API. To view the scaling policies for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribePolicies.html}DescribePolicies} \
   API. If the group has scaling policies, you can update them by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutScalingPolicy.html}PutScalingPolicy} \
   API.\n\
  \   "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
