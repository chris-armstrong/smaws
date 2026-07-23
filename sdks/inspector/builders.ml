open Types

let make_failed_item_details ~failure_code:(failure_code_ : failed_item_error_code)
    ~retryable:(retryable_ : bool_) () =
  ({ failure_code = failure_code_; retryable = retryable_ } : failed_item_details)

let make_add_attributes_to_findings_response ~failed_items:(failed_items_ : failed_items) () =
  ({ failed_items = failed_items_ } : add_attributes_to_findings_response)

let make_attribute ?value:(value_ : attribute_value option) ~key:(key_ : attribute_key) () =
  ({ key = key_; value = value_ } : attribute)

let make_add_attributes_to_findings_request
    ~finding_arns:(finding_arns_ : add_remove_attributes_finding_arn_list)
    ~attributes:(attributes_ : user_attribute_list) () =
  ({ finding_arns = finding_arns_; attributes = attributes_ } : add_attributes_to_findings_request)

let make_agent_already_running_assessment ~agent_id:(agent_id_ : agent_id)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ agent_id = agent_id_; assessment_run_arn = assessment_run_arn_ }
    : agent_already_running_assessment)

let make_agent_filter ~agent_healths:(agent_healths_ : agent_health_list)
    ~agent_health_codes:(agent_health_codes_ : agent_health_code_list) () =
  ({ agent_healths = agent_healths_; agent_health_codes = agent_health_codes_ } : agent_filter)

let make_agent_preview ?hostname:(hostname_ : hostname option)
    ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ?agent_health:(agent_health_ : agent_health option)
    ?agent_version:(agent_version_ : agent_version option)
    ?operating_system:(operating_system_ : operating_system option)
    ?kernel_version:(kernel_version_ : kernel_version option)
    ?ipv4_address:(ipv4_address_ : ipv4_address option) ~agent_id:(agent_id_ : agent_id) () =
  ({
     hostname = hostname_;
     agent_id = agent_id_;
     auto_scaling_group = auto_scaling_group_;
     agent_health = agent_health_;
     agent_version = agent_version_;
     operating_system = operating_system_;
     kernel_version = kernel_version_;
     ipv4_address = ipv4_address_;
   }
    : agent_preview)

let make_assessment_run_notification ?message:(message_ : message option)
    ?sns_topic_arn:(sns_topic_arn_ : arn option)
    ?sns_publish_status_code:
      (sns_publish_status_code_ : assessment_run_notification_sns_status_code option)
    ~date:(date_ : timestamp) ~event:(event_ : inspector_event) ~error:(error_ : bool_) () =
  ({
     date = date_;
     event = event_;
     message = message_;
     error = error_;
     sns_topic_arn = sns_topic_arn_;
     sns_publish_status_code = sns_publish_status_code_;
   }
    : assessment_run_notification)

let make_assessment_run_state_change ~state_changed_at:(state_changed_at_ : timestamp)
    ~state:(state_ : assessment_run_state) () =
  ({ state_changed_at = state_changed_at_; state = state_ } : assessment_run_state_change)

let make_assessment_run ?started_at:(started_at_ : timestamp option)
    ?completed_at:(completed_at_ : timestamp option) ~arn:(arn_ : arn)
    ~name:(name_ : assessment_run_name) ~assessment_template_arn:(assessment_template_arn_ : arn)
    ~state:(state_ : assessment_run_state)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~rules_package_arns:(rules_package_arns_ : assessment_rules_package_arn_list)
    ~user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list)
    ~created_at:(created_at_ : timestamp) ~state_changed_at:(state_changed_at_ : timestamp)
    ~data_collected:(data_collected_ : bool_)
    ~state_changes:(state_changes_ : assessment_run_state_change_list)
    ~notifications:(notifications_ : assessment_run_notification_list)
    ~finding_counts:(finding_counts_ : assessment_run_finding_counts) () =
  ({
     arn = arn_;
     name = name_;
     assessment_template_arn = assessment_template_arn_;
     state = state_;
     duration_in_seconds = duration_in_seconds_;
     rules_package_arns = rules_package_arns_;
     user_attributes_for_findings = user_attributes_for_findings_;
     created_at = created_at_;
     started_at = started_at_;
     completed_at = completed_at_;
     state_changed_at = state_changed_at_;
     data_collected = data_collected_;
     state_changes = state_changes_;
     notifications = notifications_;
     finding_counts = finding_counts_;
   }
    : assessment_run)

let make_telemetry_metadata ?data_size:(data_size_ : long option)
    ~message_type:(message_type_ : message_type) ~count:(count_ : long) () =
  ({ message_type = message_type_; count = count_; data_size = data_size_ } : telemetry_metadata)

let make_assessment_run_agent ?agent_health_details:(agent_health_details_ : message option)
    ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ~agent_id:(agent_id_ : agent_id) ~assessment_run_arn:(assessment_run_arn_ : arn)
    ~agent_health:(agent_health_ : agent_health)
    ~agent_health_code:(agent_health_code_ : agent_health_code)
    ~telemetry_metadata:(telemetry_metadata_ : telemetry_metadata_list) () =
  ({
     agent_id = agent_id_;
     assessment_run_arn = assessment_run_arn_;
     agent_health = agent_health_;
     agent_health_code = agent_health_code_;
     agent_health_details = agent_health_details_;
     auto_scaling_group = auto_scaling_group_;
     telemetry_metadata = telemetry_metadata_;
   }
    : assessment_run_agent)

let make_timestamp_range ?begin_date:(begin_date_ : timestamp option)
    ?end_date:(end_date_ : timestamp option) () =
  ({ begin_date = begin_date_; end_date = end_date_ } : timestamp_range)

let make_duration_range ?min_seconds:(min_seconds_ : assessment_run_duration option)
    ?max_seconds:(max_seconds_ : assessment_run_duration option) () =
  ({ min_seconds = min_seconds_; max_seconds = max_seconds_ } : duration_range)

let make_assessment_run_filter ?name_pattern:(name_pattern_ : name_pattern option)
    ?states:(states_ : assessment_run_state_list option)
    ?duration_range:(duration_range_ : duration_range option)
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option)
    ?start_time_range:(start_time_range_ : timestamp_range option)
    ?completion_time_range:(completion_time_range_ : timestamp_range option)
    ?state_change_time_range:(state_change_time_range_ : timestamp_range option) () =
  ({
     name_pattern = name_pattern_;
     states = states_;
     duration_range = duration_range_;
     rules_package_arns = rules_package_arns_;
     start_time_range = start_time_range_;
     completion_time_range = completion_time_range_;
     state_change_time_range = state_change_time_range_;
   }
    : assessment_run_filter)

let make_assessment_target ?resource_group_arn:(resource_group_arn_ : arn option) ~arn:(arn_ : arn)
    ~name:(name_ : assessment_target_name) ~created_at:(created_at_ : timestamp)
    ~updated_at:(updated_at_ : timestamp) () =
  ({
     arn = arn_;
     name = name_;
     resource_group_arn = resource_group_arn_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : assessment_target)

let make_assessment_target_filter
    ?assessment_target_name_pattern:(assessment_target_name_pattern_ : name_pattern option) () =
  ({ assessment_target_name_pattern = assessment_target_name_pattern_ } : assessment_target_filter)

let make_assessment_template ?last_assessment_run_arn:(last_assessment_run_arn_ : arn option)
    ~arn:(arn_ : arn) ~name:(name_ : assessment_template_name)
    ~assessment_target_arn:(assessment_target_arn_ : arn)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~rules_package_arns:(rules_package_arns_ : assessment_template_rules_package_arn_list)
    ~user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list)
    ~assessment_run_count:(assessment_run_count_ : arn_count) ~created_at:(created_at_ : timestamp)
    () =
  ({
     arn = arn_;
     name = name_;
     assessment_target_arn = assessment_target_arn_;
     duration_in_seconds = duration_in_seconds_;
     rules_package_arns = rules_package_arns_;
     user_attributes_for_findings = user_attributes_for_findings_;
     last_assessment_run_arn = last_assessment_run_arn_;
     assessment_run_count = assessment_run_count_;
     created_at = created_at_;
   }
    : assessment_template)

let make_assessment_template_filter ?name_pattern:(name_pattern_ : name_pattern option)
    ?duration_range:(duration_range_ : duration_range option)
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option) () =
  ({
     name_pattern = name_pattern_;
     duration_range = duration_range_;
     rules_package_arns = rules_package_arns_;
   }
    : assessment_template_filter)

let make_security_group ?group_name:(group_name_ : text option) ?group_id:(group_id_ : text option)
    () =
  ({ group_name = group_name_; group_id = group_id_ } : security_group)

let make_private_ip ?private_dns_name:(private_dns_name_ : text option)
    ?private_ip_address:(private_ip_address_ : text option) () =
  ({ private_dns_name = private_dns_name_; private_ip_address = private_ip_address_ } : private_ip)

let make_network_interface ?network_interface_id:(network_interface_id_ : text option)
    ?subnet_id:(subnet_id_ : text option) ?vpc_id:(vpc_id_ : text option)
    ?private_dns_name:(private_dns_name_ : text option)
    ?private_ip_address:(private_ip_address_ : text option)
    ?private_ip_addresses:(private_ip_addresses_ : private_ip_addresses option)
    ?public_dns_name:(public_dns_name_ : text option) ?public_ip:(public_ip_ : text option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option)
    ?security_groups:(security_groups_ : security_groups option) () =
  ({
     network_interface_id = network_interface_id_;
     subnet_id = subnet_id_;
     vpc_id = vpc_id_;
     private_dns_name = private_dns_name_;
     private_ip_address = private_ip_address_;
     private_ip_addresses = private_ip_addresses_;
     public_dns_name = public_dns_name_;
     public_ip = public_ip_;
     ipv6_addresses = ipv6_addresses_;
     security_groups = security_groups_;
   }
    : network_interface)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_asset_attributes ?agent_id:(agent_id_ : agent_id option)
    ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ?ami_id:(ami_id_ : ami_id option) ?hostname:(hostname_ : hostname option)
    ?ipv4_addresses:(ipv4_addresses_ : ipv4_address_list option) ?tags:(tags_ : tags option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ~schema_version:(schema_version_ : numeric_version) () =
  ({
     schema_version = schema_version_;
     agent_id = agent_id_;
     auto_scaling_group = auto_scaling_group_;
     ami_id = ami_id_;
     hostname = hostname_;
     ipv4_addresses = ipv4_addresses_;
     tags = tags_;
     network_interfaces = network_interfaces_;
   }
    : asset_attributes)

let make_create_assessment_target_response ~assessment_target_arn:(assessment_target_arn_ : arn) ()
    =
  ({ assessment_target_arn = assessment_target_arn_ } : create_assessment_target_response)

let make_create_assessment_target_request ?resource_group_arn:(resource_group_arn_ : arn option)
    ~assessment_target_name:(assessment_target_name_ : assessment_target_name) () =
  ({ assessment_target_name = assessment_target_name_; resource_group_arn = resource_group_arn_ }
    : create_assessment_target_request)

let make_create_assessment_template_response
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({ assessment_template_arn = assessment_template_arn_ } : create_assessment_template_response)

let make_create_assessment_template_request
    ?user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list option)
    ~assessment_target_arn:(assessment_target_arn_ : arn)
    ~assessment_template_name:(assessment_template_name_ : assessment_template_name)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~rules_package_arns:(rules_package_arns_ : assessment_template_rules_package_arn_list) () =
  ({
     assessment_target_arn = assessment_target_arn_;
     assessment_template_name = assessment_template_name_;
     duration_in_seconds = duration_in_seconds_;
     rules_package_arns = rules_package_arns_;
     user_attributes_for_findings = user_attributes_for_findings_;
   }
    : create_assessment_template_request)

let make_create_exclusions_preview_response ~preview_token:(preview_token_ : uui_d) () =
  ({ preview_token = preview_token_ } : create_exclusions_preview_response)

let make_create_exclusions_preview_request ~assessment_template_arn:(assessment_template_arn_ : arn)
    () =
  ({ assessment_template_arn = assessment_template_arn_ } : create_exclusions_preview_request)

let make_create_resource_group_response ~resource_group_arn:(resource_group_arn_ : arn) () =
  ({ resource_group_arn = resource_group_arn_ } : create_resource_group_response)

let make_resource_group_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : resource_group_tag)

let make_create_resource_group_request
    ~resource_group_tags:(resource_group_tags_ : resource_group_tags) () =
  ({ resource_group_tags = resource_group_tags_ } : create_resource_group_request)

let make_delete_assessment_run_request ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : delete_assessment_run_request)

let make_delete_assessment_target_request ~assessment_target_arn:(assessment_target_arn_ : arn) () =
  ({ assessment_target_arn = assessment_target_arn_ } : delete_assessment_target_request)

let make_delete_assessment_template_request
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({ assessment_template_arn = assessment_template_arn_ } : delete_assessment_template_request)

let make_describe_assessment_runs_response ~assessment_runs:(assessment_runs_ : assessment_run_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ assessment_runs = assessment_runs_; failed_items = failed_items_ }
    : describe_assessment_runs_response)

let make_describe_assessment_runs_request
    ~assessment_run_arns:(assessment_run_arns_ : batch_describe_arn_list) () =
  ({ assessment_run_arns = assessment_run_arns_ } : describe_assessment_runs_request)

let make_describe_assessment_targets_response
    ~assessment_targets:(assessment_targets_ : assessment_target_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ assessment_targets = assessment_targets_; failed_items = failed_items_ }
    : describe_assessment_targets_response)

let make_describe_assessment_targets_request
    ~assessment_target_arns:(assessment_target_arns_ : batch_describe_arn_list) () =
  ({ assessment_target_arns = assessment_target_arns_ } : describe_assessment_targets_request)

let make_describe_assessment_templates_response
    ~assessment_templates:(assessment_templates_ : assessment_template_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ assessment_templates = assessment_templates_; failed_items = failed_items_ }
    : describe_assessment_templates_response)

let make_describe_assessment_templates_request
    ~assessment_template_arns:(assessment_template_arns_ : batch_describe_arn_list) () =
  ({ assessment_template_arns = assessment_template_arns_ } : describe_assessment_templates_request)

let make_describe_cross_account_access_role_response ~role_arn:(role_arn_ : arn)
    ~valid:(valid_ : bool_) ~registered_at:(registered_at_ : timestamp) () =
  ({ role_arn = role_arn_; valid = valid_; registered_at = registered_at_ }
    : describe_cross_account_access_role_response)

let make_scope ?key:(key_ : scope_type option) ?value:(value_ : scope_value option) () =
  ({ key = key_; value = value_ } : scope)

let make_exclusion ?attributes:(attributes_ : attribute_list option) ~arn:(arn_ : arn)
    ~title:(title_ : text) ~description:(description_ : text)
    ~recommendation:(recommendation_ : text) ~scopes:(scopes_ : scope_list) () =
  ({
     arn = arn_;
     title = title_;
     description = description_;
     recommendation = recommendation_;
     scopes = scopes_;
     attributes = attributes_;
   }
    : exclusion)

let make_describe_exclusions_response ~exclusions:(exclusions_ : exclusion_map)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ exclusions = exclusions_; failed_items = failed_items_ } : describe_exclusions_response)

let make_describe_exclusions_request ?locale:(locale_ : locale option)
    ~exclusion_arns:(exclusion_arns_ : batch_describe_exclusions_arn_list) () =
  ({ exclusion_arns = exclusion_arns_; locale = locale_ } : describe_exclusions_request)

let make_inspector_service_attributes ?assessment_run_arn:(assessment_run_arn_ : arn option)
    ?rules_package_arn:(rules_package_arn_ : arn option)
    ~schema_version:(schema_version_ : numeric_version) () =
  ({
     schema_version = schema_version_;
     assessment_run_arn = assessment_run_arn_;
     rules_package_arn = rules_package_arn_;
   }
    : inspector_service_attributes)

let make_finding ?schema_version:(schema_version_ : numeric_version option)
    ?service:(service_ : service_name option)
    ?service_attributes:(service_attributes_ : inspector_service_attributes option)
    ?asset_type:(asset_type_ : asset_type option)
    ?asset_attributes:(asset_attributes_ : asset_attributes option) ?id:(id_ : finding_id option)
    ?title:(title_ : text option) ?description:(description_ : text option)
    ?recommendation:(recommendation_ : text option) ?severity:(severity_ : severity option)
    ?numeric_severity:(numeric_severity_ : numeric_severity option)
    ?confidence:(confidence_ : ioc_confidence option)
    ?indicator_of_compromise:(indicator_of_compromise_ : bool_ option) ~arn:(arn_ : arn)
    ~attributes:(attributes_ : attribute_list)
    ~user_attributes:(user_attributes_ : user_attribute_list) ~created_at:(created_at_ : timestamp)
    ~updated_at:(updated_at_ : timestamp) () =
  ({
     arn = arn_;
     schema_version = schema_version_;
     service = service_;
     service_attributes = service_attributes_;
     asset_type = asset_type_;
     asset_attributes = asset_attributes_;
     id = id_;
     title = title_;
     description = description_;
     recommendation = recommendation_;
     severity = severity_;
     numeric_severity = numeric_severity_;
     confidence = confidence_;
     indicator_of_compromise = indicator_of_compromise_;
     attributes = attributes_;
     user_attributes = user_attributes_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : finding)

let make_describe_findings_response ~findings:(findings_ : finding_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ findings = findings_; failed_items = failed_items_ } : describe_findings_response)

let make_describe_findings_request ?locale:(locale_ : locale option)
    ~finding_arns:(finding_arns_ : batch_describe_arn_list) () =
  ({ finding_arns = finding_arns_; locale = locale_ } : describe_findings_request)

let make_resource_group ~arn:(arn_ : arn) ~tags:(tags_ : resource_group_tags)
    ~created_at:(created_at_ : timestamp) () =
  ({ arn = arn_; tags = tags_; created_at = created_at_ } : resource_group)

let make_describe_resource_groups_response ~resource_groups:(resource_groups_ : resource_group_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ resource_groups = resource_groups_; failed_items = failed_items_ }
    : describe_resource_groups_response)

let make_describe_resource_groups_request
    ~resource_group_arns:(resource_group_arns_ : batch_describe_arn_list) () =
  ({ resource_group_arns = resource_group_arns_ } : describe_resource_groups_request)

let make_rules_package ?description:(description_ : text option) ~arn:(arn_ : arn)
    ~name:(name_ : rules_package_name) ~version:(version_ : version)
    ~provider:(provider_ : provider_name) () =
  ({
     arn = arn_;
     name = name_;
     version = version_;
     provider = provider_;
     description = description_;
   }
    : rules_package)

let make_describe_rules_packages_response ~rules_packages:(rules_packages_ : rules_package_list)
    ~failed_items:(failed_items_ : failed_items) () =
  ({ rules_packages = rules_packages_; failed_items = failed_items_ }
    : describe_rules_packages_response)

let make_describe_rules_packages_request ?locale:(locale_ : locale option)
    ~rules_package_arns:(rules_package_arns_ : batch_describe_arn_list) () =
  ({ rules_package_arns = rules_package_arns_; locale = locale_ } : describe_rules_packages_request)

let make_event_subscription ~event:(event_ : inspector_event)
    ~subscribed_at:(subscribed_at_ : timestamp) () =
  ({ event = event_; subscribed_at = subscribed_at_ } : event_subscription)

let make_exclusion_preview ?attributes:(attributes_ : attribute_list option) ~title:(title_ : text)
    ~description:(description_ : text) ~recommendation:(recommendation_ : text)
    ~scopes:(scopes_ : scope_list) () =
  ({
     title = title_;
     description = description_;
     recommendation = recommendation_;
     scopes = scopes_;
     attributes = attributes_;
   }
    : exclusion_preview)

let make_finding_filter ?agent_ids:(agent_ids_ : agent_id_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?rule_names:(rule_names_ : rule_name_list option)
    ?severities:(severities_ : severity_list option)
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option)
    ?attributes:(attributes_ : attribute_list option)
    ?user_attributes:(user_attributes_ : attribute_list option)
    ?creation_time_range:(creation_time_range_ : timestamp_range option) () =
  ({
     agent_ids = agent_ids_;
     auto_scaling_groups = auto_scaling_groups_;
     rule_names = rule_names_;
     severities = severities_;
     rules_package_arns = rules_package_arns_;
     attributes = attributes_;
     user_attributes = user_attributes_;
     creation_time_range = creation_time_range_;
   }
    : finding_filter)

let make_get_assessment_report_response ?url:(url_ : url option) ~status:(status_ : report_status)
    () =
  ({ status = status_; url = url_ } : get_assessment_report_response)

let make_get_assessment_report_request ~assessment_run_arn:(assessment_run_arn_ : arn)
    ~report_file_format:(report_file_format_ : report_file_format)
    ~report_type:(report_type_ : report_type) () =
  ({
     assessment_run_arn = assessment_run_arn_;
     report_file_format = report_file_format_;
     report_type = report_type_;
   }
    : get_assessment_report_request)

let make_get_exclusions_preview_response
    ?exclusion_previews:(exclusion_previews_ : exclusion_preview_list option)
    ?next_token:(next_token_ : pagination_token option)
    ~preview_status:(preview_status_ : preview_status) () =
  ({
     preview_status = preview_status_;
     exclusion_previews = exclusion_previews_;
     next_token = next_token_;
   }
    : get_exclusions_preview_response)

let make_get_exclusions_preview_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) ?locale:(locale_ : locale option)
    ~assessment_template_arn:(assessment_template_arn_ : arn)
    ~preview_token:(preview_token_ : uui_d) () =
  ({
     assessment_template_arn = assessment_template_arn_;
     preview_token = preview_token_;
     next_token = next_token_;
     max_results = max_results_;
     locale = locale_;
   }
    : get_exclusions_preview_request)

let make_get_telemetry_metadata_response
    ~telemetry_metadata:(telemetry_metadata_ : telemetry_metadata_list) () =
  ({ telemetry_metadata = telemetry_metadata_ } : get_telemetry_metadata_response)

let make_get_telemetry_metadata_request ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : get_telemetry_metadata_request)

let make_update_assessment_target_request ?resource_group_arn:(resource_group_arn_ : arn option)
    ~assessment_target_arn:(assessment_target_arn_ : arn)
    ~assessment_target_name:(assessment_target_name_ : assessment_target_name) () =
  ({
     assessment_target_arn = assessment_target_arn_;
     assessment_target_name = assessment_target_name_;
     resource_group_arn = resource_group_arn_;
   }
    : update_assessment_target_request)

let make_unsubscribe_from_event_request ~resource_arn:(resource_arn_ : arn)
    ~event:(event_ : inspector_event) ~topic_arn:(topic_arn_ : arn) () =
  ({ resource_arn = resource_arn_; event = event_; topic_arn = topic_arn_ }
    : unsubscribe_from_event_request)

let make_subscribe_to_event_request ~resource_arn:(resource_arn_ : arn)
    ~event:(event_ : inspector_event) ~topic_arn:(topic_arn_ : arn) () =
  ({ resource_arn = resource_arn_; event = event_; topic_arn = topic_arn_ }
    : subscribe_to_event_request)

let make_stop_assessment_run_request ?stop_action:(stop_action_ : stop_action option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_; stop_action = stop_action_ }
    : stop_assessment_run_request)

let make_start_assessment_run_response ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : start_assessment_run_response)

let make_start_assessment_run_request
    ?assessment_run_name:(assessment_run_name_ : assessment_run_name option)
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({
     assessment_template_arn = assessment_template_arn_;
     assessment_run_name = assessment_run_name_;
   }
    : start_assessment_run_request)

let make_set_tags_for_resource_request ?tags:(tags_ : tag_list option)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : set_tags_for_resource_request)

let make_remove_attributes_from_findings_response ~failed_items:(failed_items_ : failed_items) () =
  ({ failed_items = failed_items_ } : remove_attributes_from_findings_response)

let make_remove_attributes_from_findings_request
    ~finding_arns:(finding_arns_ : add_remove_attributes_finding_arn_list)
    ~attribute_keys:(attribute_keys_ : user_attribute_key_list) () =
  ({ finding_arns = finding_arns_; attribute_keys = attribute_keys_ }
    : remove_attributes_from_findings_request)

let make_register_cross_account_access_role_request ~role_arn:(role_arn_ : arn) () =
  ({ role_arn = role_arn_ } : register_cross_account_access_role_request)

let make_preview_agents_response ?next_token:(next_token_ : pagination_token option)
    ~agent_previews:(agent_previews_ : agent_preview_list) () =
  ({ agent_previews = agent_previews_; next_token = next_token_ } : preview_agents_response)

let make_preview_agents_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : preview_agents_max_results option)
    ~preview_agents_arn:(preview_agents_arn_ : arn) () =
  ({
     preview_agents_arn = preview_agents_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : preview_agents_request)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_rules_packages_response ?next_token:(next_token_ : pagination_token option)
    ~rules_package_arns:(rules_package_arns_ : list_returned_arn_list) () =
  ({ rules_package_arns = rules_package_arns_; next_token = next_token_ }
    : list_rules_packages_response)

let make_list_rules_packages_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_rules_packages_request)

let make_list_findings_response ?next_token:(next_token_ : pagination_token option)
    ~finding_arns:(finding_arns_ : list_returned_arn_list) () =
  ({ finding_arns = finding_arns_; next_token = next_token_ } : list_findings_response)

let make_list_findings_request
    ?assessment_run_arns:(assessment_run_arns_ : list_parent_arn_list option)
    ?filter:(filter_ : finding_filter option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) () =
  ({
     assessment_run_arns = assessment_run_arns_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_findings_request)

let make_list_exclusions_response ?next_token:(next_token_ : pagination_token option)
    ~exclusion_arns:(exclusion_arns_ : list_returned_arn_list) () =
  ({ exclusion_arns = exclusion_arns_; next_token = next_token_ } : list_exclusions_response)

let make_list_exclusions_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({
     assessment_run_arn = assessment_run_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_exclusions_request)

let make_subscription ~resource_arn:(resource_arn_ : arn) ~topic_arn:(topic_arn_ : arn)
    ~event_subscriptions:(event_subscriptions_ : event_subscription_list) () =
  ({
     resource_arn = resource_arn_;
     topic_arn = topic_arn_;
     event_subscriptions = event_subscriptions_;
   }
    : subscription)

let make_list_event_subscriptions_response ?next_token:(next_token_ : pagination_token option)
    ~subscriptions:(subscriptions_ : subscription_list) () =
  ({ subscriptions = subscriptions_; next_token = next_token_ } : list_event_subscriptions_response)

let make_list_event_subscriptions_request ?resource_arn:(resource_arn_ : arn option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_event_subscriptions_max_results option) () =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_event_subscriptions_request)

let make_list_assessment_templates_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_template_arns:(assessment_template_arns_ : list_returned_arn_list) () =
  ({ assessment_template_arns = assessment_template_arns_; next_token = next_token_ }
    : list_assessment_templates_response)

let make_list_assessment_templates_request
    ?assessment_target_arns:(assessment_target_arns_ : list_parent_arn_list option)
    ?filter:(filter_ : assessment_template_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) () =
  ({
     assessment_target_arns = assessment_target_arns_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_assessment_templates_request)

let make_list_assessment_targets_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_target_arns:(assessment_target_arns_ : list_returned_arn_list) () =
  ({ assessment_target_arns = assessment_target_arns_; next_token = next_token_ }
    : list_assessment_targets_response)

let make_list_assessment_targets_request ?filter:(filter_ : assessment_target_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_assessment_targets_request)

let make_list_assessment_runs_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_run_arns:(assessment_run_arns_ : list_returned_arn_list) () =
  ({ assessment_run_arns = assessment_run_arns_; next_token = next_token_ }
    : list_assessment_runs_response)

let make_list_assessment_runs_request
    ?assessment_template_arns:(assessment_template_arns_ : list_parent_arn_list option)
    ?filter:(filter_ : assessment_run_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option) () =
  ({
     assessment_template_arns = assessment_template_arns_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_assessment_runs_request)

let make_list_assessment_run_agents_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_run_agents:(assessment_run_agents_ : assessment_run_agent_list) () =
  ({ assessment_run_agents = assessment_run_agents_; next_token = next_token_ }
    : list_assessment_run_agents_response)

let make_list_assessment_run_agents_request ?filter:(filter_ : agent_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_max_results option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({
     assessment_run_arn = assessment_run_arn_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_assessment_run_agents_request)
