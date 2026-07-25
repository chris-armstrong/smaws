(** Network Firewall client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidResourcePolicyException of invalid_resource_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an IAM policy for your rule group, firewall policy, or firewall. Use this to \
   share these resources between accounts. This operation works in conjunction with the Amazon Web \
   Services Resource Access Manager (RAM) service to manage resource sharing for Network Firewall. \
   \n\n\
  \ For information about using sharing with Network Firewall resources, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/sharing.html}Sharing \
   Network Firewall resources} in the {i Network Firewall Developer Guide}.\n\
  \ \n\
  \  Use this operation to create or update a resource policy for your Network Firewall rule \
   group, firewall policy, or firewall. In the resource policy, you specify the accounts that you \
   want to share the Network Firewall resource with and the operations that you want the accounts \
   to be able to perform. \n\
  \  \n\
  \   When you add an account in the resource policy, you then run the following Resource Access \
   Manager (RAM) operations to access and accept the shared resource. \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_GetResourceShareInvitations.html}GetResourceShareInvitations} \
   - Returns the Amazon Resource Names (ARNs) of the resource share invitations. \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_AcceptResourceShareInvitation.html}AcceptResourceShareInvitation} \
   - Accepts the share invitation for a specified resource share. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For additional information about resource sharing using RAM, see \
   {{:https://docs.aws.amazon.com/ram/latest/userguide/what-is.html}Resource Access Manager User \
   Guide}.\n\
  \   "]

module RejectNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_network_firewall_transit_gateway_attachment_request ->
    ( reject_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_network_firewall_transit_gateway_attachment_request ->
    ( reject_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rejects a transit gateway attachment request for Network Firewall. When you reject the \
   attachment request, Network Firewall cancels the creation of routing components between the \
   transit gateway and firewall endpoints.\n\n\
  \ Only the transit gateway owner can reject the attachment. After rejection, no traffic will \
   flow through the firewall endpoints for this attachment.\n\
  \ \n\
  \  Use [DescribeFirewall] to monitor the rejection status. To accept the attachment instead of \
   rejecting it, use [AcceptNetworkFirewallTransitGatewayAttachment].\n\
  \  \n\
  \    Once rejected, you cannot reverse this action. To establish connectivity, you must create a \
   new transit gateway-attached firewall.\n\
  \    \n\
  \     "]

module StartAnalysisReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_analysis_report_request ->
    ( start_analysis_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_analysis_report_request ->
    ( start_analysis_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a traffic analysis report for the timeframe and traffic type you specify.\n\n\
  \ For information on the contents of a traffic analysis report, see [AnalysisReport].\n\
  \ "]

module StartFlowCapture : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_flow_capture_request ->
    ( start_flow_capture_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_flow_capture_request ->
    ( start_flow_capture_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins capturing the flows in a firewall, according to the filters you define. Captures are \
   similar, but not identical to snapshots. Capture operations provide visibility into flows that \
   are not closed and are tracked by a firewall's flow table. Unlike snapshots, captures are a \
   time-boxed view. \n\n\
  \ A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \ \n\
  \   To avoid encountering operation limits, you should avoid starting captures with broad \
   filters, like wide IP ranges. Instead, we recommend you define more specific criteria with \
   [FlowFilters], like narrow IP ranges, ports, or protocols.\n\
  \   \n\
  \    "]

module StartFlowFlush : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_flow_flush_request ->
    ( start_flow_flush_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_flow_flush_request ->
    ( start_flow_flush_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins the flushing of traffic from the firewall, according to the filters you define. When the \
   operation starts, impacted flows are temporarily marked as timed out before the Suricata engine \
   prunes, or flushes, the flows from the firewall table.\n\n\
  \  While the flush completes, impacted flows are processed as midstream traffic. This may result \
   in a temporary increase in midstream traffic metrics. We recommend that you double check your \
   stream exception policy before you perform a flush operation.\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified resource. Tags are key:value pairs that you can use to \
   categorize and manage your resources, for purposes like billing. For example, you might set the \
   tag key to \"customer\" and the value to the customer name or ID. You can specify one or more \
   tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through Network Firewall: \
   firewalls, firewall policies, and rule groups. \n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the tags with the specified keys from the specified resource. Tags are key:value pairs \
   that you can use to categorize and manage your resources, for purposes like billing. For \
   example, you might set the tag key to \"customer\" and the value to the customer name or ID. \
   You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for \
   a resource.\n\n\
  \ You can manage tags for the Amazon Web Services resources that you manage through Network \
   Firewall: firewalls, firewall policies, and rule groups. \n\
  \ "]

module UpdateAvailabilityZoneChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_availability_zone_change_protection_request ->
    ( update_availability_zone_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_availability_zone_change_protection_request ->
    ( update_availability_zone_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the [AvailabilityZoneChangeProtection] setting for a transit gateway-attached \
   firewall. When enabled, this setting prevents accidental changes to the firewall's Availability \
   Zone configuration. This helps protect against disrupting traffic flow in production \
   environments.\n\n\
  \ When enabled, you must disable this protection before using [AssociateAvailabilityZones] or \
   [DisassociateAvailabilityZones] to modify the firewall's Availability Zone configuration.\n\
  \ "]

module UpdateContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_association_request ->
    ( update_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_association_request ->
    ( update_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the properties of an existing container association. Use this to modify the container \
   monitoring configurations or description.\n"]

module UpdateFirewallAnalysisSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_analysis_settings_request ->
    ( update_firewall_analysis_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_analysis_settings_request ->
    ( update_firewall_analysis_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables specific types of firewall analysis on a specific firewall you define.\n"]

module UpdateFirewallDeleteProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_delete_protection_request ->
    ( update_firewall_delete_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_delete_protection_request ->
    ( update_firewall_delete_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the flag, [DeleteProtection], which indicates whether it is possible to delete the \
   firewall. If the flag is set to [TRUE], the firewall is protected against deletion. This \
   setting helps protect against accidentally deleting a firewall that's in use. \n"]

module UpdateFirewallDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_description_request ->
    ( update_firewall_description_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_description_request ->
    ( update_firewall_description_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the description for the specified firewall. Use the description to help you identify \
   the firewall when you're working with it. \n"]

module UpdateFirewallEncryptionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_encryption_configuration_request ->
    ( update_firewall_encryption_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_encryption_configuration_request ->
    ( update_firewall_encryption_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A complex type that contains settings for encryption of your firewall resources.\n"]

module UpdateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_request ->
    ( update_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_request ->
    ( update_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified firewall policy.\n"]

module UpdateFirewallPolicyChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_change_protection_request ->
    ( update_firewall_policy_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_change_protection_request ->
    ( update_firewall_policy_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the flag, [ChangeProtection], which indicates whether it is possible to change the \
   firewall. If the flag is set to [TRUE], the firewall is protected from changes. This setting \
   helps protect against accidentally changing a firewall that's in use.\n"]

module UpdateLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `LogDestinationPermissionException of log_destination_permission_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_logging_configuration_request ->
    ( update_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `LogDestinationPermissionException of log_destination_permission_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_logging_configuration_request ->
    ( update_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `LogDestinationPermissionException of log_destination_permission_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the logging configuration for the specified firewall. \n\n\
  \ To change the logging configuration, retrieve the [LoggingConfiguration] by calling \
   [DescribeLoggingConfiguration], then change it and provide the modified object to this update \
   call. You must change the logging configuration one [LogDestinationConfig] at a time inside the \
   retrieved [LoggingConfiguration] object. \n\
  \ \n\
  \  You can perform only one of the following actions in any call to [UpdateLoggingConfiguration]: \n\
  \  \n\
  \   {ul\n\
  \         {-  Create a new log destination object by adding a single [LogDestinationConfig] \
   array element to [LogDestinationConfigs].\n\
  \             \n\
  \              }\n\
  \         {-  Delete a log destination object by removing a single [LogDestinationConfig] array \
   element from [LogDestinationConfigs].\n\
  \             \n\
  \              }\n\
  \         {-  Change the [LogDestination] setting in a single [LogDestinationConfig] array \
   element.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can't change the [LogDestinationType] or [LogType] in a [LogDestinationConfig]. To \
   change these settings, delete the existing [LogDestinationConfig] object and create a new one, \
   using two separate calls to this update operation.\n\
  \   "]

module UpdateProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_request ->
    ( update_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_request ->
    ( update_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy.\n"]

module UpdateProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_configuration_request ->
    ( update_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_configuration_request ->
    ( update_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy configuration.\n"]

module UpdateProxyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_request ->
    ( update_proxy_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_request ->
    ( update_proxy_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy rule.\n"]

module UpdateProxyRuleGroupPriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_group_priorities_request ->
    ( update_proxy_rule_group_priorities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_group_priorities_request ->
    ( update_proxy_rule_group_priorities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates proxy rule group priorities within a proxy configuration.\n"]

module UpdateProxyRulePriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_priorities_request ->
    ( update_proxy_rule_priorities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_priorities_request ->
    ( update_proxy_rule_priorities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates proxy rule priorities within a proxy rule group.\n"]

module UpdateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the rule settings for the specified rule group. You use a rule group by reference in \
   one or more firewall policies. When you modify a rule group, you modify all firewall policies \
   that use the rule group. \n\n\
  \ To update a rule group, first call [DescribeRuleGroup] to retrieve the current [RuleGroup] \
   object, update the object as needed, and then provide the updated object to this call. \n\
  \ "]

module UpdateSubnetChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_change_protection_request ->
    ( update_subnet_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_change_protection_request ->
    ( update_subnet_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "\n"]

module UpdateTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tls_inspection_configuration_request ->
    ( update_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tls_inspection_configuration_request ->
    ( update_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the TLS inspection configuration settings for the specified TLS inspection \
   configuration. You use a TLS inspection configuration by referencing it in one or more firewall \
   policies. When you modify a TLS inspection configuration, you modify all firewall policies that \
   use the TLS inspection configuration. \n\n\
  \ To update a TLS inspection configuration, first call [DescribeTLSInspectionConfiguration] to \
   retrieve the current [TLSInspectionConfiguration] object, update the object as needed, and then \
   provide the updated object to this call. \n\
  \ "]

module ListVpcEndpointAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_endpoint_associations_request ->
    ( list_vpc_endpoint_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_endpoint_associations_request ->
    ( list_vpc_endpoint_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the VPC endpoint associations that you have defined. If you specify \
   a fireawll, this returns only the endpoint associations for that firewall. \n\n\
  \ Depending on your setting for max results and the number of associations, a single call might \
   not return the full list. \n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the tags associated with the specified resource. Tags are key:value pairs that you \
   can use to categorize and manage your resources, for purposes like billing. For example, you \
   might set the tag key to \"customer\" and the value to the customer name or ID. You can specify \
   one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through Network Firewall: \
   firewalls, firewall policies, and rule groups. \n\
  \ "]

module ListTLSInspectionConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tls_inspection_configurations_request ->
    ( list_tls_inspection_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tls_inspection_configurations_request ->
    ( list_tls_inspection_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the TLS inspection configurations that you have defined. Depending \
   on your setting for max results and the number of TLS inspection configurations, a single call \
   might not return the full list.\n"]

module ListRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the rule groups that you have defined. Depending on your setting for \
   max results and the number of rule groups, a single call might not return the full list. \n"]

module ListProxyRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_rule_groups_request ->
    ( list_proxy_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_rule_groups_request ->
    ( list_proxy_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxy rule groups that you have defined. Depending on your \
   setting for max results and the number of proxy rule groups, a single call might not return the \
   full list. \n"]

module ListProxyConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_configurations_request ->
    ( list_proxy_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_configurations_request ->
    ( list_proxy_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxy configuration that you have defined. Depending on your \
   setting for max results and the number of proxy configurations, a single call might not return \
   the full list. \n"]

module ListProxies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxies_request ->
    ( list_proxies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxies_request ->
    ( list_proxies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxies that you have defined. Depending on your setting for max \
   results and the number of proxies, a single call might not return the full list. \n"]

module ListFlowOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operations_request ->
    ( list_flow_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operations_request ->
    ( list_flow_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all flow operations ran in a specific firewall. You can optionally narrow the \
   request scope by specifying the operation type or Availability Zone associated with a \
   firewall's flow operations. \n\n\
  \ Flow operations let you manage the flows tracked in the flow table, also known as the firewall \
   table.\n\
  \ \n\
  \  A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \  "]

module ListFlowOperationResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operation_results_request ->
    ( list_flow_operation_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operation_results_request ->
    ( list_flow_operation_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the results of a specific flow operation. \n\n\
  \ Flow operations let you manage the flows tracked in the flow table, also known as the firewall \
   table.\n\
  \ \n\
  \  A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \  "]

module ListFirewalls : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewalls_request ->
    ( list_firewalls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewalls_request ->
    ( list_firewalls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the firewalls that you have defined. If you provide VPC identifiers \
   in your request, this returns only the firewalls for those VPCs.\n\n\
  \ Depending on your setting for max results and the number of firewalls, a single call might not \
   return the full list. \n\
  \ "]

module ListFirewallPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_policies_request ->
    ( list_firewall_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_policies_request ->
    ( list_firewall_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the firewall policies that you have defined. Depending on your \
   setting for max results and the number of firewall policies, a single call might not return the \
   full list. \n"]

module ListContainerAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_associations_request ->
    ( list_container_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_associations_request ->
    ( list_container_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the container associations that you have defined. You can optionally \
   page through results.\n"]

module ListAnalysisReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_analysis_reports_request ->
    ( list_analysis_reports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_analysis_reports_request ->
    ( list_analysis_reports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all traffic analysis reports generated within the last 30 days.\n"]

module GetAnalysisReportResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_analysis_report_results_request ->
    ( get_analysis_report_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_analysis_report_results_request ->
    ( get_analysis_report_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The results of a [COMPLETED] analysis report generated with [StartAnalysisReport].\n\n\
  \ For more information, see [AnalysisTypeReportResult]. \n\
  \ "]

module DisassociateSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_subnets_request ->
    ( disassociate_subnets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_subnets_request ->
    ( disassociate_subnets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified subnet associations from the firewall. This removes the firewall \
   endpoints from the subnets and removes any network filtering protections that the endpoints \
   were providing. \n"]

module DisassociateAvailabilityZones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_availability_zones_request ->
    ( disassociate_availability_zones_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_availability_zones_request ->
    ( disassociate_availability_zones_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified Availability Zone associations from a transit gateway-attached firewall. \
   This removes the firewall endpoints from these Availability Zones and stops traffic filtering \
   in those zones. Before removing an Availability Zone, ensure you've updated your transit \
   gateway route tables to redirect traffic appropriately.\n\n\
  \  If [AvailabilityZoneChangeProtection] is enabled, you must first disable it using \
   [UpdateAvailabilityZoneChangeProtection].\n\
  \  \n\
  \    To verify the status of your Availability Zone changes, use [DescribeFirewall].\n\
  \    "]

module DetachRuleGroupsFromProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_rule_groups_from_proxy_configuration_request ->
    ( detach_rule_groups_from_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_rule_groups_from_proxy_configuration_request ->
    ( detach_rule_groups_from_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches [ProxyRuleGroup] resources from a [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ "]

module DescribeVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_endpoint_association_request ->
    ( describe_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_endpoint_association_request ->
    ( describe_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data object for the specified VPC endpoint association. \n"]

module DescribeTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tls_inspection_configuration_request ->
    ( describe_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tls_inspection_configuration_request ->
    ( describe_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified TLS inspection configuration.\n"]

module DescribeRuleGroupSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_summary_request ->
    ( describe_rule_group_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_summary_request ->
    ( describe_rule_group_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information for a stateful rule group.\n\n\
  \ For active threat defense Amazon Web Services managed rule groups, this operation provides \
   insight into the protections enabled by the rule group, based on Suricata rule metadata fields. \
   Summaries are available for rule groups you manage and for active threat defense Amazon Web \
   Services managed rule groups.\n\
  \ \n\
  \  To modify how threat information appears in summaries, use the [SummaryConfiguration] \
   parameter in [UpdateRuleGroup].\n\
  \  "]

module DescribeRuleGroupMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_metadata_request ->
    ( describe_rule_group_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_metadata_request ->
    ( describe_rule_group_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "High-level information about a rule group, returned by operations like create and describe. You \
   can use the information provided in the metadata to retrieve and manage a rule group. You can \
   retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]

module DescribeRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_request ->
    ( describe_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_request ->
    ( describe_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified rule group. \n"]

module DescribeResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a resource policy that you created in a [PutResourcePolicy] request. \n"]

module DescribeProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_group_request ->
    ( describe_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_group_request ->
    ( describe_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy rule group. \n"]

module DescribeProxyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_request ->
    ( describe_proxy_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_request ->
    ( describe_proxy_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the data objects for the specified proxy configuration for the specified proxy rule \
   group.\n"]

module DescribeProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_configuration_request ->
    ( describe_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_configuration_request ->
    ( describe_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy configuration. \n"]

module DescribeProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_request ->
    ( describe_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_request ->
    ( describe_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy. \n"]

module DescribeLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_configuration_request ->
    ( describe_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_configuration_request ->
    ( describe_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the logging configuration for the specified firewall. \n"]

module DescribeFlowOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_operation_request ->
    ( describe_flow_operation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_operation_request ->
    ( describe_flow_operation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns key information about a specific flow operation.\n"]

module DescribeFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_policy_request ->
    ( describe_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_policy_request ->
    ( describe_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified firewall policy. \n"]

module DescribeFirewallMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_metadata_request ->
    ( describe_firewall_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_metadata_request ->
    ( describe_firewall_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the high-level information about a firewall, including the Availability Zones where the \
   Firewall is currently in use. \n"]

module DescribeFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_request ->
    ( describe_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_request ->
    ( describe_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified firewall. \n"]

module DescribeContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_association_request ->
    ( describe_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_association_request ->
    ( describe_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the properties of a container association.\n"]

module DeleteVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_endpoint_association_request ->
    ( delete_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_endpoint_association_request ->
    ( delete_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [VpcEndpointAssociation].\n\n\
  \ You can check whether an endpoint association is in use by reviewing the route tables for the \
   Availability Zones where you have the endpoint subnet mapping. You can retrieve the subnet \
   mapping by calling [DescribeVpcEndpointAssociation]. You define and update the route tables \
   through Amazon VPC. As needed, update the route tables for the Availability Zone to remove the \
   firewall endpoint for the association. When the route tables no longer use the firewall \
   endpoint, you can remove the endpoint association safely.\n\
  \ "]

module DeleteTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tls_inspection_configuration_request ->
    ( delete_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tls_inspection_configuration_request ->
    ( delete_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [TLSInspectionConfiguration].\n"]

module DeleteRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [RuleGroup]. \n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidResourcePolicyException of invalid_resource_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a resource policy that you created in a [PutResourcePolicy] request. \n"]

module DeleteProxyRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rules_request ->
    ( delete_proxy_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rules_request ->
    ( delete_proxy_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyRule](s). currently attached to a [ProxyRuleGroup] \n"]

module DeleteProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rule_group_request ->
    ( delete_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rule_group_request ->
    ( delete_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyRuleGroup]. \n"]

module DeleteProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_configuration_request ->
    ( delete_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_configuration_request ->
    ( delete_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyConfiguration]. \n"]

module DeleteProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_request ->
    ( delete_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_request ->
    ( delete_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [Proxy]. \n\n Detaches a Proxy configuration from a NAT Gateway. \n "]

module DeleteNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_network_firewall_transit_gateway_attachment_request ->
    ( delete_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_network_firewall_transit_gateway_attachment_request ->
    ( delete_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a transit gateway attachment from a Network Firewall. Either the firewall owner or the \
   transit gateway owner can delete the attachment.\n\n\
  \  After you delete a transit gateway attachment, traffic will no longer flow through the \
   firewall endpoints.\n\
  \  \n\
  \    After you initiate the delete operation, use [DescribeFirewall] to monitor the deletion \
   status.\n\
  \    "]

module DeleteFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_policy_request ->
    ( delete_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_policy_request ->
    ( delete_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [FirewallPolicy]. \n"]

module DeleteFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_request ->
    ( delete_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_request ->
    ( delete_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [Firewall] and its [FirewallStatus]. This operation requires the \
   firewall's [DeleteProtection] flag to be [FALSE]. You can't revert this operation. \n\n\
  \ You can check whether a firewall is in use by reviewing the route tables for the Availability \
   Zones where you have firewall subnet mappings. Retrieve the subnet mappings by calling \
   [DescribeFirewall]. You define and update the route tables through Amazon VPC. As needed, \
   update the route tables for the zones to remove the firewall endpoints. When the route tables \
   no longer use the firewall endpoints, you can remove the firewall safely.\n\
  \ \n\
  \  To delete a firewall, remove the delete protection if you need to using \
   [UpdateFirewallDeleteProtection], then delete the firewall by calling [DeleteFirewall]. \n\
  \  "]

module DeleteContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_association_request ->
    ( delete_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_association_request ->
    ( delete_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified container association. When you delete a container association, Network \
   Firewall stops monitoring the associated container clusters and removes the resolved IP \
   addresses from firewall rules.\n"]

module CreateVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_endpoint_association_request ->
    ( create_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_endpoint_association_request ->
    ( create_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a firewall endpoint for an Network Firewall firewall. This type of firewall endpoint is \
   independent of the firewall endpoints that you specify in the [Firewall] itself, and you define \
   it in addition to those endpoints after the firewall has been created. You can define a VPC \
   endpoint association using a different VPC than the one you used in the firewall \
   specifications. \n"]

module CreateTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tls_inspection_configuration_request ->
    ( create_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tls_inspection_configuration_request ->
    ( create_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall TLS inspection configuration. Network Firewall uses TLS inspection \
   configurations to decrypt your firewall's inbound and outbound SSL/TLS traffic. After \
   decryption, Network Firewall inspects the traffic according to your firewall policy's stateful \
   rules, and then re-encrypts it before sending it to its destination. You can enable inspection \
   of your firewall's inbound traffic, outbound traffic, or both. To use TLS inspection with your \
   firewall, you must first import or provision certificates using ACM, create a TLS inspection \
   configuration, add that configuration to a new firewall policy, and then associate that policy \
   with your firewall.\n\n\
  \ To update the settings for a TLS inspection configuration, use \
   [UpdateTLSInspectionConfiguration].\n\
  \ \n\
  \  To manage a TLS inspection configuration's tags, use the standard Amazon Web Services \
   resource tagging operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about TLS inspection configurations, use \
   [ListTLSInspectionConfigurations] and [DescribeTLSInspectionConfiguration].\n\
  \   \n\
  \     For more information about TLS inspection configurations, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
   SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
   Guide}. \n\
  \    "]

module CreateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the specified stateless or stateful rule group, which includes the rules for network \
   traffic inspection, a capacity setting, and tags. \n\n\
  \ You provide your rule group specification in your request using either [RuleGroup] or [Rules].\n\
  \ "]

module CreateProxyRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rules_request ->
    ( create_proxy_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rules_request ->
    ( create_proxy_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates Network Firewall [ProxyRule] resources. \n\n\
  \ Attaches new proxy rule(s) to an existing proxy rule group. \n\
  \ \n\
  \  To retrieve information about individual proxy rules, use [DescribeProxyRuleGroup] and \
   [DescribeProxyRule].\n\
  \  "]

module CreateProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rule_group_request ->
    ( create_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rule_group_request ->
    ( create_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [ProxyRuleGroup] \n\n\
  \ Collections of related proxy filtering rules. Rule groups help you manage and reuse sets of \
   rules across multiple proxy configurations. \n\
  \ \n\
  \  To manage a proxy rule group's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxy rule groups, use [ListProxyRuleGroups] and \
   [DescribeProxyRuleGroup].\n\
  \   \n\
  \    To retrieve information about individual proxy rules, use [DescribeProxyRuleGroup] and \
   [DescribeProxyRule].\n\
  \    "]

module CreateProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_configuration_request ->
    ( create_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_configuration_request ->
    ( create_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ \n\
  \  To manage a proxy configuration's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxies, use [ListProxyConfigurations] and \
   [DescribeProxyConfiguration].\n\
  \   "]

module CreateProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_request ->
    ( create_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_request ->
    ( create_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [Proxy] \n\n\
  \ Attaches a Proxy configuration to a NAT Gateway. \n\
  \ \n\
  \  To manage a proxy's tags, use the standard Amazon Web Services resource tagging operations, \
   [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxies, use [ListProxies] and [DescribeProxy].\n\
  \   "]

module CreateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_policy_request ->
    ( create_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_policy_request ->
    ( create_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the firewall policy for the firewall according to the specifications. \n\n\
  \ An Network Firewall firewall policy defines the behavior of a firewall, in a collection of \
   stateless and stateful rule groups and other settings. You can use one firewall policy for \
   multiple firewalls. \n\
  \ "]

module CreateFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_request ->
    ( create_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_request ->
    ( create_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [Firewall] and accompanying [FirewallStatus] for a VPC. \n\n\
  \ The firewall defines the configuration settings for an Network Firewall firewall. The settings \
   that you can define at creation include the firewall policy, the subnets in your VPC to use for \
   the firewall endpoints, and any tags that are attached to the firewall Amazon Web Services \
   resource. \n\
  \ \n\
  \  After you create a firewall, you can provide additional settings, like the logging \
   configuration. \n\
  \  \n\
  \   To update the settings for a firewall, you use the operations that apply to the settings \
   themselves, for example [UpdateLoggingConfiguration], [AssociateSubnets], and \
   [UpdateFirewallDeleteProtection]. \n\
  \   \n\
  \    To manage a firewall's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \    \n\
  \     To retrieve information about firewalls, use [ListFirewalls] and [DescribeFirewall].\n\
  \     \n\
  \      To generate a report on the last 30 days of traffic monitored by a firewall, use \
   [StartAnalysisReport].\n\
  \      "]

module CreateContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_container_association_request ->
    ( create_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_container_association_request ->
    ( create_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a container association for Network Firewall. A container association links container \
   clusters (ECS or EKS) to Network Firewall, enabling dynamic IP resolution for firewall rules \
   based on container attributes.\n\n\
  \ To manage a container association's tags, use the standard Amazon Web Services resource \
   tagging operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \ \n\
  \  To retrieve information about container associations, use [ListContainerAssociations] and \
   [DescribeContainerAssociation].\n\
  \  "]

module AttachRuleGroupsToProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_rule_groups_to_proxy_configuration_request ->
    ( attach_rule_groups_to_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_rule_groups_to_proxy_configuration_request ->
    ( attach_rule_groups_to_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches [ProxyRuleGroup] resources to a [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ "]

module AssociateSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_subnets_request ->
    ( associate_subnets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_subnets_request ->
    ( associate_subnets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified subnets in the Amazon VPC to the firewall. You can specify one subnet \
   for each of the Availability Zones that the VPC spans. \n\n\
  \ This request creates an Network Firewall firewall endpoint in each of the subnets. To enable \
   the firewall's protections, you must also modify the VPC's route tables for each subnet's \
   Availability Zone, to redirect the traffic that's coming into and going out of the zone through \
   the firewall endpoint. \n\
  \ "]

module AssociateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_policy_request ->
    ( associate_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_policy_request ->
    ( associate_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a [FirewallPolicy] to a [Firewall]. \n\n\
  \ A firewall policy defines how to monitor and manage your VPC network traffic, using a \
   collection of inspection rule groups and other settings. Each firewall requires one firewall \
   policy association, and you can use the same firewall policy for multiple firewalls. \n\
  \ "]

module AssociateAvailabilityZones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_availability_zones_request ->
    ( associate_availability_zones_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_availability_zones_request ->
    ( associate_availability_zones_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified Availability Zones with a transit gateway-attached firewall. For each \
   Availability Zone, Network Firewall creates a firewall endpoint to process traffic. You can \
   specify one or more Availability Zones where you want to deploy the firewall.\n\n\
  \ After adding Availability Zones, you must update your transit gateway route tables to direct \
   traffic through the new firewall endpoints. Use [DescribeFirewall] to monitor the status of the \
   new endpoints.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module AcceptNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_network_firewall_transit_gateway_attachment_request ->
    ( accept_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_network_firewall_transit_gateway_attachment_request ->
    ( accept_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a transit gateway attachment request for Network Firewall. When you accept the \
   attachment request, Network Firewall creates the necessary routing components to enable traffic \
   flow between the transit gateway and firewall endpoints.\n\n\
  \ You must accept a transit gateway attachment to complete the creation of a transit \
   gateway-attached firewall, unless auto-accept is enabled on the transit gateway. After \
   acceptance, use [DescribeFirewall] to verify the firewall status.\n\
  \ \n\
  \  To reject an attachment instead of accepting it, use \
   [RejectNetworkFirewallTransitGatewayAttachment].\n\
  \  \n\
  \    It can take several minutes for the attachment acceptance to complete and the firewall to \
   become available.\n\
  \    \n\
  \     "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
