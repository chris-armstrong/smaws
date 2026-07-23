open Types

let make_update_scaling_plan_response () = (() : unit)

let make_metric_dimension ~name:(name_ : metric_dimension_name)
    ~value:(value_ : metric_dimension_value) () =
  ({ name = name_; value = value_ } : metric_dimension)

let make_customized_load_metric_specification ?dimensions:(dimensions_ : metric_dimensions option)
    ?unit_:(unit__ : metric_unit option) ~metric_name:(metric_name_ : metric_name)
    ~namespace:(namespace_ : metric_namespace) ~statistic:(statistic_ : metric_statistic) () =
  ({
     metric_name = metric_name_;
     namespace = namespace_;
     dimensions = dimensions_;
     statistic = statistic_;
     unit_ = unit__;
   }
    : customized_load_metric_specification)

let make_predefined_load_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_load_metric_type:(predefined_load_metric_type_ : load_metric_type) () =
  ({ predefined_load_metric_type = predefined_load_metric_type_; resource_label = resource_label_ }
    : predefined_load_metric_specification)

let make_customized_scaling_metric_specification
    ?dimensions:(dimensions_ : metric_dimensions option) ?unit_:(unit__ : metric_unit option)
    ~metric_name:(metric_name_ : metric_name) ~namespace:(namespace_ : metric_namespace)
    ~statistic:(statistic_ : metric_statistic) () =
  ({
     metric_name = metric_name_;
     namespace = namespace_;
     dimensions = dimensions_;
     statistic = statistic_;
     unit_ = unit__;
   }
    : customized_scaling_metric_specification)

let make_predefined_scaling_metric_specification
    ?resource_label:(resource_label_ : resource_label option)
    ~predefined_scaling_metric_type:(predefined_scaling_metric_type_ : scaling_metric_type) () =
  ({
     predefined_scaling_metric_type = predefined_scaling_metric_type_;
     resource_label = resource_label_;
   }
    : predefined_scaling_metric_specification)

let make_target_tracking_configuration
    ?predefined_scaling_metric_specification:
      (predefined_scaling_metric_specification_ : predefined_scaling_metric_specification option)
    ?customized_scaling_metric_specification:
      (customized_scaling_metric_specification_ : customized_scaling_metric_specification option)
    ?disable_scale_in:(disable_scale_in_ : disable_scale_in option)
    ?scale_out_cooldown:(scale_out_cooldown_ : cooldown option)
    ?scale_in_cooldown:(scale_in_cooldown_ : cooldown option)
    ?estimated_instance_warmup:(estimated_instance_warmup_ : cooldown option)
    ~target_value:(target_value_ : metric_scale) () =
  ({
     predefined_scaling_metric_specification = predefined_scaling_metric_specification_;
     customized_scaling_metric_specification = customized_scaling_metric_specification_;
     target_value = target_value_;
     disable_scale_in = disable_scale_in_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     estimated_instance_warmup = estimated_instance_warmup_;
   }
    : target_tracking_configuration)

let make_scaling_instruction
    ?predefined_load_metric_specification:
      (predefined_load_metric_specification_ : predefined_load_metric_specification option)
    ?customized_load_metric_specification:
      (customized_load_metric_specification_ : customized_load_metric_specification option)
    ?scheduled_action_buffer_time:
      (scheduled_action_buffer_time_ : scheduled_action_buffer_time option)
    ?predictive_scaling_max_capacity_behavior:
      (predictive_scaling_max_capacity_behavior_ : predictive_scaling_max_capacity_behavior option)
    ?predictive_scaling_max_capacity_buffer:
      (predictive_scaling_max_capacity_buffer_ : resource_capacity option)
    ?predictive_scaling_mode:(predictive_scaling_mode_ : predictive_scaling_mode option)
    ?scaling_policy_update_behavior:
      (scaling_policy_update_behavior_ : scaling_policy_update_behavior option)
    ?disable_dynamic_scaling:(disable_dynamic_scaling_ : disable_dynamic_scaling option)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~min_capacity:(min_capacity_ : resource_capacity)
    ~max_capacity:(max_capacity_ : resource_capacity)
    ~target_tracking_configurations:
      (target_tracking_configurations_ : target_tracking_configurations) () =
  ({
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     target_tracking_configurations = target_tracking_configurations_;
     predefined_load_metric_specification = predefined_load_metric_specification_;
     customized_load_metric_specification = customized_load_metric_specification_;
     scheduled_action_buffer_time = scheduled_action_buffer_time_;
     predictive_scaling_max_capacity_behavior = predictive_scaling_max_capacity_behavior_;
     predictive_scaling_max_capacity_buffer = predictive_scaling_max_capacity_buffer_;
     predictive_scaling_mode = predictive_scaling_mode_;
     scaling_policy_update_behavior = scaling_policy_update_behavior_;
     disable_dynamic_scaling = disable_dynamic_scaling_;
   }
    : scaling_instruction)

let make_tag_filter ?key:(key_ : xml_string_max_len128 option) ?values:(values_ : tag_values option)
    () =
  ({ key = key_; values = values_ } : tag_filter)

let make_application_source
    ?cloud_formation_stack_ar_n:(cloud_formation_stack_ar_n_ : xml_string option)
    ?tag_filters:(tag_filters_ : tag_filters option) () =
  ({ cloud_formation_stack_ar_n = cloud_formation_stack_ar_n_; tag_filters = tag_filters_ }
    : application_source)

let make_update_scaling_plan_request
    ?application_source:(application_source_ : application_source option)
    ?scaling_instructions:(scaling_instructions_ : scaling_instructions option)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     scaling_plan_version = scaling_plan_version_;
     application_source = application_source_;
     scaling_instructions = scaling_instructions_;
   }
    : update_scaling_plan_request)

let make_datapoint ?timestamp:(timestamp_ : timestamp_type option)
    ?value:(value_ : metric_scale option) () =
  ({ timestamp = timestamp_; value = value_ } : datapoint)

let make_get_scaling_plan_resource_forecast_data_response ~datapoints:(datapoints_ : datapoints) ()
    =
  ({ datapoints = datapoints_ } : get_scaling_plan_resource_forecast_data_response)

let make_get_scaling_plan_resource_forecast_data_request
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : xml_string)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~forecast_data_type:(forecast_data_type_ : forecast_data_type)
    ~start_time:(start_time_ : timestamp_type) ~end_time:(end_time_ : timestamp_type) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     scaling_plan_version = scaling_plan_version_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     forecast_data_type = forecast_data_type_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : get_scaling_plan_resource_forecast_data_request)

let make_scaling_plan ?status_message:(status_message_ : xml_string option)
    ?status_start_time:(status_start_time_ : timestamp_type option)
    ?creation_time:(creation_time_ : timestamp_type option)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~application_source:(application_source_ : application_source)
    ~scaling_instructions:(scaling_instructions_ : scaling_instructions)
    ~status_code:(status_code_ : scaling_plan_status_code) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     scaling_plan_version = scaling_plan_version_;
     application_source = application_source_;
     scaling_instructions = scaling_instructions_;
     status_code = status_code_;
     status_message = status_message_;
     status_start_time = status_start_time_;
     creation_time = creation_time_;
   }
    : scaling_plan)

let make_describe_scaling_plans_response ?scaling_plans:(scaling_plans_ : scaling_plans option)
    ?next_token:(next_token_ : next_token option) () =
  ({ scaling_plans = scaling_plans_; next_token = next_token_ } : describe_scaling_plans_response)

let make_describe_scaling_plans_request
    ?scaling_plan_names:(scaling_plan_names_ : scaling_plan_names option)
    ?scaling_plan_version:(scaling_plan_version_ : scaling_plan_version option)
    ?application_sources:(application_sources_ : application_sources option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     scaling_plan_names = scaling_plan_names_;
     scaling_plan_version = scaling_plan_version_;
     application_sources = application_sources_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_scaling_plans_request)

let make_scaling_policy
    ?target_tracking_configuration:
      (target_tracking_configuration_ : target_tracking_configuration option)
    ~policy_name:(policy_name_ : policy_name) ~policy_type:(policy_type_ : policy_type) () =
  ({
     policy_name = policy_name_;
     policy_type = policy_type_;
     target_tracking_configuration = target_tracking_configuration_;
   }
    : scaling_policy)

let make_scaling_plan_resource ?scaling_policies:(scaling_policies_ : scaling_policies option)
    ?scaling_status_message:(scaling_status_message_ : xml_string option)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version)
    ~service_namespace:(service_namespace_ : service_namespace)
    ~resource_id:(resource_id_ : resource_id_max_len1600)
    ~scalable_dimension:(scalable_dimension_ : scalable_dimension)
    ~scaling_status_code:(scaling_status_code_ : scaling_status_code) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     scaling_plan_version = scaling_plan_version_;
     service_namespace = service_namespace_;
     resource_id = resource_id_;
     scalable_dimension = scalable_dimension_;
     scaling_policies = scaling_policies_;
     scaling_status_code = scaling_status_code_;
     scaling_status_message = scaling_status_message_;
   }
    : scaling_plan_resource)

let make_describe_scaling_plan_resources_response
    ?scaling_plan_resources:(scaling_plan_resources_ : scaling_plan_resources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ scaling_plan_resources = scaling_plan_resources_; next_token = next_token_ }
    : describe_scaling_plan_resources_response)

let make_describe_scaling_plan_resources_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     scaling_plan_version = scaling_plan_version_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_scaling_plan_resources_request)

let make_delete_scaling_plan_response () = (() : unit)

let make_delete_scaling_plan_request ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version) () =
  ({ scaling_plan_name = scaling_plan_name_; scaling_plan_version = scaling_plan_version_ }
    : delete_scaling_plan_request)

let make_create_scaling_plan_response
    ~scaling_plan_version:(scaling_plan_version_ : scaling_plan_version) () =
  ({ scaling_plan_version = scaling_plan_version_ } : create_scaling_plan_response)

let make_create_scaling_plan_request ~scaling_plan_name:(scaling_plan_name_ : scaling_plan_name)
    ~application_source:(application_source_ : application_source)
    ~scaling_instructions:(scaling_instructions_ : scaling_instructions) () =
  ({
     scaling_plan_name = scaling_plan_name_;
     application_source = application_source_;
     scaling_instructions = scaling_instructions_;
   }
    : create_scaling_plan_request)
