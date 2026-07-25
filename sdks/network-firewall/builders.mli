open Types

val make_attachment :
  ?subnet_id:az_subnet ->
  ?endpoint_id:endpoint_id ->
  ?status:attachment_status ->
  ?status_message:status_message ->
  unit ->
  attachment

val make_az_sync_state : ?attachment:attachment -> unit -> az_sync_state

val make_accept_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  unit ->
  accept_network_firewall_transit_gateway_attachment_response

val make_accept_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  accept_network_firewall_transit_gateway_attachment_request

val make_dimension : value:dimension_value -> unit -> dimension
val make_publish_metric_action : dimensions:dimensions -> unit -> publish_metric_action

val make_action_definition :
  ?publish_metric_action:publish_metric_action -> unit -> action_definition

val make_address : address_definition:address_definition -> unit -> address

val make_analysis_report :
  ?analysis_report_id:analysis_report_id ->
  ?analysis_type:enabled_analysis_type ->
  ?report_time:report_time ->
  ?status:status ->
  unit ->
  analysis_report

val make_unique_sources : ?count:count -> unit -> unique_sources
val make_hits : ?count:count -> unit -> hits

val make_availability_zone_mapping :
  availability_zone:availability_zone_mapping_string -> unit -> availability_zone_mapping

val make_associate_availability_zones_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?update_token:update_token ->
  unit ->
  associate_availability_zones_response

val make_associate_availability_zones_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  availability_zone_mappings:availability_zone_mappings ->
  unit ->
  associate_availability_zones_request

val make_associate_firewall_policy_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?firewall_policy_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  associate_firewall_policy_response

val make_associate_firewall_policy_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  firewall_policy_arn:resource_arn ->
  unit ->
  associate_firewall_policy_request

val make_subnet_mapping :
  ?ip_address_type:ip_address_type -> subnet_id:collection_member__string -> unit -> subnet_mapping

val make_associate_subnets_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?subnet_mappings:subnet_mappings ->
  ?update_token:update_token ->
  unit ->
  associate_subnets_response

val make_associate_subnets_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  subnet_mappings:subnet_mappings ->
  unit ->
  associate_subnets_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_proxy_config_default_rule_phase_actions_request :
  ?pre_dn_s:proxy_rule_phase_action ->
  ?pre_reques_t:proxy_rule_phase_action ->
  ?post_respons_e:proxy_rule_phase_action ->
  unit ->
  proxy_config_default_rule_phase_actions_request

val make_proxy_config_rule_group :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  ?type_:proxy_config_rule_group_type ->
  ?priority:proxy_config_rule_group_priority ->
  unit ->
  proxy_config_rule_group

val make_proxy_configuration :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?description:description ->
  ?create_time:create_time ->
  ?delete_time:delete_time ->
  ?rule_groups:proxy_config_rule_group_set ->
  ?default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  ?tags:tag_list ->
  unit ->
  proxy_configuration

val make_attach_rule_groups_to_proxy_configuration_response :
  ?proxy_configuration:proxy_configuration ->
  ?update_token:update_token ->
  unit ->
  attach_rule_groups_to_proxy_configuration_response

val make_proxy_rule_group_attachment :
  ?proxy_rule_group_name:resource_name ->
  ?insert_position:insert_position ->
  unit ->
  proxy_rule_group_attachment

val make_attach_rule_groups_to_proxy_configuration_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  rule_groups:proxy_rule_group_attachment_list ->
  update_token:update_token ->
  unit ->
  attach_rule_groups_to_proxy_configuration_request

val make_availability_zone_metadata :
  ?ip_address_type:ip_address_type -> unit -> availability_zone_metadata

val make_ip_set_metadata : ?resolved_cidr_count:cidr_count -> unit -> ip_set_metadata

val make_cidr_summary :
  ?available_cidr_count:cidr_count ->
  ?utilized_cidr_count:cidr_count ->
  ?ip_set_references:ip_set_metadata_map ->
  unit ->
  cidr_summary

val make_capacity_usage_summary : ?cid_rs:cidr_summary -> unit -> capacity_usage_summary

val make_tls_certificate_data :
  ?certificate_arn:resource_arn ->
  ?certificate_serial:collection_member__string ->
  ?status:collection_member__string ->
  ?status_message:status_reason ->
  unit ->
  tls_certificate_data

val make_check_certificate_revocation_status_actions :
  ?revoked_status_action:revocation_check_action ->
  ?unknown_status_action:revocation_check_action ->
  unit ->
  check_certificate_revocation_status_actions

val make_container_association_summary :
  ?arn:resource_arn -> ?name:resource_name -> unit -> container_association_summary

val make_container_attribute :
  key:container_attribute_key -> value:container_attribute_value -> unit -> container_attribute

val make_container_monitoring_configuration :
  ?attribute_filters:container_attributes ->
  cluster_arn:resource_arn ->
  unit ->
  container_monitoring_configuration

val make_create_container_association_response :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  ?description:description ->
  ?type_:container_monitoring_type ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?status:container_association_status ->
  ?tags:tag_list ->
  ?update_token:update_token ->
  unit ->
  create_container_association_response

val make_create_container_association_request :
  ?description:description ->
  ?tags:tag_list ->
  container_association_name:resource_name ->
  type_:container_monitoring_type ->
  container_monitoring_configurations:container_monitoring_configurations ->
  unit ->
  create_container_association_request

val make_transit_gateway_attachment_sync_state :
  ?attachment_id:attachment_id ->
  ?transit_gateway_attachment_status:transit_gateway_attachment_status ->
  ?status_message:transit_gateway_attachment_sync_state_message ->
  unit ->
  transit_gateway_attachment_sync_state

val make_per_object_status :
  ?sync_status:per_object_sync_status -> ?update_token:update_token -> unit -> per_object_status

val make_sync_state : ?attachment:attachment -> ?config:sync_state_config -> unit -> sync_state

val make_firewall_status :
  ?sync_states:sync_states ->
  ?capacity_usage_summary:capacity_usage_summary ->
  ?transit_gateway_attachment_sync_state:transit_gateway_attachment_sync_state ->
  status:firewall_status_value ->
  configuration_sync_state_summary:configuration_sync_state ->
  unit ->
  firewall_status

val make_encryption_configuration :
  ?key_id:key_id -> type_:encryption_type -> unit -> encryption_configuration

val make_firewall :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?delete_protection:boolean_ ->
  ?subnet_change_protection:boolean_ ->
  ?firewall_policy_change_protection:boolean_ ->
  ?description:description ->
  ?tags:tag_list ->
  ?encryption_configuration:encryption_configuration ->
  ?number_of_associations:number_of_associations ->
  ?enabled_analysis_types:enabled_analysis_types ->
  ?transit_gateway_id:transit_gateway_id ->
  ?transit_gateway_owner_account_id:aws_account_id ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?availability_zone_change_protection:boolean_ ->
  firewall_policy_arn:resource_arn ->
  vpc_id:vpc_id ->
  subnet_mappings:subnet_mappings ->
  firewall_id:resource_id ->
  unit ->
  firewall

val make_create_firewall_response :
  ?firewall:firewall -> ?firewall_status:firewall_status -> unit -> create_firewall_response

val make_create_firewall_request :
  ?vpc_id:vpc_id ->
  ?subnet_mappings:subnet_mappings ->
  ?delete_protection:boolean_ ->
  ?subnet_change_protection:boolean_ ->
  ?firewall_policy_change_protection:boolean_ ->
  ?description:description ->
  ?tags:tag_list ->
  ?encryption_configuration:encryption_configuration ->
  ?enabled_analysis_types:enabled_analysis_types ->
  ?transit_gateway_id:transit_gateway_id ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?availability_zone_change_protection:boolean_ ->
  firewall_name:resource_name ->
  firewall_policy_arn:resource_arn ->
  unit ->
  create_firewall_request

val make_firewall_policy_response :
  ?description:description ->
  ?firewall_policy_status:resource_status ->
  ?tags:tag_list ->
  ?consumed_stateless_rule_capacity:rule_capacity ->
  ?consumed_stateful_rule_capacity:rule_capacity ->
  ?consumed_stateful_domain_capacity:rule_capacity ->
  ?number_of_associations:number_of_associations ->
  ?encryption_configuration:encryption_configuration ->
  ?last_modified_time:last_update_time ->
  firewall_policy_name:resource_name ->
  firewall_policy_arn:resource_arn ->
  firewall_policy_id:resource_id ->
  unit ->
  firewall_policy_response

val make_create_firewall_policy_response :
  update_token:update_token ->
  firewall_policy_response:firewall_policy_response ->
  unit ->
  create_firewall_policy_response

val make_ip_set : definition:variable_definition_list -> unit -> ip_set
val make_policy_variables : ?rule_variables:ip_sets -> unit -> policy_variables

val make_flow_timeouts :
  ?tcp_idle_timeout_seconds:tcp_idle_timeout_range_bound -> unit -> flow_timeouts

val make_stateful_engine_options :
  ?rule_order:rule_order ->
  ?stream_exception_policy:stream_exception_policy ->
  ?flow_timeouts:flow_timeouts ->
  unit ->
  stateful_engine_options

val make_stateful_rule_group_override :
  ?action:override_action -> unit -> stateful_rule_group_override

val make_stateful_rule_group_reference :
  ?priority:priority ->
  ?override:stateful_rule_group_override ->
  ?deep_threat_inspection:deep_threat_inspection ->
  resource_arn:resource_arn ->
  unit ->
  stateful_rule_group_reference

val make_custom_action :
  action_name:action_name -> action_definition:action_definition -> unit -> custom_action

val make_stateless_rule_group_reference :
  resource_arn:resource_arn -> priority:priority -> unit -> stateless_rule_group_reference

val make_firewall_policy :
  ?stateless_rule_group_references:stateless_rule_group_references ->
  ?stateless_custom_actions:custom_actions ->
  ?stateful_rule_group_references:stateful_rule_group_references ->
  ?stateful_default_actions:stateful_actions ->
  ?stateful_engine_options:stateful_engine_options ->
  ?tls_inspection_configuration_arn:resource_arn ->
  ?policy_variables:policy_variables ->
  ?enable_tls_session_holding:enable_tls_session_holding ->
  stateless_default_actions:stateless_actions ->
  stateless_fragment_default_actions:stateless_actions ->
  unit ->
  firewall_policy

val make_create_firewall_policy_request :
  ?description:description ->
  ?tags:tag_list ->
  ?dry_run:boolean_ ->
  ?encryption_configuration:encryption_configuration ->
  firewall_policy_name:resource_name ->
  firewall_policy:firewall_policy ->
  unit ->
  create_firewall_policy_request

val make_tls_intercept_properties :
  ?pca_arn:resource_arn ->
  ?tls_intercept_mode:tls_intercept_mode ->
  unit ->
  tls_intercept_properties

val make_listener_property :
  ?port:nat_gateway_port -> ?type_:listener_property_type -> unit -> listener_property

val make_proxy :
  ?create_time:create_time ->
  ?delete_time:delete_time ->
  ?update_time:update_time ->
  ?failure_code:failure_code ->
  ?failure_message:failure_message ->
  ?proxy_state:proxy_state ->
  ?proxy_modify_state:proxy_modify_state ->
  ?nat_gateway_id:nat_gateway_id ->
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_name:resource_name ->
  ?proxy_arn:resource_arn ->
  ?listener_properties:listener_properties ->
  ?tls_intercept_properties:tls_intercept_properties ->
  ?tags:tag_list ->
  unit ->
  proxy

val make_create_proxy_response :
  ?proxy:proxy -> ?update_token:update_token -> unit -> create_proxy_response

val make_tls_intercept_properties_request :
  ?pca_arn:resource_arn ->
  ?tls_intercept_mode:tls_intercept_mode ->
  unit ->
  tls_intercept_properties_request

val make_listener_property_request :
  port:nat_gateway_port -> type_:listener_property_type -> unit -> listener_property_request

val make_create_proxy_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?listener_properties:listener_properties_request ->
  ?tags:tag_list ->
  proxy_name:resource_name ->
  nat_gateway_id:nat_gateway_id ->
  tls_intercept_properties:tls_intercept_properties_request ->
  unit ->
  create_proxy_request

val make_create_proxy_configuration_response :
  ?proxy_configuration:proxy_configuration ->
  ?update_token:update_token ->
  unit ->
  create_proxy_configuration_response

val make_create_proxy_configuration_request :
  ?description:description ->
  ?rule_group_names:resource_name_list ->
  ?rule_group_arns:resource_arn_list ->
  ?tags:tag_list ->
  proxy_configuration_name:resource_name ->
  default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  unit ->
  create_proxy_configuration_request

val make_proxy_rule_condition :
  ?condition_operator:condition_operator ->
  ?condition_key:condition_key ->
  ?condition_values:proxy_condition_value_list ->
  unit ->
  proxy_rule_condition

val make_create_proxy_rule :
  ?proxy_rule_name:resource_name ->
  ?description:description ->
  ?action:proxy_rule_phase_action ->
  ?conditions:proxy_rule_condition_list ->
  ?insert_position:insert_position ->
  unit ->
  create_proxy_rule

val make_proxy_rule :
  ?proxy_rule_name:resource_name ->
  ?description:description ->
  ?action:proxy_rule_phase_action ->
  ?conditions:proxy_rule_condition_list ->
  unit ->
  proxy_rule

val make_proxy_rules_by_request_phase :
  ?pre_dn_s:proxy_rule_list ->
  ?pre_reques_t:proxy_rule_list ->
  ?post_respons_e:proxy_rule_list ->
  unit ->
  proxy_rules_by_request_phase

val make_proxy_rule_group :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  ?create_time:create_time ->
  ?delete_time:delete_time ->
  ?rules:proxy_rules_by_request_phase ->
  ?description:description ->
  ?tags:tag_list ->
  unit ->
  proxy_rule_group

val make_create_proxy_rule_group_response :
  ?proxy_rule_group:proxy_rule_group ->
  ?update_token:update_token ->
  unit ->
  create_proxy_rule_group_response

val make_create_proxy_rule_group_request :
  ?description:description ->
  ?rules:proxy_rules_by_request_phase ->
  ?tags:tag_list ->
  proxy_rule_group_name:resource_name ->
  unit ->
  create_proxy_rule_group_request

val make_create_proxy_rules_response :
  ?proxy_rule_group:proxy_rule_group ->
  ?update_token:update_token ->
  unit ->
  create_proxy_rules_response

val make_create_proxy_rules_by_request_phase :
  ?pre_dn_s:create_proxy_rule_list ->
  ?pre_reques_t:create_proxy_rule_list ->
  ?post_respons_e:create_proxy_rule_list ->
  unit ->
  create_proxy_rules_by_request_phase

val make_create_proxy_rules_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  rules:create_proxy_rules_by_request_phase ->
  unit ->
  create_proxy_rules_request

val make_summary_configuration : ?rule_options:summary_rule_options -> unit -> summary_configuration

val make_source_metadata :
  ?source_arn:resource_arn -> ?source_update_token:update_token -> unit -> source_metadata

val make_rule_group_response :
  ?description:description ->
  ?type_:rule_group_type ->
  ?capacity:rule_capacity ->
  ?rule_group_status:resource_status ->
  ?tags:tag_list ->
  ?consumed_capacity:rule_capacity ->
  ?number_of_associations:number_of_associations ->
  ?encryption_configuration:encryption_configuration ->
  ?source_metadata:source_metadata ->
  ?sns_topic:resource_arn ->
  ?last_modified_time:last_update_time ->
  ?analysis_results:analysis_result_list ->
  ?summary_configuration:summary_configuration ->
  rule_group_arn:resource_arn ->
  rule_group_name:resource_name ->
  rule_group_id:resource_id ->
  unit ->
  rule_group_response

val make_create_rule_group_response :
  update_token:update_token ->
  rule_group_response:rule_group_response ->
  unit ->
  create_rule_group_response

val make_stateful_rule_options : ?rule_order:rule_order -> unit -> stateful_rule_options
val make_tcp_flag_field : ?masks:flags -> flags:flags -> unit -> tcp_flag_field
val make_port_range : from_port:port_range_bound -> to_port:port_range_bound -> unit -> port_range

val make_match_attributes :
  ?sources:addresses ->
  ?destinations:addresses ->
  ?source_ports:port_ranges ->
  ?destination_ports:port_ranges ->
  ?protocols:protocol_numbers ->
  ?tcp_flags:tcp_flags ->
  unit ->
  match_attributes

val make_rule_definition :
  match_attributes:match_attributes -> actions:stateless_actions -> unit -> rule_definition

val make_stateless_rule :
  rule_definition:rule_definition -> priority:priority -> unit -> stateless_rule

val make_stateless_rules_and_custom_actions :
  ?custom_actions:custom_actions ->
  stateless_rules:stateless_rules ->
  unit ->
  stateless_rules_and_custom_actions

val make_rule_option : ?settings:settings -> keyword:keyword -> unit -> rule_option

val make_header :
  protocol:stateful_rule_protocol ->
  source:source ->
  source_port:port ->
  direction:stateful_rule_direction ->
  destination:destination ->
  destination_port:port ->
  unit ->
  header

val make_stateful_rule :
  action:stateful_action -> header:header -> rule_options:rule_options -> unit -> stateful_rule

val make_rules_source_list :
  targets:rule_targets ->
  target_types:target_types ->
  generated_rules_type:generated_rules_type ->
  unit ->
  rules_source_list

val make_rules_source :
  ?rules_string:rules_string ->
  ?rules_source_list:rules_source_list ->
  ?stateful_rules:stateful_rules ->
  ?stateless_rules_and_custom_actions:stateless_rules_and_custom_actions ->
  unit ->
  rules_source

val make_ip_set_reference : ?reference_arn:resource_arn -> unit -> ip_set_reference
val make_reference_sets : ?ip_set_references:ip_set_reference_map -> unit -> reference_sets
val make_port_set : ?definition:variable_definition_list -> unit -> port_set
val make_rule_variables : ?ip_sets:ip_sets -> ?port_sets:port_sets -> unit -> rule_variables

val make_rule_group :
  ?rule_variables:rule_variables ->
  ?reference_sets:reference_sets ->
  ?stateful_rule_options:stateful_rule_options ->
  rules_source:rules_source ->
  unit ->
  rule_group

val make_create_rule_group_request :
  ?rule_group:rule_group ->
  ?rules:rules_string ->
  ?description:description ->
  ?tags:tag_list ->
  ?dry_run:boolean_ ->
  ?encryption_configuration:encryption_configuration ->
  ?source_metadata:source_metadata ->
  ?analyze_rule_group:boolean_ ->
  ?summary_configuration:summary_configuration ->
  rule_group_name:resource_name ->
  type_:rule_group_type ->
  capacity:rule_capacity ->
  unit ->
  create_rule_group_request

val make_tls_inspection_configuration_response :
  ?tls_inspection_configuration_status:resource_status ->
  ?description:description ->
  ?tags:tag_list ->
  ?last_modified_time:last_update_time ->
  ?number_of_associations:number_of_associations ->
  ?encryption_configuration:encryption_configuration ->
  ?certificates:certificates ->
  ?certificate_authority:tls_certificate_data ->
  tls_inspection_configuration_arn:resource_arn ->
  tls_inspection_configuration_name:resource_name ->
  tls_inspection_configuration_id:resource_id ->
  unit ->
  tls_inspection_configuration_response

val make_create_tls_inspection_configuration_response :
  update_token:update_token ->
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  unit ->
  create_tls_inspection_configuration_response

val make_server_certificate_scope :
  ?sources:addresses ->
  ?destinations:addresses ->
  ?source_ports:port_ranges ->
  ?destination_ports:port_ranges ->
  ?protocols:protocol_numbers ->
  unit ->
  server_certificate_scope

val make_server_certificate : ?resource_arn:resource_arn -> unit -> server_certificate

val make_server_certificate_configuration :
  ?server_certificates:server_certificates ->
  ?scopes:server_certificate_scopes ->
  ?certificate_authority_arn:resource_arn ->
  ?check_certificate_revocation_status:check_certificate_revocation_status_actions ->
  unit ->
  server_certificate_configuration

val make_tls_inspection_configuration :
  ?server_certificate_configurations:server_certificate_configurations ->
  unit ->
  tls_inspection_configuration

val make_create_tls_inspection_configuration_request :
  ?description:description ->
  ?tags:tag_list ->
  ?encryption_configuration:encryption_configuration ->
  tls_inspection_configuration_name:resource_name ->
  tls_inspection_configuration:tls_inspection_configuration ->
  unit ->
  create_tls_inspection_configuration_request

val make_vpc_endpoint_association_status :
  ?association_sync_state:association_sync_state ->
  status:firewall_status_value ->
  unit ->
  vpc_endpoint_association_status

val make_vpc_endpoint_association :
  ?vpc_endpoint_association_id:resource_id ->
  ?description:description ->
  ?tags:tag_list ->
  vpc_endpoint_association_arn:resource_arn ->
  firewall_arn:resource_arn ->
  vpc_id:vpc_id ->
  subnet_mapping:subnet_mapping ->
  unit ->
  vpc_endpoint_association

val make_create_vpc_endpoint_association_response :
  ?vpc_endpoint_association:vpc_endpoint_association ->
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  unit ->
  create_vpc_endpoint_association_response

val make_create_vpc_endpoint_association_request :
  ?description:description ->
  ?tags:tag_list ->
  firewall_arn:resource_arn ->
  vpc_id:vpc_id ->
  subnet_mapping:subnet_mapping ->
  unit ->
  create_vpc_endpoint_association_request

val make_delete_container_association_response :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  ?status:container_association_status ->
  unit ->
  delete_container_association_response

val make_delete_container_association_request :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  unit ->
  delete_container_association_request

val make_delete_firewall_response :
  ?firewall:firewall -> ?firewall_status:firewall_status -> unit -> delete_firewall_response

val make_delete_firewall_request :
  ?firewall_name:resource_name -> ?firewall_arn:resource_arn -> unit -> delete_firewall_request

val make_delete_firewall_policy_response :
  firewall_policy_response:firewall_policy_response -> unit -> delete_firewall_policy_response

val make_delete_firewall_policy_request :
  ?firewall_policy_name:resource_name ->
  ?firewall_policy_arn:resource_arn ->
  unit ->
  delete_firewall_policy_request

val make_delete_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  unit ->
  delete_network_firewall_transit_gateway_attachment_response

val make_delete_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  delete_network_firewall_transit_gateway_attachment_request

val make_delete_proxy_response :
  ?nat_gateway_id:nat_gateway_id ->
  ?proxy_name:resource_name ->
  ?proxy_arn:resource_arn ->
  unit ->
  delete_proxy_response

val make_delete_proxy_request :
  ?proxy_name:resource_name ->
  ?proxy_arn:resource_arn ->
  nat_gateway_id:nat_gateway_id ->
  unit ->
  delete_proxy_request

val make_delete_proxy_configuration_response :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  unit ->
  delete_proxy_configuration_response

val make_delete_proxy_configuration_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  unit ->
  delete_proxy_configuration_request

val make_delete_proxy_rule_group_response :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  unit ->
  delete_proxy_rule_group_response

val make_delete_proxy_rule_group_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  unit ->
  delete_proxy_rule_group_request

val make_delete_proxy_rules_response :
  ?proxy_rule_group:proxy_rule_group -> unit -> delete_proxy_rules_response

val make_delete_proxy_rules_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  rules:resource_name_list ->
  unit ->
  delete_proxy_rules_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:resource_arn -> unit -> delete_resource_policy_request

val make_delete_rule_group_response :
  rule_group_response:rule_group_response -> unit -> delete_rule_group_response

val make_delete_rule_group_request :
  ?rule_group_name:resource_name ->
  ?rule_group_arn:resource_arn ->
  ?type_:rule_group_type ->
  unit ->
  delete_rule_group_request

val make_delete_tls_inspection_configuration_response :
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  unit ->
  delete_tls_inspection_configuration_response

val make_delete_tls_inspection_configuration_request :
  ?tls_inspection_configuration_arn:resource_arn ->
  ?tls_inspection_configuration_name:resource_name ->
  unit ->
  delete_tls_inspection_configuration_request

val make_delete_vpc_endpoint_association_response :
  ?vpc_endpoint_association:vpc_endpoint_association ->
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  unit ->
  delete_vpc_endpoint_association_response

val make_delete_vpc_endpoint_association_request :
  vpc_endpoint_association_arn:resource_arn -> unit -> delete_vpc_endpoint_association_request

val make_describe_container_association_response :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  ?description:description ->
  ?type_:container_monitoring_type ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?status:container_association_status ->
  ?resolved_cidr_count:cidr_count ->
  ?last_updated_time:container_association_last_updated_time ->
  ?tags:tag_list ->
  ?update_token:update_token ->
  unit ->
  describe_container_association_response

val make_describe_container_association_request :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  unit ->
  describe_container_association_request

val make_describe_firewall_response :
  ?update_token:update_token ->
  ?firewall:firewall ->
  ?firewall_status:firewall_status ->
  unit ->
  describe_firewall_response

val make_describe_firewall_request :
  ?firewall_name:resource_name -> ?firewall_arn:resource_arn -> unit -> describe_firewall_request

val make_describe_firewall_metadata_response :
  ?firewall_arn:resource_arn ->
  ?firewall_policy_arn:resource_arn ->
  ?description:description ->
  ?status:firewall_status_value ->
  ?supported_availability_zones:supported_availability_zones ->
  ?transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  describe_firewall_metadata_response

val make_describe_firewall_metadata_request :
  ?firewall_arn:resource_arn -> unit -> describe_firewall_metadata_request

val make_describe_firewall_policy_response :
  ?firewall_policy:firewall_policy ->
  update_token:update_token ->
  firewall_policy_response:firewall_policy_response ->
  unit ->
  describe_firewall_policy_response

val make_describe_firewall_policy_request :
  ?firewall_policy_name:resource_name ->
  ?firewall_policy_arn:resource_arn ->
  unit ->
  describe_firewall_policy_request

val make_flow_filter :
  ?source_address:address ->
  ?destination_address:address ->
  ?source_port:port ->
  ?destination_port:port ->
  ?protocols:protocol_strings ->
  unit ->
  flow_filter

val make_flow_operation :
  ?minimum_flow_age_in_seconds:age -> ?flow_filters:flow_filters -> unit -> flow_operation

val make_describe_flow_operation_response :
  ?firewall_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?flow_operation_id:flow_operation_id ->
  ?flow_operation_type:flow_operation_type ->
  ?flow_operation_status:flow_operation_status ->
  ?status_message:status_reason ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?flow_operation:flow_operation ->
  unit ->
  describe_flow_operation_response

val make_describe_flow_operation_request :
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  firewall_arn:resource_arn ->
  flow_operation_id:flow_operation_id ->
  unit ->
  describe_flow_operation_request

val make_log_destination_config :
  log_type:log_type ->
  log_destination_type:log_destination_type ->
  log_destination:log_destination_map ->
  unit ->
  log_destination_config

val make_logging_configuration :
  log_destination_configs:log_destination_configs -> unit -> logging_configuration

val make_describe_logging_configuration_response :
  ?firewall_arn:resource_arn ->
  ?logging_configuration:logging_configuration ->
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  unit ->
  describe_logging_configuration_response

val make_describe_logging_configuration_request :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  unit ->
  describe_logging_configuration_request

val make_describe_proxy_resource :
  ?proxy_name:resource_name ->
  ?proxy_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?nat_gateway_id:nat_gateway_id ->
  ?proxy_state:proxy_state ->
  ?proxy_modify_state:proxy_modify_state ->
  ?listener_properties:listener_properties ->
  ?tls_intercept_properties:tls_intercept_properties ->
  ?vpc_endpoint_service_name:vpc_endpoint_service_name ->
  ?private_dns_name:private_dns_name ->
  ?create_time:create_time ->
  ?delete_time:delete_time ->
  ?update_time:update_time ->
  ?failure_code:failure_code ->
  ?failure_message:failure_message ->
  ?tags:tag_list ->
  unit ->
  describe_proxy_resource

val make_describe_proxy_response :
  ?proxy:describe_proxy_resource -> ?update_token:update_token -> unit -> describe_proxy_response

val make_describe_proxy_request :
  ?proxy_name:resource_name -> ?proxy_arn:resource_arn -> unit -> describe_proxy_request

val make_describe_proxy_configuration_response :
  ?proxy_configuration:proxy_configuration ->
  ?update_token:update_token ->
  unit ->
  describe_proxy_configuration_response

val make_describe_proxy_configuration_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  unit ->
  describe_proxy_configuration_request

val make_describe_proxy_rule_response :
  ?proxy_rule:proxy_rule -> ?update_token:update_token -> unit -> describe_proxy_rule_response

val make_describe_proxy_rule_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  proxy_rule_name:resource_name ->
  unit ->
  describe_proxy_rule_request

val make_describe_proxy_rule_group_response :
  ?proxy_rule_group:proxy_rule_group ->
  ?update_token:update_token ->
  unit ->
  describe_proxy_rule_group_response

val make_describe_proxy_rule_group_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  unit ->
  describe_proxy_rule_group_request

val make_describe_resource_policy_response :
  ?policy:policy_string -> unit -> describe_resource_policy_response

val make_describe_resource_policy_request :
  resource_arn:resource_arn -> unit -> describe_resource_policy_request

val make_describe_rule_group_response :
  ?rule_group:rule_group ->
  update_token:update_token ->
  rule_group_response:rule_group_response ->
  unit ->
  describe_rule_group_response

val make_describe_rule_group_request :
  ?rule_group_name:resource_name ->
  ?rule_group_arn:resource_arn ->
  ?type_:rule_group_type ->
  ?analyze_rule_group:boolean_ ->
  unit ->
  describe_rule_group_request

val make_describe_rule_group_metadata_response :
  ?description:description ->
  ?type_:rule_group_type ->
  ?capacity:rule_capacity ->
  ?stateful_rule_options:stateful_rule_options ->
  ?last_modified_time:last_update_time ->
  ?vendor_name:vendor_name ->
  ?product_id:product_id ->
  ?listing_name:listing_name ->
  rule_group_arn:resource_arn ->
  rule_group_name:resource_name ->
  unit ->
  describe_rule_group_metadata_response

val make_describe_rule_group_metadata_request :
  ?rule_group_name:resource_name ->
  ?rule_group_arn:resource_arn ->
  ?type_:rule_group_type ->
  unit ->
  describe_rule_group_metadata_request

val make_rule_summary :
  ?si_d:collection_member__string ->
  ?msg:collection_member__string ->
  ?metadata:collection_member__string ->
  unit ->
  rule_summary

val make_summary : ?rule_summaries:rule_summaries -> unit -> summary

val make_describe_rule_group_summary_response :
  ?description:description ->
  ?summary:summary ->
  rule_group_name:resource_name ->
  unit ->
  describe_rule_group_summary_response

val make_describe_rule_group_summary_request :
  ?rule_group_name:resource_name ->
  ?rule_group_arn:resource_arn ->
  ?type_:rule_group_type ->
  unit ->
  describe_rule_group_summary_request

val make_describe_tls_inspection_configuration_response :
  ?tls_inspection_configuration:tls_inspection_configuration ->
  update_token:update_token ->
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  unit ->
  describe_tls_inspection_configuration_response

val make_describe_tls_inspection_configuration_request :
  ?tls_inspection_configuration_arn:resource_arn ->
  ?tls_inspection_configuration_name:resource_name ->
  unit ->
  describe_tls_inspection_configuration_request

val make_describe_vpc_endpoint_association_response :
  ?vpc_endpoint_association:vpc_endpoint_association ->
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  unit ->
  describe_vpc_endpoint_association_response

val make_describe_vpc_endpoint_association_request :
  vpc_endpoint_association_arn:resource_arn -> unit -> describe_vpc_endpoint_association_request

val make_detach_rule_groups_from_proxy_configuration_response :
  ?proxy_configuration:proxy_configuration ->
  ?update_token:update_token ->
  unit ->
  detach_rule_groups_from_proxy_configuration_response

val make_detach_rule_groups_from_proxy_configuration_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?rule_group_names:resource_name_list ->
  ?rule_group_arns:resource_arn_list ->
  update_token:update_token ->
  unit ->
  detach_rule_groups_from_proxy_configuration_request

val make_disassociate_availability_zones_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?update_token:update_token ->
  unit ->
  disassociate_availability_zones_response

val make_disassociate_availability_zones_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  availability_zone_mappings:availability_zone_mappings ->
  unit ->
  disassociate_availability_zones_request

val make_disassociate_subnets_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?subnet_mappings:subnet_mappings ->
  ?update_token:update_token ->
  unit ->
  disassociate_subnets_response

val make_disassociate_subnets_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  subnet_ids:az_subnets ->
  unit ->
  disassociate_subnets_request

val make_firewall_metadata :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  firewall_metadata

val make_firewall_policy_metadata :
  ?name:resource_name -> ?arn:resource_arn -> unit -> firewall_policy_metadata

val make_flow :
  ?source_address:address ->
  ?destination_address:address ->
  ?source_port:port ->
  ?destination_port:port ->
  ?protocol:protocol_string ->
  ?age:age ->
  ?packet_count:packet_count ->
  ?byte_count:byte_count ->
  unit ->
  flow

val make_flow_operation_metadata :
  ?flow_operation_id:flow_operation_id ->
  ?flow_operation_type:flow_operation_type ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?flow_operation_status:flow_operation_status ->
  unit ->
  flow_operation_metadata

val make_get_analysis_report_results_response :
  ?status:status ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?report_time:report_time ->
  ?analysis_type:enabled_analysis_type ->
  ?next_token:analysis_report_next_token ->
  ?analysis_report_results:analysis_report_results ->
  unit ->
  get_analysis_report_results_response

val make_get_analysis_report_results_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?next_token:analysis_report_next_token ->
  ?max_results:pagination_max_results ->
  analysis_report_id:analysis_report_id ->
  unit ->
  get_analysis_report_results_request

val make_list_analysis_reports_response :
  ?analysis_reports:analysis_reports ->
  ?next_token:pagination_token ->
  unit ->
  list_analysis_reports_response

val make_list_analysis_reports_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_analysis_reports_request

val make_list_container_associations_response :
  ?container_associations:container_associations ->
  ?next_token:pagination_token ->
  unit ->
  list_container_associations_response

val make_list_container_associations_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_container_associations_request

val make_list_firewall_policies_response :
  ?next_token:pagination_token ->
  ?firewall_policies:firewall_policies ->
  unit ->
  list_firewall_policies_response

val make_list_firewall_policies_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_firewall_policies_request

val make_list_firewalls_response :
  ?next_token:pagination_token -> ?firewalls:firewalls -> unit -> list_firewalls_response

val make_list_firewalls_request :
  ?next_token:pagination_token ->
  ?vpc_ids:vpc_ids ->
  ?max_results:pagination_max_results ->
  unit ->
  list_firewalls_request

val make_list_flow_operation_results_response :
  ?firewall_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?flow_operation_id:flow_operation_id ->
  ?flow_operation_status:flow_operation_status ->
  ?status_message:status_reason ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?flows:flows ->
  ?next_token:pagination_token ->
  unit ->
  list_flow_operation_results_response

val make_list_flow_operation_results_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  firewall_arn:resource_arn ->
  flow_operation_id:flow_operation_id ->
  unit ->
  list_flow_operation_results_request

val make_list_flow_operations_response :
  ?flow_operations:flow_operations ->
  ?next_token:pagination_token ->
  unit ->
  list_flow_operations_response

val make_list_flow_operations_request :
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?flow_operation_type:flow_operation_type ->
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  firewall_arn:resource_arn ->
  unit ->
  list_flow_operations_request

val make_proxy_metadata : ?name:resource_name -> ?arn:resource_arn -> unit -> proxy_metadata

val make_list_proxies_response :
  ?proxies:proxies -> ?next_token:pagination_token -> unit -> list_proxies_response

val make_list_proxies_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_proxies_request

val make_proxy_configuration_metadata :
  ?name:resource_name -> ?arn:resource_arn -> unit -> proxy_configuration_metadata

val make_list_proxy_configurations_response :
  ?proxy_configurations:proxy_configurations ->
  ?next_token:pagination_token ->
  unit ->
  list_proxy_configurations_response

val make_list_proxy_configurations_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_proxy_configurations_request

val make_proxy_rule_group_metadata :
  ?name:resource_name -> ?arn:resource_arn -> unit -> proxy_rule_group_metadata

val make_list_proxy_rule_groups_response :
  ?proxy_rule_groups:proxy_rule_groups ->
  ?next_token:pagination_token ->
  unit ->
  list_proxy_rule_groups_response

val make_list_proxy_rule_groups_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_proxy_rule_groups_request

val make_rule_group_metadata :
  ?name:resource_name ->
  ?arn:resource_arn ->
  ?vendor_name:vendor_name ->
  unit ->
  rule_group_metadata

val make_list_rule_groups_response :
  ?next_token:pagination_token -> ?rule_groups:rule_groups -> unit -> list_rule_groups_response

val make_list_rule_groups_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  ?scope:resource_managed_status ->
  ?managed_type:resource_managed_type ->
  ?subscription_status:subscription_status ->
  ?type_:rule_group_type ->
  unit ->
  list_rule_groups_request

val make_tls_inspection_configuration_metadata :
  ?name:resource_name -> ?arn:resource_arn -> unit -> tls_inspection_configuration_metadata

val make_list_tls_inspection_configurations_response :
  ?next_token:pagination_token ->
  ?tls_inspection_configurations:tls_inspection_configurations ->
  unit ->
  list_tls_inspection_configurations_response

val make_list_tls_inspection_configurations_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_tls_inspection_configurations_request

val make_list_tags_for_resource_response :
  ?next_token:pagination_token -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:pagination_token ->
  ?max_results:tags_pagination_max_results ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_vpc_endpoint_association_metadata :
  ?vpc_endpoint_association_arn:resource_arn -> unit -> vpc_endpoint_association_metadata

val make_list_vpc_endpoint_associations_response :
  ?next_token:pagination_token ->
  ?vpc_endpoint_associations:vpc_endpoint_associations ->
  unit ->
  list_vpc_endpoint_associations_response

val make_list_vpc_endpoint_associations_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  ?firewall_arn:resource_arn ->
  unit ->
  list_vpc_endpoint_associations_request

val make_update_tls_inspection_configuration_response :
  update_token:update_token ->
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  unit ->
  update_tls_inspection_configuration_response

val make_update_tls_inspection_configuration_request :
  ?tls_inspection_configuration_arn:resource_arn ->
  ?tls_inspection_configuration_name:resource_name ->
  ?description:description ->
  ?encryption_configuration:encryption_configuration ->
  tls_inspection_configuration:tls_inspection_configuration ->
  update_token:update_token ->
  unit ->
  update_tls_inspection_configuration_request

val make_update_subnet_change_protection_response :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?subnet_change_protection:boolean_ ->
  unit ->
  update_subnet_change_protection_response

val make_update_subnet_change_protection_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  subnet_change_protection:boolean_ ->
  unit ->
  update_subnet_change_protection_request

val make_update_rule_group_response :
  update_token:update_token ->
  rule_group_response:rule_group_response ->
  unit ->
  update_rule_group_response

val make_update_rule_group_request :
  ?rule_group_arn:resource_arn ->
  ?rule_group_name:resource_name ->
  ?rule_group:rule_group ->
  ?rules:rules_string ->
  ?type_:rule_group_type ->
  ?description:description ->
  ?dry_run:boolean_ ->
  ?encryption_configuration:encryption_configuration ->
  ?source_metadata:source_metadata ->
  ?analyze_rule_group:boolean_ ->
  ?summary_configuration:summary_configuration ->
  update_token:update_token ->
  unit ->
  update_rule_group_request

val make_proxy_rule_priority :
  ?proxy_rule_name:resource_name -> ?new_position:insert_position -> unit -> proxy_rule_priority

val make_update_proxy_rule_priorities_response :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  ?rule_group_request_phase:rule_group_request_phase ->
  ?rules:proxy_rule_priority_list ->
  ?update_token:update_token ->
  unit ->
  update_proxy_rule_priorities_response

val make_update_proxy_rule_priorities_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  rule_group_request_phase:rule_group_request_phase ->
  rules:proxy_rule_priority_list ->
  update_token:update_token ->
  unit ->
  update_proxy_rule_priorities_request

val make_update_proxy_rule_group_priorities_response :
  ?proxy_rule_groups:proxy_rule_group_priority_result_list ->
  ?update_token:update_token ->
  unit ->
  update_proxy_rule_group_priorities_response

val make_proxy_rule_group_priority :
  ?proxy_rule_group_name:resource_name ->
  ?new_position:insert_position ->
  unit ->
  proxy_rule_group_priority

val make_update_proxy_rule_group_priorities_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  rule_groups:proxy_rule_group_priority_list ->
  update_token:update_token ->
  unit ->
  update_proxy_rule_group_priorities_request

val make_update_proxy_rule_response :
  ?proxy_rule:proxy_rule ->
  ?removed_conditions:proxy_rule_condition_list ->
  ?update_token:update_token ->
  unit ->
  update_proxy_rule_response

val make_update_proxy_rule_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  ?description:description ->
  ?action:proxy_rule_phase_action ->
  ?add_conditions:proxy_rule_condition_list ->
  ?remove_conditions:proxy_rule_condition_list ->
  proxy_rule_name:resource_name ->
  update_token:update_token ->
  unit ->
  update_proxy_rule_request

val make_update_proxy_configuration_response :
  ?proxy_configuration:proxy_configuration ->
  ?update_token:update_token ->
  unit ->
  update_proxy_configuration_response

val make_update_proxy_configuration_request :
  ?proxy_configuration_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  update_token:update_token ->
  unit ->
  update_proxy_configuration_request

val make_update_proxy_response :
  ?proxy:proxy -> ?update_token:update_token -> unit -> update_proxy_response

val make_update_proxy_request :
  ?proxy_name:resource_name ->
  ?proxy_arn:resource_arn ->
  ?listener_properties_to_add:listener_properties_request ->
  ?listener_properties_to_remove:listener_properties_request ->
  ?tls_intercept_properties:tls_intercept_properties_request ->
  nat_gateway_id:nat_gateway_id ->
  update_token:update_token ->
  unit ->
  update_proxy_request

val make_update_logging_configuration_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?logging_configuration:logging_configuration ->
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  unit ->
  update_logging_configuration_response

val make_update_logging_configuration_request :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?logging_configuration:logging_configuration ->
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  unit ->
  update_logging_configuration_request

val make_update_firewall_policy_change_protection_response :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?firewall_policy_change_protection:boolean_ ->
  unit ->
  update_firewall_policy_change_protection_response

val make_update_firewall_policy_change_protection_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  firewall_policy_change_protection:boolean_ ->
  unit ->
  update_firewall_policy_change_protection_request

val make_update_firewall_policy_response :
  update_token:update_token ->
  firewall_policy_response:firewall_policy_response ->
  unit ->
  update_firewall_policy_response

val make_update_firewall_policy_request :
  ?firewall_policy_arn:resource_arn ->
  ?firewall_policy_name:resource_name ->
  ?description:description ->
  ?dry_run:boolean_ ->
  ?encryption_configuration:encryption_configuration ->
  update_token:update_token ->
  firewall_policy:firewall_policy ->
  unit ->
  update_firewall_policy_request

val make_update_firewall_encryption_configuration_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?update_token:update_token ->
  ?encryption_configuration:encryption_configuration ->
  unit ->
  update_firewall_encryption_configuration_response

val make_update_firewall_encryption_configuration_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?encryption_configuration:encryption_configuration ->
  unit ->
  update_firewall_encryption_configuration_request

val make_update_firewall_description_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?description:description ->
  ?update_token:update_token ->
  unit ->
  update_firewall_description_response

val make_update_firewall_description_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?description:description ->
  unit ->
  update_firewall_description_request

val make_update_firewall_delete_protection_response :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?delete_protection:boolean_ ->
  ?update_token:update_token ->
  unit ->
  update_firewall_delete_protection_response

val make_update_firewall_delete_protection_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  delete_protection:boolean_ ->
  unit ->
  update_firewall_delete_protection_request

val make_update_firewall_analysis_settings_response :
  ?enabled_analysis_types:enabled_analysis_types ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?update_token:update_token ->
  unit ->
  update_firewall_analysis_settings_response

val make_update_firewall_analysis_settings_request :
  ?enabled_analysis_types:enabled_analysis_types ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?update_token:update_token ->
  unit ->
  update_firewall_analysis_settings_request

val make_update_container_association_response :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  ?description:description ->
  ?type_:container_monitoring_type ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?status:container_association_status ->
  ?tags:tag_list ->
  ?update_token:update_token ->
  unit ->
  update_container_association_response

val make_update_container_association_request :
  ?container_association_name:resource_name ->
  ?container_association_arn:resource_arn ->
  ?description:description ->
  ?tags:tag_list ->
  type_:container_monitoring_type ->
  container_monitoring_configurations:container_monitoring_configurations ->
  update_token:update_token ->
  unit ->
  update_container_association_request

val make_update_availability_zone_change_protection_response :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?availability_zone_change_protection:boolean_ ->
  unit ->
  update_availability_zone_change_protection_response

val make_update_availability_zone_change_protection_request :
  ?update_token:update_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  availability_zone_change_protection:boolean_ ->
  unit ->
  update_availability_zone_change_protection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_start_flow_flush_response :
  ?firewall_arn:resource_arn ->
  ?flow_operation_id:flow_operation_id ->
  ?flow_operation_status:flow_operation_status ->
  unit ->
  start_flow_flush_response

val make_start_flow_flush_request :
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?minimum_flow_age_in_seconds:age ->
  firewall_arn:resource_arn ->
  flow_filters:flow_filters ->
  unit ->
  start_flow_flush_request

val make_start_flow_capture_response :
  ?firewall_arn:resource_arn ->
  ?flow_operation_id:flow_operation_id ->
  ?flow_operation_status:flow_operation_status ->
  unit ->
  start_flow_capture_response

val make_start_flow_capture_request :
  ?availability_zone:availability_zone ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?minimum_flow_age_in_seconds:age ->
  firewall_arn:resource_arn ->
  flow_filters:flow_filters ->
  unit ->
  start_flow_capture_request

val make_start_analysis_report_response :
  analysis_report_id:analysis_report_id -> unit -> start_analysis_report_response

val make_start_analysis_report_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  analysis_type:enabled_analysis_type ->
  unit ->
  start_analysis_report_request

val make_reject_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  unit ->
  reject_network_firewall_transit_gateway_attachment_response

val make_reject_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  reject_network_firewall_transit_gateway_attachment_request

val make_put_resource_policy_response : unit -> unit

val make_put_resource_policy_request :
  resource_arn:resource_arn -> policy:policy_string -> unit -> put_resource_policy_request
