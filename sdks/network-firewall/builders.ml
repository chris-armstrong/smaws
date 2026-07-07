open Types

let make_vpc_endpoint_association_metadata
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : vpc_endpoint_association_metadata)

let make_attachment ?status_message:(status_message_ : status_message option)
    ?status:(status_ : attachment_status option) ?endpoint_id:(endpoint_id_ : endpoint_id option)
    ?subnet_id:(subnet_id_ : az_subnet option) () =
  ({
     status_message = status_message_;
     status = status_;
     endpoint_id = endpoint_id_;
     subnet_id = subnet_id_;
   }
    : attachment)

let make_az_sync_state ?attachment:(attachment_ : attachment option) () =
  ({ attachment = attachment_ } : az_sync_state)

let make_vpc_endpoint_association_status
    ?association_sync_state:(association_sync_state_ : association_sync_state option)
    ~status:(status_ : firewall_status_value) () =
  ({ association_sync_state = association_sync_state_; status = status_ }
    : vpc_endpoint_association_status)

let make_subnet_mapping ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ~subnet_id:(subnet_id_ : collection_member__string) () =
  ({ ip_address_type = ip_address_type_; subnet_id = subnet_id_ } : subnet_mapping)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_vpc_endpoint_association ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ?vpc_endpoint_association_id:(vpc_endpoint_association_id_ : resource_id option)
    ~subnet_mapping:(subnet_mapping_ : subnet_mapping) ~vpc_id:(vpc_id_ : vpc_id)
    ~firewall_arn:(firewall_arn_ : resource_arn)
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn) () =
  ({
     tags = tags_;
     description = description_;
     subnet_mapping = subnet_mapping_;
     vpc_id = vpc_id_;
     firewall_arn = firewall_arn_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_association_id = vpc_endpoint_association_id_;
   }
    : vpc_endpoint_association)

let make_encryption_configuration ?key_id:(key_id_ : key_id option)
    ~type_:(type__ : encryption_type) () =
  ({ type_ = type__; key_id = key_id_ } : encryption_configuration)

let make_tls_certificate_data ?status_message:(status_message_ : status_reason option)
    ?status:(status_ : collection_member__string option)
    ?certificate_serial:(certificate_serial_ : collection_member__string option)
    ?certificate_arn:(certificate_arn_ : resource_arn option) () =
  ({
     status_message = status_message_;
     status = status_;
     certificate_serial = certificate_serial_;
     certificate_arn = certificate_arn_;
   }
    : tls_certificate_data)

let make_tls_inspection_configuration_response
    ?certificate_authority:(certificate_authority_ : tls_certificate_data option)
    ?certificates:(certificates_ : certificates option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : description option)
    ?tls_inspection_configuration_status:
      (tls_inspection_configuration_status_ : resource_status option)
    ~tls_inspection_configuration_id:(tls_inspection_configuration_id_ : resource_id)
    ~tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name)
    ~tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn) () =
  ({
     certificate_authority = certificate_authority_;
     certificates = certificates_;
     encryption_configuration = encryption_configuration_;
     number_of_associations = number_of_associations_;
     last_modified_time = last_modified_time_;
     tags = tags_;
     description = description_;
     tls_inspection_configuration_status = tls_inspection_configuration_status_;
     tls_inspection_configuration_id = tls_inspection_configuration_id_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
   }
    : tls_inspection_configuration_response)

let make_update_tls_inspection_configuration_response
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response)
    ~update_token:(update_token_ : update_token) () =
  ({
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
     update_token = update_token_;
   }
    : update_tls_inspection_configuration_response)

let make_server_certificate ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ resource_arn = resource_arn_ } : server_certificate)

let make_address ~address_definition:(address_definition_ : address_definition) () =
  ({ address_definition = address_definition_ } : address)

let make_port_range ~to_port:(to_port_ : port_range_bound)
    ~from_port:(from_port_ : port_range_bound) () =
  ({ to_port = to_port_; from_port = from_port_ } : port_range)

let make_server_certificate_scope ?protocols:(protocols_ : protocol_numbers option)
    ?destination_ports:(destination_ports_ : port_ranges option)
    ?source_ports:(source_ports_ : port_ranges option)
    ?destinations:(destinations_ : addresses option) ?sources:(sources_ : addresses option) () =
  ({
     protocols = protocols_;
     destination_ports = destination_ports_;
     source_ports = source_ports_;
     destinations = destinations_;
     sources = sources_;
   }
    : server_certificate_scope)

let make_check_certificate_revocation_status_actions
    ?unknown_status_action:(unknown_status_action_ : revocation_check_action option)
    ?revoked_status_action:(revoked_status_action_ : revocation_check_action option) () =
  ({
     unknown_status_action = unknown_status_action_;
     revoked_status_action = revoked_status_action_;
   }
    : check_certificate_revocation_status_actions)

let make_server_certificate_configuration
    ?check_certificate_revocation_status:
      (check_certificate_revocation_status_ : check_certificate_revocation_status_actions option)
    ?certificate_authority_arn:(certificate_authority_arn_ : resource_arn option)
    ?scopes:(scopes_ : server_certificate_scopes option)
    ?server_certificates:(server_certificates_ : server_certificates option) () =
  ({
     check_certificate_revocation_status = check_certificate_revocation_status_;
     certificate_authority_arn = certificate_authority_arn_;
     scopes = scopes_;
     server_certificates = server_certificates_;
   }
    : server_certificate_configuration)

let make_tls_inspection_configuration
    ?server_certificate_configurations:
      (server_certificate_configurations_ : server_certificate_configurations option) () =
  ({ server_certificate_configurations = server_certificate_configurations_ }
    : tls_inspection_configuration)

let make_update_tls_inspection_configuration_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?description:(description_ : description option)
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ~update_token:(update_token_ : update_token)
    ~tls_inspection_configuration:(tls_inspection_configuration_ : tls_inspection_configuration) ()
    =
  ({
     update_token = update_token_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     tls_inspection_configuration = tls_inspection_configuration_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
   }
    : update_tls_inspection_configuration_request)

let make_update_subnet_change_protection_response
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     subnet_change_protection = subnet_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_subnet_change_protection_response)

let make_update_subnet_change_protection_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~subnet_change_protection:(subnet_change_protection_ : boolean_) () =
  ({
     subnet_change_protection = subnet_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_subnet_change_protection_request)

let make_source_metadata ?source_update_token:(source_update_token_ : update_token option)
    ?source_arn:(source_arn_ : resource_arn option) () =
  ({ source_update_token = source_update_token_; source_arn = source_arn_ } : source_metadata)

let make_summary_configuration ?rule_options:(rule_options_ : summary_rule_options option) () =
  ({ rule_options = rule_options_ } : summary_configuration)

let make_rule_group_response
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ?analysis_results:(analysis_results_ : analysis_result_list option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?sns_topic:(sns_topic_ : resource_arn option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?consumed_capacity:(consumed_capacity_ : rule_capacity option) ?tags:(tags_ : tag_list option)
    ?rule_group_status:(rule_group_status_ : resource_status option)
    ?capacity:(capacity_ : rule_capacity option) ?type_:(type__ : rule_group_type option)
    ?description:(description_ : description option) ~rule_group_id:(rule_group_id_ : resource_id)
    ~rule_group_name:(rule_group_name_ : resource_name)
    ~rule_group_arn:(rule_group_arn_ : resource_arn) () =
  ({
     summary_configuration = summary_configuration_;
     analysis_results = analysis_results_;
     last_modified_time = last_modified_time_;
     sns_topic = sns_topic_;
     source_metadata = source_metadata_;
     encryption_configuration = encryption_configuration_;
     number_of_associations = number_of_associations_;
     consumed_capacity = consumed_capacity_;
     tags = tags_;
     rule_group_status = rule_group_status_;
     capacity = capacity_;
     type_ = type__;
     description = description_;
     rule_group_id = rule_group_id_;
     rule_group_name = rule_group_name_;
     rule_group_arn = rule_group_arn_;
   }
    : rule_group_response)

let make_update_rule_group_response
    ~rule_group_response:(rule_group_response_ : rule_group_response)
    ~update_token:(update_token_ : update_token) () =
  ({ rule_group_response = rule_group_response_; update_token = update_token_ }
    : update_rule_group_response)

let make_ip_set ~definition:(definition_ : variable_definition_list) () =
  ({ definition = definition_ } : ip_set)

let make_port_set ?definition:(definition_ : variable_definition_list option) () =
  ({ definition = definition_ } : port_set)

let make_rule_variables ?port_sets:(port_sets_ : port_sets option)
    ?ip_sets:(ip_sets_ : ip_sets option) () =
  ({ port_sets = port_sets_; ip_sets = ip_sets_ } : rule_variables)

let make_ip_set_reference ?reference_arn:(reference_arn_ : resource_arn option) () =
  ({ reference_arn = reference_arn_ } : ip_set_reference)

let make_reference_sets ?ip_set_references:(ip_set_references_ : ip_set_reference_map option) () =
  ({ ip_set_references = ip_set_references_ } : reference_sets)

let make_rules_source_list ~generated_rules_type:(generated_rules_type_ : generated_rules_type)
    ~target_types:(target_types_ : target_types) ~targets:(targets_ : rule_targets) () =
  ({
     generated_rules_type = generated_rules_type_;
     target_types = target_types_;
     targets = targets_;
   }
    : rules_source_list)

let make_header ~destination_port:(destination_port_ : port)
    ~destination:(destination_ : destination) ~direction:(direction_ : stateful_rule_direction)
    ~source_port:(source_port_ : port) ~source:(source_ : source)
    ~protocol:(protocol_ : stateful_rule_protocol) () =
  ({
     destination_port = destination_port_;
     destination = destination_;
     direction = direction_;
     source_port = source_port_;
     source = source_;
     protocol = protocol_;
   }
    : header)

let make_rule_option ?settings:(settings_ : settings option) ~keyword:(keyword_ : keyword) () =
  ({ settings = settings_; keyword = keyword_ } : rule_option)

let make_stateful_rule ~rule_options:(rule_options_ : rule_options) ~header:(header_ : header)
    ~action:(action_ : stateful_action) () =
  ({ rule_options = rule_options_; header = header_; action = action_ } : stateful_rule)

let make_tcp_flag_field ?masks:(masks_ : flags option) ~flags:(flags_ : flags) () =
  ({ masks = masks_; flags = flags_ } : tcp_flag_field)

let make_match_attributes ?tcp_flags:(tcp_flags_ : tcp_flags option)
    ?protocols:(protocols_ : protocol_numbers option)
    ?destination_ports:(destination_ports_ : port_ranges option)
    ?source_ports:(source_ports_ : port_ranges option)
    ?destinations:(destinations_ : addresses option) ?sources:(sources_ : addresses option) () =
  ({
     tcp_flags = tcp_flags_;
     protocols = protocols_;
     destination_ports = destination_ports_;
     source_ports = source_ports_;
     destinations = destinations_;
     sources = sources_;
   }
    : match_attributes)

let make_rule_definition ~actions:(actions_ : stateless_actions)
    ~match_attributes:(match_attributes_ : match_attributes) () =
  ({ actions = actions_; match_attributes = match_attributes_ } : rule_definition)

let make_stateless_rule ~priority:(priority_ : priority)
    ~rule_definition:(rule_definition_ : rule_definition) () =
  ({ priority = priority_; rule_definition = rule_definition_ } : stateless_rule)

let make_dimension ~value:(value_ : dimension_value) () = ({ value = value_ } : dimension)

let make_publish_metric_action ~dimensions:(dimensions_ : dimensions) () =
  ({ dimensions = dimensions_ } : publish_metric_action)

let make_action_definition
    ?publish_metric_action:(publish_metric_action_ : publish_metric_action option) () =
  ({ publish_metric_action = publish_metric_action_ } : action_definition)

let make_custom_action ~action_definition:(action_definition_ : action_definition)
    ~action_name:(action_name_ : action_name) () =
  ({ action_definition = action_definition_; action_name = action_name_ } : custom_action)

let make_stateless_rules_and_custom_actions
    ?custom_actions:(custom_actions_ : custom_actions option)
    ~stateless_rules:(stateless_rules_ : stateless_rules) () =
  ({ custom_actions = custom_actions_; stateless_rules = stateless_rules_ }
    : stateless_rules_and_custom_actions)

let make_rules_source
    ?stateless_rules_and_custom_actions:
      (stateless_rules_and_custom_actions_ : stateless_rules_and_custom_actions option)
    ?stateful_rules:(stateful_rules_ : stateful_rules option)
    ?rules_source_list:(rules_source_list_ : rules_source_list option)
    ?rules_string:(rules_string_ : rules_string option) () =
  ({
     stateless_rules_and_custom_actions = stateless_rules_and_custom_actions_;
     stateful_rules = stateful_rules_;
     rules_source_list = rules_source_list_;
     rules_string = rules_string_;
   }
    : rules_source)

let make_stateful_rule_options ?rule_order:(rule_order_ : rule_order option) () =
  ({ rule_order = rule_order_ } : stateful_rule_options)

let make_rule_group ?stateful_rule_options:(stateful_rule_options_ : stateful_rule_options option)
    ?reference_sets:(reference_sets_ : reference_sets option)
    ?rule_variables:(rule_variables_ : rule_variables option)
    ~rules_source:(rules_source_ : rules_source) () =
  ({
     stateful_rule_options = stateful_rule_options_;
     rules_source = rules_source_;
     reference_sets = reference_sets_;
     rule_variables = rule_variables_;
   }
    : rule_group)

let make_update_rule_group_request
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ?analyze_rule_group:(analyze_rule_group_ : boolean_ option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?dry_run:(dry_run_ : boolean_ option) ?description:(description_ : description option)
    ?type_:(type__ : rule_group_type option) ?rules:(rules_ : rules_string option)
    ?rule_group:(rule_group_ : rule_group option)
    ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ~update_token:(update_token_ : update_token) () =
  ({
     summary_configuration = summary_configuration_;
     analyze_rule_group = analyze_rule_group_;
     source_metadata = source_metadata_;
     encryption_configuration = encryption_configuration_;
     dry_run = dry_run_;
     description = description_;
     type_ = type__;
     rules = rules_;
     rule_group = rule_group_;
     rule_group_name = rule_group_name_;
     rule_group_arn = rule_group_arn_;
     update_token = update_token_;
   }
    : update_rule_group_request)

let make_proxy_rule_condition
    ?condition_values:(condition_values_ : proxy_condition_value_list option)
    ?condition_key:(condition_key_ : condition_key option)
    ?condition_operator:(condition_operator_ : condition_operator option) () =
  ({
     condition_values = condition_values_;
     condition_key = condition_key_;
     condition_operator = condition_operator_;
   }
    : proxy_rule_condition)

let make_proxy_rule ?conditions:(conditions_ : proxy_rule_condition_list option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?description:(description_ : description option)
    ?proxy_rule_name:(proxy_rule_name_ : resource_name option) () =
  ({
     conditions = conditions_;
     action = action_;
     description = description_;
     proxy_rule_name = proxy_rule_name_;
   }
    : proxy_rule)

let make_update_proxy_rule_response ?update_token:(update_token_ : update_token option)
    ?removed_conditions:(removed_conditions_ : proxy_rule_condition_list option)
    ?proxy_rule:(proxy_rule_ : proxy_rule option) () =
  ({
     update_token = update_token_;
     removed_conditions = removed_conditions_;
     proxy_rule = proxy_rule_;
   }
    : update_proxy_rule_response)

let make_update_proxy_rule_request
    ?remove_conditions:(remove_conditions_ : proxy_rule_condition_list option)
    ?add_conditions:(add_conditions_ : proxy_rule_condition_list option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?description:(description_ : description option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ~update_token:(update_token_ : update_token) ~proxy_rule_name:(proxy_rule_name_ : resource_name)
    () =
  ({
     update_token = update_token_;
     remove_conditions = remove_conditions_;
     add_conditions = add_conditions_;
     action = action_;
     description = description_;
     proxy_rule_name = proxy_rule_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : update_proxy_rule_request)

let make_proxy_rule_priority ?new_position:(new_position_ : insert_position option)
    ?proxy_rule_name:(proxy_rule_name_ : resource_name option) () =
  ({ new_position = new_position_; proxy_rule_name = proxy_rule_name_ } : proxy_rule_priority)

let make_update_proxy_rule_priorities_response ?update_token:(update_token_ : update_token option)
    ?rules:(rules_ : proxy_rule_priority_list option)
    ?rule_group_request_phase:(rule_group_request_phase_ : rule_group_request_phase option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({
     update_token = update_token_;
     rules = rules_;
     rule_group_request_phase = rule_group_request_phase_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : update_proxy_rule_priorities_response)

let make_update_proxy_rule_priorities_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ~update_token:(update_token_ : update_token) ~rules:(rules_ : proxy_rule_priority_list)
    ~rule_group_request_phase:(rule_group_request_phase_ : rule_group_request_phase) () =
  ({
     update_token = update_token_;
     rules = rules_;
     rule_group_request_phase = rule_group_request_phase_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : update_proxy_rule_priorities_request)

let make_update_proxy_rule_group_priorities_response
    ?update_token:(update_token_ : update_token option)
    ?proxy_rule_groups:(proxy_rule_groups_ : proxy_rule_group_priority_result_list option) () =
  ({ update_token = update_token_; proxy_rule_groups = proxy_rule_groups_ }
    : update_proxy_rule_group_priorities_response)

let make_proxy_rule_group_priority ?new_position:(new_position_ : insert_position option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({ new_position = new_position_; proxy_rule_group_name = proxy_rule_group_name_ }
    : proxy_rule_group_priority)

let make_update_proxy_rule_group_priorities_request
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ~update_token:(update_token_ : update_token)
    ~rule_groups:(rule_groups_ : proxy_rule_group_priority_list) () =
  ({
     update_token = update_token_;
     rule_groups = rule_groups_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : update_proxy_rule_group_priorities_request)

let make_listener_property ?type_:(type__ : listener_property_type option)
    ?port:(port_ : nat_gateway_port option) () =
  ({ type_ = type__; port = port_ } : listener_property)

let make_tls_intercept_properties
    ?tls_intercept_mode:(tls_intercept_mode_ : tls_intercept_mode option)
    ?pca_arn:(pca_arn_ : resource_arn option) () =
  ({ tls_intercept_mode = tls_intercept_mode_; pca_arn = pca_arn_ } : tls_intercept_properties)

let make_proxy ?tags:(tags_ : tag_list option)
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties option)
    ?listener_properties:(listener_properties_ : listener_properties option)
    ?proxy_arn:(proxy_arn_ : resource_arn option) ?proxy_name:(proxy_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option)
    ?proxy_modify_state:(proxy_modify_state_ : proxy_modify_state option)
    ?proxy_state:(proxy_state_ : proxy_state option)
    ?failure_message:(failure_message_ : failure_message option)
    ?failure_code:(failure_code_ : failure_code option)
    ?update_time:(update_time_ : update_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?create_time:(create_time_ : create_time option) () =
  ({
     tags = tags_;
     tls_intercept_properties = tls_intercept_properties_;
     listener_properties = listener_properties_;
     proxy_arn = proxy_arn_;
     proxy_name = proxy_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
     nat_gateway_id = nat_gateway_id_;
     proxy_modify_state = proxy_modify_state_;
     proxy_state = proxy_state_;
     failure_message = failure_message_;
     failure_code = failure_code_;
     update_time = update_time_;
     delete_time = delete_time_;
     create_time = create_time_;
   }
    : proxy)

let make_update_proxy_response ?update_token:(update_token_ : update_token option)
    ?proxy:(proxy_ : proxy option) () =
  ({ update_token = update_token_; proxy = proxy_ } : update_proxy_response)

let make_listener_property_request ~type_:(type__ : listener_property_type)
    ~port:(port_ : nat_gateway_port) () =
  ({ type_ = type__; port = port_ } : listener_property_request)

let make_tls_intercept_properties_request
    ?tls_intercept_mode:(tls_intercept_mode_ : tls_intercept_mode option)
    ?pca_arn:(pca_arn_ : resource_arn option) () =
  ({ tls_intercept_mode = tls_intercept_mode_; pca_arn = pca_arn_ }
    : tls_intercept_properties_request)

let make_update_proxy_request
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties_request option)
    ?listener_properties_to_remove:
      (listener_properties_to_remove_ : listener_properties_request option)
    ?listener_properties_to_add:(listener_properties_to_add_ : listener_properties_request option)
    ?proxy_arn:(proxy_arn_ : resource_arn option) ?proxy_name:(proxy_name_ : resource_name option)
    ~update_token:(update_token_ : update_token) ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id)
    () =
  ({
     update_token = update_token_;
     tls_intercept_properties = tls_intercept_properties_;
     listener_properties_to_remove = listener_properties_to_remove_;
     listener_properties_to_add = listener_properties_to_add_;
     proxy_arn = proxy_arn_;
     proxy_name = proxy_name_;
     nat_gateway_id = nat_gateway_id_;
   }
    : update_proxy_request)

let make_proxy_config_rule_group ?priority:(priority_ : proxy_config_rule_group_priority option)
    ?type_:(type__ : proxy_config_rule_group_type option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({
     priority = priority_;
     type_ = type__;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : proxy_config_rule_group)

let make_proxy_config_default_rule_phase_actions_request
    ?post_respons_e:(post_respons_e_ : proxy_rule_phase_action option)
    ?pre_reques_t:(pre_reques_t_ : proxy_rule_phase_action option)
    ?pre_dn_s:(pre_dn_s_ : proxy_rule_phase_action option) () =
  ({ post_respons_e = post_respons_e_; pre_reques_t = pre_reques_t_; pre_dn_s = pre_dn_s_ }
    : proxy_config_default_rule_phase_actions_request)

let make_proxy_configuration ?tags:(tags_ : tag_list option)
    ?default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request option)
    ?rule_groups:(rule_groups_ : proxy_config_rule_group_set option)
    ?delete_time:(delete_time_ : delete_time option)
    ?create_time:(create_time_ : create_time option)
    ?description:(description_ : description option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option) () =
  ({
     tags = tags_;
     default_rule_phase_actions = default_rule_phase_actions_;
     rule_groups = rule_groups_;
     delete_time = delete_time_;
     create_time = create_time_;
     description = description_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : proxy_configuration)

let make_update_proxy_configuration_response ?update_token:(update_token_ : update_token option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) () =
  ({ update_token = update_token_; proxy_configuration = proxy_configuration_ }
    : update_proxy_configuration_response)

let make_update_proxy_configuration_request
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ~update_token:(update_token_ : update_token)
    ~default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request) () =
  ({
     update_token = update_token_;
     default_rule_phase_actions = default_rule_phase_actions_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : update_proxy_configuration_request)

let make_log_destination_config ~log_destination:(log_destination_ : log_destination_map)
    ~log_destination_type:(log_destination_type_ : log_destination_type)
    ~log_type:(log_type_ : log_type) () =
  ({
     log_destination = log_destination_;
     log_destination_type = log_destination_type_;
     log_type = log_type_;
   }
    : log_destination_config)

let make_logging_configuration
    ~log_destination_configs:(log_destination_configs_ : log_destination_configs) () =
  ({ log_destination_configs = log_destination_configs_ } : logging_configuration)

let make_update_logging_configuration_response
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
     logging_configuration = logging_configuration_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : update_logging_configuration_response)

let make_update_logging_configuration_request
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
     logging_configuration = logging_configuration_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : update_logging_configuration_request)

let make_firewall_policy_response
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?consumed_stateful_domain_capacity:(consumed_stateful_domain_capacity_ : rule_capacity option)
    ?consumed_stateful_rule_capacity:(consumed_stateful_rule_capacity_ : rule_capacity option)
    ?consumed_stateless_rule_capacity:(consumed_stateless_rule_capacity_ : rule_capacity option)
    ?tags:(tags_ : tag_list option)
    ?firewall_policy_status:(firewall_policy_status_ : resource_status option)
    ?description:(description_ : description option)
    ~firewall_policy_id:(firewall_policy_id_ : resource_id)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn)
    ~firewall_policy_name:(firewall_policy_name_ : resource_name) () =
  ({
     last_modified_time = last_modified_time_;
     encryption_configuration = encryption_configuration_;
     number_of_associations = number_of_associations_;
     consumed_stateful_domain_capacity = consumed_stateful_domain_capacity_;
     consumed_stateful_rule_capacity = consumed_stateful_rule_capacity_;
     consumed_stateless_rule_capacity = consumed_stateless_rule_capacity_;
     tags = tags_;
     firewall_policy_status = firewall_policy_status_;
     description = description_;
     firewall_policy_id = firewall_policy_id_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_policy_name = firewall_policy_name_;
   }
    : firewall_policy_response)

let make_update_firewall_policy_response
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response)
    ~update_token:(update_token_ : update_token) () =
  ({ firewall_policy_response = firewall_policy_response_; update_token = update_token_ }
    : update_firewall_policy_response)

let make_stateless_rule_group_reference ~priority:(priority_ : priority)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ priority = priority_; resource_arn = resource_arn_ } : stateless_rule_group_reference)

let make_stateful_rule_group_override ?action:(action_ : override_action option) () =
  ({ action = action_ } : stateful_rule_group_override)

let make_stateful_rule_group_reference
    ?deep_threat_inspection:(deep_threat_inspection_ : deep_threat_inspection option)
    ?override:(override_ : stateful_rule_group_override option)
    ?priority:(priority_ : priority option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
     deep_threat_inspection = deep_threat_inspection_;
     override = override_;
     priority = priority_;
     resource_arn = resource_arn_;
   }
    : stateful_rule_group_reference)

let make_flow_timeouts
    ?tcp_idle_timeout_seconds:(tcp_idle_timeout_seconds_ : tcp_idle_timeout_range_bound option) () =
  ({ tcp_idle_timeout_seconds = tcp_idle_timeout_seconds_ } : flow_timeouts)

let make_stateful_engine_options ?flow_timeouts:(flow_timeouts_ : flow_timeouts option)
    ?stream_exception_policy:(stream_exception_policy_ : stream_exception_policy option)
    ?rule_order:(rule_order_ : rule_order option) () =
  ({
     flow_timeouts = flow_timeouts_;
     stream_exception_policy = stream_exception_policy_;
     rule_order = rule_order_;
   }
    : stateful_engine_options)

let make_policy_variables ?rule_variables:(rule_variables_ : ip_sets option) () =
  ({ rule_variables = rule_variables_ } : policy_variables)

let make_firewall_policy
    ?enable_tls_session_holding:(enable_tls_session_holding_ : enable_tls_session_holding option)
    ?policy_variables:(policy_variables_ : policy_variables option)
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ?stateful_engine_options:(stateful_engine_options_ : stateful_engine_options option)
    ?stateful_default_actions:(stateful_default_actions_ : stateful_actions option)
    ?stateful_rule_group_references:
      (stateful_rule_group_references_ : stateful_rule_group_references option)
    ?stateless_custom_actions:(stateless_custom_actions_ : custom_actions option)
    ?stateless_rule_group_references:
      (stateless_rule_group_references_ : stateless_rule_group_references option)
    ~stateless_fragment_default_actions:(stateless_fragment_default_actions_ : stateless_actions)
    ~stateless_default_actions:(stateless_default_actions_ : stateless_actions) () =
  ({
     enable_tls_session_holding = enable_tls_session_holding_;
     policy_variables = policy_variables_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     stateful_engine_options = stateful_engine_options_;
     stateful_default_actions = stateful_default_actions_;
     stateful_rule_group_references = stateful_rule_group_references_;
     stateless_custom_actions = stateless_custom_actions_;
     stateless_fragment_default_actions = stateless_fragment_default_actions_;
     stateless_default_actions = stateless_default_actions_;
     stateless_rule_group_references = stateless_rule_group_references_;
   }
    : firewall_policy)

let make_update_firewall_policy_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?dry_run:(dry_run_ : boolean_ option) ?description:(description_ : description option)
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ~firewall_policy:(firewall_policy_ : firewall_policy)
    ~update_token:(update_token_ : update_token) () =
  ({
     encryption_configuration = encryption_configuration_;
     dry_run = dry_run_;
     description = description_;
     firewall_policy = firewall_policy_;
     firewall_policy_name = firewall_policy_name_;
     firewall_policy_arn = firewall_policy_arn_;
     update_token = update_token_;
   }
    : update_firewall_policy_request)

let make_update_firewall_policy_change_protection_response
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_policy_change_protection = firewall_policy_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_firewall_policy_change_protection_response)

let make_update_firewall_policy_change_protection_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_) () =
  ({
     firewall_policy_change_protection = firewall_policy_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_firewall_policy_change_protection_request)

let make_update_firewall_encryption_configuration_response
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?update_token:(update_token_ : update_token option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     encryption_configuration = encryption_configuration_;
     update_token = update_token_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : update_firewall_encryption_configuration_response)

let make_update_firewall_encryption_configuration_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     encryption_configuration = encryption_configuration_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_firewall_encryption_configuration_request)

let make_update_firewall_description_response ?update_token:(update_token_ : update_token option)
    ?description:(description_ : description option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     description = description_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : update_firewall_description_response)

let make_update_firewall_description_request ?description:(description_ : description option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     description = description_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_firewall_description_request)

let make_update_firewall_delete_protection_response
    ?update_token:(update_token_ : update_token option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     delete_protection = delete_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : update_firewall_delete_protection_response)

let make_update_firewall_delete_protection_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~delete_protection:(delete_protection_ : boolean_) () =
  ({
     delete_protection = delete_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_firewall_delete_protection_request)

let make_update_firewall_analysis_settings_response
    ?update_token:(update_token_ : update_token option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option) () =
  ({
     update_token = update_token_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     enabled_analysis_types = enabled_analysis_types_;
   }
    : update_firewall_analysis_settings_response)

let make_update_firewall_analysis_settings_request
    ?update_token:(update_token_ : update_token option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option) () =
  ({
     update_token = update_token_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     enabled_analysis_types = enabled_analysis_types_;
   }
    : update_firewall_analysis_settings_request)

let make_container_attribute ~value:(value_ : container_attribute_value)
    ~key:(key_ : container_attribute_key) () =
  ({ value = value_; key = key_ } : container_attribute)

let make_container_monitoring_configuration
    ?attribute_filters:(attribute_filters_ : container_attributes option)
    ~cluster_arn:(cluster_arn_ : resource_arn) () =
  ({ attribute_filters = attribute_filters_; cluster_arn = cluster_arn_ }
    : container_monitoring_configuration)

let make_update_container_association_response ?update_token:(update_token_ : update_token option)
    ?tags:(tags_ : tag_list option) ?status:(status_ : container_association_status option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?type_:(type__ : container_monitoring_type option)
    ?description:(description_ : description option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     update_token = update_token_;
     tags = tags_;
     status = status_;
     container_monitoring_configurations = container_monitoring_configurations_;
     type_ = type__;
     description = description_;
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : update_container_association_response)

let make_update_container_association_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option)
    ~update_token:(update_token_ : update_token)
    ~container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations)
    ~type_:(type__ : container_monitoring_type) () =
  ({
     update_token = update_token_;
     tags = tags_;
     container_monitoring_configurations = container_monitoring_configurations_;
     type_ = type__;
     description = description_;
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : update_container_association_request)

let make_update_availability_zone_change_protection_response
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     availability_zone_change_protection = availability_zone_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_availability_zone_change_protection_response)

let make_update_availability_zone_change_protection_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~availability_zone_change_protection:(availability_zone_change_protection_ : boolean_) () =
  ({
     availability_zone_change_protection = availability_zone_change_protection_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : update_availability_zone_change_protection_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_unique_sources ?count:(count_ : count option) () = ({ count = count_ } : unique_sources)

let make_transit_gateway_attachment_sync_state
    ?status_message:(status_message_ : transit_gateway_attachment_sync_state_message option)
    ?transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status option)
    ?attachment_id:(attachment_id_ : attachment_id option) () =
  ({
     status_message = status_message_;
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
     attachment_id = attachment_id_;
   }
    : transit_gateway_attachment_sync_state)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_tls_inspection_configuration_metadata ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : tls_inspection_configuration_metadata)

let make_per_object_status ?update_token:(update_token_ : update_token option)
    ?sync_status:(sync_status_ : per_object_sync_status option) () =
  ({ update_token = update_token_; sync_status = sync_status_ } : per_object_status)

let make_sync_state ?config:(config_ : sync_state_config option)
    ?attachment:(attachment_ : attachment option) () =
  ({ config = config_; attachment = attachment_ } : sync_state)

let make_availability_zone_metadata ?ip_address_type:(ip_address_type_ : ip_address_type option) ()
    =
  ({ ip_address_type = ip_address_type_ } : availability_zone_metadata)

let make_rule_summary ?metadata:(metadata_ : collection_member__string option)
    ?msg:(msg_ : collection_member__string option) ?si_d:(si_d_ : collection_member__string option)
    () =
  ({ metadata = metadata_; msg = msg_; si_d = si_d_ } : rule_summary)

let make_summary ?rule_summaries:(rule_summaries_ : rule_summaries option) () =
  ({ rule_summaries = rule_summaries_ } : summary)

let make_start_flow_flush_response
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     flow_operation_status = flow_operation_status_;
     flow_operation_id = flow_operation_id_;
     firewall_arn = firewall_arn_;
   }
    : start_flow_flush_response)

let make_flow_filter ?protocols:(protocols_ : protocol_strings option)
    ?destination_port:(destination_port_ : port option) ?source_port:(source_port_ : port option)
    ?destination_address:(destination_address_ : address option)
    ?source_address:(source_address_ : address option) () =
  ({
     protocols = protocols_;
     destination_port = destination_port_;
     source_port = source_port_;
     destination_address = destination_address_;
     source_address = source_address_;
   }
    : flow_filter)

let make_start_flow_flush_request
    ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~flow_filters:(flow_filters_ : flow_filters) ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     flow_filters = flow_filters_;
     minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : start_flow_flush_request)

let make_start_flow_capture_response
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     flow_operation_status = flow_operation_status_;
     flow_operation_id = flow_operation_id_;
     firewall_arn = firewall_arn_;
   }
    : start_flow_capture_response)

let make_start_flow_capture_request
    ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~flow_filters:(flow_filters_ : flow_filters) ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     flow_filters = flow_filters_;
     minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : start_flow_capture_request)

let make_start_analysis_report_response
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({ analysis_report_id = analysis_report_id_ } : start_analysis_report_response)

let make_start_analysis_report_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~analysis_type:(analysis_type_ : enabled_analysis_type) () =
  ({ analysis_type = analysis_type_; firewall_arn = firewall_arn_; firewall_name = firewall_name_ }
    : start_analysis_report_request)

let make_rule_group_metadata ?vendor_name:(vendor_name_ : vendor_name option)
    ?arn:(arn_ : resource_arn option) ?name:(name_ : resource_name option) () =
  ({ vendor_name = vendor_name_; arn = arn_; name = name_ } : rule_group_metadata)

let make_reject_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status)
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
   }
    : reject_network_firewall_transit_gateway_attachment_response)

let make_reject_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : reject_network_firewall_transit_gateway_attachment_request)

let make_put_resource_policy_response () = (() : unit)

let make_put_resource_policy_request ~policy:(policy_ : policy_string)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_request)

let make_proxy_rules_by_request_phase ?post_respons_e:(post_respons_e_ : proxy_rule_list option)
    ?pre_reques_t:(pre_reques_t_ : proxy_rule_list option)
    ?pre_dn_s:(pre_dn_s_ : proxy_rule_list option) () =
  ({ post_respons_e = post_respons_e_; pre_reques_t = pre_reques_t_; pre_dn_s = pre_dn_s_ }
    : proxy_rules_by_request_phase)

let make_proxy_rule_group_metadata ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : proxy_rule_group_metadata)

let make_proxy_rule_group_attachment ?insert_position:(insert_position_ : insert_position option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({ insert_position = insert_position_; proxy_rule_group_name = proxy_rule_group_name_ }
    : proxy_rule_group_attachment)

let make_proxy_rule_group ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ?rules:(rules_ : proxy_rules_by_request_phase option)
    ?delete_time:(delete_time_ : delete_time option)
    ?create_time:(create_time_ : create_time option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({
     tags = tags_;
     description = description_;
     rules = rules_;
     delete_time = delete_time_;
     create_time = create_time_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : proxy_rule_group)

let make_proxy_metadata ?arn:(arn_ : resource_arn option) ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : proxy_metadata)

let make_proxy_configuration_metadata ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : proxy_configuration_metadata)

let make_list_vpc_endpoint_associations_response
    ?vpc_endpoint_associations:(vpc_endpoint_associations_ : vpc_endpoint_associations option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ vpc_endpoint_associations = vpc_endpoint_associations_; next_token = next_token_ }
    : list_vpc_endpoint_associations_response)

let make_list_vpc_endpoint_associations_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ firewall_arn = firewall_arn_; max_results = max_results_; next_token = next_token_ }
    : list_vpc_endpoint_associations_request)

let make_list_tls_inspection_configurations_response
    ?tls_inspection_configurations:
      (tls_inspection_configurations_ : tls_inspection_configurations option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ tls_inspection_configurations = tls_inspection_configurations_; next_token = next_token_ }
    : list_tls_inspection_configurations_response)

let make_list_tls_inspection_configurations_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_tls_inspection_configurations_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request
    ?max_results:(max_results_ : tags_pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ resource_arn = resource_arn_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_list_rule_groups_response ?rule_groups:(rule_groups_ : rule_groups option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ rule_groups = rule_groups_; next_token = next_token_ } : list_rule_groups_response)

let make_list_rule_groups_request ?type_:(type__ : rule_group_type option)
    ?subscription_status:(subscription_status_ : subscription_status option)
    ?managed_type:(managed_type_ : resource_managed_type option)
    ?scope:(scope_ : resource_managed_status option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     type_ = type__;
     subscription_status = subscription_status_;
     managed_type = managed_type_;
     scope = scope_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_rule_groups_request)

let make_list_proxy_rule_groups_response ?next_token:(next_token_ : pagination_token option)
    ?proxy_rule_groups:(proxy_rule_groups_ : proxy_rule_groups option) () =
  ({ next_token = next_token_; proxy_rule_groups = proxy_rule_groups_ }
    : list_proxy_rule_groups_response)

let make_list_proxy_rule_groups_request ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_proxy_rule_groups_request)

let make_list_proxy_configurations_response ?next_token:(next_token_ : pagination_token option)
    ?proxy_configurations:(proxy_configurations_ : proxy_configurations option) () =
  ({ next_token = next_token_; proxy_configurations = proxy_configurations_ }
    : list_proxy_configurations_response)

let make_list_proxy_configurations_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_proxy_configurations_request)

let make_list_proxies_response ?next_token:(next_token_ : pagination_token option)
    ?proxies:(proxies_ : proxies option) () =
  ({ next_token = next_token_; proxies = proxies_ } : list_proxies_response)

let make_list_proxies_request ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_proxies_request)

let make_flow_operation_metadata
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option) () =
  ({
     flow_operation_status = flow_operation_status_;
     flow_request_timestamp = flow_request_timestamp_;
     flow_operation_type = flow_operation_type_;
     flow_operation_id = flow_operation_id_;
   }
    : flow_operation_metadata)

let make_list_flow_operations_response ?next_token:(next_token_ : pagination_token option)
    ?flow_operations:(flow_operations_ : flow_operations option) () =
  ({ next_token = next_token_; flow_operations = flow_operations_ } : list_flow_operations_response)

let make_list_flow_operations_request ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     flow_operation_type = flow_operation_type_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : list_flow_operations_request)

let make_flow ?byte_count:(byte_count_ : byte_count option)
    ?packet_count:(packet_count_ : packet_count option) ?age:(age_ : age option)
    ?protocol:(protocol_ : protocol_string option)
    ?destination_port:(destination_port_ : port option) ?source_port:(source_port_ : port option)
    ?destination_address:(destination_address_ : address option)
    ?source_address:(source_address_ : address option) () =
  ({
     byte_count = byte_count_;
     packet_count = packet_count_;
     age = age_;
     protocol = protocol_;
     destination_port = destination_port_;
     source_port = source_port_;
     destination_address = destination_address_;
     source_address = source_address_;
   }
    : flow)

let make_list_flow_operation_results_response ?next_token:(next_token_ : pagination_token option)
    ?flows:(flows_ : flows option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?status_message:(status_message_ : status_reason option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     next_token = next_token_;
     flows = flows_;
     flow_request_timestamp = flow_request_timestamp_;
     status_message = status_message_;
     flow_operation_status = flow_operation_status_;
     flow_operation_id = flow_operation_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : list_flow_operation_results_response)

let make_list_flow_operation_results_request
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~flow_operation_id:(flow_operation_id_ : flow_operation_id)
    ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     availability_zone = availability_zone_;
     max_results = max_results_;
     next_token = next_token_;
     flow_operation_id = flow_operation_id_;
     firewall_arn = firewall_arn_;
   }
    : list_flow_operation_results_request)

let make_firewall_metadata
    ?transit_gateway_attachment_id:
      (transit_gateway_attachment_id_ : transit_gateway_attachment_id option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) () =
  ({
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
   }
    : firewall_metadata)

let make_list_firewalls_response ?firewalls:(firewalls_ : firewalls option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ firewalls = firewalls_; next_token = next_token_ } : list_firewalls_response)

let make_list_firewalls_request ?max_results:(max_results_ : pagination_max_results option)
    ?vpc_ids:(vpc_ids_ : vpc_ids option) ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; vpc_ids = vpc_ids_; next_token = next_token_ }
    : list_firewalls_request)

let make_firewall_policy_metadata ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : firewall_policy_metadata)

let make_list_firewall_policies_response
    ?firewall_policies:(firewall_policies_ : firewall_policies option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ firewall_policies = firewall_policies_; next_token = next_token_ }
    : list_firewall_policies_response)

let make_list_firewall_policies_request ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_firewall_policies_request)

let make_container_association_summary ?name:(name_ : resource_name option)
    ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : container_association_summary)

let make_list_container_associations_response ?next_token:(next_token_ : pagination_token option)
    ?container_associations:(container_associations_ : container_associations option) () =
  ({ next_token = next_token_; container_associations = container_associations_ }
    : list_container_associations_response)

let make_list_container_associations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_container_associations_request)

let make_analysis_report ?status:(status_ : status option)
    ?report_time:(report_time_ : report_time option)
    ?analysis_type:(analysis_type_ : enabled_analysis_type option)
    ?analysis_report_id:(analysis_report_id_ : analysis_report_id option) () =
  ({
     status = status_;
     report_time = report_time_;
     analysis_type = analysis_type_;
     analysis_report_id = analysis_report_id_;
   }
    : analysis_report)

let make_list_analysis_reports_response ?next_token:(next_token_ : pagination_token option)
    ?analysis_reports:(analysis_reports_ : analysis_reports option) () =
  ({ next_token = next_token_; analysis_reports = analysis_reports_ }
    : list_analysis_reports_response)

let make_list_analysis_reports_request ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
   }
    : list_analysis_reports_request)

let make_hits ?count:(count_ : count option) () = ({ count = count_ } : hits)

let make_get_analysis_report_results_response
    ?analysis_report_results:(analysis_report_results_ : analysis_report_results option)
    ?next_token:(next_token_ : analysis_report_next_token option)
    ?analysis_type:(analysis_type_ : enabled_analysis_type option)
    ?report_time:(report_time_ : report_time option) ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option) ?status:(status_ : status option) () =
  ({
     analysis_report_results = analysis_report_results_;
     next_token = next_token_;
     analysis_type = analysis_type_;
     report_time = report_time_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
   }
    : get_analysis_report_results_response)

let make_get_analysis_report_results_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : analysis_report_next_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     firewall_arn = firewall_arn_;
     analysis_report_id = analysis_report_id_;
     firewall_name = firewall_name_;
   }
    : get_analysis_report_results_request)

let make_disassociate_subnets_response ?update_token:(update_token_ : update_token option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     subnet_mappings = subnet_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : disassociate_subnets_response)

let make_disassociate_subnets_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) ~subnet_ids:(subnet_ids_ : az_subnets) () =
  ({
     subnet_ids = subnet_ids_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : disassociate_subnets_request)

let make_availability_zone_mapping
    ~availability_zone:(availability_zone_ : availability_zone_mapping_string) () =
  ({ availability_zone = availability_zone_ } : availability_zone_mapping)

let make_disassociate_availability_zones_response
    ?update_token:(update_token_ : update_token option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     availability_zone_mappings = availability_zone_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : disassociate_availability_zones_response)

let make_disassociate_availability_zones_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings) () =
  ({
     availability_zone_mappings = availability_zone_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : disassociate_availability_zones_request)

let make_detach_rule_groups_from_proxy_configuration_response
    ?update_token:(update_token_ : update_token option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) () =
  ({ update_token = update_token_; proxy_configuration = proxy_configuration_ }
    : detach_rule_groups_from_proxy_configuration_response)

let make_detach_rule_groups_from_proxy_configuration_request
    ?rule_group_arns:(rule_group_arns_ : resource_arn_list option)
    ?rule_group_names:(rule_group_names_ : resource_name_list option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ~update_token:(update_token_ : update_token) () =
  ({
     update_token = update_token_;
     rule_group_arns = rule_group_arns_;
     rule_group_names = rule_group_names_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : detach_rule_groups_from_proxy_configuration_request)

let make_describe_vpc_endpoint_association_response
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option)
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option) () =
  ({
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
     vpc_endpoint_association = vpc_endpoint_association_;
   }
    : describe_vpc_endpoint_association_response)

let make_describe_vpc_endpoint_association_request
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : describe_vpc_endpoint_association_request)

let make_describe_tls_inspection_configuration_response
    ?tls_inspection_configuration:
      (tls_inspection_configuration_ : tls_inspection_configuration option)
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response)
    ~update_token:(update_token_ : update_token) () =
  ({
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
     tls_inspection_configuration = tls_inspection_configuration_;
     update_token = update_token_;
   }
    : describe_tls_inspection_configuration_response)

let make_describe_tls_inspection_configuration_request
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option) () =
  ({
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
   }
    : describe_tls_inspection_configuration_request)

let make_describe_rule_group_summary_response ?summary:(summary_ : summary option)
    ?description:(description_ : description option)
    ~rule_group_name:(rule_group_name_ : resource_name) () =
  ({ summary = summary_; description = description_; rule_group_name = rule_group_name_ }
    : describe_rule_group_summary_response)

let make_describe_rule_group_summary_request ?type_:(type__ : rule_group_type option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ?rule_group_name:(rule_group_name_ : resource_name option) () =
  ({ type_ = type__; rule_group_arn = rule_group_arn_; rule_group_name = rule_group_name_ }
    : describe_rule_group_summary_request)

let make_describe_rule_group_metadata_response ?listing_name:(listing_name_ : listing_name option)
    ?product_id:(product_id_ : product_id option) ?vendor_name:(vendor_name_ : vendor_name option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?stateful_rule_options:(stateful_rule_options_ : stateful_rule_options option)
    ?capacity:(capacity_ : rule_capacity option) ?type_:(type__ : rule_group_type option)
    ?description:(description_ : description option)
    ~rule_group_name:(rule_group_name_ : resource_name)
    ~rule_group_arn:(rule_group_arn_ : resource_arn) () =
  ({
     listing_name = listing_name_;
     product_id = product_id_;
     vendor_name = vendor_name_;
     last_modified_time = last_modified_time_;
     stateful_rule_options = stateful_rule_options_;
     capacity = capacity_;
     type_ = type__;
     description = description_;
     rule_group_name = rule_group_name_;
     rule_group_arn = rule_group_arn_;
   }
    : describe_rule_group_metadata_response)

let make_describe_rule_group_metadata_request ?type_:(type__ : rule_group_type option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ?rule_group_name:(rule_group_name_ : resource_name option) () =
  ({ type_ = type__; rule_group_arn = rule_group_arn_; rule_group_name = rule_group_name_ }
    : describe_rule_group_metadata_request)

let make_describe_rule_group_response ?rule_group:(rule_group_ : rule_group option)
    ~rule_group_response:(rule_group_response_ : rule_group_response)
    ~update_token:(update_token_ : update_token) () =
  ({
     rule_group_response = rule_group_response_;
     rule_group = rule_group_;
     update_token = update_token_;
   }
    : describe_rule_group_response)

let make_describe_rule_group_request ?analyze_rule_group:(analyze_rule_group_ : boolean_ option)
    ?type_:(type__ : rule_group_type option) ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ?rule_group_name:(rule_group_name_ : resource_name option) () =
  ({
     analyze_rule_group = analyze_rule_group_;
     type_ = type__;
     rule_group_arn = rule_group_arn_;
     rule_group_name = rule_group_name_;
   }
    : describe_rule_group_request)

let make_describe_resource_policy_response ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : describe_resource_policy_response)

let make_describe_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : describe_resource_policy_request)

let make_describe_proxy_rule_group_response ?update_token:(update_token_ : update_token option)
    ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option) () =
  ({ update_token = update_token_; proxy_rule_group = proxy_rule_group_ }
    : describe_proxy_rule_group_response)

let make_describe_proxy_rule_group_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({ proxy_rule_group_arn = proxy_rule_group_arn_; proxy_rule_group_name = proxy_rule_group_name_ }
    : describe_proxy_rule_group_request)

let make_describe_proxy_rule_response ?update_token:(update_token_ : update_token option)
    ?proxy_rule:(proxy_rule_ : proxy_rule option) () =
  ({ update_token = update_token_; proxy_rule = proxy_rule_ } : describe_proxy_rule_response)

let make_describe_proxy_rule_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ~proxy_rule_name:(proxy_rule_name_ : resource_name) () =
  ({
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_name = proxy_rule_name_;
   }
    : describe_proxy_rule_request)

let make_describe_proxy_configuration_response ?update_token:(update_token_ : update_token option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) () =
  ({ update_token = update_token_; proxy_configuration = proxy_configuration_ }
    : describe_proxy_configuration_response)

let make_describe_proxy_configuration_request
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option) () =
  ({
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : describe_proxy_configuration_request)

let make_describe_proxy_resource ?tags:(tags_ : tag_list option)
    ?failure_message:(failure_message_ : failure_message option)
    ?failure_code:(failure_code_ : failure_code option)
    ?update_time:(update_time_ : update_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?create_time:(create_time_ : create_time option)
    ?private_dns_name:(private_dns_name_ : private_dns_name option)
    ?vpc_endpoint_service_name:(vpc_endpoint_service_name_ : vpc_endpoint_service_name option)
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties option)
    ?listener_properties:(listener_properties_ : listener_properties option)
    ?proxy_modify_state:(proxy_modify_state_ : proxy_modify_state option)
    ?proxy_state:(proxy_state_ : proxy_state option)
    ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_arn:(proxy_arn_ : resource_arn option) ?proxy_name:(proxy_name_ : resource_name option)
    () =
  ({
     tags = tags_;
     failure_message = failure_message_;
     failure_code = failure_code_;
     update_time = update_time_;
     delete_time = delete_time_;
     create_time = create_time_;
     private_dns_name = private_dns_name_;
     vpc_endpoint_service_name = vpc_endpoint_service_name_;
     tls_intercept_properties = tls_intercept_properties_;
     listener_properties = listener_properties_;
     proxy_modify_state = proxy_modify_state_;
     proxy_state = proxy_state_;
     nat_gateway_id = nat_gateway_id_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
     proxy_arn = proxy_arn_;
     proxy_name = proxy_name_;
   }
    : describe_proxy_resource)

let make_describe_proxy_response ?update_token:(update_token_ : update_token option)
    ?proxy:(proxy_ : describe_proxy_resource option) () =
  ({ update_token = update_token_; proxy = proxy_ } : describe_proxy_response)

let make_describe_proxy_request ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?proxy_name:(proxy_name_ : resource_name option) () =
  ({ proxy_arn = proxy_arn_; proxy_name = proxy_name_ } : describe_proxy_request)

let make_describe_logging_configuration_response
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
     logging_configuration = logging_configuration_;
     firewall_arn = firewall_arn_;
   }
    : describe_logging_configuration_response)

let make_describe_logging_configuration_request
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ firewall_name = firewall_name_; firewall_arn = firewall_arn_ }
    : describe_logging_configuration_request)

let make_flow_operation ?flow_filters:(flow_filters_ : flow_filters option)
    ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option) () =
  ({ flow_filters = flow_filters_; minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_ }
    : flow_operation)

let make_describe_flow_operation_response ?flow_operation:(flow_operation_ : flow_operation option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?status_message:(status_message_ : status_reason option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     flow_operation = flow_operation_;
     flow_request_timestamp = flow_request_timestamp_;
     status_message = status_message_;
     flow_operation_status = flow_operation_status_;
     flow_operation_type = flow_operation_type_;
     flow_operation_id = flow_operation_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : describe_flow_operation_response)

let make_describe_flow_operation_request
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~flow_operation_id:(flow_operation_id_ : flow_operation_id)
    ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     flow_operation_id = flow_operation_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     availability_zone = availability_zone_;
     firewall_arn = firewall_arn_;
   }
    : describe_flow_operation_request)

let make_describe_firewall_policy_response
    ?firewall_policy:(firewall_policy_ : firewall_policy option)
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response)
    ~update_token:(update_token_ : update_token) () =
  ({
     firewall_policy = firewall_policy_;
     firewall_policy_response = firewall_policy_response_;
     update_token = update_token_;
   }
    : describe_firewall_policy_response)

let make_describe_firewall_policy_request
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option) () =
  ({ firewall_policy_arn = firewall_policy_arn_; firewall_policy_name = firewall_policy_name_ }
    : describe_firewall_policy_request)

let make_describe_firewall_metadata_response
    ?transit_gateway_attachment_id:
      (transit_gateway_attachment_id_ : transit_gateway_attachment_id option)
    ?supported_availability_zones:
      (supported_availability_zones_ : supported_availability_zones option)
    ?status:(status_ : firewall_status_value option)
    ?description:(description_ : description option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
     supported_availability_zones = supported_availability_zones_;
     status = status_;
     description = description_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_arn = firewall_arn_;
   }
    : describe_firewall_metadata_response)

let make_describe_firewall_metadata_request ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ firewall_arn = firewall_arn_ } : describe_firewall_metadata_request)

let make_firewall
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?transit_gateway_owner_account_id:(transit_gateway_owner_account_id_ : aws_account_id option)
    ?transit_gateway_id:(transit_gateway_id_ : transit_gateway_id option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : description option)
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option)
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) ~firewall_id:(firewall_id_ : resource_id)
    ~subnet_mappings:(subnet_mappings_ : subnet_mappings) ~vpc_id:(vpc_id_ : vpc_id)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn) () =
  ({
     availability_zone_change_protection = availability_zone_change_protection_;
     availability_zone_mappings = availability_zone_mappings_;
     transit_gateway_owner_account_id = transit_gateway_owner_account_id_;
     transit_gateway_id = transit_gateway_id_;
     enabled_analysis_types = enabled_analysis_types_;
     number_of_associations = number_of_associations_;
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     firewall_id = firewall_id_;
     description = description_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
     subnet_change_protection = subnet_change_protection_;
     delete_protection = delete_protection_;
     subnet_mappings = subnet_mappings_;
     vpc_id = vpc_id_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
   }
    : firewall)

let make_ip_set_metadata ?resolved_cidr_count:(resolved_cidr_count_ : cidr_count option) () =
  ({ resolved_cidr_count = resolved_cidr_count_ } : ip_set_metadata)

let make_cidr_summary ?ip_set_references:(ip_set_references_ : ip_set_metadata_map option)
    ?utilized_cidr_count:(utilized_cidr_count_ : cidr_count option)
    ?available_cidr_count:(available_cidr_count_ : cidr_count option) () =
  ({
     ip_set_references = ip_set_references_;
     utilized_cidr_count = utilized_cidr_count_;
     available_cidr_count = available_cidr_count_;
   }
    : cidr_summary)

let make_capacity_usage_summary ?cid_rs:(cid_rs_ : cidr_summary option) () =
  ({ cid_rs = cid_rs_ } : capacity_usage_summary)

let make_firewall_status
    ?transit_gateway_attachment_sync_state:
      (transit_gateway_attachment_sync_state_ : transit_gateway_attachment_sync_state option)
    ?capacity_usage_summary:(capacity_usage_summary_ : capacity_usage_summary option)
    ?sync_states:(sync_states_ : sync_states option)
    ~configuration_sync_state_summary:(configuration_sync_state_summary_ : configuration_sync_state)
    ~status:(status_ : firewall_status_value) () =
  ({
     transit_gateway_attachment_sync_state = transit_gateway_attachment_sync_state_;
     capacity_usage_summary = capacity_usage_summary_;
     sync_states = sync_states_;
     configuration_sync_state_summary = configuration_sync_state_summary_;
     status = status_;
   }
    : firewall_status)

let make_describe_firewall_response ?firewall_status:(firewall_status_ : firewall_status option)
    ?firewall:(firewall_ : firewall option) ?update_token:(update_token_ : update_token option) () =
  ({ firewall_status = firewall_status_; firewall = firewall_; update_token = update_token_ }
    : describe_firewall_response)

let make_describe_firewall_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) () =
  ({ firewall_arn = firewall_arn_; firewall_name = firewall_name_ } : describe_firewall_request)

let make_describe_container_association_response ?update_token:(update_token_ : update_token option)
    ?tags:(tags_ : tag_list option)
    ?last_updated_time:(last_updated_time_ : container_association_last_updated_time option)
    ?resolved_cidr_count:(resolved_cidr_count_ : cidr_count option)
    ?status:(status_ : container_association_status option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?type_:(type__ : container_monitoring_type option)
    ?description:(description_ : description option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     update_token = update_token_;
     tags = tags_;
     last_updated_time = last_updated_time_;
     resolved_cidr_count = resolved_cidr_count_;
     status = status_;
     container_monitoring_configurations = container_monitoring_configurations_;
     type_ = type__;
     description = description_;
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : describe_container_association_response)

let make_describe_container_association_request
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : describe_container_association_request)

let make_delete_vpc_endpoint_association_response
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option)
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option) () =
  ({
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
     vpc_endpoint_association = vpc_endpoint_association_;
   }
    : delete_vpc_endpoint_association_response)

let make_delete_vpc_endpoint_association_request
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : delete_vpc_endpoint_association_request)

let make_delete_tls_inspection_configuration_response
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response) () =
  ({ tls_inspection_configuration_response = tls_inspection_configuration_response_ }
    : delete_tls_inspection_configuration_response)

let make_delete_tls_inspection_configuration_request
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option) () =
  ({
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
   }
    : delete_tls_inspection_configuration_request)

let make_delete_rule_group_response
    ~rule_group_response:(rule_group_response_ : rule_group_response) () =
  ({ rule_group_response = rule_group_response_ } : delete_rule_group_response)

let make_delete_rule_group_request ?type_:(type__ : rule_group_type option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ?rule_group_name:(rule_group_name_ : resource_name option) () =
  ({ type_ = type__; rule_group_arn = rule_group_arn_; rule_group_name = rule_group_name_ }
    : delete_rule_group_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_proxy_rules_response ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option)
    () =
  ({ proxy_rule_group = proxy_rule_group_ } : delete_proxy_rules_response)

let make_delete_proxy_rules_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ~rules:(rules_ : resource_name_list) () =
  ({
     rules = rules_;
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
   }
    : delete_proxy_rules_request)

let make_delete_proxy_rule_group_response
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({ proxy_rule_group_arn = proxy_rule_group_arn_; proxy_rule_group_name = proxy_rule_group_name_ }
    : delete_proxy_rule_group_response)

let make_delete_proxy_rule_group_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option) () =
  ({ proxy_rule_group_arn = proxy_rule_group_arn_; proxy_rule_group_name = proxy_rule_group_name_ }
    : delete_proxy_rule_group_request)

let make_delete_proxy_configuration_response
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option) () =
  ({
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : delete_proxy_configuration_response)

let make_delete_proxy_configuration_request
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option) () =
  ({
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : delete_proxy_configuration_request)

let make_delete_proxy_response ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?proxy_name:(proxy_name_ : resource_name option)
    ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option) () =
  ({ proxy_arn = proxy_arn_; proxy_name = proxy_name_; nat_gateway_id = nat_gateway_id_ }
    : delete_proxy_response)

let make_delete_proxy_request ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?proxy_name:(proxy_name_ : resource_name option)
    ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id) () =
  ({ proxy_arn = proxy_arn_; proxy_name = proxy_name_; nat_gateway_id = nat_gateway_id_ }
    : delete_proxy_request)

let make_delete_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status)
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
   }
    : delete_network_firewall_transit_gateway_attachment_response)

let make_delete_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : delete_network_firewall_transit_gateway_attachment_request)

let make_delete_firewall_policy_response
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response) () =
  ({ firewall_policy_response = firewall_policy_response_ } : delete_firewall_policy_response)

let make_delete_firewall_policy_request
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option) () =
  ({ firewall_policy_arn = firewall_policy_arn_; firewall_policy_name = firewall_policy_name_ }
    : delete_firewall_policy_request)

let make_delete_firewall_response ?firewall_status:(firewall_status_ : firewall_status option)
    ?firewall:(firewall_ : firewall option) () =
  ({ firewall_status = firewall_status_; firewall = firewall_ } : delete_firewall_response)

let make_delete_firewall_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) () =
  ({ firewall_arn = firewall_arn_; firewall_name = firewall_name_ } : delete_firewall_request)

let make_delete_container_association_response
    ?status:(status_ : container_association_status option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     status = status_;
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : delete_container_association_response)

let make_delete_container_association_request
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : delete_container_association_request)

let make_create_vpc_endpoint_association_response
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option)
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option) () =
  ({
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
     vpc_endpoint_association = vpc_endpoint_association_;
   }
    : create_vpc_endpoint_association_response)

let make_create_vpc_endpoint_association_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~subnet_mapping:(subnet_mapping_ : subnet_mapping) ~vpc_id:(vpc_id_ : vpc_id)
    ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     tags = tags_;
     description = description_;
     subnet_mapping = subnet_mapping_;
     vpc_id = vpc_id_;
     firewall_arn = firewall_arn_;
   }
    : create_vpc_endpoint_association_request)

let make_create_tls_inspection_configuration_response
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response)
    ~update_token:(update_token_ : update_token) () =
  ({
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
     update_token = update_token_;
   }
    : create_tls_inspection_configuration_response)

let make_create_tls_inspection_configuration_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : description option)
    ~tls_inspection_configuration:(tls_inspection_configuration_ : tls_inspection_configuration)
    ~tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name) () =
  ({
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     description = description_;
     tls_inspection_configuration = tls_inspection_configuration_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
   }
    : create_tls_inspection_configuration_request)

let make_create_rule_group_response
    ~rule_group_response:(rule_group_response_ : rule_group_response)
    ~update_token:(update_token_ : update_token) () =
  ({ rule_group_response = rule_group_response_; update_token = update_token_ }
    : create_rule_group_response)

let make_create_rule_group_request
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ?analyze_rule_group:(analyze_rule_group_ : boolean_ option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?dry_run:(dry_run_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ?rules:(rules_ : rules_string option)
    ?rule_group:(rule_group_ : rule_group option) ~capacity:(capacity_ : rule_capacity)
    ~type_:(type__ : rule_group_type) ~rule_group_name:(rule_group_name_ : resource_name) () =
  ({
     summary_configuration = summary_configuration_;
     analyze_rule_group = analyze_rule_group_;
     source_metadata = source_metadata_;
     encryption_configuration = encryption_configuration_;
     dry_run = dry_run_;
     tags = tags_;
     capacity = capacity_;
     description = description_;
     type_ = type__;
     rules = rules_;
     rule_group = rule_group_;
     rule_group_name = rule_group_name_;
   }
    : create_rule_group_request)

let make_create_proxy_rules_response ?update_token:(update_token_ : update_token option)
    ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option) () =
  ({ update_token = update_token_; proxy_rule_group = proxy_rule_group_ }
    : create_proxy_rules_response)

let make_create_proxy_rule ?insert_position:(insert_position_ : insert_position option)
    ?conditions:(conditions_ : proxy_rule_condition_list option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?description:(description_ : description option)
    ?proxy_rule_name:(proxy_rule_name_ : resource_name option) () =
  ({
     insert_position = insert_position_;
     conditions = conditions_;
     action = action_;
     description = description_;
     proxy_rule_name = proxy_rule_name_;
   }
    : create_proxy_rule)

let make_create_proxy_rules_by_request_phase
    ?post_respons_e:(post_respons_e_ : create_proxy_rule_list option)
    ?pre_reques_t:(pre_reques_t_ : create_proxy_rule_list option)
    ?pre_dn_s:(pre_dn_s_ : create_proxy_rule_list option) () =
  ({ post_respons_e = post_respons_e_; pre_reques_t = pre_reques_t_; pre_dn_s = pre_dn_s_ }
    : create_proxy_rules_by_request_phase)

let make_create_proxy_rules_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ~rules:(rules_ : create_proxy_rules_by_request_phase) () =
  ({
     rules = rules_;
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
   }
    : create_proxy_rules_request)

let make_create_proxy_rule_group_response ?update_token:(update_token_ : update_token option)
    ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option) () =
  ({ update_token = update_token_; proxy_rule_group = proxy_rule_group_ }
    : create_proxy_rule_group_response)

let make_create_proxy_rule_group_request ?tags:(tags_ : tag_list option)
    ?rules:(rules_ : proxy_rules_by_request_phase option)
    ?description:(description_ : description option)
    ~proxy_rule_group_name:(proxy_rule_group_name_ : resource_name) () =
  ({
     tags = tags_;
     rules = rules_;
     description = description_;
     proxy_rule_group_name = proxy_rule_group_name_;
   }
    : create_proxy_rule_group_request)

let make_create_proxy_configuration_response ?update_token:(update_token_ : update_token option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) () =
  ({ update_token = update_token_; proxy_configuration = proxy_configuration_ }
    : create_proxy_configuration_response)

let make_create_proxy_configuration_request ?tags:(tags_ : tag_list option)
    ?rule_group_arns:(rule_group_arns_ : resource_arn_list option)
    ?rule_group_names:(rule_group_names_ : resource_name_list option)
    ?description:(description_ : description option)
    ~default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request)
    ~proxy_configuration_name:(proxy_configuration_name_ : resource_name) () =
  ({
     tags = tags_;
     default_rule_phase_actions = default_rule_phase_actions_;
     rule_group_arns = rule_group_arns_;
     rule_group_names = rule_group_names_;
     description = description_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : create_proxy_configuration_request)

let make_create_proxy_response ?update_token:(update_token_ : update_token option)
    ?proxy:(proxy_ : proxy option) () =
  ({ update_token = update_token_; proxy = proxy_ } : create_proxy_response)

let make_create_proxy_request ?tags:(tags_ : tag_list option)
    ?listener_properties:(listener_properties_ : listener_properties_request option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ~tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties_request)
    ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id) ~proxy_name:(proxy_name_ : resource_name) ()
    =
  ({
     tags = tags_;
     tls_intercept_properties = tls_intercept_properties_;
     listener_properties = listener_properties_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
     nat_gateway_id = nat_gateway_id_;
     proxy_name = proxy_name_;
   }
    : create_proxy_request)

let make_create_firewall_policy_response
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response)
    ~update_token:(update_token_ : update_token) () =
  ({ firewall_policy_response = firewall_policy_response_; update_token = update_token_ }
    : create_firewall_policy_response)

let make_create_firewall_policy_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?dry_run:(dry_run_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~firewall_policy:(firewall_policy_ : firewall_policy)
    ~firewall_policy_name:(firewall_policy_name_ : resource_name) () =
  ({
     encryption_configuration = encryption_configuration_;
     dry_run = dry_run_;
     tags = tags_;
     description = description_;
     firewall_policy = firewall_policy_;
     firewall_policy_name = firewall_policy_name_;
   }
    : create_firewall_policy_request)

let make_create_firewall_response ?firewall_status:(firewall_status_ : firewall_status option)
    ?firewall:(firewall_ : firewall option) () =
  ({ firewall_status = firewall_status_; firewall = firewall_ } : create_firewall_response)

let make_create_firewall_request
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?transit_gateway_id:(transit_gateway_id_ : transit_gateway_id option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : description option)
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option)
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option) ?vpc_id:(vpc_id_ : vpc_id option)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn)
    ~firewall_name:(firewall_name_ : resource_name) () =
  ({
     availability_zone_change_protection = availability_zone_change_protection_;
     availability_zone_mappings = availability_zone_mappings_;
     transit_gateway_id = transit_gateway_id_;
     enabled_analysis_types = enabled_analysis_types_;
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     description = description_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
     subnet_change_protection = subnet_change_protection_;
     delete_protection = delete_protection_;
     subnet_mappings = subnet_mappings_;
     vpc_id = vpc_id_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_name = firewall_name_;
   }
    : create_firewall_request)

let make_create_container_association_response ?update_token:(update_token_ : update_token option)
    ?tags:(tags_ : tag_list option) ?status:(status_ : container_association_status option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?type_:(type__ : container_monitoring_type option)
    ?description:(description_ : description option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?container_association_name:(container_association_name_ : resource_name option) () =
  ({
     update_token = update_token_;
     tags = tags_;
     status = status_;
     container_monitoring_configurations = container_monitoring_configurations_;
     type_ = type__;
     description = description_;
     container_association_arn = container_association_arn_;
     container_association_name = container_association_name_;
   }
    : create_container_association_response)

let make_create_container_association_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations)
    ~type_:(type__ : container_monitoring_type)
    ~container_association_name:(container_association_name_ : resource_name) () =
  ({
     tags = tags_;
     container_monitoring_configurations = container_monitoring_configurations_;
     type_ = type__;
     description = description_;
     container_association_name = container_association_name_;
   }
    : create_container_association_request)

let make_attach_rule_groups_to_proxy_configuration_response
    ?update_token:(update_token_ : update_token option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) () =
  ({ update_token = update_token_; proxy_configuration = proxy_configuration_ }
    : attach_rule_groups_to_proxy_configuration_response)

let make_attach_rule_groups_to_proxy_configuration_request
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ~update_token:(update_token_ : update_token)
    ~rule_groups:(rule_groups_ : proxy_rule_group_attachment_list) () =
  ({
     update_token = update_token_;
     rule_groups = rule_groups_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_configuration_name = proxy_configuration_name_;
   }
    : attach_rule_groups_to_proxy_configuration_request)

let make_associate_subnets_response ?update_token:(update_token_ : update_token option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     subnet_mappings = subnet_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : associate_subnets_response)

let make_associate_subnets_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~subnet_mappings:(subnet_mappings_ : subnet_mappings) () =
  ({
     subnet_mappings = subnet_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : associate_subnets_request)

let make_associate_firewall_policy_response ?update_token:(update_token_ : update_token option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : associate_firewall_policy_response)

let make_associate_firewall_policy_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn) () =
  ({
     firewall_policy_arn = firewall_policy_arn_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : associate_firewall_policy_request)

let make_associate_availability_zones_response ?update_token:(update_token_ : update_token option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({
     update_token = update_token_;
     availability_zone_mappings = availability_zone_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
   }
    : associate_availability_zones_response)

let make_associate_availability_zones_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option)
    ~availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings) () =
  ({
     availability_zone_mappings = availability_zone_mappings_;
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     update_token = update_token_;
   }
    : associate_availability_zones_request)

let make_accept_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status)
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
   }
    : accept_network_firewall_transit_gateway_attachment_response)

let make_accept_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : accept_network_firewall_transit_gateway_attachment_request)
