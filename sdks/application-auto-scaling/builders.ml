open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_predefined_metric_specification ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predefined_metric_specification)

let make_metric_dimension ~value:(value_ : metric_dimension_value)
    ~name:(name_ : metric_dimension_name) () =
  ({ value = value_; name = name_ } : metric_dimension)

let make_target_tracking_metric_dimension ~value:(value_ : target_tracking_metric_dimension_value)
    ~name:(name_ : target_tracking_metric_dimension_name) () =
  ({ value = value_; name = name_ } : target_tracking_metric_dimension)

let make_target_tracking_metric ?namespace:(namespace_ : target_tracking_metric_namespace option)
    ?metric_name:(metric_name_ : target_tracking_metric_name option)
    ?dimensions:(dimensions_ : target_tracking_metric_dimensions option) () =
  ({ namespace = namespace_; metric_name = metric_name_; dimensions = dimensions_ }
    : target_tracking_metric)

let make_target_tracking_metric_stat ?unit_:(unit__ : target_tracking_metric_unit option)
    ~stat:(stat_ : xml_string) ~metric:(metric_ : target_tracking_metric) () =
  ({ unit_ = unit__; stat = stat_; metric = metric_ } : target_tracking_metric_stat)

let make_target_tracking_metric_data_query ?return_data:(return_data_ : return_data option)
    ?metric_stat:(metric_stat_ : target_tracking_metric_stat option)
    ?label:(label_ : xml_string option) ?expression:(expression_ : expression option) ~id:(id_ : id)
    () =
  ({
     return_data = return_data_;
     metric_stat = metric_stat_;
     label = label_;
     id = id_;
     expression = expression_;
   }
    : target_tracking_metric_data_query)

let make_customized_metric_specification
    ?metrics:(metrics_ : target_tracking_metric_data_queries option)
    ?unit_:(unit__ : metric_unit option) ?statistic:(statistic_ : metric_statistic option)
    ?dimensions:(dimensions_ : metric_dimensions option)
    ?namespace:(namespace_ : metric_namespace option)
    ?metric_name:(metric_name_ : metric_name option) () =
  ({
     metrics = metrics_;
     unit_ = unit__;
     statistic = statistic_;
     dimensions = dimensions_;
     namespace = namespace_;
     metric_name = metric_name_;
   }
    : customized_metric_specification)

let make_target_tracking_scaling_policy_configuration
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ?scale_in_cooldown:(scale_in_cooldown_ : cooldown option)
    ?scale_out_cooldown:(scale_out_cooldown_ : cooldown option)
    ?customized_metric_specification:
      (customized_metric_specification_ : customized_metric_specification option)
    ?predefined_metric_specification:
      (predefined_metric_specification_ : predefined_metric_specification option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     disable_scale_in = disable_scale_in_;
     scale_in_cooldown = scale_in_cooldown_;
     scale_out_cooldown = scale_out_cooldown_;
     customized_metric_specification = customized_metric_specification_;
     predefined_metric_specification = predefined_metric_specification_;
     target_value = target_value_;
   }
    : target_tracking_scaling_policy_configuration)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_map)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_suspended_state
    ?scheduled_scaling_suspended:(scheduled_scaling_suspended_ : scaling_suspended option)
    ?dynamic_scaling_out_suspended:(dynamic_scaling_out_suspended_ : scaling_suspended option)
    ?dynamic_scaling_in_suspended:(dynamic_scaling_in_suspended_ : scaling_suspended option) () =
  ({
     scheduled_scaling_suspended = scheduled_scaling_suspended_;
     dynamic_scaling_out_suspended = dynamic_scaling_out_suspended_;
     dynamic_scaling_in_suspended = dynamic_scaling_in_suspended_;
   }
    : suspended_state)

let make_step_adjustment
    ?metric_interval_upper_bound:(metric_interval_upper_bound_ : metric_scale option)
    ?metric_interval_lower_bound:(metric_interval_lower_bound_ : metric_scale option)
    ~scaling_adjustment:(scaling_adjustment_ : scaling_adjustment) () =
  ({
     scaling_adjustment = scaling_adjustment_;
     metric_interval_upper_bound = metric_interval_upper_bound_;
     metric_interval_lower_bound = metric_interval_lower_bound_;
   }
    : step_adjustment)

let make_step_scaling_policy_configuration
    ?metric_aggregation_type:(metric_aggregation_type_ : metric_aggregation_type option)
    ?cooldown:(cooldown_ : cooldown option)
    ?min_adjustment_magnitude:(min_adjustment_magnitude_ : min_adjustment_magnitude option)
    ?step_adjustments:(step_adjustments_ : step_adjustments option)
    ?adjustment_type:(adjustment_type_ : adjustment_type option) () =
  ({
     metric_aggregation_type = metric_aggregation_type_;
     cooldown = cooldown_;
     min_adjustment_magnitude = min_adjustment_magnitude_;
     step_adjustments = step_adjustments_;
     adjustment_type = adjustment_type_;
   }
    : step_scaling_policy_configuration)

let make_scalable_target_action ?max_capacity:(max_capacity_ : resource_capacity option)
    ?min_capacity:(min_capacity_ : resource_capacity option) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ } : scalable_target_action)

let make_scheduled_action
    ?scalable_target_action:(scalable_target_action_ : scalable_target_action option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?timezone:(timezone_ : resource_id_max_len1600 option)
    ~creation_time:(creation_time_ : timestamp_type)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~schedule:(schedule_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~scheduled_action_ar_n:(scheduled_action_ar_n_ : resource_id_max_len1600)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({
     creation_time = creation_time_;
     scalable_target_action = scalable_target_action_;
     end_time = end_time_;
     start_time = start_time_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     timezone = timezone_;
     schedule = schedule_;
     service_namespace = service_namespace_;
     scheduled_action_ar_n = scheduled_action_ar_n_;
     scheduled_action_name = scheduled_action_name_;
   }
    : scheduled_action)

let make_predictive_scaling_predefined_metric_pair_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_metric_pair_specification)

let make_predictive_scaling_predefined_scaling_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_scaling_metric_specification)

let make_predictive_scaling_predefined_load_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_metric_type:(predefined_metric_type_ : predictive_scaling_metric_type) () =
  ({ resource_label = resource_label_; predefined_metric_type = predefined_metric_type_ }
    : predictive_scaling_predefined_load_metric_specification)

let make_predictive_scaling_metric_dimension
    ~value:(value_ : predictive_scaling_metric_dimension_value)
    ~name:(name_ : predictive_scaling_metric_dimension_name) () =
  ({ value = value_; name = name_ } : predictive_scaling_metric_dimension)

let make_predictive_scaling_metric
    ?namespace:(namespace_ : predictive_scaling_metric_namespace option)
    ?metric_name:(metric_name_ : predictive_scaling_metric_name option)
    ?dimensions:(dimensions_ : predictive_scaling_metric_dimensions option) () =
  ({ namespace = namespace_; metric_name = metric_name_; dimensions = dimensions_ }
    : predictive_scaling_metric)

let make_predictive_scaling_metric_stat ?unit_:(unit__ : predictive_scaling_metric_unit option)
    ~stat:(stat_ : xml_string) ~metric:(metric_ : predictive_scaling_metric) () =
  ({ unit_ = unit__; stat = stat_; metric = metric_ } : predictive_scaling_metric_stat)

let make_predictive_scaling_metric_data_query ?return_data:(return_data_ : return_data option)
    ?label:(label_ : xml_string option)
    ?metric_stat:(metric_stat_ : predictive_scaling_metric_stat option)
    ?expression:(expression_ : expression option) ~id:(id_ : id) () =
  ({
     return_data = return_data_;
     label = label_;
     metric_stat = metric_stat_;
     expression = expression_;
     id = id_;
   }
    : predictive_scaling_metric_data_query)

let make_predictive_scaling_customized_metric_specification
    ~metric_data_queries:(metric_data_queries_ : predictive_scaling_metric_data_queries) () =
  ({ metric_data_queries = metric_data_queries_ }
    : predictive_scaling_customized_metric_specification)

let make_predictive_scaling_metric_specification
    ?customized_capacity_metric_specification:
      (customized_capacity_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ :
         predictive_scaling_customized_metric_specification option)
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ :
         predictive_scaling_predefined_load_metric_specification option)
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ :
         predictive_scaling_predefined_scaling_metric_specification option)
    ?predefined_metric_pair_specification:
      (predefined_metric_pair_specification_ :
         predictive_scaling_predefined_metric_pair_specification option)
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

let make_predictive_scaling_policy_configuration
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
    : predictive_scaling_policy_configuration)

let make_alarm ~alarm_ar_n:(alarm_ar_n_ : resource_id) ~alarm_name:(alarm_name_ : resource_id) () =
  ({ alarm_ar_n = alarm_ar_n_; alarm_name = alarm_name_ } : alarm)

let make_scaling_policy ?alarms:(alarms_ : alarms option)
    ?predictive_scaling_policy_configuration:
      (predictive_scaling_policy_configuration_ : predictive_scaling_policy_configuration option)
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         target_tracking_scaling_policy_configuration option)
    ?step_scaling_policy_configuration:
      (step_scaling_policy_configuration_ : step_scaling_policy_configuration option)
    ~creation_time:(creation_time_ : timestamp_type) ~policy_type:(policy_type_ : policy_type)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~policy_name:(policy_name_ : policy_name) ~policy_ar_n:(policy_ar_n_ : resource_id_max_len1600)
    () =
  ({
     creation_time = creation_time_;
     alarms = alarms_;
     predictive_scaling_policy_configuration = predictive_scaling_policy_configuration_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
     step_scaling_policy_configuration = step_scaling_policy_configuration_;
     policy_type = policy_type_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     policy_name = policy_name_;
     policy_ar_n = policy_ar_n_;
   }
    : scaling_policy)

let make_not_scaled_reason ?current_capacity:(current_capacity_ : resource_capacity option)
    ?min_capacity:(min_capacity_ : resource_capacity option)
    ?max_capacity:(max_capacity_ : resource_capacity option) ~code:(code_ : xml_string) () =
  ({
     current_capacity = current_capacity_;
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     code = code_;
   }
    : not_scaled_reason)

let make_scaling_activity ?not_scaled_reasons:(not_scaled_reasons_ : not_scaled_reasons option)
    ?details:(details_ : xml_string option) ?status_message:(status_message_ : xml_string option)
    ?end_time:(end_time_ : timestamp_type option)
    ~status_code:(status_code_ : scaling_activity_status_code)
    ~start_time:(start_time_ : timestamp_type) ~cause:(cause_ : xml_string)
    ~description:(description_ : xml_string)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~activity_id:(activity_id_ : resource_id) () =
  ({
     not_scaled_reasons = not_scaled_reasons_;
     details = details_;
     status_message = status_message_;
     status_code = status_code_;
     end_time = end_time_;
     start_time = start_time_;
     cause = cause_;
     description = description_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     activity_id = activity_id_;
   }
    : scaling_activity)

let make_scalable_target ?scalable_target_ar_n:(scalable_target_ar_n_ : xml_string option)
    ?suspended_state:(suspended_state_ : suspended_state option)
    ?predicted_capacity:(predicted_capacity_ : resource_capacity option)
    ~creation_time:(creation_time_ : timestamp_type)
    ~role_ar_n:(role_ar_n_ : resource_id_max_len1600)
    ~max_capacity:(max_capacity_ : resource_capacity)
    ~min_capacity:(min_capacity_ : resource_capacity)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     scalable_target_ar_n = scalable_target_ar_n_;
     suspended_state = suspended_state_;
     creation_time = creation_time_;
     role_ar_n = role_ar_n_;
     predicted_capacity = predicted_capacity_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : scalable_target)

let make_register_scalable_target_response
    ?scalable_target_ar_n:(scalable_target_ar_n_ : xml_string option) () =
  ({ scalable_target_ar_n = scalable_target_ar_n_ } : register_scalable_target_response)

let make_register_scalable_target_request ?tags:(tags_ : tag_map option)
    ?suspended_state:(suspended_state_ : suspended_state option)
    ?role_ar_n:(role_ar_n_ : resource_id_max_len1600 option)
    ?max_capacity:(max_capacity_ : resource_capacity option)
    ?min_capacity:(min_capacity_ : resource_capacity option)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     tags = tags_;
     suspended_state = suspended_state_;
     role_ar_n = role_ar_n_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : register_scalable_target_request)

let make_put_scheduled_action_response () = (() : unit)

let make_put_scheduled_action_request
    ?scalable_target_action:(scalable_target_action_ : scalable_target_action option)
    ?end_time:(end_time_ : timestamp_type option) ?start_time:(start_time_ : timestamp_type option)
    ?timezone:(timezone_ : resource_id_max_len1600 option)
    ?schedule:(schedule_ : resource_id_max_len1600 option)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     scalable_target_action = scalable_target_action_;
     end_time = end_time_;
     start_time = start_time_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     scheduled_action_name = scheduled_action_name_;
     timezone = timezone_;
     schedule = schedule_;
     service_namespace = service_namespace_;
   }
    : put_scheduled_action_request)

let make_put_scaling_policy_response ?alarms:(alarms_ : alarms option)
    ~policy_ar_n:(policy_ar_n_ : resource_id_max_len1600) () =
  ({ alarms = alarms_; policy_ar_n = policy_ar_n_ } : put_scaling_policy_response)

let make_put_scaling_policy_request
    ?predictive_scaling_policy_configuration:
      (predictive_scaling_policy_configuration_ : predictive_scaling_policy_configuration option)
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         target_tracking_scaling_policy_configuration option)
    ?step_scaling_policy_configuration:
      (step_scaling_policy_configuration_ : step_scaling_policy_configuration option)
    ?policy_type:(policy_type_ : policy_type option)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~policy_name:(policy_name_ : policy_name) () =
  ({
     predictive_scaling_policy_configuration = predictive_scaling_policy_configuration_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
     step_scaling_policy_configuration = step_scaling_policy_configuration_;
     policy_type = policy_type_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     policy_name = policy_name_;
   }
    : put_scaling_policy_request)

let make_load_forecast
    ~metric_specification:(metric_specification_ : predictive_scaling_metric_specification)
    ~values:(values_ : predictive_scaling_forecast_values)
    ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps) () =
  ({ metric_specification = metric_specification_; values = values_; timestamps = timestamps_ }
    : load_forecast)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_capacity_forecast ~values:(values_ : predictive_scaling_forecast_values)
    ~timestamps:(timestamps_ : predictive_scaling_forecast_timestamps) () =
  ({ values = values_; timestamps = timestamps_ } : capacity_forecast)

let make_get_predictive_scaling_forecast_response
    ?update_time:(update_time_ : timestamp_type option)
    ?capacity_forecast:(capacity_forecast_ : capacity_forecast option)
    ?load_forecast:(load_forecast_ : load_forecasts option) () =
  ({
     update_time = update_time_;
     capacity_forecast = capacity_forecast_;
     load_forecast = load_forecast_;
   }
    : get_predictive_scaling_forecast_response)

let make_get_predictive_scaling_forecast_request ~end_time:(end_time_ : timestamp_type)
    ~start_time:(start_time_ : timestamp_type) ~policy_name:(policy_name_ : policy_name)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     policy_name = policy_name_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : get_predictive_scaling_forecast_request)

let make_describe_scheduled_actions_response ?next_token:(next_token_ : xml_string option)
    ?scheduled_actions:(scheduled_actions_ : scheduled_actions option) () =
  ({ next_token = next_token_; scheduled_actions = scheduled_actions_ }
    : describe_scheduled_actions_response)

let make_describe_scheduled_actions_request ?next_token:(next_token_ : xml_string option)
    ?max_results:(max_results_ : max_results option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ?scheduled_action_names:(scheduled_action_names_ : resource_ids_max_len1600 option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     scheduled_action_names = scheduled_action_names_;
   }
    : describe_scheduled_actions_request)

let make_describe_scaling_policies_response ?next_token:(next_token_ : xml_string option)
    ?scaling_policies:(scaling_policies_ : scaling_policies option) () =
  ({ next_token = next_token_; scaling_policies = scaling_policies_ }
    : describe_scaling_policies_response)

let make_describe_scaling_policies_request ?next_token:(next_token_ : xml_string option)
    ?max_results:(max_results_ : max_results option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ?policy_names:(policy_names_ : resource_ids_max_len1600 option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     policy_names = policy_names_;
   }
    : describe_scaling_policies_request)

let make_describe_scaling_activities_response ?next_token:(next_token_ : xml_string option)
    ?scaling_activities:(scaling_activities_ : scaling_activities option) () =
  ({ next_token = next_token_; scaling_activities = scaling_activities_ }
    : describe_scaling_activities_response)

let make_describe_scaling_activities_request
    ?include_not_scaled_activities:
      (include_not_scaled_activities_ : include_not_scaled_activities option)
    ?next_token:(next_token_ : xml_string option) ?max_results:(max_results_ : max_results option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?resource_id:(resource_id_ : resource_id_max_len1600 option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     include_not_scaled_activities = include_not_scaled_activities_;
     next_token = next_token_;
     max_results = max_results_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : describe_scaling_activities_request)

let make_describe_scalable_targets_response ?next_token:(next_token_ : xml_string option)
    ?scalable_targets:(scalable_targets_ : scalable_targets option) () =
  ({ next_token = next_token_; scalable_targets = scalable_targets_ }
    : describe_scalable_targets_response)

let make_describe_scalable_targets_request ?next_token:(next_token_ : xml_string option)
    ?max_results:(max_results_ : max_results option)
    ?scalable_dimension:(scalable_dimension_ : scalable_dimension option)
    ?resource_ids:(resource_ids_ : resource_ids_max_len1600 option)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     scalable_dimension = scalable_dimension_;
     resource_ids = resource_ids_;
     service_namespace = service_namespace_;
   }
    : describe_scalable_targets_request)

let make_deregister_scalable_target_response () = (() : unit)

let make_deregister_scalable_target_request
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : deregister_scalable_target_request)

let make_delete_scheduled_action_response () = (() : unit)

let make_delete_scheduled_action_request
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scheduled_action_name:(scheduled_action_name_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     scheduled_action_name = scheduled_action_name_;
     service_namespace = service_namespace_;
   }
    : delete_scheduled_action_request)

let make_delete_scaling_policy_response () = (() : unit)

let make_delete_scaling_policy_request
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~policy_name:(policy_name_ : resource_id_max_len1600) () =
  ({
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     policy_name = policy_name_;
   }
    : delete_scaling_policy_request)
