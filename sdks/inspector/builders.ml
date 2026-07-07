open Types

let make_attribute ?value:(value_ : attribute_value option) ~key:(key_ : attribute_key) () =
  ({ value = value_; key = key_ } : attribute)

let make_update_assessment_target_request ?resource_group_arn:(resource_group_arn_ : arn option)
    ~assessment_target_name:(assessment_target_name_ : assessment_target_name)
    ~assessment_target_arn:(assessment_target_arn_ : arn) () =
  ({
     resource_group_arn = resource_group_arn_;
     assessment_target_name = assessment_target_name_;
     assessment_target_arn = assessment_target_arn_;
   }
    : update_assessment_target_request)

let make_unsubscribe_from_event_request ~topic_arn:(topic_arn_ : arn)
    ~event:(event_ : inspector_event) ~resource_arn:(resource_arn_ : arn) () =
  ({ topic_arn = topic_arn_; event = event_; resource_arn = resource_arn_ }
    : unsubscribe_from_event_request)

let make_timestamp_range ?end_date:(end_date_ : timestamp option)
    ?begin_date:(begin_date_ : timestamp option) () =
  ({ end_date = end_date_; begin_date = begin_date_ } : timestamp_range)

let make_telemetry_metadata ?data_size:(data_size_ : long option) ~count:(count_ : long)
    ~message_type:(message_type_ : message_type) () =
  ({ data_size = data_size_; count = count_; message_type = message_type_ } : telemetry_metadata)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_event_subscription ~subscribed_at:(subscribed_at_ : timestamp)
    ~event:(event_ : inspector_event) () =
  ({ subscribed_at = subscribed_at_; event = event_ } : event_subscription)

let make_subscription ~event_subscriptions:(event_subscriptions_ : event_subscription_list)
    ~topic_arn:(topic_arn_ : arn) ~resource_arn:(resource_arn_ : arn) () =
  ({
     event_subscriptions = event_subscriptions_;
     topic_arn = topic_arn_;
     resource_arn = resource_arn_;
   }
    : subscription)

let make_subscribe_to_event_request ~topic_arn:(topic_arn_ : arn) ~event:(event_ : inspector_event)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ topic_arn = topic_arn_; event = event_; resource_arn = resource_arn_ }
    : subscribe_to_event_request)

let make_stop_assessment_run_request ?stop_action:(stop_action_ : stop_action option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ stop_action = stop_action_; assessment_run_arn = assessment_run_arn_ }
    : stop_assessment_run_request)

let make_start_assessment_run_response ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : start_assessment_run_response)

let make_start_assessment_run_request
    ?assessment_run_name:(assessment_run_name_ : assessment_run_name option)
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({
     assessment_run_name = assessment_run_name_;
     assessment_template_arn = assessment_template_arn_;
   }
    : start_assessment_run_request)

let make_agent_already_running_assessment ~assessment_run_arn:(assessment_run_arn_ : arn)
    ~agent_id:(agent_id_ : agent_id) () =
  ({ assessment_run_arn = assessment_run_arn_; agent_id = agent_id_ }
    : agent_already_running_assessment)

let make_set_tags_for_resource_request ?tags:(tags_ : tag_list option)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : set_tags_for_resource_request)

let make_security_group ?group_id:(group_id_ : text option) ?group_name:(group_name_ : text option)
    () =
  ({ group_id = group_id_; group_name = group_name_ } : security_group)

let make_scope ?value:(value_ : scope_value option) ?key:(key_ : scope_type option) () =
  ({ value = value_; key = key_ } : scope)

let make_rules_package ?description:(description_ : text option)
    ~provider:(provider_ : provider_name) ~version:(version_ : version)
    ~name:(name_ : rules_package_name) ~arn:(arn_ : arn) () =
  ({
     description = description_;
     provider = provider_;
     version = version_;
     name = name_;
     arn = arn_;
   }
    : rules_package)

let make_resource_group_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : resource_group_tag)

let make_resource_group ~created_at:(created_at_ : timestamp) ~tags:(tags_ : resource_group_tags)
    ~arn:(arn_ : arn) () =
  ({ created_at = created_at_; tags = tags_; arn = arn_ } : resource_group)

let make_failed_item_details ~retryable:(retryable_ : bool_)
    ~failure_code:(failure_code_ : failed_item_error_code) () =
  ({ retryable = retryable_; failure_code = failure_code_ } : failed_item_details)

let make_remove_attributes_from_findings_response ~failed_items:(failed_items_ : failed_items) () =
  ({ failed_items = failed_items_ } : remove_attributes_from_findings_response)

let make_remove_attributes_from_findings_request
    ~attribute_keys:(attribute_keys_ : user_attribute_key_list)
    ~finding_arns:(finding_arns_ : add_remove_attributes_finding_arn_list) () =
  ({ attribute_keys = attribute_keys_; finding_arns = finding_arns_ }
    : remove_attributes_from_findings_request)

let make_register_cross_account_access_role_request ~role_arn:(role_arn_ : arn) () =
  ({ role_arn = role_arn_ } : register_cross_account_access_role_request)

let make_private_ip ?private_ip_address:(private_ip_address_ : text option)
    ?private_dns_name:(private_dns_name_ : text option) () =
  ({ private_ip_address = private_ip_address_; private_dns_name = private_dns_name_ } : private_ip)

let make_agent_preview ?ipv4_address:(ipv4_address_ : ipv4_address option)
    ?kernel_version:(kernel_version_ : kernel_version option)
    ?operating_system:(operating_system_ : operating_system option)
    ?agent_version:(agent_version_ : agent_version option)
    ?agent_health:(agent_health_ : agent_health option)
    ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ?hostname:(hostname_ : hostname option) ~agent_id:(agent_id_ : agent_id) () =
  ({
     ipv4_address = ipv4_address_;
     kernel_version = kernel_version_;
     operating_system = operating_system_;
     agent_version = agent_version_;
     agent_health = agent_health_;
     auto_scaling_group = auto_scaling_group_;
     agent_id = agent_id_;
     hostname = hostname_;
   }
    : agent_preview)

let make_preview_agents_response ?next_token:(next_token_ : pagination_token option)
    ~agent_previews:(agent_previews_ : agent_preview_list) () =
  ({ next_token = next_token_; agent_previews = agent_previews_ } : preview_agents_response)

let make_preview_agents_request ?max_results:(max_results_ : preview_agents_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~preview_agents_arn:(preview_agents_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     preview_agents_arn = preview_agents_arn_;
   }
    : preview_agents_request)

let make_network_interface ?security_groups:(security_groups_ : security_groups option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option) ?public_ip:(public_ip_ : text option)
    ?public_dns_name:(public_dns_name_ : text option)
    ?private_ip_addresses:(private_ip_addresses_ : private_ip_addresses option)
    ?private_ip_address:(private_ip_address_ : text option)
    ?private_dns_name:(private_dns_name_ : text option) ?vpc_id:(vpc_id_ : text option)
    ?subnet_id:(subnet_id_ : text option)
    ?network_interface_id:(network_interface_id_ : text option) () =
  ({
     security_groups = security_groups_;
     ipv6_addresses = ipv6_addresses_;
     public_ip = public_ip_;
     public_dns_name = public_dns_name_;
     private_ip_addresses = private_ip_addresses_;
     private_ip_address = private_ip_address_;
     private_dns_name = private_dns_name_;
     vpc_id = vpc_id_;
     subnet_id = subnet_id_;
     network_interface_id = network_interface_id_;
   }
    : network_interface)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_rules_packages_response ?next_token:(next_token_ : pagination_token option)
    ~rules_package_arns:(rules_package_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; rules_package_arns = rules_package_arns_ }
    : list_rules_packages_response)

let make_list_rules_packages_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_rules_packages_request)

let make_list_findings_response ?next_token:(next_token_ : pagination_token option)
    ~finding_arns:(finding_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; finding_arns = finding_arns_ } : list_findings_response)

let make_finding_filter ?creation_time_range:(creation_time_range_ : timestamp_range option)
    ?user_attributes:(user_attributes_ : attribute_list option)
    ?attributes:(attributes_ : attribute_list option)
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option)
    ?severities:(severities_ : severity_list option)
    ?rule_names:(rule_names_ : rule_name_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?agent_ids:(agent_ids_ : agent_id_list option) () =
  ({
     creation_time_range = creation_time_range_;
     user_attributes = user_attributes_;
     attributes = attributes_;
     rules_package_arns = rules_package_arns_;
     severities = severities_;
     rule_names = rule_names_;
     auto_scaling_groups = auto_scaling_groups_;
     agent_ids = agent_ids_;
   }
    : finding_filter)

let make_list_findings_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option) ?filter:(filter_ : finding_filter option)
    ?assessment_run_arns:(assessment_run_arns_ : list_parent_arn_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     assessment_run_arns = assessment_run_arns_;
   }
    : list_findings_request)

let make_list_exclusions_response ?next_token:(next_token_ : pagination_token option)
    ~exclusion_arns:(exclusion_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; exclusion_arns = exclusion_arns_ } : list_exclusions_response)

let make_list_exclusions_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     assessment_run_arn = assessment_run_arn_;
   }
    : list_exclusions_request)

let make_list_event_subscriptions_response ?next_token:(next_token_ : pagination_token option)
    ~subscriptions:(subscriptions_ : subscription_list) () =
  ({ next_token = next_token_; subscriptions = subscriptions_ } : list_event_subscriptions_response)

let make_list_event_subscriptions_request
    ?max_results:(max_results_ : list_event_subscriptions_max_results option)
    ?next_token:(next_token_ : pagination_token option) ?resource_arn:(resource_arn_ : arn option)
    () =
  ({ max_results = max_results_; next_token = next_token_; resource_arn = resource_arn_ }
    : list_event_subscriptions_request)

let make_list_assessment_templates_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_template_arns:(assessment_template_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; assessment_template_arns = assessment_template_arns_ }
    : list_assessment_templates_response)

let make_duration_range ?max_seconds:(max_seconds_ : assessment_run_duration option)
    ?min_seconds:(min_seconds_ : assessment_run_duration option) () =
  ({ max_seconds = max_seconds_; min_seconds = min_seconds_ } : duration_range)

let make_assessment_template_filter
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option)
    ?duration_range:(duration_range_ : duration_range option)
    ?name_pattern:(name_pattern_ : name_pattern option) () =
  ({
     rules_package_arns = rules_package_arns_;
     duration_range = duration_range_;
     name_pattern = name_pattern_;
   }
    : assessment_template_filter)

let make_list_assessment_templates_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : assessment_template_filter option)
    ?assessment_target_arns:(assessment_target_arns_ : list_parent_arn_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     assessment_target_arns = assessment_target_arns_;
   }
    : list_assessment_templates_request)

let make_list_assessment_targets_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_target_arns:(assessment_target_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; assessment_target_arns = assessment_target_arns_ }
    : list_assessment_targets_response)

let make_assessment_target_filter
    ?assessment_target_name_pattern:(assessment_target_name_pattern_ : name_pattern option) () =
  ({ assessment_target_name_pattern = assessment_target_name_pattern_ } : assessment_target_filter)

let make_list_assessment_targets_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : assessment_target_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_assessment_targets_request)

let make_list_assessment_runs_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_run_arns:(assessment_run_arns_ : list_returned_arn_list) () =
  ({ next_token = next_token_; assessment_run_arns = assessment_run_arns_ }
    : list_assessment_runs_response)

let make_assessment_run_filter
    ?state_change_time_range:(state_change_time_range_ : timestamp_range option)
    ?completion_time_range:(completion_time_range_ : timestamp_range option)
    ?start_time_range:(start_time_range_ : timestamp_range option)
    ?rules_package_arns:(rules_package_arns_ : filter_rules_package_arn_list option)
    ?duration_range:(duration_range_ : duration_range option)
    ?states:(states_ : assessment_run_state_list option)
    ?name_pattern:(name_pattern_ : name_pattern option) () =
  ({
     state_change_time_range = state_change_time_range_;
     completion_time_range = completion_time_range_;
     start_time_range = start_time_range_;
     rules_package_arns = rules_package_arns_;
     duration_range = duration_range_;
     states = states_;
     name_pattern = name_pattern_;
   }
    : assessment_run_filter)

let make_list_assessment_runs_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : assessment_run_filter option)
    ?assessment_template_arns:(assessment_template_arns_ : list_parent_arn_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     assessment_template_arns = assessment_template_arns_;
   }
    : list_assessment_runs_request)

let make_assessment_run_agent ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ?agent_health_details:(agent_health_details_ : message option)
    ~telemetry_metadata:(telemetry_metadata_ : telemetry_metadata_list)
    ~agent_health_code:(agent_health_code_ : agent_health_code)
    ~agent_health:(agent_health_ : agent_health) ~assessment_run_arn:(assessment_run_arn_ : arn)
    ~agent_id:(agent_id_ : agent_id) () =
  ({
     telemetry_metadata = telemetry_metadata_;
     auto_scaling_group = auto_scaling_group_;
     agent_health_details = agent_health_details_;
     agent_health_code = agent_health_code_;
     agent_health = agent_health_;
     assessment_run_arn = assessment_run_arn_;
     agent_id = agent_id_;
   }
    : assessment_run_agent)

let make_list_assessment_run_agents_response ?next_token:(next_token_ : pagination_token option)
    ~assessment_run_agents:(assessment_run_agents_ : assessment_run_agent_list) () =
  ({ next_token = next_token_; assessment_run_agents = assessment_run_agents_ }
    : list_assessment_run_agents_response)

let make_agent_filter ~agent_health_codes:(agent_health_codes_ : agent_health_code_list)
    ~agent_healths:(agent_healths_ : agent_health_list) () =
  ({ agent_health_codes = agent_health_codes_; agent_healths = agent_healths_ } : agent_filter)

let make_list_assessment_run_agents_request ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option) ?filter:(filter_ : agent_filter option)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     assessment_run_arn = assessment_run_arn_;
   }
    : list_assessment_run_agents_request)

let make_inspector_service_attributes ?rules_package_arn:(rules_package_arn_ : arn option)
    ?assessment_run_arn:(assessment_run_arn_ : arn option)
    ~schema_version:(schema_version_ : numeric_version) () =
  ({
     rules_package_arn = rules_package_arn_;
     assessment_run_arn = assessment_run_arn_;
     schema_version = schema_version_;
   }
    : inspector_service_attributes)

let make_get_telemetry_metadata_response
    ~telemetry_metadata:(telemetry_metadata_ : telemetry_metadata_list) () =
  ({ telemetry_metadata = telemetry_metadata_ } : get_telemetry_metadata_response)

let make_get_telemetry_metadata_request ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : get_telemetry_metadata_request)

let make_exclusion_preview ?attributes:(attributes_ : attribute_list option)
    ~scopes:(scopes_ : scope_list) ~recommendation:(recommendation_ : text)
    ~description:(description_ : text) ~title:(title_ : text) () =
  ({
     attributes = attributes_;
     scopes = scopes_;
     recommendation = recommendation_;
     description = description_;
     title = title_;
   }
    : exclusion_preview)

let make_get_exclusions_preview_response ?next_token:(next_token_ : pagination_token option)
    ?exclusion_previews:(exclusion_previews_ : exclusion_preview_list option)
    ~preview_status:(preview_status_ : preview_status) () =
  ({
     next_token = next_token_;
     exclusion_previews = exclusion_previews_;
     preview_status = preview_status_;
   }
    : get_exclusions_preview_response)

let make_get_exclusions_preview_request ?locale:(locale_ : locale option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : pagination_token option) ~preview_token:(preview_token_ : uui_d)
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({
     locale = locale_;
     max_results = max_results_;
     next_token = next_token_;
     preview_token = preview_token_;
     assessment_template_arn = assessment_template_arn_;
   }
    : get_exclusions_preview_request)

let make_get_assessment_report_response ?url:(url_ : url option) ~status:(status_ : report_status)
    () =
  ({ url = url_; status = status_ } : get_assessment_report_response)

let make_get_assessment_report_request ~report_type:(report_type_ : report_type)
    ~report_file_format:(report_file_format_ : report_file_format)
    ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({
     report_type = report_type_;
     report_file_format = report_file_format_;
     assessment_run_arn = assessment_run_arn_;
   }
    : get_assessment_report_request)

let make_describe_rules_packages_response ~failed_items:(failed_items_ : failed_items)
    ~rules_packages:(rules_packages_ : rules_package_list) () =
  ({ failed_items = failed_items_; rules_packages = rules_packages_ }
    : describe_rules_packages_response)

let make_describe_rules_packages_request ?locale:(locale_ : locale option)
    ~rules_package_arns:(rules_package_arns_ : batch_describe_arn_list) () =
  ({ locale = locale_; rules_package_arns = rules_package_arns_ } : describe_rules_packages_request)

let make_describe_resource_groups_response ~failed_items:(failed_items_ : failed_items)
    ~resource_groups:(resource_groups_ : resource_group_list) () =
  ({ failed_items = failed_items_; resource_groups = resource_groups_ }
    : describe_resource_groups_response)

let make_describe_resource_groups_request
    ~resource_group_arns:(resource_group_arns_ : batch_describe_arn_list) () =
  ({ resource_group_arns = resource_group_arns_ } : describe_resource_groups_request)

let make_asset_attributes ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?tags:(tags_ : tags option) ?ipv4_addresses:(ipv4_addresses_ : ipv4_address_list option)
    ?hostname:(hostname_ : hostname option) ?ami_id:(ami_id_ : ami_id option)
    ?auto_scaling_group:(auto_scaling_group_ : auto_scaling_group option)
    ?agent_id:(agent_id_ : agent_id option) ~schema_version:(schema_version_ : numeric_version) () =
  ({
     network_interfaces = network_interfaces_;
     tags = tags_;
     ipv4_addresses = ipv4_addresses_;
     hostname = hostname_;
     ami_id = ami_id_;
     auto_scaling_group = auto_scaling_group_;
     agent_id = agent_id_;
     schema_version = schema_version_;
   }
    : asset_attributes)

let make_finding ?indicator_of_compromise:(indicator_of_compromise_ : bool_ option)
    ?confidence:(confidence_ : ioc_confidence option)
    ?numeric_severity:(numeric_severity_ : numeric_severity option)
    ?severity:(severity_ : severity option) ?recommendation:(recommendation_ : text option)
    ?description:(description_ : text option) ?title:(title_ : text option)
    ?id:(id_ : finding_id option) ?asset_attributes:(asset_attributes_ : asset_attributes option)
    ?asset_type:(asset_type_ : asset_type option)
    ?service_attributes:(service_attributes_ : inspector_service_attributes option)
    ?service:(service_ : service_name option)
    ?schema_version:(schema_version_ : numeric_version option) ~updated_at:(updated_at_ : timestamp)
    ~created_at:(created_at_ : timestamp) ~user_attributes:(user_attributes_ : user_attribute_list)
    ~attributes:(attributes_ : attribute_list) ~arn:(arn_ : arn) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     user_attributes = user_attributes_;
     attributes = attributes_;
     indicator_of_compromise = indicator_of_compromise_;
     confidence = confidence_;
     numeric_severity = numeric_severity_;
     severity = severity_;
     recommendation = recommendation_;
     description = description_;
     title = title_;
     id = id_;
     asset_attributes = asset_attributes_;
     asset_type = asset_type_;
     service_attributes = service_attributes_;
     service = service_;
     schema_version = schema_version_;
     arn = arn_;
   }
    : finding)

let make_describe_findings_response ~failed_items:(failed_items_ : failed_items)
    ~findings:(findings_ : finding_list) () =
  ({ failed_items = failed_items_; findings = findings_ } : describe_findings_response)

let make_describe_findings_request ?locale:(locale_ : locale option)
    ~finding_arns:(finding_arns_ : batch_describe_arn_list) () =
  ({ locale = locale_; finding_arns = finding_arns_ } : describe_findings_request)

let make_exclusion ?attributes:(attributes_ : attribute_list option) ~scopes:(scopes_ : scope_list)
    ~recommendation:(recommendation_ : text) ~description:(description_ : text)
    ~title:(title_ : text) ~arn:(arn_ : arn) () =
  ({
     attributes = attributes_;
     scopes = scopes_;
     recommendation = recommendation_;
     description = description_;
     title = title_;
     arn = arn_;
   }
    : exclusion)

let make_describe_exclusions_response ~failed_items:(failed_items_ : failed_items)
    ~exclusions:(exclusions_ : exclusion_map) () =
  ({ failed_items = failed_items_; exclusions = exclusions_ } : describe_exclusions_response)

let make_describe_exclusions_request ?locale:(locale_ : locale option)
    ~exclusion_arns:(exclusion_arns_ : batch_describe_exclusions_arn_list) () =
  ({ locale = locale_; exclusion_arns = exclusion_arns_ } : describe_exclusions_request)

let make_describe_cross_account_access_role_response ~registered_at:(registered_at_ : timestamp)
    ~valid:(valid_ : bool_) ~role_arn:(role_arn_ : arn) () =
  ({ registered_at = registered_at_; valid = valid_; role_arn = role_arn_ }
    : describe_cross_account_access_role_response)

let make_assessment_template ?last_assessment_run_arn:(last_assessment_run_arn_ : arn option)
    ~created_at:(created_at_ : timestamp) ~assessment_run_count:(assessment_run_count_ : arn_count)
    ~user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list)
    ~rules_package_arns:(rules_package_arns_ : assessment_template_rules_package_arn_list)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~assessment_target_arn:(assessment_target_arn_ : arn) ~name:(name_ : assessment_template_name)
    ~arn:(arn_ : arn) () =
  ({
     created_at = created_at_;
     assessment_run_count = assessment_run_count_;
     last_assessment_run_arn = last_assessment_run_arn_;
     user_attributes_for_findings = user_attributes_for_findings_;
     rules_package_arns = rules_package_arns_;
     duration_in_seconds = duration_in_seconds_;
     assessment_target_arn = assessment_target_arn_;
     name = name_;
     arn = arn_;
   }
    : assessment_template)

let make_describe_assessment_templates_response ~failed_items:(failed_items_ : failed_items)
    ~assessment_templates:(assessment_templates_ : assessment_template_list) () =
  ({ failed_items = failed_items_; assessment_templates = assessment_templates_ }
    : describe_assessment_templates_response)

let make_describe_assessment_templates_request
    ~assessment_template_arns:(assessment_template_arns_ : batch_describe_arn_list) () =
  ({ assessment_template_arns = assessment_template_arns_ } : describe_assessment_templates_request)

let make_assessment_target ?resource_group_arn:(resource_group_arn_ : arn option)
    ~updated_at:(updated_at_ : timestamp) ~created_at:(created_at_ : timestamp)
    ~name:(name_ : assessment_target_name) ~arn:(arn_ : arn) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     resource_group_arn = resource_group_arn_;
     name = name_;
     arn = arn_;
   }
    : assessment_target)

let make_describe_assessment_targets_response ~failed_items:(failed_items_ : failed_items)
    ~assessment_targets:(assessment_targets_ : assessment_target_list) () =
  ({ failed_items = failed_items_; assessment_targets = assessment_targets_ }
    : describe_assessment_targets_response)

let make_describe_assessment_targets_request
    ~assessment_target_arns:(assessment_target_arns_ : batch_describe_arn_list) () =
  ({ assessment_target_arns = assessment_target_arns_ } : describe_assessment_targets_request)

let make_assessment_run_state_change ~state:(state_ : assessment_run_state)
    ~state_changed_at:(state_changed_at_ : timestamp) () =
  ({ state = state_; state_changed_at = state_changed_at_ } : assessment_run_state_change)

let make_assessment_run_notification
    ?sns_publish_status_code:
      (sns_publish_status_code_ : assessment_run_notification_sns_status_code option)
    ?sns_topic_arn:(sns_topic_arn_ : arn option) ?message:(message_ : message option)
    ~error:(error_ : bool_) ~event:(event_ : inspector_event) ~date:(date_ : timestamp) () =
  ({
     sns_publish_status_code = sns_publish_status_code_;
     sns_topic_arn = sns_topic_arn_;
     error = error_;
     message = message_;
     event = event_;
     date = date_;
   }
    : assessment_run_notification)

let make_assessment_run ?completed_at:(completed_at_ : timestamp option)
    ?started_at:(started_at_ : timestamp option)
    ~finding_counts:(finding_counts_ : assessment_run_finding_counts)
    ~notifications:(notifications_ : assessment_run_notification_list)
    ~state_changes:(state_changes_ : assessment_run_state_change_list)
    ~data_collected:(data_collected_ : bool_) ~state_changed_at:(state_changed_at_ : timestamp)
    ~created_at:(created_at_ : timestamp)
    ~user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list)
    ~rules_package_arns:(rules_package_arns_ : assessment_rules_package_arn_list)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~state:(state_ : assessment_run_state) ~assessment_template_arn:(assessment_template_arn_ : arn)
    ~name:(name_ : assessment_run_name) ~arn:(arn_ : arn) () =
  ({
     finding_counts = finding_counts_;
     notifications = notifications_;
     state_changes = state_changes_;
     data_collected = data_collected_;
     state_changed_at = state_changed_at_;
     completed_at = completed_at_;
     started_at = started_at_;
     created_at = created_at_;
     user_attributes_for_findings = user_attributes_for_findings_;
     rules_package_arns = rules_package_arns_;
     duration_in_seconds = duration_in_seconds_;
     state = state_;
     assessment_template_arn = assessment_template_arn_;
     name = name_;
     arn = arn_;
   }
    : assessment_run)

let make_describe_assessment_runs_response ~failed_items:(failed_items_ : failed_items)
    ~assessment_runs:(assessment_runs_ : assessment_run_list) () =
  ({ failed_items = failed_items_; assessment_runs = assessment_runs_ }
    : describe_assessment_runs_response)

let make_describe_assessment_runs_request
    ~assessment_run_arns:(assessment_run_arns_ : batch_describe_arn_list) () =
  ({ assessment_run_arns = assessment_run_arns_ } : describe_assessment_runs_request)

let make_delete_assessment_template_request
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({ assessment_template_arn = assessment_template_arn_ } : delete_assessment_template_request)

let make_delete_assessment_target_request ~assessment_target_arn:(assessment_target_arn_ : arn) () =
  ({ assessment_target_arn = assessment_target_arn_ } : delete_assessment_target_request)

let make_delete_assessment_run_request ~assessment_run_arn:(assessment_run_arn_ : arn) () =
  ({ assessment_run_arn = assessment_run_arn_ } : delete_assessment_run_request)

let make_create_resource_group_response ~resource_group_arn:(resource_group_arn_ : arn) () =
  ({ resource_group_arn = resource_group_arn_ } : create_resource_group_response)

let make_create_resource_group_request
    ~resource_group_tags:(resource_group_tags_ : resource_group_tags) () =
  ({ resource_group_tags = resource_group_tags_ } : create_resource_group_request)

let make_create_exclusions_preview_response ~preview_token:(preview_token_ : uui_d) () =
  ({ preview_token = preview_token_ } : create_exclusions_preview_response)

let make_create_exclusions_preview_request ~assessment_template_arn:(assessment_template_arn_ : arn)
    () =
  ({ assessment_template_arn = assessment_template_arn_ } : create_exclusions_preview_request)

let make_create_assessment_template_response
    ~assessment_template_arn:(assessment_template_arn_ : arn) () =
  ({ assessment_template_arn = assessment_template_arn_ } : create_assessment_template_response)

let make_create_assessment_template_request
    ?user_attributes_for_findings:(user_attributes_for_findings_ : user_attribute_list option)
    ~rules_package_arns:(rules_package_arns_ : assessment_template_rules_package_arn_list)
    ~duration_in_seconds:(duration_in_seconds_ : assessment_run_duration)
    ~assessment_template_name:(assessment_template_name_ : assessment_template_name)
    ~assessment_target_arn:(assessment_target_arn_ : arn) () =
  ({
     user_attributes_for_findings = user_attributes_for_findings_;
     rules_package_arns = rules_package_arns_;
     duration_in_seconds = duration_in_seconds_;
     assessment_template_name = assessment_template_name_;
     assessment_target_arn = assessment_target_arn_;
   }
    : create_assessment_template_request)

let make_create_assessment_target_response ~assessment_target_arn:(assessment_target_arn_ : arn) ()
    =
  ({ assessment_target_arn = assessment_target_arn_ } : create_assessment_target_response)

let make_create_assessment_target_request ?resource_group_arn:(resource_group_arn_ : arn option)
    ~assessment_target_name:(assessment_target_name_ : assessment_target_name) () =
  ({ resource_group_arn = resource_group_arn_; assessment_target_name = assessment_target_name_ }
    : create_assessment_target_request)

let make_add_attributes_to_findings_response ~failed_items:(failed_items_ : failed_items) () =
  ({ failed_items = failed_items_ } : add_attributes_to_findings_response)

let make_add_attributes_to_findings_request ~attributes:(attributes_ : user_attribute_list)
    ~finding_arns:(finding_arns_ : add_remove_attributes_finding_arn_list) () =
  ({ attributes = attributes_; finding_arns = finding_arns_ } : add_attributes_to_findings_request)
