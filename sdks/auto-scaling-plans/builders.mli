open Types

val make_update_scaling_plan_response : unit -> unit
val make_tag_filter : ?values:tag_values -> ?key:xml_string_max_len128 -> unit -> tag_filter

val make_application_source :
  ?tag_filters:tag_filters -> ?cloud_formation_stack_ar_n:xml_string -> unit -> application_source

val make_predefined_scaling_metric_specification :
  ?resource_label:resource_label ->
  predefined_scaling_metric_type:scaling_metric_type ->
  unit ->
  predefined_scaling_metric_specification

val make_metric_dimension :
  value:metric_dimension_value -> name:metric_dimension_name -> unit -> metric_dimension

val make_customized_scaling_metric_specification :
  ?unit_:metric_unit ->
  ?dimensions:metric_dimensions ->
  statistic:metric_statistic ->
  namespace:metric_namespace ->
  metric_name:metric_name ->
  unit ->
  customized_scaling_metric_specification

val make_target_tracking_configuration :
  ?estimated_instance_warmup:cooldown ->
  ?scale_in_cooldown:cooldown ->
  ?scale_out_cooldown:cooldown ->
  ?disable_scale_in:disable_scale_in ->
  ?customized_scaling_metric_specification:customized_scaling_metric_specification ->
  ?predefined_scaling_metric_specification:predefined_scaling_metric_specification ->
  target_value:metric_scale ->
  unit ->
  target_tracking_configuration

val make_predefined_load_metric_specification :
  ?resource_label:resource_label ->
  predefined_load_metric_type:load_metric_type ->
  unit ->
  predefined_load_metric_specification

val make_customized_load_metric_specification :
  ?unit_:metric_unit ->
  ?dimensions:metric_dimensions ->
  statistic:metric_statistic ->
  namespace:metric_namespace ->
  metric_name:metric_name ->
  unit ->
  customized_load_metric_specification

val make_scaling_instruction :
  ?disable_dynamic_scaling:disable_dynamic_scaling ->
  ?scaling_policy_update_behavior:scaling_policy_update_behavior ->
  ?predictive_scaling_mode:predictive_scaling_mode ->
  ?predictive_scaling_max_capacity_buffer:resource_capacity ->
  ?predictive_scaling_max_capacity_behavior:predictive_scaling_max_capacity_behavior ->
  ?scheduled_action_buffer_time:scheduled_action_buffer_time ->
  ?customized_load_metric_specification:customized_load_metric_specification ->
  ?predefined_load_metric_specification:predefined_load_metric_specification ->
  target_tracking_configurations:target_tracking_configurations ->
  max_capacity:resource_capacity ->
  min_capacity:resource_capacity ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  scaling_instruction

val make_update_scaling_plan_request :
  ?scaling_instructions:scaling_instructions ->
  ?application_source:application_source ->
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  update_scaling_plan_request

val make_scaling_policy :
  ?target_tracking_configuration:target_tracking_configuration ->
  policy_type:policy_type ->
  policy_name:policy_name ->
  unit ->
  scaling_policy

val make_scaling_plan :
  ?creation_time:timestamp_type ->
  ?status_start_time:timestamp_type ->
  ?status_message:xml_string ->
  status_code:scaling_plan_status_code ->
  scaling_instructions:scaling_instructions ->
  application_source:application_source ->
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  scaling_plan

val make_scaling_plan_resource :
  ?scaling_status_message:xml_string ->
  ?scaling_policies:scaling_policies ->
  scaling_status_code:scaling_status_code ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  scaling_plan_resource

val make_datapoint : ?value:metric_scale -> ?timestamp:timestamp_type -> unit -> datapoint

val make_get_scaling_plan_resource_forecast_data_response :
  datapoints:datapoints -> unit -> get_scaling_plan_resource_forecast_data_response

val make_get_scaling_plan_resource_forecast_data_request :
  end_time:timestamp_type ->
  start_time:timestamp_type ->
  forecast_data_type:forecast_data_type ->
  scalable_dimension:scalable_dimension ->
  resource_id:xml_string ->
  service_namespace:service_namespace ->
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  get_scaling_plan_resource_forecast_data_request

val make_describe_scaling_plans_response :
  ?next_token:next_token -> ?scaling_plans:scaling_plans -> unit -> describe_scaling_plans_response

val make_describe_scaling_plans_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?application_sources:application_sources ->
  ?scaling_plan_version:scaling_plan_version ->
  ?scaling_plan_names:scaling_plan_names ->
  unit ->
  describe_scaling_plans_request

val make_describe_scaling_plan_resources_response :
  ?next_token:next_token ->
  ?scaling_plan_resources:scaling_plan_resources ->
  unit ->
  describe_scaling_plan_resources_response

val make_describe_scaling_plan_resources_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  describe_scaling_plan_resources_request

val make_delete_scaling_plan_response : unit -> unit

val make_delete_scaling_plan_request :
  scaling_plan_version:scaling_plan_version ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  delete_scaling_plan_request

val make_create_scaling_plan_response :
  scaling_plan_version:scaling_plan_version -> unit -> create_scaling_plan_response

val make_create_scaling_plan_request :
  scaling_instructions:scaling_instructions ->
  application_source:application_source ->
  scaling_plan_name:scaling_plan_name ->
  unit ->
  create_scaling_plan_request
