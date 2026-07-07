open Types

let make_warnings
    ?unrecognized_resource_types:(unrecognized_resource_types_ : resource_types option) () =
  ({ unrecognized_resource_types = unrecognized_resource_types_ } : warnings)

let make_warning_property ?description:(description_ : property_description option)
    ?required:(required_ : required_property option)
    ?property_path:(property_path_ : property_path option) () =
  ({ description = description_; required = required_; property_path = property_path_ }
    : warning_property)

let make_warning_detail ?properties:(properties_ : warning_properties option)
    ?type_:(type__ : warning_type option) () =
  ({ properties = properties_; type_ = type__ } : warning_detail)

let make_template_parameter ?description:(description_ : description option)
    ?no_echo:(no_echo_ : no_echo option) ?default_value:(default_value_ : parameter_value option)
    ?parameter_key:(parameter_key_ : parameter_key option) () =
  ({
     description = description_;
     no_echo = no_echo_;
     default_value = default_value_;
     parameter_key = parameter_key_;
   }
    : template_parameter)

let make_validate_template_output
    ?declared_transforms:(declared_transforms_ : transforms_list option)
    ?capabilities_reason:(capabilities_reason_ : capabilities_reason option)
    ?capabilities:(capabilities_ : capabilities option)
    ?description:(description_ : description option)
    ?parameters:(parameters_ : template_parameters option) () =
  ({
     declared_transforms = declared_transforms_;
     capabilities_reason = capabilities_reason_;
     capabilities = capabilities_;
     description = description_;
     parameters = parameters_;
   }
    : validate_template_output)

let make_validate_template_input ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option) () =
  ({ template_ur_l = template_ur_l_; template_body = template_body_ } : validate_template_input)

let make_update_termination_protection_output ?stack_id:(stack_id_ : stack_id option) () =
  ({ stack_id = stack_id_ } : update_termination_protection_output)

let make_update_termination_protection_input ~stack_name:(stack_name_ : stack_name_or_id)
    ~enable_termination_protection:(enable_termination_protection_ : enable_termination_protection)
    () =
  ({ stack_name = stack_name_; enable_termination_protection = enable_termination_protection_ }
    : update_termination_protection_input)

let make_update_stack_set_output ?operation_id:(operation_id_ : client_request_token option) () =
  ({ operation_id = operation_id_ } : update_stack_set_output)

let make_parameter ?resolved_value:(resolved_value_ : parameter_value option)
    ?use_previous_value:(use_previous_value_ : use_previous_value option)
    ?parameter_value:(parameter_value_ : parameter_value option)
    ?parameter_key:(parameter_key_ : parameter_key option) () =
  ({
     resolved_value = resolved_value_;
     use_previous_value = use_previous_value_;
     parameter_value = parameter_value_;
     parameter_key = parameter_key_;
   }
    : parameter)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_stack_set_operation_preferences
    ?concurrency_mode:(concurrency_mode_ : concurrency_mode option)
    ?max_concurrent_percentage:(max_concurrent_percentage_ : max_concurrent_percentage option)
    ?max_concurrent_count:(max_concurrent_count_ : max_concurrent_count option)
    ?failure_tolerance_percentage:
      (failure_tolerance_percentage_ : failure_tolerance_percentage option)
    ?failure_tolerance_count:(failure_tolerance_count_ : failure_tolerance_count option)
    ?region_order:(region_order_ : region_list option)
    ?region_concurrency_type:(region_concurrency_type_ : region_concurrency_type option) () =
  ({
     concurrency_mode = concurrency_mode_;
     max_concurrent_percentage = max_concurrent_percentage_;
     max_concurrent_count = max_concurrent_count_;
     failure_tolerance_percentage = failure_tolerance_percentage_;
     failure_tolerance_count = failure_tolerance_count_;
     region_order = region_order_;
     region_concurrency_type = region_concurrency_type_;
   }
    : stack_set_operation_preferences)

let make_deployment_targets ?account_filter_type:(account_filter_type_ : account_filter_type option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?accounts_url:(accounts_url_ : accounts_url option) ?accounts:(accounts_ : account_list option)
    () =
  ({
     account_filter_type = account_filter_type_;
     organizational_unit_ids = organizational_unit_ids_;
     accounts_url = accounts_url_;
     accounts = accounts_;
   }
    : deployment_targets)

let make_auto_deployment ?depends_on:(depends_on_ : stack_set_arn_list option)
    ?retain_stacks_on_account_removal:
      (retain_stacks_on_account_removal_ : retain_stacks_on_account_removal_nullable option)
    ?enabled:(enabled_ : auto_deployment_nullable option) () =
  ({
     depends_on = depends_on_;
     retain_stacks_on_account_removal = retain_stacks_on_account_removal_;
     enabled = enabled_;
   }
    : auto_deployment)

let make_managed_execution ?active:(active_ : managed_execution_nullable option) () =
  ({ active = active_ } : managed_execution)

let make_update_stack_set_input ?managed_execution:(managed_execution_ : managed_execution option)
    ?call_as:(call_as_ : call_as option) ?regions:(regions_ : region_list option)
    ?accounts:(accounts_ : account_list option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?permission_model:(permission_model_ : permission_models option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?tags:(tags_ : tags option) ?capabilities:(capabilities_ : capabilities option)
    ?parameters:(parameters_ : parameters option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option)
    ?description:(description_ : description option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     managed_execution = managed_execution_;
     call_as = call_as_;
     regions = regions_;
     accounts = accounts_;
     operation_id = operation_id_;
     auto_deployment = auto_deployment_;
     permission_model = permission_model_;
     deployment_targets = deployment_targets_;
     execution_role_name = execution_role_name_;
     administration_role_ar_n = administration_role_ar_n_;
     operation_preferences = operation_preferences_;
     tags = tags_;
     capabilities = capabilities_;
     parameters = parameters_;
     use_previous_template = use_previous_template_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
     description = description_;
     stack_set_name = stack_set_name_;
   }
    : update_stack_set_input)

let make_update_stack_output ?operation_id:(operation_id_ : operation_id option)
    ?stack_id:(stack_id_ : stack_id option) () =
  ({ operation_id = operation_id_; stack_id = stack_id_ } : update_stack_output)

let make_update_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : update_stack_instances_output)

let make_update_stack_instances_input ?call_as:(call_as_ : call_as option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?accounts:(accounts_ : account_list option) ~regions:(regions_ : region_list)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     operation_preferences = operation_preferences_;
     parameter_overrides = parameter_overrides_;
     regions = regions_;
     deployment_targets = deployment_targets_;
     accounts = accounts_;
     stack_set_name = stack_set_name_;
   }
    : update_stack_instances_input)

let make_rollback_trigger ~type_:(type__ : type_) ~arn:(arn_ : arn) () =
  ({ type_ = type__; arn = arn_ } : rollback_trigger)

let make_rollback_configuration
    ?monitoring_time_in_minutes:(monitoring_time_in_minutes_ : monitoring_time_in_minutes option)
    ?rollback_triggers:(rollback_triggers_ : rollback_triggers option) () =
  ({
     monitoring_time_in_minutes = monitoring_time_in_minutes_;
     rollback_triggers = rollback_triggers_;
   }
    : rollback_configuration)

let make_deployment_config ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?mode:(mode_ : deployment_config_mode option) () =
  ({ disable_rollback = disable_rollback_; mode = mode_ } : deployment_config)

let make_update_stack_input ?disable_validation:(disable_validation_ : disable_validation option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option) ?tags:(tags_ : tags option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option)
    ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?resource_types:(resource_types_ : resource_types option)
    ?capabilities:(capabilities_ : capabilities option)
    ?parameters:(parameters_ : parameters option)
    ?stack_policy_during_update_ur_l:
      (stack_policy_during_update_ur_l_ : stack_policy_during_update_ur_l option)
    ?stack_policy_during_update_body:
      (stack_policy_during_update_body_ : stack_policy_during_update_body option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option) ~stack_name:(stack_name_ : stack_name) ()
    =
  ({
     disable_validation = disable_validation_;
     deployment_config = deployment_config_;
     retain_except_on_create = retain_except_on_create_;
     client_request_token = client_request_token_;
     disable_rollback = disable_rollback_;
     tags = tags_;
     notification_ar_ns = notification_ar_ns_;
     stack_policy_ur_l = stack_policy_ur_l_;
     stack_policy_body = stack_policy_body_;
     rollback_configuration = rollback_configuration_;
     role_ar_n = role_ar_n_;
     resource_types = resource_types_;
     capabilities = capabilities_;
     parameters = parameters_;
     stack_policy_during_update_ur_l = stack_policy_during_update_ur_l_;
     stack_policy_during_update_body = stack_policy_during_update_body_;
     use_previous_template = use_previous_template_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
     stack_name = stack_name_;
   }
    : update_stack_input)

let make_update_generated_template_output
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({ generated_template_id = generated_template_id_ } : update_generated_template_output)

let make_resource_definition
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ~resource_identifier:(resource_identifier_ : resource_identifier_properties)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     resource_identifier = resource_identifier_;
     logical_resource_id = logical_resource_id_;
     resource_type = resource_type_;
   }
    : resource_definition)

let make_template_configuration
    ?update_replace_policy:
      (update_replace_policy_ : generated_template_update_replace_policy option)
    ?deletion_policy:(deletion_policy_ : generated_template_deletion_policy option) () =
  ({ update_replace_policy = update_replace_policy_; deletion_policy = deletion_policy_ }
    : template_configuration)

let make_update_generated_template_input
    ?template_configuration:(template_configuration_ : template_configuration option)
    ?refresh_all_resources:(refresh_all_resources_ : refresh_all_resources option)
    ?remove_resources:(remove_resources_ : jazz_logical_resource_ids option)
    ?add_resources:(add_resources_ : resource_definitions option)
    ?new_generated_template_name:(new_generated_template_name_ : generated_template_name option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({
     template_configuration = template_configuration_;
     refresh_all_resources = refresh_all_resources_;
     remove_resources = remove_resources_;
     add_resources = add_resources_;
     new_generated_template_name = new_generated_template_name_;
     generated_template_name = generated_template_name_;
   }
    : update_generated_template_input)

let make_type_configuration_identifier ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : third_party_type option)
    ?type_configuration_arn:(type_configuration_arn_ : type_configuration_arn option)
    ?type_configuration_alias:(type_configuration_alias_ : type_configuration_alias option)
    ?type_arn:(type_arn_ : type_arn option) () =
  ({
     type_name = type_name_;
     type_ = type__;
     type_configuration_arn = type_configuration_arn_;
     type_configuration_alias = type_configuration_alias_;
     type_arn = type_arn_;
   }
    : type_configuration_identifier)

let make_type_version_summary
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?description:(description_ : description option)
    ?time_created:(time_created_ : timestamp option) ?arn:(arn_ : type_arn option)
    ?is_default_version:(is_default_version_ : is_default_version option)
    ?version_id:(version_id_ : type_version_id option) ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : registry_type option) () =
  ({
     public_version_number = public_version_number_;
     description = description_;
     time_created = time_created_;
     arn = arn_;
     is_default_version = is_default_version_;
     version_id = version_id_;
     type_name = type_name_;
     type_ = type__;
   }
    : type_version_summary)

let make_type_summary ?is_activated:(is_activated_ : is_activated option)
    ?publisher_name:(publisher_name_ : publisher_name option)
    ?publisher_identity:(publisher_identity_ : identity_provider option)
    ?latest_public_version:(latest_public_version_ : public_version_number option)
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?description:(description_ : description option)
    ?last_updated:(last_updated_ : timestamp option) ?type_arn:(type_arn_ : type_arn option)
    ?default_version_id:(default_version_id_ : type_version_id option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : registry_type option) () =
  ({
     is_activated = is_activated_;
     publisher_name = publisher_name_;
     publisher_identity = publisher_identity_;
     latest_public_version = latest_public_version_;
     public_version_number = public_version_number_;
     original_type_name = original_type_name_;
     publisher_id = publisher_id_;
     description = description_;
     last_updated = last_updated_;
     type_arn = type_arn_;
     default_version_id = default_version_id_;
     type_name = type_name_;
     type_ = type__;
   }
    : type_summary)

let make_type_filters ?type_name_prefix:(type_name_prefix_ : type_name_prefix option)
    ?publisher_id:(publisher_id_ : publisher_id option) ?category:(category_ : category option) () =
  ({ type_name_prefix = type_name_prefix_; publisher_id = publisher_id_; category = category_ }
    : type_filters)

let make_type_configuration_details
    ?is_default_configuration:(is_default_configuration_ : is_default_configuration option)
    ?type_name:(type_name_ : type_name option) ?type_arn:(type_arn_ : type_arn option)
    ?last_updated:(last_updated_ : timestamp option)
    ?configuration:(configuration_ : type_configuration option)
    ?alias:(alias_ : type_configuration_alias option) ?arn:(arn_ : type_configuration_arn option) ()
    =
  ({
     is_default_configuration = is_default_configuration_;
     type_name = type_name_;
     type_arn = type_arn_;
     last_updated = last_updated_;
     configuration = configuration_;
     alias = alias_;
     arn = arn_;
   }
    : type_configuration_details)

let make_test_type_output ?type_version_arn:(type_version_arn_ : type_arn option) () =
  ({ type_version_arn = type_version_arn_ } : test_type_output)

let make_test_type_input ?log_delivery_bucket:(log_delivery_bucket_ : s3_bucket option)
    ?version_id:(version_id_ : type_version_id option) ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : third_party_type option) ?arn:(arn_ : type_arn option) () =
  ({
     log_delivery_bucket = log_delivery_bucket_;
     version_id = version_id_;
     type_name = type_name_;
     type_ = type__;
     arn = arn_;
   }
    : test_type_input)

let make_template_summary_config
    ?treat_unrecognized_resource_types_as_warnings:
      (treat_unrecognized_resource_types_as_warnings_ :
         treat_unrecognized_resource_types_as_warnings option) () =
  ({
     treat_unrecognized_resource_types_as_warnings = treat_unrecognized_resource_types_as_warnings_;
   }
    : template_summary_config)

let make_template_summary ?number_of_resources:(number_of_resources_ : number_of_resources option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?status_reason:(status_reason_ : template_status_reason option)
    ?status:(status_ : generated_template_status option)
    ?generated_template_name:(generated_template_name_ : generated_template_name option)
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({
     number_of_resources = number_of_resources_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     status_reason = status_reason_;
     status = status_;
     generated_template_name = generated_template_name_;
     generated_template_id = generated_template_id_;
   }
    : template_summary)

let make_template_progress ?resources_pending:(resources_pending_ : resources_pending option)
    ?resources_processing:(resources_processing_ : resources_processing option)
    ?resources_failed:(resources_failed_ : resources_failed option)
    ?resources_succeeded:(resources_succeeded_ : resources_succeeded option) () =
  ({
     resources_pending = resources_pending_;
     resources_processing = resources_processing_;
     resources_failed = resources_failed_;
     resources_succeeded = resources_succeeded_;
   }
    : template_progress)

let make_stop_stack_set_operation_output () = (() : unit)

let make_stop_stack_set_operation_input ?call_as:(call_as_ : call_as option)
    ~operation_id:(operation_id_ : client_request_token)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ call_as = call_as_; operation_id = operation_id_; stack_set_name = stack_set_name_ }
    : stop_stack_set_operation_input)

let make_start_resource_scan_output ?resource_scan_id:(resource_scan_id_ : resource_scan_id option)
    () =
  ({ resource_scan_id = resource_scan_id_ } : start_resource_scan_output)

let make_scan_filter ?types:(types_ : resource_type_filters option) () =
  ({ types = types_ } : scan_filter)

let make_start_resource_scan_input ?scan_filters:(scan_filters_ : scan_filters option)
    ?client_request_token:(client_request_token_ : client_request_token option) () =
  ({ scan_filters = scan_filters_; client_request_token = client_request_token_ }
    : start_resource_scan_input)

let make_output ?export_name:(export_name_ : export_name option)
    ?description:(description_ : description option)
    ?output_value:(output_value_ : output_value option)
    ?output_key:(output_key_ : output_key option) () =
  ({
     export_name = export_name_;
     description = description_;
     output_value = output_value_;
     output_key = output_key_;
   }
    : output)

let make_stack_drift_information ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_drift_status:(stack_drift_status_ : stack_drift_status) () =
  ({ last_check_timestamp = last_check_timestamp_; stack_drift_status = stack_drift_status_ }
    : stack_drift_information)

let make_operation_entry ?operation_id:(operation_id_ : operation_id option)
    ?operation_type:(operation_type_ : operation_type option) () =
  ({ operation_id = operation_id_; operation_type = operation_type_ } : operation_entry)

let make_stack ?last_operations:(last_operations_ : last_operations option)
    ?detailed_status:(detailed_status_ : detailed_status option)
    ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?drift_information:(drift_information_ : stack_drift_information option)
    ?root_id:(root_id_ : stack_id option) ?parent_id:(parent_id_ : stack_id option)
    ?enable_termination_protection:
      (enable_termination_protection_ : enable_termination_protection option)
    ?tags:(tags_ : tags option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?outputs:(outputs_ : outputs option) ?capabilities:(capabilities_ : capabilities option)
    ?timeout_in_minutes:(timeout_in_minutes_ : timeout_minutes option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?stack_status_reason:(stack_status_reason_ : stack_status_reason option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?deletion_time:(deletion_time_ : deletion_time option)
    ?parameters:(parameters_ : parameters option) ?description:(description_ : description option)
    ?change_set_id:(change_set_id_ : change_set_id option) ?stack_id:(stack_id_ : stack_id option)
    ~stack_status:(stack_status_ : stack_status) ~creation_time:(creation_time_ : creation_time)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     last_operations = last_operations_;
     detailed_status = detailed_status_;
     deletion_mode = deletion_mode_;
     retain_except_on_create = retain_except_on_create_;
     drift_information = drift_information_;
     root_id = root_id_;
     parent_id = parent_id_;
     enable_termination_protection = enable_termination_protection_;
     tags = tags_;
     role_ar_n = role_ar_n_;
     outputs = outputs_;
     capabilities = capabilities_;
     timeout_in_minutes = timeout_in_minutes_;
     notification_ar_ns = notification_ar_ns_;
     deployment_config = deployment_config_;
     disable_rollback = disable_rollback_;
     stack_status_reason = stack_status_reason_;
     stack_status = stack_status_;
     rollback_configuration = rollback_configuration_;
     last_updated_time = last_updated_time_;
     deletion_time = deletion_time_;
     creation_time = creation_time_;
     parameters = parameters_;
     description = description_;
     change_set_id = change_set_id_;
     stack_name = stack_name_;
     stack_id = stack_id_;
   }
    : stack)

let make_stack_drift_information_summary
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_drift_status:(stack_drift_status_ : stack_drift_status) () =
  ({ last_check_timestamp = last_check_timestamp_; stack_drift_status = stack_drift_status_ }
    : stack_drift_information_summary)

let make_stack_summary ?last_operations:(last_operations_ : last_operations option)
    ?drift_information:(drift_information_ : stack_drift_information_summary option)
    ?root_id:(root_id_ : stack_id option) ?parent_id:(parent_id_ : stack_id option)
    ?stack_status_reason:(stack_status_reason_ : stack_status_reason option)
    ?deletion_time:(deletion_time_ : deletion_time option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?template_description:(template_description_ : template_description option)
    ?stack_id:(stack_id_ : stack_id option) ~stack_status:(stack_status_ : stack_status)
    ~creation_time:(creation_time_ : creation_time) ~stack_name:(stack_name_ : stack_name) () =
  ({
     last_operations = last_operations_;
     drift_information = drift_information_;
     root_id = root_id_;
     parent_id = parent_id_;
     stack_status_reason = stack_status_reason_;
     stack_status = stack_status_;
     deletion_time = deletion_time_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     template_description = template_description_;
     stack_name = stack_name_;
     stack_id = stack_id_;
   }
    : stack_summary)

let make_stack_set_summary ?managed_execution:(managed_execution_ : managed_execution option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?permission_model:(permission_model_ : permission_models option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?status:(status_ : stack_set_status option) ?description:(description_ : description option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?stack_set_name:(stack_set_name_ : stack_set_name option) () =
  ({
     managed_execution = managed_execution_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     drift_status = drift_status_;
     permission_model = permission_model_;
     auto_deployment = auto_deployment_;
     status = status_;
     description = description_;
     stack_set_id = stack_set_id_;
     stack_set_name = stack_set_name_;
   }
    : stack_set_summary)

let make_stack_set_operation_status_details
    ?failed_stack_instances_count:
      (failed_stack_instances_count_ : failed_stack_instances_count option) () =
  ({ failed_stack_instances_count = failed_stack_instances_count_ }
    : stack_set_operation_status_details)

let make_stack_set_operation_summary
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?status_details:(status_details_ : stack_set_operation_status_details option)
    ?status_reason:(status_reason_ : stack_set_operation_status_reason option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?status:(status_ : stack_set_operation_status option)
    ?action:(action_ : stack_set_operation_action option)
    ?operation_id:(operation_id_ : client_request_token option) () =
  ({
     operation_preferences = operation_preferences_;
     status_details = status_details_;
     status_reason = status_reason_;
     end_timestamp = end_timestamp_;
     creation_timestamp = creation_timestamp_;
     status = status_;
     action = action_;
     operation_id = operation_id_;
   }
    : stack_set_operation_summary)

let make_stack_set_operation_result_summary
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?account_gate_result:(account_gate_result_ : account_gate_result option)
    ?status_reason:(status_reason_ : reason option)
    ?status:(status_ : stack_set_operation_result_status option) ?region:(region_ : region option)
    ?account:(account_ : account option) () =
  ({
     organizational_unit_id = organizational_unit_id_;
     account_gate_result = account_gate_result_;
     status_reason = status_reason_;
     status = status_;
     region = region_;
     account = account_;
   }
    : stack_set_operation_result_summary)

let make_stack_set_drift_detection_details
    ?failed_stack_instances_count:
      (failed_stack_instances_count_ : failed_stack_instances_count option)
    ?in_progress_stack_instances_count:
      (in_progress_stack_instances_count_ : in_progress_stack_instances_count option)
    ?in_sync_stack_instances_count:
      (in_sync_stack_instances_count_ : in_sync_stack_instances_count option)
    ?drifted_stack_instances_count:
      (drifted_stack_instances_count_ : drifted_stack_instances_count option)
    ?total_stack_instances_count:(total_stack_instances_count_ : total_stack_instances_count option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?drift_detection_status:(drift_detection_status_ : stack_set_drift_detection_status option)
    ?drift_status:(drift_status_ : stack_set_drift_status option) () =
  ({
     failed_stack_instances_count = failed_stack_instances_count_;
     in_progress_stack_instances_count = in_progress_stack_instances_count_;
     in_sync_stack_instances_count = in_sync_stack_instances_count_;
     drifted_stack_instances_count = drifted_stack_instances_count_;
     total_stack_instances_count = total_stack_instances_count_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     drift_detection_status = drift_detection_status_;
     drift_status = drift_status_;
   }
    : stack_set_drift_detection_details)

let make_stack_set_operation
    ?status_details:(status_details_ : stack_set_operation_status_details option)
    ?status_reason:(status_reason_ : stack_set_operation_status_reason option)
    ?stack_set_drift_detection_details:
      (stack_set_drift_detection_details_ : stack_set_drift_detection_details option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?retain_stacks:(retain_stacks_ : retain_stacks_nullable option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?status:(status_ : stack_set_operation_status option)
    ?action:(action_ : stack_set_operation_action option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?operation_id:(operation_id_ : client_request_token option) () =
  ({
     status_details = status_details_;
     status_reason = status_reason_;
     stack_set_drift_detection_details = stack_set_drift_detection_details_;
     deployment_targets = deployment_targets_;
     end_timestamp = end_timestamp_;
     creation_timestamp = creation_timestamp_;
     execution_role_name = execution_role_name_;
     administration_role_ar_n = administration_role_ar_n_;
     retain_stacks = retain_stacks_;
     operation_preferences = operation_preferences_;
     status = status_;
     action = action_;
     stack_set_id = stack_set_id_;
     operation_id = operation_id_;
   }
    : stack_set_operation)

let make_stack_set_auto_deployment_target_summary ?regions:(regions_ : region_list option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option) () =
  ({ regions = regions_; organizational_unit_id = organizational_unit_id_ }
    : stack_set_auto_deployment_target_summary)

let make_stack_set ?regions:(regions_ : region_list option)
    ?managed_execution:(managed_execution_ : managed_execution option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?permission_model:(permission_model_ : permission_models option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?stack_set_drift_detection_details:
      (stack_set_drift_detection_details_ : stack_set_drift_detection_details option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?stack_set_ar_n:(stack_set_ar_n_ : stack_set_ar_n option) ?tags:(tags_ : tags option)
    ?capabilities:(capabilities_ : capabilities option)
    ?parameters:(parameters_ : parameters option)
    ?template_body:(template_body_ : template_body option)
    ?status:(status_ : stack_set_status option) ?description:(description_ : description option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?stack_set_name:(stack_set_name_ : stack_set_name option) () =
  ({
     regions = regions_;
     managed_execution = managed_execution_;
     organizational_unit_ids = organizational_unit_ids_;
     permission_model = permission_model_;
     auto_deployment = auto_deployment_;
     stack_set_drift_detection_details = stack_set_drift_detection_details_;
     execution_role_name = execution_role_name_;
     administration_role_ar_n = administration_role_ar_n_;
     stack_set_ar_n = stack_set_ar_n_;
     tags = tags_;
     capabilities = capabilities_;
     parameters = parameters_;
     template_body = template_body_;
     status = status_;
     description = description_;
     stack_set_id = stack_set_id_;
     stack_set_name = stack_set_name_;
   }
    : stack_set)

let make_stack_resource_drift_information
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status) () =
  ({
     last_check_timestamp = last_check_timestamp_;
     stack_resource_drift_status = stack_resource_drift_status_;
   }
    : stack_resource_drift_information)

let make_module_info ?logical_id_hierarchy:(logical_id_hierarchy_ : logical_id_hierarchy option)
    ?type_hierarchy:(type_hierarchy_ : type_hierarchy option) () =
  ({ logical_id_hierarchy = logical_id_hierarchy_; type_hierarchy = type_hierarchy_ } : module_info)

let make_stack_resource ?module_info:(module_info_ : module_info option)
    ?drift_information:(drift_information_ : stack_resource_drift_information option)
    ?description:(description_ : description option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?stack_id:(stack_id_ : stack_id option) ?stack_name:(stack_name_ : stack_name option)
    ~resource_status:(resource_status_ : resource_status) ~timestamp:(timestamp_ : timestamp)
    ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({
     module_info = module_info_;
     drift_information = drift_information_;
     description = description_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     timestamp = timestamp_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     stack_id = stack_id_;
     stack_name = stack_name_;
   }
    : stack_resource)

let make_stack_resource_drift_information_summary
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status) () =
  ({
     last_check_timestamp = last_check_timestamp_;
     stack_resource_drift_status = stack_resource_drift_status_;
   }
    : stack_resource_drift_information_summary)

let make_stack_resource_summary ?module_info:(module_info_ : module_info option)
    ?drift_information:(drift_information_ : stack_resource_drift_information_summary option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ~resource_status:(resource_status_ : resource_status)
    ~last_updated_timestamp:(last_updated_timestamp_ : timestamp)
    ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({
     module_info = module_info_;
     drift_information = drift_information_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     last_updated_timestamp = last_updated_timestamp_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
   }
    : stack_resource_summary)

let make_physical_resource_id_context_key_value_pair ~value:(value_ : value) ~key:(key_ : key) () =
  ({ value = value_; key = key_ } : physical_resource_id_context_key_value_pair)

let make_property_difference ~difference_type:(difference_type_ : difference_type)
    ~actual_value:(actual_value_ : property_value)
    ~expected_value:(expected_value_ : property_value)
    ~property_path:(property_path_ : property_path) () =
  ({
     difference_type = difference_type_;
     actual_value = actual_value_;
     expected_value = expected_value_;
     property_path = property_path_;
   }
    : property_difference)

let make_stack_resource_drift
    ?drift_status_reason:(drift_status_reason_ : stack_resource_drift_status_reason option)
    ?module_info:(module_info_ : module_info option)
    ?property_differences:(property_differences_ : property_differences option)
    ?actual_properties:(actual_properties_ : properties option)
    ?expected_properties:(expected_properties_ : properties option)
    ?physical_resource_id_context:
      (physical_resource_id_context_ : physical_resource_id_context option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ~timestamp:(timestamp_ : timestamp)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status)
    ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_id:(stack_id_ : stack_id) () =
  ({
     drift_status_reason = drift_status_reason_;
     module_info = module_info_;
     timestamp = timestamp_;
     stack_resource_drift_status = stack_resource_drift_status_;
     property_differences = property_differences_;
     actual_properties = actual_properties_;
     expected_properties = expected_properties_;
     resource_type = resource_type_;
     physical_resource_id_context = physical_resource_id_context_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     stack_id = stack_id_;
   }
    : stack_resource_drift)

let make_stack_resource_detail ?module_info:(module_info_ : module_info option)
    ?drift_information:(drift_information_ : stack_resource_drift_information option)
    ?metadata:(metadata_ : metadata option) ?description:(description_ : description option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?stack_id:(stack_id_ : stack_id option) ?stack_name:(stack_name_ : stack_name option)
    ~resource_status:(resource_status_ : resource_status)
    ~last_updated_timestamp:(last_updated_timestamp_ : timestamp)
    ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({
     module_info = module_info_;
     drift_information = drift_information_;
     metadata = metadata_;
     description = description_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     last_updated_timestamp = last_updated_timestamp_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     stack_id = stack_id_;
     stack_name = stack_name_;
   }
    : stack_resource_detail)

let make_stack_refactor_summary
    ?status_reason:(status_reason_ : stack_refactor_status_reason option)
    ?status:(status_ : stack_refactor_status option)
    ?execution_status_reason:(execution_status_reason_ : execution_status_reason option)
    ?execution_status:(execution_status_ : stack_refactor_execution_status option)
    ?description:(description_ : description option)
    ?stack_refactor_id:(stack_refactor_id_ : stack_refactor_id option) () =
  ({
     status_reason = status_reason_;
     status = status_;
     execution_status_reason = execution_status_reason_;
     execution_status = execution_status_;
     description = description_;
     stack_refactor_id = stack_refactor_id_;
   }
    : stack_refactor_summary)

let make_resource_location ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ logical_resource_id = logical_resource_id_; stack_name = stack_name_ } : resource_location)

let make_resource_mapping ~destination:(destination_ : resource_location)
    ~source:(source_ : resource_location) () =
  ({ destination = destination_; source = source_ } : resource_mapping)

let make_stack_refactor_action ?resource_mapping:(resource_mapping_ : resource_mapping option)
    ?untag_resources:(untag_resources_ : stack_refactor_untag_resources option)
    ?tag_resources:(tag_resources_ : stack_refactor_tag_resources option)
    ?detection_reason:(detection_reason_ : detection_reason option)
    ?detection:(detection_ : stack_refactor_detection option)
    ?description:(description_ : description option)
    ?resource_identifier:(resource_identifier_ : stack_refactor_resource_identifier option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?entity:(entity_ : stack_refactor_action_entity option)
    ?action:(action_ : stack_refactor_action_type option) () =
  ({
     resource_mapping = resource_mapping_;
     untag_resources = untag_resources_;
     tag_resources = tag_resources_;
     detection_reason = detection_reason_;
     detection = detection_;
     description = description_;
     resource_identifier = resource_identifier_;
     physical_resource_id = physical_resource_id_;
     entity = entity_;
     action = action_;
   }
    : stack_refactor_action)

let make_stack_instance_comprehensive_status
    ?detailed_status:(detailed_status_ : stack_instance_detailed_status option) () =
  ({ detailed_status = detailed_status_ } : stack_instance_comprehensive_status)

let make_stack_instance_summary
    ?last_operation_id:(last_operation_id_ : client_request_token option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?stack_instance_status:(stack_instance_status_ : stack_instance_comprehensive_status option)
    ?status_reason:(status_reason_ : reason option) ?status:(status_ : stack_instance_status option)
    ?stack_id:(stack_id_ : stack_id option) ?account:(account_ : account option)
    ?region:(region_ : region option) ?stack_set_id:(stack_set_id_ : stack_set_id option) () =
  ({
     last_operation_id = last_operation_id_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     drift_status = drift_status_;
     organizational_unit_id = organizational_unit_id_;
     stack_instance_status = stack_instance_status_;
     status_reason = status_reason_;
     status = status_;
     stack_id = stack_id_;
     account = account_;
     region = region_;
     stack_set_id = stack_set_id_;
   }
    : stack_instance_summary)

let make_stack_instance_resource_drifts_summary
    ?property_differences:(property_differences_ : property_differences option)
    ?physical_resource_id_context:
      (physical_resource_id_context_ : physical_resource_id_context option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ~timestamp:(timestamp_ : timestamp)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status)
    ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_id:(stack_id_ : stack_id) () =
  ({
     timestamp = timestamp_;
     stack_resource_drift_status = stack_resource_drift_status_;
     property_differences = property_differences_;
     resource_type = resource_type_;
     physical_resource_id_context = physical_resource_id_context_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     stack_id = stack_id_;
   }
    : stack_instance_resource_drifts_summary)

let make_stack_instance_filter ?values:(values_ : stack_instance_filter_values option)
    ?name:(name_ : stack_instance_filter_name option) () =
  ({ values = values_; name = name_ } : stack_instance_filter)

let make_stack_instance ?last_operation_id:(last_operation_id_ : client_request_token option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?status_reason:(status_reason_ : reason option)
    ?stack_instance_status:(stack_instance_status_ : stack_instance_comprehensive_status option)
    ?status:(status_ : stack_instance_status option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?stack_id:(stack_id_ : stack_id option) ?account:(account_ : account option)
    ?region:(region_ : region option) ?stack_set_id:(stack_set_id_ : stack_set_id option) () =
  ({
     last_operation_id = last_operation_id_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     drift_status = drift_status_;
     organizational_unit_id = organizational_unit_id_;
     status_reason = status_reason_;
     stack_instance_status = stack_instance_status_;
     status = status_;
     parameter_overrides = parameter_overrides_;
     stack_id = stack_id_;
     account = account_;
     region = region_;
     stack_set_id = stack_set_id_;
   }
    : stack_instance)

let make_stack_event ?detailed_status:(detailed_status_ : detailed_status option)
    ?hook_failure_mode:(hook_failure_mode_ : hook_failure_mode option)
    ?hook_invocation_id:(hook_invocation_id_ : hook_invocation_id option)
    ?hook_invocation_point:(hook_invocation_point_ : hook_invocation_point option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?hook_status:(hook_status_ : hook_status option) ?hook_type:(hook_type_ : hook_type option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?resource_properties:(resource_properties_ : resource_properties option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?resource_status:(resource_status_ : resource_status option)
    ?resource_type:(resource_type_ : resource_type option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?operation_id:(operation_id_ : operation_id option) ~timestamp:(timestamp_ : timestamp)
    ~stack_name:(stack_name_ : stack_name) ~event_id:(event_id_ : event_id)
    ~stack_id:(stack_id_ : stack_id) () =
  ({
     detailed_status = detailed_status_;
     hook_failure_mode = hook_failure_mode_;
     hook_invocation_id = hook_invocation_id_;
     hook_invocation_point = hook_invocation_point_;
     hook_status_reason = hook_status_reason_;
     hook_status = hook_status_;
     hook_type = hook_type_;
     client_request_token = client_request_token_;
     resource_properties = resource_properties_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     timestamp = timestamp_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     operation_id = operation_id_;
     stack_name = stack_name_;
     event_id = event_id_;
     stack_id = stack_id_;
   }
    : stack_event)

let make_stack_definition ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option)
    ?stack_name:(stack_name_ : stack_name option) () =
  ({ template_ur_l = template_ur_l_; template_body = template_body_; stack_name = stack_name_ }
    : stack_definition)

let make_signal_resource_input ~status:(status_ : resource_signal_status)
    ~unique_id:(unique_id_ : resource_signal_unique_id)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     status = status_;
     unique_id = unique_id_;
     logical_resource_id = logical_resource_id_;
     stack_name = stack_name_;
   }
    : signal_resource_input)

let make_set_type_default_version_output () = (() : unit)

let make_set_type_default_version_input ?version_id:(version_id_ : type_version_id option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : registry_type option)
    ?arn:(arn_ : private_type_arn option) () =
  ({ version_id = version_id_; type_name = type_name_; type_ = type__; arn = arn_ }
    : set_type_default_version_input)

let make_set_type_configuration_output
    ?configuration_arn:(configuration_arn_ : type_configuration_arn option) () =
  ({ configuration_arn = configuration_arn_ } : set_type_configuration_output)

let make_set_type_configuration_input ?type_:(type__ : third_party_type option)
    ?type_name:(type_name_ : type_name option)
    ?configuration_alias:(configuration_alias_ : type_configuration_alias option)
    ?type_arn:(type_arn_ : type_arn option) ~configuration:(configuration_ : type_configuration) ()
    =
  ({
     type_ = type__;
     type_name = type_name_;
     configuration_alias = configuration_alias_;
     configuration = configuration_;
     type_arn = type_arn_;
   }
    : set_type_configuration_input)

let make_set_stack_policy_input ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option)
    ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     stack_policy_ur_l = stack_policy_ur_l_;
     stack_policy_body = stack_policy_body_;
     stack_name = stack_name_;
   }
    : set_stack_policy_input)

let make_scanned_resource ?managed_by_stack:(managed_by_stack_ : managed_by_stack option)
    ?resource_identifier:(resource_identifier_ : jazz_resource_identifier_properties option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     managed_by_stack = managed_by_stack_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
   }
    : scanned_resource)

let make_scanned_resource_identifier
    ~resource_identifier:(resource_identifier_ : jazz_resource_identifier_properties)
    ~resource_type:(resource_type_ : resource_type) () =
  ({ resource_identifier = resource_identifier_; resource_type = resource_type_ }
    : scanned_resource_identifier)

let make_rollback_stack_output ?operation_id:(operation_id_ : operation_id option)
    ?stack_id:(stack_id_ : stack_id option) () =
  ({ operation_id = operation_id_; stack_id = stack_id_ } : rollback_stack_output)

let make_rollback_stack_input ?deployment_config:(deployment_config_ : deployment_config option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     deployment_config = deployment_config_;
     retain_except_on_create = retain_except_on_create_;
     client_request_token = client_request_token_;
     role_ar_n = role_ar_n_;
     stack_name = stack_name_;
   }
    : rollback_stack_input)

let make_resource_to_import
    ~resource_identifier:(resource_identifier_ : resource_identifier_properties)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     resource_identifier = resource_identifier_;
     logical_resource_id = logical_resource_id_;
     resource_type = resource_type_;
   }
    : resource_to_import)

let make_live_resource_drift
    ?drift_detection_timestamp:(drift_detection_timestamp_ : timestamp option)
    ?actual_value:(actual_value_ : resource_drift_actual_value option)
    ?previous_value:(previous_value_ : resource_drift_previous_value option) () =
  ({
     drift_detection_timestamp = drift_detection_timestamp_;
     actual_value = actual_value_;
     previous_value = previous_value_;
   }
    : live_resource_drift)

let make_resource_target_definition
    ?attribute_change_type:(attribute_change_type_ : attribute_change_type option)
    ?drift:(drift_ : live_resource_drift option)
    ?after_value_from:(after_value_from_ : after_value_from option)
    ?before_value_from:(before_value_from_ : before_value_from option)
    ?after_value:(after_value_ : after_value option)
    ?before_value:(before_value_ : before_value option)
    ?path:(path_ : resource_property_path option)
    ?requires_recreation:(requires_recreation_ : requires_recreation option)
    ?name:(name_ : property_name option) ?attribute:(attribute_ : resource_attribute option) () =
  ({
     attribute_change_type = attribute_change_type_;
     drift = drift_;
     after_value_from = after_value_from_;
     before_value_from = before_value_from_;
     after_value = after_value_;
     before_value = before_value_;
     path = path_;
     requires_recreation = requires_recreation_;
     name = name_;
     attribute = attribute_;
   }
    : resource_target_definition)

let make_resource_scan_summary ?scan_type:(scan_type_ : scan_type option)
    ?percentage_completed:(percentage_completed_ : percentage_completed option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status_reason:(status_reason_ : resource_scan_status_reason option)
    ?status:(status_ : resource_scan_status option)
    ?resource_scan_id:(resource_scan_id_ : resource_scan_id option) () =
  ({
     scan_type = scan_type_;
     percentage_completed = percentage_completed_;
     end_time = end_time_;
     start_time = start_time_;
     status_reason = status_reason_;
     status = status_;
     resource_scan_id = resource_scan_id_;
   }
    : resource_scan_summary)

let make_resource_identifier_summary
    ?resource_identifiers:(resource_identifiers_ : resource_identifiers option)
    ?logical_resource_ids:(logical_resource_ids_ : logical_resource_ids option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     resource_identifiers = resource_identifiers_;
     logical_resource_ids = logical_resource_ids_;
     resource_type = resource_type_;
   }
    : resource_identifier_summary)

let make_resource_drift_ignored_attribute ?reason:(reason_ : drift_ignored_reason option)
    ?path:(path_ : resource_property_path option) () =
  ({ reason = reason_; path = path_ } : resource_drift_ignored_attribute)

let make_resource_detail ?warnings:(warnings_ : warning_details option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?resource_status:(resource_status_ : generated_template_resource_status option)
    ?resource_identifier:(resource_identifier_ : resource_identifier_properties option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     warnings = warnings_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     resource_identifier = resource_identifier_;
     logical_resource_id = logical_resource_id_;
     resource_type = resource_type_;
   }
    : resource_detail)

let make_resource_change_detail ?causing_entity:(causing_entity_ : causing_entity option)
    ?change_source:(change_source_ : change_source option)
    ?evaluation:(evaluation_ : evaluation_type option)
    ?target:(target_ : resource_target_definition option) () =
  ({
     causing_entity = causing_entity_;
     change_source = change_source_;
     evaluation = evaluation_;
     target = target_;
   }
    : resource_change_detail)

let make_resource_change
    ?previous_deployment_context:(previous_deployment_context_ : previous_deployment_context option)
    ?after_context:(after_context_ : after_context option)
    ?before_context:(before_context_ : before_context option)
    ?module_info:(module_info_ : module_info option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?details:(details_ : resource_change_details option)
    ?resource_drift_ignored_attributes:
      (resource_drift_ignored_attributes_ : resource_drift_ignored_attributes option)
    ?resource_drift_status:(resource_drift_status_ : stack_resource_drift_status option)
    ?scope:(scope_ : scope option) ?replacement:(replacement_ : replacement option)
    ?resource_type:(resource_type_ : resource_type option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?action:(action_ : change_action option) ?policy_action:(policy_action_ : policy_action option)
    () =
  ({
     previous_deployment_context = previous_deployment_context_;
     after_context = after_context_;
     before_context = before_context_;
     module_info = module_info_;
     change_set_id = change_set_id_;
     details = details_;
     resource_drift_ignored_attributes = resource_drift_ignored_attributes_;
     resource_drift_status = resource_drift_status_;
     scope = scope_;
     replacement = replacement_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     action = action_;
     policy_action = policy_action_;
   }
    : resource_change)

let make_required_activated_type
    ?supported_major_versions:(supported_major_versions_ : supported_major_versions option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?type_name_alias:(type_name_alias_ : type_name option) () =
  ({
     supported_major_versions = supported_major_versions_;
     publisher_id = publisher_id_;
     original_type_name = original_type_name_;
     type_name_alias = type_name_alias_;
   }
    : required_activated_type)

let make_register_type_output ?registration_token:(registration_token_ : registration_token option)
    () =
  ({ registration_token = registration_token_ } : register_type_output)

let make_logging_config ~log_group_name:(log_group_name_ : log_group_name)
    ~log_role_arn:(log_role_arn_ : role_ar_n2) () =
  ({ log_group_name = log_group_name_; log_role_arn = log_role_arn_ } : logging_config)

let make_register_type_input ?client_request_token:(client_request_token_ : request_token option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?logging_config:(logging_config_ : logging_config option) ?type_:(type__ : registry_type option)
    ~schema_handler_package:(schema_handler_package_ : s3_url) ~type_name:(type_name_ : type_name)
    () =
  ({
     client_request_token = client_request_token_;
     execution_role_arn = execution_role_arn_;
     logging_config = logging_config_;
     schema_handler_package = schema_handler_package_;
     type_name = type_name_;
     type_ = type__;
   }
    : register_type_input)

let make_register_publisher_output ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({ publisher_id = publisher_id_ } : register_publisher_output)

let make_register_publisher_input ?connection_arn:(connection_arn_ : connection_arn option)
    ?accept_terms_and_conditions:(accept_terms_and_conditions_ : accept_terms_and_conditions option)
    () =
  ({ connection_arn = connection_arn_; accept_terms_and_conditions = accept_terms_and_conditions_ }
    : register_publisher_input)

let make_record_handler_progress_output () = (() : unit)

let make_record_handler_progress_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?resource_model:(resource_model_ : resource_model option)
    ?error_code:(error_code_ : handler_error_code option)
    ?status_message:(status_message_ : status_message option)
    ?current_operation_status:(current_operation_status_ : operation_status option)
    ~operation_status:(operation_status_ : operation_status)
    ~bearer_token:(bearer_token_ : client_token) () =
  ({
     client_request_token = client_request_token_;
     resource_model = resource_model_;
     error_code = error_code_;
     status_message = status_message_;
     current_operation_status = current_operation_status_;
     operation_status = operation_status_;
     bearer_token = bearer_token_;
   }
    : record_handler_progress_input)

let make_publish_type_output ?public_type_arn:(public_type_arn_ : type_arn option) () =
  ({ public_type_arn = public_type_arn_ } : publish_type_output)

let make_publish_type_input
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?type_name:(type_name_ : type_name option) ?arn:(arn_ : private_type_arn option)
    ?type_:(type__ : third_party_type option) () =
  ({
     public_version_number = public_version_number_;
     type_name = type_name_;
     arn = arn_;
     type_ = type__;
   }
    : publish_type_input)

let make_parameter_constraints ?allowed_values:(allowed_values_ : allowed_values option) () =
  ({ allowed_values = allowed_values_ } : parameter_constraints)

let make_parameter_declaration
    ?parameter_constraints:(parameter_constraints_ : parameter_constraints option)
    ?description:(description_ : description option) ?no_echo:(no_echo_ : no_echo option)
    ?parameter_type:(parameter_type_ : parameter_type option)
    ?default_value:(default_value_ : parameter_value option)
    ?parameter_key:(parameter_key_ : parameter_key option) () =
  ({
     parameter_constraints = parameter_constraints_;
     description = description_;
     no_echo = no_echo_;
     parameter_type = parameter_type_;
     default_value = default_value_;
     parameter_key = parameter_key_;
   }
    : parameter_declaration)

let make_operation_result_filter ?values:(values_ : operation_result_filter_values option)
    ?name:(name_ : operation_result_filter_name option) () =
  ({ values = values_; name = name_ } : operation_result_filter)

let make_operation_event ?validation_path:(validation_path_ : validation_path option)
    ?validation_status_reason:(validation_status_reason_ : validation_status_reason option)
    ?validation_status:(validation_status_ : validation_status option)
    ?validation_name:(validation_name_ : validation_name option)
    ?validation_failure_mode:(validation_failure_mode_ : hook_failure_mode option)
    ?detailed_status:(detailed_status_ : detailed_status option)
    ?hook_failure_mode:(hook_failure_mode_ : hook_failure_mode option)
    ?hook_invocation_point:(hook_invocation_point_ : hook_invocation_point option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?hook_status:(hook_status_ : hook_status option) ?hook_type:(hook_type_ : hook_type option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?resource_properties:(resource_properties_ : resource_properties option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?resource_status:(resource_status_ : resource_status option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?timestamp:(timestamp_ : timestamp option)
    ?resource_type:(resource_type_ : resource_type option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?event_type:(event_type_ : event_type option)
    ?operation_status:(operation_status_ : beacon_stack_operation_status option)
    ?operation_type:(operation_type_ : operation_type option)
    ?operation_id:(operation_id_ : operation_id option) ?stack_id:(stack_id_ : stack_id option)
    ?event_id:(event_id_ : event_id option) () =
  ({
     validation_path = validation_path_;
     validation_status_reason = validation_status_reason_;
     validation_status = validation_status_;
     validation_name = validation_name_;
     validation_failure_mode = validation_failure_mode_;
     detailed_status = detailed_status_;
     hook_failure_mode = hook_failure_mode_;
     hook_invocation_point = hook_invocation_point_;
     hook_status_reason = hook_status_reason_;
     hook_status = hook_status_;
     hook_type = hook_type_;
     client_request_token = client_request_token_;
     resource_properties = resource_properties_;
     resource_status_reason = resource_status_reason_;
     resource_status = resource_status_;
     end_time = end_time_;
     start_time = start_time_;
     timestamp = timestamp_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     event_type = event_type_;
     operation_status = operation_status_;
     operation_type = operation_type_;
     operation_id = operation_id_;
     stack_id = stack_id_;
     event_id = event_id_;
   }
    : operation_event)

let make_list_types_output ?next_token:(next_token_ : next_token option)
    ?type_summaries:(type_summaries_ : type_summaries option) () =
  ({ next_token = next_token_; type_summaries = type_summaries_ } : list_types_output)

let make_list_types_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : type_filters option)
    ?type_:(type__ : registry_type option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?provisioning_type:(provisioning_type_ : provisioning_type option)
    ?visibility:(visibility_ : visibility option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     type_ = type__;
     deprecated_status = deprecated_status_;
     provisioning_type = provisioning_type_;
     visibility = visibility_;
   }
    : list_types_input)

let make_list_type_versions_output ?next_token:(next_token_ : next_token option)
    ?type_version_summaries:(type_version_summaries_ : type_version_summaries option) () =
  ({ next_token = next_token_; type_version_summaries = type_version_summaries_ }
    : list_type_versions_output)

let make_list_type_versions_input ?publisher_id:(publisher_id_ : publisher_id option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?arn:(arn_ : type_arn option) ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : registry_type option) () =
  ({
     publisher_id = publisher_id_;
     deprecated_status = deprecated_status_;
     next_token = next_token_;
     max_results = max_results_;
     arn = arn_;
     type_name = type_name_;
     type_ = type__;
   }
    : list_type_versions_input)

let make_list_type_registrations_output ?next_token:(next_token_ : next_token option)
    ?registration_token_list:(registration_token_list_ : registration_token_list option) () =
  ({ next_token = next_token_; registration_token_list = registration_token_list_ }
    : list_type_registrations_output)

let make_list_type_registrations_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?registration_status_filter:(registration_status_filter_ : registration_status option)
    ?type_arn:(type_arn_ : type_arn option) ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : registry_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     registration_status_filter = registration_status_filter_;
     type_arn = type_arn_;
     type_name = type_name_;
     type_ = type__;
   }
    : list_type_registrations_input)

let make_list_stacks_output ?next_token:(next_token_ : next_token option)
    ?stack_summaries:(stack_summaries_ : stack_summaries option) () =
  ({ next_token = next_token_; stack_summaries = stack_summaries_ } : list_stacks_output)

let make_list_stacks_input ?stack_status_filter:(stack_status_filter_ : stack_status_filter option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stack_status_filter = stack_status_filter_; next_token = next_token_ } : list_stacks_input)

let make_list_stack_sets_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_set_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_stack_sets_output)

let make_list_stack_sets_input ?call_as:(call_as_ : call_as option)
    ?status:(status_ : stack_set_status option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ call_as = call_as_; status = status_; max_results = max_results_; next_token = next_token_ }
    : list_stack_sets_input)

let make_list_stack_set_operations_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_set_operation_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_stack_set_operations_output)

let make_list_stack_set_operations_input ?call_as:(call_as_ : call_as option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     call_as = call_as_;
     max_results = max_results_;
     next_token = next_token_;
     stack_set_name = stack_set_name_;
   }
    : list_stack_set_operations_input)

let make_list_stack_set_operation_results_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_set_operation_result_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_stack_set_operation_results_output)

let make_list_stack_set_operation_results_input
    ?filters:(filters_ : operation_result_filters option) ?call_as:(call_as_ : call_as option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~operation_id:(operation_id_ : client_request_token)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     filters = filters_;
     call_as = call_as_;
     max_results = max_results_;
     next_token = next_token_;
     operation_id = operation_id_;
     stack_set_name = stack_set_name_;
   }
    : list_stack_set_operation_results_input)

let make_list_stack_set_auto_deployment_targets_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_set_auto_deployment_target_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ }
    : list_stack_set_auto_deployment_targets_output)

let make_list_stack_set_auto_deployment_targets_input ?call_as:(call_as_ : call_as option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     call_as = call_as_;
     max_results = max_results_;
     next_token = next_token_;
     stack_set_name = stack_set_name_;
   }
    : list_stack_set_auto_deployment_targets_input)

let make_list_stack_resources_output ?next_token:(next_token_ : next_token option)
    ?stack_resource_summaries:(stack_resource_summaries_ : stack_resource_summaries option) () =
  ({ next_token = next_token_; stack_resource_summaries = stack_resource_summaries_ }
    : list_stack_resources_output)

let make_list_stack_resources_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ next_token = next_token_; stack_name = stack_name_ } : list_stack_resources_input)

let make_list_stack_refactors_output ?next_token:(next_token_ : next_token option)
    ~stack_refactor_summaries:(stack_refactor_summaries_ : stack_refactor_summaries) () =
  ({ next_token = next_token_; stack_refactor_summaries = stack_refactor_summaries_ }
    : list_stack_refactors_output)

let make_list_stack_refactors_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?execution_status_filter:
      (execution_status_filter_ : stack_refactor_execution_status_filter option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     execution_status_filter = execution_status_filter_;
   }
    : list_stack_refactors_input)

let make_list_stack_refactor_actions_output ?next_token:(next_token_ : next_token option)
    ~stack_refactor_actions:(stack_refactor_actions_ : stack_refactor_actions) () =
  ({ next_token = next_token_; stack_refactor_actions = stack_refactor_actions_ }
    : list_stack_refactor_actions_output)

let make_list_stack_refactor_actions_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) () =
  ({ max_results = max_results_; next_token = next_token_; stack_refactor_id = stack_refactor_id_ }
    : list_stack_refactor_actions_input)

let make_list_stack_instances_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_instance_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_stack_instances_output)

let make_list_stack_instances_input ?call_as:(call_as_ : call_as option)
    ?stack_instance_region:(stack_instance_region_ : region option)
    ?stack_instance_account:(stack_instance_account_ : account option)
    ?filters:(filters_ : stack_instance_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     call_as = call_as_;
     stack_instance_region = stack_instance_region_;
     stack_instance_account = stack_instance_account_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     stack_set_name = stack_set_name_;
   }
    : list_stack_instances_input)

let make_list_stack_instance_resource_drifts_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : stack_instance_resource_drifts_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ }
    : list_stack_instance_resource_drifts_output)

let make_list_stack_instance_resource_drifts_input ?call_as:(call_as_ : call_as option)
    ?stack_instance_resource_drift_statuses:
      (stack_instance_resource_drift_statuses_ : stack_resource_drift_status_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~operation_id:(operation_id_ : client_request_token)
    ~stack_instance_region:(stack_instance_region_ : region)
    ~stack_instance_account:(stack_instance_account_ : account)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     stack_instance_region = stack_instance_region_;
     stack_instance_account = stack_instance_account_;
     stack_instance_resource_drift_statuses = stack_instance_resource_drift_statuses_;
     max_results = max_results_;
     next_token = next_token_;
     stack_set_name = stack_set_name_;
   }
    : list_stack_instance_resource_drifts_input)

let make_list_resource_scans_output ?next_token:(next_token_ : next_token option)
    ?resource_scan_summaries:(resource_scan_summaries_ : resource_scan_summaries option) () =
  ({ next_token = next_token_; resource_scan_summaries = resource_scan_summaries_ }
    : list_resource_scans_output)

let make_list_resource_scans_input ?scan_type_filter:(scan_type_filter_ : scan_type option)
    ?max_results:(max_results_ : resource_scanner_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ scan_type_filter = scan_type_filter_; max_results = max_results_; next_token = next_token_ }
    : list_resource_scans_input)

let make_list_resource_scan_resources_output ?next_token:(next_token_ : next_token option)
    ?resources:(resources_ : scanned_resources option) () =
  ({ next_token = next_token_; resources = resources_ } : list_resource_scan_resources_output)

let make_list_resource_scan_resources_input
    ?max_results:(max_results_ : resource_scanner_max_results option)
    ?next_token:(next_token_ : next_token option) ?tag_value:(tag_value_ : tag_value option)
    ?tag_key:(tag_key_ : tag_key option)
    ?resource_type_prefix:(resource_type_prefix_ : resource_type_prefix option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ~resource_scan_id:(resource_scan_id_ : resource_scan_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     tag_value = tag_value_;
     tag_key = tag_key_;
     resource_type_prefix = resource_type_prefix_;
     resource_identifier = resource_identifier_;
     resource_scan_id = resource_scan_id_;
   }
    : list_resource_scan_resources_input)

let make_list_resource_scan_related_resources_output ?next_token:(next_token_ : next_token option)
    ?related_resources:(related_resources_ : related_resources option) () =
  ({ next_token = next_token_; related_resources = related_resources_ }
    : list_resource_scan_related_resources_output)

let make_list_resource_scan_related_resources_input
    ?max_results:(max_results_ : boxed_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~resources:(resources_ : scanned_resource_identifiers)
    ~resource_scan_id:(resource_scan_id_ : resource_scan_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resources = resources_;
     resource_scan_id = resource_scan_id_;
   }
    : list_resource_scan_related_resources_input)

let make_list_imports_output ?next_token:(next_token_ : next_token option)
    ?imports:(imports_ : imports option) () =
  ({ next_token = next_token_; imports = imports_ } : list_imports_output)

let make_list_imports_input ?next_token:(next_token_ : next_token option)
    ~export_name:(export_name_ : export_name) () =
  ({ next_token = next_token_; export_name = export_name_ } : list_imports_input)

let make_hook_result_summary ?hook_execution_target:(hook_execution_target_ : hook_result_id option)
    ?type_arn:(type_arn_ : hook_type_arn option) ?target_id:(target_id_ : hook_result_id option)
    ?target_type:(target_type_ : list_hook_results_target_type option)
    ?invoked_at:(invoked_at_ : timestamp option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?status:(status_ : hook_status option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?type_name:(type_name_ : hook_type_name option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?hook_result_id:(hook_result_id_ : hook_invocation_id option) () =
  ({
     hook_execution_target = hook_execution_target_;
     type_arn = type_arn_;
     target_id = target_id_;
     target_type = target_type_;
     invoked_at = invoked_at_;
     hook_status_reason = hook_status_reason_;
     status = status_;
     type_configuration_version_id = type_configuration_version_id_;
     type_version_id = type_version_id_;
     type_name = type_name_;
     failure_mode = failure_mode_;
     invocation_point = invocation_point_;
     hook_result_id = hook_result_id_;
   }
    : hook_result_summary)

let make_list_hook_results_output ?next_token:(next_token_ : next_token option)
    ?hook_results:(hook_results_ : hook_result_summaries option)
    ?target_id:(target_id_ : hook_result_id option)
    ?target_type:(target_type_ : list_hook_results_target_type option) () =
  ({
     next_token = next_token_;
     hook_results = hook_results_;
     target_id = target_id_;
     target_type = target_type_;
   }
    : list_hook_results_output)

let make_list_hook_results_input ?next_token:(next_token_ : next_token option)
    ?status:(status_ : hook_status option) ?type_arn:(type_arn_ : hook_type_arn option)
    ?target_id:(target_id_ : hook_result_id option)
    ?target_type:(target_type_ : list_hook_results_target_type option) () =
  ({
     next_token = next_token_;
     status = status_;
     type_arn = type_arn_;
     target_id = target_id_;
     target_type = target_type_;
   }
    : list_hook_results_input)

let make_list_generated_templates_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_generated_templates_output)

let make_list_generated_templates_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_generated_templates_input)

let make_export_ ?value:(value_ : export_value option) ?name:(name_ : export_name option)
    ?exporting_stack_id:(exporting_stack_id_ : stack_id option) () =
  ({ value = value_; name = name_; exporting_stack_id = exporting_stack_id_ } : export_)

let make_list_exports_output ?next_token:(next_token_ : next_token option)
    ?exports:(exports_ : exports option) () =
  ({ next_token = next_token_; exports = exports_ } : list_exports_output)

let make_list_exports_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_exports_input)

let make_change_set_summary
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option)
    ?root_change_set_id:(root_change_set_id_ : change_set_id option)
    ?parent_change_set_id:(parent_change_set_id_ : change_set_id option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?description:(description_ : description option)
    ?creation_time:(creation_time_ : creation_time option)
    ?status_reason:(status_reason_ : change_set_status_reason option)
    ?status:(status_ : change_set_status option)
    ?execution_status:(execution_status_ : execution_status option)
    ?change_set_name:(change_set_name_ : change_set_name option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?stack_name:(stack_name_ : stack_name option) ?stack_id:(stack_id_ : stack_id option) () =
  ({
     import_existing_resources = import_existing_resources_;
     root_change_set_id = root_change_set_id_;
     parent_change_set_id = parent_change_set_id_;
     include_nested_stacks = include_nested_stacks_;
     description = description_;
     creation_time = creation_time_;
     status_reason = status_reason_;
     status = status_;
     execution_status = execution_status_;
     change_set_name = change_set_name_;
     change_set_id = change_set_id_;
     stack_name = stack_name_;
     stack_id = stack_id_;
   }
    : change_set_summary)

let make_list_change_sets_output ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : change_set_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_change_sets_output)

let make_list_change_sets_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ next_token = next_token_; stack_name = stack_name_ } : list_change_sets_input)

let make_import_stacks_to_stack_set_output
    ?operation_id:(operation_id_ : client_request_token option) () =
  ({ operation_id = operation_id_ } : import_stacks_to_stack_set_output)

let make_import_stacks_to_stack_set_input ?call_as:(call_as_ : call_as option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?stack_ids_url:(stack_ids_url_ : stack_ids_url option)
    ?stack_ids:(stack_ids_ : stack_id_list option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     operation_preferences = operation_preferences_;
     organizational_unit_ids = organizational_unit_ids_;
     stack_ids_url = stack_ids_url_;
     stack_ids = stack_ids_;
     stack_set_name = stack_set_name_;
   }
    : import_stacks_to_stack_set_input)

let make_hook_target ~action:(action_ : hook_target_action) ~target_id:(target_id_ : hook_target_id)
    ~target_type_name:(target_type_name_ : hook_target_type_name)
    ~target_type:(target_type_ : hook_target_type) () =
  ({
     action = action_;
     target_id = target_id_;
     target_type_name = target_type_name_;
     target_type = target_type_;
   }
    : hook_target)

let make_get_template_summary_output ?warnings:(warnings_ : warnings option)
    ?resource_identifier_summaries:
      (resource_identifier_summaries_ : resource_identifier_summaries option)
    ?declared_transforms:(declared_transforms_ : transforms_list option)
    ?metadata:(metadata_ : metadata option) ?version:(version_ : version option)
    ?resource_types:(resource_types_ : resource_types option)
    ?capabilities_reason:(capabilities_reason_ : capabilities_reason option)
    ?capabilities:(capabilities_ : capabilities option)
    ?description:(description_ : description option)
    ?parameters:(parameters_ : parameter_declarations option) () =
  ({
     warnings = warnings_;
     resource_identifier_summaries = resource_identifier_summaries_;
     declared_transforms = declared_transforms_;
     metadata = metadata_;
     version = version_;
     resource_types = resource_types_;
     capabilities_reason = capabilities_reason_;
     capabilities = capabilities_;
     description = description_;
     parameters = parameters_;
   }
    : get_template_summary_output)

let make_get_template_summary_input
    ?template_summary_config:(template_summary_config_ : template_summary_config option)
    ?call_as:(call_as_ : call_as option)
    ?stack_set_name:(stack_set_name_ : stack_set_name_or_id option)
    ?stack_name:(stack_name_ : stack_name_or_id option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option) () =
  ({
     template_summary_config = template_summary_config_;
     call_as = call_as_;
     stack_set_name = stack_set_name_;
     stack_name = stack_name_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
   }
    : get_template_summary_input)

let make_get_template_output ?stages_available:(stages_available_ : stage_list option)
    ?template_body:(template_body_ : template_body option) () =
  ({ stages_available = stages_available_; template_body = template_body_ } : get_template_output)

let make_get_template_input ?template_stage:(template_stage_ : template_stage option)
    ?change_set_name:(change_set_name_ : change_set_name_or_id option)
    ?stack_name:(stack_name_ : stack_name option) () =
  ({
     template_stage = template_stage_;
     change_set_name = change_set_name_;
     stack_name = stack_name_;
   }
    : get_template_input)

let make_get_stack_policy_output ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    () =
  ({ stack_policy_body = stack_policy_body_ } : get_stack_policy_output)

let make_get_stack_policy_input ~stack_name:(stack_name_ : stack_name) () =
  ({ stack_name = stack_name_ } : get_stack_policy_input)

let make_annotation ?severity_level:(severity_level_ : annotation_severity_level option)
    ?remediation_link:(remediation_link_ : annotation_remediation_link option)
    ?remediation_message:(remediation_message_ : remediation_message_remediation_message option)
    ?status_message:(status_message_ : remediation_message_status_message option)
    ?status:(status_ : annotation_status option)
    ?annotation_name:(annotation_name_ : annotation_name option) () =
  ({
     severity_level = severity_level_;
     remediation_link = remediation_link_;
     remediation_message = remediation_message_;
     status_message = status_message_;
     status = status_;
     annotation_name = annotation_name_;
   }
    : annotation)

let make_get_hook_result_output ?annotations:(annotations_ : annotation_list option)
    ?target:(target_ : hook_target option) ?invoked_at:(invoked_at_ : timestamp option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?status:(status_ : hook_status option) ?type_arn:(type_arn_ : hook_type_arn option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?original_type_name:(original_type_name_ : hook_type_name option)
    ?type_name:(type_name_ : hook_type_name option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?hook_result_id:(hook_result_id_ : hook_invocation_id option) () =
  ({
     annotations = annotations_;
     target = target_;
     invoked_at = invoked_at_;
     hook_status_reason = hook_status_reason_;
     status = status_;
     type_arn = type_arn_;
     type_configuration_version_id = type_configuration_version_id_;
     type_version_id = type_version_id_;
     original_type_name = original_type_name_;
     type_name = type_name_;
     failure_mode = failure_mode_;
     invocation_point = invocation_point_;
     hook_result_id = hook_result_id_;
   }
    : get_hook_result_output)

let make_get_hook_result_input ?hook_result_id:(hook_result_id_ : hook_invocation_id option) () =
  ({ hook_result_id = hook_result_id_ } : get_hook_result_input)

let make_get_generated_template_output ?template_body:(template_body_ : template_body option)
    ?status:(status_ : generated_template_status option) () =
  ({ template_body = template_body_; status = status_ } : get_generated_template_output)

let make_get_generated_template_input ?format:(format_ : template_format option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ generated_template_name = generated_template_name_; format = format_ }
    : get_generated_template_input)

let make_execute_stack_refactor_input ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) ()
    =
  ({ stack_refactor_id = stack_refactor_id_ } : execute_stack_refactor_input)

let make_execute_change_set_output () = (() : unit)

let make_execute_change_set_input
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?stack_name:(stack_name_ : stack_name_or_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     retain_except_on_create = retain_except_on_create_;
     disable_rollback = disable_rollback_;
     client_request_token = client_request_token_;
     stack_name = stack_name_;
     change_set_name = change_set_name_;
   }
    : execute_change_set_input)

let make_event_filter ?failed_events:(failed_events_ : failed_events_filter option) () =
  ({ failed_events = failed_events_ } : event_filter)

let make_estimate_template_cost_output ?url:(url_ : url option) () =
  ({ url = url_ } : estimate_template_cost_output)

let make_estimate_template_cost_input ?parameters:(parameters_ : parameters option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option) () =
  ({ parameters = parameters_; template_ur_l = template_ur_l_; template_body = template_body_ }
    : estimate_template_cost_input)

let make_detect_stack_set_drift_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : detect_stack_set_drift_output)

let make_detect_stack_set_drift_input ?call_as:(call_as_ : call_as option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     operation_preferences = operation_preferences_;
     stack_set_name = stack_set_name_;
   }
    : detect_stack_set_drift_input)

let make_detect_stack_resource_drift_output
    ~stack_resource_drift:(stack_resource_drift_ : stack_resource_drift) () =
  ({ stack_resource_drift = stack_resource_drift_ } : detect_stack_resource_drift_output)

let make_detect_stack_resource_drift_input
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ logical_resource_id = logical_resource_id_; stack_name = stack_name_ }
    : detect_stack_resource_drift_input)

let make_detect_stack_drift_output
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id) () =
  ({ stack_drift_detection_id = stack_drift_detection_id_ } : detect_stack_drift_output)

let make_detect_stack_drift_input
    ?logical_resource_ids:(logical_resource_ids_ : logical_resource_ids option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ logical_resource_ids = logical_resource_ids_; stack_name = stack_name_ }
    : detect_stack_drift_input)

let make_describe_type_registration_output ?type_version_arn:(type_version_arn_ : type_arn option)
    ?type_arn:(type_arn_ : type_arn option) ?description:(description_ : description option)
    ?progress_status:(progress_status_ : registration_status option) () =
  ({
     type_version_arn = type_version_arn_;
     type_arn = type_arn_;
     description = description_;
     progress_status = progress_status_;
   }
    : describe_type_registration_output)

let make_describe_type_registration_input
    ~registration_token:(registration_token_ : registration_token) () =
  ({ registration_token = registration_token_ } : describe_type_registration_input)

let make_describe_type_output ?auto_update:(auto_update_ : auto_update option)
    ?is_activated:(is_activated_ : is_activated option)
    ?latest_public_version:(latest_public_version_ : public_version_number option)
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?original_type_arn:(original_type_arn_ : type_arn option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?configuration_schema:(configuration_schema_ : configuration_schema option)
    ?time_created:(time_created_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option)
    ?documentation_url:(documentation_url_ : optional_secure_url option)
    ?source_url:(source_url_ : optional_secure_url option)
    ?visibility:(visibility_ : visibility option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?required_activated_types:(required_activated_types_ : required_activated_types option)
    ?logging_config:(logging_config_ : logging_config option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?provisioning_type:(provisioning_type_ : provisioning_type option)
    ?schema:(schema_ : type_schema option) ?description:(description_ : description option)
    ?type_tests_status_description:
      (type_tests_status_description_ : type_tests_status_description option)
    ?type_tests_status:(type_tests_status_ : type_tests_status option)
    ?is_default_version:(is_default_version_ : is_default_version option)
    ?default_version_id:(default_version_id_ : type_version_id option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : registry_type option)
    ?arn:(arn_ : type_arn option) () =
  ({
     auto_update = auto_update_;
     is_activated = is_activated_;
     latest_public_version = latest_public_version_;
     public_version_number = public_version_number_;
     original_type_arn = original_type_arn_;
     original_type_name = original_type_name_;
     publisher_id = publisher_id_;
     configuration_schema = configuration_schema_;
     time_created = time_created_;
     last_updated = last_updated_;
     documentation_url = documentation_url_;
     source_url = source_url_;
     visibility = visibility_;
     execution_role_arn = execution_role_arn_;
     required_activated_types = required_activated_types_;
     logging_config = logging_config_;
     deprecated_status = deprecated_status_;
     provisioning_type = provisioning_type_;
     schema = schema_;
     description = description_;
     type_tests_status_description = type_tests_status_description_;
     type_tests_status = type_tests_status_;
     is_default_version = is_default_version_;
     default_version_id = default_version_id_;
     type_name = type_name_;
     type_ = type__;
     arn = arn_;
   }
    : describe_type_output)

let make_describe_type_input
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?version_id:(version_id_ : type_version_id option) ?arn:(arn_ : type_arn option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : registry_type option) () =
  ({
     public_version_number = public_version_number_;
     publisher_id = publisher_id_;
     version_id = version_id_;
     arn = arn_;
     type_name = type_name_;
     type_ = type__;
   }
    : describe_type_input)

let make_describe_stacks_output ?next_token:(next_token_ : next_token option)
    ?stacks:(stacks_ : stacks option) () =
  ({ next_token = next_token_; stacks = stacks_ } : describe_stacks_output)

let make_describe_stacks_input ?next_token:(next_token_ : next_token option)
    ?stack_name:(stack_name_ : stack_name option) () =
  ({ next_token = next_token_; stack_name = stack_name_ } : describe_stacks_input)

let make_describe_stack_set_output ?stack_set:(stack_set_ : stack_set option) () =
  ({ stack_set = stack_set_ } : describe_stack_set_output)

let make_describe_stack_set_operation_output
    ?stack_set_operation:(stack_set_operation_ : stack_set_operation option) () =
  ({ stack_set_operation = stack_set_operation_ } : describe_stack_set_operation_output)

let make_describe_stack_set_operation_input ?call_as:(call_as_ : call_as option)
    ~operation_id:(operation_id_ : client_request_token)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ call_as = call_as_; operation_id = operation_id_; stack_set_name = stack_set_name_ }
    : describe_stack_set_operation_input)

let make_describe_stack_set_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ call_as = call_as_; stack_set_name = stack_set_name_ } : describe_stack_set_input)

let make_describe_stack_resources_output
    ?stack_resources:(stack_resources_ : stack_resources option) () =
  ({ stack_resources = stack_resources_ } : describe_stack_resources_output)

let make_describe_stack_resources_input
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?stack_name:(stack_name_ : stack_name option) () =
  ({
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     stack_name = stack_name_;
   }
    : describe_stack_resources_input)

let make_describe_stack_resource_output
    ?stack_resource_detail:(stack_resource_detail_ : stack_resource_detail option) () =
  ({ stack_resource_detail = stack_resource_detail_ } : describe_stack_resource_output)

let make_describe_stack_resource_input
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ logical_resource_id = logical_resource_id_; stack_name = stack_name_ }
    : describe_stack_resource_input)

let make_describe_stack_resource_drifts_output ?next_token:(next_token_ : next_token option)
    ~stack_resource_drifts:(stack_resource_drifts_ : stack_resource_drifts) () =
  ({ next_token = next_token_; stack_resource_drifts = stack_resource_drifts_ }
    : describe_stack_resource_drifts_output)

let make_describe_stack_resource_drifts_input ?max_results:(max_results_ : boxed_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?stack_resource_drift_status_filters:
      (stack_resource_drift_status_filters_ : stack_resource_drift_status_filters option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     stack_resource_drift_status_filters = stack_resource_drift_status_filters_;
     stack_name = stack_name_;
   }
    : describe_stack_resource_drifts_input)

let make_describe_stack_refactor_output
    ?status_reason:(status_reason_ : stack_refactor_status_reason option)
    ?status:(status_ : stack_refactor_status option)
    ?execution_status_reason:(execution_status_reason_ : execution_status_reason option)
    ?execution_status:(execution_status_ : stack_refactor_execution_status option)
    ?stack_ids:(stack_ids_ : stack_ids option)
    ?stack_refactor_id:(stack_refactor_id_ : stack_refactor_id option)
    ?description:(description_ : description option) () =
  ({
     status_reason = status_reason_;
     status = status_;
     execution_status_reason = execution_status_reason_;
     execution_status = execution_status_;
     stack_ids = stack_ids_;
     stack_refactor_id = stack_refactor_id_;
     description = description_;
   }
    : describe_stack_refactor_output)

let make_describe_stack_refactor_input ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id)
    () =
  ({ stack_refactor_id = stack_refactor_id_ } : describe_stack_refactor_input)

let make_describe_stack_instance_output ?stack_instance:(stack_instance_ : stack_instance option) ()
    =
  ({ stack_instance = stack_instance_ } : describe_stack_instance_output)

let make_describe_stack_instance_input ?call_as:(call_as_ : call_as option)
    ~stack_instance_region:(stack_instance_region_ : region)
    ~stack_instance_account:(stack_instance_account_ : account)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     call_as = call_as_;
     stack_instance_region = stack_instance_region_;
     stack_instance_account = stack_instance_account_;
     stack_set_name = stack_set_name_;
   }
    : describe_stack_instance_input)

let make_describe_stack_events_output ?next_token:(next_token_ : next_token option)
    ?stack_events:(stack_events_ : stack_events option) () =
  ({ next_token = next_token_; stack_events = stack_events_ } : describe_stack_events_output)

let make_describe_stack_events_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ next_token = next_token_; stack_name = stack_name_ } : describe_stack_events_input)

let make_describe_stack_drift_detection_status_output
    ?drifted_stack_resource_count:(drifted_stack_resource_count_ : boxed_integer option)
    ?detection_status_reason:(detection_status_reason_ : stack_drift_detection_status_reason option)
    ?stack_drift_status:(stack_drift_status_ : stack_drift_status option)
    ~timestamp:(timestamp_ : timestamp)
    ~detection_status:(detection_status_ : stack_drift_detection_status)
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id)
    ~stack_id:(stack_id_ : stack_id) () =
  ({
     timestamp = timestamp_;
     drifted_stack_resource_count = drifted_stack_resource_count_;
     detection_status_reason = detection_status_reason_;
     detection_status = detection_status_;
     stack_drift_status = stack_drift_status_;
     stack_drift_detection_id = stack_drift_detection_id_;
     stack_id = stack_id_;
   }
    : describe_stack_drift_detection_status_output)

let make_describe_stack_drift_detection_status_input
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id) () =
  ({ stack_drift_detection_id = stack_drift_detection_id_ }
    : describe_stack_drift_detection_status_input)

let make_describe_resource_scan_output ?scan_filters:(scan_filters_ : scan_filters option)
    ?resources_read:(resources_read_ : resources_read option)
    ?resources_scanned:(resources_scanned_ : resources_scanned option)
    ?resource_types:(resource_types_ : resource_types option)
    ?percentage_completed:(percentage_completed_ : percentage_completed option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status_reason:(status_reason_ : resource_scan_status_reason option)
    ?status:(status_ : resource_scan_status option)
    ?resource_scan_id:(resource_scan_id_ : resource_scan_id option) () =
  ({
     scan_filters = scan_filters_;
     resources_read = resources_read_;
     resources_scanned = resources_scanned_;
     resource_types = resource_types_;
     percentage_completed = percentage_completed_;
     end_time = end_time_;
     start_time = start_time_;
     status_reason = status_reason_;
     status = status_;
     resource_scan_id = resource_scan_id_;
   }
    : describe_resource_scan_output)

let make_describe_resource_scan_input ~resource_scan_id:(resource_scan_id_ : resource_scan_id) () =
  ({ resource_scan_id = resource_scan_id_ } : describe_resource_scan_input)

let make_describe_publisher_output
    ?publisher_profile:(publisher_profile_ : publisher_profile option)
    ?identity_provider:(identity_provider_ : identity_provider option)
    ?publisher_status:(publisher_status_ : publisher_status option)
    ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({
     publisher_profile = publisher_profile_;
     identity_provider = identity_provider_;
     publisher_status = publisher_status_;
     publisher_id = publisher_id_;
   }
    : describe_publisher_output)

let make_describe_publisher_input ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({ publisher_id = publisher_id_ } : describe_publisher_input)

let make_describe_organizations_access_output ?status:(status_ : organization_status option) () =
  ({ status = status_ } : describe_organizations_access_output)

let make_describe_organizations_access_input ?call_as:(call_as_ : call_as option) () =
  ({ call_as = call_as_ } : describe_organizations_access_input)

let make_describe_generated_template_output
    ?total_warnings:(total_warnings_ : total_warnings option)
    ?template_configuration:(template_configuration_ : template_configuration option)
    ?stack_id:(stack_id_ : stack_id option) ?progress:(progress_ : template_progress option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?status_reason:(status_reason_ : template_status_reason option)
    ?status:(status_ : generated_template_status option)
    ?resources:(resources_ : resource_details option)
    ?generated_template_name:(generated_template_name_ : generated_template_name option)
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({
     total_warnings = total_warnings_;
     template_configuration = template_configuration_;
     stack_id = stack_id_;
     progress = progress_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     status_reason = status_reason_;
     status = status_;
     resources = resources_;
     generated_template_name = generated_template_name_;
     generated_template_id = generated_template_id_;
   }
    : describe_generated_template_output)

let make_describe_generated_template_input
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ generated_template_name = generated_template_name_ } : describe_generated_template_input)

let make_describe_events_output ?next_token:(next_token_ : next_token option)
    ?operation_events:(operation_events_ : operation_events option) () =
  ({ next_token = next_token_; operation_events = operation_events_ } : describe_events_output)

let make_describe_events_input ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : event_filter option) ?operation_id:(operation_id_ : operation_id option)
    ?change_set_name:(change_set_name_ : change_set_name_or_id option)
    ?stack_name:(stack_name_ : stack_name_or_id option) () =
  ({
     next_token = next_token_;
     filters = filters_;
     operation_id = operation_id_;
     change_set_name = change_set_name_;
     stack_name = stack_name_;
   }
    : describe_events_input)

let make_change ?resource_change:(resource_change_ : resource_change option)
    ?hook_invocation_count:(hook_invocation_count_ : hook_invocation_count option)
    ?type_:(type__ : change_type option) () =
  ({
     resource_change = resource_change_;
     hook_invocation_count = hook_invocation_count_;
     type_ = type__;
   }
    : change)

let make_describe_change_set_output
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?deployment_mode:(deployment_mode_ : deployment_mode option)
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option)
    ?on_stack_failure:(on_stack_failure_ : on_stack_failure option)
    ?root_change_set_id:(root_change_set_id_ : change_set_id option)
    ?parent_change_set_id:(parent_change_set_id_ : change_set_id option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?next_token:(next_token_ : next_token option) ?changes:(changes_ : changes option)
    ?tags:(tags_ : tags option) ?capabilities:(capabilities_ : capabilities option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?stack_drift_status:(stack_drift_status_ : stack_drift_status option)
    ?status_reason:(status_reason_ : change_set_status_reason option)
    ?status:(status_ : change_set_status option)
    ?execution_status:(execution_status_ : execution_status option)
    ?creation_time:(creation_time_ : creation_time option)
    ?parameters:(parameters_ : parameters option) ?description:(description_ : description option)
    ?stack_name:(stack_name_ : stack_name option) ?stack_id:(stack_id_ : stack_id option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?change_set_name:(change_set_name_ : change_set_name option) () =
  ({
     deployment_config = deployment_config_;
     deployment_mode = deployment_mode_;
     import_existing_resources = import_existing_resources_;
     on_stack_failure = on_stack_failure_;
     root_change_set_id = root_change_set_id_;
     parent_change_set_id = parent_change_set_id_;
     include_nested_stacks = include_nested_stacks_;
     next_token = next_token_;
     changes = changes_;
     tags = tags_;
     capabilities = capabilities_;
     rollback_configuration = rollback_configuration_;
     notification_ar_ns = notification_ar_ns_;
     stack_drift_status = stack_drift_status_;
     status_reason = status_reason_;
     status = status_;
     execution_status = execution_status_;
     creation_time = creation_time_;
     parameters = parameters_;
     description = description_;
     stack_name = stack_name_;
     stack_id = stack_id_;
     change_set_id = change_set_id_;
     change_set_name = change_set_name_;
   }
    : describe_change_set_output)

let make_describe_change_set_input
    ?include_property_values:(include_property_values_ : include_property_values option)
    ?next_token:(next_token_ : next_token option)
    ?stack_name:(stack_name_ : stack_name_or_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     include_property_values = include_property_values_;
     next_token = next_token_;
     stack_name = stack_name_;
     change_set_name = change_set_name_;
   }
    : describe_change_set_input)

let make_change_set_hook_resource_target_details
    ?resource_action:(resource_action_ : change_action option)
    ?resource_type:(resource_type_ : hook_target_type_name option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option) () =
  ({
     resource_action = resource_action_;
     resource_type = resource_type_;
     logical_resource_id = logical_resource_id_;
   }
    : change_set_hook_resource_target_details)

let make_change_set_hook_target_details
    ?resource_target_details:
      (resource_target_details_ : change_set_hook_resource_target_details option)
    ?target_type:(target_type_ : hook_target_type option) () =
  ({ resource_target_details = resource_target_details_; target_type = target_type_ }
    : change_set_hook_target_details)

let make_change_set_hook ?target_details:(target_details_ : change_set_hook_target_details option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?type_name:(type_name_ : hook_type_name option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option) () =
  ({
     target_details = target_details_;
     type_configuration_version_id = type_configuration_version_id_;
     type_version_id = type_version_id_;
     type_name = type_name_;
     failure_mode = failure_mode_;
     invocation_point = invocation_point_;
   }
    : change_set_hook)

let make_describe_change_set_hooks_output ?stack_name:(stack_name_ : stack_name option)
    ?stack_id:(stack_id_ : stack_id option) ?next_token:(next_token_ : next_token option)
    ?status:(status_ : change_set_hooks_status option) ?hooks:(hooks_ : change_set_hooks option)
    ?change_set_name:(change_set_name_ : change_set_name option)
    ?change_set_id:(change_set_id_ : change_set_id option) () =
  ({
     stack_name = stack_name_;
     stack_id = stack_id_;
     next_token = next_token_;
     status = status_;
     hooks = hooks_;
     change_set_name = change_set_name_;
     change_set_id = change_set_id_;
   }
    : describe_change_set_hooks_output)

let make_describe_change_set_hooks_input
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?next_token:(next_token_ : next_token option)
    ?stack_name:(stack_name_ : stack_name_or_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     logical_resource_id = logical_resource_id_;
     next_token = next_token_;
     stack_name = stack_name_;
     change_set_name = change_set_name_;
   }
    : describe_change_set_hooks_input)

let make_account_limit ?value:(value_ : limit_value option) ?name:(name_ : limit_name option) () =
  ({ value = value_; name = name_ } : account_limit)

let make_describe_account_limits_output ?next_token:(next_token_ : next_token option)
    ?account_limits:(account_limits_ : account_limit_list option) () =
  ({ next_token = next_token_; account_limits = account_limits_ } : describe_account_limits_output)

let make_describe_account_limits_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : describe_account_limits_input)

let make_deregister_type_output () = (() : unit)

let make_deregister_type_input ?version_id:(version_id_ : type_version_id option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : registry_type option)
    ?arn:(arn_ : private_type_arn option) () =
  ({ version_id = version_id_; type_name = type_name_; type_ = type__; arn = arn_ }
    : deregister_type_input)

let make_delete_stack_set_output () = (() : unit)

let make_delete_stack_set_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ call_as = call_as_; stack_set_name = stack_set_name_ } : delete_stack_set_input)

let make_delete_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : delete_stack_instances_output)

let make_delete_stack_instances_input ?call_as:(call_as_ : call_as option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?accounts:(accounts_ : account_list option) ~retain_stacks:(retain_stacks_ : retain_stacks)
    ~regions:(regions_ : region_list) ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     retain_stacks = retain_stacks_;
     operation_preferences = operation_preferences_;
     regions = regions_;
     deployment_targets = deployment_targets_;
     accounts = accounts_;
     stack_set_name = stack_set_name_;
   }
    : delete_stack_instances_input)

let make_delete_stack_input ?deployment_config:(deployment_config_ : deployment_config option)
    ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retain_resources:(retain_resources_ : retain_resources option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     deployment_config = deployment_config_;
     deletion_mode = deletion_mode_;
     client_request_token = client_request_token_;
     role_ar_n = role_ar_n_;
     retain_resources = retain_resources_;
     stack_name = stack_name_;
   }
    : delete_stack_input)

let make_delete_generated_template_input
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ generated_template_name = generated_template_name_ } : delete_generated_template_input)

let make_delete_change_set_output () = (() : unit)

let make_delete_change_set_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({ stack_name = stack_name_; change_set_name = change_set_name_ } : delete_change_set_input)

let make_deactivate_type_output () = (() : unit)

let make_deactivate_type_input ?arn:(arn_ : private_type_arn option)
    ?type_:(type__ : third_party_type option) ?type_name:(type_name_ : type_name option) () =
  ({ arn = arn_; type_ = type__; type_name = type_name_ } : deactivate_type_input)

let make_deactivate_organizations_access_output () = (() : unit)
let make_deactivate_organizations_access_input () = (() : unit)

let make_create_stack_set_output ?stack_set_id:(stack_set_id_ : stack_set_id option) () =
  ({ stack_set_id = stack_set_id_ } : create_stack_set_output)

let make_create_stack_set_input ?managed_execution:(managed_execution_ : managed_execution option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?call_as:(call_as_ : call_as option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?permission_model:(permission_model_ : permission_models option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?tags:(tags_ : tags option) ?capabilities:(capabilities_ : capabilities option)
    ?parameters:(parameters_ : parameters option) ?stack_id:(stack_id_ : stack_id option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option)
    ?description:(description_ : description option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     managed_execution = managed_execution_;
     client_request_token = client_request_token_;
     call_as = call_as_;
     auto_deployment = auto_deployment_;
     permission_model = permission_model_;
     execution_role_name = execution_role_name_;
     administration_role_ar_n = administration_role_ar_n_;
     tags = tags_;
     capabilities = capabilities_;
     parameters = parameters_;
     stack_id = stack_id_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
     description = description_;
     stack_set_name = stack_set_name_;
   }
    : create_stack_set_input)

let make_create_stack_refactor_output ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) ()
    =
  ({ stack_refactor_id = stack_refactor_id_ } : create_stack_refactor_output)

let make_create_stack_refactor_input
    ?resource_mappings:(resource_mappings_ : resource_mappings option)
    ?enable_stack_creation:(enable_stack_creation_ : enable_stack_creation option)
    ?description:(description_ : description option)
    ~stack_definitions:(stack_definitions_ : stack_definitions) () =
  ({
     stack_definitions = stack_definitions_;
     resource_mappings = resource_mappings_;
     enable_stack_creation = enable_stack_creation_;
     description = description_;
   }
    : create_stack_refactor_input)

let make_create_stack_output ?operation_id:(operation_id_ : operation_id option)
    ?stack_id:(stack_id_ : stack_id option) () =
  ({ operation_id = operation_id_; stack_id = stack_id_ } : create_stack_output)

let make_create_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : create_stack_instances_output)

let make_create_stack_instances_input ?call_as:(call_as_ : call_as option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?accounts:(accounts_ : account_list option) ~regions:(regions_ : region_list)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     call_as = call_as_;
     operation_id = operation_id_;
     operation_preferences = operation_preferences_;
     parameter_overrides = parameter_overrides_;
     regions = regions_;
     deployment_targets = deployment_targets_;
     accounts = accounts_;
     stack_set_name = stack_set_name_;
   }
    : create_stack_instances_input)

let make_create_stack_input ?disable_validation:(disable_validation_ : disable_validation option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?enable_termination_protection:
      (enable_termination_protection_ : enable_termination_protection option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tags option) ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option)
    ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ?on_failure:(on_failure_ : on_failure option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?resource_types:(resource_types_ : resource_types option)
    ?capabilities:(capabilities_ : capabilities option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?timeout_in_minutes:(timeout_in_minutes_ : timeout_minutes option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?parameters:(parameters_ : parameters option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option) ~stack_name:(stack_name_ : stack_name) ()
    =
  ({
     disable_validation = disable_validation_;
     deployment_config = deployment_config_;
     retain_except_on_create = retain_except_on_create_;
     enable_termination_protection = enable_termination_protection_;
     client_request_token = client_request_token_;
     tags = tags_;
     stack_policy_ur_l = stack_policy_ur_l_;
     stack_policy_body = stack_policy_body_;
     on_failure = on_failure_;
     role_ar_n = role_ar_n_;
     resource_types = resource_types_;
     capabilities = capabilities_;
     notification_ar_ns = notification_ar_ns_;
     timeout_in_minutes = timeout_in_minutes_;
     rollback_configuration = rollback_configuration_;
     disable_rollback = disable_rollback_;
     parameters = parameters_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
     stack_name = stack_name_;
   }
    : create_stack_input)

let make_create_generated_template_output
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({ generated_template_id = generated_template_id_ } : create_generated_template_output)

let make_create_generated_template_input
    ?template_configuration:(template_configuration_ : template_configuration option)
    ?stack_name:(stack_name_ : stack_name option)
    ?resources:(resources_ : resource_definitions option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({
     template_configuration = template_configuration_;
     stack_name = stack_name_;
     generated_template_name = generated_template_name_;
     resources = resources_;
   }
    : create_generated_template_input)

let make_create_change_set_output ?stack_id:(stack_id_ : stack_id option)
    ?id:(id_ : change_set_id option) () =
  ({ stack_id = stack_id_; id = id_ } : create_change_set_output)

let make_create_change_set_input
    ?disable_validation:(disable_validation_ : disable_validation option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?deployment_mode:(deployment_mode_ : deployment_mode option)
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option)
    ?on_stack_failure:(on_stack_failure_ : on_stack_failure option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?resources_to_import:(resources_to_import_ : resources_to_import option)
    ?change_set_type:(change_set_type_ : change_set_type option)
    ?description:(description_ : description option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tags option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?resource_types:(resource_types_ : resource_types option)
    ?capabilities:(capabilities_ : capabilities option)
    ?parameters:(parameters_ : parameters option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?template_body:(template_body_ : template_body option)
    ~change_set_name:(change_set_name_ : change_set_name)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     disable_validation = disable_validation_;
     deployment_config = deployment_config_;
     deployment_mode = deployment_mode_;
     import_existing_resources = import_existing_resources_;
     on_stack_failure = on_stack_failure_;
     include_nested_stacks = include_nested_stacks_;
     resources_to_import = resources_to_import_;
     change_set_type = change_set_type_;
     description = description_;
     client_token = client_token_;
     change_set_name = change_set_name_;
     tags = tags_;
     notification_ar_ns = notification_ar_ns_;
     rollback_configuration = rollback_configuration_;
     role_ar_n = role_ar_n_;
     resource_types = resource_types_;
     capabilities = capabilities_;
     parameters = parameters_;
     use_previous_template = use_previous_template_;
     template_ur_l = template_ur_l_;
     template_body = template_body_;
     stack_name = stack_name_;
   }
    : create_change_set_input)

let make_continue_update_rollback_output () = (() : unit)

let make_continue_update_rollback_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?resources_to_skip:(resources_to_skip_ : resources_to_skip option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     client_request_token = client_request_token_;
     resources_to_skip = resources_to_skip_;
     role_ar_n = role_ar_n_;
     stack_name = stack_name_;
   }
    : continue_update_rollback_input)

let make_cancel_update_stack_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ client_request_token = client_request_token_; stack_name = stack_name_ }
    : cancel_update_stack_input)

let make_batch_describe_type_configurations_error
    ?type_configuration_identifier:
      (type_configuration_identifier_ : type_configuration_identifier option)
    ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) () =
  ({
     type_configuration_identifier = type_configuration_identifier_;
     error_message = error_message_;
     error_code = error_code_;
   }
    : batch_describe_type_configurations_error)

let make_batch_describe_type_configurations_output
    ?type_configurations:(type_configurations_ : type_configuration_details_list option)
    ?unprocessed_type_configurations:
      (unprocessed_type_configurations_ : unprocessed_type_configurations option)
    ?errors:(errors_ : batch_describe_type_configurations_errors option) () =
  ({
     type_configurations = type_configurations_;
     unprocessed_type_configurations = unprocessed_type_configurations_;
     errors = errors_;
   }
    : batch_describe_type_configurations_output)

let make_batch_describe_type_configurations_input
    ~type_configuration_identifiers:
      (type_configuration_identifiers_ : type_configuration_identifiers) () =
  ({ type_configuration_identifiers = type_configuration_identifiers_ }
    : batch_describe_type_configurations_input)

let make_activate_type_output ?arn:(arn_ : private_type_arn option) () =
  ({ arn = arn_ } : activate_type_output)

let make_activate_type_input ?major_version:(major_version_ : major_version option)
    ?version_bump:(version_bump_ : version_bump option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?logging_config:(logging_config_ : logging_config option)
    ?auto_update:(auto_update_ : auto_update option)
    ?type_name_alias:(type_name_alias_ : type_name option)
    ?type_name:(type_name_ : type_name option) ?publisher_id:(publisher_id_ : publisher_id option)
    ?public_type_arn:(public_type_arn_ : third_party_type_arn option)
    ?type_:(type__ : third_party_type option) () =
  ({
     major_version = major_version_;
     version_bump = version_bump_;
     execution_role_arn = execution_role_arn_;
     logging_config = logging_config_;
     auto_update = auto_update_;
     type_name_alias = type_name_alias_;
     type_name = type_name_;
     publisher_id = publisher_id_;
     public_type_arn = public_type_arn_;
     type_ = type__;
   }
    : activate_type_input)

let make_activate_organizations_access_output () = (() : unit)
let make_activate_organizations_access_input () = (() : unit)
