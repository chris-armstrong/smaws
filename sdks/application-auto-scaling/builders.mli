open Types

val make_alarm : alarm_name:resource_id -> alarm_ar_n:resource_id -> unit -> alarm
val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_map -> unit -> tag_resource_request

val make_register_scalable_target_response :
  ?scalable_target_ar_n:xml_string -> unit -> register_scalable_target_response

val make_suspended_state :
  ?dynamic_scaling_in_suspended:scaling_suspended ->
  ?dynamic_scaling_out_suspended:scaling_suspended ->
  ?scheduled_scaling_suspended:scaling_suspended ->
  unit ->
  suspended_state

val make_register_scalable_target_request :
  ?min_capacity:resource_capacity ->
  ?max_capacity:resource_capacity ->
  ?role_ar_n:resource_id_max_len1600 ->
  ?suspended_state:suspended_state ->
  ?tags:tag_map ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  register_scalable_target_request

val make_put_scheduled_action_response : unit -> unit

val make_scalable_target_action :
  ?min_capacity:resource_capacity ->
  ?max_capacity:resource_capacity ->
  unit ->
  scalable_target_action

val make_put_scheduled_action_request :
  ?schedule:resource_id_max_len1600 ->
  ?timezone:resource_id_max_len1600 ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?scalable_target_action:scalable_target_action ->
  service_namespace:service_namespace ->
  scheduled_action_name:scheduled_action_name ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  put_scheduled_action_request

val make_put_scaling_policy_response :
  ?alarms:alarms -> policy_ar_n:resource_id_max_len1600 -> unit -> put_scaling_policy_response

val make_predictive_scaling_metric_dimension :
  name:predictive_scaling_metric_dimension_name ->
  value:predictive_scaling_metric_dimension_value ->
  unit ->
  predictive_scaling_metric_dimension

val make_predictive_scaling_metric :
  ?dimensions:predictive_scaling_metric_dimensions ->
  ?metric_name:predictive_scaling_metric_name ->
  ?namespace:predictive_scaling_metric_namespace ->
  unit ->
  predictive_scaling_metric

val make_predictive_scaling_metric_stat :
  ?unit_:predictive_scaling_metric_unit ->
  metric:predictive_scaling_metric ->
  stat:xml_string ->
  unit ->
  predictive_scaling_metric_stat

val make_predictive_scaling_metric_data_query :
  ?expression:expression ->
  ?metric_stat:predictive_scaling_metric_stat ->
  ?label:xml_string ->
  ?return_data:return_data ->
  id:id ->
  unit ->
  predictive_scaling_metric_data_query

val make_predictive_scaling_customized_metric_specification :
  metric_data_queries:predictive_scaling_metric_data_queries ->
  unit ->
  predictive_scaling_customized_metric_specification

val make_predictive_scaling_predefined_load_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_load_metric_specification

val make_predictive_scaling_predefined_scaling_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_scaling_metric_specification

val make_predictive_scaling_predefined_metric_pair_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_metric_pair_specification

val make_predictive_scaling_metric_specification :
  ?predefined_metric_pair_specification:predictive_scaling_predefined_metric_pair_specification ->
  ?predefined_scaling_metric_specification:
    predictive_scaling_predefined_scaling_metric_specification ->
  ?predefined_load_metric_specification:predictive_scaling_predefined_load_metric_specification ->
  ?customized_scaling_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_load_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_capacity_metric_specification:predictive_scaling_customized_metric_specification ->
  target_value:metric_scale ->
  unit ->
  predictive_scaling_metric_specification

val make_predictive_scaling_policy_configuration :
  ?mode:predictive_scaling_mode ->
  ?scheduling_buffer_time:predictive_scaling_scheduling_buffer_time ->
  ?max_capacity_breach_behavior:predictive_scaling_max_capacity_breach_behavior ->
  ?max_capacity_buffer:predictive_scaling_max_capacity_buffer ->
  metric_specifications:predictive_scaling_metric_specifications ->
  unit ->
  predictive_scaling_policy_configuration

val make_target_tracking_metric_dimension :
  name:target_tracking_metric_dimension_name ->
  value:target_tracking_metric_dimension_value ->
  unit ->
  target_tracking_metric_dimension

val make_target_tracking_metric :
  ?dimensions:target_tracking_metric_dimensions ->
  ?metric_name:target_tracking_metric_name ->
  ?namespace:target_tracking_metric_namespace ->
  unit ->
  target_tracking_metric

val make_target_tracking_metric_stat :
  ?unit_:target_tracking_metric_unit ->
  metric:target_tracking_metric ->
  stat:xml_string ->
  unit ->
  target_tracking_metric_stat

val make_target_tracking_metric_data_query :
  ?expression:expression ->
  ?label:xml_string ->
  ?metric_stat:target_tracking_metric_stat ->
  ?return_data:return_data ->
  id:id ->
  unit ->
  target_tracking_metric_data_query

val make_metric_dimension :
  name:metric_dimension_name -> value:metric_dimension_value -> unit -> metric_dimension

val make_customized_metric_specification :
  ?metric_name:metric_name ->
  ?namespace:metric_namespace ->
  ?dimensions:metric_dimensions ->
  ?statistic:metric_statistic ->
  ?unit_:metric_unit ->
  ?metrics:target_tracking_metric_data_queries ->
  unit ->
  customized_metric_specification

val make_predefined_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:metric_type ->
  unit ->
  predefined_metric_specification

val make_target_tracking_scaling_policy_configuration :
  ?predefined_metric_specification:predefined_metric_specification ->
  ?customized_metric_specification:customized_metric_specification ->
  ?scale_out_cooldown:cooldown ->
  ?scale_in_cooldown:cooldown ->
  ?disable_scale_in:disable_scale_in ->
  target_value:metric_scale ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_step_adjustment :
  ?metric_interval_lower_bound:metric_scale ->
  ?metric_interval_upper_bound:metric_scale ->
  scaling_adjustment:scaling_adjustment ->
  unit ->
  step_adjustment

val make_step_scaling_policy_configuration :
  ?adjustment_type:adjustment_type ->
  ?step_adjustments:step_adjustments ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?cooldown:cooldown ->
  ?metric_aggregation_type:metric_aggregation_type ->
  unit ->
  step_scaling_policy_configuration

val make_put_scaling_policy_request :
  ?policy_type:policy_type ->
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  policy_name:policy_name ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  put_scaling_policy_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

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

val make_get_predictive_scaling_forecast_response :
  ?load_forecast:load_forecasts ->
  ?capacity_forecast:capacity_forecast ->
  ?update_time:timestamp_type ->
  unit ->
  get_predictive_scaling_forecast_response

val make_get_predictive_scaling_forecast_request :
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  policy_name:policy_name ->
  start_time:timestamp_type ->
  end_time:timestamp_type ->
  unit ->
  get_predictive_scaling_forecast_request

val make_scheduled_action :
  ?timezone:resource_id_max_len1600 ->
  ?scalable_dimension:scalable_dimension ->
  ?start_time:timestamp_type ->
  ?end_time:timestamp_type ->
  ?scalable_target_action:scalable_target_action ->
  scheduled_action_name:scheduled_action_name ->
  scheduled_action_ar_n:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  schedule:resource_id_max_len1600 ->
  resource_id:resource_id_max_len1600 ->
  creation_time:timestamp_type ->
  unit ->
  scheduled_action

val make_describe_scheduled_actions_response :
  ?scheduled_actions:scheduled_actions ->
  ?next_token:xml_string ->
  unit ->
  describe_scheduled_actions_response

val make_describe_scheduled_actions_request :
  ?scheduled_action_names:resource_ids_max_len1600 ->
  ?resource_id:resource_id_max_len1600 ->
  ?scalable_dimension:scalable_dimension ->
  ?max_results:max_results ->
  ?next_token:xml_string ->
  service_namespace:service_namespace ->
  unit ->
  describe_scheduled_actions_request

val make_scaling_policy :
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  ?alarms:alarms ->
  policy_ar_n:resource_id_max_len1600 ->
  policy_name:policy_name ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  policy_type:policy_type ->
  creation_time:timestamp_type ->
  unit ->
  scaling_policy

val make_describe_scaling_policies_response :
  ?scaling_policies:scaling_policies ->
  ?next_token:xml_string ->
  unit ->
  describe_scaling_policies_response

val make_describe_scaling_policies_request :
  ?policy_names:resource_ids_max_len1600 ->
  ?resource_id:resource_id_max_len1600 ->
  ?scalable_dimension:scalable_dimension ->
  ?max_results:max_results ->
  ?next_token:xml_string ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_policies_request

val make_not_scaled_reason :
  ?max_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  ?current_capacity:resource_capacity ->
  code:xml_string ->
  unit ->
  not_scaled_reason

val make_scaling_activity :
  ?end_time:timestamp_type ->
  ?status_message:xml_string ->
  ?details:xml_string ->
  ?not_scaled_reasons:not_scaled_reasons ->
  activity_id:resource_id ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  description:xml_string ->
  cause:xml_string ->
  start_time:timestamp_type ->
  status_code:scaling_activity_status_code ->
  unit ->
  scaling_activity

val make_describe_scaling_activities_response :
  ?scaling_activities:scaling_activities ->
  ?next_token:xml_string ->
  unit ->
  describe_scaling_activities_response

val make_describe_scaling_activities_request :
  ?resource_id:resource_id_max_len1600 ->
  ?scalable_dimension:scalable_dimension ->
  ?max_results:max_results ->
  ?next_token:xml_string ->
  ?include_not_scaled_activities:include_not_scaled_activities ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_activities_request

val make_scalable_target :
  ?predicted_capacity:resource_capacity ->
  ?suspended_state:suspended_state ->
  ?scalable_target_ar_n:xml_string ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  min_capacity:resource_capacity ->
  max_capacity:resource_capacity ->
  role_ar_n:resource_id_max_len1600 ->
  creation_time:timestamp_type ->
  unit ->
  scalable_target

val make_describe_scalable_targets_response :
  ?scalable_targets:scalable_targets ->
  ?next_token:xml_string ->
  unit ->
  describe_scalable_targets_response

val make_describe_scalable_targets_request :
  ?resource_ids:resource_ids_max_len1600 ->
  ?scalable_dimension:scalable_dimension ->
  ?max_results:max_results ->
  ?next_token:xml_string ->
  service_namespace:service_namespace ->
  unit ->
  describe_scalable_targets_request

val make_deregister_scalable_target_response : unit -> unit

val make_deregister_scalable_target_request :
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  deregister_scalable_target_request

val make_delete_scheduled_action_response : unit -> unit

val make_delete_scheduled_action_request :
  service_namespace:service_namespace ->
  scheduled_action_name:resource_id_max_len1600 ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  delete_scheduled_action_request

val make_delete_scaling_policy_response : unit -> unit

val make_delete_scaling_policy_request :
  policy_name:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  unit ->
  delete_scaling_policy_request
