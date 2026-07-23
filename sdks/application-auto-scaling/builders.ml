open Types

let make_alarm ~alarm_name:(alarm_name_ : resource_id) ~alarm_ar_n:(alarm_ar_n_ : resource_id) () =
  ({ alarm_name = alarm_name_; alarm_ar_n = alarm_ar_n_ } : alarm)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_map) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_register_scalable_target_response
    ?scalable_target_ar_n:(scalable_target_ar_n_ : xml_string option) () =
  ({ scalable_target_ar_n = scalable_target_ar_n_ } : register_scalable_target_response)

let make_suspended_state
    ?dynamic_scaling_in_suspended:(dynamic_scaling_in_suspended_ : scaling_suspended option)
    ?dynamic_scaling_out_suspended:(dynamic_scaling_out_suspended_ : scaling_suspended option)
    ?scheduled_scaling_suspended:(scheduled_scaling_suspended_ : scaling_suspended option) () =
  ({
     dynamic_scaling_in_suspended = dynamic_scaling_in_suspended_;
     dynamic_scaling_out_suspended = dynamic_scaling_out_suspended_;
     scheduled_scaling_suspended = scheduled_scaling_suspended_;
   }
    : suspended_state)

let make_register_scalable_target_request ?min_capacity:(min_capacity_ : resource_capacity option)
    ?max_capacity:(max_capacity_ : resource_capacity option)
    ?role_ar_n:(role_ar_n_ : resource_id_max_len1600 option)
    ?suspended_state:(suspended_state_ : suspended_state option) ?tags:(tags_ : tag_map option)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     role_ar_n = role_ar_n_;
     suspended_state = suspended_state_;
     tags = tags_;
   }
    : register_scalable_target_request)

let make_put_scheduled_action_response () = (() : unit)

let make_scalable_target_action ?min_capacity:(min_capacity_ : resource_capacity option)
    ?max_capacity:(max_capacity_ : resource_capacity option) () =
  ({ min_capacity = min_capacity_; max_capacity = max_capacity_ } : scalable_target_action)

let make_put_scheduled_action_request ?schedule:(schedule_ : resource_id_max_len1600 option)
    ?timezone:(timezone_ : resource_id_max_len1600 option)
    ?start_time:(start_time_ : timestamp_type option) ?end_time:(end_time_ : timestamp_type option)
    ?scalable_target_action:(scalable_target_action_ : scalable_target_action option)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     service_namespace = service_namespace_;
     schedule = schedule_;
     timezone = timezone_;
     scheduled_action_name = scheduled_action_name_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     start_time = start_time_;
     end_time = end_time_;
     scalable_target_action = scalable_target_action_;
   }
    : put_scheduled_action_request)

let make_put_scaling_policy_response ?alarms:(alarms_ : alarms option)
    ~policy_ar_n:(policy_ar_n_ : resource_id_max_len1600) () =
  ({ policy_ar_n = policy_ar_n_; alarms = alarms_ } : put_scaling_policy_response)

let make_predictive_scaling_metric_dimension
    ~name:(name_ : predictive_scaling_metric_dimension_name)
    ~value:(value_ : predictive_scaling_metric_dimension_value) () =
  ({ name = name_; value = value_ } : predictive_scaling_metric_dimension)

let make_predictive_scaling_metric
    ?dimensions:(dimensions_ : predictive_scaling_metric_dimensions option)
    ?metric_name:(metric_name_ : predictive_scaling_metric_name option)
    ?namespace:(namespace_ : predictive_scaling_metric_namespace option) () =
  ({ dimensions = dimensions_; metric_name = metric_name_; namespace = namespace_ }
    : predictive_scaling_metric)

let make_predictive_scaling_metric_stat ?unit_:(unit__ : predictive_scaling_metric_unit option)
    ~metric:(metric_ : predictive_scaling_metric) ~stat:(stat_ : xml_string) () =
  ({ metric = metric_; stat = stat_; unit_ = unit__ } : predictive_scaling_metric_stat)

let make_predictive_scaling_metric_data_query ?expression:(expression_ : expression option)
    ?metric_stat:(metric_stat_ : predictive_scaling_metric_stat option)
    ?label:(label_ : xml_string option) ?return_data:(return_data_ : return_data option)
    ~id:(id_ : id) () =
  ({
     id = id_;
     expression = expression_;
     metric_stat = metric_stat_;
     label = label_;
     return_data = return_data_;
   }
    : predictive_scaling_metric_data_query)

let make_predictive_scaling_customized_metric_specification
    ~metric_data_queries:(metric_data_queries_ : predictive_scaling_metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ }
    : predictive_scaling_customized_metric_specification)

let make_predictive_scaling_predefined_load_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_load_metric_specification)

let make_predictive_scaling_predefined_scaling_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_scaling_metric_specification)

let make_predictive_scaling_predefined_metric_pair_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predictive_scaling_predefined_metric_pair_specification)

let make_predictive_scaling_metric_specification
    ?predefined_metric_pair_specification:
      (predefined_metric_pair_specification_ :
         predictive_scaling_predefined_metric_pair_specification option)
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ :
         predictive_scaling_predefined_scaling_metric_specification option)
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ :
         predictive_scaling_predefined_load_metric_specification option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
    ?customized_capacity_metric_specification:
      (customized_capacity_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
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

let make_predictive_scaling_policy_configuration ?mode:(mode_ : predictive_scaling_mode option)
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
    : predictive_scaling_policy_configuration)

let make_target_tracking_metric_dimension ~name:(name_ : target_tracking_metric_dimension_name)
    ~value:(value_ : target_tracking_metric_dimension_value) () =
  ({ name = name_; value = value_ } : target_tracking_metric_dimension)

let make_target_tracking_metric ?dimensions:(dimensions_ : target_tracking_metric_dimensions option)
    ?metric_name:(metric_name_ : target_tracking_metric_name option)
    ?namespace:(namespace_ : target_tracking_metric_namespace option) () =
  ({ dimensions = dimensions_; metric_name = metric_name_; namespace = namespace_ }
    : target_tracking_metric)

let make_target_tracking_metric_stat ?unit_:(unit__ : target_tracking_metric_unit option)
    ~metric:(metric_ : target_tracking_metric) ~stat:(stat_ : xml_string) () =
  ({ metric = metric_; stat = stat_; unit_ = unit__ } : target_tracking_metric_stat)

let make_target_tracking_metric_data_query ?expression:(expression_ : expression option)
    ?label:(label_ : xml_string option)
    ?metric_stat:(metric_stat_ : target_tracking_metric_stat option)
    ?return_data:(return_data_ : return_data option) ~id:(id_ : id) () =
  ({
     expression = expression_;
     id = id_;
     label = label_;
     metric_stat = metric_stat_;
     return_data = return_data_;
   }
    : target_tracking_metric_data_query)

let make_metric_dimension ~name:(name_ : metric_dimension_name)
    ~value:(value_ : metric_dimension_value) () =
  ({ name = name_; value = value_ } : metric_dimension)

let make_customized_metric_specification ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : metric_namespace option)
    ?dimensions:(dimensions_ : metric_dimensions option)
    ?statistic:(statistic_ : metric_statistic option) ?unit_:(unit__ : metric_unit option)
    ?metrics:(metrics_ : target_tracking_metric_data_queries option) () =
  ({
     metric_name = metric_name_;
     namespace = namespace_;
     dimensions = dimensions_;
     statistic = statistic_;
     unit_ = unit__;
     metrics = metrics_;
   }
    : customized_metric_specification)

let make_predefined_metric_specification ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : metric_type) () =
  ({ predefined_metric_type = predefined_metric_type_; resource_label = resource_label_ }
    : predefined_metric_specification)

let make_target_tracking_scaling_policy_configuration
    ?predefined_metric_specification:
      (predefined_metric_specification_ : predefined_metric_specification option)
    ?customized_metric_specification:
      (customized_metric_specification_ : customized_metric_specification option)
    ?scale_out_cooldown:(scale_out_cooldown_ : cooldown option)
    ?scale_in_cooldown:(scale_in_cooldown_ : cooldown option)
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     target_value = target_value_;
     predefined_metric_specification = predefined_metric_specification_;
     customized_metric_specification = customized_metric_specification_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     disable_scale_in = disable_scale_in_;
   }
    : target_tracking_scaling_policy_configuration)

let make_step_adjustment
    ?metric_interval_lower_bound:(metric_interval_lower_bound_ : metric_scale option)
    ?metric_interval_upper_bound:(metric_interval_upper_bound_ : metric_scale option)
    ~scaling_adjustment:(scaling_adjustment_ : scaling_adjustment) () =
  ({
     metric_interval_lower_bound = metric_interval_lower_bound_;
     metric_interval_upper_bound = metric_interval_upper_bound_;
     scaling_adjustment = scaling_adjustment_;
   }
    : step_adjustment)

let make_step_scaling_policy_configuration
    ?adjustment_type:(adjustment_type_ : adjustment_type option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?cooldown:(cooldown_ : cooldown option)
    ?metric_aggregation_type:(metric_aggregation_type_ : metric_aggregation_type option) () =
  ({
     adjustment_type = adjustment_type_;
     step_adjustments = step_adjustments_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     cooldown = cooldown_;
     metric_aggregation_type = metric_aggregation_type_;
   }
    : step_scaling_policy_configuration)

let make_put_scaling_policy_request ?policy_type:(policy_type_ : policy_type option)
    ?step_scaling_policy_configuration:
      (step_scaling_policy_configuration_ : step_scaling_policy_configuration option)
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         target_tracking_scaling_policy_configuration option)
    ?predictive_scaling_policy_configuration:
      (predictive_scaling_policy_configuration_ : predictive_scaling_policy_configuration option)
    ~policy_name:(policy_name_ : policy_name)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     policy_name = policy_name_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     policy_type = policy_type_;
     step_scaling_policy_configuration = step_scaling_policy_configuration_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
     predictive_scaling_policy_configuration = predictive_scaling_policy_configuration_;
   }
    : put_scaling_policy_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_capacity_forecast ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps)
    ~values:(values_ : predictive_scaling_forecast_values) () =
  ({ timestamps = timestamps_; values = values_ } : capacity_forecast)

let make_load_forecast ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps)
    ~values:(values_ : predictive_scaling_forecast_values)
    ~metric_specification:(metric_specification_ : predictive_scaling_metric_specification) () =
  ({ timestamps = timestamps_; values = values_; metric_specification = metric_specification_ }
    : load_forecast)

let make_get_predictive_scaling_forecast_response
    ?load_forecast:(load_forecast_ : load_forecasts option)
    ?capacity_forecast:(capacity_forecast_ : capacity_forecast option)
    ?update_time:(update_time_ : timestamp_type option) () =
  ({
     load_forecast = load_forecast_;
     capacity_forecast = capacity_forecast_;
     update_time = update_time_;
   }
    : get_predictive_scaling_forecast_response)

let make_get_predictive_scaling_forecast_request
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~policy_name:(policy_name_ : policy_name) ~start_time:(start_time_ : timestamp_type)
    ~end_time:(end_time_ : timestamp_type) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     policy_name = policy_name_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : get_predictive_scaling_forecast_request)

let make_scheduled_action ?timezone:(timezone_ : resource_id_max_len1600 option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?start_time:(start_time_ : timestamp_type option) ?end_time:(end_time_ : timestamp_type option)
    ?scalable_target_action:(scalable_target_action_ : scalable_target_action option)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name)
    ~scheduled_action_ar_n:(scheduled_action_ar_n_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~schedule:(schedule_ : resource_id_max_len1600)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~creation_time:(creation_time_ : timestamp_type) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     scheduled_action_ar_n = scheduled_action_ar_n_;
     service_namespace = service_namespace_;
     schedule = schedule_;
     timezone = timezone_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     start_time = start_time_;
     end_time = end_time_;
     scalable_target_action = scalable_target_action_;
     creation_time = creation_time_;
   }
    : scheduled_action)

let make_describe_scheduled_actions_response
    ?scheduled_actions:(scheduled_actions_ : scheduled_actions option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scheduled_actions = scheduled_actions_; next_token = next_token_ }
    : describe_scheduled_actions_response)

let make_describe_scheduled_actions_request
    ?scheduled_action_names:(scheduled_action_names_ : resource_ids_max_len1600 option)
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : xml_string option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     scheduled_action_names = scheduled_action_names_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_scheduled_actions_request)

let make_scaling_policy
    ?step_scaling_policy_configuration:
      (step_scaling_policy_configuration_ : step_scaling_policy_configuration option)
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         target_tracking_scaling_policy_configuration option)
    ?predictive_scaling_policy_configuration:
      (predictive_scaling_policy_configuration_ : predictive_scaling_policy_configuration option)
    ?alarms:(alarms_ : alarms option) ~policy_ar_n:(policy_ar_n_ : resource_id_max_len1600)
    ~policy_name:(policy_name_ : policy_name)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~policy_type:(policy_type_ : policy_type) ~creation_time:(creation_time_ : timestamp_type) () =
  ({
     policy_ar_n = policy_ar_n_;
     policy_name = policy_name_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     policy_type = policy_type_;
     step_scaling_policy_configuration = step_scaling_policy_configuration_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
     predictive_scaling_policy_configuration = predictive_scaling_policy_configuration_;
     alarms = alarms_;
     creation_time = creation_time_;
   }
    : scaling_policy)

let make_describe_scaling_policies_response
    ?scaling_policies:(scaling_policies_ : scaling_policies option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scaling_policies = scaling_policies_; next_token = next_token_ }
    : describe_scaling_policies_response)

let make_describe_scaling_policies_request
    ?policy_names:(policy_names_ : resource_ids_max_len1600 option)
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : xml_string option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     policy_names = policy_names_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_scaling_policies_request)

let make_not_scaled_reason ?max_capacity:(max_capacity_ : resource_capacity option)
    ?min_capacity:(min_capacity_ : resource_capacity option)
    ?current_capacity:(current_capacity_ : resource_capacity option) ~code:(code_ : xml_string) () =
  ({
     code = code_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
     current_capacity = current_capacity_;
   }
    : not_scaled_reason)

let make_scaling_activity ?end_time:(end_time_ : timestamp_type option)
    ?status_message:(status_message_ : xml_string option) ?details:(details_ : xml_string option)
    ?not_scaled_reasons:(not_scaled_reasons_ : not_scaled_reasons option)
    ~activity_id:(activity_id_ : resource_id)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~description:(description_ : xml_string) ~cause:(cause_ : xml_string)
    ~start_time:(start_time_ : timestamp_type)
    ~status_code:(status_code_ : scaling_activity_status_code) () =
  ({
     activity_id = activity_id_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     description = description_;
     cause = cause_;
     start_time = start_time_;
     end_time = end_time_;
     status_code = status_code_;
     status_message = status_message_;
     details = details_;
     not_scaled_reasons = not_scaled_reasons_;
   }
    : scaling_activity)

let make_describe_scaling_activities_response
    ?scaling_activities:(scaling_activities_ : scaling_activities option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scaling_activities = scaling_activities_; next_token = next_token_ }
    : describe_scaling_activities_response)

let make_describe_scaling_activities_request
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : xml_string option)
    ?include_not_scaled_activities:
      (include_not_scaled_activities_ : include_not_scaled_activities option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     max_results = max_results_;
     next_token = next_token_;
     include_not_scaled_activities = include_not_scaled_activities_;
   }
    : describe_scaling_activities_request)

let make_scalable_target ?predicted_capacity:(predicted_capacity_ : resource_capacity option)
    ?suspended_state:(suspended_state_ : suspended_state option)
    ?scalable_target_ar_n:(scalable_target_ar_n_ : xml_string option)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~min_capacity:(min_capacity_ : resource_capacity)
    ~max_capacity:(max_capacity_ : resource_capacity)
    ~role_ar_n:(role_ar_n_ : resource_id_max_len1600)
    ~creation_time:(creation_time_ : timestamp_type) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     predicted_capacity = predicted_capacity_;
     role_ar_n = role_ar_n_;
     creation_time = creation_time_;
     suspended_state = suspended_state_;
     scalable_target_ar_n = scalable_target_ar_n_;
   }
    : scalable_target)

let make_describe_scalable_targets_response
    ?scalable_targets:(scalable_targets_ : scalable_targets option)
    ?next_token:(next_token_ : xml_string option) () =
  ({ scalable_targets = scalable_targets_; next_token = next_token_ }
    : describe_scalable_targets_response)

let make_describe_scalable_targets_request
    ?resource_ids:(resource_ids_ : resource_ids_max_len1600 option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : xml_string option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     service_namespace = service_namespace_;
     resource_ids = resource_ids_;
     scalable_dimension = scalable_dimension_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_scalable_targets_request)

let make_deregister_scalable_target_response () = (() : unit)

let make_deregister_scalable_target_request
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
   }
    : deregister_scalable_target_request)

let make_delete_scheduled_action_response () = (() : unit)

let make_delete_scheduled_action_request ~service_namespace:(service_namespace_ : service_namespace)
    ~scheduled_action_name:(scheduled_action_name_ : resource_id_max_len1600)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     service_namespace = service_namespace_;
     scheduled_action_name = scheduled_action_name_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
   }
    : delete_scheduled_action_request)

let make_delete_scaling_policy_response () = (() : unit)

let make_delete_scaling_policy_request ~policy_name:(policy_name_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension) () =
  ({
     policy_name = policy_name_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
   }
    : delete_scaling_policy_request)
