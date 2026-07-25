open Types

let make_account_aggregation_source ?all_aws_regions:(all_aws_regions_ : boolean_ option)
    ?aws_regions:(aws_regions_ : aggregator_region_list option)
    ~account_ids:(account_ids_ : account_aggregation_source_account_list) () =
  ({ account_ids = account_ids_; all_aws_regions = all_aws_regions_; aws_regions = aws_regions_ }
    : account_aggregation_source)

let make_compliance_contributor_count ?capped_count:(capped_count_ : integer option)
    ?cap_exceeded:(cap_exceeded_ : boolean_ option) () =
  ({ capped_count = capped_count_; cap_exceeded = cap_exceeded_ } : compliance_contributor_count)

let make_compliance ?compliance_type:(compliance_type_ : compliance_type option)
    ?compliance_contributor_count:
      (compliance_contributor_count_ : compliance_contributor_count option) () =
  ({
     compliance_type = compliance_type_;
     compliance_contributor_count = compliance_contributor_count_;
   }
    : compliance)

let make_aggregate_compliance_by_config_rule
    ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?compliance:(compliance_ : compliance option) ?account_id:(account_id_ : account_id option)
    ?aws_region:(aws_region_ : aws_region option) () =
  ({
     config_rule_name = config_rule_name_;
     compliance = compliance_;
     account_id = account_id_;
     aws_region = aws_region_;
   }
    : aggregate_compliance_by_config_rule)

let make_aggregate_conformance_pack_compliance
    ?compliance_type:(compliance_type_ : conformance_pack_compliance_type option)
    ?compliant_rule_count:(compliant_rule_count_ : integer option)
    ?non_compliant_rule_count:(non_compliant_rule_count_ : integer option)
    ?total_rule_count:(total_rule_count_ : integer option) () =
  ({
     compliance_type = compliance_type_;
     compliant_rule_count = compliant_rule_count_;
     non_compliant_rule_count = non_compliant_rule_count_;
     total_rule_count = total_rule_count_;
   }
    : aggregate_conformance_pack_compliance)

let make_aggregate_compliance_by_conformance_pack
    ?conformance_pack_name:(conformance_pack_name_ : conformance_pack_name option)
    ?compliance:(compliance_ : aggregate_conformance_pack_compliance option)
    ?account_id:(account_id_ : account_id option) ?aws_region:(aws_region_ : aws_region option) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     compliance = compliance_;
     account_id = account_id_;
     aws_region = aws_region_;
   }
    : aggregate_compliance_by_conformance_pack)

let make_compliance_summary
    ?compliant_resource_count:(compliant_resource_count_ : compliance_contributor_count option)
    ?non_compliant_resource_count:
      (non_compliant_resource_count_ : compliance_contributor_count option)
    ?compliance_summary_timestamp:(compliance_summary_timestamp_ : date option) () =
  ({
     compliant_resource_count = compliant_resource_count_;
     non_compliant_resource_count = non_compliant_resource_count_;
     compliance_summary_timestamp = compliance_summary_timestamp_;
   }
    : compliance_summary)

let make_aggregate_compliance_count ?group_name:(group_name_ : string_with_char_limit256 option)
    ?compliance_summary:(compliance_summary_ : compliance_summary option) () =
  ({ group_name = group_name_; compliance_summary = compliance_summary_ }
    : aggregate_compliance_count)

let make_aggregate_conformance_pack_compliance_count
    ?compliant_conformance_pack_count:(compliant_conformance_pack_count_ : integer option)
    ?non_compliant_conformance_pack_count:(non_compliant_conformance_pack_count_ : integer option)
    () =
  ({
     compliant_conformance_pack_count = compliant_conformance_pack_count_;
     non_compliant_conformance_pack_count = non_compliant_conformance_pack_count_;
   }
    : aggregate_conformance_pack_compliance_count)

let make_aggregate_conformance_pack_compliance_filters
    ?conformance_pack_name:(conformance_pack_name_ : conformance_pack_name option)
    ?compliance_type:(compliance_type_ : conformance_pack_compliance_type option)
    ?account_id:(account_id_ : account_id option) ?aws_region:(aws_region_ : aws_region option) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     compliance_type = compliance_type_;
     account_id = account_id_;
     aws_region = aws_region_;
   }
    : aggregate_conformance_pack_compliance_filters)

let make_aggregate_conformance_pack_compliance_summary
    ?compliance_summary:(compliance_summary_ : aggregate_conformance_pack_compliance_count option)
    ?group_name:(group_name_ : string_with_char_limit256 option) () =
  ({ compliance_summary = compliance_summary_; group_name = group_name_ }
    : aggregate_conformance_pack_compliance_summary)

let make_aggregate_conformance_pack_compliance_summary_filters
    ?account_id:(account_id_ : account_id option) ?aws_region:(aws_region_ : aws_region option) () =
  ({ account_id = account_id_; aws_region = aws_region_ }
    : aggregate_conformance_pack_compliance_summary_filters)

let make_evaluation_result_qualifier ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_id:(resource_id_ : base_resource_id option)
    ?evaluation_mode:(evaluation_mode_ : evaluation_mode option) () =
  ({
     config_rule_name = config_rule_name_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     evaluation_mode = evaluation_mode_;
   }
    : evaluation_result_qualifier)

let make_evaluation_result_identifier
    ?evaluation_result_qualifier:(evaluation_result_qualifier_ : evaluation_result_qualifier option)
    ?ordering_timestamp:(ordering_timestamp_ : date option)
    ?resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id option) () =
  ({
     evaluation_result_qualifier = evaluation_result_qualifier_;
     ordering_timestamp = ordering_timestamp_;
     resource_evaluation_id = resource_evaluation_id_;
   }
    : evaluation_result_identifier)

let make_aggregate_resource_identifier ?resource_name:(resource_name_ : resource_name option)
    ~source_account_id:(source_account_id_ : account_id)
    ~source_region:(source_region_ : aws_region) ~resource_id:(resource_id_ : resource_id)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     source_account_id = source_account_id_;
     source_region = source_region_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     resource_name = resource_name_;
   }
    : aggregate_resource_identifier)

let make_aggregated_source_status ?source_id:(source_id_ : string_ option)
    ?source_type:(source_type_ : aggregated_source_type option)
    ?aws_region:(aws_region_ : aws_region option)
    ?last_update_status:(last_update_status_ : aggregated_source_status_type option)
    ?last_update_time:(last_update_time_ : date option)
    ?last_error_code:(last_error_code_ : string_ option)
    ?last_error_message:(last_error_message_ : string_ option) () =
  ({
     source_id = source_id_;
     source_type = source_type_;
     aws_region = aws_region_;
     last_update_status = last_update_status_;
     last_update_time = last_update_time_;
     last_error_code = last_error_code_;
     last_error_message = last_error_message_;
   }
    : aggregated_source_status)

let make_aggregation_authorization
    ?aggregation_authorization_arn:(aggregation_authorization_arn_ : string_ option)
    ?authorized_account_id:(authorized_account_id_ : account_id option)
    ?authorized_aws_region:(authorized_aws_region_ : aws_region option)
    ?creation_time:(creation_time_ : date option) () =
  ({
     aggregation_authorization_arn = aggregation_authorization_arn_;
     authorized_account_id = authorized_account_id_;
     authorized_aws_region = authorized_aws_region_;
     creation_time = creation_time_;
   }
    : aggregation_authorization)

let make_aggregator_filter_resource_type ?type_:(type__ : aggregator_filter_type option)
    ?value:(value_ : resource_type_value_list option) () =
  ({ type_ = type__; value = value_ } : aggregator_filter_resource_type)

let make_aggregator_filter_service_principal ?type_:(type__ : aggregator_filter_type option)
    ?value:(value_ : service_principal_value_list option) () =
  ({ type_ = type__; value = value_ } : aggregator_filter_service_principal)

let make_aggregator_filters ?resource_type:(resource_type_ : aggregator_filter_resource_type option)
    ?service_principal:(service_principal_ : aggregator_filter_service_principal option) () =
  ({ resource_type = resource_type_; service_principal = service_principal_ } : aggregator_filters)

let make_recording_mode_override ?description:(description_ : description option)
    ~resource_types:(resource_types_ : recording_mode_resource_types_list)
    ~recording_frequency:(recording_frequency_ : recording_frequency) () =
  ({
     description = description_;
     resource_types = resource_types_;
     recording_frequency = recording_frequency_;
   }
    : recording_mode_override)

let make_recording_mode
    ?recording_mode_overrides:(recording_mode_overrides_ : recording_mode_overrides option)
    ~recording_frequency:(recording_frequency_ : recording_frequency) () =
  ({
     recording_frequency = recording_frequency_;
     recording_mode_overrides = recording_mode_overrides_;
   }
    : recording_mode)

let make_recording_strategy ?use_only:(use_only_ : recording_strategy_type option) () =
  ({ use_only = use_only_ } : recording_strategy)

let make_exclusion_by_resource_types ?resource_types:(resource_types_ : resource_type_list option)
    () =
  ({ resource_types = resource_types_ } : exclusion_by_resource_types)

let make_recording_group ?all_supported:(all_supported_ : all_supported option)
    ?include_global_resource_types:
      (include_global_resource_types_ : include_global_resource_types option)
    ?resource_types:(resource_types_ : resource_type_list option)
    ?exclusion_by_resource_types:(exclusion_by_resource_types_ : exclusion_by_resource_types option)
    ?recording_strategy:(recording_strategy_ : recording_strategy option) () =
  ({
     all_supported = all_supported_;
     include_global_resource_types = include_global_resource_types_;
     resource_types = resource_types_;
     exclusion_by_resource_types = exclusion_by_resource_types_;
     recording_strategy = recording_strategy_;
   }
    : recording_group)

let make_configuration_recorder ?arn:(arn_ : amazon_resource_name option)
    ?name:(name_ : recorder_name option) ?role_ar_n:(role_ar_n_ : string_ option)
    ?recording_group:(recording_group_ : recording_group option)
    ?recording_mode:(recording_mode_ : recording_mode option)
    ?recording_scope:(recording_scope_ : recording_scope option)
    ?service_principal:(service_principal_ : service_principal option) () =
  ({
     arn = arn_;
     name = name_;
     role_ar_n = role_ar_n_;
     recording_group = recording_group_;
     recording_mode = recording_mode_;
     recording_scope = recording_scope_;
     service_principal = service_principal_;
   }
    : configuration_recorder)

let make_associate_resource_types_response
    ~configuration_recorder:(configuration_recorder_ : configuration_recorder) () =
  ({ configuration_recorder = configuration_recorder_ } : associate_resource_types_response)

let make_associate_resource_types_request
    ~configuration_recorder_arn:(configuration_recorder_arn_ : amazon_resource_name)
    ~resource_types:(resource_types_ : resource_type_list) () =
  ({ configuration_recorder_arn = configuration_recorder_arn_; resource_types = resource_types_ }
    : associate_resource_types_request)

let make_base_configuration_item ?version:(version_ : version option)
    ?account_id:(account_id_ : account_id option)
    ?configuration_item_capture_time:
      (configuration_item_capture_time_ : configuration_item_capture_time option)
    ?configuration_item_status:(configuration_item_status_ : configuration_item_status option)
    ?configuration_state_id:(configuration_state_id_ : configuration_state_id option)
    ?arn:(arn_ : ar_n option) ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_name:(resource_name_ : resource_name option)
    ?aws_region:(aws_region_ : aws_region option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?resource_creation_time:(resource_creation_time_ : resource_creation_time option)
    ?configuration:(configuration_ : configuration option)
    ?supplementary_configuration:(supplementary_configuration_ : supplementary_configuration option)
    ?recording_frequency:(recording_frequency_ : recording_frequency option)
    ?configuration_item_delivery_time:
      (configuration_item_delivery_time_ : configuration_item_delivery_time option) () =
  ({
     version = version_;
     account_id = account_id_;
     configuration_item_capture_time = configuration_item_capture_time_;
     configuration_item_status = configuration_item_status_;
     configuration_state_id = configuration_state_id_;
     arn = arn_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     aws_region = aws_region_;
     availability_zone = availability_zone_;
     resource_creation_time = resource_creation_time_;
     configuration = configuration_;
     supplementary_configuration = supplementary_configuration_;
     recording_frequency = recording_frequency_;
     configuration_item_delivery_time = configuration_item_delivery_time_;
   }
    : base_configuration_item)

let make_batch_get_aggregate_resource_config_response
    ?base_configuration_items:(base_configuration_items_ : base_configuration_items option)
    ?unprocessed_resource_identifiers:
      (unprocessed_resource_identifiers_ : unprocessed_resource_identifier_list option) () =
  ({
     base_configuration_items = base_configuration_items_;
     unprocessed_resource_identifiers = unprocessed_resource_identifiers_;
   }
    : batch_get_aggregate_resource_config_response)

let make_batch_get_aggregate_resource_config_request
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    ~resource_identifiers:(resource_identifiers_ : resource_identifiers_list) () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     resource_identifiers = resource_identifiers_;
   }
    : batch_get_aggregate_resource_config_request)

let make_resource_key ~resource_type:(resource_type_ : resource_type)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : resource_key)

let make_batch_get_resource_config_response
    ?base_configuration_items:(base_configuration_items_ : base_configuration_items option)
    ?unprocessed_resource_keys:(unprocessed_resource_keys_ : resource_keys option) () =
  ({
     base_configuration_items = base_configuration_items_;
     unprocessed_resource_keys = unprocessed_resource_keys_;
   }
    : batch_get_resource_config_response)

let make_batch_get_resource_config_request ~resource_keys:(resource_keys_ : resource_keys) () =
  ({ resource_keys = resource_keys_ } : batch_get_resource_config_request)

let make_compliance_by_config_rule
    ?config_rule_name:(config_rule_name_ : string_with_char_limit64 option)
    ?compliance:(compliance_ : compliance option) () =
  ({ config_rule_name = config_rule_name_; compliance = compliance_ } : compliance_by_config_rule)

let make_compliance_by_resource ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_id:(resource_id_ : base_resource_id option)
    ?compliance:(compliance_ : compliance option) () =
  ({ resource_type = resource_type_; resource_id = resource_id_; compliance = compliance_ }
    : compliance_by_resource)

let make_compliance_summary_by_resource_type
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?compliance_summary:(compliance_summary_ : compliance_summary option) () =
  ({ resource_type = resource_type_; compliance_summary = compliance_summary_ }
    : compliance_summary_by_resource_type)

let make_config_export_delivery_info ?last_status:(last_status_ : delivery_status option)
    ?last_error_code:(last_error_code_ : string_ option)
    ?last_error_message:(last_error_message_ : string_ option)
    ?last_attempt_time:(last_attempt_time_ : date option)
    ?last_successful_time:(last_successful_time_ : date option)
    ?next_delivery_time:(next_delivery_time_ : date option) () =
  ({
     last_status = last_status_;
     last_error_code = last_error_code_;
     last_error_message = last_error_message_;
     last_attempt_time = last_attempt_time_;
     last_successful_time = last_successful_time_;
     next_delivery_time = next_delivery_time_;
   }
    : config_export_delivery_info)

let make_evaluation_mode_configuration ?mode:(mode_ : evaluation_mode option) () =
  ({ mode = mode_ } : evaluation_mode_configuration)

let make_custom_policy_details
    ?enable_debug_log_delivery:(enable_debug_log_delivery_ : boolean_ option)
    ~policy_runtime:(policy_runtime_ : policy_runtime) ~policy_text:(policy_text_ : policy_text) ()
    =
  ({
     policy_runtime = policy_runtime_;
     policy_text = policy_text_;
     enable_debug_log_delivery = enable_debug_log_delivery_;
   }
    : custom_policy_details)

let make_source_detail ?event_source:(event_source_ : event_source option)
    ?message_type:(message_type_ : message_type option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    () =
  ({
     event_source = event_source_;
     message_type = message_type_;
     maximum_execution_frequency = maximum_execution_frequency_;
   }
    : source_detail)

let make_source ?source_identifier:(source_identifier_ : string_with_char_limit256 option)
    ?source_details:(source_details_ : source_details option)
    ?custom_policy_details:(custom_policy_details_ : custom_policy_details option)
    ~owner:(owner_ : owner) () =
  ({
     owner = owner_;
     source_identifier = source_identifier_;
     source_details = source_details_;
     custom_policy_details = custom_policy_details_;
   }
    : source)

let make_scope
    ?compliance_resource_types:(compliance_resource_types_ : compliance_resource_types option)
    ?tag_key:(tag_key_ : string_with_char_limit128 option)
    ?tag_value:(tag_value_ : string_with_char_limit256 option)
    ?compliance_resource_id:(compliance_resource_id_ : base_resource_id option)
    ?service_principals:(service_principals_ : service_principals option) () =
  ({
     compliance_resource_types = compliance_resource_types_;
     tag_key = tag_key_;
     tag_value = tag_value_;
     compliance_resource_id = compliance_resource_id_;
     service_principals = service_principals_;
   }
    : scope)

let make_config_rule ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?config_rule_arn:(config_rule_arn_ : string_with_char_limit256 option)
    ?config_rule_id:(config_rule_id_ : string_with_char_limit64 option)
    ?description:(description_ : emptiable_string_with_char_limit256 option)
    ?scope:(scope_ : scope option)
    ?input_parameters:(input_parameters_ : string_with_char_limit1024 option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    ?config_rule_state:(config_rule_state_ : config_rule_state option)
    ?created_by:(created_by_ : string_with_char_limit256 option)
    ?evaluation_modes:(evaluation_modes_ : evaluation_modes option)
    ?rule_evaluation_visibility:(rule_evaluation_visibility_ : rule_evaluation_visibility option)
    ~source:(source_ : source) () =
  ({
     config_rule_name = config_rule_name_;
     config_rule_arn = config_rule_arn_;
     config_rule_id = config_rule_id_;
     description = description_;
     scope = scope_;
     source = source_;
     input_parameters = input_parameters_;
     maximum_execution_frequency = maximum_execution_frequency_;
     config_rule_state = config_rule_state_;
     created_by = created_by_;
     evaluation_modes = evaluation_modes_;
     rule_evaluation_visibility = rule_evaluation_visibility_;
   }
    : config_rule)

let make_config_rule_compliance_filters
    ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?compliance_type:(compliance_type_ : compliance_type option)
    ?account_id:(account_id_ : account_id option) ?aws_region:(aws_region_ : aws_region option) () =
  ({
     config_rule_name = config_rule_name_;
     compliance_type = compliance_type_;
     account_id = account_id_;
     aws_region = aws_region_;
   }
    : config_rule_compliance_filters)

let make_config_rule_compliance_summary_filters ?account_id:(account_id_ : account_id option)
    ?aws_region:(aws_region_ : aws_region option) () =
  ({ account_id = account_id_; aws_region = aws_region_ } : config_rule_compliance_summary_filters)

let make_config_rule_evaluation_status
    ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?config_rule_arn:(config_rule_arn_ : string_ option)
    ?config_rule_id:(config_rule_id_ : string_ option)
    ?last_successful_invocation_time:(last_successful_invocation_time_ : date option)
    ?last_failed_invocation_time:(last_failed_invocation_time_ : date option)
    ?last_successful_evaluation_time:(last_successful_evaluation_time_ : date option)
    ?last_failed_evaluation_time:(last_failed_evaluation_time_ : date option)
    ?first_activated_time:(first_activated_time_ : date option)
    ?last_deactivated_time:(last_deactivated_time_ : date option)
    ?last_error_code:(last_error_code_ : string_ option)
    ?last_error_message:(last_error_message_ : string_ option)
    ?first_evaluation_started:(first_evaluation_started_ : boolean_ option)
    ?last_debug_log_delivery_status:(last_debug_log_delivery_status_ : string_ option)
    ?last_debug_log_delivery_status_reason:(last_debug_log_delivery_status_reason_ : string_ option)
    ?last_debug_log_delivery_time:(last_debug_log_delivery_time_ : date option) () =
  ({
     config_rule_name = config_rule_name_;
     config_rule_arn = config_rule_arn_;
     config_rule_id = config_rule_id_;
     last_successful_invocation_time = last_successful_invocation_time_;
     last_failed_invocation_time = last_failed_invocation_time_;
     last_successful_evaluation_time = last_successful_evaluation_time_;
     last_failed_evaluation_time = last_failed_evaluation_time_;
     first_activated_time = first_activated_time_;
     last_deactivated_time = last_deactivated_time_;
     last_error_code = last_error_code_;
     last_error_message = last_error_message_;
     first_evaluation_started = first_evaluation_started_;
     last_debug_log_delivery_status = last_debug_log_delivery_status_;
     last_debug_log_delivery_status_reason = last_debug_log_delivery_status_reason_;
     last_debug_log_delivery_time = last_debug_log_delivery_time_;
   }
    : config_rule_evaluation_status)

let make_config_snapshot_delivery_properties
    ?delivery_frequency:(delivery_frequency_ : maximum_execution_frequency option) () =
  ({ delivery_frequency = delivery_frequency_ } : config_snapshot_delivery_properties)

let make_config_stream_delivery_info ?last_status:(last_status_ : delivery_status option)
    ?last_error_code:(last_error_code_ : string_ option)
    ?last_error_message:(last_error_message_ : string_ option)
    ?last_status_change_time:(last_status_change_time_ : date option) () =
  ({
     last_status = last_status_;
     last_error_code = last_error_code_;
     last_error_message = last_error_message_;
     last_status_change_time = last_status_change_time_;
   }
    : config_stream_delivery_info)

let make_organization_aggregation_source ?aws_regions:(aws_regions_ : aggregator_region_list option)
    ?all_aws_regions:(all_aws_regions_ : boolean_ option) ~role_arn:(role_arn_ : string_) () =
  ({ role_arn = role_arn_; aws_regions = aws_regions_; all_aws_regions = all_aws_regions_ }
    : organization_aggregation_source)

let make_configuration_aggregator
    ?configuration_aggregator_name:
      (configuration_aggregator_name_ : configuration_aggregator_name option)
    ?configuration_aggregator_arn:
      (configuration_aggregator_arn_ : configuration_aggregator_arn option)
    ?account_aggregation_sources:
      (account_aggregation_sources_ : account_aggregation_source_list option)
    ?organization_aggregation_source:
      (organization_aggregation_source_ : organization_aggregation_source option)
    ?creation_time:(creation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?created_by:(created_by_ : string_with_char_limit256 option)
    ?aggregator_filters:(aggregator_filters_ : aggregator_filters option) () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     configuration_aggregator_arn = configuration_aggregator_arn_;
     account_aggregation_sources = account_aggregation_sources_;
     organization_aggregation_source = organization_aggregation_source_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     created_by = created_by_;
     aggregator_filters = aggregator_filters_;
   }
    : configuration_aggregator)

let make_relationship ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_name:(resource_name_ : resource_name option)
    ?relationship_name:(relationship_name_ : relationship_name option) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     relationship_name = relationship_name_;
   }
    : relationship)

let make_configuration_item ?version:(version_ : version option)
    ?account_id:(account_id_ : account_id option)
    ?configuration_item_capture_time:
      (configuration_item_capture_time_ : configuration_item_capture_time option)
    ?configuration_item_status:(configuration_item_status_ : configuration_item_status option)
    ?configuration_state_id:(configuration_state_id_ : configuration_state_id option)
    ?configuration_item_md5_hash:(configuration_item_md5_hash_ : configuration_item_md5_hash option)
    ?arn:(arn_ : ar_n option) ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_name:(resource_name_ : resource_name option)
    ?aws_region:(aws_region_ : aws_region option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?resource_creation_time:(resource_creation_time_ : resource_creation_time option)
    ?tags:(tags_ : tags option) ?related_events:(related_events_ : related_event_list option)
    ?relationships:(relationships_ : relationship_list option)
    ?configuration:(configuration_ : configuration option)
    ?supplementary_configuration:(supplementary_configuration_ : supplementary_configuration option)
    ?recording_frequency:(recording_frequency_ : recording_frequency option)
    ?configuration_item_delivery_time:
      (configuration_item_delivery_time_ : configuration_item_delivery_time option) () =
  ({
     version = version_;
     account_id = account_id_;
     configuration_item_capture_time = configuration_item_capture_time_;
     configuration_item_status = configuration_item_status_;
     configuration_state_id = configuration_state_id_;
     configuration_item_md5_hash = configuration_item_md5_hash_;
     arn = arn_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     aws_region = aws_region_;
     availability_zone = availability_zone_;
     resource_creation_time = resource_creation_time_;
     tags = tags_;
     related_events = related_events_;
     relationships = relationships_;
     configuration = configuration_;
     supplementary_configuration = supplementary_configuration_;
     recording_frequency = recording_frequency_;
     configuration_item_delivery_time = configuration_item_delivery_time_;
   }
    : configuration_item)

let make_configuration_recorder_filter
    ?filter_name:(filter_name_ : configuration_recorder_filter_name option)
    ?filter_value:(filter_value_ : configuration_recorder_filter_values option) () =
  ({ filter_name = filter_name_; filter_value = filter_value_ } : configuration_recorder_filter)

let make_configuration_recorder_status ?arn:(arn_ : amazon_resource_name option)
    ?name:(name_ : string_ option) ?last_start_time:(last_start_time_ : date option)
    ?last_stop_time:(last_stop_time_ : date option) ?recording:(recording_ : boolean_ option)
    ?last_status:(last_status_ : recorder_status option)
    ?last_error_code:(last_error_code_ : string_ option)
    ?last_error_message:(last_error_message_ : string_ option)
    ?last_status_change_time:(last_status_change_time_ : date option)
    ?service_principal:(service_principal_ : service_principal option) () =
  ({
     arn = arn_;
     name = name_;
     last_start_time = last_start_time_;
     last_stop_time = last_stop_time_;
     recording = recording_;
     last_status = last_status_;
     last_error_code = last_error_code_;
     last_error_message = last_error_message_;
     last_status_change_time = last_status_change_time_;
     service_principal = service_principal_;
   }
    : configuration_recorder_status)

let make_configuration_recorder_summary
    ?service_principal:(service_principal_ : service_principal option)
    ~arn:(arn_ : amazon_resource_name) ~name:(name_ : recorder_name)
    ~recording_scope:(recording_scope_ : recording_scope) () =
  ({
     arn = arn_;
     name = name_;
     service_principal = service_principal_;
     recording_scope = recording_scope_;
   }
    : configuration_recorder_summary)

let make_conformance_pack_compliance_filters
    ?config_rule_names:(config_rule_names_ : conformance_pack_config_rule_names option)
    ?compliance_type:(compliance_type_ : conformance_pack_compliance_type option) () =
  ({ config_rule_names = config_rule_names_; compliance_type = compliance_type_ }
    : conformance_pack_compliance_filters)

let make_conformance_pack_compliance_score ?score:(score_ : compliance_score option)
    ?conformance_pack_name:(conformance_pack_name_ : conformance_pack_name option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option) () =
  ({
     score = score_;
     conformance_pack_name = conformance_pack_name_;
     last_updated_time = last_updated_time_;
   }
    : conformance_pack_compliance_score)

let make_conformance_pack_compliance_scores_filters
    ~conformance_pack_names:(conformance_pack_names_ : conformance_pack_name_filter) () =
  ({ conformance_pack_names = conformance_pack_names_ }
    : conformance_pack_compliance_scores_filters)

let make_conformance_pack_compliance_summary
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name)
    ~conformance_pack_compliance_status:
      (conformance_pack_compliance_status_ : conformance_pack_compliance_type) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     conformance_pack_compliance_status = conformance_pack_compliance_status_;
   }
    : conformance_pack_compliance_summary)

let make_template_ssm_document_details
    ?document_version:(document_version_ : ssm_document_version option)
    ~document_name:(document_name_ : ssm_document_name) () =
  ({ document_name = document_name_; document_version = document_version_ }
    : template_ssm_document_details)

let make_conformance_pack_input_parameter ~parameter_name:(parameter_name_ : parameter_name)
    ~parameter_value:(parameter_value_ : parameter_value) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ }
    : conformance_pack_input_parameter)

let make_conformance_pack_detail
    ?delivery_s3_bucket:(delivery_s3_bucket_ : delivery_s3_bucket option)
    ?delivery_s3_key_prefix:(delivery_s3_key_prefix_ : delivery_s3_key_prefix option)
    ?conformance_pack_input_parameters:
      (conformance_pack_input_parameters_ : conformance_pack_input_parameters option)
    ?last_update_requested_time:(last_update_requested_time_ : date option)
    ?created_by:(created_by_ : string_with_char_limit256 option)
    ?template_ssm_document_details:
      (template_ssm_document_details_ : template_ssm_document_details option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name)
    ~conformance_pack_arn:(conformance_pack_arn_ : conformance_pack_arn)
    ~conformance_pack_id:(conformance_pack_id_ : conformance_pack_id) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     conformance_pack_arn = conformance_pack_arn_;
     conformance_pack_id = conformance_pack_id_;
     delivery_s3_bucket = delivery_s3_bucket_;
     delivery_s3_key_prefix = delivery_s3_key_prefix_;
     conformance_pack_input_parameters = conformance_pack_input_parameters_;
     last_update_requested_time = last_update_requested_time_;
     created_by = created_by_;
     template_ssm_document_details = template_ssm_document_details_;
   }
    : conformance_pack_detail)

let make_conformance_pack_evaluation_filters
    ?config_rule_names:(config_rule_names_ : conformance_pack_config_rule_names option)
    ?compliance_type:(compliance_type_ : conformance_pack_compliance_type option)
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_ids:(resource_ids_ : conformance_pack_compliance_resource_ids option) () =
  ({
     config_rule_names = config_rule_names_;
     compliance_type = compliance_type_;
     resource_type = resource_type_;
     resource_ids = resource_ids_;
   }
    : conformance_pack_evaluation_filters)

let make_conformance_pack_rule_compliance
    ?config_rule_name:(config_rule_name_ : config_rule_name option)
    ?compliance_type:(compliance_type_ : conformance_pack_compliance_type option)
    ?controls:(controls_ : controls_list option) () =
  ({
     config_rule_name = config_rule_name_;
     compliance_type = compliance_type_;
     controls = controls_;
   }
    : conformance_pack_rule_compliance)

let make_conformance_pack_status_detail
    ?conformance_pack_status_reason:
      (conformance_pack_status_reason_ : conformance_pack_status_reason option)
    ?last_update_completed_time:(last_update_completed_time_ : date option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name)
    ~conformance_pack_id:(conformance_pack_id_ : conformance_pack_id)
    ~conformance_pack_arn:(conformance_pack_arn_ : conformance_pack_arn)
    ~conformance_pack_state:(conformance_pack_state_ : conformance_pack_state)
    ~stack_arn:(stack_arn_ : stack_arn)
    ~last_update_requested_time:(last_update_requested_time_ : date) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     conformance_pack_id = conformance_pack_id_;
     conformance_pack_arn = conformance_pack_arn_;
     conformance_pack_state = conformance_pack_state_;
     stack_arn = stack_arn_;
     conformance_pack_status_reason = conformance_pack_status_reason_;
     last_update_requested_time = last_update_requested_time_;
     last_update_completed_time = last_update_completed_time_;
   }
    : conformance_pack_status_detail)

let make_delete_aggregation_authorization_request
    ~authorized_account_id:(authorized_account_id_ : account_id)
    ~authorized_aws_region:(authorized_aws_region_ : aws_region) () =
  ({
     authorized_account_id = authorized_account_id_;
     authorized_aws_region = authorized_aws_region_;
   }
    : delete_aggregation_authorization_request)

let make_delete_config_rule_request ~config_rule_name:(config_rule_name_ : config_rule_name) () =
  ({ config_rule_name = config_rule_name_ } : delete_config_rule_request)

let make_delete_configuration_aggregator_request
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({ configuration_aggregator_name = configuration_aggregator_name_ }
    : delete_configuration_aggregator_request)

let make_delete_configuration_recorder_request
    ~configuration_recorder_name:(configuration_recorder_name_ : recorder_name) () =
  ({ configuration_recorder_name = configuration_recorder_name_ }
    : delete_configuration_recorder_request)

let make_delete_conformance_pack_request
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name) () =
  ({ conformance_pack_name = conformance_pack_name_ } : delete_conformance_pack_request)

let make_delete_delivery_channel_request
    ~delivery_channel_name:(delivery_channel_name_ : channel_name) () =
  ({ delivery_channel_name = delivery_channel_name_ } : delete_delivery_channel_request)

let make_delete_evaluation_results_response () = (() : unit)

let make_delete_evaluation_results_request
    ~config_rule_name:(config_rule_name_ : string_with_char_limit64) () =
  ({ config_rule_name = config_rule_name_ } : delete_evaluation_results_request)

let make_delete_organization_config_rule_request
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    () =
  ({ organization_config_rule_name = organization_config_rule_name_ }
    : delete_organization_config_rule_request)

let make_delete_organization_conformance_pack_request
    ~organization_conformance_pack_name:
      (organization_conformance_pack_name_ : organization_conformance_pack_name) () =
  ({ organization_conformance_pack_name = organization_conformance_pack_name_ }
    : delete_organization_conformance_pack_request)

let make_delete_pending_aggregation_request_request
    ~requester_account_id:(requester_account_id_ : account_id)
    ~requester_aws_region:(requester_aws_region_ : aws_region) () =
  ({ requester_account_id = requester_account_id_; requester_aws_region = requester_aws_region_ }
    : delete_pending_aggregation_request_request)

let make_delete_remediation_configuration_response () = (() : unit)

let make_delete_remediation_configuration_request ?resource_type:(resource_type_ : string_ option)
    ~config_rule_name:(config_rule_name_ : config_rule_name) () =
  ({ config_rule_name = config_rule_name_; resource_type = resource_type_ }
    : delete_remediation_configuration_request)

let make_remediation_exception_resource_key
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_id:(resource_id_ : string_with_char_limit1024 option) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ }
    : remediation_exception_resource_key)

let make_failed_delete_remediation_exceptions_batch
    ?failure_message:(failure_message_ : string_ option)
    ?failed_items:(failed_items_ : remediation_exception_resource_keys option) () =
  ({ failure_message = failure_message_; failed_items = failed_items_ }
    : failed_delete_remediation_exceptions_batch)

let make_delete_remediation_exceptions_response
    ?failed_batches:(failed_batches_ : failed_delete_remediation_exceptions_batches option) () =
  ({ failed_batches = failed_batches_ } : delete_remediation_exceptions_response)

let make_delete_remediation_exceptions_request
    ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~resource_keys:(resource_keys_ : remediation_exception_resource_keys) () =
  ({ config_rule_name = config_rule_name_; resource_keys = resource_keys_ }
    : delete_remediation_exceptions_request)

let make_delete_resource_config_request ~resource_type:(resource_type_ : resource_type_string)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : delete_resource_config_request)

let make_delete_retention_configuration_request
    ~retention_configuration_name:(retention_configuration_name_ : retention_configuration_name) ()
    =
  ({ retention_configuration_name = retention_configuration_name_ }
    : delete_retention_configuration_request)

let make_delete_service_linked_configuration_recorder_response ~arn:(arn_ : amazon_resource_name)
    ~name:(name_ : recorder_name) () =
  ({ arn = arn_; name = name_ } : delete_service_linked_configuration_recorder_response)

let make_delete_service_linked_configuration_recorder_request
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_ }
    : delete_service_linked_configuration_recorder_request)

let make_delete_stored_query_response () = (() : unit)

let make_delete_stored_query_request ~query_name:(query_name_ : query_name) () =
  ({ query_name = query_name_ } : delete_stored_query_request)

let make_deliver_config_snapshot_response ?config_snapshot_id:(config_snapshot_id_ : string_ option)
    () =
  ({ config_snapshot_id = config_snapshot_id_ } : deliver_config_snapshot_response)

let make_deliver_config_snapshot_request
    ~delivery_channel_name:(delivery_channel_name_ : channel_name) () =
  ({ delivery_channel_name = delivery_channel_name_ } : deliver_config_snapshot_request)

let make_delivery_channel ?name:(name_ : channel_name option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_kms_key_arn:(s3_kms_key_arn_ : string_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?config_snapshot_delivery_properties:
      (config_snapshot_delivery_properties_ : config_snapshot_delivery_properties option) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_kms_key_arn = s3_kms_key_arn_;
     sns_topic_ar_n = sns_topic_ar_n_;
     config_snapshot_delivery_properties = config_snapshot_delivery_properties_;
   }
    : delivery_channel)

let make_delivery_channel_status ?name:(name_ : string_ option)
    ?config_snapshot_delivery_info:
      (config_snapshot_delivery_info_ : config_export_delivery_info option)
    ?config_history_delivery_info:
      (config_history_delivery_info_ : config_export_delivery_info option)
    ?config_stream_delivery_info:(config_stream_delivery_info_ : config_stream_delivery_info option)
    () =
  ({
     name = name_;
     config_snapshot_delivery_info = config_snapshot_delivery_info_;
     config_history_delivery_info = config_history_delivery_info_;
     config_stream_delivery_info = config_stream_delivery_info_;
   }
    : delivery_channel_status)

let make_describe_aggregate_compliance_by_config_rules_response
    ?aggregate_compliance_by_config_rules:
      (aggregate_compliance_by_config_rules_ : aggregate_compliance_by_config_rule_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     aggregate_compliance_by_config_rules = aggregate_compliance_by_config_rules_;
     next_token = next_token_;
   }
    : describe_aggregate_compliance_by_config_rules_response)

let make_describe_aggregate_compliance_by_config_rules_request
    ?filters:(filters_ : config_rule_compliance_filters option)
    ?limit:(limit_ : group_by_api_limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_aggregate_compliance_by_config_rules_request)

let make_describe_aggregate_compliance_by_conformance_packs_response
    ?aggregate_compliance_by_conformance_packs:
      (aggregate_compliance_by_conformance_packs_ :
         aggregate_compliance_by_conformance_pack_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     aggregate_compliance_by_conformance_packs = aggregate_compliance_by_conformance_packs_;
     next_token = next_token_;
   }
    : describe_aggregate_compliance_by_conformance_packs_response)

let make_describe_aggregate_compliance_by_conformance_packs_request
    ?filters:(filters_ : aggregate_conformance_pack_compliance_filters option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_aggregate_compliance_by_conformance_packs_request)

let make_describe_aggregation_authorizations_response
    ?aggregation_authorizations:
      (aggregation_authorizations_ : aggregation_authorization_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ aggregation_authorizations = aggregation_authorizations_; next_token = next_token_ }
    : describe_aggregation_authorizations_response)

let make_describe_aggregation_authorizations_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ limit = limit_; next_token = next_token_ } : describe_aggregation_authorizations_request)

let make_describe_compliance_by_config_rule_response
    ?compliance_by_config_rules:(compliance_by_config_rules_ : compliance_by_config_rules option)
    ?next_token:(next_token_ : string_ option) () =
  ({ compliance_by_config_rules = compliance_by_config_rules_; next_token = next_token_ }
    : describe_compliance_by_config_rule_response)

let make_describe_compliance_by_config_rule_request
    ?config_rule_names:(config_rule_names_ : config_rule_names option)
    ?compliance_types:(compliance_types_ : compliance_types option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     config_rule_names = config_rule_names_;
     compliance_types = compliance_types_;
     next_token = next_token_;
   }
    : describe_compliance_by_config_rule_request)

let make_describe_compliance_by_resource_response
    ?compliance_by_resources:(compliance_by_resources_ : compliance_by_resources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ compliance_by_resources = compliance_by_resources_; next_token = next_token_ }
    : describe_compliance_by_resource_response)

let make_describe_compliance_by_resource_request
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_id:(resource_id_ : base_resource_id option)
    ?compliance_types:(compliance_types_ : compliance_types option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     compliance_types = compliance_types_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_compliance_by_resource_request)

let make_describe_config_rule_evaluation_status_response
    ?config_rules_evaluation_status:
      (config_rules_evaluation_status_ : config_rule_evaluation_status_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ config_rules_evaluation_status = config_rules_evaluation_status_; next_token = next_token_ }
    : describe_config_rule_evaluation_status_response)

let make_describe_config_rule_evaluation_status_request
    ?config_rule_names:(config_rule_names_ : config_rule_names option)
    ?next_token:(next_token_ : string_ option) ?limit:(limit_ : rule_limit option) () =
  ({ config_rule_names = config_rule_names_; next_token = next_token_; limit = limit_ }
    : describe_config_rule_evaluation_status_request)

let make_describe_config_rules_response ?config_rules:(config_rules_ : config_rules option)
    ?next_token:(next_token_ : string_ option) () =
  ({ config_rules = config_rules_; next_token = next_token_ } : describe_config_rules_response)

let make_describe_config_rules_filters ?evaluation_mode:(evaluation_mode_ : evaluation_mode option)
    ?rule_evaluation_visibility:(rule_evaluation_visibility_ : rule_evaluation_visibility option) ()
    =
  ({ evaluation_mode = evaluation_mode_; rule_evaluation_visibility = rule_evaluation_visibility_ }
    : describe_config_rules_filters)

let make_describe_config_rules_request
    ?config_rule_names:(config_rule_names_ : config_rule_names option)
    ?next_token:(next_token_ : string_ option)
    ?filters:(filters_ : describe_config_rules_filters option) () =
  ({ config_rule_names = config_rule_names_; next_token = next_token_; filters = filters_ }
    : describe_config_rules_request)

let make_describe_configuration_aggregator_sources_status_response
    ?aggregated_source_status_list:
      (aggregated_source_status_list_ : aggregated_source_status_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ aggregated_source_status_list = aggregated_source_status_list_; next_token = next_token_ }
    : describe_configuration_aggregator_sources_status_response)

let make_describe_configuration_aggregator_sources_status_request
    ?update_status:(update_status_ : aggregated_source_status_type_list option)
    ?next_token:(next_token_ : string_ option) ?limit:(limit_ : limit option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     update_status = update_status_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_configuration_aggregator_sources_status_request)

let make_describe_configuration_aggregators_response
    ?configuration_aggregators:(configuration_aggregators_ : configuration_aggregator_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ configuration_aggregators = configuration_aggregators_; next_token = next_token_ }
    : describe_configuration_aggregators_response)

let make_describe_configuration_aggregators_request
    ?configuration_aggregator_names:
      (configuration_aggregator_names_ : configuration_aggregator_name_list option)
    ?next_token:(next_token_ : string_ option) ?limit:(limit_ : limit option) () =
  ({
     configuration_aggregator_names = configuration_aggregator_names_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_configuration_aggregators_request)

let make_describe_configuration_recorder_status_response
    ?configuration_recorders_status:
      (configuration_recorders_status_ : configuration_recorder_status_list option) () =
  ({ configuration_recorders_status = configuration_recorders_status_ }
    : describe_configuration_recorder_status_response)

let make_describe_configuration_recorder_status_request
    ?configuration_recorder_names:
      (configuration_recorder_names_ : configuration_recorder_name_list option)
    ?service_principal:(service_principal_ : service_principal option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({
     configuration_recorder_names = configuration_recorder_names_;
     service_principal = service_principal_;
     arn = arn_;
   }
    : describe_configuration_recorder_status_request)

let make_describe_configuration_recorders_response
    ?configuration_recorders:(configuration_recorders_ : configuration_recorder_list option) () =
  ({ configuration_recorders = configuration_recorders_ }
    : describe_configuration_recorders_response)

let make_describe_configuration_recorders_request
    ?configuration_recorder_names:
      (configuration_recorder_names_ : configuration_recorder_name_list option)
    ?service_principal:(service_principal_ : service_principal option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({
     configuration_recorder_names = configuration_recorder_names_;
     service_principal = service_principal_;
     arn = arn_;
   }
    : describe_configuration_recorders_request)

let make_describe_conformance_pack_compliance_response ?next_token:(next_token_ : next_token option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name)
    ~conformance_pack_rule_compliance_list:
      (conformance_pack_rule_compliance_list_ : conformance_pack_rule_compliance_list) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     conformance_pack_rule_compliance_list = conformance_pack_rule_compliance_list_;
     next_token = next_token_;
   }
    : describe_conformance_pack_compliance_response)

let make_describe_conformance_pack_compliance_request
    ?filters:(filters_ : conformance_pack_compliance_filters option)
    ?limit:(limit_ : describe_conformance_pack_compliance_limit option)
    ?next_token:(next_token_ : next_token option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_conformance_pack_compliance_request)

let make_describe_conformance_pack_status_response
    ?conformance_pack_status_details:
      (conformance_pack_status_details_ : conformance_pack_status_details_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ conformance_pack_status_details = conformance_pack_status_details_; next_token = next_token_ }
    : describe_conformance_pack_status_response)

let make_describe_conformance_pack_status_request
    ?conformance_pack_names:(conformance_pack_names_ : conformance_pack_names_list option)
    ?limit:(limit_ : page_size_limit option) ?next_token:(next_token_ : next_token option) () =
  ({ conformance_pack_names = conformance_pack_names_; limit = limit_; next_token = next_token_ }
    : describe_conformance_pack_status_request)

let make_describe_conformance_packs_response
    ?conformance_pack_details:(conformance_pack_details_ : conformance_pack_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ conformance_pack_details = conformance_pack_details_; next_token = next_token_ }
    : describe_conformance_packs_response)

let make_describe_conformance_packs_request
    ?conformance_pack_names:(conformance_pack_names_ : conformance_pack_names_list option)
    ?limit:(limit_ : page_size_limit option) ?next_token:(next_token_ : next_token option) () =
  ({ conformance_pack_names = conformance_pack_names_; limit = limit_; next_token = next_token_ }
    : describe_conformance_packs_request)

let make_describe_delivery_channel_status_response
    ?delivery_channels_status:(delivery_channels_status_ : delivery_channel_status_list option) () =
  ({ delivery_channels_status = delivery_channels_status_ }
    : describe_delivery_channel_status_response)

let make_describe_delivery_channel_status_request
    ?delivery_channel_names:(delivery_channel_names_ : delivery_channel_name_list option) () =
  ({ delivery_channel_names = delivery_channel_names_ } : describe_delivery_channel_status_request)

let make_describe_delivery_channels_response
    ?delivery_channels:(delivery_channels_ : delivery_channel_list option) () =
  ({ delivery_channels = delivery_channels_ } : describe_delivery_channels_response)

let make_describe_delivery_channels_request
    ?delivery_channel_names:(delivery_channel_names_ : delivery_channel_name_list option) () =
  ({ delivery_channel_names = delivery_channel_names_ } : describe_delivery_channels_request)

let make_organization_config_rule_status ?error_code:(error_code_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?last_update_time:(last_update_time_ : date option)
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    ~organization_rule_status:(organization_rule_status_ : organization_rule_status) () =
  ({
     organization_config_rule_name = organization_config_rule_name_;
     organization_rule_status = organization_rule_status_;
     error_code = error_code_;
     error_message = error_message_;
     last_update_time = last_update_time_;
   }
    : organization_config_rule_status)

let make_describe_organization_config_rule_statuses_response
    ?organization_config_rule_statuses:
      (organization_config_rule_statuses_ : organization_config_rule_statuses option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     organization_config_rule_statuses = organization_config_rule_statuses_;
     next_token = next_token_;
   }
    : describe_organization_config_rule_statuses_response)

let make_describe_organization_config_rule_statuses_request
    ?organization_config_rule_names:
      (organization_config_rule_names_ : organization_config_rule_names option)
    ?limit:(limit_ : cosmos_page_limit option) ?next_token:(next_token_ : string_ option) () =
  ({
     organization_config_rule_names = organization_config_rule_names_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_organization_config_rule_statuses_request)

let make_organization_custom_policy_rule_metadata_no_policy
    ?description:(description_ : string_with_char_limit256_min0 option)
    ?organization_config_rule_trigger_types:
      (organization_config_rule_trigger_types_ :
         organization_config_rule_trigger_type_no_s_ns option)
    ?input_parameters:(input_parameters_ : string_with_char_limit1024 option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    ?resource_types_scope:(resource_types_scope_ : resource_types_scope option)
    ?resource_id_scope:(resource_id_scope_ : string_with_char_limit768 option)
    ?tag_key_scope:(tag_key_scope_ : string_with_char_limit128 option)
    ?tag_value_scope:(tag_value_scope_ : string_with_char_limit256 option)
    ?policy_runtime:(policy_runtime_ : policy_runtime option)
    ?debug_log_delivery_accounts:(debug_log_delivery_accounts_ : debug_log_delivery_accounts option)
    () =
  ({
     description = description_;
     organization_config_rule_trigger_types = organization_config_rule_trigger_types_;
     input_parameters = input_parameters_;
     maximum_execution_frequency = maximum_execution_frequency_;
     resource_types_scope = resource_types_scope_;
     resource_id_scope = resource_id_scope_;
     tag_key_scope = tag_key_scope_;
     tag_value_scope = tag_value_scope_;
     policy_runtime = policy_runtime_;
     debug_log_delivery_accounts = debug_log_delivery_accounts_;
   }
    : organization_custom_policy_rule_metadata_no_policy)

let make_organization_custom_rule_metadata
    ?description:(description_ : string_with_char_limit256_min0 option)
    ?input_parameters:(input_parameters_ : string_with_char_limit1024 option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    ?resource_types_scope:(resource_types_scope_ : resource_types_scope option)
    ?resource_id_scope:(resource_id_scope_ : string_with_char_limit768 option)
    ?tag_key_scope:(tag_key_scope_ : string_with_char_limit128 option)
    ?tag_value_scope:(tag_value_scope_ : string_with_char_limit256 option)
    ~lambda_function_arn:(lambda_function_arn_ : string_with_char_limit256)
    ~organization_config_rule_trigger_types:
      (organization_config_rule_trigger_types_ : organization_config_rule_trigger_types) () =
  ({
     description = description_;
     lambda_function_arn = lambda_function_arn_;
     organization_config_rule_trigger_types = organization_config_rule_trigger_types_;
     input_parameters = input_parameters_;
     maximum_execution_frequency = maximum_execution_frequency_;
     resource_types_scope = resource_types_scope_;
     resource_id_scope = resource_id_scope_;
     tag_key_scope = tag_key_scope_;
     tag_value_scope = tag_value_scope_;
   }
    : organization_custom_rule_metadata)

let make_organization_managed_rule_metadata
    ?description:(description_ : string_with_char_limit256_min0 option)
    ?input_parameters:(input_parameters_ : string_with_char_limit1024 option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    ?resource_types_scope:(resource_types_scope_ : resource_types_scope option)
    ?resource_id_scope:(resource_id_scope_ : string_with_char_limit768 option)
    ?tag_key_scope:(tag_key_scope_ : string_with_char_limit128 option)
    ?tag_value_scope:(tag_value_scope_ : string_with_char_limit256 option)
    ~rule_identifier:(rule_identifier_ : string_with_char_limit256) () =
  ({
     description = description_;
     rule_identifier = rule_identifier_;
     input_parameters = input_parameters_;
     maximum_execution_frequency = maximum_execution_frequency_;
     resource_types_scope = resource_types_scope_;
     resource_id_scope = resource_id_scope_;
     tag_key_scope = tag_key_scope_;
     tag_value_scope = tag_value_scope_;
   }
    : organization_managed_rule_metadata)

let make_organization_config_rule
    ?organization_managed_rule_metadata:
      (organization_managed_rule_metadata_ : organization_managed_rule_metadata option)
    ?organization_custom_rule_metadata:
      (organization_custom_rule_metadata_ : organization_custom_rule_metadata option)
    ?excluded_accounts:(excluded_accounts_ : excluded_accounts option)
    ?last_update_time:(last_update_time_ : date option)
    ?organization_custom_policy_rule_metadata:
      (organization_custom_policy_rule_metadata_ :
         organization_custom_policy_rule_metadata_no_policy option)
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    ~organization_config_rule_arn:(organization_config_rule_arn_ : string_with_char_limit256) () =
  ({
     organization_config_rule_name = organization_config_rule_name_;
     organization_config_rule_arn = organization_config_rule_arn_;
     organization_managed_rule_metadata = organization_managed_rule_metadata_;
     organization_custom_rule_metadata = organization_custom_rule_metadata_;
     excluded_accounts = excluded_accounts_;
     last_update_time = last_update_time_;
     organization_custom_policy_rule_metadata = organization_custom_policy_rule_metadata_;
   }
    : organization_config_rule)

let make_describe_organization_config_rules_response
    ?organization_config_rules:(organization_config_rules_ : organization_config_rules option)
    ?next_token:(next_token_ : string_ option) () =
  ({ organization_config_rules = organization_config_rules_; next_token = next_token_ }
    : describe_organization_config_rules_response)

let make_describe_organization_config_rules_request
    ?organization_config_rule_names:
      (organization_config_rule_names_ : organization_config_rule_names option)
    ?limit:(limit_ : cosmos_page_limit option) ?next_token:(next_token_ : string_ option) () =
  ({
     organization_config_rule_names = organization_config_rule_names_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_organization_config_rules_request)

let make_organization_conformance_pack_status ?error_code:(error_code_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?last_update_time:(last_update_time_ : date option)
    ~organization_conformance_pack_name:
      (organization_conformance_pack_name_ : organization_conformance_pack_name)
    ~status:(status_ : organization_resource_status) () =
  ({
     organization_conformance_pack_name = organization_conformance_pack_name_;
     status = status_;
     error_code = error_code_;
     error_message = error_message_;
     last_update_time = last_update_time_;
   }
    : organization_conformance_pack_status)

let make_describe_organization_conformance_pack_statuses_response
    ?organization_conformance_pack_statuses:
      (organization_conformance_pack_statuses_ : organization_conformance_pack_statuses option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     organization_conformance_pack_statuses = organization_conformance_pack_statuses_;
     next_token = next_token_;
   }
    : describe_organization_conformance_pack_statuses_response)

let make_describe_organization_conformance_pack_statuses_request
    ?organization_conformance_pack_names:
      (organization_conformance_pack_names_ : organization_conformance_pack_names option)
    ?limit:(limit_ : cosmos_page_limit option) ?next_token:(next_token_ : string_ option) () =
  ({
     organization_conformance_pack_names = organization_conformance_pack_names_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_organization_conformance_pack_statuses_request)

let make_organization_conformance_pack
    ?delivery_s3_bucket:(delivery_s3_bucket_ : delivery_s3_bucket option)
    ?delivery_s3_key_prefix:(delivery_s3_key_prefix_ : delivery_s3_key_prefix option)
    ?conformance_pack_input_parameters:
      (conformance_pack_input_parameters_ : conformance_pack_input_parameters option)
    ?excluded_accounts:(excluded_accounts_ : excluded_accounts option)
    ~organization_conformance_pack_name:
      (organization_conformance_pack_name_ : organization_conformance_pack_name)
    ~organization_conformance_pack_arn:
      (organization_conformance_pack_arn_ : string_with_char_limit256)
    ~last_update_time:(last_update_time_ : date) () =
  ({
     organization_conformance_pack_name = organization_conformance_pack_name_;
     organization_conformance_pack_arn = organization_conformance_pack_arn_;
     delivery_s3_bucket = delivery_s3_bucket_;
     delivery_s3_key_prefix = delivery_s3_key_prefix_;
     conformance_pack_input_parameters = conformance_pack_input_parameters_;
     excluded_accounts = excluded_accounts_;
     last_update_time = last_update_time_;
   }
    : organization_conformance_pack)

let make_describe_organization_conformance_packs_response
    ?organization_conformance_packs:
      (organization_conformance_packs_ : organization_conformance_packs option)
    ?next_token:(next_token_ : string_ option) () =
  ({ organization_conformance_packs = organization_conformance_packs_; next_token = next_token_ }
    : describe_organization_conformance_packs_response)

let make_describe_organization_conformance_packs_request
    ?organization_conformance_pack_names:
      (organization_conformance_pack_names_ : organization_conformance_pack_names option)
    ?limit:(limit_ : cosmos_page_limit option) ?next_token:(next_token_ : string_ option) () =
  ({
     organization_conformance_pack_names = organization_conformance_pack_names_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_organization_conformance_packs_request)

let make_pending_aggregation_request
    ?requester_account_id:(requester_account_id_ : account_id option)
    ?requester_aws_region:(requester_aws_region_ : aws_region option) () =
  ({ requester_account_id = requester_account_id_; requester_aws_region = requester_aws_region_ }
    : pending_aggregation_request)

let make_describe_pending_aggregation_requests_response
    ?pending_aggregation_requests:
      (pending_aggregation_requests_ : pending_aggregation_request_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ pending_aggregation_requests = pending_aggregation_requests_; next_token = next_token_ }
    : describe_pending_aggregation_requests_response)

let make_describe_pending_aggregation_requests_request
    ?limit:(limit_ : describe_pending_aggregation_requests_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ limit = limit_; next_token = next_token_ } : describe_pending_aggregation_requests_request)

let make_ssm_controls
    ?concurrent_execution_rate_percentage:
      (concurrent_execution_rate_percentage_ : percentage option)
    ?error_percentage:(error_percentage_ : percentage option) () =
  ({
     concurrent_execution_rate_percentage = concurrent_execution_rate_percentage_;
     error_percentage = error_percentage_;
   }
    : ssm_controls)

let make_execution_controls ?ssm_controls:(ssm_controls_ : ssm_controls option) () =
  ({ ssm_controls = ssm_controls_ } : execution_controls)

let make_static_value ~values:(values_ : static_parameter_values) () =
  ({ values = values_ } : static_value)

let make_resource_value ~value:(value_ : resource_value_type) () =
  ({ value = value_ } : resource_value)

let make_remediation_parameter_value ?resource_value:(resource_value_ : resource_value option)
    ?static_value:(static_value_ : static_value option) () =
  ({ resource_value = resource_value_; static_value = static_value_ } : remediation_parameter_value)

let make_remediation_configuration ?target_version:(target_version_ : string_ option)
    ?parameters:(parameters_ : remediation_parameters option)
    ?resource_type:(resource_type_ : string_ option) ?automatic:(automatic_ : boolean_ option)
    ?execution_controls:(execution_controls_ : execution_controls option)
    ?maximum_automatic_attempts:(maximum_automatic_attempts_ : auto_remediation_attempts option)
    ?retry_attempt_seconds:(retry_attempt_seconds_ : auto_remediation_attempt_seconds option)
    ?arn:(arn_ : string_with_char_limit1024 option)
    ?created_by_service:(created_by_service_ : string_with_char_limit1024 option)
    ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~target_type:(target_type_ : remediation_target_type)
    ~target_id:(target_id_ : string_with_char_limit256) () =
  ({
     config_rule_name = config_rule_name_;
     target_type = target_type_;
     target_id = target_id_;
     target_version = target_version_;
     parameters = parameters_;
     resource_type = resource_type_;
     automatic = automatic_;
     execution_controls = execution_controls_;
     maximum_automatic_attempts = maximum_automatic_attempts_;
     retry_attempt_seconds = retry_attempt_seconds_;
     arn = arn_;
     created_by_service = created_by_service_;
   }
    : remediation_configuration)

let make_describe_remediation_configurations_response
    ?remediation_configurations:(remediation_configurations_ : remediation_configurations option) ()
    =
  ({ remediation_configurations = remediation_configurations_ }
    : describe_remediation_configurations_response)

let make_describe_remediation_configurations_request
    ~config_rule_names:(config_rule_names_ : config_rule_names) () =
  ({ config_rule_names = config_rule_names_ } : describe_remediation_configurations_request)

let make_remediation_exception ?message:(message_ : string_with_char_limit1024 option)
    ?expiration_time:(expiration_time_ : date option)
    ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~resource_type:(resource_type_ : string_with_char_limit256)
    ~resource_id:(resource_id_ : string_with_char_limit1024) () =
  ({
     config_rule_name = config_rule_name_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     message = message_;
     expiration_time = expiration_time_;
   }
    : remediation_exception)

let make_describe_remediation_exceptions_response
    ?remediation_exceptions:(remediation_exceptions_ : remediation_exceptions option)
    ?next_token:(next_token_ : string_ option) () =
  ({ remediation_exceptions = remediation_exceptions_; next_token = next_token_ }
    : describe_remediation_exceptions_response)

let make_describe_remediation_exceptions_request
    ?resource_keys:(resource_keys_ : remediation_exception_resource_keys option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : string_ option)
    ~config_rule_name:(config_rule_name_ : config_rule_name) () =
  ({
     config_rule_name = config_rule_name_;
     resource_keys = resource_keys_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_remediation_exceptions_request)

let make_remediation_execution_step ?name:(name_ : string_ option)
    ?state:(state_ : remediation_execution_step_state option)
    ?error_message:(error_message_ : string_ option) ?start_time:(start_time_ : date option)
    ?stop_time:(stop_time_ : date option) () =
  ({
     name = name_;
     state = state_;
     error_message = error_message_;
     start_time = start_time_;
     stop_time = stop_time_;
   }
    : remediation_execution_step)

let make_remediation_execution_status ?resource_key:(resource_key_ : resource_key option)
    ?state:(state_ : remediation_execution_state option)
    ?step_details:(step_details_ : remediation_execution_steps option)
    ?invocation_time:(invocation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option) () =
  ({
     resource_key = resource_key_;
     state = state_;
     step_details = step_details_;
     invocation_time = invocation_time_;
     last_updated_time = last_updated_time_;
   }
    : remediation_execution_status)

let make_describe_remediation_execution_status_response
    ?remediation_execution_statuses:
      (remediation_execution_statuses_ : remediation_execution_statuses option)
    ?next_token:(next_token_ : string_ option) () =
  ({ remediation_execution_statuses = remediation_execution_statuses_; next_token = next_token_ }
    : describe_remediation_execution_status_response)

let make_describe_remediation_execution_status_request
    ?resource_keys:(resource_keys_ : resource_keys option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : string_ option)
    ~config_rule_name:(config_rule_name_ : config_rule_name) () =
  ({
     config_rule_name = config_rule_name_;
     resource_keys = resource_keys_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_remediation_execution_status_request)

let make_retention_configuration ~name:(name_ : retention_configuration_name)
    ~retention_period_in_days:(retention_period_in_days_ : retention_period_in_days) () =
  ({ name = name_; retention_period_in_days = retention_period_in_days_ } : retention_configuration)

let make_describe_retention_configurations_response
    ?retention_configurations:(retention_configurations_ : retention_configuration_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ retention_configurations = retention_configurations_; next_token = next_token_ }
    : describe_retention_configurations_response)

let make_describe_retention_configurations_request
    ?retention_configuration_names:
      (retention_configuration_names_ : retention_configuration_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ retention_configuration_names = retention_configuration_names_; next_token = next_token_ }
    : describe_retention_configurations_request)

let make_disassociate_resource_types_response
    ~configuration_recorder:(configuration_recorder_ : configuration_recorder) () =
  ({ configuration_recorder = configuration_recorder_ } : disassociate_resource_types_response)

let make_disassociate_resource_types_request
    ~configuration_recorder_arn:(configuration_recorder_arn_ : amazon_resource_name)
    ~resource_types:(resource_types_ : resource_type_list) () =
  ({ configuration_recorder_arn = configuration_recorder_arn_; resource_types = resource_types_ }
    : disassociate_resource_types_request)

let make_evaluation ?annotation:(annotation_ : string_with_char_limit256 option)
    ~compliance_resource_type:(compliance_resource_type_ : string_with_char_limit256)
    ~compliance_resource_id:(compliance_resource_id_ : base_resource_id)
    ~compliance_type:(compliance_type_ : compliance_type)
    ~ordering_timestamp:(ordering_timestamp_ : ordering_timestamp) () =
  ({
     compliance_resource_type = compliance_resource_type_;
     compliance_resource_id = compliance_resource_id_;
     compliance_type = compliance_type_;
     annotation = annotation_;
     ordering_timestamp = ordering_timestamp_;
   }
    : evaluation)

let make_evaluation_context
    ?evaluation_context_identifier:
      (evaluation_context_identifier_ : evaluation_context_identifier option) () =
  ({ evaluation_context_identifier = evaluation_context_identifier_ } : evaluation_context)

let make_evaluation_status ?failure_reason:(failure_reason_ : string_with_char_limit1024 option)
    ~status:(status_ : resource_evaluation_status) () =
  ({ status = status_; failure_reason = failure_reason_ } : evaluation_status)

let make_external_evaluation ?annotation:(annotation_ : string_with_char_limit256 option)
    ~compliance_resource_type:(compliance_resource_type_ : string_with_char_limit256)
    ~compliance_resource_id:(compliance_resource_id_ : base_resource_id)
    ~compliance_type:(compliance_type_ : compliance_type)
    ~ordering_timestamp:(ordering_timestamp_ : ordering_timestamp) () =
  ({
     compliance_resource_type = compliance_resource_type_;
     compliance_resource_id = compliance_resource_id_;
     compliance_type = compliance_type_;
     annotation = annotation_;
     ordering_timestamp = ordering_timestamp_;
   }
    : external_evaluation)

let make_failed_remediation_batch ?failure_message:(failure_message_ : string_ option)
    ?failed_items:(failed_items_ : remediation_configurations option) () =
  ({ failure_message = failure_message_; failed_items = failed_items_ } : failed_remediation_batch)

let make_failed_remediation_exception_batch ?failure_message:(failure_message_ : string_ option)
    ?failed_items:(failed_items_ : remediation_exceptions option) () =
  ({ failure_message = failure_message_; failed_items = failed_items_ }
    : failed_remediation_exception_batch)

let make_field_info ?name:(name_ : field_name option) () = ({ name = name_ } : field_info)

let make_get_aggregate_compliance_details_by_config_rule_response
    ?aggregate_evaluation_results:
      (aggregate_evaluation_results_ : aggregate_evaluation_result_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ aggregate_evaluation_results = aggregate_evaluation_results_; next_token = next_token_ }
    : get_aggregate_compliance_details_by_config_rule_response)

let make_get_aggregate_compliance_details_by_config_rule_request
    ?compliance_type:(compliance_type_ : compliance_type option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    ~config_rule_name:(config_rule_name_ : config_rule_name) ~account_id:(account_id_ : account_id)
    ~aws_region:(aws_region_ : aws_region) () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     config_rule_name = config_rule_name_;
     account_id = account_id_;
     aws_region = aws_region_;
     compliance_type = compliance_type_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_aggregate_compliance_details_by_config_rule_request)

let make_get_aggregate_config_rule_compliance_summary_response
    ?group_by_key:(group_by_key_ : string_with_char_limit256 option)
    ?aggregate_compliance_counts:
      (aggregate_compliance_counts_ : aggregate_compliance_count_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     group_by_key = group_by_key_;
     aggregate_compliance_counts = aggregate_compliance_counts_;
     next_token = next_token_;
   }
    : get_aggregate_config_rule_compliance_summary_response)

let make_get_aggregate_config_rule_compliance_summary_request
    ?filters:(filters_ : config_rule_compliance_summary_filters option)
    ?group_by_key:(group_by_key_ : config_rule_compliance_summary_group_key option)
    ?limit:(limit_ : group_by_api_limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     filters = filters_;
     group_by_key = group_by_key_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_aggregate_config_rule_compliance_summary_request)

let make_get_aggregate_conformance_pack_compliance_summary_response
    ?aggregate_conformance_pack_compliance_summaries:
      (aggregate_conformance_pack_compliance_summaries_ :
         aggregate_conformance_pack_compliance_summary_list option)
    ?group_by_key:(group_by_key_ : string_with_char_limit256 option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     aggregate_conformance_pack_compliance_summaries =
       aggregate_conformance_pack_compliance_summaries_;
     group_by_key = group_by_key_;
     next_token = next_token_;
   }
    : get_aggregate_conformance_pack_compliance_summary_response)

let make_get_aggregate_conformance_pack_compliance_summary_request
    ?filters:(filters_ : aggregate_conformance_pack_compliance_summary_filters option)
    ?group_by_key:(group_by_key_ : aggregate_conformance_pack_compliance_summary_group_key option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     filters = filters_;
     group_by_key = group_by_key_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_aggregate_conformance_pack_compliance_summary_request)

let make_grouped_resource_count ~group_name:(group_name_ : string_with_char_limit256)
    ~resource_count:(resource_count_ : long) () =
  ({ group_name = group_name_; resource_count = resource_count_ } : grouped_resource_count)

let make_get_aggregate_discovered_resource_counts_response
    ?group_by_key:(group_by_key_ : string_with_char_limit256 option)
    ?grouped_resource_counts:(grouped_resource_counts_ : grouped_resource_count_list option)
    ?next_token:(next_token_ : next_token option)
    ~total_discovered_resources:(total_discovered_resources_ : long) () =
  ({
     total_discovered_resources = total_discovered_resources_;
     group_by_key = group_by_key_;
     grouped_resource_counts = grouped_resource_counts_;
     next_token = next_token_;
   }
    : get_aggregate_discovered_resource_counts_response)

let make_resource_count_filters ?resource_type:(resource_type_ : resource_type option)
    ?account_id:(account_id_ : account_id option) ?region:(region_ : aws_region option) () =
  ({ resource_type = resource_type_; account_id = account_id_; region = region_ }
    : resource_count_filters)

let make_get_aggregate_discovered_resource_counts_request
    ?filters:(filters_ : resource_count_filters option)
    ?group_by_key:(group_by_key_ : resource_count_group_key option)
    ?limit:(limit_ : group_by_api_limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     filters = filters_;
     group_by_key = group_by_key_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_aggregate_discovered_resource_counts_request)

let make_get_aggregate_resource_config_response
    ?configuration_item:(configuration_item_ : configuration_item option) () =
  ({ configuration_item = configuration_item_ } : get_aggregate_resource_config_response)

let make_get_aggregate_resource_config_request
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    ~resource_identifier:(resource_identifier_ : aggregate_resource_identifier) () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     resource_identifier = resource_identifier_;
   }
    : get_aggregate_resource_config_request)

let make_get_compliance_details_by_config_rule_response
    ?evaluation_results:(evaluation_results_ : evaluation_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ evaluation_results = evaluation_results_; next_token = next_token_ }
    : get_compliance_details_by_config_rule_response)

let make_get_compliance_details_by_config_rule_request
    ?compliance_types:(compliance_types_ : compliance_types option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ~config_rule_name:(config_rule_name_ : string_with_char_limit64) () =
  ({
     config_rule_name = config_rule_name_;
     compliance_types = compliance_types_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_compliance_details_by_config_rule_request)

let make_get_compliance_details_by_resource_response
    ?evaluation_results:(evaluation_results_ : evaluation_results option)
    ?next_token:(next_token_ : string_ option) () =
  ({ evaluation_results = evaluation_results_; next_token = next_token_ }
    : get_compliance_details_by_resource_response)

let make_get_compliance_details_by_resource_request
    ?resource_type:(resource_type_ : string_with_char_limit256 option)
    ?resource_id:(resource_id_ : base_resource_id option)
    ?compliance_types:(compliance_types_ : compliance_types option)
    ?next_token:(next_token_ : string_ option)
    ?resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id option) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     compliance_types = compliance_types_;
     next_token = next_token_;
     resource_evaluation_id = resource_evaluation_id_;
   }
    : get_compliance_details_by_resource_request)

let make_get_compliance_summary_by_config_rule_response
    ?compliance_summary:(compliance_summary_ : compliance_summary option) () =
  ({ compliance_summary = compliance_summary_ } : get_compliance_summary_by_config_rule_response)

let make_get_compliance_summary_by_resource_type_response
    ?compliance_summaries_by_resource_type:
      (compliance_summaries_by_resource_type_ : compliance_summaries_by_resource_type option) () =
  ({ compliance_summaries_by_resource_type = compliance_summaries_by_resource_type_ }
    : get_compliance_summary_by_resource_type_response)

let make_get_compliance_summary_by_resource_type_request
    ?resource_types:(resource_types_ : resource_types option) () =
  ({ resource_types = resource_types_ } : get_compliance_summary_by_resource_type_request)

let make_get_conformance_pack_compliance_details_response
    ?conformance_pack_rule_evaluation_results:
      (conformance_pack_rule_evaluation_results_ :
         conformance_pack_rule_evaluation_results_list option)
    ?next_token:(next_token_ : next_token option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     conformance_pack_rule_evaluation_results = conformance_pack_rule_evaluation_results_;
     next_token = next_token_;
   }
    : get_conformance_pack_compliance_details_response)

let make_get_conformance_pack_compliance_details_request
    ?filters:(filters_ : conformance_pack_evaluation_filters option)
    ?limit:(limit_ : get_conformance_pack_compliance_details_limit option)
    ?next_token:(next_token_ : next_token option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_conformance_pack_compliance_details_request)

let make_get_conformance_pack_compliance_summary_response
    ?conformance_pack_compliance_summary_list:
      (conformance_pack_compliance_summary_list_ : conformance_pack_compliance_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     conformance_pack_compliance_summary_list = conformance_pack_compliance_summary_list_;
     next_token = next_token_;
   }
    : get_conformance_pack_compliance_summary_response)

let make_get_conformance_pack_compliance_summary_request ?limit:(limit_ : page_size_limit option)
    ?next_token:(next_token_ : next_token option)
    ~conformance_pack_names:(conformance_pack_names_ : conformance_pack_names_to_summarize_list) ()
    =
  ({ conformance_pack_names = conformance_pack_names_; limit = limit_; next_token = next_token_ }
    : get_conformance_pack_compliance_summary_request)

let make_get_custom_rule_policy_response ?policy_text:(policy_text_ : policy_text option) () =
  ({ policy_text = policy_text_ } : get_custom_rule_policy_response)

let make_get_custom_rule_policy_request
    ?config_rule_name:(config_rule_name_ : config_rule_name option) () =
  ({ config_rule_name = config_rule_name_ } : get_custom_rule_policy_request)

let make_resource_count ?resource_type:(resource_type_ : resource_type option)
    ?count:(count_ : long option) () =
  ({ resource_type = resource_type_; count = count_ } : resource_count)

let make_get_discovered_resource_counts_response
    ?total_discovered_resources:(total_discovered_resources_ : long option)
    ?resource_counts:(resource_counts_ : resource_counts option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     total_discovered_resources = total_discovered_resources_;
     resource_counts = resource_counts_;
     next_token = next_token_;
   }
    : get_discovered_resource_counts_response)

let make_get_discovered_resource_counts_request
    ?resource_types:(resource_types_ : resource_types option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_types = resource_types_; limit = limit_; next_token = next_token_ }
    : get_discovered_resource_counts_request)

let make_member_account_status ?error_code:(error_code_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?last_update_time:(last_update_time_ : date option) ~account_id:(account_id_ : account_id)
    ~config_rule_name:(config_rule_name_ : string_with_char_limit64)
    ~member_account_rule_status:(member_account_rule_status_ : member_account_rule_status) () =
  ({
     account_id = account_id_;
     config_rule_name = config_rule_name_;
     member_account_rule_status = member_account_rule_status_;
     error_code = error_code_;
     error_message = error_message_;
     last_update_time = last_update_time_;
   }
    : member_account_status)

let make_get_organization_config_rule_detailed_status_response
    ?organization_config_rule_detailed_status:
      (organization_config_rule_detailed_status_ : organization_config_rule_detailed_status option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     organization_config_rule_detailed_status = organization_config_rule_detailed_status_;
     next_token = next_token_;
   }
    : get_organization_config_rule_detailed_status_response)

let make_status_detail_filters ?account_id:(account_id_ : account_id option)
    ?member_account_rule_status:(member_account_rule_status_ : member_account_rule_status option) ()
    =
  ({ account_id = account_id_; member_account_rule_status = member_account_rule_status_ }
    : status_detail_filters)

let make_get_organization_config_rule_detailed_status_request
    ?filters:(filters_ : status_detail_filters option) ?limit:(limit_ : cosmos_page_limit option)
    ?next_token:(next_token_ : string_ option)
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    () =
  ({
     organization_config_rule_name = organization_config_rule_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_organization_config_rule_detailed_status_request)

let make_organization_conformance_pack_detailed_status ?error_code:(error_code_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?last_update_time:(last_update_time_ : date option) ~account_id:(account_id_ : account_id)
    ~conformance_pack_name:(conformance_pack_name_ : string_with_char_limit256)
    ~status:(status_ : organization_resource_detailed_status) () =
  ({
     account_id = account_id_;
     conformance_pack_name = conformance_pack_name_;
     status = status_;
     error_code = error_code_;
     error_message = error_message_;
     last_update_time = last_update_time_;
   }
    : organization_conformance_pack_detailed_status)

let make_get_organization_conformance_pack_detailed_status_response
    ?organization_conformance_pack_detailed_statuses:
      (organization_conformance_pack_detailed_statuses_ :
         organization_conformance_pack_detailed_statuses option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     organization_conformance_pack_detailed_statuses =
       organization_conformance_pack_detailed_statuses_;
     next_token = next_token_;
   }
    : get_organization_conformance_pack_detailed_status_response)

let make_organization_resource_detailed_status_filters ?account_id:(account_id_ : account_id option)
    ?status:(status_ : organization_resource_detailed_status option) () =
  ({ account_id = account_id_; status = status_ } : organization_resource_detailed_status_filters)

let make_get_organization_conformance_pack_detailed_status_request
    ?filters:(filters_ : organization_resource_detailed_status_filters option)
    ?limit:(limit_ : cosmos_page_limit option) ?next_token:(next_token_ : string_ option)
    ~organization_conformance_pack_name:
      (organization_conformance_pack_name_ : organization_conformance_pack_name) () =
  ({
     organization_conformance_pack_name = organization_conformance_pack_name_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_organization_conformance_pack_detailed_status_request)

let make_get_organization_custom_rule_policy_response
    ?policy_text:(policy_text_ : policy_text option) () =
  ({ policy_text = policy_text_ } : get_organization_custom_rule_policy_response)

let make_get_organization_custom_rule_policy_request
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    () =
  ({ organization_config_rule_name = organization_config_rule_name_ }
    : get_organization_custom_rule_policy_request)

let make_get_resource_config_history_response
    ?configuration_items:(configuration_items_ : configuration_item_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ configuration_items = configuration_items_; next_token = next_token_ }
    : get_resource_config_history_response)

let make_get_resource_config_history_request ?later_time:(later_time_ : later_time option)
    ?earlier_time:(earlier_time_ : earlier_time option)
    ?chronological_order:(chronological_order_ : chronological_order option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : next_token option)
    ~resource_type:(resource_type_ : resource_type) ~resource_id:(resource_id_ : resource_id) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     later_time = later_time_;
     earlier_time = earlier_time_;
     chronological_order = chronological_order_;
     limit = limit_;
     next_token = next_token_;
   }
    : get_resource_config_history_request)

let make_resource_details
    ?resource_configuration_schema_type:
      (resource_configuration_schema_type_ : resource_configuration_schema_type option)
    ~resource_id:(resource_id_ : base_resource_id)
    ~resource_type:(resource_type_ : string_with_char_limit256)
    ~resource_configuration:(resource_configuration_ : resource_configuration) () =
  ({
     resource_id = resource_id_;
     resource_type = resource_type_;
     resource_configuration = resource_configuration_;
     resource_configuration_schema_type = resource_configuration_schema_type_;
   }
    : resource_details)

let make_get_resource_evaluation_summary_response
    ?resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id option)
    ?evaluation_mode:(evaluation_mode_ : evaluation_mode option)
    ?evaluation_status:(evaluation_status_ : evaluation_status option)
    ?evaluation_start_timestamp:(evaluation_start_timestamp_ : date option)
    ?compliance:(compliance_ : compliance_type option)
    ?evaluation_context:(evaluation_context_ : evaluation_context option)
    ?resource_details:(resource_details_ : resource_details option) () =
  ({
     resource_evaluation_id = resource_evaluation_id_;
     evaluation_mode = evaluation_mode_;
     evaluation_status = evaluation_status_;
     evaluation_start_timestamp = evaluation_start_timestamp_;
     compliance = compliance_;
     evaluation_context = evaluation_context_;
     resource_details = resource_details_;
   }
    : get_resource_evaluation_summary_response)

let make_get_resource_evaluation_summary_request
    ~resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id) () =
  ({ resource_evaluation_id = resource_evaluation_id_ } : get_resource_evaluation_summary_request)

let make_stored_query ?query_id:(query_id_ : query_id option)
    ?query_arn:(query_arn_ : query_arn option)
    ?description:(description_ : query_description option)
    ?expression:(expression_ : query_expression option) ~query_name:(query_name_ : query_name) () =
  ({
     query_id = query_id_;
     query_arn = query_arn_;
     query_name = query_name_;
     description = description_;
     expression = expression_;
   }
    : stored_query)

let make_get_stored_query_response ?stored_query:(stored_query_ : stored_query option) () =
  ({ stored_query = stored_query_ } : get_stored_query_response)

let make_get_stored_query_request ~query_name:(query_name_ : query_name) () =
  ({ query_name = query_name_ } : get_stored_query_request)

let make_list_aggregate_discovered_resources_response
    ?resource_identifiers:(resource_identifiers_ : discovered_resource_identifier_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_identifiers = resource_identifiers_; next_token = next_token_ }
    : list_aggregate_discovered_resources_response)

let make_resource_filters ?account_id:(account_id_ : account_id option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_name:(resource_name_ : resource_name option) ?region:(region_ : aws_region option) ()
    =
  ({
     account_id = account_id_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     region = region_;
   }
    : resource_filters)

let make_list_aggregate_discovered_resources_request ?filters:(filters_ : resource_filters option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : next_token option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     resource_type = resource_type_;
     filters = filters_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_aggregate_discovered_resources_request)

let make_list_configuration_recorders_response ?next_token:(next_token_ : next_token option)
    ~configuration_recorder_summaries:
      (configuration_recorder_summaries_ : configuration_recorder_summaries) () =
  ({
     configuration_recorder_summaries = configuration_recorder_summaries_;
     next_token = next_token_;
   }
    : list_configuration_recorders_response)

let make_list_configuration_recorders_request
    ?filters:(filters_ : configuration_recorder_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_configuration_recorders_request)

let make_list_conformance_pack_compliance_scores_response
    ?next_token:(next_token_ : next_token option)
    ~conformance_pack_compliance_scores:
      (conformance_pack_compliance_scores_ : conformance_pack_compliance_scores) () =
  ({
     next_token = next_token_;
     conformance_pack_compliance_scores = conformance_pack_compliance_scores_;
   }
    : list_conformance_pack_compliance_scores_response)

let make_list_conformance_pack_compliance_scores_request
    ?filters:(filters_ : conformance_pack_compliance_scores_filters option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by option)
    ?limit:(limit_ : page_size_limit option) ?next_token:(next_token_ : next_token option) () =
  ({
     filters = filters_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_conformance_pack_compliance_scores_request)

let make_resource_identifier ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_name:(resource_name_ : resource_name option)
    ?resource_deletion_time:(resource_deletion_time_ : resource_deletion_time option) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     resource_deletion_time = resource_deletion_time_;
   }
    : resource_identifier)

let make_list_discovered_resources_response
    ?resource_identifiers:(resource_identifiers_ : resource_identifier_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_identifiers = resource_identifiers_; next_token = next_token_ }
    : list_discovered_resources_response)

let make_list_discovered_resources_request ?resource_ids:(resource_ids_ : resource_id_list option)
    ?resource_name:(resource_name_ : resource_name option) ?limit:(limit_ : limit option)
    ?include_deleted_resources:(include_deleted_resources_ : boolean_ option)
    ?next_token:(next_token_ : next_token option) ~resource_type:(resource_type_ : resource_type) ()
    =
  ({
     resource_type = resource_type_;
     resource_ids = resource_ids_;
     resource_name = resource_name_;
     limit = limit_;
     include_deleted_resources = include_deleted_resources_;
     next_token = next_token_;
   }
    : list_discovered_resources_request)

let make_resource_evaluation
    ?resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id option)
    ?evaluation_mode:(evaluation_mode_ : evaluation_mode option)
    ?evaluation_start_timestamp:(evaluation_start_timestamp_ : date option) () =
  ({
     resource_evaluation_id = resource_evaluation_id_;
     evaluation_mode = evaluation_mode_;
     evaluation_start_timestamp = evaluation_start_timestamp_;
   }
    : resource_evaluation)

let make_list_resource_evaluations_response
    ?resource_evaluations:(resource_evaluations_ : resource_evaluations option)
    ?next_token:(next_token_ : string_ option) () =
  ({ resource_evaluations = resource_evaluations_; next_token = next_token_ }
    : list_resource_evaluations_response)

let make_time_window ?start_time:(start_time_ : date option) ?end_time:(end_time_ : date option) ()
    =
  ({ start_time = start_time_; end_time = end_time_ } : time_window)

let make_resource_evaluation_filters ?evaluation_mode:(evaluation_mode_ : evaluation_mode option)
    ?time_window:(time_window_ : time_window option)
    ?evaluation_context_identifier:
      (evaluation_context_identifier_ : evaluation_context_identifier option) () =
  ({
     evaluation_mode = evaluation_mode_;
     time_window = time_window_;
     evaluation_context_identifier = evaluation_context_identifier_;
   }
    : resource_evaluation_filters)

let make_list_resource_evaluations_request ?filters:(filters_ : resource_evaluation_filters option)
    ?limit:(limit_ : list_resource_evaluations_page_item_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ filters = filters_; limit = limit_; next_token = next_token_ }
    : list_resource_evaluations_request)

let make_stored_query_metadata ?description:(description_ : query_description option)
    ~query_id:(query_id_ : query_id) ~query_arn:(query_arn_ : query_arn)
    ~query_name:(query_name_ : query_name) () =
  ({
     query_id = query_id_;
     query_arn = query_arn_;
     query_name = query_name_;
     description = description_;
   }
    : stored_query_metadata)

let make_list_stored_queries_response
    ?stored_query_metadata:(stored_query_metadata_ : stored_query_metadata_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ stored_query_metadata = stored_query_metadata_; next_token = next_token_ }
    : list_stored_queries_response)

let make_list_stored_queries_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : limit option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_stored_queries_request)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_; limit = limit_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_organization_custom_policy_rule_metadata
    ?description:(description_ : string_with_char_limit256_min0 option)
    ?organization_config_rule_trigger_types:
      (organization_config_rule_trigger_types_ :
         organization_config_rule_trigger_type_no_s_ns option)
    ?input_parameters:(input_parameters_ : string_with_char_limit1024 option)
    ?maximum_execution_frequency:(maximum_execution_frequency_ : maximum_execution_frequency option)
    ?resource_types_scope:(resource_types_scope_ : resource_types_scope option)
    ?resource_id_scope:(resource_id_scope_ : string_with_char_limit768 option)
    ?tag_key_scope:(tag_key_scope_ : string_with_char_limit128 option)
    ?tag_value_scope:(tag_value_scope_ : string_with_char_limit256 option)
    ?debug_log_delivery_accounts:(debug_log_delivery_accounts_ : debug_log_delivery_accounts option)
    ~policy_runtime:(policy_runtime_ : policy_runtime) ~policy_text:(policy_text_ : policy_text) ()
    =
  ({
     description = description_;
     organization_config_rule_trigger_types = organization_config_rule_trigger_types_;
     input_parameters = input_parameters_;
     maximum_execution_frequency = maximum_execution_frequency_;
     resource_types_scope = resource_types_scope_;
     resource_id_scope = resource_id_scope_;
     tag_key_scope = tag_key_scope_;
     tag_value_scope = tag_value_scope_;
     policy_runtime = policy_runtime_;
     policy_text = policy_text_;
     debug_log_delivery_accounts = debug_log_delivery_accounts_;
   }
    : organization_custom_policy_rule_metadata)

let make_put_aggregation_authorization_response
    ?aggregation_authorization:(aggregation_authorization_ : aggregation_authorization option) () =
  ({ aggregation_authorization = aggregation_authorization_ }
    : put_aggregation_authorization_response)

let make_put_aggregation_authorization_request ?tags:(tags_ : tags_list option)
    ~authorized_account_id:(authorized_account_id_ : account_id)
    ~authorized_aws_region:(authorized_aws_region_ : aws_region) () =
  ({
     authorized_account_id = authorized_account_id_;
     authorized_aws_region = authorized_aws_region_;
     tags = tags_;
   }
    : put_aggregation_authorization_request)

let make_put_config_rule_request ?tags:(tags_ : tags_list option)
    ~config_rule:(config_rule_ : config_rule) () =
  ({ config_rule = config_rule_; tags = tags_ } : put_config_rule_request)

let make_put_configuration_aggregator_response
    ?configuration_aggregator:(configuration_aggregator_ : configuration_aggregator option) () =
  ({ configuration_aggregator = configuration_aggregator_ } : put_configuration_aggregator_response)

let make_put_configuration_aggregator_request
    ?account_aggregation_sources:
      (account_aggregation_sources_ : account_aggregation_source_list option)
    ?organization_aggregation_source:
      (organization_aggregation_source_ : organization_aggregation_source option)
    ?tags:(tags_ : tags_list option)
    ?aggregator_filters:(aggregator_filters_ : aggregator_filters option)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     configuration_aggregator_name = configuration_aggregator_name_;
     account_aggregation_sources = account_aggregation_sources_;
     organization_aggregation_source = organization_aggregation_source_;
     tags = tags_;
     aggregator_filters = aggregator_filters_;
   }
    : put_configuration_aggregator_request)

let make_put_configuration_recorder_request ?tags:(tags_ : tags_list option)
    ~configuration_recorder:(configuration_recorder_ : configuration_recorder) () =
  ({ configuration_recorder = configuration_recorder_; tags = tags_ }
    : put_configuration_recorder_request)

let make_put_conformance_pack_response
    ?conformance_pack_arn:(conformance_pack_arn_ : conformance_pack_arn option) () =
  ({ conformance_pack_arn = conformance_pack_arn_ } : put_conformance_pack_response)

let make_put_conformance_pack_request ?template_s3_uri:(template_s3_uri_ : template_s3_uri option)
    ?template_body:(template_body_ : template_body option)
    ?delivery_s3_bucket:(delivery_s3_bucket_ : delivery_s3_bucket option)
    ?delivery_s3_key_prefix:(delivery_s3_key_prefix_ : delivery_s3_key_prefix option)
    ?conformance_pack_input_parameters:
      (conformance_pack_input_parameters_ : conformance_pack_input_parameters option)
    ?template_ssm_document_details:
      (template_ssm_document_details_ : template_ssm_document_details option)
    ?tags:(tags_ : tags_list option)
    ~conformance_pack_name:(conformance_pack_name_ : conformance_pack_name) () =
  ({
     conformance_pack_name = conformance_pack_name_;
     template_s3_uri = template_s3_uri_;
     template_body = template_body_;
     delivery_s3_bucket = delivery_s3_bucket_;
     delivery_s3_key_prefix = delivery_s3_key_prefix_;
     conformance_pack_input_parameters = conformance_pack_input_parameters_;
     template_ssm_document_details = template_ssm_document_details_;
     tags = tags_;
   }
    : put_conformance_pack_request)

let make_put_delivery_channel_request ~delivery_channel:(delivery_channel_ : delivery_channel) () =
  ({ delivery_channel = delivery_channel_ } : put_delivery_channel_request)

let make_put_evaluations_response ?failed_evaluations:(failed_evaluations_ : evaluations option) ()
    =
  ({ failed_evaluations = failed_evaluations_ } : put_evaluations_response)

let make_put_evaluations_request ?evaluations:(evaluations_ : evaluations option)
    ?test_mode:(test_mode_ : boolean_ option) ~result_token:(result_token_ : string_) () =
  ({ evaluations = evaluations_; result_token = result_token_; test_mode = test_mode_ }
    : put_evaluations_request)

let make_put_external_evaluation_response () = (() : unit)

let make_put_external_evaluation_request ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~external_evaluation:(external_evaluation_ : external_evaluation) () =
  ({ config_rule_name = config_rule_name_; external_evaluation = external_evaluation_ }
    : put_external_evaluation_request)

let make_put_organization_config_rule_response
    ?organization_config_rule_arn:(organization_config_rule_arn_ : string_with_char_limit256 option)
    () =
  ({ organization_config_rule_arn = organization_config_rule_arn_ }
    : put_organization_config_rule_response)

let make_put_organization_config_rule_request
    ?organization_managed_rule_metadata:
      (organization_managed_rule_metadata_ : organization_managed_rule_metadata option)
    ?organization_custom_rule_metadata:
      (organization_custom_rule_metadata_ : organization_custom_rule_metadata option)
    ?excluded_accounts:(excluded_accounts_ : excluded_accounts option)
    ?organization_custom_policy_rule_metadata:
      (organization_custom_policy_rule_metadata_ : organization_custom_policy_rule_metadata option)
    ?tags:(tags_ : tags_list option)
    ~organization_config_rule_name:(organization_config_rule_name_ : organization_config_rule_name)
    () =
  ({
     organization_config_rule_name = organization_config_rule_name_;
     organization_managed_rule_metadata = organization_managed_rule_metadata_;
     organization_custom_rule_metadata = organization_custom_rule_metadata_;
     excluded_accounts = excluded_accounts_;
     organization_custom_policy_rule_metadata = organization_custom_policy_rule_metadata_;
     tags = tags_;
   }
    : put_organization_config_rule_request)

let make_put_organization_conformance_pack_response
    ?organization_conformance_pack_arn:
      (organization_conformance_pack_arn_ : string_with_char_limit256 option) () =
  ({ organization_conformance_pack_arn = organization_conformance_pack_arn_ }
    : put_organization_conformance_pack_response)

let make_put_organization_conformance_pack_request
    ?template_s3_uri:(template_s3_uri_ : template_s3_uri option)
    ?template_body:(template_body_ : template_body option)
    ?delivery_s3_bucket:(delivery_s3_bucket_ : delivery_s3_bucket option)
    ?delivery_s3_key_prefix:(delivery_s3_key_prefix_ : delivery_s3_key_prefix option)
    ?conformance_pack_input_parameters:
      (conformance_pack_input_parameters_ : conformance_pack_input_parameters option)
    ?excluded_accounts:(excluded_accounts_ : excluded_accounts option)
    ?tags:(tags_ : tags_list option)
    ~organization_conformance_pack_name:
      (organization_conformance_pack_name_ : organization_conformance_pack_name) () =
  ({
     organization_conformance_pack_name = organization_conformance_pack_name_;
     template_s3_uri = template_s3_uri_;
     template_body = template_body_;
     delivery_s3_bucket = delivery_s3_bucket_;
     delivery_s3_key_prefix = delivery_s3_key_prefix_;
     conformance_pack_input_parameters = conformance_pack_input_parameters_;
     excluded_accounts = excluded_accounts_;
     tags = tags_;
   }
    : put_organization_conformance_pack_request)

let make_put_remediation_configurations_response
    ?failed_batches:(failed_batches_ : failed_remediation_batches option) () =
  ({ failed_batches = failed_batches_ } : put_remediation_configurations_response)

let make_put_remediation_configurations_request
    ~remediation_configurations:(remediation_configurations_ : remediation_configurations) () =
  ({ remediation_configurations = remediation_configurations_ }
    : put_remediation_configurations_request)

let make_put_remediation_exceptions_response
    ?failed_batches:(failed_batches_ : failed_remediation_exception_batches option) () =
  ({ failed_batches = failed_batches_ } : put_remediation_exceptions_response)

let make_put_remediation_exceptions_request ?message:(message_ : string_with_char_limit1024 option)
    ?expiration_time:(expiration_time_ : date option)
    ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~resource_keys:(resource_keys_ : remediation_exception_resource_keys) () =
  ({
     config_rule_name = config_rule_name_;
     resource_keys = resource_keys_;
     message = message_;
     expiration_time = expiration_time_;
   }
    : put_remediation_exceptions_request)

let make_put_resource_config_request ?resource_name:(resource_name_ : resource_name option)
    ?tags:(tags_ : tags option) ~resource_type:(resource_type_ : resource_type_string)
    ~schema_version_id:(schema_version_id_ : schema_version_id)
    ~resource_id:(resource_id_ : resource_id) ~configuration:(configuration_ : configuration) () =
  ({
     resource_type = resource_type_;
     schema_version_id = schema_version_id_;
     resource_id = resource_id_;
     resource_name = resource_name_;
     configuration = configuration_;
     tags = tags_;
   }
    : put_resource_config_request)

let make_put_retention_configuration_response
    ?retention_configuration:(retention_configuration_ : retention_configuration option) () =
  ({ retention_configuration = retention_configuration_ } : put_retention_configuration_response)

let make_put_retention_configuration_request
    ~retention_period_in_days:(retention_period_in_days_ : retention_period_in_days) () =
  ({ retention_period_in_days = retention_period_in_days_ } : put_retention_configuration_request)

let make_put_service_linked_configuration_recorder_response
    ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : recorder_name option) () =
  ({ arn = arn_; name = name_ } : put_service_linked_configuration_recorder_response)

let make_put_service_linked_configuration_recorder_request ?tags:(tags_ : tags_list option)
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_; tags = tags_ }
    : put_service_linked_configuration_recorder_request)

let make_put_stored_query_response ?query_arn:(query_arn_ : query_arn option) () =
  ({ query_arn = query_arn_ } : put_stored_query_response)

let make_put_stored_query_request ?tags:(tags_ : tags_list option)
    ~stored_query:(stored_query_ : stored_query) () =
  ({ stored_query = stored_query_; tags = tags_ } : put_stored_query_request)

let make_query_info ?select_fields:(select_fields_ : field_info_list option) () =
  ({ select_fields = select_fields_ } : query_info)

let make_select_aggregate_resource_config_response ?results:(results_ : results option)
    ?query_info:(query_info_ : query_info option) ?next_token:(next_token_ : next_token option) () =
  ({ results = results_; query_info = query_info_; next_token = next_token_ }
    : select_aggregate_resource_config_response)

let make_select_aggregate_resource_config_request ?limit:(limit_ : limit option)
    ?max_results:(max_results_ : limit option) ?next_token:(next_token_ : next_token option)
    ~expression:(expression_ : expression)
    ~configuration_aggregator_name:(configuration_aggregator_name_ : configuration_aggregator_name)
    () =
  ({
     expression = expression_;
     configuration_aggregator_name = configuration_aggregator_name_;
     limit = limit_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : select_aggregate_resource_config_request)

let make_select_resource_config_response ?results:(results_ : results option)
    ?query_info:(query_info_ : query_info option) ?next_token:(next_token_ : next_token option) () =
  ({ results = results_; query_info = query_info_; next_token = next_token_ }
    : select_resource_config_response)

let make_select_resource_config_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) ~expression:(expression_ : expression) () =
  ({ expression = expression_; limit = limit_; next_token = next_token_ }
    : select_resource_config_request)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_configuration_recorder_request
    ~configuration_recorder_name:(configuration_recorder_name_ : recorder_name) () =
  ({ configuration_recorder_name = configuration_recorder_name_ }
    : stop_configuration_recorder_request)

let make_start_resource_evaluation_response
    ?resource_evaluation_id:(resource_evaluation_id_ : resource_evaluation_id option) () =
  ({ resource_evaluation_id = resource_evaluation_id_ } : start_resource_evaluation_response)

let make_start_resource_evaluation_request
    ?evaluation_context:(evaluation_context_ : evaluation_context option)
    ?evaluation_timeout:(evaluation_timeout_ : evaluation_timeout option)
    ?client_token:(client_token_ : client_token option)
    ~resource_details:(resource_details_ : resource_details)
    ~evaluation_mode:(evaluation_mode_ : evaluation_mode) () =
  ({
     resource_details = resource_details_;
     evaluation_context = evaluation_context_;
     evaluation_mode = evaluation_mode_;
     evaluation_timeout = evaluation_timeout_;
     client_token = client_token_;
   }
    : start_resource_evaluation_request)

let make_start_remediation_execution_response ?failure_message:(failure_message_ : string_ option)
    ?failed_items:(failed_items_ : resource_keys option) () =
  ({ failure_message = failure_message_; failed_items = failed_items_ }
    : start_remediation_execution_response)

let make_start_remediation_execution_request
    ~config_rule_name:(config_rule_name_ : config_rule_name)
    ~resource_keys:(resource_keys_ : resource_keys) () =
  ({ config_rule_name = config_rule_name_; resource_keys = resource_keys_ }
    : start_remediation_execution_request)

let make_start_configuration_recorder_request
    ~configuration_recorder_name:(configuration_recorder_name_ : recorder_name) () =
  ({ configuration_recorder_name = configuration_recorder_name_ }
    : start_configuration_recorder_request)

let make_start_config_rules_evaluation_response () = (() : unit)

let make_start_config_rules_evaluation_request
    ?config_rule_names:(config_rule_names_ : reevaluate_config_rule_names option) () =
  ({ config_rule_names = config_rule_names_ } : start_config_rules_evaluation_request)
