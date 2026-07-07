open Types

let make_minimum_healthy_hosts_per_zone
    ?value:(value_ : minimum_healthy_hosts_per_zone_value option)
    ?type_:(type__ : minimum_healthy_hosts_per_zone_type option) () =
  ({ value = value_; type_ = type__ } : minimum_healthy_hosts_per_zone)

let make_zonal_config
    ?minimum_healthy_hosts_per_zone:
      (minimum_healthy_hosts_per_zone_ : minimum_healthy_hosts_per_zone option)
    ?monitor_duration_in_seconds:(monitor_duration_in_seconds_ : wait_time_in_seconds option)
    ?first_zone_monitor_duration_in_seconds:
      (first_zone_monitor_duration_in_seconds_ : wait_time_in_seconds option) () =
  ({
     minimum_healthy_hosts_per_zone = minimum_healthy_hosts_per_zone_;
     monitor_duration_in_seconds = monitor_duration_in_seconds_;
     first_zone_monitor_duration_in_seconds = first_zone_monitor_duration_in_seconds_;
   }
    : zonal_config)

let make_auto_scaling_group ?termination_hook:(termination_hook_ : auto_scaling_group_hook option)
    ?hook:(hook_ : auto_scaling_group_hook option) ?name:(name_ : auto_scaling_group_name option) ()
    =
  ({ termination_hook = termination_hook_; hook = hook_; name = name_ } : auto_scaling_group)

let make_update_deployment_group_output
    ?hooks_not_cleaned_up:(hooks_not_cleaned_up_ : auto_scaling_group_list option) () =
  ({ hooks_not_cleaned_up = hooks_not_cleaned_up_ } : update_deployment_group_output)

let make_ec2_tag_filter ?type_:(type__ : ec2_tag_filter_type option) ?value:(value_ : value option)
    ?key:(key_ : key option) () =
  ({ type_ = type__; value = value_; key = key_ } : ec2_tag_filter)

let make_tag_filter ?type_:(type__ : tag_filter_type option) ?value:(value_ : value option)
    ?key:(key_ : key option) () =
  ({ type_ = type__; value = value_; key = key_ } : tag_filter)

let make_trigger_config ?trigger_events:(trigger_events_ : trigger_event_type_list option)
    ?trigger_target_arn:(trigger_target_arn_ : trigger_target_arn option)
    ?trigger_name:(trigger_name_ : trigger_name option) () =
  ({
     trigger_events = trigger_events_;
     trigger_target_arn = trigger_target_arn_;
     trigger_name = trigger_name_;
   }
    : trigger_config)

let make_alarm ?name:(name_ : alarm_name option) () = ({ name = name_ } : alarm)

let make_alarm_configuration ?alarms:(alarms_ : alarm_list option)
    ?ignore_poll_alarm_failure:(ignore_poll_alarm_failure_ : boolean_ option)
    ?enabled:(enabled_ : boolean_ option) () =
  ({ alarms = alarms_; ignore_poll_alarm_failure = ignore_poll_alarm_failure_; enabled = enabled_ }
    : alarm_configuration)

let make_auto_rollback_configuration ?events:(events_ : auto_rollback_events_list option)
    ?enabled:(enabled_ : boolean_ option) () =
  ({ events = events_; enabled = enabled_ } : auto_rollback_configuration)

let make_deployment_style ?deployment_option:(deployment_option_ : deployment_option option)
    ?deployment_type:(deployment_type_ : deployment_type option) () =
  ({ deployment_option = deployment_option_; deployment_type = deployment_type_ }
    : deployment_style)

let make_blue_instance_termination_option
    ?termination_wait_time_in_minutes:(termination_wait_time_in_minutes_ : duration option)
    ?action:(action_ : instance_action option) () =
  ({ termination_wait_time_in_minutes = termination_wait_time_in_minutes_; action = action_ }
    : blue_instance_termination_option)

let make_deployment_ready_option ?wait_time_in_minutes:(wait_time_in_minutes_ : duration option)
    ?action_on_timeout:(action_on_timeout_ : deployment_ready_action option) () =
  ({ wait_time_in_minutes = wait_time_in_minutes_; action_on_timeout = action_on_timeout_ }
    : deployment_ready_option)

let make_green_fleet_provisioning_option ?action:(action_ : green_fleet_provisioning_action option)
    () =
  ({ action = action_ } : green_fleet_provisioning_option)

let make_blue_green_deployment_configuration
    ?green_fleet_provisioning_option:
      (green_fleet_provisioning_option_ : green_fleet_provisioning_option option)
    ?deployment_ready_option:(deployment_ready_option_ : deployment_ready_option option)
    ?terminate_blue_instances_on_deployment_success:
      (terminate_blue_instances_on_deployment_success_ : blue_instance_termination_option option) ()
    =
  ({
     green_fleet_provisioning_option = green_fleet_provisioning_option_;
     deployment_ready_option = deployment_ready_option_;
     terminate_blue_instances_on_deployment_success =
       terminate_blue_instances_on_deployment_success_;
   }
    : blue_green_deployment_configuration)

let make_elb_info ?name:(name_ : elb_name option) () = ({ name = name_ } : elb_info)

let make_target_group_info ?name:(name_ : target_group_name option) () =
  ({ name = name_ } : target_group_info)

let make_traffic_route ?listener_arns:(listener_arns_ : listener_arn_list option) () =
  ({ listener_arns = listener_arns_ } : traffic_route)

let make_target_group_pair_info ?test_traffic_route:(test_traffic_route_ : traffic_route option)
    ?prod_traffic_route:(prod_traffic_route_ : traffic_route option)
    ?target_groups:(target_groups_ : target_group_info_list option) () =
  ({
     test_traffic_route = test_traffic_route_;
     prod_traffic_route = prod_traffic_route_;
     target_groups = target_groups_;
   }
    : target_group_pair_info)

let make_load_balancer_info
    ?target_group_pair_info_list:(target_group_pair_info_list_ : target_group_pair_info_list option)
    ?target_group_info_list:(target_group_info_list_ : target_group_info_list option)
    ?elb_info_list:(elb_info_list_ : elb_info_list option) () =
  ({
     target_group_pair_info_list = target_group_pair_info_list_;
     target_group_info_list = target_group_info_list_;
     elb_info_list = elb_info_list_;
   }
    : load_balancer_info)

let make_ec2_tag_set ?ec2_tag_set_list:(ec2_tag_set_list_ : ec2_tag_set_list option) () =
  ({ ec2_tag_set_list = ec2_tag_set_list_ } : ec2_tag_set)

let make_ecs_service ?cluster_name:(cluster_name_ : ecs_cluster_name option)
    ?service_name:(service_name_ : ecs_service_name option) () =
  ({ cluster_name = cluster_name_; service_name = service_name_ } : ecs_service)

let make_on_premises_tag_set
    ?on_premises_tag_set_list:(on_premises_tag_set_list_ : on_premises_tag_set_list option) () =
  ({ on_premises_tag_set_list = on_premises_tag_set_list_ } : on_premises_tag_set)

let make_update_deployment_group_input
    ?termination_hook_enabled:(termination_hook_enabled_ : nullable_boolean option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?service_role_arn:(service_role_arn_ : role option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?new_deployment_group_name:(new_deployment_group_name_ : deployment_group_name option)
    ~current_deployment_group_name:(current_deployment_group_name_ : deployment_group_name)
    ~application_name:(application_name_ : application_name) () =
  ({
     termination_hook_enabled = termination_hook_enabled_;
     on_premises_tag_set = on_premises_tag_set_;
     ecs_services = ecs_services_;
     ec2_tag_set = ec2_tag_set_;
     load_balancer_info = load_balancer_info_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     deployment_style = deployment_style_;
     outdated_instances_strategy = outdated_instances_strategy_;
     auto_rollback_configuration = auto_rollback_configuration_;
     alarm_configuration = alarm_configuration_;
     trigger_configurations = trigger_configurations_;
     service_role_arn = service_role_arn_;
     auto_scaling_groups = auto_scaling_groups_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     ec2_tag_filters = ec2_tag_filters_;
     deployment_config_name = deployment_config_name_;
     new_deployment_group_name = new_deployment_group_name_;
     current_deployment_group_name = current_deployment_group_name_;
     application_name = application_name_;
   }
    : update_deployment_group_input)

let make_update_application_input
    ?new_application_name:(new_application_name_ : application_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({ new_application_name = new_application_name_; application_name = application_name_ }
    : update_application_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_time_based_canary ?canary_interval:(canary_interval_ : wait_time_in_mins option)
    ?canary_percentage:(canary_percentage_ : percentage option) () =
  ({ canary_interval = canary_interval_; canary_percentage = canary_percentage_ }
    : time_based_canary)

let make_time_based_linear ?linear_interval:(linear_interval_ : wait_time_in_mins option)
    ?linear_percentage:(linear_percentage_ : percentage option) () =
  ({ linear_interval = linear_interval_; linear_percentage = linear_percentage_ }
    : time_based_linear)

let make_traffic_routing_config ?time_based_linear:(time_based_linear_ : time_based_linear option)
    ?time_based_canary:(time_based_canary_ : time_based_canary option)
    ?type_:(type__ : traffic_routing_type option) () =
  ({
     time_based_linear = time_based_linear_;
     time_based_canary = time_based_canary_;
     type_ = type__;
   }
    : traffic_routing_config)

let make_time_range ?end_:(end__ : timestamp option) ?start:(start_ : timestamp option) () =
  ({ end_ = end__; start = start_ } : time_range)

let make_target_instances ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?tag_filters:(tag_filters_ : ec2_tag_filter_list option) () =
  ({
     ec2_tag_set = ec2_tag_set_;
     auto_scaling_groups = auto_scaling_groups_;
     tag_filters = tag_filters_;
   }
    : target_instances)

let make_tag_resource_output () = (() : unit)

let make_tag ?value:(value_ : value option) ?key:(key_ : key option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_input ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_stop_deployment_output ?status_message:(status_message_ : message option)
    ?status:(status_ : stop_status option) () =
  ({ status_message = status_message_; status = status_ } : stop_deployment_output)

let make_stop_deployment_input
    ?auto_rollback_enabled:(auto_rollback_enabled_ : nullable_boolean option)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ auto_rollback_enabled = auto_rollback_enabled_; deployment_id = deployment_id_ }
    : stop_deployment_input)

let make_skip_wait_time_for_instance_termination_input
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({ deployment_id = deployment_id_ } : skip_wait_time_for_instance_termination_input)

let make_s3_location ?e_tag:(e_tag_ : e_tag option) ?version:(version_ : version_id option)
    ?bundle_type:(bundle_type_ : bundle_type option) ?key:(key_ : s3_key option)
    ?bucket:(bucket_ : s3_bucket option) () =
  ({ e_tag = e_tag_; version = version_; bundle_type = bundle_type_; key = key_; bucket = bucket_ }
    : s3_location)

let make_rollback_info ?rollback_message:(rollback_message_ : description option)
    ?rollback_triggering_deployment_id:(rollback_triggering_deployment_id_ : deployment_id option)
    ?rollback_deployment_id:(rollback_deployment_id_ : deployment_id option) () =
  ({
     rollback_message = rollback_message_;
     rollback_triggering_deployment_id = rollback_triggering_deployment_id_;
     rollback_deployment_id = rollback_deployment_id_;
   }
    : rollback_info)

let make_git_hub_location ?commit_id:(commit_id_ : commit_id option)
    ?repository:(repository_ : repository option) () =
  ({ commit_id = commit_id_; repository = repository_ } : git_hub_location)

let make_raw_string ?sha256:(sha256_ : raw_string_sha256 option)
    ?content:(content_ : raw_string_content option) () =
  ({ sha256 = sha256_; content = content_ } : raw_string)

let make_app_spec_content ?sha256:(sha256_ : raw_string_sha256 option)
    ?content:(content_ : raw_string_content option) () =
  ({ sha256 = sha256_; content = content_ } : app_spec_content)

let make_revision_location ?app_spec_content:(app_spec_content_ : app_spec_content option)
    ?string_:(string__ : raw_string option)
    ?git_hub_location:(git_hub_location_ : git_hub_location option)
    ?s3_location:(s3_location_ : s3_location option)
    ?revision_type:(revision_type_ : revision_location_type option) () =
  ({
     app_spec_content = app_spec_content_;
     string_ = string__;
     git_hub_location = git_hub_location_;
     s3_location = s3_location_;
     revision_type = revision_type_;
   }
    : revision_location)

let make_generic_revision_info ?register_time:(register_time_ : timestamp option)
    ?last_used_time:(last_used_time_ : timestamp option)
    ?first_used_time:(first_used_time_ : timestamp option)
    ?deployment_groups:(deployment_groups_ : deployment_groups_list option)
    ?description:(description_ : description option) () =
  ({
     register_time = register_time_;
     last_used_time = last_used_time_;
     first_used_time = first_used_time_;
     deployment_groups = deployment_groups_;
     description = description_;
   }
    : generic_revision_info)

let make_revision_info
    ?generic_revision_info:(generic_revision_info_ : generic_revision_info option)
    ?revision_location:(revision_location_ : revision_location option) () =
  ({ generic_revision_info = generic_revision_info_; revision_location = revision_location_ }
    : revision_info)

let make_remove_tags_from_on_premises_instances_input
    ~instance_names:(instance_names_ : instance_name_list) ~tags:(tags_ : tag_list) () =
  ({ instance_names = instance_names_; tags = tags_ }
    : remove_tags_from_on_premises_instances_input)

let make_related_deployments
    ?auto_update_outdated_instances_deployment_ids:
      (auto_update_outdated_instances_deployment_ids_ : deployments_list option)
    ?auto_update_outdated_instances_root_deployment_id:
      (auto_update_outdated_instances_root_deployment_id_ : deployment_id option) () =
  ({
     auto_update_outdated_instances_deployment_ids = auto_update_outdated_instances_deployment_ids_;
     auto_update_outdated_instances_root_deployment_id =
       auto_update_outdated_instances_root_deployment_id_;
   }
    : related_deployments)

let make_register_on_premises_instance_input ?iam_user_arn:(iam_user_arn_ : iam_user_arn option)
    ?iam_session_arn:(iam_session_arn_ : iam_session_arn option)
    ~instance_name:(instance_name_ : instance_name) () =
  ({
     iam_user_arn = iam_user_arn_;
     iam_session_arn = iam_session_arn_;
     instance_name = instance_name_;
   }
    : register_on_premises_instance_input)

let make_register_application_revision_input ?description:(description_ : description option)
    ~revision:(revision_ : revision_location)
    ~application_name:(application_name_ : application_name) () =
  ({ revision = revision_; description = description_; application_name = application_name_ }
    : register_application_revision_input)

let make_put_lifecycle_event_hook_execution_status_output
    ?lifecycle_event_hook_execution_id:
      (lifecycle_event_hook_execution_id_ : lifecycle_event_hook_execution_id option) () =
  ({ lifecycle_event_hook_execution_id = lifecycle_event_hook_execution_id_ }
    : put_lifecycle_event_hook_execution_status_output)

let make_put_lifecycle_event_hook_execution_status_input
    ?status:(status_ : lifecycle_event_status option)
    ?lifecycle_event_hook_execution_id:
      (lifecycle_event_hook_execution_id_ : lifecycle_event_hook_execution_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     status = status_;
     lifecycle_event_hook_execution_id = lifecycle_event_hook_execution_id_;
     deployment_id = deployment_id_;
   }
    : put_lifecycle_event_hook_execution_status_input)

let make_minimum_healthy_hosts ?value:(value_ : minimum_healthy_hosts_value option)
    ?type_:(type__ : minimum_healthy_hosts_type option) () =
  ({ value = value_; type_ = type__ } : minimum_healthy_hosts)

let make_list_tags_for_resource_output ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ next_token = next_token_; resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_list_on_premises_instances_output ?next_token:(next_token_ : next_token option)
    ?instance_names:(instance_names_ : instance_name_list option) () =
  ({ next_token = next_token_; instance_names = instance_names_ }
    : list_on_premises_instances_output)

let make_list_on_premises_instances_input ?next_token:(next_token_ : next_token option)
    ?tag_filters:(tag_filters_ : tag_filter_list option)
    ?registration_status:(registration_status_ : registration_status option) () =
  ({
     next_token = next_token_;
     tag_filters = tag_filters_;
     registration_status = registration_status_;
   }
    : list_on_premises_instances_input)

let make_list_git_hub_account_token_names_output ?next_token:(next_token_ : next_token option)
    ?token_name_list:(token_name_list_ : git_hub_account_token_name_list option) () =
  ({ next_token = next_token_; token_name_list = token_name_list_ }
    : list_git_hub_account_token_names_output)

let make_list_git_hub_account_token_names_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_git_hub_account_token_names_input)

let make_list_deployments_output ?next_token:(next_token_ : next_token option)
    ?deployments:(deployments_ : deployments_list option) () =
  ({ next_token = next_token_; deployments = deployments_ } : list_deployments_output)

let make_list_deployments_input ?next_token:(next_token_ : next_token option)
    ?create_time_range:(create_time_range_ : time_range option)
    ?include_only_statuses:(include_only_statuses_ : deployment_status_list option)
    ?external_id:(external_id_ : external_id option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     next_token = next_token_;
     create_time_range = create_time_range_;
     include_only_statuses = include_only_statuses_;
     external_id = external_id_;
     deployment_group_name = deployment_group_name_;
     application_name = application_name_;
   }
    : list_deployments_input)

let make_list_deployment_targets_output ?next_token:(next_token_ : next_token option)
    ?target_ids:(target_ids_ : target_id_list option) () =
  ({ next_token = next_token_; target_ids = target_ids_ } : list_deployment_targets_output)

let make_list_deployment_targets_input ?target_filters:(target_filters_ : target_filters option)
    ?next_token:(next_token_ : next_token option) ~deployment_id:(deployment_id_ : deployment_id) ()
    =
  ({ target_filters = target_filters_; next_token = next_token_; deployment_id = deployment_id_ }
    : list_deployment_targets_input)

let make_list_deployment_instances_output ?next_token:(next_token_ : next_token option)
    ?instances_list:(instances_list_ : instances_list option) () =
  ({ next_token = next_token_; instances_list = instances_list_ }
    : list_deployment_instances_output)

let make_list_deployment_instances_input
    ?instance_type_filter:(instance_type_filter_ : instance_type_list option)
    ?instance_status_filter:(instance_status_filter_ : instance_status_list option)
    ?next_token:(next_token_ : next_token option) ~deployment_id:(deployment_id_ : deployment_id) ()
    =
  ({
     instance_type_filter = instance_type_filter_;
     instance_status_filter = instance_status_filter_;
     next_token = next_token_;
     deployment_id = deployment_id_;
   }
    : list_deployment_instances_input)

let make_list_deployment_groups_output ?next_token:(next_token_ : next_token option)
    ?deployment_groups:(deployment_groups_ : deployment_groups_list option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     next_token = next_token_;
     deployment_groups = deployment_groups_;
     application_name = application_name_;
   }
    : list_deployment_groups_output)

let make_list_deployment_groups_input ?next_token:(next_token_ : next_token option)
    ~application_name:(application_name_ : application_name) () =
  ({ next_token = next_token_; application_name = application_name_ }
    : list_deployment_groups_input)

let make_list_deployment_configs_output ?next_token:(next_token_ : next_token option)
    ?deployment_configs_list:(deployment_configs_list_ : deployment_configs_list option) () =
  ({ next_token = next_token_; deployment_configs_list = deployment_configs_list_ }
    : list_deployment_configs_output)

let make_list_deployment_configs_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_deployment_configs_input)

let make_list_applications_output ?next_token:(next_token_ : next_token option)
    ?applications:(applications_ : applications_list option) () =
  ({ next_token = next_token_; applications = applications_ } : list_applications_output)

let make_list_applications_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_applications_input)

let make_list_application_revisions_output ?next_token:(next_token_ : next_token option)
    ?revisions:(revisions_ : revision_location_list option) () =
  ({ next_token = next_token_; revisions = revisions_ } : list_application_revisions_output)

let make_list_application_revisions_input ?next_token:(next_token_ : next_token option)
    ?deployed:(deployed_ : list_state_filter_action option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_key option) ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : application_revision_sort_by option)
    ~application_name:(application_name_ : application_name) () =
  ({
     next_token = next_token_;
     deployed = deployed_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket = s3_bucket_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     application_name = application_name_;
   }
    : list_application_revisions_input)

let make_diagnostics ?log_tail:(log_tail_ : log_tail option)
    ?message:(message_ : lifecycle_message option) ?script_name:(script_name_ : script_name option)
    ?error_code:(error_code_ : lifecycle_error_code option) () =
  ({
     log_tail = log_tail_;
     message = message_;
     script_name = script_name_;
     error_code = error_code_;
   }
    : diagnostics)

let make_lifecycle_event ?status:(status_ : lifecycle_event_status option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?diagnostics:(diagnostics_ : diagnostics option)
    ?lifecycle_event_name:(lifecycle_event_name_ : lifecycle_event_name option) () =
  ({
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     diagnostics = diagnostics_;
     lifecycle_event_name = lifecycle_event_name_;
   }
    : lifecycle_event)

let make_last_deployment_info ?create_time:(create_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?status:(status_ : deployment_status option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     create_time = create_time_;
     end_time = end_time_;
     status = status_;
     deployment_id = deployment_id_;
   }
    : last_deployment_info)

let make_lambda_function_info
    ?target_version_weight:(target_version_weight_ : traffic_weight option)
    ?target_version:(target_version_ : version option)
    ?current_version:(current_version_ : version option)
    ?function_alias:(function_alias_ : lambda_function_alias option)
    ?function_name:(function_name_ : lambda_function_name option) () =
  ({
     target_version_weight = target_version_weight_;
     target_version = target_version_;
     current_version = current_version_;
     function_alias = function_alias_;
     function_name = function_name_;
   }
    : lambda_function_info)

let make_lambda_target ?lambda_function_info:(lambda_function_info_ : lambda_function_info option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?last_updated_at:(last_updated_at_ : time option) ?status:(status_ : target_status option)
    ?target_arn:(target_arn_ : target_arn option) ?target_id:(target_id_ : target_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     lambda_function_info = lambda_function_info_;
     lifecycle_events = lifecycle_events_;
     last_updated_at = last_updated_at_;
     status = status_;
     target_arn = target_arn_;
     target_id = target_id_;
     deployment_id = deployment_id_;
   }
    : lambda_target)

let make_instance_target ?instance_label:(instance_label_ : target_label option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?last_updated_at:(last_updated_at_ : time option) ?status:(status_ : target_status option)
    ?target_arn:(target_arn_ : target_arn option) ?target_id:(target_id_ : target_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     instance_label = instance_label_;
     lifecycle_events = lifecycle_events_;
     last_updated_at = last_updated_at_;
     status = status_;
     target_arn = target_arn_;
     target_id = target_id_;
     deployment_id = deployment_id_;
   }
    : instance_target)

let make_instance_summary ?instance_type:(instance_type_ : instance_type option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?status:(status_ : instance_status option) ?instance_id:(instance_id_ : instance_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     instance_type = instance_type_;
     lifecycle_events = lifecycle_events_;
     last_updated_at = last_updated_at_;
     status = status_;
     instance_id = instance_id_;
     deployment_id = deployment_id_;
   }
    : instance_summary)

let make_instance_info ?tags:(tags_ : tag_list option)
    ?deregister_time:(deregister_time_ : timestamp option)
    ?register_time:(register_time_ : timestamp option)
    ?instance_arn:(instance_arn_ : instance_arn option)
    ?iam_user_arn:(iam_user_arn_ : iam_user_arn option)
    ?iam_session_arn:(iam_session_arn_ : iam_session_arn option)
    ?instance_name:(instance_name_ : instance_name option) () =
  ({
     tags = tags_;
     deregister_time = deregister_time_;
     register_time = register_time_;
     instance_arn = instance_arn_;
     iam_user_arn = iam_user_arn_;
     iam_session_arn = iam_session_arn_;
     instance_name = instance_name_;
   }
    : instance_info)

let make_get_on_premises_instance_output ?instance_info:(instance_info_ : instance_info option) () =
  ({ instance_info = instance_info_ } : get_on_premises_instance_output)

let make_get_on_premises_instance_input ~instance_name:(instance_name_ : instance_name) () =
  ({ instance_name = instance_name_ } : get_on_premises_instance_input)

let make_ecs_task_set ?task_set_label:(task_set_label_ : target_label option)
    ?target_group:(target_group_ : target_group_info option)
    ?traffic_weight:(traffic_weight_ : traffic_weight option)
    ?status:(status_ : ecs_task_set_status option)
    ?running_count:(running_count_ : ecs_task_set_count option)
    ?pending_count:(pending_count_ : ecs_task_set_count option)
    ?desired_count:(desired_count_ : ecs_task_set_count option)
    ?identifer:(identifer_ : ecs_task_set_identifier option) () =
  ({
     task_set_label = task_set_label_;
     target_group = target_group_;
     traffic_weight = traffic_weight_;
     status = status_;
     running_count = running_count_;
     pending_count = pending_count_;
     desired_count = desired_count_;
     identifer = identifer_;
   }
    : ecs_task_set)

let make_ecs_target ?task_sets_info:(task_sets_info_ : ecs_task_set_list option)
    ?status:(status_ : target_status option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?last_updated_at:(last_updated_at_ : time option) ?target_arn:(target_arn_ : target_arn option)
    ?target_id:(target_id_ : target_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     task_sets_info = task_sets_info_;
     status = status_;
     lifecycle_events = lifecycle_events_;
     last_updated_at = last_updated_at_;
     target_arn = target_arn_;
     target_id = target_id_;
     deployment_id = deployment_id_;
   }
    : ecs_target)

let make_cloud_formation_target
    ?target_version_weight:(target_version_weight_ : traffic_weight option)
    ?resource_type:(resource_type_ : cloud_formation_resource_type option)
    ?status:(status_ : target_status option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?last_updated_at:(last_updated_at_ : time option) ?target_id:(target_id_ : target_id option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({
     target_version_weight = target_version_weight_;
     resource_type = resource_type_;
     status = status_;
     lifecycle_events = lifecycle_events_;
     last_updated_at = last_updated_at_;
     target_id = target_id_;
     deployment_id = deployment_id_;
   }
    : cloud_formation_target)

let make_deployment_target
    ?cloud_formation_target:(cloud_formation_target_ : cloud_formation_target option)
    ?ecs_target:(ecs_target_ : ecs_target option)
    ?lambda_target:(lambda_target_ : lambda_target option)
    ?instance_target:(instance_target_ : instance_target option)
    ?deployment_target_type:(deployment_target_type_ : deployment_target_type option) () =
  ({
     cloud_formation_target = cloud_formation_target_;
     ecs_target = ecs_target_;
     lambda_target = lambda_target_;
     instance_target = instance_target_;
     deployment_target_type = deployment_target_type_;
   }
    : deployment_target)

let make_get_deployment_target_output
    ?deployment_target:(deployment_target_ : deployment_target option) () =
  ({ deployment_target = deployment_target_ } : get_deployment_target_output)

let make_get_deployment_target_input ~target_id:(target_id_ : target_id)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ target_id = target_id_; deployment_id = deployment_id_ } : get_deployment_target_input)

let make_error_information ?message:(message_ : error_message option)
    ?code:(code_ : error_code option) () =
  ({ message = message_; code = code_ } : error_information)

let make_deployment_overview ?ready:(ready_ : instance_count option)
    ?skipped:(skipped_ : instance_count option) ?failed:(failed_ : instance_count option)
    ?succeeded:(succeeded_ : instance_count option)
    ?in_progress:(in_progress_ : instance_count option) ?pending:(pending_ : instance_count option)
    () =
  ({
     ready = ready_;
     skipped = skipped_;
     failed = failed_;
     succeeded = succeeded_;
     in_progress = in_progress_;
     pending = pending_;
   }
    : deployment_overview)

let make_deployment_info
    ?override_alarm_configuration:(override_alarm_configuration_ : alarm_configuration option)
    ?related_deployments:(related_deployments_ : related_deployments option)
    ?external_id:(external_id_ : external_id option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?deployment_status_messages:
      (deployment_status_messages_ : deployment_status_message_list option)
    ?file_exists_behavior:(file_exists_behavior_ : file_exists_behavior option)
    ?additional_deployment_status_info:
      (additional_deployment_status_info_ : additional_deployment_status_info option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?instance_termination_wait_time_started:
      (instance_termination_wait_time_started_ : boolean_ option)
    ?target_instances:(target_instances_ : target_instances option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?rollback_info:(rollback_info_ : rollback_info option)
    ?update_outdated_instances_only:(update_outdated_instances_only_ : boolean_ option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?ignore_application_stop_failures:(ignore_application_stop_failures_ : boolean_ option)
    ?creator:(creator_ : deployment_creator option) ?description:(description_ : description option)
    ?deployment_overview:(deployment_overview_ : deployment_overview option)
    ?complete_time:(complete_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?create_time:(create_time_ : timestamp option)
    ?error_information:(error_information_ : error_information option)
    ?status:(status_ : deployment_status option) ?revision:(revision_ : revision_location option)
    ?previous_revision:(previous_revision_ : revision_location option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     override_alarm_configuration = override_alarm_configuration_;
     related_deployments = related_deployments_;
     external_id = external_id_;
     compute_platform = compute_platform_;
     deployment_status_messages = deployment_status_messages_;
     file_exists_behavior = file_exists_behavior_;
     additional_deployment_status_info = additional_deployment_status_info_;
     load_balancer_info = load_balancer_info_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     instance_termination_wait_time_started = instance_termination_wait_time_started_;
     target_instances = target_instances_;
     deployment_style = deployment_style_;
     rollback_info = rollback_info_;
     update_outdated_instances_only = update_outdated_instances_only_;
     auto_rollback_configuration = auto_rollback_configuration_;
     ignore_application_stop_failures = ignore_application_stop_failures_;
     creator = creator_;
     description = description_;
     deployment_overview = deployment_overview_;
     complete_time = complete_time_;
     start_time = start_time_;
     create_time = create_time_;
     error_information = error_information_;
     status = status_;
     revision = revision_;
     previous_revision = previous_revision_;
     deployment_id = deployment_id_;
     deployment_config_name = deployment_config_name_;
     deployment_group_name = deployment_group_name_;
     application_name = application_name_;
   }
    : deployment_info)

let make_get_deployment_output ?deployment_info:(deployment_info_ : deployment_info option) () =
  ({ deployment_info = deployment_info_ } : get_deployment_output)

let make_get_deployment_instance_output
    ?instance_summary:(instance_summary_ : instance_summary option) () =
  ({ instance_summary = instance_summary_ } : get_deployment_instance_output)

let make_get_deployment_instance_input ~instance_id:(instance_id_ : instance_id)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ instance_id = instance_id_; deployment_id = deployment_id_ } : get_deployment_instance_input)

let make_get_deployment_input ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ deployment_id = deployment_id_ } : get_deployment_input)

let make_deployment_group_info
    ?termination_hook_enabled:(termination_hook_enabled_ : boolean_ option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?last_attempted_deployment:(last_attempted_deployment_ : last_deployment_info option)
    ?last_successful_deployment:(last_successful_deployment_ : last_deployment_info option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?target_revision:(target_revision_ : revision_location option)
    ?service_role_arn:(service_role_arn_ : role option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?deployment_group_id:(deployment_group_id_ : deployment_group_id option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     termination_hook_enabled = termination_hook_enabled_;
     ecs_services = ecs_services_;
     compute_platform = compute_platform_;
     on_premises_tag_set = on_premises_tag_set_;
     ec2_tag_set = ec2_tag_set_;
     last_attempted_deployment = last_attempted_deployment_;
     last_successful_deployment = last_successful_deployment_;
     load_balancer_info = load_balancer_info_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     outdated_instances_strategy = outdated_instances_strategy_;
     deployment_style = deployment_style_;
     auto_rollback_configuration = auto_rollback_configuration_;
     alarm_configuration = alarm_configuration_;
     trigger_configurations = trigger_configurations_;
     target_revision = target_revision_;
     service_role_arn = service_role_arn_;
     auto_scaling_groups = auto_scaling_groups_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     ec2_tag_filters = ec2_tag_filters_;
     deployment_config_name = deployment_config_name_;
     deployment_group_name = deployment_group_name_;
     deployment_group_id = deployment_group_id_;
     application_name = application_name_;
   }
    : deployment_group_info)

let make_get_deployment_group_output
    ?deployment_group_info:(deployment_group_info_ : deployment_group_info option) () =
  ({ deployment_group_info = deployment_group_info_ } : get_deployment_group_output)

let make_get_deployment_group_input
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name)
    ~application_name:(application_name_ : application_name) () =
  ({ deployment_group_name = deployment_group_name_; application_name = application_name_ }
    : get_deployment_group_input)

let make_deployment_config_info ?zonal_config:(zonal_config_ : zonal_config option)
    ?traffic_routing_config:(traffic_routing_config_ : traffic_routing_config option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?create_time:(create_time_ : timestamp option)
    ?minimum_healthy_hosts:(minimum_healthy_hosts_ : minimum_healthy_hosts option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?deployment_config_id:(deployment_config_id_ : deployment_config_id option) () =
  ({
     zonal_config = zonal_config_;
     traffic_routing_config = traffic_routing_config_;
     compute_platform = compute_platform_;
     create_time = create_time_;
     minimum_healthy_hosts = minimum_healthy_hosts_;
     deployment_config_name = deployment_config_name_;
     deployment_config_id = deployment_config_id_;
   }
    : deployment_config_info)

let make_get_deployment_config_output
    ?deployment_config_info:(deployment_config_info_ : deployment_config_info option) () =
  ({ deployment_config_info = deployment_config_info_ } : get_deployment_config_output)

let make_get_deployment_config_input
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({ deployment_config_name = deployment_config_name_ } : get_deployment_config_input)

let make_get_application_revision_output
    ?revision_info:(revision_info_ : generic_revision_info option)
    ?revision:(revision_ : revision_location option)
    ?application_name:(application_name_ : application_name option) () =
  ({ revision_info = revision_info_; revision = revision_; application_name = application_name_ }
    : get_application_revision_output)

let make_get_application_revision_input ~revision:(revision_ : revision_location)
    ~application_name:(application_name_ : application_name) () =
  ({ revision = revision_; application_name = application_name_ } : get_application_revision_input)

let make_application_info ?compute_platform:(compute_platform_ : compute_platform option)
    ?git_hub_account_name:(git_hub_account_name_ : git_hub_account_token_name option)
    ?linked_to_git_hub:(linked_to_git_hub_ : boolean_ option)
    ?create_time:(create_time_ : timestamp option)
    ?application_name:(application_name_ : application_name option)
    ?application_id:(application_id_ : application_id option) () =
  ({
     compute_platform = compute_platform_;
     git_hub_account_name = git_hub_account_name_;
     linked_to_git_hub = linked_to_git_hub_;
     create_time = create_time_;
     application_name = application_name_;
     application_id = application_id_;
   }
    : application_info)

let make_get_application_output ?application:(application_ : application_info option) () =
  ({ application = application_ } : get_application_output)

let make_get_application_input ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_ } : get_application_input)

let make_deregister_on_premises_instance_input ~instance_name:(instance_name_ : instance_name) () =
  ({ instance_name = instance_name_ } : deregister_on_premises_instance_input)

let make_delete_resources_by_external_id_output () = (() : unit)

let make_delete_resources_by_external_id_input ?external_id:(external_id_ : external_id option) () =
  ({ external_id = external_id_ } : delete_resources_by_external_id_input)

let make_delete_git_hub_account_token_output
    ?token_name:(token_name_ : git_hub_account_token_name option) () =
  ({ token_name = token_name_ } : delete_git_hub_account_token_output)

let make_delete_git_hub_account_token_input
    ?token_name:(token_name_ : git_hub_account_token_name option) () =
  ({ token_name = token_name_ } : delete_git_hub_account_token_input)

let make_delete_deployment_group_output
    ?hooks_not_cleaned_up:(hooks_not_cleaned_up_ : auto_scaling_group_list option) () =
  ({ hooks_not_cleaned_up = hooks_not_cleaned_up_ } : delete_deployment_group_output)

let make_delete_deployment_group_input
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name)
    ~application_name:(application_name_ : application_name) () =
  ({ deployment_group_name = deployment_group_name_; application_name = application_name_ }
    : delete_deployment_group_input)

let make_delete_deployment_config_input
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({ deployment_config_name = deployment_config_name_ } : delete_deployment_config_input)

let make_delete_application_input ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_ } : delete_application_input)

let make_create_deployment_output ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({ deployment_id = deployment_id_ } : create_deployment_output)

let make_create_deployment_input
    ?override_alarm_configuration:(override_alarm_configuration_ : alarm_configuration option)
    ?file_exists_behavior:(file_exists_behavior_ : file_exists_behavior option)
    ?update_outdated_instances_only:(update_outdated_instances_only_ : boolean_ option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?target_instances:(target_instances_ : target_instances option)
    ?ignore_application_stop_failures:(ignore_application_stop_failures_ : boolean_ option)
    ?description:(description_ : description option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?revision:(revision_ : revision_location option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ~application_name:(application_name_ : application_name) () =
  ({
     override_alarm_configuration = override_alarm_configuration_;
     file_exists_behavior = file_exists_behavior_;
     update_outdated_instances_only = update_outdated_instances_only_;
     auto_rollback_configuration = auto_rollback_configuration_;
     target_instances = target_instances_;
     ignore_application_stop_failures = ignore_application_stop_failures_;
     description = description_;
     deployment_config_name = deployment_config_name_;
     revision = revision_;
     deployment_group_name = deployment_group_name_;
     application_name = application_name_;
   }
    : create_deployment_input)

let make_create_deployment_group_output
    ?deployment_group_id:(deployment_group_id_ : deployment_group_id option) () =
  ({ deployment_group_id = deployment_group_id_ } : create_deployment_group_output)

let make_create_deployment_group_input
    ?termination_hook_enabled:(termination_hook_enabled_ : nullable_boolean option)
    ?tags:(tags_ : tag_list option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ~service_role_arn:(service_role_arn_ : role)
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name)
    ~application_name:(application_name_ : application_name) () =
  ({
     termination_hook_enabled = termination_hook_enabled_;
     tags = tags_;
     on_premises_tag_set = on_premises_tag_set_;
     ecs_services = ecs_services_;
     ec2_tag_set = ec2_tag_set_;
     load_balancer_info = load_balancer_info_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     deployment_style = deployment_style_;
     outdated_instances_strategy = outdated_instances_strategy_;
     auto_rollback_configuration = auto_rollback_configuration_;
     alarm_configuration = alarm_configuration_;
     trigger_configurations = trigger_configurations_;
     service_role_arn = service_role_arn_;
     auto_scaling_groups = auto_scaling_groups_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     ec2_tag_filters = ec2_tag_filters_;
     deployment_config_name = deployment_config_name_;
     deployment_group_name = deployment_group_name_;
     application_name = application_name_;
   }
    : create_deployment_group_input)

let make_create_deployment_config_output
    ?deployment_config_id:(deployment_config_id_ : deployment_config_id option) () =
  ({ deployment_config_id = deployment_config_id_ } : create_deployment_config_output)

let make_create_deployment_config_input ?zonal_config:(zonal_config_ : zonal_config option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?traffic_routing_config:(traffic_routing_config_ : traffic_routing_config option)
    ?minimum_healthy_hosts:(minimum_healthy_hosts_ : minimum_healthy_hosts option)
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({
     zonal_config = zonal_config_;
     compute_platform = compute_platform_;
     traffic_routing_config = traffic_routing_config_;
     minimum_healthy_hosts = minimum_healthy_hosts_;
     deployment_config_name = deployment_config_name_;
   }
    : create_deployment_config_input)

let make_create_application_output ?application_id:(application_id_ : application_id option) () =
  ({ application_id = application_id_ } : create_application_output)

let make_create_application_input ?tags:(tags_ : tag_list option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ~application_name:(application_name_ : application_name) () =
  ({ tags = tags_; compute_platform = compute_platform_; application_name = application_name_ }
    : create_application_input)

let make_continue_deployment_input
    ?deployment_wait_type:(deployment_wait_type_ : deployment_wait_type option)
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({ deployment_wait_type = deployment_wait_type_; deployment_id = deployment_id_ }
    : continue_deployment_input)

let make_batch_get_on_premises_instances_output
    ?instance_infos:(instance_infos_ : instance_info_list option) () =
  ({ instance_infos = instance_infos_ } : batch_get_on_premises_instances_output)

let make_batch_get_on_premises_instances_input
    ~instance_names:(instance_names_ : instance_name_list) () =
  ({ instance_names = instance_names_ } : batch_get_on_premises_instances_input)

let make_batch_get_deployment_targets_output
    ?deployment_targets:(deployment_targets_ : deployment_target_list option) () =
  ({ deployment_targets = deployment_targets_ } : batch_get_deployment_targets_output)

let make_batch_get_deployment_targets_input ~target_ids:(target_ids_ : target_id_list)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ target_ids = target_ids_; deployment_id = deployment_id_ }
    : batch_get_deployment_targets_input)

let make_batch_get_deployments_output
    ?deployments_info:(deployments_info_ : deployments_info_list option) () =
  ({ deployments_info = deployments_info_ } : batch_get_deployments_output)

let make_batch_get_deployments_input ~deployment_ids:(deployment_ids_ : deployments_list) () =
  ({ deployment_ids = deployment_ids_ } : batch_get_deployments_input)

let make_batch_get_deployment_instances_output
    ?error_message:(error_message_ : error_message option)
    ?instances_summary:(instances_summary_ : instance_summary_list option) () =
  ({ error_message = error_message_; instances_summary = instances_summary_ }
    : batch_get_deployment_instances_output)

let make_batch_get_deployment_instances_input ~instance_ids:(instance_ids_ : instances_list)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ instance_ids = instance_ids_; deployment_id = deployment_id_ }
    : batch_get_deployment_instances_input)

let make_batch_get_deployment_groups_output ?error_message:(error_message_ : error_message option)
    ?deployment_groups_info:(deployment_groups_info_ : deployment_group_info_list option) () =
  ({ error_message = error_message_; deployment_groups_info = deployment_groups_info_ }
    : batch_get_deployment_groups_output)

let make_batch_get_deployment_groups_input
    ~deployment_group_names:(deployment_group_names_ : deployment_groups_list)
    ~application_name:(application_name_ : application_name) () =
  ({ deployment_group_names = deployment_group_names_; application_name = application_name_ }
    : batch_get_deployment_groups_input)

let make_batch_get_applications_output
    ?applications_info:(applications_info_ : applications_info_list option) () =
  ({ applications_info = applications_info_ } : batch_get_applications_output)

let make_batch_get_applications_input ~application_names:(application_names_ : applications_list) ()
    =
  ({ application_names = application_names_ } : batch_get_applications_input)

let make_batch_get_application_revisions_output ?revisions:(revisions_ : revision_info_list option)
    ?error_message:(error_message_ : error_message option)
    ?application_name:(application_name_ : application_name option) () =
  ({ revisions = revisions_; error_message = error_message_; application_name = application_name_ }
    : batch_get_application_revisions_output)

let make_batch_get_application_revisions_input ~revisions:(revisions_ : revision_location_list)
    ~application_name:(application_name_ : application_name) () =
  ({ revisions = revisions_; application_name = application_name_ }
    : batch_get_application_revisions_input)

let make_add_tags_to_on_premises_instances_input
    ~instance_names:(instance_names_ : instance_name_list) ~tags:(tags_ : tag_list) () =
  ({ instance_names = instance_names_; tags = tags_ } : add_tags_to_on_premises_instances_input)
