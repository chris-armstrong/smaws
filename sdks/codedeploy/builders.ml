open Types

let make_tag ?key:(key_ : key option) ?value:(value_ : value option) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_to_on_premises_instances_input ~tags:(tags_ : tag_list)
    ~instance_names:(instance_names_ : instance_name_list) () =
  ({ tags = tags_; instance_names = instance_names_ } : add_tags_to_on_premises_instances_input)

let make_alarm ?name:(name_ : alarm_name option) () = ({ name = name_ } : alarm)

let make_alarm_configuration ?enabled:(enabled_ : boolean_ option)
    ?ignore_poll_alarm_failure:(ignore_poll_alarm_failure_ : boolean_ option)
    ?alarms:(alarms_ : alarm_list option) () =
  ({ enabled = enabled_; ignore_poll_alarm_failure = ignore_poll_alarm_failure_; alarms = alarms_ }
    : alarm_configuration)

let make_app_spec_content ?content:(content_ : raw_string_content option)
    ?sha256:(sha256_ : raw_string_sha256 option) () =
  ({ content = content_; sha256 = sha256_ } : app_spec_content)

let make_application_info ?application_id:(application_id_ : application_id option)
    ?application_name:(application_name_ : application_name option)
    ?create_time:(create_time_ : timestamp option)
    ?linked_to_git_hub:(linked_to_git_hub_ : boolean_ option)
    ?git_hub_account_name:(git_hub_account_name_ : git_hub_account_token_name option)
    ?compute_platform:(compute_platform_ : compute_platform option) () =
  ({
     application_id = application_id_;
     application_name = application_name_;
     create_time = create_time_;
     linked_to_git_hub = linked_to_git_hub_;
     git_hub_account_name = git_hub_account_name_;
     compute_platform = compute_platform_;
   }
    : application_info)

let make_auto_rollback_configuration ?enabled:(enabled_ : boolean_ option)
    ?events:(events_ : auto_rollback_events_list option) () =
  ({ enabled = enabled_; events = events_ } : auto_rollback_configuration)

let make_auto_scaling_group ?name:(name_ : auto_scaling_group_name option)
    ?hook:(hook_ : auto_scaling_group_hook option)
    ?termination_hook:(termination_hook_ : auto_scaling_group_hook option) () =
  ({ name = name_; hook = hook_; termination_hook = termination_hook_ } : auto_scaling_group)

let make_generic_revision_info ?description:(description_ : description option)
    ?deployment_groups:(deployment_groups_ : deployment_groups_list option)
    ?first_used_time:(first_used_time_ : timestamp option)
    ?last_used_time:(last_used_time_ : timestamp option)
    ?register_time:(register_time_ : timestamp option) () =
  ({
     description = description_;
     deployment_groups = deployment_groups_;
     first_used_time = first_used_time_;
     last_used_time = last_used_time_;
     register_time = register_time_;
   }
    : generic_revision_info)

let make_raw_string ?content:(content_ : raw_string_content option)
    ?sha256:(sha256_ : raw_string_sha256 option) () =
  ({ content = content_; sha256 = sha256_ } : raw_string)

let make_git_hub_location ?repository:(repository_ : repository option)
    ?commit_id:(commit_id_ : commit_id option) () =
  ({ repository = repository_; commit_id = commit_id_ } : git_hub_location)

let make_s3_location ?bucket:(bucket_ : s3_bucket option) ?key:(key_ : s3_key option)
    ?bundle_type:(bundle_type_ : bundle_type option) ?version:(version_ : version_id option)
    ?e_tag:(e_tag_ : e_tag option) () =
  ({ bucket = bucket_; key = key_; bundle_type = bundle_type_; version = version_; e_tag = e_tag_ }
    : s3_location)

let make_revision_location ?revision_type:(revision_type_ : revision_location_type option)
    ?s3_location:(s3_location_ : s3_location option)
    ?git_hub_location:(git_hub_location_ : git_hub_location option)
    ?string_:(string__ : raw_string option)
    ?app_spec_content:(app_spec_content_ : app_spec_content option) () =
  ({
     revision_type = revision_type_;
     s3_location = s3_location_;
     git_hub_location = git_hub_location_;
     string_ = string__;
     app_spec_content = app_spec_content_;
   }
    : revision_location)

let make_revision_info ?revision_location:(revision_location_ : revision_location option)
    ?generic_revision_info:(generic_revision_info_ : generic_revision_info option) () =
  ({ revision_location = revision_location_; generic_revision_info = generic_revision_info_ }
    : revision_info)

let make_batch_get_application_revisions_output
    ?application_name:(application_name_ : application_name option)
    ?error_message:(error_message_ : error_message option)
    ?revisions:(revisions_ : revision_info_list option) () =
  ({ application_name = application_name_; error_message = error_message_; revisions = revisions_ }
    : batch_get_application_revisions_output)

let make_batch_get_application_revisions_input
    ~application_name:(application_name_ : application_name)
    ~revisions:(revisions_ : revision_location_list) () =
  ({ application_name = application_name_; revisions = revisions_ }
    : batch_get_application_revisions_input)

let make_batch_get_applications_output
    ?applications_info:(applications_info_ : applications_info_list option) () =
  ({ applications_info = applications_info_ } : batch_get_applications_output)

let make_batch_get_applications_input ~application_names:(application_names_ : applications_list) ()
    =
  ({ application_names = application_names_ } : batch_get_applications_input)

let make_ecs_service ?service_name:(service_name_ : ecs_service_name option)
    ?cluster_name:(cluster_name_ : ecs_cluster_name option) () =
  ({ service_name = service_name_; cluster_name = cluster_name_ } : ecs_service)

let make_tag_filter ?key:(key_ : key option) ?value:(value_ : value option)
    ?type_:(type__ : tag_filter_type option) () =
  ({ key = key_; value = value_; type_ = type__ } : tag_filter)

let make_on_premises_tag_set
    ?on_premises_tag_set_list:(on_premises_tag_set_list_ : on_premises_tag_set_list option) () =
  ({ on_premises_tag_set_list = on_premises_tag_set_list_ } : on_premises_tag_set)

let make_ec2_tag_filter ?key:(key_ : key option) ?value:(value_ : value option)
    ?type_:(type__ : ec2_tag_filter_type option) () =
  ({ key = key_; value = value_; type_ = type__ } : ec2_tag_filter)

let make_ec2_tag_set ?ec2_tag_set_list:(ec2_tag_set_list_ : ec2_tag_set_list option) () =
  ({ ec2_tag_set_list = ec2_tag_set_list_ } : ec2_tag_set)

let make_last_deployment_info ?deployment_id:(deployment_id_ : deployment_id option)
    ?status:(status_ : deployment_status option) ?end_time:(end_time_ : timestamp option)
    ?create_time:(create_time_ : timestamp option) () =
  ({
     deployment_id = deployment_id_;
     status = status_;
     end_time = end_time_;
     create_time = create_time_;
   }
    : last_deployment_info)

let make_traffic_route ?listener_arns:(listener_arns_ : listener_arn_list option) () =
  ({ listener_arns = listener_arns_ } : traffic_route)

let make_target_group_info ?name:(name_ : target_group_name option) () =
  ({ name = name_ } : target_group_info)

let make_target_group_pair_info ?target_groups:(target_groups_ : target_group_info_list option)
    ?prod_traffic_route:(prod_traffic_route_ : traffic_route option)
    ?test_traffic_route:(test_traffic_route_ : traffic_route option) () =
  ({
     target_groups = target_groups_;
     prod_traffic_route = prod_traffic_route_;
     test_traffic_route = test_traffic_route_;
   }
    : target_group_pair_info)

let make_elb_info ?name:(name_ : elb_name option) () = ({ name = name_ } : elb_info)

let make_load_balancer_info ?elb_info_list:(elb_info_list_ : elb_info_list option)
    ?target_group_info_list:(target_group_info_list_ : target_group_info_list option)
    ?target_group_pair_info_list:(target_group_pair_info_list_ : target_group_pair_info_list option)
    () =
  ({
     elb_info_list = elb_info_list_;
     target_group_info_list = target_group_info_list_;
     target_group_pair_info_list = target_group_pair_info_list_;
   }
    : load_balancer_info)

let make_green_fleet_provisioning_option ?action:(action_ : green_fleet_provisioning_action option)
    () =
  ({ action = action_ } : green_fleet_provisioning_option)

let make_deployment_ready_option
    ?action_on_timeout:(action_on_timeout_ : deployment_ready_action option)
    ?wait_time_in_minutes:(wait_time_in_minutes_ : duration option) () =
  ({ action_on_timeout = action_on_timeout_; wait_time_in_minutes = wait_time_in_minutes_ }
    : deployment_ready_option)

let make_blue_instance_termination_option ?action:(action_ : instance_action option)
    ?termination_wait_time_in_minutes:(termination_wait_time_in_minutes_ : duration option) () =
  ({ action = action_; termination_wait_time_in_minutes = termination_wait_time_in_minutes_ }
    : blue_instance_termination_option)

let make_blue_green_deployment_configuration
    ?terminate_blue_instances_on_deployment_success:
      (terminate_blue_instances_on_deployment_success_ : blue_instance_termination_option option)
    ?deployment_ready_option:(deployment_ready_option_ : deployment_ready_option option)
    ?green_fleet_provisioning_option:
      (green_fleet_provisioning_option_ : green_fleet_provisioning_option option) () =
  ({
     terminate_blue_instances_on_deployment_success =
       terminate_blue_instances_on_deployment_success_;
     deployment_ready_option = deployment_ready_option_;
     green_fleet_provisioning_option = green_fleet_provisioning_option_;
   }
    : blue_green_deployment_configuration)

let make_deployment_style ?deployment_type:(deployment_type_ : deployment_type option)
    ?deployment_option:(deployment_option_ : deployment_option option) () =
  ({ deployment_type = deployment_type_; deployment_option = deployment_option_ }
    : deployment_style)

let make_trigger_config ?trigger_name:(trigger_name_ : trigger_name option)
    ?trigger_target_arn:(trigger_target_arn_ : trigger_target_arn option)
    ?trigger_events:(trigger_events_ : trigger_event_type_list option) () =
  ({
     trigger_name = trigger_name_;
     trigger_target_arn = trigger_target_arn_;
     trigger_events = trigger_events_;
   }
    : trigger_config)

let make_deployment_group_info ?application_name:(application_name_ : application_name option)
    ?deployment_group_id:(deployment_group_id_ : deployment_group_id option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?service_role_arn:(service_role_arn_ : role option)
    ?target_revision:(target_revision_ : revision_location option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?last_successful_deployment:(last_successful_deployment_ : last_deployment_info option)
    ?last_attempted_deployment:(last_attempted_deployment_ : last_deployment_info option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?termination_hook_enabled:(termination_hook_enabled_ : boolean_ option) () =
  ({
     application_name = application_name_;
     deployment_group_id = deployment_group_id_;
     deployment_group_name = deployment_group_name_;
     deployment_config_name = deployment_config_name_;
     ec2_tag_filters = ec2_tag_filters_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     auto_scaling_groups = auto_scaling_groups_;
     service_role_arn = service_role_arn_;
     target_revision = target_revision_;
     trigger_configurations = trigger_configurations_;
     alarm_configuration = alarm_configuration_;
     auto_rollback_configuration = auto_rollback_configuration_;
     deployment_style = deployment_style_;
     outdated_instances_strategy = outdated_instances_strategy_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     load_balancer_info = load_balancer_info_;
     last_successful_deployment = last_successful_deployment_;
     last_attempted_deployment = last_attempted_deployment_;
     ec2_tag_set = ec2_tag_set_;
     on_premises_tag_set = on_premises_tag_set_;
     compute_platform = compute_platform_;
     ecs_services = ecs_services_;
     termination_hook_enabled = termination_hook_enabled_;
   }
    : deployment_group_info)

let make_batch_get_deployment_groups_output
    ?deployment_groups_info:(deployment_groups_info_ : deployment_group_info_list option)
    ?error_message:(error_message_ : error_message option) () =
  ({ deployment_groups_info = deployment_groups_info_; error_message = error_message_ }
    : batch_get_deployment_groups_output)

let make_batch_get_deployment_groups_input ~application_name:(application_name_ : application_name)
    ~deployment_group_names:(deployment_group_names_ : deployment_groups_list) () =
  ({ application_name = application_name_; deployment_group_names = deployment_group_names_ }
    : batch_get_deployment_groups_input)

let make_diagnostics ?error_code:(error_code_ : lifecycle_error_code option)
    ?script_name:(script_name_ : script_name option) ?message:(message_ : lifecycle_message option)
    ?log_tail:(log_tail_ : log_tail option) () =
  ({
     error_code = error_code_;
     script_name = script_name_;
     message = message_;
     log_tail = log_tail_;
   }
    : diagnostics)

let make_lifecycle_event ?lifecycle_event_name:(lifecycle_event_name_ : lifecycle_event_name option)
    ?diagnostics:(diagnostics_ : diagnostics option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?status:(status_ : lifecycle_event_status option) () =
  ({
     lifecycle_event_name = lifecycle_event_name_;
     diagnostics = diagnostics_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
   }
    : lifecycle_event)

let make_instance_summary ?deployment_id:(deployment_id_ : deployment_id option)
    ?instance_id:(instance_id_ : instance_id option) ?status:(status_ : instance_status option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?instance_type:(instance_type_ : instance_type option) () =
  ({
     deployment_id = deployment_id_;
     instance_id = instance_id_;
     status = status_;
     last_updated_at = last_updated_at_;
     lifecycle_events = lifecycle_events_;
     instance_type = instance_type_;
   }
    : instance_summary)

let make_batch_get_deployment_instances_output
    ?instances_summary:(instances_summary_ : instance_summary_list option)
    ?error_message:(error_message_ : error_message option) () =
  ({ instances_summary = instances_summary_; error_message = error_message_ }
    : batch_get_deployment_instances_output)

let make_batch_get_deployment_instances_input ~deployment_id:(deployment_id_ : deployment_id)
    ~instance_ids:(instance_ids_ : instances_list) () =
  ({ deployment_id = deployment_id_; instance_ids = instance_ids_ }
    : batch_get_deployment_instances_input)

let make_cloud_formation_target ?deployment_id:(deployment_id_ : deployment_id option)
    ?target_id:(target_id_ : target_id option) ?last_updated_at:(last_updated_at_ : time option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?status:(status_ : target_status option)
    ?resource_type:(resource_type_ : cloud_formation_resource_type option)
    ?target_version_weight:(target_version_weight_ : traffic_weight option) () =
  ({
     deployment_id = deployment_id_;
     target_id = target_id_;
     last_updated_at = last_updated_at_;
     lifecycle_events = lifecycle_events_;
     status = status_;
     resource_type = resource_type_;
     target_version_weight = target_version_weight_;
   }
    : cloud_formation_target)

let make_ecs_task_set ?identifer:(identifer_ : ecs_task_set_identifier option)
    ?desired_count:(desired_count_ : ecs_task_set_count option)
    ?pending_count:(pending_count_ : ecs_task_set_count option)
    ?running_count:(running_count_ : ecs_task_set_count option)
    ?status:(status_ : ecs_task_set_status option)
    ?traffic_weight:(traffic_weight_ : traffic_weight option)
    ?target_group:(target_group_ : target_group_info option)
    ?task_set_label:(task_set_label_ : target_label option) () =
  ({
     identifer = identifer_;
     desired_count = desired_count_;
     pending_count = pending_count_;
     running_count = running_count_;
     status = status_;
     traffic_weight = traffic_weight_;
     target_group = target_group_;
     task_set_label = task_set_label_;
   }
    : ecs_task_set)

let make_ecs_target ?deployment_id:(deployment_id_ : deployment_id option)
    ?target_id:(target_id_ : target_id option) ?target_arn:(target_arn_ : target_arn option)
    ?last_updated_at:(last_updated_at_ : time option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?status:(status_ : target_status option)
    ?task_sets_info:(task_sets_info_ : ecs_task_set_list option) () =
  ({
     deployment_id = deployment_id_;
     target_id = target_id_;
     target_arn = target_arn_;
     last_updated_at = last_updated_at_;
     lifecycle_events = lifecycle_events_;
     status = status_;
     task_sets_info = task_sets_info_;
   }
    : ecs_target)

let make_lambda_function_info ?function_name:(function_name_ : lambda_function_name option)
    ?function_alias:(function_alias_ : lambda_function_alias option)
    ?current_version:(current_version_ : version option)
    ?target_version:(target_version_ : version option)
    ?target_version_weight:(target_version_weight_ : traffic_weight option) () =
  ({
     function_name = function_name_;
     function_alias = function_alias_;
     current_version = current_version_;
     target_version = target_version_;
     target_version_weight = target_version_weight_;
   }
    : lambda_function_info)

let make_lambda_target ?deployment_id:(deployment_id_ : deployment_id option)
    ?target_id:(target_id_ : target_id option) ?target_arn:(target_arn_ : target_arn option)
    ?status:(status_ : target_status option) ?last_updated_at:(last_updated_at_ : time option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?lambda_function_info:(lambda_function_info_ : lambda_function_info option) () =
  ({
     deployment_id = deployment_id_;
     target_id = target_id_;
     target_arn = target_arn_;
     status = status_;
     last_updated_at = last_updated_at_;
     lifecycle_events = lifecycle_events_;
     lambda_function_info = lambda_function_info_;
   }
    : lambda_target)

let make_instance_target ?deployment_id:(deployment_id_ : deployment_id option)
    ?target_id:(target_id_ : target_id option) ?target_arn:(target_arn_ : target_arn option)
    ?status:(status_ : target_status option) ?last_updated_at:(last_updated_at_ : time option)
    ?lifecycle_events:(lifecycle_events_ : lifecycle_event_list option)
    ?instance_label:(instance_label_ : target_label option) () =
  ({
     deployment_id = deployment_id_;
     target_id = target_id_;
     target_arn = target_arn_;
     status = status_;
     last_updated_at = last_updated_at_;
     lifecycle_events = lifecycle_events_;
     instance_label = instance_label_;
   }
    : instance_target)

let make_deployment_target
    ?deployment_target_type:(deployment_target_type_ : deployment_target_type option)
    ?instance_target:(instance_target_ : instance_target option)
    ?lambda_target:(lambda_target_ : lambda_target option)
    ?ecs_target:(ecs_target_ : ecs_target option)
    ?cloud_formation_target:(cloud_formation_target_ : cloud_formation_target option) () =
  ({
     deployment_target_type = deployment_target_type_;
     instance_target = instance_target_;
     lambda_target = lambda_target_;
     ecs_target = ecs_target_;
     cloud_formation_target = cloud_formation_target_;
   }
    : deployment_target)

let make_batch_get_deployment_targets_output
    ?deployment_targets:(deployment_targets_ : deployment_target_list option) () =
  ({ deployment_targets = deployment_targets_ } : batch_get_deployment_targets_output)

let make_batch_get_deployment_targets_input ~deployment_id:(deployment_id_ : deployment_id)
    ~target_ids:(target_ids_ : target_id_list) () =
  ({ deployment_id = deployment_id_; target_ids = target_ids_ }
    : batch_get_deployment_targets_input)

let make_related_deployments
    ?auto_update_outdated_instances_root_deployment_id:
      (auto_update_outdated_instances_root_deployment_id_ : deployment_id option)
    ?auto_update_outdated_instances_deployment_ids:
      (auto_update_outdated_instances_deployment_ids_ : deployments_list option) () =
  ({
     auto_update_outdated_instances_root_deployment_id =
       auto_update_outdated_instances_root_deployment_id_;
     auto_update_outdated_instances_deployment_ids = auto_update_outdated_instances_deployment_ids_;
   }
    : related_deployments)

let make_target_instances ?tag_filters:(tag_filters_ : ec2_tag_filter_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option) () =
  ({
     tag_filters = tag_filters_;
     auto_scaling_groups = auto_scaling_groups_;
     ec2_tag_set = ec2_tag_set_;
   }
    : target_instances)

let make_rollback_info ?rollback_deployment_id:(rollback_deployment_id_ : deployment_id option)
    ?rollback_triggering_deployment_id:(rollback_triggering_deployment_id_ : deployment_id option)
    ?rollback_message:(rollback_message_ : description option) () =
  ({
     rollback_deployment_id = rollback_deployment_id_;
     rollback_triggering_deployment_id = rollback_triggering_deployment_id_;
     rollback_message = rollback_message_;
   }
    : rollback_info)

let make_deployment_overview ?pending:(pending_ : instance_count option)
    ?in_progress:(in_progress_ : instance_count option)
    ?succeeded:(succeeded_ : instance_count option) ?failed:(failed_ : instance_count option)
    ?skipped:(skipped_ : instance_count option) ?ready:(ready_ : instance_count option) () =
  ({
     pending = pending_;
     in_progress = in_progress_;
     succeeded = succeeded_;
     failed = failed_;
     skipped = skipped_;
     ready = ready_;
   }
    : deployment_overview)

let make_error_information ?code:(code_ : error_code option)
    ?message:(message_ : error_message option) () =
  ({ code = code_; message = message_ } : error_information)

let make_deployment_info ?application_name:(application_name_ : application_name option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ?previous_revision:(previous_revision_ : revision_location option)
    ?revision:(revision_ : revision_location option) ?status:(status_ : deployment_status option)
    ?error_information:(error_information_ : error_information option)
    ?create_time:(create_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?complete_time:(complete_time_ : timestamp option)
    ?deployment_overview:(deployment_overview_ : deployment_overview option)
    ?description:(description_ : description option) ?creator:(creator_ : deployment_creator option)
    ?ignore_application_stop_failures:(ignore_application_stop_failures_ : boolean_ option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?update_outdated_instances_only:(update_outdated_instances_only_ : boolean_ option)
    ?rollback_info:(rollback_info_ : rollback_info option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?target_instances:(target_instances_ : target_instances option)
    ?instance_termination_wait_time_started:
      (instance_termination_wait_time_started_ : boolean_ option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?additional_deployment_status_info:
      (additional_deployment_status_info_ : additional_deployment_status_info option)
    ?file_exists_behavior:(file_exists_behavior_ : file_exists_behavior option)
    ?deployment_status_messages:
      (deployment_status_messages_ : deployment_status_message_list option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?external_id:(external_id_ : external_id option)
    ?related_deployments:(related_deployments_ : related_deployments option)
    ?override_alarm_configuration:(override_alarm_configuration_ : alarm_configuration option) () =
  ({
     application_name = application_name_;
     deployment_group_name = deployment_group_name_;
     deployment_config_name = deployment_config_name_;
     deployment_id = deployment_id_;
     previous_revision = previous_revision_;
     revision = revision_;
     status = status_;
     error_information = error_information_;
     create_time = create_time_;
     start_time = start_time_;
     complete_time = complete_time_;
     deployment_overview = deployment_overview_;
     description = description_;
     creator = creator_;
     ignore_application_stop_failures = ignore_application_stop_failures_;
     auto_rollback_configuration = auto_rollback_configuration_;
     update_outdated_instances_only = update_outdated_instances_only_;
     rollback_info = rollback_info_;
     deployment_style = deployment_style_;
     target_instances = target_instances_;
     instance_termination_wait_time_started = instance_termination_wait_time_started_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     load_balancer_info = load_balancer_info_;
     additional_deployment_status_info = additional_deployment_status_info_;
     file_exists_behavior = file_exists_behavior_;
     deployment_status_messages = deployment_status_messages_;
     compute_platform = compute_platform_;
     external_id = external_id_;
     related_deployments = related_deployments_;
     override_alarm_configuration = override_alarm_configuration_;
   }
    : deployment_info)

let make_batch_get_deployments_output
    ?deployments_info:(deployments_info_ : deployments_info_list option) () =
  ({ deployments_info = deployments_info_ } : batch_get_deployments_output)

let make_batch_get_deployments_input ~deployment_ids:(deployment_ids_ : deployments_list) () =
  ({ deployment_ids = deployment_ids_ } : batch_get_deployments_input)

let make_instance_info ?instance_name:(instance_name_ : instance_name option)
    ?iam_session_arn:(iam_session_arn_ : iam_session_arn option)
    ?iam_user_arn:(iam_user_arn_ : iam_user_arn option)
    ?instance_arn:(instance_arn_ : instance_arn option)
    ?register_time:(register_time_ : timestamp option)
    ?deregister_time:(deregister_time_ : timestamp option) ?tags:(tags_ : tag_list option) () =
  ({
     instance_name = instance_name_;
     iam_session_arn = iam_session_arn_;
     iam_user_arn = iam_user_arn_;
     instance_arn = instance_arn_;
     register_time = register_time_;
     deregister_time = deregister_time_;
     tags = tags_;
   }
    : instance_info)

let make_batch_get_on_premises_instances_output
    ?instance_infos:(instance_infos_ : instance_info_list option) () =
  ({ instance_infos = instance_infos_ } : batch_get_on_premises_instances_output)

let make_batch_get_on_premises_instances_input
    ~instance_names:(instance_names_ : instance_name_list) () =
  ({ instance_names = instance_names_ } : batch_get_on_premises_instances_input)

let make_update_deployment_group_output
    ?hooks_not_cleaned_up:(hooks_not_cleaned_up_ : auto_scaling_group_list option) () =
  ({ hooks_not_cleaned_up = hooks_not_cleaned_up_ } : update_deployment_group_output)

let make_update_deployment_group_input
    ?new_deployment_group_name:(new_deployment_group_name_ : deployment_group_name option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?service_role_arn:(service_role_arn_ : role option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?termination_hook_enabled:(termination_hook_enabled_ : nullable_boolean option)
    ~application_name:(application_name_ : application_name)
    ~current_deployment_group_name:(current_deployment_group_name_ : deployment_group_name) () =
  ({
     application_name = application_name_;
     current_deployment_group_name = current_deployment_group_name_;
     new_deployment_group_name = new_deployment_group_name_;
     deployment_config_name = deployment_config_name_;
     ec2_tag_filters = ec2_tag_filters_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     auto_scaling_groups = auto_scaling_groups_;
     service_role_arn = service_role_arn_;
     trigger_configurations = trigger_configurations_;
     alarm_configuration = alarm_configuration_;
     auto_rollback_configuration = auto_rollback_configuration_;
     outdated_instances_strategy = outdated_instances_strategy_;
     deployment_style = deployment_style_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     load_balancer_info = load_balancer_info_;
     ec2_tag_set = ec2_tag_set_;
     ecs_services = ecs_services_;
     on_premises_tag_set = on_premises_tag_set_;
     termination_hook_enabled = termination_hook_enabled_;
   }
    : update_deployment_group_input)

let make_update_application_input ?application_name:(application_name_ : application_name option)
    ?new_application_name:(new_application_name_ : application_name option) () =
  ({ application_name = application_name_; new_application_name = new_application_name_ }
    : update_application_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_stop_deployment_output ?status:(status_ : stop_status option)
    ?status_message:(status_message_ : message option) () =
  ({ status = status_; status_message = status_message_ } : stop_deployment_output)

let make_stop_deployment_input
    ?auto_rollback_enabled:(auto_rollback_enabled_ : nullable_boolean option)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ deployment_id = deployment_id_; auto_rollback_enabled = auto_rollback_enabled_ }
    : stop_deployment_input)

let make_skip_wait_time_for_instance_termination_input
    ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({ deployment_id = deployment_id_ } : skip_wait_time_for_instance_termination_input)

let make_remove_tags_from_on_premises_instances_input ~tags:(tags_ : tag_list)
    ~instance_names:(instance_names_ : instance_name_list) () =
  ({ tags = tags_; instance_names = instance_names_ }
    : remove_tags_from_on_premises_instances_input)

let make_register_on_premises_instance_input
    ?iam_session_arn:(iam_session_arn_ : iam_session_arn option)
    ?iam_user_arn:(iam_user_arn_ : iam_user_arn option)
    ~instance_name:(instance_name_ : instance_name) () =
  ({
     instance_name = instance_name_;
     iam_session_arn = iam_session_arn_;
     iam_user_arn = iam_user_arn_;
   }
    : register_on_premises_instance_input)

let make_register_application_revision_input ?description:(description_ : description option)
    ~application_name:(application_name_ : application_name)
    ~revision:(revision_ : revision_location) () =
  ({ application_name = application_name_; description = description_; revision = revision_ }
    : register_application_revision_input)

let make_put_lifecycle_event_hook_execution_status_output
    ?lifecycle_event_hook_execution_id:
      (lifecycle_event_hook_execution_id_ : lifecycle_event_hook_execution_id option) () =
  ({ lifecycle_event_hook_execution_id = lifecycle_event_hook_execution_id_ }
    : put_lifecycle_event_hook_execution_status_output)

let make_put_lifecycle_event_hook_execution_status_input
    ?deployment_id:(deployment_id_ : deployment_id option)
    ?lifecycle_event_hook_execution_id:
      (lifecycle_event_hook_execution_id_ : lifecycle_event_hook_execution_id option)
    ?status:(status_ : lifecycle_event_status option) () =
  ({
     deployment_id = deployment_id_;
     lifecycle_event_hook_execution_id = lifecycle_event_hook_execution_id_;
     status = status_;
   }
    : put_lifecycle_event_hook_execution_status_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_; next_token = next_token_ } : list_tags_for_resource_input)

let make_list_on_premises_instances_output
    ?instance_names:(instance_names_ : instance_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ instance_names = instance_names_; next_token = next_token_ }
    : list_on_premises_instances_output)

let make_list_on_premises_instances_input
    ?registration_status:(registration_status_ : registration_status option)
    ?tag_filters:(tag_filters_ : tag_filter_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     registration_status = registration_status_;
     tag_filters = tag_filters_;
     next_token = next_token_;
   }
    : list_on_premises_instances_input)

let make_list_git_hub_account_token_names_output
    ?token_name_list:(token_name_list_ : git_hub_account_token_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ token_name_list = token_name_list_; next_token = next_token_ }
    : list_git_hub_account_token_names_output)

let make_list_git_hub_account_token_names_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_git_hub_account_token_names_input)

let make_list_deployment_targets_output ?target_ids:(target_ids_ : target_id_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ target_ids = target_ids_; next_token = next_token_ } : list_deployment_targets_output)

let make_list_deployment_targets_input ?next_token:(next_token_ : next_token option)
    ?target_filters:(target_filters_ : target_filters option)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ deployment_id = deployment_id_; next_token = next_token_; target_filters = target_filters_ }
    : list_deployment_targets_input)

let make_list_deployments_output ?deployments:(deployments_ : deployments_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ deployments = deployments_; next_token = next_token_ } : list_deployments_output)

let make_time_range ?start:(start_ : timestamp option) ?end_:(end__ : timestamp option) () =
  ({ start = start_; end_ = end__ } : time_range)

let make_list_deployments_input ?application_name:(application_name_ : application_name option)
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?external_id:(external_id_ : external_id option)
    ?include_only_statuses:(include_only_statuses_ : deployment_status_list option)
    ?create_time_range:(create_time_range_ : time_range option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     application_name = application_name_;
     deployment_group_name = deployment_group_name_;
     external_id = external_id_;
     include_only_statuses = include_only_statuses_;
     create_time_range = create_time_range_;
     next_token = next_token_;
   }
    : list_deployments_input)

let make_list_deployment_instances_output ?instances_list:(instances_list_ : instances_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ instances_list = instances_list_; next_token = next_token_ }
    : list_deployment_instances_output)

let make_list_deployment_instances_input ?next_token:(next_token_ : next_token option)
    ?instance_status_filter:(instance_status_filter_ : instance_status_list option)
    ?instance_type_filter:(instance_type_filter_ : instance_type_list option)
    ~deployment_id:(deployment_id_ : deployment_id) () =
  ({
     deployment_id = deployment_id_;
     next_token = next_token_;
     instance_status_filter = instance_status_filter_;
     instance_type_filter = instance_type_filter_;
   }
    : list_deployment_instances_input)

let make_list_deployment_groups_output
    ?application_name:(application_name_ : application_name option)
    ?deployment_groups:(deployment_groups_ : deployment_groups_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     application_name = application_name_;
     deployment_groups = deployment_groups_;
     next_token = next_token_;
   }
    : list_deployment_groups_output)

let make_list_deployment_groups_input ?next_token:(next_token_ : next_token option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; next_token = next_token_ }
    : list_deployment_groups_input)

let make_list_deployment_configs_output
    ?deployment_configs_list:(deployment_configs_list_ : deployment_configs_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ deployment_configs_list = deployment_configs_list_; next_token = next_token_ }
    : list_deployment_configs_output)

let make_list_deployment_configs_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_deployment_configs_input)

let make_list_applications_output ?applications:(applications_ : applications_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ applications = applications_; next_token = next_token_ } : list_applications_output)

let make_list_applications_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_applications_input)

let make_list_application_revisions_output ?revisions:(revisions_ : revision_location_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ revisions = revisions_; next_token = next_token_ } : list_application_revisions_output)

let make_list_application_revisions_input ?sort_by:(sort_by_ : application_revision_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_key option)
    ?deployed:(deployed_ : list_state_filter_action option)
    ?next_token:(next_token_ : next_token option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     s3_bucket = s3_bucket_;
     s3_key_prefix = s3_key_prefix_;
     deployed = deployed_;
     next_token = next_token_;
   }
    : list_application_revisions_input)

let make_get_on_premises_instance_output ?instance_info:(instance_info_ : instance_info option) () =
  ({ instance_info = instance_info_ } : get_on_premises_instance_output)

let make_get_on_premises_instance_input ~instance_name:(instance_name_ : instance_name) () =
  ({ instance_name = instance_name_ } : get_on_premises_instance_input)

let make_get_deployment_target_output
    ?deployment_target:(deployment_target_ : deployment_target option) () =
  ({ deployment_target = deployment_target_ } : get_deployment_target_output)

let make_get_deployment_target_input ~deployment_id:(deployment_id_ : deployment_id)
    ~target_id:(target_id_ : target_id) () =
  ({ deployment_id = deployment_id_; target_id = target_id_ } : get_deployment_target_input)

let make_get_deployment_instance_output
    ?instance_summary:(instance_summary_ : instance_summary option) () =
  ({ instance_summary = instance_summary_ } : get_deployment_instance_output)

let make_get_deployment_instance_input ~deployment_id:(deployment_id_ : deployment_id)
    ~instance_id:(instance_id_ : instance_id) () =
  ({ deployment_id = deployment_id_; instance_id = instance_id_ } : get_deployment_instance_input)

let make_get_deployment_group_output
    ?deployment_group_info:(deployment_group_info_ : deployment_group_info option) () =
  ({ deployment_group_info = deployment_group_info_ } : get_deployment_group_output)

let make_get_deployment_group_input ~application_name:(application_name_ : application_name)
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name) () =
  ({ application_name = application_name_; deployment_group_name = deployment_group_name_ }
    : get_deployment_group_input)

let make_minimum_healthy_hosts_per_zone ?type_:(type__ : minimum_healthy_hosts_per_zone_type option)
    ?value:(value_ : minimum_healthy_hosts_per_zone_value option) () =
  ({ type_ = type__; value = value_ } : minimum_healthy_hosts_per_zone)

let make_zonal_config
    ?first_zone_monitor_duration_in_seconds:
      (first_zone_monitor_duration_in_seconds_ : wait_time_in_seconds option)
    ?monitor_duration_in_seconds:(monitor_duration_in_seconds_ : wait_time_in_seconds option)
    ?minimum_healthy_hosts_per_zone:
      (minimum_healthy_hosts_per_zone_ : minimum_healthy_hosts_per_zone option) () =
  ({
     first_zone_monitor_duration_in_seconds = first_zone_monitor_duration_in_seconds_;
     monitor_duration_in_seconds = monitor_duration_in_seconds_;
     minimum_healthy_hosts_per_zone = minimum_healthy_hosts_per_zone_;
   }
    : zonal_config)

let make_time_based_linear ?linear_percentage:(linear_percentage_ : percentage option)
    ?linear_interval:(linear_interval_ : wait_time_in_mins option) () =
  ({ linear_percentage = linear_percentage_; linear_interval = linear_interval_ }
    : time_based_linear)

let make_time_based_canary ?canary_percentage:(canary_percentage_ : percentage option)
    ?canary_interval:(canary_interval_ : wait_time_in_mins option) () =
  ({ canary_percentage = canary_percentage_; canary_interval = canary_interval_ }
    : time_based_canary)

let make_traffic_routing_config ?type_:(type__ : traffic_routing_type option)
    ?time_based_canary:(time_based_canary_ : time_based_canary option)
    ?time_based_linear:(time_based_linear_ : time_based_linear option) () =
  ({
     type_ = type__;
     time_based_canary = time_based_canary_;
     time_based_linear = time_based_linear_;
   }
    : traffic_routing_config)

let make_minimum_healthy_hosts ?type_:(type__ : minimum_healthy_hosts_type option)
    ?value:(value_ : minimum_healthy_hosts_value option) () =
  ({ type_ = type__; value = value_ } : minimum_healthy_hosts)

let make_deployment_config_info
    ?deployment_config_id:(deployment_config_id_ : deployment_config_id option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?minimum_healthy_hosts:(minimum_healthy_hosts_ : minimum_healthy_hosts option)
    ?create_time:(create_time_ : timestamp option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?traffic_routing_config:(traffic_routing_config_ : traffic_routing_config option)
    ?zonal_config:(zonal_config_ : zonal_config option) () =
  ({
     deployment_config_id = deployment_config_id_;
     deployment_config_name = deployment_config_name_;
     minimum_healthy_hosts = minimum_healthy_hosts_;
     create_time = create_time_;
     compute_platform = compute_platform_;
     traffic_routing_config = traffic_routing_config_;
     zonal_config = zonal_config_;
   }
    : deployment_config_info)

let make_get_deployment_config_output
    ?deployment_config_info:(deployment_config_info_ : deployment_config_info option) () =
  ({ deployment_config_info = deployment_config_info_ } : get_deployment_config_output)

let make_get_deployment_config_input
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({ deployment_config_name = deployment_config_name_ } : get_deployment_config_input)

let make_get_deployment_output ?deployment_info:(deployment_info_ : deployment_info option) () =
  ({ deployment_info = deployment_info_ } : get_deployment_output)

let make_get_deployment_input ~deployment_id:(deployment_id_ : deployment_id) () =
  ({ deployment_id = deployment_id_ } : get_deployment_input)

let make_get_application_revision_output
    ?application_name:(application_name_ : application_name option)
    ?revision:(revision_ : revision_location option)
    ?revision_info:(revision_info_ : generic_revision_info option) () =
  ({ application_name = application_name_; revision = revision_; revision_info = revision_info_ }
    : get_application_revision_output)

let make_get_application_revision_input ~application_name:(application_name_ : application_name)
    ~revision:(revision_ : revision_location) () =
  ({ application_name = application_name_; revision = revision_ } : get_application_revision_input)

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

let make_delete_deployment_group_input ~application_name:(application_name_ : application_name)
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name) () =
  ({ application_name = application_name_; deployment_group_name = deployment_group_name_ }
    : delete_deployment_group_input)

let make_delete_deployment_config_input
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({ deployment_config_name = deployment_config_name_ } : delete_deployment_config_input)

let make_delete_application_input ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_ } : delete_application_input)

let make_create_deployment_group_output
    ?deployment_group_id:(deployment_group_id_ : deployment_group_id option) () =
  ({ deployment_group_id = deployment_group_id_ } : create_deployment_group_output)

let make_create_deployment_group_input
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?ec2_tag_filters:(ec2_tag_filters_ : ec2_tag_filter_list option)
    ?on_premises_instance_tag_filters:(on_premises_instance_tag_filters_ : tag_filter_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_name_list option)
    ?trigger_configurations:(trigger_configurations_ : trigger_config_list option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?outdated_instances_strategy:(outdated_instances_strategy_ : outdated_instances_strategy option)
    ?deployment_style:(deployment_style_ : deployment_style option)
    ?blue_green_deployment_configuration:
      (blue_green_deployment_configuration_ : blue_green_deployment_configuration option)
    ?load_balancer_info:(load_balancer_info_ : load_balancer_info option)
    ?ec2_tag_set:(ec2_tag_set_ : ec2_tag_set option)
    ?ecs_services:(ecs_services_ : ecs_service_list option)
    ?on_premises_tag_set:(on_premises_tag_set_ : on_premises_tag_set option)
    ?tags:(tags_ : tag_list option)
    ?termination_hook_enabled:(termination_hook_enabled_ : nullable_boolean option)
    ~application_name:(application_name_ : application_name)
    ~deployment_group_name:(deployment_group_name_ : deployment_group_name)
    ~service_role_arn:(service_role_arn_ : role) () =
  ({
     application_name = application_name_;
     deployment_group_name = deployment_group_name_;
     deployment_config_name = deployment_config_name_;
     ec2_tag_filters = ec2_tag_filters_;
     on_premises_instance_tag_filters = on_premises_instance_tag_filters_;
     auto_scaling_groups = auto_scaling_groups_;
     service_role_arn = service_role_arn_;
     trigger_configurations = trigger_configurations_;
     alarm_configuration = alarm_configuration_;
     auto_rollback_configuration = auto_rollback_configuration_;
     outdated_instances_strategy = outdated_instances_strategy_;
     deployment_style = deployment_style_;
     blue_green_deployment_configuration = blue_green_deployment_configuration_;
     load_balancer_info = load_balancer_info_;
     ec2_tag_set = ec2_tag_set_;
     ecs_services = ecs_services_;
     on_premises_tag_set = on_premises_tag_set_;
     tags = tags_;
     termination_hook_enabled = termination_hook_enabled_;
   }
    : create_deployment_group_input)

let make_create_deployment_config_output
    ?deployment_config_id:(deployment_config_id_ : deployment_config_id option) () =
  ({ deployment_config_id = deployment_config_id_ } : create_deployment_config_output)

let make_create_deployment_config_input
    ?minimum_healthy_hosts:(minimum_healthy_hosts_ : minimum_healthy_hosts option)
    ?traffic_routing_config:(traffic_routing_config_ : traffic_routing_config option)
    ?compute_platform:(compute_platform_ : compute_platform option)
    ?zonal_config:(zonal_config_ : zonal_config option)
    ~deployment_config_name:(deployment_config_name_ : deployment_config_name) () =
  ({
     deployment_config_name = deployment_config_name_;
     minimum_healthy_hosts = minimum_healthy_hosts_;
     traffic_routing_config = traffic_routing_config_;
     compute_platform = compute_platform_;
     zonal_config = zonal_config_;
   }
    : create_deployment_config_input)

let make_create_deployment_output ?deployment_id:(deployment_id_ : deployment_id option) () =
  ({ deployment_id = deployment_id_ } : create_deployment_output)

let make_create_deployment_input
    ?deployment_group_name:(deployment_group_name_ : deployment_group_name option)
    ?revision:(revision_ : revision_location option)
    ?deployment_config_name:(deployment_config_name_ : deployment_config_name option)
    ?description:(description_ : description option)
    ?ignore_application_stop_failures:(ignore_application_stop_failures_ : boolean_ option)
    ?target_instances:(target_instances_ : target_instances option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_configuration option)
    ?update_outdated_instances_only:(update_outdated_instances_only_ : boolean_ option)
    ?file_exists_behavior:(file_exists_behavior_ : file_exists_behavior option)
    ?override_alarm_configuration:(override_alarm_configuration_ : alarm_configuration option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     deployment_group_name = deployment_group_name_;
     revision = revision_;
     deployment_config_name = deployment_config_name_;
     description = description_;
     ignore_application_stop_failures = ignore_application_stop_failures_;
     target_instances = target_instances_;
     auto_rollback_configuration = auto_rollback_configuration_;
     update_outdated_instances_only = update_outdated_instances_only_;
     file_exists_behavior = file_exists_behavior_;
     override_alarm_configuration = override_alarm_configuration_;
   }
    : create_deployment_input)

let make_create_application_output ?application_id:(application_id_ : application_id option) () =
  ({ application_id = application_id_ } : create_application_output)

let make_create_application_input ?compute_platform:(compute_platform_ : compute_platform option)
    ?tags:(tags_ : tag_list option) ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; compute_platform = compute_platform_; tags = tags_ }
    : create_application_input)

let make_continue_deployment_input ?deployment_id:(deployment_id_ : deployment_id option)
    ?deployment_wait_type:(deployment_wait_type_ : deployment_wait_type option) () =
  ({ deployment_id = deployment_id_; deployment_wait_type = deployment_wait_type_ }
    : continue_deployment_input)
