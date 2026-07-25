open Types

let make_account_limit ?name:(name_ : limit_name option) ?value:(value_ : limit_value option) () =
  ({ name = name_; value = value_ } : account_limit)

let make_activate_organizations_access_output () = (() : unit)
let make_activate_organizations_access_input () = (() : unit)

let make_activate_type_output ?arn:(arn_ : private_type_arn option) () =
  ({ arn = arn_ } : activate_type_output)

let make_logging_config ~log_role_arn:(log_role_arn_ : role_ar_n2)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_role_arn = log_role_arn_; log_group_name = log_group_name_ } : logging_config)

let make_activate_type_input ?type_:(type__ : third_party_type option)
    ?public_type_arn:(public_type_arn_ : third_party_type_arn option)
    ?publisher_id:(publisher_id_ : publisher_id option) ?type_name:(type_name_ : type_name option)
    ?type_name_alias:(type_name_alias_ : type_name option)
    ?auto_update:(auto_update_ : auto_update option)
    ?logging_config:(logging_config_ : logging_config option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?version_bump:(version_bump_ : version_bump option)
    ?major_version:(major_version_ : major_version option) () =
  ({
     type_ = type__;
     public_type_arn = public_type_arn_;
     publisher_id = publisher_id_;
     type_name = type_name_;
     type_name_alias = type_name_alias_;
     auto_update = auto_update_;
     logging_config = logging_config_;
     execution_role_arn = execution_role_arn_;
     version_bump = version_bump_;
     major_version = major_version_;
   }
    : activate_type_input)

let make_annotation ?annotation_name:(annotation_name_ : annotation_name option)
    ?status:(status_ : annotation_status option)
    ?status_message:(status_message_ : remediation_message_status_message option)
    ?remediation_message:(remediation_message_ : remediation_message_remediation_message option)
    ?remediation_link:(remediation_link_ : annotation_remediation_link option)
    ?severity_level:(severity_level_ : annotation_severity_level option) () =
  ({
     annotation_name = annotation_name_;
     status = status_;
     status_message = status_message_;
     remediation_message = remediation_message_;
     remediation_link = remediation_link_;
     severity_level = severity_level_;
   }
    : annotation)

let make_auto_deployment ?enabled:(enabled_ : auto_deployment_nullable option)
    ?retain_stacks_on_account_removal:
      (retain_stacks_on_account_removal_ : retain_stacks_on_account_removal_nullable option)
    ?depends_on:(depends_on_ : stack_set_arn_list option) () =
  ({
     enabled = enabled_;
     retain_stacks_on_account_removal = retain_stacks_on_account_removal_;
     depends_on = depends_on_;
   }
    : auto_deployment)

let make_type_configuration_details ?arn:(arn_ : type_configuration_arn option)
    ?alias:(alias_ : type_configuration_alias option)
    ?configuration:(configuration_ : type_configuration option)
    ?last_updated:(last_updated_ : timestamp option) ?type_arn:(type_arn_ : type_arn option)
    ?type_name:(type_name_ : type_name option)
    ?is_default_configuration:(is_default_configuration_ : is_default_configuration option) () =
  ({
     arn = arn_;
     alias = alias_;
     configuration = configuration_;
     last_updated = last_updated_;
     type_arn = type_arn_;
     type_name = type_name_;
     is_default_configuration = is_default_configuration_;
   }
    : type_configuration_details)

let make_type_configuration_identifier ?type_arn:(type_arn_ : type_arn option)
    ?type_configuration_alias:(type_configuration_alias_ : type_configuration_alias option)
    ?type_configuration_arn:(type_configuration_arn_ : type_configuration_arn option)
    ?type_:(type__ : third_party_type option) ?type_name:(type_name_ : type_name option) () =
  ({
     type_arn = type_arn_;
     type_configuration_alias = type_configuration_alias_;
     type_configuration_arn = type_configuration_arn_;
     type_ = type__;
     type_name = type_name_;
   }
    : type_configuration_identifier)

let make_batch_describe_type_configurations_error ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option)
    ?type_configuration_identifier:
      (type_configuration_identifier_ : type_configuration_identifier option) () =
  ({
     error_code = error_code_;
     error_message = error_message_;
     type_configuration_identifier = type_configuration_identifier_;
   }
    : batch_describe_type_configurations_error)

let make_batch_describe_type_configurations_output
    ?errors:(errors_ : batch_describe_type_configurations_errors option)
    ?unprocessed_type_configurations:
      (unprocessed_type_configurations_ : unprocessed_type_configurations option)
    ?type_configurations:(type_configurations_ : type_configuration_details_list option) () =
  ({
     errors = errors_;
     unprocessed_type_configurations = unprocessed_type_configurations_;
     type_configurations = type_configurations_;
   }
    : batch_describe_type_configurations_output)

let make_batch_describe_type_configurations_input
    ~type_configuration_identifiers:
      (type_configuration_identifiers_ : type_configuration_identifiers) () =
  ({ type_configuration_identifiers = type_configuration_identifiers_ }
    : batch_describe_type_configurations_input)

let make_cancel_update_stack_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ stack_name = stack_name_; client_request_token = client_request_token_ }
    : cancel_update_stack_input)

let make_module_info ?type_hierarchy:(type_hierarchy_ : type_hierarchy option)
    ?logical_id_hierarchy:(logical_id_hierarchy_ : logical_id_hierarchy option) () =
  ({ type_hierarchy = type_hierarchy_; logical_id_hierarchy = logical_id_hierarchy_ } : module_info)

let make_live_resource_drift
    ?previous_value:(previous_value_ : resource_drift_previous_value option)
    ?actual_value:(actual_value_ : resource_drift_actual_value option)
    ?drift_detection_timestamp:(drift_detection_timestamp_ : timestamp option) () =
  ({
     previous_value = previous_value_;
     actual_value = actual_value_;
     drift_detection_timestamp = drift_detection_timestamp_;
   }
    : live_resource_drift)

let make_resource_target_definition ?attribute:(attribute_ : resource_attribute option)
    ?name:(name_ : property_name option)
    ?requires_recreation:(requires_recreation_ : requires_recreation option)
    ?path:(path_ : resource_property_path option)
    ?before_value:(before_value_ : before_value option)
    ?after_value:(after_value_ : after_value option)
    ?before_value_from:(before_value_from_ : before_value_from option)
    ?after_value_from:(after_value_from_ : after_value_from option)
    ?drift:(drift_ : live_resource_drift option)
    ?attribute_change_type:(attribute_change_type_ : attribute_change_type option) () =
  ({
     attribute = attribute_;
     name = name_;
     requires_recreation = requires_recreation_;
     path = path_;
     before_value = before_value_;
     after_value = after_value_;
     before_value_from = before_value_from_;
     after_value_from = after_value_from_;
     drift = drift_;
     attribute_change_type = attribute_change_type_;
   }
    : resource_target_definition)

let make_resource_change_detail ?target:(target_ : resource_target_definition option)
    ?evaluation:(evaluation_ : evaluation_type option)
    ?change_source:(change_source_ : change_source option)
    ?causing_entity:(causing_entity_ : causing_entity option) () =
  ({
     target = target_;
     evaluation = evaluation_;
     change_source = change_source_;
     causing_entity = causing_entity_;
   }
    : resource_change_detail)

let make_resource_drift_ignored_attribute ?path:(path_ : resource_property_path option)
    ?reason:(reason_ : drift_ignored_reason option) () =
  ({ path = path_; reason = reason_ } : resource_drift_ignored_attribute)

let make_resource_change ?policy_action:(policy_action_ : policy_action option)
    ?action:(action_ : change_action option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_type:(resource_type_ : resource_type option)
    ?replacement:(replacement_ : replacement option) ?scope:(scope_ : scope option)
    ?resource_drift_status:(resource_drift_status_ : stack_resource_drift_status option)
    ?resource_drift_ignored_attributes:
      (resource_drift_ignored_attributes_ : resource_drift_ignored_attributes option)
    ?details:(details_ : resource_change_details option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?module_info:(module_info_ : module_info option)
    ?before_context:(before_context_ : before_context option)
    ?after_context:(after_context_ : after_context option)
    ?previous_deployment_context:(previous_deployment_context_ : previous_deployment_context option)
    () =
  ({
     policy_action = policy_action_;
     action = action_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     replacement = replacement_;
     scope = scope_;
     resource_drift_status = resource_drift_status_;
     resource_drift_ignored_attributes = resource_drift_ignored_attributes_;
     details = details_;
     change_set_id = change_set_id_;
     module_info = module_info_;
     before_context = before_context_;
     after_context = after_context_;
     previous_deployment_context = previous_deployment_context_;
   }
    : resource_change)

let make_change ?type_:(type__ : change_type option)
    ?hook_invocation_count:(hook_invocation_count_ : hook_invocation_count option)
    ?resource_change:(resource_change_ : resource_change option) () =
  ({
     type_ = type__;
     hook_invocation_count = hook_invocation_count_;
     resource_change = resource_change_;
   }
    : change)

let make_change_set_hook_resource_target_details
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?resource_type:(resource_type_ : hook_target_type_name option)
    ?resource_action:(resource_action_ : change_action option) () =
  ({
     logical_resource_id = logical_resource_id_;
     resource_type = resource_type_;
     resource_action = resource_action_;
   }
    : change_set_hook_resource_target_details)

let make_change_set_hook_target_details ?target_type:(target_type_ : hook_target_type option)
    ?resource_target_details:
      (resource_target_details_ : change_set_hook_resource_target_details option) () =
  ({ target_type = target_type_; resource_target_details = resource_target_details_ }
    : change_set_hook_target_details)

let make_change_set_hook ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?type_name:(type_name_ : hook_type_name option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?target_details:(target_details_ : change_set_hook_target_details option) () =
  ({
     invocation_point = invocation_point_;
     failure_mode = failure_mode_;
     type_name = type_name_;
     type_version_id = type_version_id_;
     type_configuration_version_id = type_configuration_version_id_;
     target_details = target_details_;
   }
    : change_set_hook)

let make_change_set_summary ?stack_id:(stack_id_ : stack_id option)
    ?stack_name:(stack_name_ : stack_name option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?change_set_name:(change_set_name_ : change_set_name option)
    ?execution_status:(execution_status_ : execution_status option)
    ?status:(status_ : change_set_status option)
    ?status_reason:(status_reason_ : change_set_status_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?description:(description_ : description option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?parent_change_set_id:(parent_change_set_id_ : change_set_id option)
    ?root_change_set_id:(root_change_set_id_ : change_set_id option)
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option) () =
  ({
     stack_id = stack_id_;
     stack_name = stack_name_;
     change_set_id = change_set_id_;
     change_set_name = change_set_name_;
     execution_status = execution_status_;
     status = status_;
     status_reason = status_reason_;
     creation_time = creation_time_;
     description = description_;
     include_nested_stacks = include_nested_stacks_;
     parent_change_set_id = parent_change_set_id_;
     root_change_set_id = root_change_set_id_;
     import_existing_resources = import_existing_resources_;
   }
    : change_set_summary)

let make_template_parameter ?parameter_key:(parameter_key_ : parameter_key option)
    ?default_value:(default_value_ : parameter_value option) ?no_echo:(no_echo_ : no_echo option)
    ?description:(description_ : description option) () =
  ({
     parameter_key = parameter_key_;
     default_value = default_value_;
     no_echo = no_echo_;
     description = description_;
   }
    : template_parameter)

let make_validate_template_output ?parameters:(parameters_ : template_parameters option)
    ?description:(description_ : description option)
    ?capabilities:(capabilities_ : capabilities option)
    ?capabilities_reason:(capabilities_reason_ : capabilities_reason option)
    ?declared_transforms:(declared_transforms_ : transforms_list option) () =
  ({
     parameters = parameters_;
     description = description_;
     capabilities = capabilities_;
     capabilities_reason = capabilities_reason_;
     declared_transforms = declared_transforms_;
   }
    : validate_template_output)

let make_validate_template_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option) () =
  ({ template_body = template_body_; template_ur_l = template_ur_l_ } : validate_template_input)

let make_update_termination_protection_output ?stack_id:(stack_id_ : stack_id option) () =
  ({ stack_id = stack_id_ } : update_termination_protection_output)

let make_update_termination_protection_input
    ~enable_termination_protection:(enable_termination_protection_ : enable_termination_protection)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ enable_termination_protection = enable_termination_protection_; stack_name = stack_name_ }
    : update_termination_protection_input)

let make_update_stack_set_output ?operation_id:(operation_id_ : client_request_token option) () =
  ({ operation_id = operation_id_ } : update_stack_set_output)

let make_managed_execution ?active:(active_ : managed_execution_nullable option) () =
  ({ active = active_ } : managed_execution)

let make_deployment_targets ?accounts:(accounts_ : account_list option)
    ?accounts_url:(accounts_url_ : accounts_url option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?account_filter_type:(account_filter_type_ : account_filter_type option) () =
  ({
     accounts = accounts_;
     accounts_url = accounts_url_;
     organizational_unit_ids = organizational_unit_ids_;
     account_filter_type = account_filter_type_;
   }
    : deployment_targets)

let make_stack_set_operation_preferences
    ?region_concurrency_type:(region_concurrency_type_ : region_concurrency_type option)
    ?region_order:(region_order_ : region_list option)
    ?failure_tolerance_count:(failure_tolerance_count_ : failure_tolerance_count option)
    ?failure_tolerance_percentage:
      (failure_tolerance_percentage_ : failure_tolerance_percentage option)
    ?max_concurrent_count:(max_concurrent_count_ : max_concurrent_count option)
    ?max_concurrent_percentage:(max_concurrent_percentage_ : max_concurrent_percentage option)
    ?concurrency_mode:(concurrency_mode_ : concurrency_mode option) () =
  ({
     region_concurrency_type = region_concurrency_type_;
     region_order = region_order_;
     failure_tolerance_count = failure_tolerance_count_;
     failure_tolerance_percentage = failure_tolerance_percentage_;
     max_concurrent_count = max_concurrent_count_;
     max_concurrent_percentage = max_concurrent_percentage_;
     concurrency_mode = concurrency_mode_;
   }
    : stack_set_operation_preferences)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_parameter ?parameter_key:(parameter_key_ : parameter_key option)
    ?parameter_value:(parameter_value_ : parameter_value option)
    ?use_previous_value:(use_previous_value_ : use_previous_value option)
    ?resolved_value:(resolved_value_ : parameter_value option) () =
  ({
     parameter_key = parameter_key_;
     parameter_value = parameter_value_;
     use_previous_value = use_previous_value_;
     resolved_value = resolved_value_;
   }
    : parameter)

let make_update_stack_set_input ?description:(description_ : description option)
    ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?parameters:(parameters_ : parameters option)
    ?capabilities:(capabilities_ : capabilities option) ?tags:(tags_ : tags option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?permission_model:(permission_model_ : permission_models option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?operation_id:(operation_id_ : client_request_token option)
    ?accounts:(accounts_ : account_list option) ?regions:(regions_ : region_list option)
    ?call_as:(call_as_ : call_as option)
    ?managed_execution:(managed_execution_ : managed_execution option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     stack_set_name = stack_set_name_;
     description = description_;
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     use_previous_template = use_previous_template_;
     parameters = parameters_;
     capabilities = capabilities_;
     tags = tags_;
     operation_preferences = operation_preferences_;
     administration_role_ar_n = administration_role_ar_n_;
     execution_role_name = execution_role_name_;
     deployment_targets = deployment_targets_;
     permission_model = permission_model_;
     auto_deployment = auto_deployment_;
     operation_id = operation_id_;
     accounts = accounts_;
     regions = regions_;
     call_as = call_as_;
     managed_execution = managed_execution_;
   }
    : update_stack_set_input)

let make_update_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : update_stack_instances_output)

let make_update_stack_instances_input ?accounts:(accounts_ : account_list option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?operation_id:(operation_id_ : client_request_token option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) ~regions:(regions_ : region_list) () =
  ({
     stack_set_name = stack_set_name_;
     accounts = accounts_;
     deployment_targets = deployment_targets_;
     regions = regions_;
     parameter_overrides = parameter_overrides_;
     operation_preferences = operation_preferences_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : update_stack_instances_input)

let make_update_stack_output ?stack_id:(stack_id_ : stack_id option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ stack_id = stack_id_; operation_id = operation_id_ } : update_stack_output)

let make_deployment_config ?mode:(mode_ : deployment_config_mode option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option) () =
  ({ mode = mode_; disable_rollback = disable_rollback_ } : deployment_config)

let make_rollback_trigger ~arn:(arn_ : arn) ~type_:(type__ : type_) () =
  ({ arn = arn_; type_ = type__ } : rollback_trigger)

let make_rollback_configuration ?rollback_triggers:(rollback_triggers_ : rollback_triggers option)
    ?monitoring_time_in_minutes:(monitoring_time_in_minutes_ : monitoring_time_in_minutes option) ()
    =
  ({
     rollback_triggers = rollback_triggers_;
     monitoring_time_in_minutes = monitoring_time_in_minutes_;
   }
    : rollback_configuration)

let make_update_stack_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?stack_policy_during_update_body:
      (stack_policy_during_update_body_ : stack_policy_during_update_body option)
    ?stack_policy_during_update_ur_l:
      (stack_policy_during_update_ur_l_ : stack_policy_during_update_ur_l option)
    ?parameters:(parameters_ : parameters option)
    ?capabilities:(capabilities_ : capabilities option)
    ?resource_types:(resource_types_ : resource_types option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?tags:(tags_ : tags option) ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?disable_validation:(disable_validation_ : disable_validation option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     stack_name = stack_name_;
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     use_previous_template = use_previous_template_;
     stack_policy_during_update_body = stack_policy_during_update_body_;
     stack_policy_during_update_ur_l = stack_policy_during_update_ur_l_;
     parameters = parameters_;
     capabilities = capabilities_;
     resource_types = resource_types_;
     role_ar_n = role_ar_n_;
     rollback_configuration = rollback_configuration_;
     stack_policy_body = stack_policy_body_;
     stack_policy_ur_l = stack_policy_ur_l_;
     notification_ar_ns = notification_ar_ns_;
     tags = tags_;
     disable_rollback = disable_rollback_;
     client_request_token = client_request_token_;
     retain_except_on_create = retain_except_on_create_;
     deployment_config = deployment_config_;
     disable_validation = disable_validation_;
   }
    : update_stack_input)

let make_update_generated_template_output
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({ generated_template_id = generated_template_id_ } : update_generated_template_output)

let make_template_configuration
    ?deletion_policy:(deletion_policy_ : generated_template_deletion_policy option)
    ?update_replace_policy:
      (update_replace_policy_ : generated_template_update_replace_policy option) () =
  ({ deletion_policy = deletion_policy_; update_replace_policy = update_replace_policy_ }
    : template_configuration)

let make_resource_definition
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ~resource_type:(resource_type_ : resource_type)
    ~resource_identifier:(resource_identifier_ : resource_identifier_properties) () =
  ({
     resource_type = resource_type_;
     logical_resource_id = logical_resource_id_;
     resource_identifier = resource_identifier_;
   }
    : resource_definition)

let make_update_generated_template_input
    ?new_generated_template_name:(new_generated_template_name_ : generated_template_name option)
    ?add_resources:(add_resources_ : resource_definitions option)
    ?remove_resources:(remove_resources_ : jazz_logical_resource_ids option)
    ?refresh_all_resources:(refresh_all_resources_ : refresh_all_resources option)
    ?template_configuration:(template_configuration_ : template_configuration option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({
     generated_template_name = generated_template_name_;
     new_generated_template_name = new_generated_template_name_;
     add_resources = add_resources_;
     remove_resources = remove_resources_;
     refresh_all_resources = refresh_all_resources_;
     template_configuration = template_configuration_;
   }
    : update_generated_template_input)

let make_test_type_output ?type_version_arn:(type_version_arn_ : type_arn option) () =
  ({ type_version_arn = type_version_arn_ } : test_type_output)

let make_test_type_input ?arn:(arn_ : type_arn option) ?type_:(type__ : third_party_type option)
    ?type_name:(type_name_ : type_name option) ?version_id:(version_id_ : type_version_id option)
    ?log_delivery_bucket:(log_delivery_bucket_ : s3_bucket option) () =
  ({
     arn = arn_;
     type_ = type__;
     type_name = type_name_;
     version_id = version_id_;
     log_delivery_bucket = log_delivery_bucket_;
   }
    : test_type_input)

let make_stop_stack_set_operation_output () = (() : unit)

let make_stop_stack_set_operation_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name)
    ~operation_id:(operation_id_ : client_request_token) () =
  ({ stack_set_name = stack_set_name_; operation_id = operation_id_; call_as = call_as_ }
    : stop_stack_set_operation_input)

let make_start_resource_scan_output ?resource_scan_id:(resource_scan_id_ : resource_scan_id option)
    () =
  ({ resource_scan_id = resource_scan_id_ } : start_resource_scan_output)

let make_scan_filter ?types:(types_ : resource_type_filters option) () =
  ({ types = types_ } : scan_filter)

let make_start_resource_scan_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?scan_filters:(scan_filters_ : scan_filters option) () =
  ({ client_request_token = client_request_token_; scan_filters = scan_filters_ }
    : start_resource_scan_input)

let make_signal_resource_input ~stack_name:(stack_name_ : stack_name_or_id)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~unique_id:(unique_id_ : resource_signal_unique_id) ~status:(status_ : resource_signal_status)
    () =
  ({
     stack_name = stack_name_;
     logical_resource_id = logical_resource_id_;
     unique_id = unique_id_;
     status = status_;
   }
    : signal_resource_input)

let make_set_type_default_version_output () = (() : unit)

let make_set_type_default_version_input ?arn:(arn_ : private_type_arn option)
    ?type_:(type__ : registry_type option) ?type_name:(type_name_ : type_name option)
    ?version_id:(version_id_ : type_version_id option) () =
  ({ arn = arn_; type_ = type__; type_name = type_name_; version_id = version_id_ }
    : set_type_default_version_input)

let make_set_type_configuration_output
    ?configuration_arn:(configuration_arn_ : type_configuration_arn option) () =
  ({ configuration_arn = configuration_arn_ } : set_type_configuration_output)

let make_set_type_configuration_input ?type_arn:(type_arn_ : type_arn option)
    ?configuration_alias:(configuration_alias_ : type_configuration_alias option)
    ?type_name:(type_name_ : type_name option) ?type_:(type__ : third_party_type option)
    ~configuration:(configuration_ : type_configuration) () =
  ({
     type_arn = type_arn_;
     configuration = configuration_;
     configuration_alias = configuration_alias_;
     type_name = type_name_;
     type_ = type__;
   }
    : set_type_configuration_input)

let make_set_stack_policy_input ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     stack_name = stack_name_;
     stack_policy_body = stack_policy_body_;
     stack_policy_ur_l = stack_policy_ur_l_;
   }
    : set_stack_policy_input)

let make_rollback_stack_output ?stack_id:(stack_id_ : stack_id option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ stack_id = stack_id_; operation_id = operation_id_ } : rollback_stack_output)

let make_rollback_stack_input ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     stack_name = stack_name_;
     role_ar_n = role_ar_n_;
     client_request_token = client_request_token_;
     retain_except_on_create = retain_except_on_create_;
     deployment_config = deployment_config_;
   }
    : rollback_stack_input)

let make_register_type_output ?registration_token:(registration_token_ : registration_token option)
    () =
  ({ registration_token = registration_token_ } : register_type_output)

let make_register_type_input ?type_:(type__ : registry_type option)
    ?logging_config:(logging_config_ : logging_config option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?client_request_token:(client_request_token_ : request_token option)
    ~type_name:(type_name_ : type_name) ~schema_handler_package:(schema_handler_package_ : s3_url)
    () =
  ({
     type_ = type__;
     type_name = type_name_;
     schema_handler_package = schema_handler_package_;
     logging_config = logging_config_;
     execution_role_arn = execution_role_arn_;
     client_request_token = client_request_token_;
   }
    : register_type_input)

let make_register_publisher_output ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({ publisher_id = publisher_id_ } : register_publisher_output)

let make_register_publisher_input
    ?accept_terms_and_conditions:(accept_terms_and_conditions_ : accept_terms_and_conditions option)
    ?connection_arn:(connection_arn_ : connection_arn option) () =
  ({ accept_terms_and_conditions = accept_terms_and_conditions_; connection_arn = connection_arn_ }
    : register_publisher_input)

let make_record_handler_progress_output () = (() : unit)

let make_record_handler_progress_input
    ?current_operation_status:(current_operation_status_ : operation_status option)
    ?status_message:(status_message_ : status_message option)
    ?error_code:(error_code_ : handler_error_code option)
    ?resource_model:(resource_model_ : resource_model option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~bearer_token:(bearer_token_ : client_token)
    ~operation_status:(operation_status_ : operation_status) () =
  ({
     bearer_token = bearer_token_;
     operation_status = operation_status_;
     current_operation_status = current_operation_status_;
     status_message = status_message_;
     error_code = error_code_;
     resource_model = resource_model_;
     client_request_token = client_request_token_;
   }
    : record_handler_progress_input)

let make_publish_type_output ?public_type_arn:(public_type_arn_ : type_arn option) () =
  ({ public_type_arn = public_type_arn_ } : publish_type_output)

let make_publish_type_input ?type_:(type__ : third_party_type option)
    ?arn:(arn_ : private_type_arn option) ?type_name:(type_name_ : type_name option)
    ?public_version_number:(public_version_number_ : public_version_number option) () =
  ({
     type_ = type__;
     arn = arn_;
     type_name = type_name_;
     public_version_number = public_version_number_;
   }
    : publish_type_input)

let make_type_version_summary ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option) ?version_id:(version_id_ : type_version_id option)
    ?is_default_version:(is_default_version_ : is_default_version option)
    ?arn:(arn_ : type_arn option) ?time_created:(time_created_ : timestamp option)
    ?description:(description_ : description option)
    ?public_version_number:(public_version_number_ : public_version_number option) () =
  ({
     type_ = type__;
     type_name = type_name_;
     version_id = version_id_;
     is_default_version = is_default_version_;
     arn = arn_;
     time_created = time_created_;
     description = description_;
     public_version_number = public_version_number_;
   }
    : type_version_summary)

let make_list_type_versions_output
    ?type_version_summaries:(type_version_summaries_ : type_version_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ type_version_summaries = type_version_summaries_; next_token = next_token_ }
    : list_type_versions_output)

let make_list_type_versions_input ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option) ?arn:(arn_ : type_arn option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({
     type_ = type__;
     type_name = type_name_;
     arn = arn_;
     max_results = max_results_;
     next_token = next_token_;
     deprecated_status = deprecated_status_;
     publisher_id = publisher_id_;
   }
    : list_type_versions_input)

let make_type_summary ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option)
    ?default_version_id:(default_version_id_ : type_version_id option)
    ?type_arn:(type_arn_ : type_arn option) ?last_updated:(last_updated_ : timestamp option)
    ?description:(description_ : description option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?latest_public_version:(latest_public_version_ : public_version_number option)
    ?publisher_identity:(publisher_identity_ : identity_provider option)
    ?publisher_name:(publisher_name_ : publisher_name option)
    ?is_activated:(is_activated_ : is_activated option) () =
  ({
     type_ = type__;
     type_name = type_name_;
     default_version_id = default_version_id_;
     type_arn = type_arn_;
     last_updated = last_updated_;
     description = description_;
     publisher_id = publisher_id_;
     original_type_name = original_type_name_;
     public_version_number = public_version_number_;
     latest_public_version = latest_public_version_;
     publisher_identity = publisher_identity_;
     publisher_name = publisher_name_;
     is_activated = is_activated_;
   }
    : type_summary)

let make_list_types_output ?type_summaries:(type_summaries_ : type_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ type_summaries = type_summaries_; next_token = next_token_ } : list_types_output)

let make_type_filters ?category:(category_ : category option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?type_name_prefix:(type_name_prefix_ : type_name_prefix option) () =
  ({ category = category_; publisher_id = publisher_id_; type_name_prefix = type_name_prefix_ }
    : type_filters)

let make_list_types_input ?visibility:(visibility_ : visibility option)
    ?provisioning_type:(provisioning_type_ : provisioning_type option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?type_:(type__ : registry_type option) ?filters:(filters_ : type_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     visibility = visibility_;
     provisioning_type = provisioning_type_;
     deprecated_status = deprecated_status_;
     type_ = type__;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_types_input)

let make_list_type_registrations_output
    ?registration_token_list:(registration_token_list_ : registration_token_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ registration_token_list = registration_token_list_; next_token = next_token_ }
    : list_type_registrations_output)

let make_list_type_registrations_input ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option) ?type_arn:(type_arn_ : type_arn option)
    ?registration_status_filter:(registration_status_filter_ : registration_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     type_ = type__;
     type_name = type_name_;
     type_arn = type_arn_;
     registration_status_filter = registration_status_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_type_registrations_input)

let make_stack_set_summary ?stack_set_name:(stack_set_name_ : stack_set_name option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?description:(description_ : description option) ?status:(status_ : stack_set_status option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?permission_model:(permission_model_ : permission_models option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?managed_execution:(managed_execution_ : managed_execution option) () =
  ({
     stack_set_name = stack_set_name_;
     stack_set_id = stack_set_id_;
     description = description_;
     status = status_;
     auto_deployment = auto_deployment_;
     permission_model = permission_model_;
     drift_status = drift_status_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     managed_execution = managed_execution_;
   }
    : stack_set_summary)

let make_list_stack_sets_output ?summaries:(summaries_ : stack_set_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_stack_sets_output)

let make_list_stack_sets_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?status:(status_ : stack_set_status option)
    ?call_as:(call_as_ : call_as option) () =
  ({ next_token = next_token_; max_results = max_results_; status = status_; call_as = call_as_ }
    : list_stack_sets_input)

let make_stack_set_operation_status_details
    ?failed_stack_instances_count:
      (failed_stack_instances_count_ : failed_stack_instances_count option) () =
  ({ failed_stack_instances_count = failed_stack_instances_count_ }
    : stack_set_operation_status_details)

let make_stack_set_operation_summary ?operation_id:(operation_id_ : client_request_token option)
    ?action:(action_ : stack_set_operation_action option)
    ?status:(status_ : stack_set_operation_status option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?status_reason:(status_reason_ : stack_set_operation_status_reason option)
    ?status_details:(status_details_ : stack_set_operation_status_details option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option) () =
  ({
     operation_id = operation_id_;
     action = action_;
     status = status_;
     creation_timestamp = creation_timestamp_;
     end_timestamp = end_timestamp_;
     status_reason = status_reason_;
     status_details = status_details_;
     operation_preferences = operation_preferences_;
   }
    : stack_set_operation_summary)

let make_list_stack_set_operations_output
    ?summaries:(summaries_ : stack_set_operation_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_stack_set_operations_output)

let make_list_stack_set_operations_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     stack_set_name = stack_set_name_;
     next_token = next_token_;
     max_results = max_results_;
     call_as = call_as_;
   }
    : list_stack_set_operations_input)

let make_stack_set_operation_result_summary ?account:(account_ : account option)
    ?region:(region_ : region option) ?status:(status_ : stack_set_operation_result_status option)
    ?status_reason:(status_reason_ : reason option)
    ?account_gate_result:(account_gate_result_ : account_gate_result option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option) () =
  ({
     account = account_;
     region = region_;
     status = status_;
     status_reason = status_reason_;
     account_gate_result = account_gate_result_;
     organizational_unit_id = organizational_unit_id_;
   }
    : stack_set_operation_result_summary)

let make_list_stack_set_operation_results_output
    ?summaries:(summaries_ : stack_set_operation_result_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_stack_set_operation_results_output)

let make_operation_result_filter ?name:(name_ : operation_result_filter_name option)
    ?values:(values_ : operation_result_filter_values option) () =
  ({ name = name_; values = values_ } : operation_result_filter)

let make_list_stack_set_operation_results_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?call_as:(call_as_ : call_as option)
    ?filters:(filters_ : operation_result_filters option)
    ~stack_set_name:(stack_set_name_ : stack_set_name)
    ~operation_id:(operation_id_ : client_request_token) () =
  ({
     stack_set_name = stack_set_name_;
     operation_id = operation_id_;
     next_token = next_token_;
     max_results = max_results_;
     call_as = call_as_;
     filters = filters_;
   }
    : list_stack_set_operation_results_input)

let make_stack_set_auto_deployment_target_summary
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?regions:(regions_ : region_list option) () =
  ({ organizational_unit_id = organizational_unit_id_; regions = regions_ }
    : stack_set_auto_deployment_target_summary)

let make_list_stack_set_auto_deployment_targets_output
    ?summaries:(summaries_ : stack_set_auto_deployment_target_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ }
    : list_stack_set_auto_deployment_targets_output)

let make_list_stack_set_auto_deployment_targets_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     stack_set_name = stack_set_name_;
     next_token = next_token_;
     max_results = max_results_;
     call_as = call_as_;
   }
    : list_stack_set_auto_deployment_targets_input)

let make_operation_entry ?operation_type:(operation_type_ : operation_type option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_type = operation_type_; operation_id = operation_id_ } : operation_entry)

let make_stack_drift_information_summary
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_drift_status:(stack_drift_status_ : stack_drift_status) () =
  ({ stack_drift_status = stack_drift_status_; last_check_timestamp = last_check_timestamp_ }
    : stack_drift_information_summary)

let make_stack_summary ?stack_id:(stack_id_ : stack_id option)
    ?template_description:(template_description_ : template_description option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?deletion_time:(deletion_time_ : deletion_time option)
    ?stack_status_reason:(stack_status_reason_ : stack_status_reason option)
    ?parent_id:(parent_id_ : stack_id option) ?root_id:(root_id_ : stack_id option)
    ?drift_information:(drift_information_ : stack_drift_information_summary option)
    ?last_operations:(last_operations_ : last_operations option)
    ~stack_name:(stack_name_ : stack_name) ~creation_time:(creation_time_ : creation_time)
    ~stack_status:(stack_status_ : stack_status) () =
  ({
     stack_id = stack_id_;
     stack_name = stack_name_;
     template_description = template_description_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     deletion_time = deletion_time_;
     stack_status = stack_status_;
     stack_status_reason = stack_status_reason_;
     parent_id = parent_id_;
     root_id = root_id_;
     drift_information = drift_information_;
     last_operations = last_operations_;
   }
    : stack_summary)

let make_list_stacks_output ?stack_summaries:(stack_summaries_ : stack_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stack_summaries = stack_summaries_; next_token = next_token_ } : list_stacks_output)

let make_list_stacks_input ?next_token:(next_token_ : next_token option)
    ?stack_status_filter:(stack_status_filter_ : stack_status_filter option) () =
  ({ next_token = next_token_; stack_status_filter = stack_status_filter_ } : list_stacks_input)

let make_stack_resource_drift_information_summary
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status) () =
  ({
     stack_resource_drift_status = stack_resource_drift_status_;
     last_check_timestamp = last_check_timestamp_;
   }
    : stack_resource_drift_information_summary)

let make_stack_resource_summary
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?drift_information:(drift_information_ : stack_resource_drift_information_summary option)
    ?module_info:(module_info_ : module_info option)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type)
    ~last_updated_timestamp:(last_updated_timestamp_ : timestamp)
    ~resource_status:(resource_status_ : resource_status) () =
  ({
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     last_updated_timestamp = last_updated_timestamp_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     drift_information = drift_information_;
     module_info = module_info_;
   }
    : stack_resource_summary)

let make_list_stack_resources_output
    ?stack_resource_summaries:(stack_resource_summaries_ : stack_resource_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stack_resource_summaries = stack_resource_summaries_; next_token = next_token_ }
    : list_stack_resources_output)

let make_list_stack_resources_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ stack_name = stack_name_; next_token = next_token_ } : list_stack_resources_input)

let make_stack_refactor_summary ?stack_refactor_id:(stack_refactor_id_ : stack_refactor_id option)
    ?description:(description_ : description option)
    ?execution_status:(execution_status_ : stack_refactor_execution_status option)
    ?execution_status_reason:(execution_status_reason_ : execution_status_reason option)
    ?status:(status_ : stack_refactor_status option)
    ?status_reason:(status_reason_ : stack_refactor_status_reason option) () =
  ({
     stack_refactor_id = stack_refactor_id_;
     description = description_;
     execution_status = execution_status_;
     execution_status_reason = execution_status_reason_;
     status = status_;
     status_reason = status_reason_;
   }
    : stack_refactor_summary)

let make_list_stack_refactors_output ?next_token:(next_token_ : next_token option)
    ~stack_refactor_summaries:(stack_refactor_summaries_ : stack_refactor_summaries) () =
  ({ stack_refactor_summaries = stack_refactor_summaries_; next_token = next_token_ }
    : list_stack_refactors_output)

let make_list_stack_refactors_input
    ?execution_status_filter:
      (execution_status_filter_ : stack_refactor_execution_status_filter option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     execution_status_filter = execution_status_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_stack_refactors_input)

let make_resource_location ~stack_name:(stack_name_ : stack_name)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({ stack_name = stack_name_; logical_resource_id = logical_resource_id_ } : resource_location)

let make_resource_mapping ~source:(source_ : resource_location)
    ~destination:(destination_ : resource_location) () =
  ({ source = source_; destination = destination_ } : resource_mapping)

let make_stack_refactor_action ?action:(action_ : stack_refactor_action_type option)
    ?entity:(entity_ : stack_refactor_action_entity option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_identifier:(resource_identifier_ : stack_refactor_resource_identifier option)
    ?description:(description_ : description option)
    ?detection:(detection_ : stack_refactor_detection option)
    ?detection_reason:(detection_reason_ : detection_reason option)
    ?tag_resources:(tag_resources_ : stack_refactor_tag_resources option)
    ?untag_resources:(untag_resources_ : stack_refactor_untag_resources option)
    ?resource_mapping:(resource_mapping_ : resource_mapping option) () =
  ({
     action = action_;
     entity = entity_;
     physical_resource_id = physical_resource_id_;
     resource_identifier = resource_identifier_;
     description = description_;
     detection = detection_;
     detection_reason = detection_reason_;
     tag_resources = tag_resources_;
     untag_resources = untag_resources_;
     resource_mapping = resource_mapping_;
   }
    : stack_refactor_action)

let make_list_stack_refactor_actions_output ?next_token:(next_token_ : next_token option)
    ~stack_refactor_actions:(stack_refactor_actions_ : stack_refactor_actions) () =
  ({ stack_refactor_actions = stack_refactor_actions_; next_token = next_token_ }
    : list_stack_refactor_actions_output)

let make_list_stack_refactor_actions_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) () =
  ({ stack_refactor_id = stack_refactor_id_; next_token = next_token_; max_results = max_results_ }
    : list_stack_refactor_actions_input)

let make_stack_instance_comprehensive_status
    ?detailed_status:(detailed_status_ : stack_instance_detailed_status option) () =
  ({ detailed_status = detailed_status_ } : stack_instance_comprehensive_status)

let make_stack_instance_summary ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?region:(region_ : region option) ?account:(account_ : account option)
    ?stack_id:(stack_id_ : stack_id option) ?status:(status_ : stack_instance_status option)
    ?status_reason:(status_reason_ : reason option)
    ?stack_instance_status:(stack_instance_status_ : stack_instance_comprehensive_status option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?last_operation_id:(last_operation_id_ : client_request_token option) () =
  ({
     stack_set_id = stack_set_id_;
     region = region_;
     account = account_;
     stack_id = stack_id_;
     status = status_;
     status_reason = status_reason_;
     stack_instance_status = stack_instance_status_;
     organizational_unit_id = organizational_unit_id_;
     drift_status = drift_status_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     last_operation_id = last_operation_id_;
   }
    : stack_instance_summary)

let make_list_stack_instances_output ?summaries:(summaries_ : stack_instance_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_stack_instances_output)

let make_stack_instance_filter ?name:(name_ : stack_instance_filter_name option)
    ?values:(values_ : stack_instance_filter_values option) () =
  ({ name = name_; values = values_ } : stack_instance_filter)

let make_list_stack_instances_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : stack_instance_filters option)
    ?stack_instance_account:(stack_instance_account_ : account option)
    ?stack_instance_region:(stack_instance_region_ : region option)
    ?call_as:(call_as_ : call_as option) ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     stack_set_name = stack_set_name_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     stack_instance_account = stack_instance_account_;
     stack_instance_region = stack_instance_region_;
     call_as = call_as_;
   }
    : list_stack_instances_input)

let make_property_difference ~property_path:(property_path_ : property_path)
    ~expected_value:(expected_value_ : property_value)
    ~actual_value:(actual_value_ : property_value)
    ~difference_type:(difference_type_ : difference_type) () =
  ({
     property_path = property_path_;
     expected_value = expected_value_;
     actual_value = actual_value_;
     difference_type = difference_type_;
   }
    : property_difference)

let make_physical_resource_id_context_key_value_pair ~key:(key_ : key) ~value:(value_ : value) () =
  ({ key = key_; value = value_ } : physical_resource_id_context_key_value_pair)

let make_stack_instance_resource_drifts_summary
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?physical_resource_id_context:
      (physical_resource_id_context_ : physical_resource_id_context option)
    ?property_differences:(property_differences_ : property_differences option)
    ~stack_id:(stack_id_ : stack_id)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status)
    ~timestamp:(timestamp_ : timestamp) () =
  ({
     stack_id = stack_id_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     physical_resource_id_context = physical_resource_id_context_;
     resource_type = resource_type_;
     property_differences = property_differences_;
     stack_resource_drift_status = stack_resource_drift_status_;
     timestamp = timestamp_;
   }
    : stack_instance_resource_drifts_summary)

let make_list_stack_instance_resource_drifts_output
    ?summaries:(summaries_ : stack_instance_resource_drifts_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ }
    : list_stack_instance_resource_drifts_output)

let make_list_stack_instance_resource_drifts_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?stack_instance_resource_drift_statuses:
      (stack_instance_resource_drift_statuses_ : stack_resource_drift_status_filters option)
    ?call_as:(call_as_ : call_as option) ~stack_set_name:(stack_set_name_ : stack_set_name_or_id)
    ~stack_instance_account:(stack_instance_account_ : account)
    ~stack_instance_region:(stack_instance_region_ : region)
    ~operation_id:(operation_id_ : client_request_token) () =
  ({
     stack_set_name = stack_set_name_;
     next_token = next_token_;
     max_results = max_results_;
     stack_instance_resource_drift_statuses = stack_instance_resource_drift_statuses_;
     stack_instance_account = stack_instance_account_;
     stack_instance_region = stack_instance_region_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : list_stack_instance_resource_drifts_input)

let make_resource_scan_summary ?resource_scan_id:(resource_scan_id_ : resource_scan_id option)
    ?status:(status_ : resource_scan_status option)
    ?status_reason:(status_reason_ : resource_scan_status_reason option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?percentage_completed:(percentage_completed_ : percentage_completed option)
    ?scan_type:(scan_type_ : scan_type option) () =
  ({
     resource_scan_id = resource_scan_id_;
     status = status_;
     status_reason = status_reason_;
     start_time = start_time_;
     end_time = end_time_;
     percentage_completed = percentage_completed_;
     scan_type = scan_type_;
   }
    : resource_scan_summary)

let make_list_resource_scans_output
    ?resource_scan_summaries:(resource_scan_summaries_ : resource_scan_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_scan_summaries = resource_scan_summaries_; next_token = next_token_ }
    : list_resource_scans_output)

let make_list_resource_scans_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : resource_scanner_max_results option)
    ?scan_type_filter:(scan_type_filter_ : scan_type option) () =
  ({ next_token = next_token_; max_results = max_results_; scan_type_filter = scan_type_filter_ }
    : list_resource_scans_input)

let make_scanned_resource ?resource_type:(resource_type_ : resource_type option)
    ?resource_identifier:(resource_identifier_ : jazz_resource_identifier_properties option)
    ?managed_by_stack:(managed_by_stack_ : managed_by_stack option) () =
  ({
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     managed_by_stack = managed_by_stack_;
   }
    : scanned_resource)

let make_list_resource_scan_resources_output ?resources:(resources_ : scanned_resources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resources = resources_; next_token = next_token_ } : list_resource_scan_resources_output)

let make_list_resource_scan_resources_input
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?resource_type_prefix:(resource_type_prefix_ : resource_type_prefix option)
    ?tag_key:(tag_key_ : tag_key option) ?tag_value:(tag_value_ : tag_value option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : resource_scanner_max_results option)
    ~resource_scan_id:(resource_scan_id_ : resource_scan_id) () =
  ({
     resource_scan_id = resource_scan_id_;
     resource_identifier = resource_identifier_;
     resource_type_prefix = resource_type_prefix_;
     tag_key = tag_key_;
     tag_value = tag_value_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resource_scan_resources_input)

let make_list_resource_scan_related_resources_output
    ?related_resources:(related_resources_ : related_resources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ related_resources = related_resources_; next_token = next_token_ }
    : list_resource_scan_related_resources_output)

let make_scanned_resource_identifier ~resource_type:(resource_type_ : resource_type)
    ~resource_identifier:(resource_identifier_ : jazz_resource_identifier_properties) () =
  ({ resource_type = resource_type_; resource_identifier = resource_identifier_ }
    : scanned_resource_identifier)

let make_list_resource_scan_related_resources_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : boxed_max_results option)
    ~resource_scan_id:(resource_scan_id_ : resource_scan_id)
    ~resources:(resources_ : scanned_resource_identifiers) () =
  ({
     resource_scan_id = resource_scan_id_;
     resources = resources_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resource_scan_related_resources_input)

let make_list_imports_output ?imports:(imports_ : imports option)
    ?next_token:(next_token_ : next_token option) () =
  ({ imports = imports_; next_token = next_token_ } : list_imports_output)

let make_list_imports_input ?next_token:(next_token_ : next_token option)
    ~export_name:(export_name_ : export_name) () =
  ({ export_name = export_name_; next_token = next_token_ } : list_imports_input)

let make_hook_result_summary ?hook_result_id:(hook_result_id_ : hook_invocation_id option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?type_name:(type_name_ : hook_type_name option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?status:(status_ : hook_status option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?invoked_at:(invoked_at_ : timestamp option)
    ?target_type:(target_type_ : list_hook_results_target_type option)
    ?target_id:(target_id_ : hook_result_id option) ?type_arn:(type_arn_ : hook_type_arn option)
    ?hook_execution_target:(hook_execution_target_ : hook_result_id option) () =
  ({
     hook_result_id = hook_result_id_;
     invocation_point = invocation_point_;
     failure_mode = failure_mode_;
     type_name = type_name_;
     type_version_id = type_version_id_;
     type_configuration_version_id = type_configuration_version_id_;
     status = status_;
     hook_status_reason = hook_status_reason_;
     invoked_at = invoked_at_;
     target_type = target_type_;
     target_id = target_id_;
     type_arn = type_arn_;
     hook_execution_target = hook_execution_target_;
   }
    : hook_result_summary)

let make_list_hook_results_output ?target_type:(target_type_ : list_hook_results_target_type option)
    ?target_id:(target_id_ : hook_result_id option)
    ?hook_results:(hook_results_ : hook_result_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     target_type = target_type_;
     target_id = target_id_;
     hook_results = hook_results_;
     next_token = next_token_;
   }
    : list_hook_results_output)

let make_list_hook_results_input ?target_type:(target_type_ : list_hook_results_target_type option)
    ?target_id:(target_id_ : hook_result_id option) ?type_arn:(type_arn_ : hook_type_arn option)
    ?status:(status_ : hook_status option) ?next_token:(next_token_ : next_token option) () =
  ({
     target_type = target_type_;
     target_id = target_id_;
     type_arn = type_arn_;
     status = status_;
     next_token = next_token_;
   }
    : list_hook_results_input)

let make_template_summary
    ?generated_template_id:(generated_template_id_ : generated_template_id option)
    ?generated_template_name:(generated_template_name_ : generated_template_name option)
    ?status:(status_ : generated_template_status option)
    ?status_reason:(status_reason_ : template_status_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?number_of_resources:(number_of_resources_ : number_of_resources option) () =
  ({
     generated_template_id = generated_template_id_;
     generated_template_name = generated_template_name_;
     status = status_;
     status_reason = status_reason_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     number_of_resources = number_of_resources_;
   }
    : template_summary)

let make_list_generated_templates_output ?summaries:(summaries_ : template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_generated_templates_output)

let make_list_generated_templates_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_generated_templates_input)

let make_export_ ?exporting_stack_id:(exporting_stack_id_ : stack_id option)
    ?name:(name_ : export_name option) ?value:(value_ : export_value option) () =
  ({ exporting_stack_id = exporting_stack_id_; name = name_; value = value_ } : export_)

let make_list_exports_output ?exports:(exports_ : exports option)
    ?next_token:(next_token_ : next_token option) () =
  ({ exports = exports_; next_token = next_token_ } : list_exports_output)

let make_list_exports_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_exports_input)

let make_list_change_sets_output ?summaries:(summaries_ : change_set_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_change_sets_output)

let make_list_change_sets_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ stack_name = stack_name_; next_token = next_token_ } : list_change_sets_input)

let make_import_stacks_to_stack_set_output
    ?operation_id:(operation_id_ : client_request_token option) () =
  ({ operation_id = operation_id_ } : import_stacks_to_stack_set_output)

let make_import_stacks_to_stack_set_input ?stack_ids:(stack_ids_ : stack_id_list option)
    ?stack_ids_url:(stack_ids_url_ : stack_ids_url option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?operation_id:(operation_id_ : client_request_token option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     stack_set_name = stack_set_name_;
     stack_ids = stack_ids_;
     stack_ids_url = stack_ids_url_;
     organizational_unit_ids = organizational_unit_ids_;
     operation_preferences = operation_preferences_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : import_stacks_to_stack_set_input)

let make_warnings
    ?unrecognized_resource_types:(unrecognized_resource_types_ : resource_types option) () =
  ({ unrecognized_resource_types = unrecognized_resource_types_ } : warnings)

let make_resource_identifier_summary ?resource_type:(resource_type_ : resource_type option)
    ?logical_resource_ids:(logical_resource_ids_ : logical_resource_ids option)
    ?resource_identifiers:(resource_identifiers_ : resource_identifiers option) () =
  ({
     resource_type = resource_type_;
     logical_resource_ids = logical_resource_ids_;
     resource_identifiers = resource_identifiers_;
   }
    : resource_identifier_summary)

let make_parameter_constraints ?allowed_values:(allowed_values_ : allowed_values option) () =
  ({ allowed_values = allowed_values_ } : parameter_constraints)

let make_parameter_declaration ?parameter_key:(parameter_key_ : parameter_key option)
    ?default_value:(default_value_ : parameter_value option)
    ?parameter_type:(parameter_type_ : parameter_type option) ?no_echo:(no_echo_ : no_echo option)
    ?description:(description_ : description option)
    ?parameter_constraints:(parameter_constraints_ : parameter_constraints option) () =
  ({
     parameter_key = parameter_key_;
     default_value = default_value_;
     parameter_type = parameter_type_;
     no_echo = no_echo_;
     description = description_;
     parameter_constraints = parameter_constraints_;
   }
    : parameter_declaration)

let make_get_template_summary_output ?parameters:(parameters_ : parameter_declarations option)
    ?description:(description_ : description option)
    ?capabilities:(capabilities_ : capabilities option)
    ?capabilities_reason:(capabilities_reason_ : capabilities_reason option)
    ?resource_types:(resource_types_ : resource_types option) ?version:(version_ : version option)
    ?metadata:(metadata_ : metadata option)
    ?declared_transforms:(declared_transforms_ : transforms_list option)
    ?resource_identifier_summaries:
      (resource_identifier_summaries_ : resource_identifier_summaries option)
    ?warnings:(warnings_ : warnings option) () =
  ({
     parameters = parameters_;
     description = description_;
     capabilities = capabilities_;
     capabilities_reason = capabilities_reason_;
     resource_types = resource_types_;
     version = version_;
     metadata = metadata_;
     declared_transforms = declared_transforms_;
     resource_identifier_summaries = resource_identifier_summaries_;
     warnings = warnings_;
   }
    : get_template_summary_output)

let make_template_summary_config
    ?treat_unrecognized_resource_types_as_warnings:
      (treat_unrecognized_resource_types_as_warnings_ :
         treat_unrecognized_resource_types_as_warnings option) () =
  ({
     treat_unrecognized_resource_types_as_warnings = treat_unrecognized_resource_types_as_warnings_;
   }
    : template_summary_config)

let make_get_template_summary_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?stack_name:(stack_name_ : stack_name_or_id option)
    ?stack_set_name:(stack_set_name_ : stack_set_name_or_id option)
    ?call_as:(call_as_ : call_as option)
    ?template_summary_config:(template_summary_config_ : template_summary_config option) () =
  ({
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     stack_name = stack_name_;
     stack_set_name = stack_set_name_;
     call_as = call_as_;
     template_summary_config = template_summary_config_;
   }
    : get_template_summary_input)

let make_get_template_output ?template_body:(template_body_ : template_body option)
    ?stages_available:(stages_available_ : stage_list option) () =
  ({ template_body = template_body_; stages_available = stages_available_ } : get_template_output)

let make_get_template_input ?stack_name:(stack_name_ : stack_name option)
    ?change_set_name:(change_set_name_ : change_set_name_or_id option)
    ?template_stage:(template_stage_ : template_stage option) () =
  ({
     stack_name = stack_name_;
     change_set_name = change_set_name_;
     template_stage = template_stage_;
   }
    : get_template_input)

let make_get_stack_policy_output ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    () =
  ({ stack_policy_body = stack_policy_body_ } : get_stack_policy_output)

let make_get_stack_policy_input ~stack_name:(stack_name_ : stack_name) () =
  ({ stack_name = stack_name_ } : get_stack_policy_input)

let make_hook_target ~target_type:(target_type_ : hook_target_type)
    ~target_type_name:(target_type_name_ : hook_target_type_name)
    ~target_id:(target_id_ : hook_target_id) ~action:(action_ : hook_target_action) () =
  ({
     target_type = target_type_;
     target_type_name = target_type_name_;
     target_id = target_id_;
     action = action_;
   }
    : hook_target)

let make_get_hook_result_output ?hook_result_id:(hook_result_id_ : hook_invocation_id option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?type_name:(type_name_ : hook_type_name option)
    ?original_type_name:(original_type_name_ : hook_type_name option)
    ?type_version_id:(type_version_id_ : hook_type_version_id option)
    ?type_configuration_version_id:
      (type_configuration_version_id_ : hook_type_configuration_version_id option)
    ?type_arn:(type_arn_ : hook_type_arn option) ?status:(status_ : hook_status option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?invoked_at:(invoked_at_ : timestamp option) ?target:(target_ : hook_target option)
    ?annotations:(annotations_ : annotation_list option) () =
  ({
     hook_result_id = hook_result_id_;
     invocation_point = invocation_point_;
     failure_mode = failure_mode_;
     type_name = type_name_;
     original_type_name = original_type_name_;
     type_version_id = type_version_id_;
     type_configuration_version_id = type_configuration_version_id_;
     type_arn = type_arn_;
     status = status_;
     hook_status_reason = hook_status_reason_;
     invoked_at = invoked_at_;
     target = target_;
     annotations = annotations_;
   }
    : get_hook_result_output)

let make_get_hook_result_input ?hook_result_id:(hook_result_id_ : hook_invocation_id option) () =
  ({ hook_result_id = hook_result_id_ } : get_hook_result_input)

let make_get_generated_template_output ?status:(status_ : generated_template_status option)
    ?template_body:(template_body_ : template_body option) () =
  ({ status = status_; template_body = template_body_ } : get_generated_template_output)

let make_get_generated_template_input ?format:(format_ : template_format option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ format = format_; generated_template_name = generated_template_name_ }
    : get_generated_template_input)

let make_execute_stack_refactor_input ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) ()
    =
  ({ stack_refactor_id = stack_refactor_id_ } : execute_stack_refactor_input)

let make_execute_change_set_output () = (() : unit)

let make_execute_change_set_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     change_set_name = change_set_name_;
     stack_name = stack_name_;
     client_request_token = client_request_token_;
     disable_rollback = disable_rollback_;
     retain_except_on_create = retain_except_on_create_;
   }
    : execute_change_set_input)

let make_estimate_template_cost_output ?url:(url_ : url option) () =
  ({ url = url_ } : estimate_template_cost_output)

let make_estimate_template_cost_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?parameters:(parameters_ : parameters option) () =
  ({ template_body = template_body_; template_ur_l = template_ur_l_; parameters = parameters_ }
    : estimate_template_cost_input)

let make_detect_stack_set_drift_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : detect_stack_set_drift_output)

let make_detect_stack_set_drift_input
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?operation_id:(operation_id_ : client_request_token option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name_or_id) () =
  ({
     stack_set_name = stack_set_name_;
     operation_preferences = operation_preferences_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : detect_stack_set_drift_input)

let make_stack_resource_drift
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?physical_resource_id_context:
      (physical_resource_id_context_ : physical_resource_id_context option)
    ?expected_properties:(expected_properties_ : properties option)
    ?actual_properties:(actual_properties_ : properties option)
    ?property_differences:(property_differences_ : property_differences option)
    ?module_info:(module_info_ : module_info option)
    ?drift_status_reason:(drift_status_reason_ : stack_resource_drift_status_reason option)
    ~stack_id:(stack_id_ : stack_id)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status)
    ~timestamp:(timestamp_ : timestamp) () =
  ({
     stack_id = stack_id_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     physical_resource_id_context = physical_resource_id_context_;
     resource_type = resource_type_;
     expected_properties = expected_properties_;
     actual_properties = actual_properties_;
     property_differences = property_differences_;
     stack_resource_drift_status = stack_resource_drift_status_;
     timestamp = timestamp_;
     module_info = module_info_;
     drift_status_reason = drift_status_reason_;
   }
    : stack_resource_drift)

let make_detect_stack_resource_drift_output
    ~stack_resource_drift:(stack_resource_drift_ : stack_resource_drift) () =
  ({ stack_resource_drift = stack_resource_drift_ } : detect_stack_resource_drift_output)

let make_detect_stack_resource_drift_input ~stack_name:(stack_name_ : stack_name_or_id)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({ stack_name = stack_name_; logical_resource_id = logical_resource_id_ }
    : detect_stack_resource_drift_input)

let make_detect_stack_drift_output
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id) () =
  ({ stack_drift_detection_id = stack_drift_detection_id_ } : detect_stack_drift_output)

let make_detect_stack_drift_input
    ?logical_resource_ids:(logical_resource_ids_ : logical_resource_ids option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({ stack_name = stack_name_; logical_resource_ids = logical_resource_ids_ }
    : detect_stack_drift_input)

let make_describe_type_registration_output
    ?progress_status:(progress_status_ : registration_status option)
    ?description:(description_ : description option) ?type_arn:(type_arn_ : type_arn option)
    ?type_version_arn:(type_version_arn_ : type_arn option) () =
  ({
     progress_status = progress_status_;
     description = description_;
     type_arn = type_arn_;
     type_version_arn = type_version_arn_;
   }
    : describe_type_registration_output)

let make_describe_type_registration_input
    ~registration_token:(registration_token_ : registration_token) () =
  ({ registration_token = registration_token_ } : describe_type_registration_input)

let make_required_activated_type ?type_name_alias:(type_name_alias_ : type_name option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?supported_major_versions:(supported_major_versions_ : supported_major_versions option) () =
  ({
     type_name_alias = type_name_alias_;
     original_type_name = original_type_name_;
     publisher_id = publisher_id_;
     supported_major_versions = supported_major_versions_;
   }
    : required_activated_type)

let make_describe_type_output ?arn:(arn_ : type_arn option) ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option)
    ?default_version_id:(default_version_id_ : type_version_id option)
    ?is_default_version:(is_default_version_ : is_default_version option)
    ?type_tests_status:(type_tests_status_ : type_tests_status option)
    ?type_tests_status_description:
      (type_tests_status_description_ : type_tests_status_description option)
    ?description:(description_ : description option) ?schema:(schema_ : type_schema option)
    ?provisioning_type:(provisioning_type_ : provisioning_type option)
    ?deprecated_status:(deprecated_status_ : deprecated_status option)
    ?logging_config:(logging_config_ : logging_config option)
    ?required_activated_types:(required_activated_types_ : required_activated_types option)
    ?execution_role_arn:(execution_role_arn_ : role_ar_n2 option)
    ?visibility:(visibility_ : visibility option)
    ?source_url:(source_url_ : optional_secure_url option)
    ?documentation_url:(documentation_url_ : optional_secure_url option)
    ?last_updated:(last_updated_ : timestamp option)
    ?time_created:(time_created_ : timestamp option)
    ?configuration_schema:(configuration_schema_ : configuration_schema option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?original_type_name:(original_type_name_ : type_name option)
    ?original_type_arn:(original_type_arn_ : type_arn option)
    ?public_version_number:(public_version_number_ : public_version_number option)
    ?latest_public_version:(latest_public_version_ : public_version_number option)
    ?is_activated:(is_activated_ : is_activated option)
    ?auto_update:(auto_update_ : auto_update option) () =
  ({
     arn = arn_;
     type_ = type__;
     type_name = type_name_;
     default_version_id = default_version_id_;
     is_default_version = is_default_version_;
     type_tests_status = type_tests_status_;
     type_tests_status_description = type_tests_status_description_;
     description = description_;
     schema = schema_;
     provisioning_type = provisioning_type_;
     deprecated_status = deprecated_status_;
     logging_config = logging_config_;
     required_activated_types = required_activated_types_;
     execution_role_arn = execution_role_arn_;
     visibility = visibility_;
     source_url = source_url_;
     documentation_url = documentation_url_;
     last_updated = last_updated_;
     time_created = time_created_;
     configuration_schema = configuration_schema_;
     publisher_id = publisher_id_;
     original_type_name = original_type_name_;
     original_type_arn = original_type_arn_;
     public_version_number = public_version_number_;
     latest_public_version = latest_public_version_;
     is_activated = is_activated_;
     auto_update = auto_update_;
   }
    : describe_type_output)

let make_describe_type_input ?type_:(type__ : registry_type option)
    ?type_name:(type_name_ : type_name option) ?arn:(arn_ : type_arn option)
    ?version_id:(version_id_ : type_version_id option)
    ?publisher_id:(publisher_id_ : publisher_id option)
    ?public_version_number:(public_version_number_ : public_version_number option) () =
  ({
     type_ = type__;
     type_name = type_name_;
     arn = arn_;
     version_id = version_id_;
     publisher_id = publisher_id_;
     public_version_number = public_version_number_;
   }
    : describe_type_input)

let make_stack_set_drift_detection_details
    ?drift_status:(drift_status_ : stack_set_drift_status option)
    ?drift_detection_status:(drift_detection_status_ : stack_set_drift_detection_status option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?total_stack_instances_count:(total_stack_instances_count_ : total_stack_instances_count option)
    ?drifted_stack_instances_count:
      (drifted_stack_instances_count_ : drifted_stack_instances_count option)
    ?in_sync_stack_instances_count:
      (in_sync_stack_instances_count_ : in_sync_stack_instances_count option)
    ?in_progress_stack_instances_count:
      (in_progress_stack_instances_count_ : in_progress_stack_instances_count option)
    ?failed_stack_instances_count:
      (failed_stack_instances_count_ : failed_stack_instances_count option) () =
  ({
     drift_status = drift_status_;
     drift_detection_status = drift_detection_status_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     total_stack_instances_count = total_stack_instances_count_;
     drifted_stack_instances_count = drifted_stack_instances_count_;
     in_sync_stack_instances_count = in_sync_stack_instances_count_;
     in_progress_stack_instances_count = in_progress_stack_instances_count_;
     failed_stack_instances_count = failed_stack_instances_count_;
   }
    : stack_set_drift_detection_details)

let make_stack_set_operation ?operation_id:(operation_id_ : client_request_token option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?action:(action_ : stack_set_operation_action option)
    ?status:(status_ : stack_set_operation_status option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?retain_stacks:(retain_stacks_ : retain_stacks_nullable option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?stack_set_drift_detection_details:
      (stack_set_drift_detection_details_ : stack_set_drift_detection_details option)
    ?status_reason:(status_reason_ : stack_set_operation_status_reason option)
    ?status_details:(status_details_ : stack_set_operation_status_details option) () =
  ({
     operation_id = operation_id_;
     stack_set_id = stack_set_id_;
     action = action_;
     status = status_;
     operation_preferences = operation_preferences_;
     retain_stacks = retain_stacks_;
     administration_role_ar_n = administration_role_ar_n_;
     execution_role_name = execution_role_name_;
     creation_timestamp = creation_timestamp_;
     end_timestamp = end_timestamp_;
     deployment_targets = deployment_targets_;
     stack_set_drift_detection_details = stack_set_drift_detection_details_;
     status_reason = status_reason_;
     status_details = status_details_;
   }
    : stack_set_operation)

let make_describe_stack_set_operation_output
    ?stack_set_operation:(stack_set_operation_ : stack_set_operation option) () =
  ({ stack_set_operation = stack_set_operation_ } : describe_stack_set_operation_output)

let make_describe_stack_set_operation_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name)
    ~operation_id:(operation_id_ : client_request_token) () =
  ({ stack_set_name = stack_set_name_; operation_id = operation_id_; call_as = call_as_ }
    : describe_stack_set_operation_input)

let make_stack_set ?stack_set_name:(stack_set_name_ : stack_set_name option)
    ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?description:(description_ : description option) ?status:(status_ : stack_set_status option)
    ?template_body:(template_body_ : template_body option)
    ?parameters:(parameters_ : parameters option)
    ?capabilities:(capabilities_ : capabilities option) ?tags:(tags_ : tags option)
    ?stack_set_ar_n:(stack_set_ar_n_ : stack_set_ar_n option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?stack_set_drift_detection_details:
      (stack_set_drift_detection_details_ : stack_set_drift_detection_details option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?permission_model:(permission_model_ : permission_models option)
    ?organizational_unit_ids:(organizational_unit_ids_ : organizational_unit_id_list option)
    ?managed_execution:(managed_execution_ : managed_execution option)
    ?regions:(regions_ : region_list option) () =
  ({
     stack_set_name = stack_set_name_;
     stack_set_id = stack_set_id_;
     description = description_;
     status = status_;
     template_body = template_body_;
     parameters = parameters_;
     capabilities = capabilities_;
     tags = tags_;
     stack_set_ar_n = stack_set_ar_n_;
     administration_role_ar_n = administration_role_ar_n_;
     execution_role_name = execution_role_name_;
     stack_set_drift_detection_details = stack_set_drift_detection_details_;
     auto_deployment = auto_deployment_;
     permission_model = permission_model_;
     organizational_unit_ids = organizational_unit_ids_;
     managed_execution = managed_execution_;
     regions = regions_;
   }
    : stack_set)

let make_describe_stack_set_output ?stack_set:(stack_set_ : stack_set option) () =
  ({ stack_set = stack_set_ } : describe_stack_set_output)

let make_describe_stack_set_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ stack_set_name = stack_set_name_; call_as = call_as_ } : describe_stack_set_input)

let make_stack_drift_information ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_drift_status:(stack_drift_status_ : stack_drift_status) () =
  ({ stack_drift_status = stack_drift_status_; last_check_timestamp = last_check_timestamp_ }
    : stack_drift_information)

let make_output ?output_key:(output_key_ : output_key option)
    ?output_value:(output_value_ : output_value option)
    ?description:(description_ : description option)
    ?export_name:(export_name_ : export_name option) () =
  ({
     output_key = output_key_;
     output_value = output_value_;
     description = description_;
     export_name = export_name_;
   }
    : output)

let make_stack ?stack_id:(stack_id_ : stack_id option)
    ?change_set_id:(change_set_id_ : change_set_id option)
    ?description:(description_ : description option) ?parameters:(parameters_ : parameters option)
    ?deletion_time:(deletion_time_ : deletion_time option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?stack_status_reason:(stack_status_reason_ : stack_status_reason option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?timeout_in_minutes:(timeout_in_minutes_ : timeout_minutes option)
    ?capabilities:(capabilities_ : capabilities option) ?outputs:(outputs_ : outputs option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?tags:(tags_ : tags option)
    ?enable_termination_protection:
      (enable_termination_protection_ : enable_termination_protection option)
    ?parent_id:(parent_id_ : stack_id option) ?root_id:(root_id_ : stack_id option)
    ?drift_information:(drift_information_ : stack_drift_information option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ?detailed_status:(detailed_status_ : detailed_status option)
    ?last_operations:(last_operations_ : last_operations option)
    ~stack_name:(stack_name_ : stack_name) ~creation_time:(creation_time_ : creation_time)
    ~stack_status:(stack_status_ : stack_status) () =
  ({
     stack_id = stack_id_;
     stack_name = stack_name_;
     change_set_id = change_set_id_;
     description = description_;
     parameters = parameters_;
     creation_time = creation_time_;
     deletion_time = deletion_time_;
     last_updated_time = last_updated_time_;
     rollback_configuration = rollback_configuration_;
     stack_status = stack_status_;
     stack_status_reason = stack_status_reason_;
     disable_rollback = disable_rollback_;
     deployment_config = deployment_config_;
     notification_ar_ns = notification_ar_ns_;
     timeout_in_minutes = timeout_in_minutes_;
     capabilities = capabilities_;
     outputs = outputs_;
     role_ar_n = role_ar_n_;
     tags = tags_;
     enable_termination_protection = enable_termination_protection_;
     parent_id = parent_id_;
     root_id = root_id_;
     drift_information = drift_information_;
     retain_except_on_create = retain_except_on_create_;
     deletion_mode = deletion_mode_;
     detailed_status = detailed_status_;
     last_operations = last_operations_;
   }
    : stack)

let make_describe_stacks_output ?stacks:(stacks_ : stacks option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stacks = stacks_; next_token = next_token_ } : describe_stacks_output)

let make_describe_stacks_input ?stack_name:(stack_name_ : stack_name option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stack_name = stack_name_; next_token = next_token_ } : describe_stacks_input)

let make_stack_resource_drift_information
    ?last_check_timestamp:(last_check_timestamp_ : timestamp option)
    ~stack_resource_drift_status:(stack_resource_drift_status_ : stack_resource_drift_status) () =
  ({
     stack_resource_drift_status = stack_resource_drift_status_;
     last_check_timestamp = last_check_timestamp_;
   }
    : stack_resource_drift_information)

let make_stack_resource ?stack_name:(stack_name_ : stack_name option)
    ?stack_id:(stack_id_ : stack_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?description:(description_ : description option)
    ?drift_information:(drift_information_ : stack_resource_drift_information option)
    ?module_info:(module_info_ : module_info option)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type) ~timestamp:(timestamp_ : timestamp)
    ~resource_status:(resource_status_ : resource_status) () =
  ({
     stack_name = stack_name_;
     stack_id = stack_id_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     timestamp = timestamp_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     description = description_;
     drift_information = drift_information_;
     module_info = module_info_;
   }
    : stack_resource)

let make_describe_stack_resources_output
    ?stack_resources:(stack_resources_ : stack_resources option) () =
  ({ stack_resources = stack_resources_ } : describe_stack_resources_output)

let make_describe_stack_resources_input ?stack_name:(stack_name_ : stack_name option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option) () =
  ({
     stack_name = stack_name_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
   }
    : describe_stack_resources_input)

let make_describe_stack_resource_drifts_output ?next_token:(next_token_ : next_token option)
    ~stack_resource_drifts:(stack_resource_drifts_ : stack_resource_drifts) () =
  ({ stack_resource_drifts = stack_resource_drifts_; next_token = next_token_ }
    : describe_stack_resource_drifts_output)

let make_describe_stack_resource_drifts_input
    ?stack_resource_drift_status_filters:
      (stack_resource_drift_status_filters_ : stack_resource_drift_status_filters option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : boxed_max_results option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     stack_name = stack_name_;
     stack_resource_drift_status_filters = stack_resource_drift_status_filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_stack_resource_drifts_input)

let make_stack_resource_detail ?stack_name:(stack_name_ : stack_name option)
    ?stack_id:(stack_id_ : stack_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?description:(description_ : description option) ?metadata:(metadata_ : metadata option)
    ?drift_information:(drift_information_ : stack_resource_drift_information option)
    ?module_info:(module_info_ : module_info option)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_type:(resource_type_ : resource_type)
    ~last_updated_timestamp:(last_updated_timestamp_ : timestamp)
    ~resource_status:(resource_status_ : resource_status) () =
  ({
     stack_name = stack_name_;
     stack_id = stack_id_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     last_updated_timestamp = last_updated_timestamp_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     description = description_;
     metadata = metadata_;
     drift_information = drift_information_;
     module_info = module_info_;
   }
    : stack_resource_detail)

let make_describe_stack_resource_output
    ?stack_resource_detail:(stack_resource_detail_ : stack_resource_detail option) () =
  ({ stack_resource_detail = stack_resource_detail_ } : describe_stack_resource_output)

let make_describe_stack_resource_input ~stack_name:(stack_name_ : stack_name)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id) () =
  ({ stack_name = stack_name_; logical_resource_id = logical_resource_id_ }
    : describe_stack_resource_input)

let make_describe_stack_refactor_output ?description:(description_ : description option)
    ?stack_refactor_id:(stack_refactor_id_ : stack_refactor_id option)
    ?stack_ids:(stack_ids_ : stack_ids option)
    ?execution_status:(execution_status_ : stack_refactor_execution_status option)
    ?execution_status_reason:(execution_status_reason_ : execution_status_reason option)
    ?status:(status_ : stack_refactor_status option)
    ?status_reason:(status_reason_ : stack_refactor_status_reason option) () =
  ({
     description = description_;
     stack_refactor_id = stack_refactor_id_;
     stack_ids = stack_ids_;
     execution_status = execution_status_;
     execution_status_reason = execution_status_reason_;
     status = status_;
     status_reason = status_reason_;
   }
    : describe_stack_refactor_output)

let make_describe_stack_refactor_input ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id)
    () =
  ({ stack_refactor_id = stack_refactor_id_ } : describe_stack_refactor_input)

let make_stack_instance ?stack_set_id:(stack_set_id_ : stack_set_id option)
    ?region:(region_ : region option) ?account:(account_ : account option)
    ?stack_id:(stack_id_ : stack_id option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?status:(status_ : stack_instance_status option)
    ?stack_instance_status:(stack_instance_status_ : stack_instance_comprehensive_status option)
    ?status_reason:(status_reason_ : reason option)
    ?organizational_unit_id:(organizational_unit_id_ : organizational_unit_id option)
    ?drift_status:(drift_status_ : stack_drift_status option)
    ?last_drift_check_timestamp:(last_drift_check_timestamp_ : timestamp option)
    ?last_operation_id:(last_operation_id_ : client_request_token option) () =
  ({
     stack_set_id = stack_set_id_;
     region = region_;
     account = account_;
     stack_id = stack_id_;
     parameter_overrides = parameter_overrides_;
     status = status_;
     stack_instance_status = stack_instance_status_;
     status_reason = status_reason_;
     organizational_unit_id = organizational_unit_id_;
     drift_status = drift_status_;
     last_drift_check_timestamp = last_drift_check_timestamp_;
     last_operation_id = last_operation_id_;
   }
    : stack_instance)

let make_describe_stack_instance_output ?stack_instance:(stack_instance_ : stack_instance option) ()
    =
  ({ stack_instance = stack_instance_ } : describe_stack_instance_output)

let make_describe_stack_instance_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name)
    ~stack_instance_account:(stack_instance_account_ : account)
    ~stack_instance_region:(stack_instance_region_ : region) () =
  ({
     stack_set_name = stack_set_name_;
     stack_instance_account = stack_instance_account_;
     stack_instance_region = stack_instance_region_;
     call_as = call_as_;
   }
    : describe_stack_instance_input)

let make_stack_event ?operation_id:(operation_id_ : operation_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_status:(resource_status_ : resource_status option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?resource_properties:(resource_properties_ : resource_properties option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?hook_type:(hook_type_ : hook_type option) ?hook_status:(hook_status_ : hook_status option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?hook_invocation_point:(hook_invocation_point_ : hook_invocation_point option)
    ?hook_invocation_id:(hook_invocation_id_ : hook_invocation_id option)
    ?hook_failure_mode:(hook_failure_mode_ : hook_failure_mode option)
    ?detailed_status:(detailed_status_ : detailed_status option) ~stack_id:(stack_id_ : stack_id)
    ~event_id:(event_id_ : event_id) ~stack_name:(stack_name_ : stack_name)
    ~timestamp:(timestamp_ : timestamp) () =
  ({
     stack_id = stack_id_;
     event_id = event_id_;
     stack_name = stack_name_;
     operation_id = operation_id_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     timestamp = timestamp_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     resource_properties = resource_properties_;
     client_request_token = client_request_token_;
     hook_type = hook_type_;
     hook_status = hook_status_;
     hook_status_reason = hook_status_reason_;
     hook_invocation_point = hook_invocation_point_;
     hook_invocation_id = hook_invocation_id_;
     hook_failure_mode = hook_failure_mode_;
     detailed_status = detailed_status_;
   }
    : stack_event)

let make_describe_stack_events_output ?stack_events:(stack_events_ : stack_events option)
    ?next_token:(next_token_ : next_token option) () =
  ({ stack_events = stack_events_; next_token = next_token_ } : describe_stack_events_output)

let make_describe_stack_events_input ?next_token:(next_token_ : next_token option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({ stack_name = stack_name_; next_token = next_token_ } : describe_stack_events_input)

let make_describe_stack_drift_detection_status_output
    ?stack_drift_status:(stack_drift_status_ : stack_drift_status option)
    ?detection_status_reason:(detection_status_reason_ : stack_drift_detection_status_reason option)
    ?drifted_stack_resource_count:(drifted_stack_resource_count_ : boxed_integer option)
    ~stack_id:(stack_id_ : stack_id)
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id)
    ~detection_status:(detection_status_ : stack_drift_detection_status)
    ~timestamp:(timestamp_ : timestamp) () =
  ({
     stack_id = stack_id_;
     stack_drift_detection_id = stack_drift_detection_id_;
     stack_drift_status = stack_drift_status_;
     detection_status = detection_status_;
     detection_status_reason = detection_status_reason_;
     drifted_stack_resource_count = drifted_stack_resource_count_;
     timestamp = timestamp_;
   }
    : describe_stack_drift_detection_status_output)

let make_describe_stack_drift_detection_status_input
    ~stack_drift_detection_id:(stack_drift_detection_id_ : stack_drift_detection_id) () =
  ({ stack_drift_detection_id = stack_drift_detection_id_ }
    : describe_stack_drift_detection_status_input)

let make_describe_resource_scan_output
    ?resource_scan_id:(resource_scan_id_ : resource_scan_id option)
    ?status:(status_ : resource_scan_status option)
    ?status_reason:(status_reason_ : resource_scan_status_reason option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?percentage_completed:(percentage_completed_ : percentage_completed option)
    ?resource_types:(resource_types_ : resource_types option)
    ?resources_scanned:(resources_scanned_ : resources_scanned option)
    ?resources_read:(resources_read_ : resources_read option)
    ?scan_filters:(scan_filters_ : scan_filters option) () =
  ({
     resource_scan_id = resource_scan_id_;
     status = status_;
     status_reason = status_reason_;
     start_time = start_time_;
     end_time = end_time_;
     percentage_completed = percentage_completed_;
     resource_types = resource_types_;
     resources_scanned = resources_scanned_;
     resources_read = resources_read_;
     scan_filters = scan_filters_;
   }
    : describe_resource_scan_output)

let make_describe_resource_scan_input ~resource_scan_id:(resource_scan_id_ : resource_scan_id) () =
  ({ resource_scan_id = resource_scan_id_ } : describe_resource_scan_input)

let make_describe_publisher_output ?publisher_id:(publisher_id_ : publisher_id option)
    ?publisher_status:(publisher_status_ : publisher_status option)
    ?identity_provider:(identity_provider_ : identity_provider option)
    ?publisher_profile:(publisher_profile_ : publisher_profile option) () =
  ({
     publisher_id = publisher_id_;
     publisher_status = publisher_status_;
     identity_provider = identity_provider_;
     publisher_profile = publisher_profile_;
   }
    : describe_publisher_output)

let make_describe_publisher_input ?publisher_id:(publisher_id_ : publisher_id option) () =
  ({ publisher_id = publisher_id_ } : describe_publisher_input)

let make_describe_organizations_access_output ?status:(status_ : organization_status option) () =
  ({ status = status_ } : describe_organizations_access_output)

let make_describe_organizations_access_input ?call_as:(call_as_ : call_as option) () =
  ({ call_as = call_as_ } : describe_organizations_access_input)

let make_template_progress ?resources_succeeded:(resources_succeeded_ : resources_succeeded option)
    ?resources_failed:(resources_failed_ : resources_failed option)
    ?resources_processing:(resources_processing_ : resources_processing option)
    ?resources_pending:(resources_pending_ : resources_pending option) () =
  ({
     resources_succeeded = resources_succeeded_;
     resources_failed = resources_failed_;
     resources_processing = resources_processing_;
     resources_pending = resources_pending_;
   }
    : template_progress)

let make_warning_property ?property_path:(property_path_ : property_path option)
    ?required:(required_ : required_property option)
    ?description:(description_ : property_description option) () =
  ({ property_path = property_path_; required = required_; description = description_ }
    : warning_property)

let make_warning_detail ?type_:(type__ : warning_type option)
    ?properties:(properties_ : warning_properties option) () =
  ({ type_ = type__; properties = properties_ } : warning_detail)

let make_resource_detail ?resource_type:(resource_type_ : resource_type option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?resource_identifier:(resource_identifier_ : resource_identifier_properties option)
    ?resource_status:(resource_status_ : generated_template_resource_status option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?warnings:(warnings_ : warning_details option) () =
  ({
     resource_type = resource_type_;
     logical_resource_id = logical_resource_id_;
     resource_identifier = resource_identifier_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     warnings = warnings_;
   }
    : resource_detail)

let make_describe_generated_template_output
    ?generated_template_id:(generated_template_id_ : generated_template_id option)
    ?generated_template_name:(generated_template_name_ : generated_template_name option)
    ?resources:(resources_ : resource_details option)
    ?status:(status_ : generated_template_status option)
    ?status_reason:(status_reason_ : template_status_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?progress:(progress_ : template_progress option) ?stack_id:(stack_id_ : stack_id option)
    ?template_configuration:(template_configuration_ : template_configuration option)
    ?total_warnings:(total_warnings_ : total_warnings option) () =
  ({
     generated_template_id = generated_template_id_;
     generated_template_name = generated_template_name_;
     resources = resources_;
     status = status_;
     status_reason = status_reason_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     progress = progress_;
     stack_id = stack_id_;
     template_configuration = template_configuration_;
     total_warnings = total_warnings_;
   }
    : describe_generated_template_output)

let make_describe_generated_template_input
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ generated_template_name = generated_template_name_ } : describe_generated_template_input)

let make_operation_event ?event_id:(event_id_ : event_id option)
    ?stack_id:(stack_id_ : stack_id option) ?operation_id:(operation_id_ : operation_id option)
    ?operation_type:(operation_type_ : operation_type option)
    ?operation_status:(operation_status_ : beacon_stack_operation_status option)
    ?event_type:(event_type_ : event_type option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_type:(resource_type_ : resource_type option)
    ?timestamp:(timestamp_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?resource_status:(resource_status_ : resource_status option)
    ?resource_status_reason:(resource_status_reason_ : resource_status_reason option)
    ?resource_properties:(resource_properties_ : resource_properties option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?hook_type:(hook_type_ : hook_type option) ?hook_status:(hook_status_ : hook_status option)
    ?hook_status_reason:(hook_status_reason_ : hook_status_reason option)
    ?hook_invocation_point:(hook_invocation_point_ : hook_invocation_point option)
    ?hook_failure_mode:(hook_failure_mode_ : hook_failure_mode option)
    ?detailed_status:(detailed_status_ : detailed_status option)
    ?validation_failure_mode:(validation_failure_mode_ : hook_failure_mode option)
    ?validation_name:(validation_name_ : validation_name option)
    ?validation_status:(validation_status_ : validation_status option)
    ?validation_status_reason:(validation_status_reason_ : validation_status_reason option)
    ?validation_path:(validation_path_ : validation_path option) () =
  ({
     event_id = event_id_;
     stack_id = stack_id_;
     operation_id = operation_id_;
     operation_type = operation_type_;
     operation_status = operation_status_;
     event_type = event_type_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     timestamp = timestamp_;
     start_time = start_time_;
     end_time = end_time_;
     resource_status = resource_status_;
     resource_status_reason = resource_status_reason_;
     resource_properties = resource_properties_;
     client_request_token = client_request_token_;
     hook_type = hook_type_;
     hook_status = hook_status_;
     hook_status_reason = hook_status_reason_;
     hook_invocation_point = hook_invocation_point_;
     hook_failure_mode = hook_failure_mode_;
     detailed_status = detailed_status_;
     validation_failure_mode = validation_failure_mode_;
     validation_name = validation_name_;
     validation_status = validation_status_;
     validation_status_reason = validation_status_reason_;
     validation_path = validation_path_;
   }
    : operation_event)

let make_describe_events_output ?operation_events:(operation_events_ : operation_events option)
    ?next_token:(next_token_ : next_token option) () =
  ({ operation_events = operation_events_; next_token = next_token_ } : describe_events_output)

let make_event_filter ?failed_events:(failed_events_ : failed_events_filter option) () =
  ({ failed_events = failed_events_ } : event_filter)

let make_describe_events_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ?change_set_name:(change_set_name_ : change_set_name_or_id option)
    ?operation_id:(operation_id_ : operation_id option) ?filters:(filters_ : event_filter option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     stack_name = stack_name_;
     change_set_name = change_set_name_;
     operation_id = operation_id_;
     filters = filters_;
     next_token = next_token_;
   }
    : describe_events_input)

let make_describe_change_set_hooks_output ?change_set_id:(change_set_id_ : change_set_id option)
    ?change_set_name:(change_set_name_ : change_set_name option)
    ?hooks:(hooks_ : change_set_hooks option) ?status:(status_ : change_set_hooks_status option)
    ?next_token:(next_token_ : next_token option) ?stack_id:(stack_id_ : stack_id option)
    ?stack_name:(stack_name_ : stack_name option) () =
  ({
     change_set_id = change_set_id_;
     change_set_name = change_set_name_;
     hooks = hooks_;
     status = status_;
     next_token = next_token_;
     stack_id = stack_id_;
     stack_name = stack_name_;
   }
    : describe_change_set_hooks_output)

let make_describe_change_set_hooks_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ?next_token:(next_token_ : next_token option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     change_set_name = change_set_name_;
     stack_name = stack_name_;
     next_token = next_token_;
     logical_resource_id = logical_resource_id_;
   }
    : describe_change_set_hooks_input)

let make_describe_change_set_output ?change_set_name:(change_set_name_ : change_set_name option)
    ?change_set_id:(change_set_id_ : change_set_id option) ?stack_id:(stack_id_ : stack_id option)
    ?stack_name:(stack_name_ : stack_name option) ?description:(description_ : description option)
    ?parameters:(parameters_ : parameters option)
    ?creation_time:(creation_time_ : creation_time option)
    ?execution_status:(execution_status_ : execution_status option)
    ?status:(status_ : change_set_status option)
    ?status_reason:(status_reason_ : change_set_status_reason option)
    ?stack_drift_status:(stack_drift_status_ : stack_drift_status option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?capabilities:(capabilities_ : capabilities option) ?tags:(tags_ : tags option)
    ?changes:(changes_ : changes option) ?next_token:(next_token_ : next_token option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?parent_change_set_id:(parent_change_set_id_ : change_set_id option)
    ?root_change_set_id:(root_change_set_id_ : change_set_id option)
    ?on_stack_failure:(on_stack_failure_ : on_stack_failure option)
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option)
    ?deployment_mode:(deployment_mode_ : deployment_mode option)
    ?deployment_config:(deployment_config_ : deployment_config option) () =
  ({
     change_set_name = change_set_name_;
     change_set_id = change_set_id_;
     stack_id = stack_id_;
     stack_name = stack_name_;
     description = description_;
     parameters = parameters_;
     creation_time = creation_time_;
     execution_status = execution_status_;
     status = status_;
     status_reason = status_reason_;
     stack_drift_status = stack_drift_status_;
     notification_ar_ns = notification_ar_ns_;
     rollback_configuration = rollback_configuration_;
     capabilities = capabilities_;
     tags = tags_;
     changes = changes_;
     next_token = next_token_;
     include_nested_stacks = include_nested_stacks_;
     parent_change_set_id = parent_change_set_id_;
     root_change_set_id = root_change_set_id_;
     on_stack_failure = on_stack_failure_;
     import_existing_resources = import_existing_resources_;
     deployment_mode = deployment_mode_;
     deployment_config = deployment_config_;
   }
    : describe_change_set_output)

let make_describe_change_set_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ?next_token:(next_token_ : next_token option)
    ?include_property_values:(include_property_values_ : include_property_values option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({
     change_set_name = change_set_name_;
     stack_name = stack_name_;
     next_token = next_token_;
     include_property_values = include_property_values_;
   }
    : describe_change_set_input)

let make_describe_account_limits_output
    ?account_limits:(account_limits_ : account_limit_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ account_limits = account_limits_; next_token = next_token_ } : describe_account_limits_output)

let make_describe_account_limits_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : describe_account_limits_input)

let make_deregister_type_output () = (() : unit)

let make_deregister_type_input ?arn:(arn_ : private_type_arn option)
    ?type_:(type__ : registry_type option) ?type_name:(type_name_ : type_name option)
    ?version_id:(version_id_ : type_version_id option) () =
  ({ arn = arn_; type_ = type__; type_name = type_name_; version_id = version_id_ }
    : deregister_type_input)

let make_delete_stack_set_output () = (() : unit)

let make_delete_stack_set_input ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({ stack_set_name = stack_set_name_; call_as = call_as_ } : delete_stack_set_input)

let make_delete_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : delete_stack_instances_output)

let make_delete_stack_instances_input ?accounts:(accounts_ : account_list option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?operation_id:(operation_id_ : client_request_token option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) ~regions:(regions_ : region_list)
    ~retain_stacks:(retain_stacks_ : retain_stacks) () =
  ({
     stack_set_name = stack_set_name_;
     accounts = accounts_;
     deployment_targets = deployment_targets_;
     regions = regions_;
     operation_preferences = operation_preferences_;
     retain_stacks = retain_stacks_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : delete_stack_instances_input)

let make_delete_stack_input ?retain_resources:(retain_resources_ : retain_resources option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     stack_name = stack_name_;
     retain_resources = retain_resources_;
     role_ar_n = role_ar_n_;
     client_request_token = client_request_token_;
     deletion_mode = deletion_mode_;
     deployment_config = deployment_config_;
   }
    : delete_stack_input)

let make_delete_generated_template_input
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({ generated_template_name = generated_template_name_ } : delete_generated_template_input)

let make_delete_change_set_output () = (() : unit)

let make_delete_change_set_input ?stack_name:(stack_name_ : stack_name_or_id option)
    ~change_set_name:(change_set_name_ : change_set_name_or_id) () =
  ({ change_set_name = change_set_name_; stack_name = stack_name_ } : delete_change_set_input)

let make_deactivate_type_output () = (() : unit)

let make_deactivate_type_input ?type_name:(type_name_ : type_name option)
    ?type_:(type__ : third_party_type option) ?arn:(arn_ : private_type_arn option) () =
  ({ type_name = type_name_; type_ = type__; arn = arn_ } : deactivate_type_input)

let make_deactivate_organizations_access_output () = (() : unit)
let make_deactivate_organizations_access_input () = (() : unit)

let make_create_stack_set_output ?stack_set_id:(stack_set_id_ : stack_set_id option) () =
  ({ stack_set_id = stack_set_id_ } : create_stack_set_output)

let make_create_stack_set_input ?description:(description_ : description option)
    ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option) ?stack_id:(stack_id_ : stack_id option)
    ?parameters:(parameters_ : parameters option)
    ?capabilities:(capabilities_ : capabilities option) ?tags:(tags_ : tags option)
    ?administration_role_ar_n:(administration_role_ar_n_ : role_ar_n option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?permission_model:(permission_model_ : permission_models option)
    ?auto_deployment:(auto_deployment_ : auto_deployment option)
    ?call_as:(call_as_ : call_as option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?managed_execution:(managed_execution_ : managed_execution option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) () =
  ({
     stack_set_name = stack_set_name_;
     description = description_;
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     stack_id = stack_id_;
     parameters = parameters_;
     capabilities = capabilities_;
     tags = tags_;
     administration_role_ar_n = administration_role_ar_n_;
     execution_role_name = execution_role_name_;
     permission_model = permission_model_;
     auto_deployment = auto_deployment_;
     call_as = call_as_;
     client_request_token = client_request_token_;
     managed_execution = managed_execution_;
   }
    : create_stack_set_input)

let make_create_stack_refactor_output ~stack_refactor_id:(stack_refactor_id_ : stack_refactor_id) ()
    =
  ({ stack_refactor_id = stack_refactor_id_ } : create_stack_refactor_output)

let make_stack_definition ?stack_name:(stack_name_ : stack_name option)
    ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option) () =
  ({ stack_name = stack_name_; template_body = template_body_; template_ur_l = template_ur_l_ }
    : stack_definition)

let make_create_stack_refactor_input ?description:(description_ : description option)
    ?enable_stack_creation:(enable_stack_creation_ : enable_stack_creation option)
    ?resource_mappings:(resource_mappings_ : resource_mappings option)
    ~stack_definitions:(stack_definitions_ : stack_definitions) () =
  ({
     description = description_;
     enable_stack_creation = enable_stack_creation_;
     resource_mappings = resource_mappings_;
     stack_definitions = stack_definitions_;
   }
    : create_stack_refactor_input)

let make_create_stack_instances_output ?operation_id:(operation_id_ : client_request_token option)
    () =
  ({ operation_id = operation_id_ } : create_stack_instances_output)

let make_create_stack_instances_input ?accounts:(accounts_ : account_list option)
    ?deployment_targets:(deployment_targets_ : deployment_targets option)
    ?parameter_overrides:(parameter_overrides_ : parameters option)
    ?operation_preferences:(operation_preferences_ : stack_set_operation_preferences option)
    ?operation_id:(operation_id_ : client_request_token option) ?call_as:(call_as_ : call_as option)
    ~stack_set_name:(stack_set_name_ : stack_set_name) ~regions:(regions_ : region_list) () =
  ({
     stack_set_name = stack_set_name_;
     accounts = accounts_;
     deployment_targets = deployment_targets_;
     regions = regions_;
     parameter_overrides = parameter_overrides_;
     operation_preferences = operation_preferences_;
     operation_id = operation_id_;
     call_as = call_as_;
   }
    : create_stack_instances_input)

let make_create_stack_output ?stack_id:(stack_id_ : stack_id option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ stack_id = stack_id_; operation_id = operation_id_ } : create_stack_output)

let make_create_stack_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?parameters:(parameters_ : parameters option)
    ?disable_rollback:(disable_rollback_ : disable_rollback option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?timeout_in_minutes:(timeout_in_minutes_ : timeout_minutes option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?capabilities:(capabilities_ : capabilities option)
    ?resource_types:(resource_types_ : resource_types option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?on_failure:(on_failure_ : on_failure option)
    ?stack_policy_body:(stack_policy_body_ : stack_policy_body option)
    ?stack_policy_ur_l:(stack_policy_ur_l_ : stack_policy_ur_l option) ?tags:(tags_ : tags option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?enable_termination_protection:
      (enable_termination_protection_ : enable_termination_protection option)
    ?retain_except_on_create:(retain_except_on_create_ : retain_except_on_create option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?disable_validation:(disable_validation_ : disable_validation option)
    ~stack_name:(stack_name_ : stack_name) () =
  ({
     stack_name = stack_name_;
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     parameters = parameters_;
     disable_rollback = disable_rollback_;
     rollback_configuration = rollback_configuration_;
     timeout_in_minutes = timeout_in_minutes_;
     notification_ar_ns = notification_ar_ns_;
     capabilities = capabilities_;
     resource_types = resource_types_;
     role_ar_n = role_ar_n_;
     on_failure = on_failure_;
     stack_policy_body = stack_policy_body_;
     stack_policy_ur_l = stack_policy_ur_l_;
     tags = tags_;
     client_request_token = client_request_token_;
     enable_termination_protection = enable_termination_protection_;
     retain_except_on_create = retain_except_on_create_;
     deployment_config = deployment_config_;
     disable_validation = disable_validation_;
   }
    : create_stack_input)

let make_create_generated_template_output
    ?generated_template_id:(generated_template_id_ : generated_template_id option) () =
  ({ generated_template_id = generated_template_id_ } : create_generated_template_output)

let make_create_generated_template_input ?resources:(resources_ : resource_definitions option)
    ?stack_name:(stack_name_ : stack_name option)
    ?template_configuration:(template_configuration_ : template_configuration option)
    ~generated_template_name:(generated_template_name_ : generated_template_name) () =
  ({
     resources = resources_;
     generated_template_name = generated_template_name_;
     stack_name = stack_name_;
     template_configuration = template_configuration_;
   }
    : create_generated_template_input)

let make_create_change_set_output ?id:(id_ : change_set_id option)
    ?stack_id:(stack_id_ : stack_id option) () =
  ({ id = id_; stack_id = stack_id_ } : create_change_set_output)

let make_resource_to_import ~resource_type:(resource_type_ : resource_type)
    ~logical_resource_id:(logical_resource_id_ : logical_resource_id)
    ~resource_identifier:(resource_identifier_ : resource_identifier_properties) () =
  ({
     resource_type = resource_type_;
     logical_resource_id = logical_resource_id_;
     resource_identifier = resource_identifier_;
   }
    : resource_to_import)

let make_create_change_set_input ?template_body:(template_body_ : template_body option)
    ?template_ur_l:(template_ur_l_ : template_ur_l option)
    ?use_previous_template:(use_previous_template_ : use_previous_template option)
    ?parameters:(parameters_ : parameters option)
    ?capabilities:(capabilities_ : capabilities option)
    ?resource_types:(resource_types_ : resource_types option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?rollback_configuration:(rollback_configuration_ : rollback_configuration option)
    ?notification_ar_ns:(notification_ar_ns_ : notification_ar_ns option)
    ?tags:(tags_ : tags option) ?client_token:(client_token_ : client_token option)
    ?description:(description_ : description option)
    ?change_set_type:(change_set_type_ : change_set_type option)
    ?resources_to_import:(resources_to_import_ : resources_to_import option)
    ?include_nested_stacks:(include_nested_stacks_ : include_nested_stacks option)
    ?on_stack_failure:(on_stack_failure_ : on_stack_failure option)
    ?import_existing_resources:(import_existing_resources_ : import_existing_resources option)
    ?deployment_mode:(deployment_mode_ : deployment_mode option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?disable_validation:(disable_validation_ : disable_validation option)
    ~stack_name:(stack_name_ : stack_name_or_id)
    ~change_set_name:(change_set_name_ : change_set_name) () =
  ({
     stack_name = stack_name_;
     template_body = template_body_;
     template_ur_l = template_ur_l_;
     use_previous_template = use_previous_template_;
     parameters = parameters_;
     capabilities = capabilities_;
     resource_types = resource_types_;
     role_ar_n = role_ar_n_;
     rollback_configuration = rollback_configuration_;
     notification_ar_ns = notification_ar_ns_;
     tags = tags_;
     change_set_name = change_set_name_;
     client_token = client_token_;
     description = description_;
     change_set_type = change_set_type_;
     resources_to_import = resources_to_import_;
     include_nested_stacks = include_nested_stacks_;
     on_stack_failure = on_stack_failure_;
     import_existing_resources = import_existing_resources_;
     deployment_mode = deployment_mode_;
     deployment_config = deployment_config_;
     disable_validation = disable_validation_;
   }
    : create_change_set_input)

let make_continue_update_rollback_output () = (() : unit)

let make_continue_update_rollback_input ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?resources_to_skip:(resources_to_skip_ : resources_to_skip option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~stack_name:(stack_name_ : stack_name_or_id) () =
  ({
     stack_name = stack_name_;
     role_ar_n = role_ar_n_;
     resources_to_skip = resources_to_skip_;
     client_request_token = client_request_token_;
   }
    : continue_update_rollback_input)
