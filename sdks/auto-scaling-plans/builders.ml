open Types

let make_update_scaling_plan_response () = (() : unit)

let make_tag_filter ?values:(values_ : tag_values option) ?key:(key_ : xml_string_max_len128 option)
    () =
  ({ values = values_; key = key_ } : tag_filter)

let make_application_source ?tag_filters:(tag_filters_ : tag_filters option)
    ?cloud_formation_stack_ar_n:(cloud_formation_stack_ar_n_ : xml_string option) () =
  ({ tag_filters = tag_filters_; cloud_formation_stack_ar_n = cloud_formation_stack_ar_n_ }
    : application_source)

let make_predefined_scaling_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_scaling_metric_type:(predefined_scaling_metric_type_ : scaling_metric_type) () =
  ({
     resource_label = resource_label_;
     predefined_scaling_metric_type = predefined_scaling_metric_type_;
   }
    : predefined_scaling_metric_specification)

let make_metric_dimension ~value:(value_ : metric_dimension_value)
    ~name:(name_ : metric_dimension_name) () =
  ({ value = value_; name = name_ } : metric_dimension)

let make_customized_scaling_metric_specification ?unit_:(unit__ : metric_unit option)
    ?dimensions:(dimensions_ : metric_dimensions option) ~statistic:(statistic_ : metric_statistic)
    ~namespace:(namespace_ : metric_namespace) ~metric_name:(metric_name_ : metric_name) () =
  ({
     unit_ = unit__;
     statistic = statistic_;
     dimensions = dimensions_;
     namespace = namespace_;
     metric_name = metric_name_;
   }
    : customized_scaling_metric_specification)

let make_target_tracking_configuration
    ?estimated_instance_warmup:(estimated_instance_warmup_ : cooldown option)
    ?scale_in_cooldown:(scale_in_cooldown_ : cooldown option)
    ?scale_out_cooldown:(scale_out_cooldown_ : cooldown option)
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ : customized_scaling_metric_specification option)
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ : predefined_scaling_metric_specification option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     estimated_instance_warmup = estimated_instance_warmup_;
     scale_in_cooldown = scale_in_cooldown_;
     scale_out_cooldown = scale_out_cooldown_;
     disable_scale_in = disable_scale_in_;
     target_value = target_value_;
     customized_scaling_metric_specification = customized_scaling_metric_specification_;
     predefined_scaling_metric_specification = predefined_scaling_metric_specification_;
   }
    : target_tracking_configuration)

let make_predefined_load_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_load_metric_type:(predefined_load_metric_type_ : load_metric_type) () =
  ({ resource_label = resource_label_; predefined_load_metric_type = predefined_load_metric_type_ }
    : predefined_load_metric_specification)

let make_customized_load_metric_specification ?unit_:(unit__ : metric_unit option)
    ?dimensions:(dimensions_ : metric_dimensions option) ~statistic:(statistic_ : metric_statistic)
    ~namespace:(namespace_ : metric_namespace) ~metric_name:(metric_name_ : metric_name) () =
  ({
     unit_ = unit__;
     statistic = statistic_;
     dimensions = dimensions_;
     namespace = namespace_;
     metric_name = metric_name_;
   }
    : customized_load_metric_specification)

let make_scaling_instruction
    ?disable_dynamic_scaling:(disable_dynamic_scaling_ : disable_dynamic_scaling option)
    ?scaling_policy_update_behavior:
      (scaling_policy_update_behavior_ : scaling_policy_update_behavior option)
    ?predictive_scaling_mode:(predictive_scaling_mode_ : predictive_scaling_mode option)
    ?predictive_scaling_max_capacity_buffer:
      (predictive_scaling_max_capacity_buffer_ : resource_capacity option)
    ?predictive_scaling_max_capacity_behavior:
      (predictive_scaling_max_capacity_behavior_ : predictive_scaling_max_capacity_behavior option)
    ?scheduled_action_buffer_time:
      (scheduled_action_buffer_time_ : scheduled_action_buffer_time option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ : customized_load_metric_specification option)
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ : predefined_load_metric_specification option)
    ~target_tracking_configurations:
      (target_tracking_configurations_ : target_tracking_configurations)
    ~max_capacity:(max_capacity_ : resource_capacity)
    ~min_capacity:(min_capacity_ : resource_capacity)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace) () =
  ({
     disable_dynamic_scaling = disable_dynamic_scaling_;
     scaling_policy_update_behavior = scaling_policy_update_behavior_;
     predictive_scaling_mode = predictive_scaling_mode_;
     predictive_scaling_max_capacity_buffer = predictive_scaling_max_capacity_buffer_;
     predictive_scaling_max_capacity_behavior = predictive_scaling_max_capacity_behavior_;
     scheduled_action_buffer_time = scheduled_action_buffer_time_;
     customized_load_metric_specification = customized_load_metric_specification_;
     predefined_load_metric_specification = predefined_load_metric_specification_;
     target_tracking_configurations = target_tracking_configurations_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
   }
    : scaling_instruction)

let make_update_scaling_plan_request
    ?scaling_instructions:(scaling_instructions_ : scaling_instructions option)
    ?application_source:(application_source_ : application_source option)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     scaling_instructions = scaling_instructions_;
     application_source = application_source_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_name = scaling_plan_name_;
   }
    : update_scaling_plan_request)

let make_scaling_policy
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ~policy_type:(policy_type_ : policy_type) ~policy_name:(policy_name_ : policy_name) () =
  ({
     target_tracking_configuration = target_tracking_configuration_;
     policy_type = policy_type_;
     policy_name = policy_name_;
   }
    : scaling_policy)

let make_scaling_plan ?creation_time:(creation_time_ : timestamp_type option)
    ?status_start_time:(status_start_time_ : timestamp_type option)
    ?status_message:(status_message_ : xml_string option)
    ~status_code:(status_code_ : scaling_plan_status_code)
    ~scaling_instructions:(scaling_instructions_ : scaling_instructions)
    ~application_source:(application_source_ : application_source)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     creation_time = creation_time_;
     status_start_time = status_start_time_;
     status_message = status_message_;
     status_code = status_code_;
     scaling_instructions = scaling_instructions_;
     application_source = application_source_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_name = scaling_plan_name_;
   }
    : scaling_plan)

let make_scaling_plan_resource ?scaling_status_message:(scaling_status_message_ : xml_string option)
    ?scaling_policies:(scaling_policies_ : scaling_policies option)
    ~scaling_status_code:(scaling_status_code_ : scaling_status_code)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     scaling_status_message = scaling_status_message_;
     scaling_status_code = scaling_status_code_;
     scaling_policies = scaling_policies_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_name = scaling_plan_name_;
   }
    : scaling_plan_resource)

let make_datapoint ?value:(value_ : metric_scale option)
    ?timestamp:(timestamp_ : timestamp_type option) () =
  ({ value = value_; timestamp = timestamp_ } : datapoint)

let make_get_scaling_plan_resource_forecast_data_response ~datapoints:(datapoints_ : datapoints) ()
    =
  ({ datapoints = datapoints_ } : get_scaling_plan_resource_forecast_data_response)

let make_get_scaling_plan_resource_forecast_data_request ~end_time:(end_time_ : timestamp_type)
    ~start_time:(start_time_ : timestamp_type)
    ~forecast_data_type:(forecast_data_type_ : forecast_data_type)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~resource_id:(resource_id_ : xml_string)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     forecast_data_type = forecast_data_type_;
     scalable_dimension = scalable_dimension_;
     resource_id = resource_id_;
     service_namespace = service_namespace_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_name = scaling_plan_name_;
   }
    : get_scaling_plan_resource_forecast_data_request)

let make_describe_scaling_plans_response ?next_token:(next_token_ : next_token option)
    ?scaling_plans:(scaling_plans_ : scaling_plans option) () =
  ({ next_token = next_token_; scaling_plans = scaling_plans_ } : describe_scaling_plans_response)

let make_describe_scaling_plans_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?application_sources:(application_sources_ : application_sources option)
    ?scaling_plan_version:(scaling_plan_version_ : scaling_plan_version option)
    ?scaling_plan_names:(scaling_plan_names_ : scaling_plan_names option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     application_sources = application_sources_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_names = scaling_plan_names_;
   }
    : describe_scaling_plans_request)

let make_describe_scaling_plan_resources_response ?next_token:(next_token_ : next_token option)
    ?scaling_plan_resources:(scaling_plan_resources_ : scaling_plan_resources option) () =
  ({ next_token = next_token_; scaling_plan_resources = scaling_plan_resources_ }
    : describe_scaling_plan_resources_response)

let make_describe_scaling_plan_resources_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     scaling_plan_version = scaling_plan_version_;
     scaling_plan_name = scaling_plan_name_;
   }
    : describe_scaling_plan_resources_request)

let make_delete_scaling_plan_response () = (() : unit)

let make_delete_scaling_plan_request
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({ scaling_plan_version = scaling_plan_version_; scaling_plan_name = scaling_plan_name_ }
    : delete_scaling_plan_request)

let make_create_scaling_plan_response
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version) () =
  ({ scaling_plan_version = scaling_plan_version_ } : create_scaling_plan_response)

let make_create_scaling_plan_request
    ~scaling_instructions:(scaling_instructions_ : scaling_instructions)
    ~application_source:(application_source_ : application_source)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name) () =
  ({
     scaling_instructions = scaling_instructions_;
     application_source = application_source_;
     scaling_plan_name = scaling_plan_name_;
   }
    : create_scaling_plan_request)
