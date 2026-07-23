open Types

let make_validation_message ?message:(message_ : validation_message_string option)
    ?severity:(severity_ : validation_severity option)
    ?namespace:(namespace_ : option_namespace option)
    ?option_name:(option_name_ : configuration_option_name option) () =
  ({ message = message_; severity = severity_; namespace = namespace_; option_name = option_name_ }
    : validation_message)

let make_configuration_settings_validation_messages
    ?messages:(messages_ : validation_messages_list option) () =
  ({ messages = messages_ } : configuration_settings_validation_messages)

let make_configuration_option_setting ?resource_name:(resource_name_ : resource_name option)
    ?namespace:(namespace_ : option_namespace option)
    ?option_name:(option_name_ : configuration_option_name option)
    ?value:(value_ : configuration_option_value option) () =
  ({
     resource_name = resource_name_;
     namespace = namespace_;
     option_name = option_name_;
     value = value_;
   }
    : configuration_option_setting)

let make_validate_configuration_settings_message
    ?template_name:(template_name_ : configuration_template_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ~application_name:(application_name_ : application_name)
    ~option_settings:(option_settings_ : configuration_option_settings_list) () =
  ({
     application_name = application_name_;
     template_name = template_name_;
     environment_name = environment_name_;
     option_settings = option_settings_;
   }
    : validate_configuration_settings_message)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_update_tags_for_resource_message ?tags_to_add:(tags_to_add_ : tag_list option)
    ?tags_to_remove:(tags_to_remove_ : tag_key_list option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; tags_to_add = tags_to_add_; tags_to_remove = tags_to_remove_ }
    : update_tags_for_resource_message)

let make_environment_link ?link_name:(link_name_ : string_ option)
    ?environment_name:(environment_name_ : string_ option) () =
  ({ link_name = link_name_; environment_name = environment_name_ } : environment_link)

let make_environment_tier ?name:(name_ : string_ option) ?type_:(type__ : string_ option)
    ?version:(version_ : string_ option) () =
  ({ name = name_; type_ = type__; version = version_ } : environment_tier)

let make_listener ?protocol:(protocol_ : string_ option) ?port:(port_ : integer option) () =
  ({ protocol = protocol_; port = port_ } : listener)

let make_load_balancer_description ?load_balancer_name:(load_balancer_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?listeners:(listeners_ : load_balancer_listeners_description option) () =
  ({ load_balancer_name = load_balancer_name_; domain = domain_; listeners = listeners_ }
    : load_balancer_description)

let make_environment_resources_description
    ?load_balancer:(load_balancer_ : load_balancer_description option) () =
  ({ load_balancer = load_balancer_ } : environment_resources_description)

let make_environment_description ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?application_name:(application_name_ : application_name option)
    ?version_label:(version_label_ : version_label option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?description:(description_ : description option)
    ?endpoint_ur_l:(endpoint_ur_l_ : endpoint_ur_l option) ?cnam_e:(cnam_e_ : dns_cname option)
    ?date_created:(date_created_ : creation_date option)
    ?date_updated:(date_updated_ : update_date option) ?status:(status_ : environment_status option)
    ?abortable_operation_in_progress:
      (abortable_operation_in_progress_ : abortable_operation_in_progress option)
    ?health:(health_ : environment_health option)
    ?health_status:(health_status_ : environment_health_status option)
    ?resources:(resources_ : environment_resources_description option)
    ?tier:(tier_ : environment_tier option)
    ?environment_links:(environment_links_ : environment_links option)
    ?environment_arn:(environment_arn_ : environment_arn option)
    ?operations_role:(operations_role_ : operations_role option) () =
  ({
     environment_name = environment_name_;
     environment_id = environment_id_;
     application_name = application_name_;
     version_label = version_label_;
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     template_name = template_name_;
     description = description_;
     endpoint_ur_l = endpoint_ur_l_;
     cnam_e = cnam_e_;
     date_created = date_created_;
     date_updated = date_updated_;
     status = status_;
     abortable_operation_in_progress = abortable_operation_in_progress_;
     health = health_;
     health_status = health_status_;
     resources = resources_;
     tier = tier_;
     environment_links = environment_links_;
     environment_arn = environment_arn_;
     operations_role = operations_role_;
   }
    : environment_description)

let make_option_specification ?resource_name:(resource_name_ : resource_name option)
    ?namespace:(namespace_ : option_namespace option)
    ?option_name:(option_name_ : configuration_option_name option) () =
  ({ resource_name = resource_name_; namespace = namespace_; option_name = option_name_ }
    : option_specification)

let make_update_environment_message ?application_name:(application_name_ : application_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?group_name:(group_name_ : group_name option) ?description:(description_ : description option)
    ?tier:(tier_ : environment_tier option) ?version_label:(version_label_ : version_label option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?options_to_remove:(options_to_remove_ : options_specifier_list option) () =
  ({
     application_name = application_name_;
     environment_id = environment_id_;
     environment_name = environment_name_;
     group_name = group_name_;
     description = description_;
     tier = tier_;
     version_label = version_label_;
     template_name = template_name_;
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     option_settings = option_settings_;
     options_to_remove = options_to_remove_;
   }
    : update_environment_message)

let make_configuration_settings_description
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?application_name:(application_name_ : application_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?description:(description_ : description option)
    ?environment_name:(environment_name_ : environment_name option)
    ?deployment_status:(deployment_status_ : configuration_deployment_status option)
    ?date_created:(date_created_ : creation_date option)
    ?date_updated:(date_updated_ : update_date option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option) () =
  ({
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     application_name = application_name_;
     template_name = template_name_;
     description = description_;
     environment_name = environment_name_;
     deployment_status = deployment_status_;
     date_created = date_created_;
     date_updated = date_updated_;
     option_settings = option_settings_;
   }
    : configuration_settings_description)

let make_update_configuration_template_message ?description:(description_ : description option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?options_to_remove:(options_to_remove_ : options_specifier_list option)
    ~application_name:(application_name_ : application_name)
    ~template_name:(template_name_ : configuration_template_name) () =
  ({
     application_name = application_name_;
     template_name = template_name_;
     description = description_;
     option_settings = option_settings_;
     options_to_remove = options_to_remove_;
   }
    : update_configuration_template_message)

let make_s3_location ?s3_bucket:(s3_bucket_ : s3_bucket option) ?s3_key:(s3_key_ : s3_key option) ()
    =
  ({ s3_bucket = s3_bucket_; s3_key = s3_key_ } : s3_location)

let make_source_build_information ~source_type:(source_type_ : source_type)
    ~source_repository:(source_repository_ : source_repository)
    ~source_location:(source_location_ : source_location) () =
  ({
     source_type = source_type_;
     source_repository = source_repository_;
     source_location = source_location_;
   }
    : source_build_information)

let make_application_version_description
    ?application_version_arn:(application_version_arn_ : application_version_arn option)
    ?application_name:(application_name_ : application_name option)
    ?description:(description_ : description option)
    ?version_label:(version_label_ : version_label option)
    ?source_build_information:(source_build_information_ : source_build_information option)
    ?build_arn:(build_arn_ : string_ option) ?source_bundle:(source_bundle_ : s3_location option)
    ?date_created:(date_created_ : creation_date option)
    ?date_updated:(date_updated_ : update_date option)
    ?status:(status_ : application_version_status option) () =
  ({
     application_version_arn = application_version_arn_;
     application_name = application_name_;
     description = description_;
     version_label = version_label_;
     source_build_information = source_build_information_;
     build_arn = build_arn_;
     source_bundle = source_bundle_;
     date_created = date_created_;
     date_updated = date_updated_;
     status = status_;
   }
    : application_version_description)

let make_application_version_description_message
    ?application_version:(application_version_ : application_version_description option) () =
  ({ application_version = application_version_ } : application_version_description_message)

let make_update_application_version_message ?description:(description_ : description option)
    ~application_name:(application_name_ : application_name)
    ~version_label:(version_label_ : version_label) () =
  ({
     application_name = application_name_;
     version_label = version_label_;
     description = description_;
   }
    : update_application_version_message)

let make_max_age_rule ?max_age_in_days:(max_age_in_days_ : boxed_int option)
    ?delete_source_from_s3:(delete_source_from_s3_ : boxed_boolean option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({
     enabled = enabled_;
     max_age_in_days = max_age_in_days_;
     delete_source_from_s3 = delete_source_from_s3_;
   }
    : max_age_rule)

let make_max_count_rule ?max_count:(max_count_ : boxed_int option)
    ?delete_source_from_s3:(delete_source_from_s3_ : boxed_boolean option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({ enabled = enabled_; max_count = max_count_; delete_source_from_s3 = delete_source_from_s3_ }
    : max_count_rule)

let make_application_version_lifecycle_config
    ?max_count_rule:(max_count_rule_ : max_count_rule option)
    ?max_age_rule:(max_age_rule_ : max_age_rule option) () =
  ({ max_count_rule = max_count_rule_; max_age_rule = max_age_rule_ }
    : application_version_lifecycle_config)

let make_application_resource_lifecycle_config ?service_role:(service_role_ : string_ option)
    ?version_lifecycle_config:
      (version_lifecycle_config_ : application_version_lifecycle_config option) () =
  ({ service_role = service_role_; version_lifecycle_config = version_lifecycle_config_ }
    : application_resource_lifecycle_config)

let make_application_resource_lifecycle_description_message
    ?application_name:(application_name_ : application_name option)
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option) () =
  ({ application_name = application_name_; resource_lifecycle_config = resource_lifecycle_config_ }
    : application_resource_lifecycle_description_message)

let make_update_application_resource_lifecycle_message
    ~application_name:(application_name_ : application_name)
    ~resource_lifecycle_config:(resource_lifecycle_config_ : application_resource_lifecycle_config)
    () =
  ({ application_name = application_name_; resource_lifecycle_config = resource_lifecycle_config_ }
    : update_application_resource_lifecycle_message)

let make_application_description ?application_arn:(application_arn_ : application_arn option)
    ?application_name:(application_name_ : application_name option)
    ?description:(description_ : description option)
    ?date_created:(date_created_ : creation_date option)
    ?date_updated:(date_updated_ : update_date option)
    ?versions:(versions_ : version_labels_list option)
    ?configuration_templates:(configuration_templates_ : configuration_template_names_list option)
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option) () =
  ({
     application_arn = application_arn_;
     application_name = application_name_;
     description = description_;
     date_created = date_created_;
     date_updated = date_updated_;
     versions = versions_;
     configuration_templates = configuration_templates_;
     resource_lifecycle_config = resource_lifecycle_config_;
   }
    : application_description)

let make_application_description_message
    ?application:(application_ : application_description option) () =
  ({ application = application_ } : application_description_message)

let make_update_application_message ?description:(description_ : description option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; description = description_ }
    : update_application_message)

let make_terminate_environment_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?terminate_resources:(terminate_resources_ : terminate_environment_resources option)
    ?force_terminate:(force_terminate_ : force_terminate option) () =
  ({
     environment_id = environment_id_;
     environment_name = environment_name_;
     terminate_resources = terminate_resources_;
     force_terminate = force_terminate_;
   }
    : terminate_environment_message)

let make_swap_environment_cnam_es_message
    ?source_environment_id:(source_environment_id_ : environment_id option)
    ?source_environment_name:(source_environment_name_ : environment_name option)
    ?destination_environment_id:(destination_environment_id_ : environment_id option)
    ?destination_environment_name:(destination_environment_name_ : environment_name option) () =
  ({
     source_environment_id = source_environment_id_;
     source_environment_name = source_environment_name_;
     destination_environment_id = destination_environment_id_;
     destination_environment_name = destination_environment_name_;
   }
    : swap_environment_cnam_es_message)

let make_environment_info_description ?info_type:(info_type_ : environment_info_type option)
    ?ec2_instance_id:(ec2_instance_id_ : ec2_instance_id option)
    ?sample_timestamp:(sample_timestamp_ : sample_timestamp option)
    ?message:(message_ : message option) () =
  ({
     info_type = info_type_;
     ec2_instance_id = ec2_instance_id_;
     sample_timestamp = sample_timestamp_;
     message = message_;
   }
    : environment_info_description)

let make_retrieve_environment_info_result_message
    ?environment_info:(environment_info_ : environment_info_description_list option) () =
  ({ environment_info = environment_info_ } : retrieve_environment_info_result_message)

let make_retrieve_environment_info_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ~info_type:(info_type_ : environment_info_type) () =
  ({
     environment_id = environment_id_;
     environment_name = environment_name_;
     info_type = info_type_;
   }
    : retrieve_environment_info_message)

let make_restart_app_server_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({ environment_id = environment_id_; environment_name = environment_name_ }
    : restart_app_server_message)

let make_request_environment_info_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ~info_type:(info_type_ : environment_info_type) () =
  ({
     environment_id = environment_id_;
     environment_name = environment_name_;
     info_type = info_type_;
   }
    : request_environment_info_message)

let make_rebuild_environment_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({ environment_id = environment_id_; environment_name = environment_name_ }
    : rebuild_environment_message)

let make_resource_tags_description_message ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_tags:(resource_tags_ : tag_list option) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ }
    : resource_tags_description_message)

let make_list_tags_for_resource_message ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_message)

let make_platform_summary ?platform_arn:(platform_arn_ : platform_arn option)
    ?platform_owner:(platform_owner_ : platform_owner option)
    ?platform_status:(platform_status_ : platform_status option)
    ?platform_category:(platform_category_ : platform_category option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?operating_system_version:(operating_system_version_ : operating_system_version option)
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option)
    ?supported_addon_list:(supported_addon_list_ : supported_addon_list option)
    ?platform_lifecycle_state:(platform_lifecycle_state_ : platform_lifecycle_state option)
    ?platform_version:(platform_version_ : platform_version option)
    ?platform_branch_name:(platform_branch_name_ : branch_name option)
    ?platform_branch_lifecycle_state:
      (platform_branch_lifecycle_state_ : platform_branch_lifecycle_state option) () =
  ({
     platform_arn = platform_arn_;
     platform_owner = platform_owner_;
     platform_status = platform_status_;
     platform_category = platform_category_;
     operating_system_name = operating_system_name_;
     operating_system_version = operating_system_version_;
     supported_tier_list = supported_tier_list_;
     supported_addon_list = supported_addon_list_;
     platform_lifecycle_state = platform_lifecycle_state_;
     platform_version = platform_version_;
     platform_branch_name = platform_branch_name_;
     platform_branch_lifecycle_state = platform_branch_lifecycle_state_;
   }
    : platform_summary)

let make_platform_filter ?type_:(type__ : platform_filter_type option)
    ?operator:(operator_ : platform_filter_operator option)
    ?values:(values_ : platform_filter_value_list option) () =
  ({ type_ = type__; operator = operator_; values = values_ } : platform_filter)

let make_list_platform_versions_request ?filters:(filters_ : platform_filters option)
    ?max_records:(max_records_ : platform_max_records option)
    ?next_token:(next_token_ : token option) () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : list_platform_versions_request)

let make_platform_branch_summary ?platform_name:(platform_name_ : platform_name option)
    ?branch_name:(branch_name_ : branch_name option)
    ?lifecycle_state:(lifecycle_state_ : platform_branch_lifecycle_state option)
    ?branch_order:(branch_order_ : branch_order option)
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option) () =
  ({
     platform_name = platform_name_;
     branch_name = branch_name_;
     lifecycle_state = lifecycle_state_;
     branch_order = branch_order_;
     supported_tier_list = supported_tier_list_;
   }
    : platform_branch_summary)

let make_search_filter ?attribute:(attribute_ : search_filter_attribute option)
    ?operator:(operator_ : search_filter_operator option)
    ?values:(values_ : search_filter_values option) () =
  ({ attribute = attribute_; operator = operator_; values = values_ } : search_filter)

let make_list_platform_branches_request ?filters:(filters_ : search_filters option)
    ?max_records:(max_records_ : platform_branch_max_records option)
    ?next_token:(next_token_ : token option) () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : list_platform_branches_request)

let make_solution_stack_description
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?permitted_file_types:(permitted_file_types_ : solution_stack_file_type_list option) () =
  ({ solution_stack_name = solution_stack_name_; permitted_file_types = permitted_file_types_ }
    : solution_stack_description)

let make_list_available_solution_stacks_result_message
    ?solution_stacks:(solution_stacks_ : available_solution_stack_names_list option)
    ?solution_stack_details:(solution_stack_details_ : available_solution_stack_details_list option)
    () =
  ({ solution_stacks = solution_stacks_; solution_stack_details = solution_stack_details_ }
    : list_available_solution_stacks_result_message)

let make_disassociate_environment_operations_role_message
    ~environment_name:(environment_name_ : environment_name) () =
  ({ environment_name = environment_name_ } : disassociate_environment_operations_role_message)

let make_custom_ami ?virtualization_type:(virtualization_type_ : virtualization_type option)
    ?image_id:(image_id_ : image_id option) () =
  ({ virtualization_type = virtualization_type_; image_id = image_id_ } : custom_ami)

let make_platform_framework ?name:(name_ : string_ option) ?version:(version_ : string_ option) () =
  ({ name = name_; version = version_ } : platform_framework)

let make_platform_programming_language ?name:(name_ : string_ option)
    ?version:(version_ : string_ option) () =
  ({ name = name_; version = version_ } : platform_programming_language)

let make_platform_description ?platform_arn:(platform_arn_ : platform_arn option)
    ?platform_owner:(platform_owner_ : platform_owner option)
    ?platform_name:(platform_name_ : platform_name option)
    ?platform_version:(platform_version_ : platform_version option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_status:(platform_status_ : platform_status option)
    ?date_created:(date_created_ : creation_date option)
    ?date_updated:(date_updated_ : update_date option)
    ?platform_category:(platform_category_ : platform_category option)
    ?description:(description_ : description option) ?maintainer:(maintainer_ : maintainer option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?operating_system_version:(operating_system_version_ : operating_system_version option)
    ?programming_languages:(programming_languages_ : platform_programming_languages option)
    ?frameworks:(frameworks_ : platform_frameworks option)
    ?custom_ami_list:(custom_ami_list_ : custom_ami_list option)
    ?supported_tier_list:(supported_tier_list_ : supported_tier_list option)
    ?supported_addon_list:(supported_addon_list_ : supported_addon_list option)
    ?platform_lifecycle_state:(platform_lifecycle_state_ : platform_lifecycle_state option)
    ?platform_branch_name:(platform_branch_name_ : branch_name option)
    ?platform_branch_lifecycle_state:
      (platform_branch_lifecycle_state_ : platform_branch_lifecycle_state option) () =
  ({
     platform_arn = platform_arn_;
     platform_owner = platform_owner_;
     platform_name = platform_name_;
     platform_version = platform_version_;
     solution_stack_name = solution_stack_name_;
     platform_status = platform_status_;
     date_created = date_created_;
     date_updated = date_updated_;
     platform_category = platform_category_;
     description = description_;
     maintainer = maintainer_;
     operating_system_name = operating_system_name_;
     operating_system_version = operating_system_version_;
     programming_languages = programming_languages_;
     frameworks = frameworks_;
     custom_ami_list = custom_ami_list_;
     supported_tier_list = supported_tier_list_;
     supported_addon_list = supported_addon_list_;
     platform_lifecycle_state = platform_lifecycle_state_;
     platform_branch_name = platform_branch_name_;
     platform_branch_lifecycle_state = platform_branch_lifecycle_state_;
   }
    : platform_description)

let make_describe_platform_version_request ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({ platform_arn = platform_arn_ } : describe_platform_version_request)

let make_deployment ?version_label:(version_label_ : string_ option)
    ?deployment_id:(deployment_id_ : nullable_long option) ?status:(status_ : string_ option)
    ?deployment_time:(deployment_time_ : deployment_timestamp option) () =
  ({
     version_label = version_label_;
     deployment_id = deployment_id_;
     status = status_;
     deployment_time = deployment_time_;
   }
    : deployment)

let make_cpu_utilization ?user:(user_ : nullable_double option)
    ?nice:(nice_ : nullable_double option) ?system:(system_ : nullable_double option)
    ?idle:(idle_ : nullable_double option) ?io_wait:(io_wait_ : nullable_double option)
    ?ir_q:(ir_q_ : nullable_double option) ?soft_ir_q:(soft_ir_q_ : nullable_double option)
    ?privileged:(privileged_ : nullable_double option) () =
  ({
     user = user_;
     nice = nice_;
     system = system_;
     idle = idle_;
     io_wait = io_wait_;
     ir_q = ir_q_;
     soft_ir_q = soft_ir_q_;
     privileged = privileged_;
   }
    : cpu_utilization)

let make_system_status ?cpu_utilization:(cpu_utilization_ : cpu_utilization option)
    ?load_average:(load_average_ : load_average option) () =
  ({ cpu_utilization = cpu_utilization_; load_average = load_average_ } : system_status)

let make_latency ?p999:(p999_ : nullable_double option) ?p99:(p99_ : nullable_double option)
    ?p95:(p95_ : nullable_double option) ?p90:(p90_ : nullable_double option)
    ?p85:(p85_ : nullable_double option) ?p75:(p75_ : nullable_double option)
    ?p50:(p50_ : nullable_double option) ?p10:(p10_ : nullable_double option) () =
  ({
     p999 = p999_;
     p99 = p99_;
     p95 = p95_;
     p90 = p90_;
     p85 = p85_;
     p75 = p75_;
     p50 = p50_;
     p10 = p10_;
   }
    : latency)

let make_status_codes ?status2xx:(status2xx_ : nullable_integer option)
    ?status3xx:(status3xx_ : nullable_integer option)
    ?status4xx:(status4xx_ : nullable_integer option)
    ?status5xx:(status5xx_ : nullable_integer option) () =
  ({
     status2xx = status2xx_;
     status3xx = status3xx_;
     status4xx = status4xx_;
     status5xx = status5xx_;
   }
    : status_codes)

let make_application_metrics ?duration:(duration_ : nullable_integer option)
    ?request_count:(request_count_ : request_count option)
    ?status_codes:(status_codes_ : status_codes option) ?latency:(latency_ : latency option) () =
  ({
     duration = duration_;
     request_count = request_count_;
     status_codes = status_codes_;
     latency = latency_;
   }
    : application_metrics)

let make_single_instance_health ?instance_id:(instance_id_ : instance_id option)
    ?health_status:(health_status_ : string_ option) ?color:(color_ : string_ option)
    ?causes:(causes_ : causes option) ?launched_at:(launched_at_ : launched_at option)
    ?application_metrics:(application_metrics_ : application_metrics option)
    ?system:(system_ : system_status option) ?deployment:(deployment_ : deployment option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?instance_type:(instance_type_ : string_ option) () =
  ({
     instance_id = instance_id_;
     health_status = health_status_;
     color = color_;
     causes = causes_;
     launched_at = launched_at_;
     application_metrics = application_metrics_;
     system = system_;
     deployment = deployment_;
     availability_zone = availability_zone_;
     instance_type = instance_type_;
   }
    : single_instance_health)

let make_describe_instances_health_request
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?attribute_names:(attribute_names_ : instances_health_attributes option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     environment_name = environment_name_;
     environment_id = environment_id_;
     attribute_names = attribute_names_;
     next_token = next_token_;
   }
    : describe_instances_health_request)

let make_event_description ?event_date:(event_date_ : event_date option)
    ?message:(message_ : event_message option)
    ?application_name:(application_name_ : application_name option)
    ?version_label:(version_label_ : version_label option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?request_id:(request_id_ : request_id option) ?severity:(severity_ : event_severity option) () =
  ({
     event_date = event_date_;
     message = message_;
     application_name = application_name_;
     version_label = version_label_;
     template_name = template_name_;
     environment_name = environment_name_;
     platform_arn = platform_arn_;
     request_id = request_id_;
     severity = severity_;
   }
    : event_description)

let make_event_descriptions_message ?events:(events_ : event_description_list option)
    ?next_token:(next_token_ : token option) () =
  ({ events = events_; next_token = next_token_ } : event_descriptions_message)

let make_describe_events_message ?application_name:(application_name_ : application_name option)
    ?version_label:(version_label_ : version_label option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?request_id:(request_id_ : request_id option) ?severity:(severity_ : event_severity option)
    ?start_time:(start_time_ : time_filter_start option)
    ?end_time:(end_time_ : time_filter_end option) ?max_records:(max_records_ : max_records option)
    ?next_token:(next_token_ : token option) () =
  ({
     application_name = application_name_;
     version_label = version_label_;
     template_name = template_name_;
     environment_id = environment_id_;
     environment_name = environment_name_;
     platform_arn = platform_arn_;
     request_id = request_id_;
     severity = severity_;
     start_time = start_time_;
     end_time = end_time_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : describe_events_message)

let make_environment_descriptions_message
    ?environments:(environments_ : environment_descriptions_list option)
    ?next_token:(next_token_ : token option) () =
  ({ environments = environments_; next_token = next_token_ } : environment_descriptions_message)

let make_describe_environments_message
    ?application_name:(application_name_ : application_name option)
    ?version_label:(version_label_ : version_label option)
    ?environment_ids:(environment_ids_ : environment_id_list option)
    ?environment_names:(environment_names_ : environment_names_list option)
    ?include_deleted:(include_deleted_ : include_deleted option)
    ?included_deleted_back_to:(included_deleted_back_to_ : include_deleted_back_to option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : token option) () =
  ({
     application_name = application_name_;
     version_label = version_label_;
     environment_ids = environment_ids_;
     environment_names = environment_names_;
     include_deleted = include_deleted_;
     included_deleted_back_to = included_deleted_back_to_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : describe_environments_message)

let make_queue ?name:(name_ : string_ option) ?ur_l:(ur_l_ : string_ option) () =
  ({ name = name_; ur_l = ur_l_ } : queue)

let make_trigger ?name:(name_ : resource_id option) () = ({ name = name_ } : trigger)
let make_load_balancer ?name:(name_ : resource_id option) () = ({ name = name_ } : load_balancer)
let make_launch_template ?id:(id_ : resource_id option) () = ({ id = id_ } : launch_template)

let make_launch_configuration ?name:(name_ : resource_id option) () =
  ({ name = name_ } : launch_configuration)

let make_instance ?id:(id_ : resource_id option) () = ({ id = id_ } : instance)

let make_auto_scaling_group ?name:(name_ : resource_id option) () =
  ({ name = name_ } : auto_scaling_group)

let make_environment_resource_description
    ?environment_name:(environment_name_ : environment_name option)
    ?auto_scaling_groups:(auto_scaling_groups_ : auto_scaling_group_list option)
    ?instances:(instances_ : instance_list option)
    ?launch_configurations:(launch_configurations_ : launch_configuration_list option)
    ?launch_templates:(launch_templates_ : launch_template_list option)
    ?load_balancers:(load_balancers_ : load_balancer_list option)
    ?triggers:(triggers_ : trigger_list option) ?queues:(queues_ : queue_list option) () =
  ({
     environment_name = environment_name_;
     auto_scaling_groups = auto_scaling_groups_;
     instances = instances_;
     launch_configurations = launch_configurations_;
     launch_templates = launch_templates_;
     load_balancers = load_balancers_;
     triggers = triggers_;
     queues = queues_;
   }
    : environment_resource_description)

let make_environment_resource_descriptions_message
    ?environment_resources:(environment_resources_ : environment_resource_description option) () =
  ({ environment_resources = environment_resources_ } : environment_resource_descriptions_message)

let make_describe_environment_resources_message
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({ environment_id = environment_id_; environment_name = environment_name_ }
    : describe_environment_resources_message)

let make_managed_action ?action_id:(action_id_ : string_ option)
    ?action_description:(action_description_ : string_ option)
    ?action_type:(action_type_ : action_type option) ?status:(status_ : action_status option)
    ?window_start_time:(window_start_time_ : timestamp option) () =
  ({
     action_id = action_id_;
     action_description = action_description_;
     action_type = action_type_;
     status = status_;
     window_start_time = window_start_time_;
   }
    : managed_action)

let make_describe_environment_managed_actions_request
    ?environment_name:(environment_name_ : string_ option)
    ?environment_id:(environment_id_ : string_ option) ?status:(status_ : action_status option) () =
  ({ environment_name = environment_name_; environment_id = environment_id_; status = status_ }
    : describe_environment_managed_actions_request)

let make_managed_action_history_item ?action_id:(action_id_ : string_ option)
    ?action_type:(action_type_ : action_type option)
    ?action_description:(action_description_ : string_ option)
    ?failure_type:(failure_type_ : failure_type option)
    ?status:(status_ : action_history_status option)
    ?failure_description:(failure_description_ : string_ option)
    ?executed_time:(executed_time_ : timestamp option)
    ?finished_time:(finished_time_ : timestamp option) () =
  ({
     action_id = action_id_;
     action_type = action_type_;
     action_description = action_description_;
     failure_type = failure_type_;
     status = status_;
     failure_description = failure_description_;
     executed_time = executed_time_;
     finished_time = finished_time_;
   }
    : managed_action_history_item)

let make_describe_environment_managed_action_history_request
    ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?next_token:(next_token_ : string_ option)
    ?max_items:(max_items_ : managed_action_history_max_items option) () =
  ({
     environment_id = environment_id_;
     environment_name = environment_name_;
     next_token = next_token_;
     max_items = max_items_;
   }
    : describe_environment_managed_action_history_request)

let make_instance_health_summary ?no_data:(no_data_ : nullable_integer option)
    ?unknown:(unknown_ : nullable_integer option) ?pending:(pending_ : nullable_integer option)
    ?ok:(ok_ : nullable_integer option) ?info:(info_ : nullable_integer option)
    ?warning:(warning_ : nullable_integer option) ?degraded:(degraded_ : nullable_integer option)
    ?severe:(severe_ : nullable_integer option) () =
  ({
     no_data = no_data_;
     unknown = unknown_;
     pending = pending_;
     ok = ok_;
     info = info_;
     warning = warning_;
     degraded = degraded_;
     severe = severe_;
   }
    : instance_health_summary)

let make_describe_environment_health_request
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option)
    ?attribute_names:(attribute_names_ : environment_health_attributes option) () =
  ({
     environment_name = environment_name_;
     environment_id = environment_id_;
     attribute_names = attribute_names_;
   }
    : describe_environment_health_request)

let make_configuration_settings_descriptions
    ?configuration_settings:
      (configuration_settings_ : configuration_settings_description_list option) () =
  ({ configuration_settings = configuration_settings_ } : configuration_settings_descriptions)

let make_describe_configuration_settings_message
    ?template_name:(template_name_ : configuration_template_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     template_name = template_name_;
     environment_name = environment_name_;
   }
    : describe_configuration_settings_message)

let make_option_restriction_regex ?pattern:(pattern_ : regex_pattern option)
    ?label:(label_ : regex_label option) () =
  ({ pattern = pattern_; label = label_ } : option_restriction_regex)

let make_configuration_option_description ?namespace:(namespace_ : option_namespace option)
    ?name:(name_ : configuration_option_name option)
    ?default_value:(default_value_ : configuration_option_default_value option)
    ?change_severity:(change_severity_ : configuration_option_severity option)
    ?user_defined:(user_defined_ : user_defined_option option)
    ?value_type:(value_type_ : configuration_option_value_type option)
    ?value_options:(value_options_ : configuration_option_possible_values option)
    ?min_value:(min_value_ : option_restriction_min_value option)
    ?max_value:(max_value_ : option_restriction_max_value option)
    ?max_length:(max_length_ : option_restriction_max_length option)
    ?regex:(regex_ : option_restriction_regex option) () =
  ({
     namespace = namespace_;
     name = name_;
     default_value = default_value_;
     change_severity = change_severity_;
     user_defined = user_defined_;
     value_type = value_type_;
     value_options = value_options_;
     min_value = min_value_;
     max_value = max_value_;
     max_length = max_length_;
     regex = regex_;
   }
    : configuration_option_description)

let make_configuration_options_description
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?options:(options_ : configuration_option_descriptions_list option) () =
  ({ solution_stack_name = solution_stack_name_; platform_arn = platform_arn_; options = options_ }
    : configuration_options_description)

let make_describe_configuration_options_message
    ?application_name:(application_name_ : application_name option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?environment_name:(environment_name_ : environment_name option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?options:(options_ : options_specifier_list option) () =
  ({
     application_name = application_name_;
     template_name = template_name_;
     environment_name = environment_name_;
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     options = options_;
   }
    : describe_configuration_options_message)

let make_application_version_descriptions_message
    ?application_versions:(application_versions_ : application_version_description_list option)
    ?next_token:(next_token_ : token option) () =
  ({ application_versions = application_versions_; next_token = next_token_ }
    : application_version_descriptions_message)

let make_describe_application_versions_message
    ?application_name:(application_name_ : application_name option)
    ?version_labels:(version_labels_ : version_labels_list option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : token option) () =
  ({
     application_name = application_name_;
     version_labels = version_labels_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : describe_application_versions_message)

let make_application_descriptions_message
    ?applications:(applications_ : application_description_list option) () =
  ({ applications = applications_ } : application_descriptions_message)

let make_describe_applications_message
    ?application_names:(application_names_ : application_names_list option) () =
  ({ application_names = application_names_ } : describe_applications_message)

let make_resource_quota ?maximum:(maximum_ : boxed_int option) () =
  ({ maximum = maximum_ } : resource_quota)

let make_resource_quotas ?application_quota:(application_quota_ : resource_quota option)
    ?application_version_quota:(application_version_quota_ : resource_quota option)
    ?environment_quota:(environment_quota_ : resource_quota option)
    ?configuration_template_quota:(configuration_template_quota_ : resource_quota option)
    ?custom_platform_quota:(custom_platform_quota_ : resource_quota option) () =
  ({
     application_quota = application_quota_;
     application_version_quota = application_version_quota_;
     environment_quota = environment_quota_;
     configuration_template_quota = configuration_template_quota_;
     custom_platform_quota = custom_platform_quota_;
   }
    : resource_quotas)

let make_delete_platform_version_request ?platform_arn:(platform_arn_ : platform_arn option) () =
  ({ platform_arn = platform_arn_ } : delete_platform_version_request)

let make_delete_environment_configuration_message
    ~application_name:(application_name_ : application_name)
    ~environment_name:(environment_name_ : environment_name) () =
  ({ application_name = application_name_; environment_name = environment_name_ }
    : delete_environment_configuration_message)

let make_delete_configuration_template_message
    ~application_name:(application_name_ : application_name)
    ~template_name:(template_name_ : configuration_template_name) () =
  ({ application_name = application_name_; template_name = template_name_ }
    : delete_configuration_template_message)

let make_delete_application_version_message
    ?delete_source_bundle:(delete_source_bundle_ : delete_source_bundle option)
    ~application_name:(application_name_ : application_name)
    ~version_label:(version_label_ : version_label) () =
  ({
     application_name = application_name_;
     version_label = version_label_;
     delete_source_bundle = delete_source_bundle_;
   }
    : delete_application_version_message)

let make_delete_application_message
    ?terminate_env_by_force:(terminate_env_by_force_ : terminate_env_force option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; terminate_env_by_force = terminate_env_by_force_ }
    : delete_application_message)

let make_create_storage_location_result_message ?s3_bucket:(s3_bucket_ : s3_bucket option) () =
  ({ s3_bucket = s3_bucket_ } : create_storage_location_result_message)

let make_builder ?ar_n:(ar_n_ : ar_n option) () = ({ ar_n = ar_n_ } : builder)

let make_create_platform_version_request
    ?environment_name:(environment_name_ : environment_name option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?tags:(tags_ : tags option) ~platform_name:(platform_name_ : platform_name)
    ~platform_version:(platform_version_ : platform_version)
    ~platform_definition_bundle:(platform_definition_bundle_ : s3_location) () =
  ({
     platform_name = platform_name_;
     platform_version = platform_version_;
     platform_definition_bundle = platform_definition_bundle_;
     environment_name = environment_name_;
     option_settings = option_settings_;
     tags = tags_;
   }
    : create_platform_version_request)

let make_create_environment_message ?environment_name:(environment_name_ : environment_name option)
    ?group_name:(group_name_ : group_name option) ?description:(description_ : description option)
    ?cname_prefix:(cname_prefix_ : dns_cname_prefix option) ?tier:(tier_ : environment_tier option)
    ?tags:(tags_ : tags option) ?version_label:(version_label_ : version_label option)
    ?template_name:(template_name_ : configuration_template_name option)
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?options_to_remove:(options_to_remove_ : options_specifier_list option)
    ?operations_role:(operations_role_ : operations_role option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     environment_name = environment_name_;
     group_name = group_name_;
     description = description_;
     cname_prefix = cname_prefix_;
     tier = tier_;
     tags = tags_;
     version_label = version_label_;
     template_name = template_name_;
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     option_settings = option_settings_;
     options_to_remove = options_to_remove_;
     operations_role = operations_role_;
   }
    : create_environment_message)

let make_source_configuration ?application_name:(application_name_ : application_name option)
    ?template_name:(template_name_ : configuration_template_name option) () =
  ({ application_name = application_name_; template_name = template_name_ } : source_configuration)

let make_create_configuration_template_message
    ?solution_stack_name:(solution_stack_name_ : solution_stack_name option)
    ?platform_arn:(platform_arn_ : platform_arn option)
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?environment_id:(environment_id_ : environment_id option)
    ?description:(description_ : description option)
    ?option_settings:(option_settings_ : configuration_option_settings_list option)
    ?tags:(tags_ : tags option) ~application_name:(application_name_ : application_name)
    ~template_name:(template_name_ : configuration_template_name) () =
  ({
     application_name = application_name_;
     template_name = template_name_;
     solution_stack_name = solution_stack_name_;
     platform_arn = platform_arn_;
     source_configuration = source_configuration_;
     environment_id = environment_id_;
     description = description_;
     option_settings = option_settings_;
     tags = tags_;
   }
    : create_configuration_template_message)

let make_build_configuration ?artifact_name:(artifact_name_ : string_ option)
    ?compute_type:(compute_type_ : compute_type option)
    ?timeout_in_minutes:(timeout_in_minutes_ : boxed_int option)
    ~code_build_service_role:(code_build_service_role_ : non_empty_string)
    ~image:(image_ : non_empty_string) () =
  ({
     artifact_name = artifact_name_;
     code_build_service_role = code_build_service_role_;
     compute_type = compute_type_;
     image = image_;
     timeout_in_minutes = timeout_in_minutes_;
   }
    : build_configuration)

let make_create_application_version_message ?description:(description_ : description option)
    ?source_build_information:(source_build_information_ : source_build_information option)
    ?source_bundle:(source_bundle_ : s3_location option)
    ?build_configuration:(build_configuration_ : build_configuration option)
    ?auto_create_application:(auto_create_application_ : auto_create_application option)
    ?process:(process_ : application_version_proccess option) ?tags:(tags_ : tags option)
    ~application_name:(application_name_ : application_name)
    ~version_label:(version_label_ : version_label) () =
  ({
     application_name = application_name_;
     version_label = version_label_;
     description = description_;
     source_build_information = source_build_information_;
     source_bundle = source_bundle_;
     build_configuration = build_configuration_;
     auto_create_application = auto_create_application_;
     process = process_;
     tags = tags_;
   }
    : create_application_version_message)

let make_create_application_message ?description:(description_ : description option)
    ?resource_lifecycle_config:
      (resource_lifecycle_config_ : application_resource_lifecycle_config option)
    ?tags:(tags_ : tags option) ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     description = description_;
     resource_lifecycle_config = resource_lifecycle_config_;
     tags = tags_;
   }
    : create_application_message)

let make_compose_environments_message
    ?application_name:(application_name_ : application_name option)
    ?group_name:(group_name_ : group_name option)
    ?version_labels:(version_labels_ : version_labels option) () =
  ({
     application_name = application_name_;
     group_name = group_name_;
     version_labels = version_labels_;
   }
    : compose_environments_message)

let make_check_dns_availability_result_message ?available:(available_ : cname_availability option)
    ?fully_qualified_cnam_e:(fully_qualified_cnam_e_ : dns_cname option) () =
  ({ available = available_; fully_qualified_cnam_e = fully_qualified_cnam_e_ }
    : check_dns_availability_result_message)

let make_check_dns_availability_message ~cname_prefix:(cname_prefix_ : dns_cname_prefix) () =
  ({ cname_prefix = cname_prefix_ } : check_dns_availability_message)

let make_associate_environment_operations_role_message
    ~environment_name:(environment_name_ : environment_name)
    ~operations_role:(operations_role_ : operations_role) () =
  ({ environment_name = environment_name_; operations_role = operations_role_ }
    : associate_environment_operations_role_message)

let make_apply_environment_managed_action_request
    ?environment_name:(environment_name_ : string_ option)
    ?environment_id:(environment_id_ : string_ option) ~action_id:(action_id_ : string_) () =
  ({
     environment_name = environment_name_;
     environment_id = environment_id_;
     action_id = action_id_;
   }
    : apply_environment_managed_action_request)

let make_abort_environment_update_message ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option) () =
  ({ environment_id = environment_id_; environment_name = environment_name_ }
    : abort_environment_update_message)
