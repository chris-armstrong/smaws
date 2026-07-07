open Types

let make_validation_message ?option_name:(option_name_ : configuration_option_name option)
    ?namespace:(namespace_ : option_namespace option)
    ?severity:(severity_ : validation_severity option)
    ?message:(message_ : validation_message_string option) () =
  ({ option_name = option_name_; namespace = namespace_; severity = severity_; message = message_ }
    : validation_message)

let make_configuration_option_setting ?value:(value_ : configuration_option_value option)
    ?option_name:(option_name_ : configuration_option_name option)
    ?namespace:(namespace_ : option_namespace option)
    ?resource_name:(resource_name_ : resource_name option) () =
  ({
     value = value_;
     option_name = option_name_;
     namespace = namespace_;
     resource_name = resource_name_;
   }
    : configuration_option_setting)

let make_validate_configuration_settings_message
    ?environment_name:(environment_name_ : environment_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ~option_settings:(option_settings_ : configuration_option_settings_list)
    ~application_name:(application_name_ : application_name) () =
  ({
     option_settings = option_settings_;
     environment_name = environment_name_;
     template_name = template_name_;
     application_name = application_name_;
   }
    : validate_configuration_settings_message)

let make_configuration_settings_validation_messages
    ?messages:(messages_ : validation_messages_list option) () =
  ({ messages = messages_ } : configuration_settings_validation_messages)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_update_tags_for_resource_message ?tags_to_remove:(tags_to_remove_ : tag_key_list option)
    ?tags_to_add:(tags_to_add_ : tag_list option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tags_to_remove = tags_to_remove_; tags_to_add = tags_to_add_; resource_arn = resource_arn_ }
    : update_tags_for_resource_message)

let make_environment_tier ?version:(version_ : string_ option) ?type_:(type__ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ version = version_; type_ = type__; name = name_ } : environment_tier)

let make_option_specification ?option_name:(option_name_ : configuration_option_name option)
    ?namespace:(namespace_ : option_namespace option)
    ?resource_name:(resource_name_ : resource_name option) () =
  ({ option_name = option_name_; namespace = namespace_; resource_name = resource_name_ }
    : option_specification)

let make_update_environment_message
    ?options_to_remove:(options_to_remove_ : options_specifier_list option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?version_label:(version_label_ : version_label option) ?tier:(tier_ : environment_tier option)
    ?description:(description_ : description option) ?group_name:(group_name_ : group_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     options_to_remove = options_to_remove_;
     option_settings = option_settings_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
     template_name = template_name_;
     version_label = version_label_;
     tier = tier_;
     description = description_;
     group_name = group_name_;
     environment_name = environment_name_;
     environment_id = environment_id_;
     application_name = application_name_;
   }
    : update_environment_message)

let make_listener ?port:(port_ : integer option) ?protocol:(protocol_ : string_ option) () =
  ({ port = port_; protocol = protocol_ } : listener)

let make_load_balancer_description
    ?listeners:(listeners_ : load_balancer_listeners_description option)
    ?domain:(domain_ : string_ option) ?load_balancer_name:(load_balancer_name_ : string_ option) ()
    =
  ({ listeners = listeners_; domain = domain_; load_balancer_name = load_balancer_name_ }
    : load_balancer_description)

let make_environment_resources_description
    ?load_balancer:(load_balancer_ : load_balancer_description option) () =
  ({ load_balancer = load_balancer_ } : environment_resources_description)

let make_environment_link ?environment_name:(environment_name_ : string_ option)
    ?link_name:(link_name_ : string_ option) () =
  ({ environment_name = environment_name_; link_name = link_name_ } : environment_link)

let make_environment_description ?operations_role:(operations_role_ : operations_role option)
    ?environment_arn:(environment_arn_ : environment_arn option)
    ?environment_links:(environment_links_ : environment_links option)
    ?tier:(tier_ : environment_tier option)
    ?resources:(resources_ : environment_resources_description option)
    ?health_status:(health_status_ : environment_health_status option)
    ?health:(health_ : environment_health option)
    ?abortable_operation_in_progress:
      (abortable_operation_in_progress_ : abortable_operation_in_progress option)
    ?status:(status_ : environment_status option) ?date_updated:(date_updated_ : update_date option)
    ?date_created:(date_created_ : creation_date option) ?cnam_e:(cnam_e_ : dns_cname option)
    ?endpoint_ur_l:(endpoint_ur_l_ : endpoint_ur_l option)
    ?description:(description_ : description option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?version_label:(version_label_ : version_label option)
    ?application_name:(application_name_ : application_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({
     operations_role = operations_role_;
     environment_arn = environment_arn_;
     environment_links = environment_links_;
     tier = tier_;
     resources = resources_;
     health_status = health_status_;
     health = health_;
     abortable_operation_in_progress = abortable_operation_in_progress_;
     status = status_;
     date_updated = date_updated_;
     date_created = date_created_;
     cnam_e = cnam_e_;
     endpoint_ur_l = endpoint_ur_l_;
     description = description_;
     template_name = template_name_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
     version_label = version_label_;
     application_name = application_name_;
     environment_id = environment_id_;
     environment_name = environment_name_;
   }
    : environment_description)

let make_update_configuration_template_message
    ?options_to_remove:(options_to_remove_ : options_specifier_list option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?description:(description_ : description option)
    ~template_name:(template_name_ : configuration_template_name)
    ~application_name:(application_name_ : application_name) () =
  ({
     options_to_remove = options_to_remove_;
     option_settings = option_settings_;
     description = description_;
     template_name = template_name_;
     application_name = application_name_;
   }
    : update_configuration_template_message)

let make_configuration_settings_description
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?date_updated:(date_updated_ : update_date option)
    ?date_created:(date_created_ : creation_date option)
    ?deployment_status:(deployment_status_ : configuration_deployment_status option)
    ?environment_name:(environment_name_ : environment_name option)
    ?description:(description_ : description option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?application_name:(application_name_ : application_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option) () =
  ({
     option_settings = option_settings_;
     date_updated = date_updated_;
     date_created = date_created_;
     deployment_status = deployment_status_;
     environment_name = environment_name_;
     description = description_;
     template_name = template_name_;
     application_name = application_name_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
   }
    : configuration_settings_description)

let make_update_application_version_message ?description:(description_ : description option)
    ~version_label:(version_label_ : version_label)
    ~application_name:(application_name_ : application_name) () =
  ({
     description = description_;
     version_label = version_label_;
     application_name = application_name_;
   }
    : update_application_version_message)

let make_source_build_information ~source_location:(source_location_ : source_location)
    ~source_repository:(source_repository_ : source_repository)
    ~source_type:(source_type_ : source_type) () =
  ({
     source_location = source_location_;
     source_repository = source_repository_;
     source_type = source_type_;
   }
    : source_build_information)

let make_s3_location ?s3_key:(s3_key_ : s3_key option) ?s3_bucket:(s3_bucket_ : s3_bucket option) ()
    =
  ({ s3_key = s3_key_; s3_bucket = s3_bucket_ } : s3_location)

let make_application_version_description ?status:(status_ : application_version_status option)
    ?date_updated:(date_updated_ : update_date option)
    ?date_created:(date_created_ : creation_date option)
    ?source_bundle:(source_bundle_ : s3_location option) ?build_arn:(build_arn_ : string_ option)
    ?source_build_information:(source_build_information_ : source_build_information option)
    ?version_label:(version_label_ : version_label option)
    ?description:(description_ : description option)
    ?application_name:(application_name_ : application_name option)
    ?application_version_arn:(application_version_arn_ : application_version_arn option) () =
  ({
     status = status_;
     date_updated = date_updated_;
     date_created = date_created_;
     source_bundle = source_bundle_;
     build_arn = build_arn_;
     source_build_information = source_build_information_;
     version_label = version_label_;
     description = description_;
     application_name = application_name_;
     application_version_arn = application_version_arn_;
   }
    : application_version_description)

let make_application_version_description_message
    ?application_version:(application_version_ : application_version_description option) () =
  ({ application_version = application_version_ } : application_version_description_message)

let make_max_count_rule ?delete_source_from_s3:(delete_source_from_s3_ : boxed_boolean option)
    ?max_count:(max_count_ : boxed_int option) ~enabled:(enabled_ : boxed_boolean) () =
  ({ delete_source_from_s3 = delete_source_from_s3_; max_count = max_count_; enabled = enabled_ }
    : max_count_rule)

let make_max_age_rule ?delete_source_from_s3:(delete_source_from_s3_ : boxed_boolean option)
    ?max_age_in_days:(max_age_in_days_ : boxed_int option) ~enabled:(enabled_ : boxed_boolean) () =
  ({
     delete_source_from_s3 = delete_source_from_s3_;
     max_age_in_days = max_age_in_days_;
     enabled = enabled_;
   }
    : max_age_rule)

let make_application_version_lifecycle_config ?max_age_rule:(max_age_rule_ : max_age_rule option)
    ?max_count_rule:(max_count_rule_ : max_count_rule option) () =
  ({ max_age_rule = max_age_rule_; max_count_rule = max_count_rule_ }
    : application_version_lifecycle_config)

let make_application_resource_lifecycle_config
    ?version_lifecycle_config:
      (version_lifecycle_config_ : application_version_lifecycle_config option)
    ?service_role:(service_role_ : string_ option) () =
  ({ version_lifecycle_config = version_lifecycle_config_; service_role = service_role_ }
    : application_resource_lifecycle_config)

let make_update_application_resource_lifecycle_message
    ~resource_lifecycle_config:(resource_lifecycle_config_ : application_resource_lifecycle_config)
    ~application_name:(application_name_ : application_name) () =
  ({ resource_lifecycle_config = resource_lifecycle_config_; application_name = application_name_ }
    : update_application_resource_lifecycle_message)

let make_application_resource_lifecycle_description_message
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option)
    ?application_name:(application_name_ : application_name option) () =
  ({ resource_lifecycle_config = resource_lifecycle_config_; application_name = application_name_ }
    : application_resource_lifecycle_description_message)

let make_update_application_message ?description:(description_ : description option)
    ~application_name:(application_name_ : application_name) () =
  ({ description = description_; application_name = application_name_ }
    : update_application_message)

let make_application_description
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option)
    ?configuration_templates:(configuration_templates_ : configuration_template_names_list option)
    ?versions:(versions_ : version_labels_list option)
    ?date_updated:(date_updated_ : update_date option)
    ?date_created:(date_created_ : creation_date option)
    ?description:(description_ : description option)
    ?application_name:(application_name_ : application_name option)
    ?application_arn:(application_arn_ : application_arn option) () =
  ({
     resource_lifecycle_config = resource_lifecycle_config_;
     configuration_templates = configuration_templates_;
     versions = versions_;
     date_updated = date_updated_;
     date_created = date_created_;
     description = description_;
     application_name = application_name_;
     application_arn = application_arn_;
   }
    : application_description)

let make_application_description_message
    ?application:(application_ : application_description option) () =
  ({ application = application_ } : application_description_message)

let make_trigger ?name:(name_ : resource_id option) () = ({ name = name_ } : trigger)

let make_terminate_environment_message ?force_terminate:(force_terminate_ : force_terminate option)
    ?terminate_resources:(terminate_resources_ : terminate_environment_resources option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({
     force_terminate = force_terminate_;
     terminate_resources = terminate_resources_;
     environment_name = environment_name_;
     environment_id = environment_id_;
   }
    : terminate_environment_message)

let make_cpu_utilization ?privileged:(privileged_ : nullable_double option)
    ?soft_ir_q:(soft_ir_q_ : nullable_double option) ?ir_q:(ir_q_ : nullable_double option)
    ?io_wait:(io_wait_ : nullable_double option) ?idle:(idle_ : nullable_double option)
    ?system:(system_ : nullable_double option) ?nice:(nice_ : nullable_double option)
    ?user:(user_ : nullable_double option) () =
  ({
     privileged = privileged_;
     soft_ir_q = soft_ir_q_;
     ir_q = ir_q_;
     io_wait = io_wait_;
     idle = idle_;
     system = system_;
     nice = nice_;
     user = user_;
   }
    : cpu_utilization)

let make_system_status ?load_average:(load_average_ : load_average option)
    ?cpu_utilization:(cpu_utilization_ : cpu_utilization option) () =
  ({ load_average = load_average_; cpu_utilization = cpu_utilization_ } : system_status)

let make_swap_environment_cnam_es_message
    ?destination_environment_name:(destination_environment_name_ : environment_name option)
    ?destination_environment_id:(destination_environment_id_ : environment_id option)
    ?source_environment_name:(source_environment_name_ : environment_name option)
    ?source_environment_id:(source_environment_id_ : environment_id option) () =
  ({
     destination_environment_name = destination_environment_name_;
     destination_environment_id = destination_environment_id_;
     source_environment_name = source_environment_name_;
     source_environment_id = source_environment_id_;
   }
    : swap_environment_cnam_es_message)

let make_status_codes ?status5xx:(status5xx_ : nullable_integer option)
    ?status4xx:(status4xx_ : nullable_integer option)
    ?status3xx:(status3xx_ : nullable_integer option)
    ?status2xx:(status2xx_ : nullable_integer option) () =
  ({
     status5xx = status5xx_;
     status4xx = status4xx_;
     status3xx = status3xx_;
     status2xx = status2xx_;
   }
    : status_codes)

let make_source_configuration ?template_name:(template_name_ : configuration_template_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({ template_name = template_name_; application_name = application_name_ } : source_configuration)

let make_solution_stack_description
    ?permitted_file_types:(permitted_file_types_ : solution_stack_file_type_list option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option) () =
  ({ permitted_file_types = permitted_file_types_; solution_stack_name = solution_stack_name_ }
    : solution_stack_description)

let make_latency ?p10:(p10_ : nullable_double option) ?p50:(p50_ : nullable_double option)
    ?p75:(p75_ : nullable_double option) ?p85:(p85_ : nullable_double option)
    ?p90:(p90_ : nullable_double option) ?p95:(p95_ : nullable_double option)
    ?p99:(p99_ : nullable_double option) ?p999:(p999_ : nullable_double option) () =
  ({
     p10 = p10_;
     p50 = p50_;
     p75 = p75_;
     p85 = p85_;
     p90 = p90_;
     p95 = p95_;
     p99 = p99_;
     p999 = p999_;
   }
    : latency)

let make_application_metrics ?latency:(latency_ : latency option)
    ?status_codes:(status_codes_ : status_codes option)
    ?request_count:(request_count_ : request_count option)
    ?duration:(duration_ : nullable_integer option) () =
  ({
     latency = latency_;
     status_codes = status_codes_;
     request_count = request_count_;
     duration = duration_;
   }
    : application_metrics)

let make_deployment ?deployment_time:(deployment_time_ : deployment_timestamp option)
    ?status:(status_ : string_ option) ?deployment_id:(deployment_id_ : nullable_long option)
    ?version_label:(version_label_ : string_ option) () =
  ({
     deployment_time = deployment_time_;
     status = status_;
     deployment_id = deployment_id_;
     version_label = version_label_;
   }
    : deployment)

let make_single_instance_health ?instance_type:(instance_type_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?deployment:(deployment_ : deployment option) ?system:(system_ : system_status option)
    ?application_metrics:(application_metrics_ : application_metrics option)
    ?launched_at:(launched_at_ : launched_at option) ?causes:(causes_ : causes option)
    ?color:(color_ : string_ option) ?health_status:(health_status_ : string_ option)
    ?instance_id:(instance_id_ : instance_id option) () =
  ({
     instance_type = instance_type_;
     availability_zone = availability_zone_;
     deployment = deployment_;
     system = system_;
     application_metrics = application_metrics_;
     launched_at = launched_at_;
     causes = causes_;
     color = color_;
     health_status = health_status_;
     instance_id = instance_id_;
   }
    : single_instance_health)

let make_search_filter ?values:(values_ : search_filter_values option)
    ?operator:(operator_ : search_filter_operator option)
    ?attribute:(attribute_ : search_filter_attribute option) () =
  ({ values = values_; operator = operator_; attribute = attribute_ } : search_filter)

let make_environment_info_description ?message:(message_ : message option)
    ?sample_timestamp:(sample_timestamp_ : sample_timestamp option)
    ?ec2_instance_id:(ec2_instance_id_ : ec2_instance_id option)
    ?info_type:(info_type_ : environment_info_type option) () =
  ({
     message = message_;
     sample_timestamp = sample_timestamp_;
     ec2_instance_id = ec2_instance_id_;
     info_type = info_type_;
   }
    : environment_info_description)

let make_retrieve_environment_info_result_message
    ?environment_info:(environment_info_ : environment_info_description_list option) () =
  ({ environment_info = environment_info_ } : retrieve_environment_info_result_message)

let make_retrieve_environment_info_message
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ~info_type:(info_type_ : environment_info_type) () =
  ({
     info_type = info_type_;
     environment_name = environment_name_;
     environment_id = environment_id_;
   }
    : retrieve_environment_info_message)

let make_restart_app_server_message ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({ environment_name = environment_name_; environment_id = environment_id_ }
    : restart_app_server_message)

let make_resource_tags_description_message ?resource_tags:(resource_tags_ : tag_list option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ resource_tags = resource_tags_; resource_arn = resource_arn_ }
    : resource_tags_description_message)

let make_resource_quota ?maximum:(maximum_ : boxed_int option) () =
  ({ maximum = maximum_ } : resource_quota)

let make_resource_quotas ?custom_platform_quota:(custom_platform_quota_ : resource_quota option)
    ?configuration_template_quota:(configuration_template_quota_ : resource_quota option)
    ?environment_quota:(environment_quota_ : resource_quota option)
    ?application_version_quota:(application_version_quota_ : resource_quota option)
    ?application_quota:(application_quota_ : resource_quota option) () =
  ({
     custom_platform_quota = custom_platform_quota_;
     configuration_template_quota = configuration_template_quota_;
     environment_quota = environment_quota_;
     application_version_quota = application_version_quota_;
     application_quota = application_quota_;
   }
    : resource_quotas)

let make_request_environment_info_message
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ~info_type:(info_type_ : environment_info_type) () =
  ({
     info_type = info_type_;
     environment_name = environment_name_;
     environment_id = environment_id_;
   }
    : request_environment_info_message)

let make_rebuild_environment_message ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({ environment_name = environment_name_; environment_id = environment_id_ }
    : rebuild_environment_message)

let make_queue ?ur_l:(ur_l_ : string_ option) ?name:(name_ : string_ option) () =
  ({ ur_l = ur_l_; name = name_ } : queue)

let make_platform_summary
    ?platform_branch_lifecycle_state:
      (platform_branch_lifecycle_state_ : platform_branch_lifecycle_state option)
    ?platform_branch_name:(platform_branch_name_ : branch_name option)
    ?platform_version:(platform_version_ : platform_version option)
    ?platform_lifecycle_state:(platform_lifecycle_state_ : platform_lifecycle_state option)
    ?supported_addon_list:(supported_addon_list_ : supported_addon_list option)
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option)
    ?operating_system_version:(operating_system_version_ : operating_system_version option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?platform_category:(platform_category_ : platform_category option)
    ?platform_status:(platform_status_ : platform_status option)
    ?platform_owner:(platform_owner_ : platform_owner option)
    ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({
     platform_branch_lifecycle_state = platform_branch_lifecycle_state_;
     platform_branch_name = platform_branch_name_;
     platform_version = platform_version_;
     platform_lifecycle_state = platform_lifecycle_state_;
     supported_addon_list = supported_addon_list_;
     supported_tier_list = supported_tier_list_;
     operating_system_version = operating_system_version_;
     operating_system_name = operating_system_name_;
     platform_category = platform_category_;
     platform_status = platform_status_;
     platform_owner = platform_owner_;
     platform_arn = platform_arn_;
   }
    : platform_summary)

let make_platform_programming_language ?version:(version_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ version = version_; name = name_ } : platform_programming_language)

let make_platform_framework ?version:(version_ : string_ option) ?name:(name_ : string_ option) () =
  ({ version = version_; name = name_ } : platform_framework)

let make_platform_filter ?values:(values_ : platform_filter_value_list option)
    ?operator:(operator_ : platform_filter_operator option)
    ?type_:(type__ : platform_filter_type option) () =
  ({ values = values_; operator = operator_; type_ = type__ } : platform_filter)

let make_custom_ami ?image_id:(image_id_ : image_id option)
    ?virtualization_type:(virtualization_type_ : virtualization_type option) () =
  ({ image_id = image_id_; virtualization_type = virtualization_type_ } : custom_ami)

let make_platform_description
    ?platform_branch_lifecycle_state:
      (platform_branch_lifecycle_state_ : platform_branch_lifecycle_state option)
    ?platform_branch_name:(platform_branch_name_ : branch_name option)
    ?platform_lifecycle_state:(platform_lifecycle_state_ : platform_lifecycle_state option)
    ?supported_addon_list:(supported_addon_list_ : supported_addon_list option)
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option)
    ?custom_ami_list:(custom_ami_list_ : custom_ami_list option)
    ?frameworks:(frameworks_ : platform_frameworks option)
    ?programming_languages:(programming_languages_ : platform_programming_languages option)
    ?operating_system_version:(operating_system_version_ : operating_system_version option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?maintainer:(maintainer_ : maintainer option) ?description:(description_ : description option)
    ?platform_category:(platform_category_ : platform_category option)
    ?date_updated:(date_updated_ : update_date option)
    ?date_created:(date_created_ : creation_date option)
    ?platform_status:(platform_status_ : platform_status option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_version:(platform_version_ : platform_version option)
    ?platform_name:(platform_name_ : platform_name option)
    ?platform_owner:(platform_owner_ : platform_owner option)
    ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({
     platform_branch_lifecycle_state = platform_branch_lifecycle_state_;
     platform_branch_name = platform_branch_name_;
     platform_lifecycle_state = platform_lifecycle_state_;
     supported_addon_list = supported_addon_list_;
     supported_tier_list = supported_tier_list_;
     custom_ami_list = custom_ami_list_;
     frameworks = frameworks_;
     programming_languages = programming_languages_;
     operating_system_version = operating_system_version_;
     operating_system_name = operating_system_name_;
     maintainer = maintainer_;
     description = description_;
     platform_category = platform_category_;
     date_updated = date_updated_;
     date_created = date_created_;
     platform_status = platform_status_;
     solution_stack_name = solution_stack_name_;
     platform_version = platform_version_;
     platform_name = platform_name_;
     platform_owner = platform_owner_;
     platform_arn = platform_arn_;
   }
    : platform_description)

let make_platform_branch_summary
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option)
    ?branch_order:(branch_order_ : branch_order option)
    ?lifecycle_state:(lifecycle_state_ : platform_branch_lifecycle_state option)
    ?branch_name:(branch_name_ : branch_name option)
    ?platform_name:(platform_name_ : platform_name option) () =
  ({
     supported_tier_list = supported_tier_list_;
     branch_order = branch_order_;
     lifecycle_state = lifecycle_state_;
     branch_name = branch_name_;
     platform_name = platform_name_;
   }
    : platform_branch_summary)

let make_option_restriction_regex ?label:(label_ : regex_label option)
    ?pattern:(pattern_ : regex_pattern option) () =
  ({ label = label_; pattern = pattern_ } : option_restriction_regex)

let make_managed_action ?window_start_time:(window_start_time_ : timestamp option)
    ?status:(status_ : action_status option) ?action_type:(action_type_ : action_type option)
    ?action_description:(action_description_ : string_ option)
    ?action_id:(action_id_ : string_ option) () =
  ({
     window_start_time = window_start_time_;
     status = status_;
     action_type = action_type_;
     action_description = action_description_;
     action_id = action_id_;
   }
    : managed_action)

let make_managed_action_history_item ?finished_time:(finished_time_ : timestamp option)
    ?executed_time:(executed_time_ : timestamp option)
    ?failure_description:(failure_description_ : string_ option)
    ?status:(status_ : action_history_status option)
    ?failure_type:(failure_type_ : failure_type option)
    ?action_description:(action_description_ : string_ option)
    ?action_type:(action_type_ : action_type option) ?action_id:(action_id_ : string_ option) () =
  ({
     finished_time = finished_time_;
     executed_time = executed_time_;
     failure_description = failure_description_;
     status = status_;
     failure_type = failure_type_;
     action_description = action_description_;
     action_type = action_type_;
     action_id = action_id_;
   }
    : managed_action_history_item)

let make_load_balancer ?name:(name_ : resource_id option) () = ({ name = name_ } : load_balancer)

let make_list_tags_for_resource_message ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_message)

let make_list_platform_versions_request ?next_token:(next_token_ : token option)
    ?max_records:(max_records_ : platform_max_records option)
    ?filters:(filters_ : platform_filters option) () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : list_platform_versions_request)

let make_list_platform_branches_request ?next_token:(next_token_ : token option)
    ?max_records:(max_records_ : platform_branch_max_records option)
    ?filters:(filters_ : search_filters option) () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : list_platform_branches_request)

let make_list_available_solution_stacks_result_message
    ?solution_stack_details:(solution_stack_details_ : available_solution_stack_details_list option)
    ?solution_stacks:(solution_stacks_ : available_solution_stack_names_list option) () =
  ({ solution_stack_details = solution_stack_details_; solution_stacks = solution_stacks_ }
    : list_available_solution_stacks_result_message)

let make_launch_template ?id:(id_ : resource_id option) () = ({ id = id_ } : launch_template)

let make_launch_configuration ?name:(name_ : resource_id option) () =
  ({ name = name_ } : launch_configuration)

let make_instance ?id:(id_ : resource_id option) () = ({ id = id_ } : instance)

let make_instance_health_summary ?severe:(severe_ : nullable_integer option)
    ?degraded:(degraded_ : nullable_integer option) ?warning:(warning_ : nullable_integer option)
    ?info:(info_ : nullable_integer option) ?ok:(ok_ : nullable_integer option)
    ?pending:(pending_ : nullable_integer option) ?unknown:(unknown_ : nullable_integer option)
    ?no_data:(no_data_ : nullable_integer option) () =
  ({
     severe = severe_;
     degraded = degraded_;
     warning = warning_;
     info = info_;
     ok = ok_;
     pending = pending_;
     unknown = unknown_;
     no_data = no_data_;
   }
    : instance_health_summary)

let make_event_description ?severity:(severity_ : event_severity option)
    ?request_id:(request_id_ : request_id option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?environment_name:(environment_name_ : environment_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?version_label:(version_label_ : version_label option)
    ?application_name:(application_name_ : application_name option)
    ?message:(message_ : event_message option) ?event_date:(event_date_ : event_date option) () =
  ({
     severity = severity_;
     request_id = request_id_;
     platform_arn = platform_arn_;
     environment_name = environment_name_;
     template_name = template_name_;
     version_label = version_label_;
     application_name = application_name_;
     message = message_;
     event_date = event_date_;
   }
    : event_description)

let make_event_descriptions_message ?next_token:(next_token_ : token option)
    ?events:(events_ : event_description_list option) () =
  ({ next_token = next_token_; events = events_ } : event_descriptions_message)

let make_auto_scaling_group ?name:(name_ : resource_id option) () =
  ({ name = name_ } : auto_scaling_group)

let make_environment_resource_description ?queues:(queues_ : queue_list option)
    ?triggers:(triggers_ : trigger_list option)
    ?load_balancers:(load_balancers_ : load_balancer_list option)
    ?launch_templates:(launch_templates_ : launch_template_list option)
    ?launch_configurations:(launch_configurations_ : launch_configuration_list option)
    ?instances:(instances_ : instance_list option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({
     queues = queues_;
     triggers = triggers_;
     load_balancers = load_balancers_;
     launch_templates = launch_templates_;
     launch_configurations = launch_configurations_;
     instances = instances_;
     auto_scaling_groups = auto_scaling_groups_;
     environment_name = environment_name_;
   }
    : environment_resource_description)

let make_environment_resource_descriptions_message
    ?environment_resources:(environment_resources_ : environment_resource_description option) () =
  ({ environment_resources = environment_resources_ } : environment_resource_descriptions_message)

let make_environment_descriptions_message ?next_token:(next_token_ : token option)
    ?environments:(environments_ : environment_descriptions_list option) () =
  ({ next_token = next_token_; environments = environments_ } : environment_descriptions_message)

let make_disassociate_environment_operations_role_message
    ~environment_name:(environment_name_ : environment_name) () =
  ({ environment_name = environment_name_ } : disassociate_environment_operations_role_message)

let make_describe_platform_version_request ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({ platform_arn = platform_arn_ } : describe_platform_version_request)

let make_describe_instances_health_request ?next_token:(next_token_ : next_token option)
    ?attribute_names:(attribute_names_ : instances_health_attributes option)
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({
     next_token = next_token_;
     attribute_names = attribute_names_;
     environment_id = environment_id_;
     environment_name = environment_name_;
   }
    : describe_instances_health_request)

let make_describe_events_message ?next_token:(next_token_ : token option)
    ?max_records:(max_records_ : max_records option) ?end_time:(end_time_ : time_filter_end option)
    ?start_time:(start_time_ : time_filter_start option)
    ?severity:(severity_ : event_severity option) ?request_id:(request_id_ : request_id option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?version_label:(version_label_ : version_label option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     end_time = end_time_;
     start_time = start_time_;
     severity = severity_;
     request_id = request_id_;
     platform_arn = platform_arn_;
     environment_name = environment_name_;
     environment_id = environment_id_;
     template_name = template_name_;
     version_label = version_label_;
     application_name = application_name_;
   }
    : describe_events_message)

let make_describe_environments_message ?next_token:(next_token_ : token option)
    ?max_records:(max_records_ : max_records option)
    ?included_deleted_back_to:(included_deleted_back_to_ : include_deleted_back_to option)
    ?include_deleted:(include_deleted_ : include_deleted option)
    ?environment_names:(environment_names_ : environment_names_list option)
    ?environment_ids:(environment_ids_ : environment_id_list option)
    ?version_label:(version_label_ : version_label option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     included_deleted_back_to = included_deleted_back_to_;
     include_deleted = include_deleted_;
     environment_names = environment_names_;
     environment_ids = environment_ids_;
     version_label = version_label_;
     application_name = application_name_;
   }
    : describe_environments_message)

let make_describe_environment_resources_message
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({ environment_name = environment_name_; environment_id = environment_id_ }
    : describe_environment_resources_message)

let make_describe_environment_managed_actions_request ?status:(status_ : action_status option)
    ?environment_id:(environment_id_ : string_ option)
    ?environment_name:(environment_name_ : string_ option) () =
  ({ status = status_; environment_id = environment_id_; environment_name = environment_name_ }
    : describe_environment_managed_actions_request)

let make_describe_environment_managed_action_history_request
    ?max_items:(max_items_ : managed_action_history_max_items option)
    ?next_token:(next_token_ : string_ option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({
     max_items = max_items_;
     next_token = next_token_;
     environment_name = environment_name_;
     environment_id = environment_id_;
   }
    : describe_environment_managed_action_history_request)

let make_describe_environment_health_request
    ?attribute_names:(attribute_names_ : environment_health_attributes option)
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({
     attribute_names = attribute_names_;
     environment_id = environment_id_;
     environment_name = environment_name_;
   }
    : describe_environment_health_request)

let make_describe_configuration_settings_message
    ?environment_name:(environment_name_ : environment_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ~application_name:(application_name_ : application_name) () =
  ({
     environment_name = environment_name_;
     template_name = template_name_;
     application_name = application_name_;
   }
    : describe_configuration_settings_message)

let make_configuration_settings_descriptions
    ?configuration_settings:
      (configuration_settings_ : configuration_settings_description_list option) () =
  ({ configuration_settings = configuration_settings_ } : configuration_settings_descriptions)

let make_describe_configuration_options_message ?options:(options_ : options_specifier_list option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     options = options_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
     environment_name = environment_name_;
     template_name = template_name_;
     application_name = application_name_;
   }
    : describe_configuration_options_message)

let make_configuration_option_description ?regex:(regex_ : option_restriction_regex option)
    ?max_length:(max_length_ : option_restriction_max_length option)
    ?max_value:(max_value_ : option_restriction_max_value option)
    ?min_value:(min_value_ : option_restriction_min_value option)
    ?value_options:(value_options_ : configuration_option_possible_values option)
    ?value_type:(value_type_ : configuration_option_value_type option)
    ?user_defined:(user_defined_ : user_defined_option option)
    ?change_severity:(change_severity_ : configuration_option_severity option)
    ?default_value:(default_value_ : configuration_option_default_value option)
    ?name:(name_ : configuration_option_name option)
    ?namespace:(namespace_ : option_namespace option) () =
  ({
     regex = regex_;
     max_length = max_length_;
     max_value = max_value_;
     min_value = min_value_;
     value_options = value_options_;
     value_type = value_type_;
     user_defined = user_defined_;
     change_severity = change_severity_;
     default_value = default_value_;
     name = name_;
     namespace = namespace_;
   }
    : configuration_option_description)

let make_configuration_options_description
    ?options:(options_ : configuration_option_descriptions_list option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option) () =
  ({ options = options_; platform_arn = platform_arn_; solution_stack_name = solution_stack_name_ }
    : configuration_options_description)

let make_describe_applications_message
    ?application_names:(application_names_ : application_names_list option) () =
  ({ application_names = application_names_ } : describe_applications_message)

let make_application_descriptions_message
    ?applications:(applications_ : application_description_list option) () =
  ({ applications = applications_ } : application_descriptions_message)

let make_describe_application_versions_message ?next_token:(next_token_ : token option)
    ?max_records:(max_records_ : max_records option)
    ?version_labels:(version_labels_ : version_labels_list option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     version_labels = version_labels_;
     application_name = application_name_;
   }
    : describe_application_versions_message)

let make_application_version_descriptions_message ?next_token:(next_token_ : token option)
    ?application_versions:(application_versions_ : application_version_description_list option) () =
  ({ next_token = next_token_; application_versions = application_versions_ }
    : application_version_descriptions_message)

let make_delete_platform_version_request ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({ platform_arn = platform_arn_ } : delete_platform_version_request)

let make_delete_environment_configuration_message
    ~environment_name:(environment_name_ : environment_name)
    ~application_name:(application_name_ : application_name) () =
  ({ environment_name = environment_name_; application_name = application_name_ }
    : delete_environment_configuration_message)

let make_delete_configuration_template_message
    ~template_name:(template_name_ : configuration_template_name)
    ~application_name:(application_name_ : application_name) () =
  ({ template_name = template_name_; application_name = application_name_ }
    : delete_configuration_template_message)

let make_delete_application_version_message
    ?delete_source_bundle:(delete_source_bundle_ : delete_source_bundle option)
    ~version_label:(version_label_ : version_label)
    ~application_name:(application_name_ : application_name) () =
  ({
     delete_source_bundle = delete_source_bundle_;
     version_label = version_label_;
     application_name = application_name_;
   }
    : delete_application_version_message)

let make_delete_application_message
    ?terminate_env_by_force:(terminate_env_by_force_ : terminate_env_force option)
    ~application_name:(application_name_ : application_name) () =
  ({ terminate_env_by_force = terminate_env_by_force_; application_name = application_name_ }
    : delete_application_message)

let make_create_storage_location_result_message ?s3_bucket:(s3_bucket_ : s3_bucket option) () =
  ({ s3_bucket = s3_bucket_ } : create_storage_location_result_message)

let make_builder ?ar_n:(ar_n_ : ar_n option) () = ({ ar_n = ar_n_ } : builder)

let make_create_platform_version_request ?tags:(tags_ : tags option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?environment_name:(environment_name_ : environment_name option)
    ~platform_definition_bundle:(platform_definition_bundle_ : s3_location)
    ~platform_version:(platform_version_ : platform_version)
    ~platform_name:(platform_name_ : platform_name) () =
  ({
     tags = tags_;
     option_settings = option_settings_;
     environment_name = environment_name_;
     platform_definition_bundle = platform_definition_bundle_;
     platform_version = platform_version_;
     platform_name = platform_name_;
   }
    : create_platform_version_request)

let make_create_environment_message ?operations_role:(operations_role_ : operations_role option)
    ?options_to_remove:(options_to_remove_ : options_specifier_list option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?version_label:(version_label_ : version_label option) ?tags:(tags_ : tags option)
    ?tier:(tier_ : environment_tier option) ?cname_prefix:(cname_prefix_ : dns_cname_prefix option)
    ?description:(description_ : description option) ?group_name:(group_name_ : group_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ~application_name:(application_name_ : application_name) () =
  ({
     operations_role = operations_role_;
     options_to_remove = options_to_remove_;
     option_settings = option_settings_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
     template_name = template_name_;
     version_label = version_label_;
     tags = tags_;
     tier = tier_;
     cname_prefix = cname_prefix_;
     description = description_;
     group_name = group_name_;
     environment_name = environment_name_;
     application_name = application_name_;
   }
    : create_environment_message)

let make_create_configuration_template_message ?tags:(tags_ : tags option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?description:(description_ : description option)
    ?environment_id:(environment_id_ : environment_id option)
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ~template_name:(template_name_ : configuration_template_name)
    ~application_name:(application_name_ : application_name) () =
  ({
     tags = tags_;
     option_settings = option_settings_;
     description = description_;
     environment_id = environment_id_;
     source_configuration = source_configuration_;
     platform_arn = platform_arn_;
     solution_stack_name = solution_stack_name_;
     template_name = template_name_;
     application_name = application_name_;
   }
    : create_configuration_template_message)

let make_build_configuration ?timeout_in_minutes:(timeout_in_minutes_ : boxed_int option)
    ?compute_type:(compute_type_ : compute_type option)
    ?artifact_name:(artifact_name_ : string_ option) ~image:(image_ : non_empty_string)
    ~code_build_service_role:(code_build_service_role_ : non_empty_string) () =
  ({
     timeout_in_minutes = timeout_in_minutes_;
     image = image_;
     compute_type = compute_type_;
     code_build_service_role = code_build_service_role_;
     artifact_name = artifact_name_;
   }
    : build_configuration)

let make_create_application_version_message ?tags:(tags_ : tags option)
    ?process:(process_ : application_version_proccess option)
    ?auto_create_application:(auto_create_application_ : auto_create_application option)
    ?build_configuration:(build_configuration_ : build_configuration option)
    ?source_bundle:(source_bundle_ : s3_location option)
    ?source_build_information:(source_build_information_ : source_build_information option)
    ?description:(description_ : description option) ~version_label:(version_label_ : version_label)
    ~application_name:(application_name_ : application_name) () =
  ({
     tags = tags_;
     process = process_;
     auto_create_application = auto_create_application_;
     build_configuration = build_configuration_;
     source_bundle = source_bundle_;
     source_build_information = source_build_information_;
     description = description_;
     version_label = version_label_;
     application_name = application_name_;
   }
    : create_application_version_message)

let make_create_application_message ?tags:(tags_ : tags option)
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option)
    ?description:(description_ : description option)
    ~application_name:(application_name_ : application_name) () =
  ({
     tags = tags_;
     resource_lifecycle_config = resource_lifecycle_config_;
     description = description_;
     application_name = application_name_;
   }
    : create_application_message)

let make_compose_environments_message ?version_labels:(version_labels_ : version_labels option)
    ?group_name:(group_name_ : group_name option)
    ?application_name:(application_name_ : application_name option) () =
  ({
     version_labels = version_labels_;
     group_name = group_name_;
     application_name = application_name_;
   }
    : compose_environments_message)

let make_check_dns_availability_result_message
    ?fully_qualified_cnam_e:(fully_qualified_cnam_e_ : dns_cname option)
    ?available:(available_ : cname_availability option) () =
  ({ fully_qualified_cnam_e = fully_qualified_cnam_e_; available = available_ }
    : check_dns_availability_result_message)

let make_check_dns_availability_message ~cname_prefix:(cname_prefix_ : dns_cname_prefix) () =
  ({ cname_prefix = cname_prefix_ } : check_dns_availability_message)

let make_associate_environment_operations_role_message
    ~operations_role:(operations_role_ : operations_role)
    ~environment_name:(environment_name_ : environment_name) () =
  ({ operations_role = operations_role_; environment_name = environment_name_ }
    : associate_environment_operations_role_message)

let make_apply_environment_managed_action_request ?environment_id:(environment_id_ : string_ option)
    ?environment_name:(environment_name_ : string_ option) ~action_id:(action_id_ : string_) () =
  ({
     action_id = action_id_;
     environment_id = environment_id_;
     environment_name = environment_name_;
   }
    : apply_environment_managed_action_request)

let make_abort_environment_update_message
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({ environment_name = environment_name_; environment_id = environment_id_ }
    : abort_environment_update_message)
