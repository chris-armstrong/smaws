open Types

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_predefined_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:metric_type ->
  unit ->
  predefined_metric_specification

val make_metric_dimension :
  value:metric_dimension_value -> name:metric_dimension_name -> unit -> metric_dimension

val make_target_tracking_metric_dimension :
  value:target_tracking_metric_dimension_value ->
  name:target_tracking_metric_dimension_name ->
  unit ->
  target_tracking_metric_dimension

val make_target_tracking_metric :
  ?namespace:target_tracking_metric_namespace ->
  ?metric_name:target_tracking_metric_name ->
  ?dimensions:target_tracking_metric_dimensions ->
  unit ->
  target_tracking_metric

val make_target_tracking_metric_stat :
  ?unit_:target_tracking_metric_unit ->
  stat:xml_string ->
  metric:target_tracking_metric ->
  unit ->
  target_tracking_metric_stat

val make_target_tracking_metric_data_query :
  ?return_data:return_data ->
  ?metric_stat:target_tracking_metric_stat ->
  ?label:xml_string ->
  ?expression:expression ->
  id:id ->
  unit ->
  target_tracking_metric_data_query

val make_customized_metric_specification :
  ?metrics:target_tracking_metric_data_queries ->
  ?unit_:metric_unit ->
  ?statistic:metric_statistic ->
  ?dimensions:metric_dimensions ->
  ?namespace:metric_namespace ->
  ?metric_name:metric_name ->
  unit ->
  customized_metric_specification

val make_target_tracking_scaling_policy_configuration :
  ?disable_scale_in:disable_scale_in ->
  ?scale_in_cooldown:cooldown ->
  ?scale_out_cooldown:cooldown ->
  ?customized_metric_specification:customized_metric_specification ->
  ?predefined_metric_specification:predefined_metric_specification ->
  target_value:metric_scale ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_suspended_state :
  ?scheduled_scaling_suspended:scaling_suspended ->
  ?dynamic_scaling_out_suspended:scaling_suspended ->
  ?dynamic_scaling_in_suspended:scaling_suspended ->
  unit ->
  suspended_state

val make_step_adjustment :
  ?metric_interval_upper_bound:metric_scale ->
  ?metric_interval_lower_bound:metric_scale ->
  scaling_adjustment:scaling_adjustment ->
  unit ->
  step_adjustment

val make_step_scaling_policy_configuration :
  ?metric_aggregation_type:metric_aggregation_type ->
  ?cooldown:cooldown ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?step_adjustments:step_adjustments ->
  ?adjustment_type:adjustment_type ->
  unit ->
  step_scaling_policy_configuration

val make_scalable_target_action :
  ?max_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  unit ->
  scalable_target_action

val make_scheduled_action :
  ?scalable_target_action:scalable_target_action ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?scalable_dimension:scalable_dimension ->
  ?timezone:resource_id_max_len1600 ->
  creation_time:timestamp_type ->
  resource_id:resource_id_max_len1600 ->
  schedule:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  scheduled_action_ar_n:resource_id_max_len1600 ->
  scheduled_action_name:scheduled_action_name ->
  unit ->
  scheduled_action

val make_predictive_scaling_predefined_metric_pair_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_metric_pair_specification

val make_predictive_scaling_predefined_scaling_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_scaling_metric_specification

val make_predictive_scaling_predefined_load_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_load_metric_specification

val make_predictive_scaling_metric_dimension :
  value:predictive_scaling_metric_dimension_value ->
  name:predictive_scaling_metric_dimension_name ->
  unit ->
  predictive_scaling_metric_dimension

val make_predictive_scaling_metric :
  ?namespace:predictive_scaling_metric_namespace ->
  ?metric_name:predictive_scaling_metric_name ->
  ?dimensions:predictive_scaling_metric_dimensions ->
  unit ->
  predictive_scaling_metric

val make_predictive_scaling_metric_stat :
  ?unit_:predictive_scaling_metric_unit ->
  stat:xml_string ->
  metric:predictive_scaling_metric ->
  unit ->
  predictive_scaling_metric_stat

val make_predictive_scaling_metric_data_query :
  ?return_data:return_data ->
  ?label:xml_string ->
  ?metric_stat:predictive_scaling_metric_stat ->
  ?expression:expression ->
  id:id ->
  unit ->
  predictive_scaling_metric_data_query

val make_predictive_scaling_customized_metric_specification :
  metric_data_queries:predictive_scaling_metric_data_queries ->
  unit ->
  predictive_scaling_customized_metric_specification

val make_predictive_scaling_metric_specification :
  ?customized_capacity_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_load_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_scaling_metric_specification:predictive_scaling_customized_metric_specification ->
  ?predefined_load_metric_specification:predictive_scaling_predefined_load_metric_specification ->
  ?predefined_scaling_metric_specification:
    predictive_scaling_predefined_scaling_metric_specification ->
  ?predefined_metric_pair_specification:predictive_scaling_predefined_metric_pair_specification ->
  target_value:metric_scale ->
  unit ->
  predictive_scaling_metric_specification

val make_predictive_scaling_policy_configuration :
  ?max_capacity_buffer:predictive_scaling_max_capacity_buffer ->
  ?max_capacity_breach_behavior:predictive_scaling_max_capacity_breach_behavior ->
  ?scheduling_buffer_time:predictive_scaling_scheduling_buffer_time ->
  ?mode:predictive_scaling_mode ->
  metric_specifications:predictive_scaling_metric_specifications ->
  unit ->
  predictive_scaling_policy_configuration

val make_alarm : alarm_ar_n:resource_id -> alarm_name:resource_id -> unit -> alarm

val make_scaling_policy :
  ?alarms:alarms ->
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  creation_time:timestamp_type ->
  policy_type:policy_type ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:policy_name ->
  policy_ar_n:resource_id_max_len1600 ->
  unit ->
  scaling_policy

val make_not_scaled_reason :
  ?current_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  ?max_capacity:resource_capacity ->
  code:xml_string ->
  unit ->
  not_scaled_reason

val make_scaling_activity :
  ?not_scaled_reasons:not_scaled_reasons ->
  ?details:xml_string ->
  ?status_message:xml_string ->
  ?end_time:timestamp_type ->
  status_code:scaling_activity_status_code ->
  start_time:timestamp_type ->
  cause:xml_string ->
  description:xml_string ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  activity_id:resource_id ->
  unit ->
  scaling_activity

val make_scalable_target :
  ?scalable_target_ar_n:xml_string ->
  ?suspended_state:suspended_state ->
  ?predicted_capacity:resource_capacity ->
  creation_time:timestamp_type ->
  role_ar_n:resource_id_max_len1600 ->
  max_capacity:resource_capacity ->
  min_capacity:resource_capacity ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  scalable_target

val make_register_scalable_target_response :
  ?scalable_target_ar_n:xml_string -> unit -> register_scalable_target_response

val make_register_scalable_target_request :
  ?tags:tag_map ->
  ?suspended_state:suspended_state ->
  ?role_ar_n:resource_id_max_len1600 ->
  ?max_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  register_scalable_target_request

val make_put_scheduled_action_response : unit -> unit

val make_put_scheduled_action_request :
  ?scalable_target_action:scalable_target_action ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?timezone:resource_id_max_len1600 ->
  ?schedule:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  scheduled_action_name:scheduled_action_name ->
  service_namespace:service_namespace ->
  unit ->
  put_scheduled_action_request

val make_put_scaling_policy_response :
  ?alarms:alarms -> policy_ar_n:resource_id_max_len1600 -> unit -> put_scaling_policy_response

val make_put_scaling_policy_request :
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  ?policy_type:policy_type ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:policy_name ->
  unit ->
  put_scaling_policy_request

val make_load_forecast :
  metric_specification:predictive_scaling_metric_specification ->
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  load_forecast

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_capacity_forecast :
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  capacity_forecast

val make_get_predictive_scaling_forecast_response :
  ?update_time:timestamp_type ->
  ?capacity_forecast:capacity_forecast ->
  ?load_forecast:load_forecasts ->
  unit ->
  get_predictive_scaling_forecast_response

val make_get_predictive_scaling_forecast_request :
  end_time:timestamp_type ->
  start_time:timestamp_type ->
  policy_name:policy_name ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  get_predictive_scaling_forecast_request

val make_describe_scheduled_actions_response :
  ?next_token:xml_string ->
  ?scheduled_actions:scheduled_actions ->
  unit ->
  describe_scheduled_actions_response

val make_describe_scheduled_actions_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  ?scheduled_action_names:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scheduled_actions_request

val make_describe_scaling_policies_response :
  ?next_token:xml_string ->
  ?scaling_policies:scaling_policies ->
  unit ->
  describe_scaling_policies_response

val make_describe_scaling_policies_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  ?policy_names:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_policies_request

val make_describe_scaling_activities_response :
  ?next_token:xml_string ->
  ?scaling_activities:scaling_activities ->
  unit ->
  describe_scaling_activities_response

val make_describe_scaling_activities_request :
  ?include_not_scaled_activities:include_not_scaled_activities ->
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_activities_request

val make_describe_scalable_targets_response :
  ?next_token:xml_string ->
  ?scalable_targets:scalable_targets ->
  unit ->
  describe_scalable_targets_response

val make_describe_scalable_targets_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_ids:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scalable_targets_request

val make_deregister_scalable_target_response : unit -> unit

val make_deregister_scalable_target_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  deregister_scalable_target_request

val make_delete_scheduled_action_response : unit -> unit

val make_delete_scheduled_action_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  scheduled_action_name:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  delete_scheduled_action_request

val make_delete_scaling_policy_response : unit -> unit

val make_delete_scaling_policy_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:resource_id_max_len1600 ->
  unit ->
  delete_scaling_policy_request
