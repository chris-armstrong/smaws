open Types

let make_attachment ?subnet_id:(subnet_id_ : az_subnet option)
    ?endpoint_id:(endpoint_id_ : endpoint_id option) ?status:(status_ : attachment_status option)
    ?status_message:(status_message_ : status_message option) () =
  ({
     subnet_id = subnet_id_;
     endpoint_id = endpoint_id_;
     status = status_;
     status_message = status_message_;
   }
    : attachment)

let make_az_sync_state ?attachment:(attachment_ : attachment option) () =
  ({ attachment = attachment_ } : az_sync_state)

let make_accept_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status) () =
  ({
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
   }
    : accept_network_firewall_transit_gateway_attachment_response)

let make_accept_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : accept_network_firewall_transit_gateway_attachment_request)

let make_dimension ~value:(value_ : dimension_value) () = ({ value = value_ } : dimension)

let make_publish_metric_action ~dimensions:(dimensions_ : dimensions) () =
  ({ dimensions = dimensions_ } : publish_metric_action)

let make_action_definition
    ?publish_metric_action:(publish_metric_action_ : publish_metric_action option) () =
  ({ publish_metric_action = publish_metric_action_ } : action_definition)

let make_address ~address_definition:(address_definition_ : address_definition) () =
  ({ address_definition = address_definition_ } : address)

let make_analysis_report ?analysis_report_id:(analysis_report_id_ : analysis_report_id option)
    ?analysis_type:(analysis_type_ : enabled_analysis_type option)
    ?report_time:(report_time_ : report_time option) ?status:(status_ : status option) () =
  ({
     analysis_report_id = analysis_report_id_;
     analysis_type = analysis_type_;
     report_time = report_time_;
     status = status_;
   }
    : analysis_report)

let make_unique_sources ?count:(count_ : count option) () = ({ count = count_ } : unique_sources)
let make_hits ?count:(count_ : count option) () = ({ count = count_ } : hits)

let make_availability_zone_mapping
    ~availability_zone:(availability_zone_ : availability_zone_mapping_string) () =
  ({ availability_zone = availability_zone_ } : availability_zone_mapping)

let make_associate_availability_zones_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_mappings = availability_zone_mappings_;
     update_token = update_token_;
   }
    : associate_availability_zones_response)

let make_associate_availability_zones_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_mappings = availability_zone_mappings_;
   }
    : associate_availability_zones_request)

let make_associate_firewall_policy_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     firewall_policy_arn = firewall_policy_arn_;
     update_token = update_token_;
   }
    : associate_firewall_policy_response)

let make_associate_firewall_policy_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     firewall_policy_arn = firewall_policy_arn_;
   }
    : associate_firewall_policy_request)

let make_subnet_mapping ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ~subnet_id:(subnet_id_ : collection_member__string) () =
  ({ subnet_id = subnet_id_; ip_address_type = ip_address_type_ } : subnet_mapping)

let make_associate_subnets_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_mappings = subnet_mappings_;
     update_token = update_token_;
   }
    : associate_subnets_response)

let make_associate_subnets_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~subnet_mappings:(subnet_mappings_ : subnet_mappings) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_mappings = subnet_mappings_;
   }
    : associate_subnets_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_proxy_config_default_rule_phase_actions_request
    ?pre_dn_s:(pre_dn_s_ : proxy_rule_phase_action option)
    ?pre_reques_t:(pre_reques_t_ : proxy_rule_phase_action option)
    ?post_respons_e:(post_respons_e_ : proxy_rule_phase_action option) () =
  ({ pre_dn_s = pre_dn_s_; pre_reques_t = pre_reques_t_; post_respons_e = post_respons_e_ }
    : proxy_config_default_rule_phase_actions_request)

let make_proxy_config_rule_group
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?type_:(type__ : proxy_config_rule_group_type option)
    ?priority:(priority_ : proxy_config_rule_group_priority option) () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     type_ = type__;
     priority = priority_;
   }
    : proxy_config_rule_group)

let make_proxy_configuration
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?create_time:(create_time_ : create_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?rule_groups:(rule_groups_ : proxy_config_rule_group_set option)
    ?default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request option)
    ?tags:(tags_ : tag_list option) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     description = description_;
     create_time = create_time_;
     delete_time = delete_time_;
     rule_groups = rule_groups_;
     default_rule_phase_actions = default_rule_phase_actions_;
     tags = tags_;
   }
    : proxy_configuration)

let make_attach_rule_groups_to_proxy_configuration_response
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_configuration = proxy_configuration_; update_token = update_token_ }
    : attach_rule_groups_to_proxy_configuration_response)

let make_proxy_rule_group_attachment
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?insert_position:(insert_position_ : insert_position option) () =
  ({ proxy_rule_group_name = proxy_rule_group_name_; insert_position = insert_position_ }
    : proxy_rule_group_attachment)

let make_attach_rule_groups_to_proxy_configuration_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ~rule_groups:(rule_groups_ : proxy_rule_group_attachment_list)
    ~update_token:(update_token_ : update_token) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     rule_groups = rule_groups_;
     update_token = update_token_;
   }
    : attach_rule_groups_to_proxy_configuration_request)

let make_availability_zone_metadata ?ip_address_type:(ip_address_type_ : ip_address_type option) ()
    =
  ({ ip_address_type = ip_address_type_ } : availability_zone_metadata)

let make_ip_set_metadata ?resolved_cidr_count:(resolved_cidr_count_ : cidr_count option) () =
  ({ resolved_cidr_count = resolved_cidr_count_ } : ip_set_metadata)

let make_cidr_summary ?available_cidr_count:(available_cidr_count_ : cidr_count option)
    ?utilized_cidr_count:(utilized_cidr_count_ : cidr_count option)
    ?ip_set_references:(ip_set_references_ : ip_set_metadata_map option) () =
  ({
     available_cidr_count = available_cidr_count_;
     utilized_cidr_count = utilized_cidr_count_;
     ip_set_references = ip_set_references_;
   }
    : cidr_summary)

let make_capacity_usage_summary ?cid_rs:(cid_rs_ : cidr_summary option) () =
  ({ cid_rs = cid_rs_ } : capacity_usage_summary)

let make_tls_certificate_data ?certificate_arn:(certificate_arn_ : resource_arn option)
    ?certificate_serial:(certificate_serial_ : collection_member__string option)
    ?status:(status_ : collection_member__string option)
    ?status_message:(status_message_ : status_reason option) () =
  ({
     certificate_arn = certificate_arn_;
     certificate_serial = certificate_serial_;
     status = status_;
     status_message = status_message_;
   }
    : tls_certificate_data)

let make_check_certificate_revocation_status_actions
    ?revoked_status_action:(revoked_status_action_ : revocation_check_action option)
    ?unknown_status_action:(unknown_status_action_ : revocation_check_action option) () =
  ({
     revoked_status_action = revoked_status_action_;
     unknown_status_action = unknown_status_action_;
   }
    : check_certificate_revocation_status_actions)

let make_container_association_summary ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) () =
  ({ arn = arn_; name = name_ } : container_association_summary)

let make_container_attribute ~key:(key_ : container_attribute_key)
    ~value:(value_ : container_attribute_value) () =
  ({ key = key_; value = value_ } : container_attribute)

let make_container_monitoring_configuration
    ?attribute_filters:(attribute_filters_ : container_attributes option)
    ~cluster_arn:(cluster_arn_ : resource_arn) () =
  ({ cluster_arn = cluster_arn_; attribute_filters = attribute_filters_ }
    : container_monitoring_configuration)

let make_create_container_association_response
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?type_:(type__ : container_monitoring_type option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?status:(status_ : container_association_status option) ?tags:(tags_ : tag_list option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
     description = description_;
     type_ = type__;
     container_monitoring_configurations = container_monitoring_configurations_;
     status = status_;
     tags = tags_;
     update_token = update_token_;
   }
    : create_container_association_response)

let make_create_container_association_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option)
    ~container_association_name:(container_association_name_ : resource_name)
    ~type_:(type__ : container_monitoring_type)
    ~container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations) () =
  ({
     container_association_name = container_association_name_;
     description = description_;
     type_ = type__;
     container_monitoring_configurations = container_monitoring_configurations_;
     tags = tags_;
   }
    : create_container_association_request)

let make_transit_gateway_attachment_sync_state
    ?attachment_id:(attachment_id_ : attachment_id option)
    ?transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status option)
    ?status_message:(status_message_ : transit_gateway_attachment_sync_state_message option) () =
  ({
     attachment_id = attachment_id_;
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
     status_message = status_message_;
   }
    : transit_gateway_attachment_sync_state)

let make_per_object_status ?sync_status:(sync_status_ : per_object_sync_status option)
    ?update_token:(update_token_ : update_token option) () =
  ({ sync_status = sync_status_; update_token = update_token_ } : per_object_status)

let make_sync_state ?attachment:(attachment_ : attachment option)
    ?config:(config_ : sync_state_config option) () =
  ({ attachment = attachment_; config = config_ } : sync_state)

let make_firewall_status ?sync_states:(sync_states_ : sync_states option)
    ?capacity_usage_summary:(capacity_usage_summary_ : capacity_usage_summary option)
    ?transit_gateway_attachment_sync_state:
      (transit_gateway_attachment_sync_state_ : transit_gateway_attachment_sync_state option)
    ~status:(status_ : firewall_status_value)
    ~configuration_sync_state_summary:(configuration_sync_state_summary_ : configuration_sync_state)
    () =
  ({
     status = status_;
     configuration_sync_state_summary = configuration_sync_state_summary_;
     sync_states = sync_states_;
     capacity_usage_summary = capacity_usage_summary_;
     transit_gateway_attachment_sync_state = transit_gateway_attachment_sync_state_;
   }
    : firewall_status)

let make_encryption_configuration ?key_id:(key_id_ : key_id option)
    ~type_:(type__ : encryption_type) () =
  ({ key_id = key_id_; type_ = type__ } : encryption_configuration)

let make_firewall ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option)
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?transit_gateway_id:(transit_gateway_id_ : transit_gateway_id option)
    ?transit_gateway_owner_account_id:(transit_gateway_owner_account_id_ : aws_account_id option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn) ~vpc_id:(vpc_id_ : vpc_id)
    ~subnet_mappings:(subnet_mappings_ : subnet_mappings) ~firewall_id:(firewall_id_ : resource_id)
    () =
  ({
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     firewall_policy_arn = firewall_policy_arn_;
     vpc_id = vpc_id_;
     subnet_mappings = subnet_mappings_;
     delete_protection = delete_protection_;
     subnet_change_protection = subnet_change_protection_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
     description = description_;
     firewall_id = firewall_id_;
     tags = tags_;
     encryption_configuration = encryption_configuration_;
     number_of_associations = number_of_associations_;
     enabled_analysis_types = enabled_analysis_types_;
     transit_gateway_id = transit_gateway_id_;
     transit_gateway_owner_account_id = transit_gateway_owner_account_id_;
     availability_zone_mappings = availability_zone_mappings_;
     availability_zone_change_protection = availability_zone_change_protection_;
   }
    : firewall)

let make_create_firewall_response ?firewall:(firewall_ : firewall option)
    ?firewall_status:(firewall_status_ : firewall_status option) () =
  ({ firewall = firewall_; firewall_status = firewall_status_ } : create_firewall_response)

let make_create_firewall_request ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option)
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?transit_gateway_id:(transit_gateway_id_ : transit_gateway_id option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option)
    ~firewall_name:(firewall_name_ : resource_name)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn) () =
  ({
     firewall_name = firewall_name_;
     firewall_policy_arn = firewall_policy_arn_;
     vpc_id = vpc_id_;
     subnet_mappings = subnet_mappings_;
     delete_protection = delete_protection_;
     subnet_change_protection = subnet_change_protection_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
     description = description_;
     tags = tags_;
     encryption_configuration = encryption_configuration_;
     enabled_analysis_types = enabled_analysis_types_;
     transit_gateway_id = transit_gateway_id_;
     availability_zone_mappings = availability_zone_mappings_;
     availability_zone_change_protection = availability_zone_change_protection_;
   }
    : create_firewall_request)

let make_firewall_policy_response ?description:(description_ : description option)
    ?firewall_policy_status:(firewall_policy_status_ : resource_status option)
    ?tags:(tags_ : tag_list option)
    ?consumed_stateless_rule_capacity:(consumed_stateless_rule_capacity_ : rule_capacity option)
    ?consumed_stateful_rule_capacity:(consumed_stateful_rule_capacity_ : rule_capacity option)
    ?consumed_stateful_domain_capacity:(consumed_stateful_domain_capacity_ : rule_capacity option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ~firewall_policy_name:(firewall_policy_name_ : resource_name)
    ~firewall_policy_arn:(firewall_policy_arn_ : resource_arn)
    ~firewall_policy_id:(firewall_policy_id_ : resource_id) () =
  ({
     firewall_policy_name = firewall_policy_name_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_policy_id = firewall_policy_id_;
     description = description_;
     firewall_policy_status = firewall_policy_status_;
     tags = tags_;
     consumed_stateless_rule_capacity = consumed_stateless_rule_capacity_;
     consumed_stateful_rule_capacity = consumed_stateful_rule_capacity_;
     consumed_stateful_domain_capacity = consumed_stateful_domain_capacity_;
     number_of_associations = number_of_associations_;
     encryption_configuration = encryption_configuration_;
     last_modified_time = last_modified_time_;
   }
    : firewall_policy_response)

let make_create_firewall_policy_response ~update_token:(update_token_ : update_token)
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response) () =
  ({ update_token = update_token_; firewall_policy_response = firewall_policy_response_ }
    : create_firewall_policy_response)

let make_ip_set ~definition:(definition_ : variable_definition_list) () =
  ({ definition = definition_ } : ip_set)

let make_policy_variables ?rule_variables:(rule_variables_ : ip_sets option) () =
  ({ rule_variables = rule_variables_ } : policy_variables)

let make_flow_timeouts
    ?tcp_idle_timeout_seconds:(tcp_idle_timeout_seconds_ : tcp_idle_timeout_range_bound option) () =
  ({ tcp_idle_timeout_seconds = tcp_idle_timeout_seconds_ } : flow_timeouts)

let make_stateful_engine_options ?rule_order:(rule_order_ : rule_order option)
    ?stream_exception_policy:(stream_exception_policy_ : stream_exception_policy option)
    ?flow_timeouts:(flow_timeouts_ : flow_timeouts option) () =
  ({
     rule_order = rule_order_;
     stream_exception_policy = stream_exception_policy_;
     flow_timeouts = flow_timeouts_;
   }
    : stateful_engine_options)

let make_stateful_rule_group_override ?action:(action_ : override_action option) () =
  ({ action = action_ } : stateful_rule_group_override)

let make_stateful_rule_group_reference ?priority:(priority_ : priority option)
    ?override:(override_ : stateful_rule_group_override option)
    ?deep_threat_inspection:(deep_threat_inspection_ : deep_threat_inspection option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
     resource_arn = resource_arn_;
     priority = priority_;
     override = override_;
     deep_threat_inspection = deep_threat_inspection_;
   }
    : stateful_rule_group_reference)

let make_custom_action ~action_name:(action_name_ : action_name)
    ~action_definition:(action_definition_ : action_definition) () =
  ({ action_name = action_name_; action_definition = action_definition_ } : custom_action)

let make_stateless_rule_group_reference ~resource_arn:(resource_arn_ : resource_arn)
    ~priority:(priority_ : priority) () =
  ({ resource_arn = resource_arn_; priority = priority_ } : stateless_rule_group_reference)

let make_firewall_policy
    ?stateless_rule_group_references:
      (stateless_rule_group_references_ : stateless_rule_group_references option)
    ?stateless_custom_actions:(stateless_custom_actions_ : custom_actions option)
    ?stateful_rule_group_references:
      (stateful_rule_group_references_ : stateful_rule_group_references option)
    ?stateful_default_actions:(stateful_default_actions_ : stateful_actions option)
    ?stateful_engine_options:(stateful_engine_options_ : stateful_engine_options option)
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ?policy_variables:(policy_variables_ : policy_variables option)
    ?enable_tls_session_holding:(enable_tls_session_holding_ : enable_tls_session_holding option)
    ~stateless_default_actions:(stateless_default_actions_ : stateless_actions)
    ~stateless_fragment_default_actions:(stateless_fragment_default_actions_ : stateless_actions) ()
    =
  ({
     stateless_rule_group_references = stateless_rule_group_references_;
     stateless_default_actions = stateless_default_actions_;
     stateless_fragment_default_actions = stateless_fragment_default_actions_;
     stateless_custom_actions = stateless_custom_actions_;
     stateful_rule_group_references = stateful_rule_group_references_;
     stateful_default_actions = stateful_default_actions_;
     stateful_engine_options = stateful_engine_options_;
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     policy_variables = policy_variables_;
     enable_tls_session_holding = enable_tls_session_holding_;
   }
    : firewall_policy)

let make_create_firewall_policy_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ?dry_run:(dry_run_ : boolean_ option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~firewall_policy_name:(firewall_policy_name_ : resource_name)
    ~firewall_policy:(firewall_policy_ : firewall_policy) () =
  ({
     firewall_policy_name = firewall_policy_name_;
     firewall_policy = firewall_policy_;
     description = description_;
     tags = tags_;
     dry_run = dry_run_;
     encryption_configuration = encryption_configuration_;
   }
    : create_firewall_policy_request)

let make_tls_intercept_properties ?pca_arn:(pca_arn_ : resource_arn option)
    ?tls_intercept_mode:(tls_intercept_mode_ : tls_intercept_mode option) () =
  ({ pca_arn = pca_arn_; tls_intercept_mode = tls_intercept_mode_ } : tls_intercept_properties)

let make_listener_property ?port:(port_ : nat_gateway_port option)
    ?type_:(type__ : listener_property_type option) () =
  ({ port = port_; type_ = type__ } : listener_property)

let make_proxy ?create_time:(create_time_ : create_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?update_time:(update_time_ : update_time option)
    ?failure_code:(failure_code_ : failure_code option)
    ?failure_message:(failure_message_ : failure_message option)
    ?proxy_state:(proxy_state_ : proxy_state option)
    ?proxy_modify_state:(proxy_modify_state_ : proxy_modify_state option)
    ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?proxy_name:(proxy_name_ : resource_name option) ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?listener_properties:(listener_properties_ : listener_properties option)
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties option)
    ?tags:(tags_ : tag_list option) () =
  ({
     create_time = create_time_;
     delete_time = delete_time_;
     update_time = update_time_;
     failure_code = failure_code_;
     failure_message = failure_message_;
     proxy_state = proxy_state_;
     proxy_modify_state = proxy_modify_state_;
     nat_gateway_id = nat_gateway_id_;
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     proxy_name = proxy_name_;
     proxy_arn = proxy_arn_;
     listener_properties = listener_properties_;
     tls_intercept_properties = tls_intercept_properties_;
     tags = tags_;
   }
    : proxy)

let make_create_proxy_response ?proxy:(proxy_ : proxy option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy = proxy_; update_token = update_token_ } : create_proxy_response)

let make_tls_intercept_properties_request ?pca_arn:(pca_arn_ : resource_arn option)
    ?tls_intercept_mode:(tls_intercept_mode_ : tls_intercept_mode option) () =
  ({ pca_arn = pca_arn_; tls_intercept_mode = tls_intercept_mode_ }
    : tls_intercept_properties_request)

let make_listener_property_request ~port:(port_ : nat_gateway_port)
    ~type_:(type__ : listener_property_type) () =
  ({ port = port_; type_ = type__ } : listener_property_request)

let make_create_proxy_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?listener_properties:(listener_properties_ : listener_properties_request option)
    ?tags:(tags_ : tag_list option) ~proxy_name:(proxy_name_ : resource_name)
    ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id)
    ~tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties_request) () =
  ({
     proxy_name = proxy_name_;
     nat_gateway_id = nat_gateway_id_;
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     listener_properties = listener_properties_;
     tls_intercept_properties = tls_intercept_properties_;
     tags = tags_;
   }
    : create_proxy_request)

let make_create_proxy_configuration_response
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_configuration = proxy_configuration_; update_token = update_token_ }
    : create_proxy_configuration_response)

let make_create_proxy_configuration_request ?description:(description_ : description option)
    ?rule_group_names:(rule_group_names_ : resource_name_list option)
    ?rule_group_arns:(rule_group_arns_ : resource_arn_list option) ?tags:(tags_ : tag_list option)
    ~proxy_configuration_name:(proxy_configuration_name_ : resource_name)
    ~default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     description = description_;
     rule_group_names = rule_group_names_;
     rule_group_arns = rule_group_arns_;
     default_rule_phase_actions = default_rule_phase_actions_;
     tags = tags_;
   }
    : create_proxy_configuration_request)

let make_proxy_rule_condition ?condition_operator:(condition_operator_ : condition_operator option)
    ?condition_key:(condition_key_ : condition_key option)
    ?condition_values:(condition_values_ : proxy_condition_value_list option) () =
  ({
     condition_operator = condition_operator_;
     condition_key = condition_key_;
     condition_values = condition_values_;
   }
    : proxy_rule_condition)

let make_create_proxy_rule ?proxy_rule_name:(proxy_rule_name_ : resource_name option)
    ?description:(description_ : description option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?conditions:(conditions_ : proxy_rule_condition_list option)
    ?insert_position:(insert_position_ : insert_position option) () =
  ({
     proxy_rule_name = proxy_rule_name_;
     description = description_;
     action = action_;
     conditions = conditions_;
     insert_position = insert_position_;
   }
    : create_proxy_rule)

let make_proxy_rule ?proxy_rule_name:(proxy_rule_name_ : resource_name option)
    ?description:(description_ : description option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?conditions:(conditions_ : proxy_rule_condition_list option) () =
  ({
     proxy_rule_name = proxy_rule_name_;
     description = description_;
     action = action_;
     conditions = conditions_;
   }
    : proxy_rule)

let make_proxy_rules_by_request_phase ?pre_dn_s:(pre_dn_s_ : proxy_rule_list option)
    ?pre_reques_t:(pre_reques_t_ : proxy_rule_list option)
    ?post_respons_e:(post_respons_e_ : proxy_rule_list option) () =
  ({ pre_dn_s = pre_dn_s_; pre_reques_t = pre_reques_t_; post_respons_e = post_respons_e_ }
    : proxy_rules_by_request_phase)

let make_proxy_rule_group ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?create_time:(create_time_ : create_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?rules:(rules_ : proxy_rules_by_request_phase option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option) () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     create_time = create_time_;
     delete_time = delete_time_;
     rules = rules_;
     description = description_;
     tags = tags_;
   }
    : proxy_rule_group)

let make_create_proxy_rule_group_response
    ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_rule_group = proxy_rule_group_; update_token = update_token_ }
    : create_proxy_rule_group_response)

let make_create_proxy_rule_group_request ?description:(description_ : description option)
    ?rules:(rules_ : proxy_rules_by_request_phase option) ?tags:(tags_ : tag_list option)
    ~proxy_rule_group_name:(proxy_rule_group_name_ : resource_name) () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     description = description_;
     rules = rules_;
     tags = tags_;
   }
    : create_proxy_rule_group_request)

let make_create_proxy_rules_response ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_rule_group = proxy_rule_group_; update_token = update_token_ }
    : create_proxy_rules_response)

let make_create_proxy_rules_by_request_phase ?pre_dn_s:(pre_dn_s_ : create_proxy_rule_list option)
    ?pre_reques_t:(pre_reques_t_ : create_proxy_rule_list option)
    ?post_respons_e:(post_respons_e_ : create_proxy_rule_list option) () =
  ({ pre_dn_s = pre_dn_s_; pre_reques_t = pre_reques_t_; post_respons_e = post_respons_e_ }
    : create_proxy_rules_by_request_phase)

let make_create_proxy_rules_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ~rules:(rules_ : create_proxy_rules_by_request_phase) () =
  ({
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
     rules = rules_;
   }
    : create_proxy_rules_request)

let make_summary_configuration ?rule_options:(rule_options_ : summary_rule_options option) () =
  ({ rule_options = rule_options_ } : summary_configuration)

let make_source_metadata ?source_arn:(source_arn_ : resource_arn option)
    ?source_update_token:(source_update_token_ : update_token option) () =
  ({ source_arn = source_arn_; source_update_token = source_update_token_ } : source_metadata)

let make_rule_group_response ?description:(description_ : description option)
    ?type_:(type__ : rule_group_type option) ?capacity:(capacity_ : rule_capacity option)
    ?rule_group_status:(rule_group_status_ : resource_status option) ?tags:(tags_ : tag_list option)
    ?consumed_capacity:(consumed_capacity_ : rule_capacity option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?sns_topic:(sns_topic_ : resource_arn option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?analysis_results:(analysis_results_ : analysis_result_list option)
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ~rule_group_arn:(rule_group_arn_ : resource_arn)
    ~rule_group_name:(rule_group_name_ : resource_name)
    ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({
     rule_group_arn = rule_group_arn_;
     rule_group_name = rule_group_name_;
     rule_group_id = rule_group_id_;
     description = description_;
     type_ = type__;
     capacity = capacity_;
     rule_group_status = rule_group_status_;
     tags = tags_;
     consumed_capacity = consumed_capacity_;
     number_of_associations = number_of_associations_;
     encryption_configuration = encryption_configuration_;
     source_metadata = source_metadata_;
     sns_topic = sns_topic_;
     last_modified_time = last_modified_time_;
     analysis_results = analysis_results_;
     summary_configuration = summary_configuration_;
   }
    : rule_group_response)

let make_create_rule_group_response ~update_token:(update_token_ : update_token)
    ~rule_group_response:(rule_group_response_ : rule_group_response) () =
  ({ update_token = update_token_; rule_group_response = rule_group_response_ }
    : create_rule_group_response)

let make_stateful_rule_options ?rule_order:(rule_order_ : rule_order option) () =
  ({ rule_order = rule_order_ } : stateful_rule_options)

let make_tcp_flag_field ?masks:(masks_ : flags option) ~flags:(flags_ : flags) () =
  ({ flags = flags_; masks = masks_ } : tcp_flag_field)

let make_port_range ~from_port:(from_port_ : port_range_bound)
    ~to_port:(to_port_ : port_range_bound) () =
  ({ from_port = from_port_; to_port = to_port_ } : port_range)

let make_match_attributes ?sources:(sources_ : addresses option)
    ?destinations:(destinations_ : addresses option)
    ?source_ports:(source_ports_ : port_ranges option)
    ?destination_ports:(destination_ports_ : port_ranges option)
    ?protocols:(protocols_ : protocol_numbers option) ?tcp_flags:(tcp_flags_ : tcp_flags option) ()
    =
  ({
     sources = sources_;
     destinations = destinations_;
     source_ports = source_ports_;
     destination_ports = destination_ports_;
     protocols = protocols_;
     tcp_flags = tcp_flags_;
   }
    : match_attributes)

let make_rule_definition ~match_attributes:(match_attributes_ : match_attributes)
    ~actions:(actions_ : stateless_actions) () =
  ({ match_attributes = match_attributes_; actions = actions_ } : rule_definition)

let make_stateless_rule ~rule_definition:(rule_definition_ : rule_definition)
    ~priority:(priority_ : priority) () =
  ({ rule_definition = rule_definition_; priority = priority_ } : stateless_rule)

let make_stateless_rules_and_custom_actions
    ?custom_actions:(custom_actions_ : custom_actions option)
    ~stateless_rules:(stateless_rules_ : stateless_rules) () =
  ({ stateless_rules = stateless_rules_; custom_actions = custom_actions_ }
    : stateless_rules_and_custom_actions)

let make_rule_option ?settings:(settings_ : settings option) ~keyword:(keyword_ : keyword) () =
  ({ keyword = keyword_; settings = settings_ } : rule_option)

let make_header ~protocol:(protocol_ : stateful_rule_protocol) ~source:(source_ : source)
    ~source_port:(source_port_ : port) ~direction:(direction_ : stateful_rule_direction)
    ~destination:(destination_ : destination) ~destination_port:(destination_port_ : port) () =
  ({
     protocol = protocol_;
     source = source_;
     source_port = source_port_;
     direction = direction_;
     destination = destination_;
     destination_port = destination_port_;
   }
    : header)

let make_stateful_rule ~action:(action_ : stateful_action) ~header:(header_ : header)
    ~rule_options:(rule_options_ : rule_options) () =
  ({ action = action_; header = header_; rule_options = rule_options_ } : stateful_rule)

let make_rules_source_list ~targets:(targets_ : rule_targets)
    ~target_types:(target_types_ : target_types)
    ~generated_rules_type:(generated_rules_type_ : generated_rules_type) () =
  ({
     targets = targets_;
     target_types = target_types_;
     generated_rules_type = generated_rules_type_;
   }
    : rules_source_list)

let make_rules_source ?rules_string:(rules_string_ : rules_string option)
    ?rules_source_list:(rules_source_list_ : rules_source_list option)
    ?stateful_rules:(stateful_rules_ : stateful_rules option)
    ?stateless_rules_and_custom_actions:
      (stateless_rules_and_custom_actions_ : stateless_rules_and_custom_actions option) () =
  ({
     rules_string = rules_string_;
     rules_source_list = rules_source_list_;
     stateful_rules = stateful_rules_;
     stateless_rules_and_custom_actions = stateless_rules_and_custom_actions_;
   }
    : rules_source)

let make_ip_set_reference ?reference_arn:(reference_arn_ : resource_arn option) () =
  ({ reference_arn = reference_arn_ } : ip_set_reference)

let make_reference_sets ?ip_set_references:(ip_set_references_ : ip_set_reference_map option) () =
  ({ ip_set_references = ip_set_references_ } : reference_sets)

let make_port_set ?definition:(definition_ : variable_definition_list option) () =
  ({ definition = definition_ } : port_set)

let make_rule_variables ?ip_sets:(ip_sets_ : ip_sets option)
    ?port_sets:(port_sets_ : port_sets option) () =
  ({ ip_sets = ip_sets_; port_sets = port_sets_ } : rule_variables)

let make_rule_group ?rule_variables:(rule_variables_ : rule_variables option)
    ?reference_sets:(reference_sets_ : reference_sets option)
    ?stateful_rule_options:(stateful_rule_options_ : stateful_rule_options option)
    ~rules_source:(rules_source_ : rules_source) () =
  ({
     rule_variables = rule_variables_;
     reference_sets = reference_sets_;
     rules_source = rules_source_;
     stateful_rule_options = stateful_rule_options_;
   }
    : rule_group)

let make_create_rule_group_request ?rule_group:(rule_group_ : rule_group option)
    ?rules:(rules_ : rules_string option) ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ?dry_run:(dry_run_ : boolean_ option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?analyze_rule_group:(analyze_rule_group_ : boolean_ option)
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ~rule_group_name:(rule_group_name_ : resource_name) ~type_:(type__ : rule_group_type)
    ~capacity:(capacity_ : rule_capacity) () =
  ({
     rule_group_name = rule_group_name_;
     rule_group = rule_group_;
     rules = rules_;
     type_ = type__;
     description = description_;
     capacity = capacity_;
     tags = tags_;
     dry_run = dry_run_;
     encryption_configuration = encryption_configuration_;
     source_metadata = source_metadata_;
     analyze_rule_group = analyze_rule_group_;
     summary_configuration = summary_configuration_;
   }
    : create_rule_group_request)

let make_tls_inspection_configuration_response
    ?tls_inspection_configuration_status:
      (tls_inspection_configuration_status_ : resource_status option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?number_of_associations:(number_of_associations_ : number_of_associations option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?certificates:(certificates_ : certificates option)
    ?certificate_authority:(certificate_authority_ : tls_certificate_data option)
    ~tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn)
    ~tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name)
    ~tls_inspection_configuration_id:(tls_inspection_configuration_id_ : resource_id) () =
  ({
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration_id = tls_inspection_configuration_id_;
     tls_inspection_configuration_status = tls_inspection_configuration_status_;
     description = description_;
     tags = tags_;
     last_modified_time = last_modified_time_;
     number_of_associations = number_of_associations_;
     encryption_configuration = encryption_configuration_;
     certificates = certificates_;
     certificate_authority = certificate_authority_;
   }
    : tls_inspection_configuration_response)

let make_create_tls_inspection_configuration_response ~update_token:(update_token_ : update_token)
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response) () =
  ({
     update_token = update_token_;
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
   }
    : create_tls_inspection_configuration_response)

let make_server_certificate_scope ?sources:(sources_ : addresses option)
    ?destinations:(destinations_ : addresses option)
    ?source_ports:(source_ports_ : port_ranges option)
    ?destination_ports:(destination_ports_ : port_ranges option)
    ?protocols:(protocols_ : protocol_numbers option) () =
  ({
     sources = sources_;
     destinations = destinations_;
     source_ports = source_ports_;
     destination_ports = destination_ports_;
     protocols = protocols_;
   }
    : server_certificate_scope)

let make_server_certificate ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ resource_arn = resource_arn_ } : server_certificate)

let make_server_certificate_configuration
    ?server_certificates:(server_certificates_ : server_certificates option)
    ?scopes:(scopes_ : server_certificate_scopes option)
    ?certificate_authority_arn:(certificate_authority_arn_ : resource_arn option)
    ?check_certificate_revocation_status:
      (check_certificate_revocation_status_ : check_certificate_revocation_status_actions option) ()
    =
  ({
     server_certificates = server_certificates_;
     scopes = scopes_;
     certificate_authority_arn = certificate_authority_arn_;
     check_certificate_revocation_status = check_certificate_revocation_status_;
   }
    : server_certificate_configuration)

let make_tls_inspection_configuration
    ?server_certificate_configurations:
      (server_certificate_configurations_ : server_certificate_configurations option) () =
  ({ server_certificate_configurations = server_certificate_configurations_ }
    : tls_inspection_configuration)

let make_create_tls_inspection_configuration_request
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name)
    ~tls_inspection_configuration:(tls_inspection_configuration_ : tls_inspection_configuration) ()
    =
  ({
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration = tls_inspection_configuration_;
     description = description_;
     tags = tags_;
     encryption_configuration = encryption_configuration_;
   }
    : create_tls_inspection_configuration_request)

let make_vpc_endpoint_association_status
    ?association_sync_state:(association_sync_state_ : association_sync_state option)
    ~status:(status_ : firewall_status_value) () =
  ({ status = status_; association_sync_state = association_sync_state_ }
    : vpc_endpoint_association_status)

let make_vpc_endpoint_association
    ?vpc_endpoint_association_id:(vpc_endpoint_association_id_ : resource_id option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn)
    ~firewall_arn:(firewall_arn_ : resource_arn) ~vpc_id:(vpc_id_ : vpc_id)
    ~subnet_mapping:(subnet_mapping_ : subnet_mapping) () =
  ({
     vpc_endpoint_association_id = vpc_endpoint_association_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     firewall_arn = firewall_arn_;
     vpc_id = vpc_id_;
     subnet_mapping = subnet_mapping_;
     description = description_;
     tags = tags_;
   }
    : vpc_endpoint_association)

let make_create_vpc_endpoint_association_response
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option)
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option) () =
  ({
     vpc_endpoint_association = vpc_endpoint_association_;
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
   }
    : create_vpc_endpoint_association_response)

let make_create_vpc_endpoint_association_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~firewall_arn:(firewall_arn_ : resource_arn)
    ~vpc_id:(vpc_id_ : vpc_id) ~subnet_mapping:(subnet_mapping_ : subnet_mapping) () =
  ({
     firewall_arn = firewall_arn_;
     vpc_id = vpc_id_;
     subnet_mapping = subnet_mapping_;
     description = description_;
     tags = tags_;
   }
    : create_vpc_endpoint_association_request)

let make_delete_container_association_response
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?status:(status_ : container_association_status option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
     status = status_;
   }
    : delete_container_association_response)

let make_delete_container_association_request
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
   }
    : delete_container_association_request)

let make_delete_firewall_response ?firewall:(firewall_ : firewall option)
    ?firewall_status:(firewall_status_ : firewall_status option) () =
  ({ firewall = firewall_; firewall_status = firewall_status_ } : delete_firewall_response)

let make_delete_firewall_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ firewall_name = firewall_name_; firewall_arn = firewall_arn_ } : delete_firewall_request)

let make_delete_firewall_policy_response
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response) () =
  ({ firewall_policy_response = firewall_policy_response_ } : delete_firewall_policy_response)

let make_delete_firewall_policy_request
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option) () =
  ({ firewall_policy_name = firewall_policy_name_; firewall_policy_arn = firewall_policy_arn_ }
    : delete_firewall_policy_request)

let make_delete_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status) () =
  ({
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
   }
    : delete_network_firewall_transit_gateway_attachment_response)

let make_delete_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : delete_network_firewall_transit_gateway_attachment_request)

let make_delete_proxy_response ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option)
    ?proxy_name:(proxy_name_ : resource_name option) ?proxy_arn:(proxy_arn_ : resource_arn option)
    () =
  ({ nat_gateway_id = nat_gateway_id_; proxy_name = proxy_name_; proxy_arn = proxy_arn_ }
    : delete_proxy_response)

let make_delete_proxy_request ?proxy_name:(proxy_name_ : resource_name option)
    ?proxy_arn:(proxy_arn_ : resource_arn option) ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id)
    () =
  ({ nat_gateway_id = nat_gateway_id_; proxy_name = proxy_name_; proxy_arn = proxy_arn_ }
    : delete_proxy_request)

let make_delete_proxy_configuration_response
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
   }
    : delete_proxy_configuration_response)

let make_delete_proxy_configuration_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
   }
    : delete_proxy_configuration_request)

let make_delete_proxy_rule_group_response
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option) () =
  ({ proxy_rule_group_name = proxy_rule_group_name_; proxy_rule_group_arn = proxy_rule_group_arn_ }
    : delete_proxy_rule_group_response)

let make_delete_proxy_rule_group_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option) () =
  ({ proxy_rule_group_name = proxy_rule_group_name_; proxy_rule_group_arn = proxy_rule_group_arn_ }
    : delete_proxy_rule_group_request)

let make_delete_proxy_rules_response ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option)
    () =
  ({ proxy_rule_group = proxy_rule_group_ } : delete_proxy_rules_response)

let make_delete_proxy_rules_request
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ~rules:(rules_ : resource_name_list) () =
  ({
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_group_name = proxy_rule_group_name_;
     rules = rules_;
   }
    : delete_proxy_rules_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_rule_group_response
    ~rule_group_response:(rule_group_response_ : rule_group_response) () =
  ({ rule_group_response = rule_group_response_ } : delete_rule_group_response)

let make_delete_rule_group_request ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option) ?type_:(type__ : rule_group_type option)
    () =
  ({ rule_group_name = rule_group_name_; rule_group_arn = rule_group_arn_; type_ = type__ }
    : delete_rule_group_request)

let make_delete_tls_inspection_configuration_response
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response) () =
  ({ tls_inspection_configuration_response = tls_inspection_configuration_response_ }
    : delete_tls_inspection_configuration_response)

let make_delete_tls_inspection_configuration_request
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    () =
  ({
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
   }
    : delete_tls_inspection_configuration_request)

let make_delete_vpc_endpoint_association_response
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option)
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option) () =
  ({
     vpc_endpoint_association = vpc_endpoint_association_;
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
   }
    : delete_vpc_endpoint_association_response)

let make_delete_vpc_endpoint_association_request
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : delete_vpc_endpoint_association_request)

let make_describe_container_association_response
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?type_:(type__ : container_monitoring_type option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?status:(status_ : container_association_status option)
    ?resolved_cidr_count:(resolved_cidr_count_ : cidr_count option)
    ?last_updated_time:(last_updated_time_ : container_association_last_updated_time option)
    ?tags:(tags_ : tag_list option) ?update_token:(update_token_ : update_token option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
     description = description_;
     type_ = type__;
     container_monitoring_configurations = container_monitoring_configurations_;
     status = status_;
     resolved_cidr_count = resolved_cidr_count_;
     last_updated_time = last_updated_time_;
     tags = tags_;
     update_token = update_token_;
   }
    : describe_container_association_response)

let make_describe_container_association_request
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
   }
    : describe_container_association_request)

let make_describe_firewall_response ?update_token:(update_token_ : update_token option)
    ?firewall:(firewall_ : firewall option)
    ?firewall_status:(firewall_status_ : firewall_status option) () =
  ({ update_token = update_token_; firewall = firewall_; firewall_status = firewall_status_ }
    : describe_firewall_response)

let make_describe_firewall_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ firewall_name = firewall_name_; firewall_arn = firewall_arn_ } : describe_firewall_request)

let make_describe_firewall_metadata_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?status:(status_ : firewall_status_value option)
    ?supported_availability_zones:
      (supported_availability_zones_ : supported_availability_zones option)
    ?transit_gateway_attachment_id:
      (transit_gateway_attachment_id_ : transit_gateway_attachment_id option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_policy_arn = firewall_policy_arn_;
     description = description_;
     status = status_;
     supported_availability_zones = supported_availability_zones_;
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
   }
    : describe_firewall_metadata_response)

let make_describe_firewall_metadata_request ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ firewall_arn = firewall_arn_ } : describe_firewall_metadata_request)

let make_describe_firewall_policy_response
    ?firewall_policy:(firewall_policy_ : firewall_policy option)
    ~update_token:(update_token_ : update_token)
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response) () =
  ({
     update_token = update_token_;
     firewall_policy_response = firewall_policy_response_;
     firewall_policy = firewall_policy_;
   }
    : describe_firewall_policy_response)

let make_describe_firewall_policy_request
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option)
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option) () =
  ({ firewall_policy_name = firewall_policy_name_; firewall_policy_arn = firewall_policy_arn_ }
    : describe_firewall_policy_request)

let make_flow_filter ?source_address:(source_address_ : address option)
    ?destination_address:(destination_address_ : address option)
    ?source_port:(source_port_ : port option) ?destination_port:(destination_port_ : port option)
    ?protocols:(protocols_ : protocol_strings option) () =
  ({
     source_address = source_address_;
     destination_address = destination_address_;
     source_port = source_port_;
     destination_port = destination_port_;
     protocols = protocols_;
   }
    : flow_filter)

let make_flow_operation ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option)
    ?flow_filters:(flow_filters_ : flow_filters option) () =
  ({ minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_; flow_filters = flow_filters_ }
    : flow_operation)

let make_describe_flow_operation_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?status_message:(status_message_ : status_reason option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?flow_operation:(flow_operation_ : flow_operation option) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     flow_operation_id = flow_operation_id_;
     flow_operation_type = flow_operation_type_;
     flow_operation_status = flow_operation_status_;
     status_message = status_message_;
     flow_request_timestamp = flow_request_timestamp_;
     flow_operation = flow_operation_;
   }
    : describe_flow_operation_response)

let make_describe_flow_operation_request
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ~firewall_arn:(firewall_arn_ : resource_arn)
    ~flow_operation_id:(flow_operation_id_ : flow_operation_id) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     flow_operation_id = flow_operation_id_;
   }
    : describe_flow_operation_request)

let make_log_destination_config ~log_type:(log_type_ : log_type)
    ~log_destination_type:(log_destination_type_ : log_destination_type)
    ~log_destination:(log_destination_ : log_destination_map) () =
  ({
     log_type = log_type_;
     log_destination_type = log_destination_type_;
     log_destination = log_destination_;
   }
    : log_destination_config)

let make_logging_configuration
    ~log_destination_configs:(log_destination_configs_ : log_destination_configs) () =
  ({ log_destination_configs = log_destination_configs_ } : logging_configuration)

let make_describe_logging_configuration_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    () =
  ({
     firewall_arn = firewall_arn_;
     logging_configuration = logging_configuration_;
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
   }
    : describe_logging_configuration_response)

let make_describe_logging_configuration_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) () =
  ({ firewall_arn = firewall_arn_; firewall_name = firewall_name_ }
    : describe_logging_configuration_request)

let make_describe_proxy_resource ?proxy_name:(proxy_name_ : resource_name option)
    ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?nat_gateway_id:(nat_gateway_id_ : nat_gateway_id option)
    ?proxy_state:(proxy_state_ : proxy_state option)
    ?proxy_modify_state:(proxy_modify_state_ : proxy_modify_state option)
    ?listener_properties:(listener_properties_ : listener_properties option)
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties option)
    ?vpc_endpoint_service_name:(vpc_endpoint_service_name_ : vpc_endpoint_service_name option)
    ?private_dns_name:(private_dns_name_ : private_dns_name option)
    ?create_time:(create_time_ : create_time option)
    ?delete_time:(delete_time_ : delete_time option)
    ?update_time:(update_time_ : update_time option)
    ?failure_code:(failure_code_ : failure_code option)
    ?failure_message:(failure_message_ : failure_message option) ?tags:(tags_ : tag_list option) ()
    =
  ({
     proxy_name = proxy_name_;
     proxy_arn = proxy_arn_;
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     nat_gateway_id = nat_gateway_id_;
     proxy_state = proxy_state_;
     proxy_modify_state = proxy_modify_state_;
     listener_properties = listener_properties_;
     tls_intercept_properties = tls_intercept_properties_;
     vpc_endpoint_service_name = vpc_endpoint_service_name_;
     private_dns_name = private_dns_name_;
     create_time = create_time_;
     delete_time = delete_time_;
     update_time = update_time_;
     failure_code = failure_code_;
     failure_message = failure_message_;
     tags = tags_;
   }
    : describe_proxy_resource)

let make_describe_proxy_response ?proxy:(proxy_ : describe_proxy_resource option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy = proxy_; update_token = update_token_ } : describe_proxy_response)

let make_describe_proxy_request ?proxy_name:(proxy_name_ : resource_name option)
    ?proxy_arn:(proxy_arn_ : resource_arn option) () =
  ({ proxy_name = proxy_name_; proxy_arn = proxy_arn_ } : describe_proxy_request)

let make_describe_proxy_configuration_response
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_configuration = proxy_configuration_; update_token = update_token_ }
    : describe_proxy_configuration_response)

let make_describe_proxy_configuration_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
   }
    : describe_proxy_configuration_request)

let make_describe_proxy_rule_response ?proxy_rule:(proxy_rule_ : proxy_rule option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_rule = proxy_rule_; update_token = update_token_ } : describe_proxy_rule_response)

let make_describe_proxy_rule_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ~proxy_rule_name:(proxy_rule_name_ : resource_name) () =
  ({
     proxy_rule_name = proxy_rule_name_;
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
   }
    : describe_proxy_rule_request)

let make_describe_proxy_rule_group_response
    ?proxy_rule_group:(proxy_rule_group_ : proxy_rule_group option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_rule_group = proxy_rule_group_; update_token = update_token_ }
    : describe_proxy_rule_group_response)

let make_describe_proxy_rule_group_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option) () =
  ({ proxy_rule_group_name = proxy_rule_group_name_; proxy_rule_group_arn = proxy_rule_group_arn_ }
    : describe_proxy_rule_group_request)

let make_describe_resource_policy_response ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : describe_resource_policy_response)

let make_describe_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : describe_resource_policy_request)

let make_describe_rule_group_response ?rule_group:(rule_group_ : rule_group option)
    ~update_token:(update_token_ : update_token)
    ~rule_group_response:(rule_group_response_ : rule_group_response) () =
  ({
     update_token = update_token_;
     rule_group = rule_group_;
     rule_group_response = rule_group_response_;
   }
    : describe_rule_group_response)

let make_describe_rule_group_request ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option) ?type_:(type__ : rule_group_type option)
    ?analyze_rule_group:(analyze_rule_group_ : boolean_ option) () =
  ({
     rule_group_name = rule_group_name_;
     rule_group_arn = rule_group_arn_;
     type_ = type__;
     analyze_rule_group = analyze_rule_group_;
   }
    : describe_rule_group_request)

let make_describe_rule_group_metadata_response ?description:(description_ : description option)
    ?type_:(type__ : rule_group_type option) ?capacity:(capacity_ : rule_capacity option)
    ?stateful_rule_options:(stateful_rule_options_ : stateful_rule_options option)
    ?last_modified_time:(last_modified_time_ : last_update_time option)
    ?vendor_name:(vendor_name_ : vendor_name option) ?product_id:(product_id_ : product_id option)
    ?listing_name:(listing_name_ : listing_name option)
    ~rule_group_arn:(rule_group_arn_ : resource_arn)
    ~rule_group_name:(rule_group_name_ : resource_name) () =
  ({
     rule_group_arn = rule_group_arn_;
     rule_group_name = rule_group_name_;
     description = description_;
     type_ = type__;
     capacity = capacity_;
     stateful_rule_options = stateful_rule_options_;
     last_modified_time = last_modified_time_;
     vendor_name = vendor_name_;
     product_id = product_id_;
     listing_name = listing_name_;
   }
    : describe_rule_group_metadata_response)

let make_describe_rule_group_metadata_request
    ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option) ?type_:(type__ : rule_group_type option)
    () =
  ({ rule_group_name = rule_group_name_; rule_group_arn = rule_group_arn_; type_ = type__ }
    : describe_rule_group_metadata_request)

let make_rule_summary ?si_d:(si_d_ : collection_member__string option)
    ?msg:(msg_ : collection_member__string option)
    ?metadata:(metadata_ : collection_member__string option) () =
  ({ si_d = si_d_; msg = msg_; metadata = metadata_ } : rule_summary)

let make_summary ?rule_summaries:(rule_summaries_ : rule_summaries option) () =
  ({ rule_summaries = rule_summaries_ } : summary)

let make_describe_rule_group_summary_response ?description:(description_ : description option)
    ?summary:(summary_ : summary option) ~rule_group_name:(rule_group_name_ : resource_name) () =
  ({ rule_group_name = rule_group_name_; description = description_; summary = summary_ }
    : describe_rule_group_summary_response)

let make_describe_rule_group_summary_request
    ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group_arn:(rule_group_arn_ : resource_arn option) ?type_:(type__ : rule_group_type option)
    () =
  ({ rule_group_name = rule_group_name_; rule_group_arn = rule_group_arn_; type_ = type__ }
    : describe_rule_group_summary_request)

let make_describe_tls_inspection_configuration_response
    ?tls_inspection_configuration:
      (tls_inspection_configuration_ : tls_inspection_configuration option)
    ~update_token:(update_token_ : update_token)
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response) () =
  ({
     update_token = update_token_;
     tls_inspection_configuration = tls_inspection_configuration_;
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
   }
    : describe_tls_inspection_configuration_response)

let make_describe_tls_inspection_configuration_request
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    () =
  ({
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
   }
    : describe_tls_inspection_configuration_request)

let make_describe_vpc_endpoint_association_response
    ?vpc_endpoint_association:(vpc_endpoint_association_ : vpc_endpoint_association option)
    ?vpc_endpoint_association_status:
      (vpc_endpoint_association_status_ : vpc_endpoint_association_status option) () =
  ({
     vpc_endpoint_association = vpc_endpoint_association_;
     vpc_endpoint_association_status = vpc_endpoint_association_status_;
   }
    : describe_vpc_endpoint_association_response)

let make_describe_vpc_endpoint_association_request
    ~vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : describe_vpc_endpoint_association_request)

let make_detach_rule_groups_from_proxy_configuration_response
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_configuration = proxy_configuration_; update_token = update_token_ }
    : detach_rule_groups_from_proxy_configuration_response)

let make_detach_rule_groups_from_proxy_configuration_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ?rule_group_names:(rule_group_names_ : resource_name_list option)
    ?rule_group_arns:(rule_group_arns_ : resource_arn_list option)
    ~update_token:(update_token_ : update_token) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     rule_group_names = rule_group_names_;
     rule_group_arns = rule_group_arns_;
     update_token = update_token_;
   }
    : detach_rule_groups_from_proxy_configuration_request)

let make_disassociate_availability_zones_response
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_mappings = availability_zone_mappings_;
     update_token = update_token_;
   }
    : disassociate_availability_zones_response)

let make_disassociate_availability_zones_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~availability_zone_mappings:(availability_zone_mappings_ : availability_zone_mappings) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_mappings = availability_zone_mappings_;
   }
    : disassociate_availability_zones_request)

let make_disassociate_subnets_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_mappings = subnet_mappings_;
     update_token = update_token_;
   }
    : disassociate_subnets_response)

let make_disassociate_subnets_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option) ~subnet_ids:(subnet_ids_ : az_subnets) ()
    =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_ids = subnet_ids_;
   }
    : disassociate_subnets_request)

let make_firewall_metadata ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?transit_gateway_attachment_id:
      (transit_gateway_attachment_id_ : transit_gateway_attachment_id option) () =
  ({
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
   }
    : firewall_metadata)

let make_firewall_policy_metadata ?name:(name_ : resource_name option)
    ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : firewall_policy_metadata)

let make_flow ?source_address:(source_address_ : address option)
    ?destination_address:(destination_address_ : address option)
    ?source_port:(source_port_ : port option) ?destination_port:(destination_port_ : port option)
    ?protocol:(protocol_ : protocol_string option) ?age:(age_ : age option)
    ?packet_count:(packet_count_ : packet_count option)
    ?byte_count:(byte_count_ : byte_count option) () =
  ({
     source_address = source_address_;
     destination_address = destination_address_;
     source_port = source_port_;
     destination_port = destination_port_;
     protocol = protocol_;
     age = age_;
     packet_count = packet_count_;
     byte_count = byte_count_;
   }
    : flow)

let make_flow_operation_metadata ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option) () =
  ({
     flow_operation_id = flow_operation_id_;
     flow_operation_type = flow_operation_type_;
     flow_request_timestamp = flow_request_timestamp_;
     flow_operation_status = flow_operation_status_;
   }
    : flow_operation_metadata)

let make_get_analysis_report_results_response ?status:(status_ : status option)
    ?start_time:(start_time_ : start_time option) ?end_time:(end_time_ : end_time option)
    ?report_time:(report_time_ : report_time option)
    ?analysis_type:(analysis_type_ : enabled_analysis_type option)
    ?next_token:(next_token_ : analysis_report_next_token option)
    ?analysis_report_results:(analysis_report_results_ : analysis_report_results option) () =
  ({
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     report_time = report_time_;
     analysis_type = analysis_type_;
     next_token = next_token_;
     analysis_report_results = analysis_report_results_;
   }
    : get_analysis_report_results_response)

let make_get_analysis_report_results_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?next_token:(next_token_ : analysis_report_next_token option)
    ?max_results:(max_results_ : pagination_max_results option)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     firewall_name = firewall_name_;
     analysis_report_id = analysis_report_id_;
     firewall_arn = firewall_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_analysis_report_results_request)

let make_list_analysis_reports_response
    ?analysis_reports:(analysis_reports_ : analysis_reports option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ analysis_reports = analysis_reports_; next_token = next_token_ }
    : list_analysis_reports_response)

let make_list_analysis_reports_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({
     firewall_name = firewall_name_;
     firewall_arn = firewall_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_analysis_reports_request)

let make_list_container_associations_response
    ?container_associations:(container_associations_ : container_associations option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ container_associations = container_associations_; next_token = next_token_ }
    : list_container_associations_response)

let make_list_container_associations_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_container_associations_request)

let make_list_firewall_policies_response ?next_token:(next_token_ : pagination_token option)
    ?firewall_policies:(firewall_policies_ : firewall_policies option) () =
  ({ next_token = next_token_; firewall_policies = firewall_policies_ }
    : list_firewall_policies_response)

let make_list_firewall_policies_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_firewall_policies_request)

let make_list_firewalls_response ?next_token:(next_token_ : pagination_token option)
    ?firewalls:(firewalls_ : firewalls option) () =
  ({ next_token = next_token_; firewalls = firewalls_ } : list_firewalls_response)

let make_list_firewalls_request ?next_token:(next_token_ : pagination_token option)
    ?vpc_ids:(vpc_ids_ : vpc_ids option) ?max_results:(max_results_ : pagination_max_results option)
    () =
  ({ next_token = next_token_; vpc_ids = vpc_ids_; max_results = max_results_ }
    : list_firewalls_request)

let make_list_flow_operation_results_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option)
    ?status_message:(status_message_ : status_reason option)
    ?flow_request_timestamp:(flow_request_timestamp_ : flow_request_timestamp option)
    ?flows:(flows_ : flows option) ?next_token:(next_token_ : pagination_token option) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     flow_operation_id = flow_operation_id_;
     flow_operation_status = flow_operation_status_;
     status_message = status_message_;
     flow_request_timestamp = flow_request_timestamp_;
     flows = flows_;
     next_token = next_token_;
   }
    : list_flow_operation_results_response)

let make_list_flow_operation_results_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ~firewall_arn:(firewall_arn_ : resource_arn)
    ~flow_operation_id:(flow_operation_id_ : flow_operation_id) () =
  ({
     firewall_arn = firewall_arn_;
     flow_operation_id = flow_operation_id_;
     next_token = next_token_;
     max_results = max_results_;
     availability_zone = availability_zone_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
   }
    : list_flow_operation_results_request)

let make_list_flow_operations_response ?flow_operations:(flow_operations_ : flow_operations option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ flow_operations = flow_operations_; next_token = next_token_ } : list_flow_operations_response)

let make_list_flow_operations_request
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?flow_operation_type:(flow_operation_type_ : flow_operation_type option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option)
    ~firewall_arn:(firewall_arn_ : resource_arn) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     flow_operation_type = flow_operation_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_flow_operations_request)

let make_proxy_metadata ?name:(name_ : resource_name option) ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : proxy_metadata)

let make_list_proxies_response ?proxies:(proxies_ : proxies option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ proxies = proxies_; next_token = next_token_ } : list_proxies_response)

let make_list_proxies_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_proxies_request)

let make_proxy_configuration_metadata ?name:(name_ : resource_name option)
    ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : proxy_configuration_metadata)

let make_list_proxy_configurations_response
    ?proxy_configurations:(proxy_configurations_ : proxy_configurations option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ proxy_configurations = proxy_configurations_; next_token = next_token_ }
    : list_proxy_configurations_response)

let make_list_proxy_configurations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_proxy_configurations_request)

let make_proxy_rule_group_metadata ?name:(name_ : resource_name option)
    ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : proxy_rule_group_metadata)

let make_list_proxy_rule_groups_response
    ?proxy_rule_groups:(proxy_rule_groups_ : proxy_rule_groups option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ proxy_rule_groups = proxy_rule_groups_; next_token = next_token_ }
    : list_proxy_rule_groups_response)

let make_list_proxy_rule_groups_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_proxy_rule_groups_request)

let make_rule_group_metadata ?name:(name_ : resource_name option) ?arn:(arn_ : resource_arn option)
    ?vendor_name:(vendor_name_ : vendor_name option) () =
  ({ name = name_; arn = arn_; vendor_name = vendor_name_ } : rule_group_metadata)

let make_list_rule_groups_response ?next_token:(next_token_ : pagination_token option)
    ?rule_groups:(rule_groups_ : rule_groups option) () =
  ({ next_token = next_token_; rule_groups = rule_groups_ } : list_rule_groups_response)

let make_list_rule_groups_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?scope:(scope_ : resource_managed_status option)
    ?managed_type:(managed_type_ : resource_managed_type option)
    ?subscription_status:(subscription_status_ : subscription_status option)
    ?type_:(type__ : rule_group_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     scope = scope_;
     managed_type = managed_type_;
     subscription_status = subscription_status_;
     type_ = type__;
   }
    : list_rule_groups_request)

let make_tls_inspection_configuration_metadata ?name:(name_ : resource_name option)
    ?arn:(arn_ : resource_arn option) () =
  ({ name = name_; arn = arn_ } : tls_inspection_configuration_metadata)

let make_list_tls_inspection_configurations_response
    ?next_token:(next_token_ : pagination_token option)
    ?tls_inspection_configurations:
      (tls_inspection_configurations_ : tls_inspection_configurations option) () =
  ({ next_token = next_token_; tls_inspection_configurations = tls_inspection_configurations_ }
    : list_tls_inspection_configurations_response)

let make_list_tls_inspection_configurations_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_tls_inspection_configurations_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : pagination_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : tags_pagination_max_results option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ next_token = next_token_; max_results = max_results_; resource_arn = resource_arn_ }
    : list_tags_for_resource_request)

let make_vpc_endpoint_association_metadata
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option) () =
  ({ vpc_endpoint_association_arn = vpc_endpoint_association_arn_ }
    : vpc_endpoint_association_metadata)

let make_list_vpc_endpoint_associations_response ?next_token:(next_token_ : pagination_token option)
    ?vpc_endpoint_associations:(vpc_endpoint_associations_ : vpc_endpoint_associations option) () =
  ({ next_token = next_token_; vpc_endpoint_associations = vpc_endpoint_associations_ }
    : list_vpc_endpoint_associations_response)

let make_list_vpc_endpoint_associations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option)
    ?firewall_arn:(firewall_arn_ : resource_arn option) () =
  ({ next_token = next_token_; max_results = max_results_; firewall_arn = firewall_arn_ }
    : list_vpc_endpoint_associations_request)

let make_update_tls_inspection_configuration_response ~update_token:(update_token_ : update_token)
    ~tls_inspection_configuration_response:
      (tls_inspection_configuration_response_ : tls_inspection_configuration_response) () =
  ({
     update_token = update_token_;
     tls_inspection_configuration_response = tls_inspection_configuration_response_;
   }
    : update_tls_inspection_configuration_response)

let make_update_tls_inspection_configuration_request
    ?tls_inspection_configuration_arn:(tls_inspection_configuration_arn_ : resource_arn option)
    ?tls_inspection_configuration_name:(tls_inspection_configuration_name_ : resource_name option)
    ?description:(description_ : description option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~tls_inspection_configuration:(tls_inspection_configuration_ : tls_inspection_configuration)
    ~update_token:(update_token_ : update_token) () =
  ({
     tls_inspection_configuration_arn = tls_inspection_configuration_arn_;
     tls_inspection_configuration_name = tls_inspection_configuration_name_;
     tls_inspection_configuration = tls_inspection_configuration_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     update_token = update_token_;
   }
    : update_tls_inspection_configuration_request)

let make_update_subnet_change_protection_response
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?subnet_change_protection:(subnet_change_protection_ : boolean_ option) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_change_protection = subnet_change_protection_;
   }
    : update_subnet_change_protection_response)

let make_update_subnet_change_protection_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~subnet_change_protection:(subnet_change_protection_ : boolean_) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     subnet_change_protection = subnet_change_protection_;
   }
    : update_subnet_change_protection_request)

let make_update_rule_group_response ~update_token:(update_token_ : update_token)
    ~rule_group_response:(rule_group_response_ : rule_group_response) () =
  ({ update_token = update_token_; rule_group_response = rule_group_response_ }
    : update_rule_group_response)

let make_update_rule_group_request ?rule_group_arn:(rule_group_arn_ : resource_arn option)
    ?rule_group_name:(rule_group_name_ : resource_name option)
    ?rule_group:(rule_group_ : rule_group option) ?rules:(rules_ : rules_string option)
    ?type_:(type__ : rule_group_type option) ?description:(description_ : description option)
    ?dry_run:(dry_run_ : boolean_ option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?source_metadata:(source_metadata_ : source_metadata option)
    ?analyze_rule_group:(analyze_rule_group_ : boolean_ option)
    ?summary_configuration:(summary_configuration_ : summary_configuration option)
    ~update_token:(update_token_ : update_token) () =
  ({
     update_token = update_token_;
     rule_group_arn = rule_group_arn_;
     rule_group_name = rule_group_name_;
     rule_group = rule_group_;
     rules = rules_;
     type_ = type__;
     description = description_;
     dry_run = dry_run_;
     encryption_configuration = encryption_configuration_;
     source_metadata = source_metadata_;
     analyze_rule_group = analyze_rule_group_;
     summary_configuration = summary_configuration_;
   }
    : update_rule_group_request)

let make_proxy_rule_priority ?proxy_rule_name:(proxy_rule_name_ : resource_name option)
    ?new_position:(new_position_ : insert_position option) () =
  ({ proxy_rule_name = proxy_rule_name_; new_position = new_position_ } : proxy_rule_priority)

let make_update_proxy_rule_priorities_response
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?rule_group_request_phase:(rule_group_request_phase_ : rule_group_request_phase option)
    ?rules:(rules_ : proxy_rule_priority_list option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     rule_group_request_phase = rule_group_request_phase_;
     rules = rules_;
     update_token = update_token_;
   }
    : update_proxy_rule_priorities_response)

let make_update_proxy_rule_priorities_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ~rule_group_request_phase:(rule_group_request_phase_ : rule_group_request_phase)
    ~rules:(rules_ : proxy_rule_priority_list) ~update_token:(update_token_ : update_token) () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     rule_group_request_phase = rule_group_request_phase_;
     rules = rules_;
     update_token = update_token_;
   }
    : update_proxy_rule_priorities_request)

let make_update_proxy_rule_group_priorities_response
    ?proxy_rule_groups:(proxy_rule_groups_ : proxy_rule_group_priority_result_list option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_rule_groups = proxy_rule_groups_; update_token = update_token_ }
    : update_proxy_rule_group_priorities_response)

let make_proxy_rule_group_priority
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?new_position:(new_position_ : insert_position option) () =
  ({ proxy_rule_group_name = proxy_rule_group_name_; new_position = new_position_ }
    : proxy_rule_group_priority)

let make_update_proxy_rule_group_priorities_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ~rule_groups:(rule_groups_ : proxy_rule_group_priority_list)
    ~update_token:(update_token_ : update_token) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     rule_groups = rule_groups_;
     update_token = update_token_;
   }
    : update_proxy_rule_group_priorities_request)

let make_update_proxy_rule_response ?proxy_rule:(proxy_rule_ : proxy_rule option)
    ?removed_conditions:(removed_conditions_ : proxy_rule_condition_list option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     proxy_rule = proxy_rule_;
     removed_conditions = removed_conditions_;
     update_token = update_token_;
   }
    : update_proxy_rule_response)

let make_update_proxy_rule_request
    ?proxy_rule_group_name:(proxy_rule_group_name_ : resource_name option)
    ?proxy_rule_group_arn:(proxy_rule_group_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?action:(action_ : proxy_rule_phase_action option)
    ?add_conditions:(add_conditions_ : proxy_rule_condition_list option)
    ?remove_conditions:(remove_conditions_ : proxy_rule_condition_list option)
    ~proxy_rule_name:(proxy_rule_name_ : resource_name) ~update_token:(update_token_ : update_token)
    () =
  ({
     proxy_rule_group_name = proxy_rule_group_name_;
     proxy_rule_group_arn = proxy_rule_group_arn_;
     proxy_rule_name = proxy_rule_name_;
     description = description_;
     action = action_;
     add_conditions = add_conditions_;
     remove_conditions = remove_conditions_;
     update_token = update_token_;
   }
    : update_proxy_rule_request)

let make_update_proxy_configuration_response
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy_configuration = proxy_configuration_; update_token = update_token_ }
    : update_proxy_configuration_response)

let make_update_proxy_configuration_request
    ?proxy_configuration_name:(proxy_configuration_name_ : resource_name option)
    ?proxy_configuration_arn:(proxy_configuration_arn_ : resource_arn option)
    ~default_rule_phase_actions:
      (default_rule_phase_actions_ : proxy_config_default_rule_phase_actions_request)
    ~update_token:(update_token_ : update_token) () =
  ({
     proxy_configuration_name = proxy_configuration_name_;
     proxy_configuration_arn = proxy_configuration_arn_;
     default_rule_phase_actions = default_rule_phase_actions_;
     update_token = update_token_;
   }
    : update_proxy_configuration_request)

let make_update_proxy_response ?proxy:(proxy_ : proxy option)
    ?update_token:(update_token_ : update_token option) () =
  ({ proxy = proxy_; update_token = update_token_ } : update_proxy_response)

let make_update_proxy_request ?proxy_name:(proxy_name_ : resource_name option)
    ?proxy_arn:(proxy_arn_ : resource_arn option)
    ?listener_properties_to_add:(listener_properties_to_add_ : listener_properties_request option)
    ?listener_properties_to_remove:
      (listener_properties_to_remove_ : listener_properties_request option)
    ?tls_intercept_properties:(tls_intercept_properties_ : tls_intercept_properties_request option)
    ~nat_gateway_id:(nat_gateway_id_ : nat_gateway_id) ~update_token:(update_token_ : update_token)
    () =
  ({
     nat_gateway_id = nat_gateway_id_;
     proxy_name = proxy_name_;
     proxy_arn = proxy_arn_;
     listener_properties_to_add = listener_properties_to_add_;
     listener_properties_to_remove = listener_properties_to_remove_;
     tls_intercept_properties = tls_intercept_properties_;
     update_token = update_token_;
   }
    : update_proxy_request)

let make_update_logging_configuration_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     logging_configuration = logging_configuration_;
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
   }
    : update_logging_configuration_response)

let make_update_logging_configuration_request ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?enable_monitoring_dashboard:(enable_monitoring_dashboard_ : enable_monitoring_dashboard option)
    () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     logging_configuration = logging_configuration_;
     enable_monitoring_dashboard = enable_monitoring_dashboard_;
   }
    : update_logging_configuration_request)

let make_update_firewall_policy_change_protection_response
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_ option) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
   }
    : update_firewall_policy_change_protection_response)

let make_update_firewall_policy_change_protection_request
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~firewall_policy_change_protection:(firewall_policy_change_protection_ : boolean_) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     firewall_policy_change_protection = firewall_policy_change_protection_;
   }
    : update_firewall_policy_change_protection_request)

let make_update_firewall_policy_response ~update_token:(update_token_ : update_token)
    ~firewall_policy_response:(firewall_policy_response_ : firewall_policy_response) () =
  ({ update_token = update_token_; firewall_policy_response = firewall_policy_response_ }
    : update_firewall_policy_response)

let make_update_firewall_policy_request
    ?firewall_policy_arn:(firewall_policy_arn_ : resource_arn option)
    ?firewall_policy_name:(firewall_policy_name_ : resource_name option)
    ?description:(description_ : description option) ?dry_run:(dry_run_ : boolean_ option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~update_token:(update_token_ : update_token)
    ~firewall_policy:(firewall_policy_ : firewall_policy) () =
  ({
     update_token = update_token_;
     firewall_policy_arn = firewall_policy_arn_;
     firewall_policy_name = firewall_policy_name_;
     firewall_policy = firewall_policy_;
     description = description_;
     dry_run = dry_run_;
     encryption_configuration = encryption_configuration_;
   }
    : update_firewall_policy_request)

let make_update_firewall_encryption_configuration_response
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?update_token:(update_token_ : update_token option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     update_token = update_token_;
     encryption_configuration = encryption_configuration_;
   }
    : update_firewall_encryption_configuration_response)

let make_update_firewall_encryption_configuration_request
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     encryption_configuration = encryption_configuration_;
   }
    : update_firewall_encryption_configuration_request)

let make_update_firewall_description_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?description:(description_ : description option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     description = description_;
     update_token = update_token_;
   }
    : update_firewall_description_response)

let make_update_firewall_description_request ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?description:(description_ : description option) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     description = description_;
   }
    : update_firewall_description_request)

let make_update_firewall_delete_protection_response
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?delete_protection:(delete_protection_ : boolean_ option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     delete_protection = delete_protection_;
     update_token = update_token_;
   }
    : update_firewall_delete_protection_response)

let make_update_firewall_delete_protection_request
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~delete_protection:(delete_protection_ : boolean_) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     delete_protection = delete_protection_;
   }
    : update_firewall_delete_protection_request)

let make_update_firewall_analysis_settings_response
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     enabled_analysis_types = enabled_analysis_types_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     update_token = update_token_;
   }
    : update_firewall_analysis_settings_response)

let make_update_firewall_analysis_settings_request
    ?enabled_analysis_types:(enabled_analysis_types_ : enabled_analysis_types option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     enabled_analysis_types = enabled_analysis_types_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     update_token = update_token_;
   }
    : update_firewall_analysis_settings_request)

let make_update_container_association_response
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?description:(description_ : description option)
    ?type_:(type__ : container_monitoring_type option)
    ?container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations option)
    ?status:(status_ : container_association_status option) ?tags:(tags_ : tag_list option)
    ?update_token:(update_token_ : update_token option) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
     description = description_;
     type_ = type__;
     container_monitoring_configurations = container_monitoring_configurations_;
     status = status_;
     tags = tags_;
     update_token = update_token_;
   }
    : update_container_association_response)

let make_update_container_association_request
    ?container_association_name:(container_association_name_ : resource_name option)
    ?container_association_arn:(container_association_arn_ : resource_arn option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ~type_:(type__ : container_monitoring_type)
    ~container_monitoring_configurations:
      (container_monitoring_configurations_ : container_monitoring_configurations)
    ~update_token:(update_token_ : update_token) () =
  ({
     container_association_name = container_association_name_;
     container_association_arn = container_association_arn_;
     description = description_;
     type_ = type__;
     container_monitoring_configurations = container_monitoring_configurations_;
     tags = tags_;
     update_token = update_token_;
   }
    : update_container_association_request)

let make_update_availability_zone_change_protection_response
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ?availability_zone_change_protection:(availability_zone_change_protection_ : boolean_ option) ()
    =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_change_protection = availability_zone_change_protection_;
   }
    : update_availability_zone_change_protection_response)

let make_update_availability_zone_change_protection_request
    ?update_token:(update_token_ : update_token option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?firewall_name:(firewall_name_ : resource_name option)
    ~availability_zone_change_protection:(availability_zone_change_protection_ : boolean_) () =
  ({
     update_token = update_token_;
     firewall_arn = firewall_arn_;
     firewall_name = firewall_name_;
     availability_zone_change_protection = availability_zone_change_protection_;
   }
    : update_availability_zone_change_protection_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_start_flow_flush_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option) () =
  ({
     firewall_arn = firewall_arn_;
     flow_operation_id = flow_operation_id_;
     flow_operation_status = flow_operation_status_;
   }
    : start_flow_flush_response)

let make_start_flow_flush_request ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option)
    ~firewall_arn:(firewall_arn_ : resource_arn) ~flow_filters:(flow_filters_ : flow_filters) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_;
     flow_filters = flow_filters_;
   }
    : start_flow_flush_request)

let make_start_flow_capture_response ?firewall_arn:(firewall_arn_ : resource_arn option)
    ?flow_operation_id:(flow_operation_id_ : flow_operation_id option)
    ?flow_operation_status:(flow_operation_status_ : flow_operation_status option) () =
  ({
     firewall_arn = firewall_arn_;
     flow_operation_id = flow_operation_id_;
     flow_operation_status = flow_operation_status_;
   }
    : start_flow_capture_response)

let make_start_flow_capture_request
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?vpc_endpoint_association_arn:(vpc_endpoint_association_arn_ : resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?minimum_flow_age_in_seconds:(minimum_flow_age_in_seconds_ : age option)
    ~firewall_arn:(firewall_arn_ : resource_arn) ~flow_filters:(flow_filters_ : flow_filters) () =
  ({
     firewall_arn = firewall_arn_;
     availability_zone = availability_zone_;
     vpc_endpoint_association_arn = vpc_endpoint_association_arn_;
     vpc_endpoint_id = vpc_endpoint_id_;
     minimum_flow_age_in_seconds = minimum_flow_age_in_seconds_;
     flow_filters = flow_filters_;
   }
    : start_flow_capture_request)

let make_start_analysis_report_response
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({ analysis_report_id = analysis_report_id_ } : start_analysis_report_response)

let make_start_analysis_report_request ?firewall_name:(firewall_name_ : resource_name option)
    ?firewall_arn:(firewall_arn_ : resource_arn option)
    ~analysis_type:(analysis_type_ : enabled_analysis_type) () =
  ({ firewall_name = firewall_name_; firewall_arn = firewall_arn_; analysis_type = analysis_type_ }
    : start_analysis_report_request)

let make_reject_network_firewall_transit_gateway_attachment_response
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    ~transit_gateway_attachment_status:
      (transit_gateway_attachment_status_ : transit_gateway_attachment_status) () =
  ({
     transit_gateway_attachment_id = transit_gateway_attachment_id_;
     transit_gateway_attachment_status = transit_gateway_attachment_status_;
   }
    : reject_network_firewall_transit_gateway_attachment_response)

let make_reject_network_firewall_transit_gateway_attachment_request
    ~transit_gateway_attachment_id:(transit_gateway_attachment_id_ : transit_gateway_attachment_id)
    () =
  ({ transit_gateway_attachment_id = transit_gateway_attachment_id_ }
    : reject_network_firewall_transit_gateway_attachment_request)

let make_put_resource_policy_response () = (() : unit)

let make_put_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : policy_string) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_request)
