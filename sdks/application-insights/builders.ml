open Types

let make_workload
    ?missing_workload_config:(missing_workload_config_ : missing_workload_config option)
    ?workload_remarks:(workload_remarks_ : remarks option) ?tier:(tier_ : tier option)
    ?workload_name:(workload_name_ : workload_name option)
    ?component_name:(component_name_ : component_name option)
    ?workload_id:(workload_id_ : workload_id option) () =
  ({
     missing_workload_config = missing_workload_config_;
     workload_remarks = workload_remarks_;
     tier = tier_;
     workload_name = workload_name_;
     component_name = component_name_;
     workload_id = workload_id_;
   }
    : workload)

let make_workload_configuration ?configuration:(configuration_ : component_configuration option)
    ?tier:(tier_ : tier option) ?workload_name:(workload_name_ : workload_name option) () =
  ({ configuration = configuration_; tier = tier_; workload_name = workload_name_ }
    : workload_configuration)

let make_update_workload_response
    ?workload_configuration:(workload_configuration_ : workload_configuration option)
    ?workload_id:(workload_id_ : workload_id option) () =
  ({ workload_configuration = workload_configuration_; workload_id = workload_id_ }
    : update_workload_response)

let make_update_workload_request ?workload_id:(workload_id_ : workload_id option)
    ~workload_configuration:(workload_configuration_ : workload_configuration)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     workload_configuration = workload_configuration_;
     workload_id = workload_id_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : update_workload_request)

let make_update_problem_response () = (() : unit)

let make_update_problem_request ?visibility:(visibility_ : visibility option)
    ?update_status:(update_status_ : update_status option) ~problem_id:(problem_id_ : problem_id) ()
    =
  ({ visibility = visibility_; update_status = update_status_; problem_id = problem_id_ }
    : update_problem_request)

let make_log_pattern ?rank:(rank_ : log_pattern_rank option)
    ?pattern:(pattern_ : log_pattern_regex option)
    ?pattern_name:(pattern_name_ : log_pattern_name option)
    ?pattern_set_name:(pattern_set_name_ : log_pattern_set_name option) () =
  ({
     rank = rank_;
     pattern = pattern_;
     pattern_name = pattern_name_;
     pattern_set_name = pattern_set_name_;
   }
    : log_pattern)

let make_update_log_pattern_response ?log_pattern:(log_pattern_ : log_pattern option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({ log_pattern = log_pattern_; resource_group_name = resource_group_name_ }
    : update_log_pattern_response)

let make_update_log_pattern_request ?rank:(rank_ : log_pattern_rank option)
    ?pattern:(pattern_ : log_pattern_regex option) ~pattern_name:(pattern_name_ : log_pattern_name)
    ~pattern_set_name:(pattern_set_name_ : log_pattern_set_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     rank = rank_;
     pattern = pattern_;
     pattern_name = pattern_name_;
     pattern_set_name = pattern_set_name_;
     resource_group_name = resource_group_name_;
   }
    : update_log_pattern_request)

let make_update_component_response () = (() : unit)

let make_update_component_request ?resource_list:(resource_list_ : resource_list option)
    ?new_component_name:(new_component_name_ : custom_component_name option)
    ~component_name:(component_name_ : custom_component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     resource_list = resource_list_;
     new_component_name = new_component_name_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : update_component_request)

let make_update_component_configuration_response () = (() : unit)

let make_update_component_configuration_request
    ?auto_config_enabled:(auto_config_enabled_ : auto_config_enabled option)
    ?component_configuration:(component_configuration_ : component_configuration option)
    ?tier:(tier_ : tier option) ?monitor:(monitor_ : monitor option)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     auto_config_enabled = auto_config_enabled_;
     component_configuration = component_configuration_;
     tier = tier_;
     monitor = monitor_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : update_component_configuration_request)

let make_application_info
    ?attach_missing_permission:(attach_missing_permission_ : attach_missing_permission option)
    ?discovery_type:(discovery_type_ : discovery_type option)
    ?auto_config_enabled:(auto_config_enabled_ : auto_config_enabled option)
    ?remarks:(remarks_ : remarks option)
    ?cwe_monitor_enabled:(cwe_monitor_enabled_ : cwe_monitor_enabled option)
    ?ops_center_enabled:(ops_center_enabled_ : ops_center_enabled option)
    ?sns_notification_arn:(sns_notification_arn_ : sns_notification_arn option)
    ?ops_item_sns_topic_arn:(ops_item_sns_topic_arn_ : ops_item_sns_topic_arn option)
    ?life_cycle:(life_cycle_ : life_cycle option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     attach_missing_permission = attach_missing_permission_;
     discovery_type = discovery_type_;
     auto_config_enabled = auto_config_enabled_;
     remarks = remarks_;
     cwe_monitor_enabled = cwe_monitor_enabled_;
     ops_center_enabled = ops_center_enabled_;
     sns_notification_arn = sns_notification_arn_;
     ops_item_sns_topic_arn = ops_item_sns_topic_arn_;
     life_cycle = life_cycle_;
     resource_group_name = resource_group_name_;
     account_id = account_id_;
   }
    : application_info)

let make_update_application_response ?application_info:(application_info_ : application_info option)
    () =
  ({ application_info = application_info_ } : update_application_response)

let make_update_application_request
    ?attach_missing_permission:(attach_missing_permission_ : attach_missing_permission option)
    ?auto_config_enabled:(auto_config_enabled_ : auto_config_enabled option)
    ?remove_sns_topic:(remove_sns_topic_ : remove_sns_topic option)
    ?sns_notification_arn:(sns_notification_arn_ : sns_notification_arn option)
    ?ops_item_sns_topic_arn:(ops_item_sns_topic_arn_ : ops_item_sns_topic_arn option)
    ?cwe_monitor_enabled:(cwe_monitor_enabled_ : cwe_monitor_enabled option)
    ?ops_center_enabled:(ops_center_enabled_ : ops_center_enabled option)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     attach_missing_permission = attach_missing_permission_;
     auto_config_enabled = auto_config_enabled_;
     remove_sns_topic = remove_sns_topic_;
     sns_notification_arn = sns_notification_arn_;
     ops_item_sns_topic_arn = ops_item_sns_topic_arn_;
     cwe_monitor_enabled = cwe_monitor_enabled_;
     ops_center_enabled = ops_center_enabled_;
     resource_group_name = resource_group_name_;
   }
    : update_application_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_remove_workload_response () = (() : unit)

let make_remove_workload_request ~workload_id:(workload_id_ : workload_id)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     workload_id = workload_id_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : remove_workload_request)

let make_observation ?x_ray_node_type:(x_ray_node_type_ : x_ray_node_type option)
    ?x_ray_node_name:(x_ray_node_name_ : x_ray_node_name option)
    ?x_ray_request_average_latency:
      (x_ray_request_average_latency_ : x_ray_request_average_latency option)
    ?x_ray_request_count:(x_ray_request_count_ : x_ray_request_count option)
    ?x_ray_error_percent:(x_ray_error_percent_ : x_ray_error_percent option)
    ?x_ray_throttle_percent:(x_ray_throttle_percent_ : x_ray_throttle_percent option)
    ?x_ray_fault_percent:(x_ray_fault_percent_ : x_ray_fault_percent option)
    ?ebs_request_id:(ebs_request_id_ : ebs_request_id option)
    ?ebs_cause:(ebs_cause_ : ebs_cause option) ?ebs_result:(ebs_result_ : ebs_result option)
    ?ebs_event:(ebs_event_ : ebs_event option) ?states_input:(states_input_ : states_input option)
    ?states_status:(states_status_ : states_status option)
    ?states_arn:(states_arn_ : states_arn option)
    ?states_execution_arn:(states_execution_arn_ : states_execution_arn option)
    ?s3_event_name:(s3_event_name_ : s3_event_name option)
    ?rds_event_message:(rds_event_message_ : rds_event_message option)
    ?rds_event_categories:(rds_event_categories_ : rds_event_categories option)
    ?ec2_state:(ec2_state_ : ec2_state option)
    ?code_deploy_instance_group_id:
      (code_deploy_instance_group_id_ : code_deploy_instance_group_id option)
    ?code_deploy_application:(code_deploy_application_ : code_deploy_application option)
    ?code_deploy_state:(code_deploy_state_ : code_deploy_state option)
    ?code_deploy_deployment_group:
      (code_deploy_deployment_group_ : code_deploy_deployment_group option)
    ?code_deploy_deployment_id:(code_deploy_deployment_id_ : code_deploy_deployment_id option)
    ?health_event_description:(health_event_description_ : health_event_description option)
    ?health_event_type_category:(health_event_type_category_ : health_event_type_category option)
    ?health_event_type_code:(health_event_type_code_ : health_event_type_code option)
    ?health_service:(health_service_ : health_service option)
    ?health_event_arn:(health_event_arn_ : health_event_arn option)
    ?cloud_watch_event_detail_type:
      (cloud_watch_event_detail_type_ : cloud_watch_event_detail_type option)
    ?cloud_watch_event_source:(cloud_watch_event_source_ : cloud_watch_event_source option)
    ?cloud_watch_event_id:(cloud_watch_event_id_ : cloud_watch_event_id option)
    ?value:(value_ : value option) ?unit_:(unit__ : unit_ option)
    ?metric_name:(metric_name_ : metric_name option)
    ?metric_namespace:(metric_namespace_ : metric_namespace option)
    ?log_filter:(log_filter_ : log_filter option) ?log_text:(log_text_ : log_text option)
    ?line_time:(line_time_ : line_time option) ?log_group:(log_group_ : log_group option)
    ?source_ar_n:(source_ar_n_ : source_ar_n option)
    ?source_type:(source_type_ : source_type option) ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option) ?id:(id_ : observation_id option) () =
  ({
     x_ray_node_type = x_ray_node_type_;
     x_ray_node_name = x_ray_node_name_;
     x_ray_request_average_latency = x_ray_request_average_latency_;
     x_ray_request_count = x_ray_request_count_;
     x_ray_error_percent = x_ray_error_percent_;
     x_ray_throttle_percent = x_ray_throttle_percent_;
     x_ray_fault_percent = x_ray_fault_percent_;
     ebs_request_id = ebs_request_id_;
     ebs_cause = ebs_cause_;
     ebs_result = ebs_result_;
     ebs_event = ebs_event_;
     states_input = states_input_;
     states_status = states_status_;
     states_arn = states_arn_;
     states_execution_arn = states_execution_arn_;
     s3_event_name = s3_event_name_;
     rds_event_message = rds_event_message_;
     rds_event_categories = rds_event_categories_;
     ec2_state = ec2_state_;
     code_deploy_instance_group_id = code_deploy_instance_group_id_;
     code_deploy_application = code_deploy_application_;
     code_deploy_state = code_deploy_state_;
     code_deploy_deployment_group = code_deploy_deployment_group_;
     code_deploy_deployment_id = code_deploy_deployment_id_;
     health_event_description = health_event_description_;
     health_event_type_category = health_event_type_category_;
     health_event_type_code = health_event_type_code_;
     health_service = health_service_;
     health_event_arn = health_event_arn_;
     cloud_watch_event_detail_type = cloud_watch_event_detail_type_;
     cloud_watch_event_source = cloud_watch_event_source_;
     cloud_watch_event_id = cloud_watch_event_id_;
     value = value_;
     unit_ = unit__;
     metric_name = metric_name_;
     metric_namespace = metric_namespace_;
     log_filter = log_filter_;
     log_text = log_text_;
     line_time = line_time_;
     log_group = log_group_;
     source_ar_n = source_ar_n_;
     source_type = source_type_;
     end_time = end_time_;
     start_time = start_time_;
     id = id_;
   }
    : observation)

let make_related_observations ?observation_list:(observation_list_ : observation_list option) () =
  ({ observation_list = observation_list_ } : related_observations)

let make_problem ?resolution_method:(resolution_method_ : resolution_method option)
    ?visibility:(visibility_ : visibility option)
    ?last_recurrence_time:(last_recurrence_time_ : last_recurrence_time option)
    ?recurring_count:(recurring_count_ : recurring_count option)
    ?feedback:(feedback_ : feedback option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option)
    ?account_id:(account_id_ : account_id option)
    ?severity_level:(severity_level_ : severity_level option)
    ?end_time:(end_time_ : end_time option) ?start_time:(start_time_ : start_time option)
    ?affected_resource:(affected_resource_ : affected_resource option)
    ?status:(status_ : status option) ?insights:(insights_ : insights option)
    ?short_name:(short_name_ : short_name option) ?title:(title_ : title option)
    ?id:(id_ : problem_id option) () =
  ({
     resolution_method = resolution_method_;
     visibility = visibility_;
     last_recurrence_time = last_recurrence_time_;
     recurring_count = recurring_count_;
     feedback = feedback_;
     resource_group_name = resource_group_name_;
     account_id = account_id_;
     severity_level = severity_level_;
     end_time = end_time_;
     start_time = start_time_;
     affected_resource = affected_resource_;
     status = status_;
     insights = insights_;
     short_name = short_name_;
     title = title_;
     id = id_;
   }
    : problem)

let make_list_workloads_response ?next_token:(next_token_ : pagination_token option)
    ?workload_list:(workload_list_ : workload_list option) () =
  ({ next_token = next_token_; workload_list = workload_list_ } : list_workloads_response)

let make_list_workloads_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : list_workloads_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_problems_response ?account_id:(account_id_ : account_id option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option)
    ?next_token:(next_token_ : pagination_token option)
    ?problem_list:(problem_list_ : problem_list option) () =
  ({
     account_id = account_id_;
     resource_group_name = resource_group_name_;
     next_token = next_token_;
     problem_list = problem_list_;
   }
    : list_problems_response)

let make_list_problems_request ?visibility:(visibility_ : visibility option)
    ?component_name:(component_name_ : component_name option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option) ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     visibility = visibility_;
     component_name = component_name_;
     next_token = next_token_;
     max_results = max_results_;
     end_time = end_time_;
     start_time = start_time_;
     resource_group_name = resource_group_name_;
     account_id = account_id_;
   }
    : list_problems_request)

let make_list_log_patterns_response ?next_token:(next_token_ : pagination_token option)
    ?log_patterns:(log_patterns_ : log_pattern_list option)
    ?account_id:(account_id_ : account_id option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     next_token = next_token_;
     log_patterns = log_patterns_;
     account_id = account_id_;
     resource_group_name = resource_group_name_;
   }
    : list_log_patterns_response)

let make_list_log_patterns_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option)
    ?pattern_set_name:(pattern_set_name_ : log_pattern_set_name option)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
     pattern_set_name = pattern_set_name_;
     resource_group_name = resource_group_name_;
   }
    : list_log_patterns_request)

let make_list_log_pattern_sets_response ?next_token:(next_token_ : pagination_token option)
    ?log_pattern_sets:(log_pattern_sets_ : log_pattern_set_list option)
    ?account_id:(account_id_ : account_id option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     next_token = next_token_;
     log_pattern_sets = log_pattern_sets_;
     account_id = account_id_;
     resource_group_name = resource_group_name_;
   }
    : list_log_pattern_sets_response)

let make_list_log_pattern_sets_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
     resource_group_name = resource_group_name_;
   }
    : list_log_pattern_sets_request)

let make_configuration_event
    ?event_resource_name:(event_resource_name_ : configuration_event_resource_name option)
    ?event_detail:(event_detail_ : configuration_event_detail option)
    ?event_time:(event_time_ : configuration_event_time option)
    ?event_resource_type:(event_resource_type_ : configuration_event_resource_type option)
    ?event_status:(event_status_ : configuration_event_status option)
    ?monitored_resource_ar_n:
      (monitored_resource_ar_n_ : configuration_event_monitored_resource_ar_n option)
    ?account_id:(account_id_ : account_id option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     event_resource_name = event_resource_name_;
     event_detail = event_detail_;
     event_time = event_time_;
     event_resource_type = event_resource_type_;
     event_status = event_status_;
     monitored_resource_ar_n = monitored_resource_ar_n_;
     account_id = account_id_;
     resource_group_name = resource_group_name_;
   }
    : configuration_event)

let make_list_configuration_history_response ?next_token:(next_token_ : pagination_token option)
    ?event_list:(event_list_ : configuration_event_list option) () =
  ({ next_token = next_token_; event_list = event_list_ } : list_configuration_history_response)

let make_list_configuration_history_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option)
    ?event_status:(event_status_ : configuration_event_status option)
    ?end_time:(end_time_ : end_time option) ?start_time:(start_time_ : start_time option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
     event_status = event_status_;
     end_time = end_time_;
     start_time = start_time_;
     resource_group_name = resource_group_name_;
   }
    : list_configuration_history_request)

let make_application_component ?detected_workload:(detected_workload_ : detected_workload option)
    ?monitor:(monitor_ : monitor option) ?tier:(tier_ : tier option)
    ?os_type:(os_type_ : os_type option) ?resource_type:(resource_type_ : resource_type option)
    ?component_remarks:(component_remarks_ : remarks option)
    ?component_name:(component_name_ : component_name option) () =
  ({
     detected_workload = detected_workload_;
     monitor = monitor_;
     tier = tier_;
     os_type = os_type_;
     resource_type = resource_type_;
     component_remarks = component_remarks_;
     component_name = component_name_;
   }
    : application_component)

let make_list_components_response ?next_token:(next_token_ : pagination_token option)
    ?application_component_list:(application_component_list_ : application_component_list option) ()
    =
  ({ next_token = next_token_; application_component_list = application_component_list_ }
    : list_components_response)

let make_list_components_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
     resource_group_name = resource_group_name_;
   }
    : list_components_request)

let make_list_applications_response ?next_token:(next_token_ : pagination_token option)
    ?application_info_list:(application_info_list_ : application_info_list option) () =
  ({ next_token = next_token_; application_info_list = application_info_list_ }
    : list_applications_response)

let make_list_applications_request ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_entities option) () =
  ({ account_id = account_id_; next_token = next_token_; max_results = max_results_ }
    : list_applications_request)

let make_describe_workload_response
    ?workload_configuration:(workload_configuration_ : workload_configuration option)
    ?workload_remarks:(workload_remarks_ : remarks option)
    ?workload_id:(workload_id_ : workload_id option) () =
  ({
     workload_configuration = workload_configuration_;
     workload_remarks = workload_remarks_;
     workload_id = workload_id_;
   }
    : describe_workload_response)

let make_describe_workload_request ?account_id:(account_id_ : account_id option)
    ~workload_id:(workload_id_ : workload_id) ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     workload_id = workload_id_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : describe_workload_request)

let make_describe_problem_observations_response
    ?related_observations:(related_observations_ : related_observations option) () =
  ({ related_observations = related_observations_ } : describe_problem_observations_response)

let make_describe_problem_observations_request ?account_id:(account_id_ : account_id option)
    ~problem_id:(problem_id_ : problem_id) () =
  ({ account_id = account_id_; problem_id = problem_id_ } : describe_problem_observations_request)

let make_describe_problem_response
    ?sns_notification_arn:(sns_notification_arn_ : sns_notification_arn option)
    ?problem:(problem_ : problem option) () =
  ({ sns_notification_arn = sns_notification_arn_; problem = problem_ } : describe_problem_response)

let make_describe_problem_request ?account_id:(account_id_ : account_id option)
    ~problem_id:(problem_id_ : problem_id) () =
  ({ account_id = account_id_; problem_id = problem_id_ } : describe_problem_request)

let make_describe_observation_response ?observation:(observation_ : observation option) () =
  ({ observation = observation_ } : describe_observation_response)

let make_describe_observation_request ?account_id:(account_id_ : account_id option)
    ~observation_id:(observation_id_ : observation_id) () =
  ({ account_id = account_id_; observation_id = observation_id_ } : describe_observation_request)

let make_describe_log_pattern_response ?log_pattern:(log_pattern_ : log_pattern option)
    ?account_id:(account_id_ : account_id option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     log_pattern = log_pattern_;
     account_id = account_id_;
     resource_group_name = resource_group_name_;
   }
    : describe_log_pattern_response)

let make_describe_log_pattern_request ?account_id:(account_id_ : account_id option)
    ~pattern_name:(pattern_name_ : log_pattern_name)
    ~pattern_set_name:(pattern_set_name_ : log_pattern_set_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     pattern_name = pattern_name_;
     pattern_set_name = pattern_set_name_;
     resource_group_name = resource_group_name_;
   }
    : describe_log_pattern_request)

let make_describe_component_configuration_recommendation_response
    ?component_configuration:(component_configuration_ : component_configuration option) () =
  ({ component_configuration = component_configuration_ }
    : describe_component_configuration_recommendation_response)

let make_describe_component_configuration_recommendation_request
    ?recommendation_type:(recommendation_type_ : recommendation_type option)
    ?workload_name:(workload_name_ : workload_name option) ~tier:(tier_ : tier)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     recommendation_type = recommendation_type_;
     workload_name = workload_name_;
     tier = tier_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : describe_component_configuration_recommendation_request)

let make_describe_component_configuration_response
    ?component_configuration:(component_configuration_ : component_configuration option)
    ?tier:(tier_ : tier option) ?monitor:(monitor_ : monitor option) () =
  ({ component_configuration = component_configuration_; tier = tier_; monitor = monitor_ }
    : describe_component_configuration_response)

let make_describe_component_configuration_request ?account_id:(account_id_ : account_id option)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : describe_component_configuration_request)

let make_describe_component_response ?resource_list:(resource_list_ : resource_list option)
    ?application_component:(application_component_ : application_component option) () =
  ({ resource_list = resource_list_; application_component = application_component_ }
    : describe_component_response)

let make_describe_component_request ?account_id:(account_id_ : account_id option)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     account_id = account_id_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : describe_component_request)

let make_describe_application_response
    ?application_info:(application_info_ : application_info option) () =
  ({ application_info = application_info_ } : describe_application_response)

let make_describe_application_request ?account_id:(account_id_ : account_id option)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({ account_id = account_id_; resource_group_name = resource_group_name_ }
    : describe_application_request)

let make_delete_log_pattern_response () = (() : unit)

let make_delete_log_pattern_request ~pattern_name:(pattern_name_ : log_pattern_name)
    ~pattern_set_name:(pattern_set_name_ : log_pattern_set_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     pattern_name = pattern_name_;
     pattern_set_name = pattern_set_name_;
     resource_group_name = resource_group_name_;
   }
    : delete_log_pattern_request)

let make_delete_component_response () = (() : unit)

let make_delete_component_request ~component_name:(component_name_ : custom_component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({ component_name = component_name_; resource_group_name = resource_group_name_ }
    : delete_component_request)

let make_delete_application_response () = (() : unit)

let make_delete_application_request
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({ resource_group_name = resource_group_name_ } : delete_application_request)

let make_create_log_pattern_response
    ?resource_group_name:(resource_group_name_ : resource_group_name option)
    ?log_pattern:(log_pattern_ : log_pattern option) () =
  ({ resource_group_name = resource_group_name_; log_pattern = log_pattern_ }
    : create_log_pattern_response)

let make_create_log_pattern_request ~rank:(rank_ : log_pattern_rank)
    ~pattern:(pattern_ : log_pattern_regex) ~pattern_name:(pattern_name_ : log_pattern_name)
    ~pattern_set_name:(pattern_set_name_ : log_pattern_set_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     rank = rank_;
     pattern = pattern_;
     pattern_name = pattern_name_;
     pattern_set_name = pattern_set_name_;
     resource_group_name = resource_group_name_;
   }
    : create_log_pattern_request)

let make_create_component_response () = (() : unit)

let make_create_component_request ~resource_list:(resource_list_ : resource_list)
    ~component_name:(component_name_ : custom_component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     resource_list = resource_list_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : create_component_request)

let make_create_application_response ?application_info:(application_info_ : application_info option)
    () =
  ({ application_info = application_info_ } : create_application_response)

let make_create_application_request
    ?attach_missing_permission:(attach_missing_permission_ : attach_missing_permission option)
    ?grouping_type:(grouping_type_ : grouping_type option)
    ?auto_create:(auto_create_ : auto_create option)
    ?auto_config_enabled:(auto_config_enabled_ : auto_config_enabled option)
    ?tags:(tags_ : tag_list option)
    ?sns_notification_arn:(sns_notification_arn_ : sns_notification_arn option)
    ?ops_item_sns_topic_arn:(ops_item_sns_topic_arn_ : ops_item_sns_topic_arn option)
    ?cwe_monitor_enabled:(cwe_monitor_enabled_ : cwe_monitor_enabled option)
    ?ops_center_enabled:(ops_center_enabled_ : ops_center_enabled option)
    ?resource_group_name:(resource_group_name_ : resource_group_name option) () =
  ({
     attach_missing_permission = attach_missing_permission_;
     grouping_type = grouping_type_;
     auto_create = auto_create_;
     auto_config_enabled = auto_config_enabled_;
     tags = tags_;
     sns_notification_arn = sns_notification_arn_;
     ops_item_sns_topic_arn = ops_item_sns_topic_arn_;
     cwe_monitor_enabled = cwe_monitor_enabled_;
     ops_center_enabled = ops_center_enabled_;
     resource_group_name = resource_group_name_;
   }
    : create_application_request)

let make_add_workload_response
    ?workload_configuration:(workload_configuration_ : workload_configuration option)
    ?workload_id:(workload_id_ : workload_id option) () =
  ({ workload_configuration = workload_configuration_; workload_id = workload_id_ }
    : add_workload_response)

let make_add_workload_request
    ~workload_configuration:(workload_configuration_ : workload_configuration)
    ~component_name:(component_name_ : component_name)
    ~resource_group_name:(resource_group_name_ : resource_group_name) () =
  ({
     workload_configuration = workload_configuration_;
     component_name = component_name_;
     resource_group_name = resource_group_name_;
   }
    : add_workload_request)
