(** Network Firewall client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vpc_endpoint_association_metadata :
  ?vpc_endpoint_association_arn:resource_arn -> unit -> vpc_endpoint_association_metadata

val make_attachment :
  ?status_message:status_message ->
  ?status:attachment_status ->
  ?endpoint_id:endpoint_id ->
  ?subnet_id:az_subnet ->
  unit ->
  attachment

val make_az_sync_state : ?attachment:attachment -> unit -> az_sync_state

val make_vpc_endpoint_association_status :
  ?association_sync_state:association_sync_state ->
  status:firewall_status_value ->
  unit ->
  vpc_endpoint_association_status

val make_subnet_mapping :
  ?ip_address_type:ip_address_type -> subnet_id:collection_member__string -> unit -> subnet_mapping

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_vpc_endpoint_association :
  ?tags:tag_list ->
  ?description:description ->
  ?vpc_endpoint_association_id:resource_id ->
  subnet_mapping:subnet_mapping ->
  vpc_id:vpc_id ->
  firewall_arn:resource_arn ->
  vpc_endpoint_association_arn:resource_arn ->
  unit ->
  vpc_endpoint_association

val make_encryption_configuration :
  ?key_id:key_id -> type_:encryption_type -> unit -> encryption_configuration

val make_tls_certificate_data :
  ?status_message:status_reason ->
  ?status:collection_member__string ->
  ?certificate_serial:collection_member__string ->
  ?certificate_arn:resource_arn ->
  unit ->
  tls_certificate_data

val make_tls_inspection_configuration_response :
  ?certificate_authority:tls_certificate_data ->
  ?certificates:certificates ->
  ?encryption_configuration:encryption_configuration ->
  ?number_of_associations:number_of_associations ->
  ?last_modified_time:last_update_time ->
  ?tags:tag_list ->
  ?description:description ->
  ?tls_inspection_configuration_status:resource_status ->
  tls_inspection_configuration_id:resource_id ->
  tls_inspection_configuration_name:resource_name ->
  tls_inspection_configuration_arn:resource_arn ->
  unit ->
  tls_inspection_configuration_response

val make_update_tls_inspection_configuration_response :
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  update_token:update_token ->
  unit ->
  update_tls_inspection_configuration_response

val make_server_certificate : ?resource_arn:resource_arn -> unit -> server_certificate
val make_address : address_definition:address_definition -> unit -> address
val make_port_range : to_port:port_range_bound -> from_port:port_range_bound -> unit -> port_range

val make_server_certificate_scope :
  ?protocols:protocol_numbers ->
  ?destination_ports:port_ranges ->
  ?source_ports:port_ranges ->
  ?destinations:addresses ->
  ?sources:addresses ->
  unit ->
  server_certificate_scope

val make_check_certificate_revocation_status_actions :
  ?unknown_status_action:revocation_check_action ->
  ?revoked_status_action:revocation_check_action ->
  unit ->
  check_certificate_revocation_status_actions

val make_server_certificate_configuration :
  ?check_certificate_revocation_status:check_certificate_revocation_status_actions ->
  ?certificate_authority_arn:resource_arn ->
  ?scopes:server_certificate_scopes ->
  ?server_certificates:server_certificates ->
  unit ->
  server_certificate_configuration

val make_tls_inspection_configuration :
  ?server_certificate_configurations:server_certificate_configurations ->
  unit ->
  tls_inspection_configuration

val make_update_tls_inspection_configuration_request :
  ?encryption_configuration:encryption_configuration ->
  ?description:description ->
  ?tls_inspection_configuration_name:resource_name ->
  ?tls_inspection_configuration_arn:resource_arn ->
  update_token:update_token ->
  tls_inspection_configuration:tls_inspection_configuration ->
  unit ->
  update_tls_inspection_configuration_request

val make_update_subnet_change_protection_response :
  ?subnet_change_protection:boolean_ ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  update_subnet_change_protection_response

val make_update_subnet_change_protection_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  subnet_change_protection:boolean_ ->
  unit ->
  update_subnet_change_protection_request

val make_source_metadata :
  ?source_update_token:update_token -> ?source_arn:resource_arn -> unit -> source_metadata

val make_summary_configuration : ?rule_options:summary_rule_options -> unit -> summary_configuration

val make_rule_group_response :
  ?summary_configuration:summary_configuration ->
  ?analysis_results:analysis_result_list ->
  ?last_modified_time:last_update_time ->
  ?sns_topic:resource_arn ->
  ?source_metadata:source_metadata ->
  ?encryption_configuration:encryption_configuration ->
  ?number_of_associations:number_of_associations ->
  ?consumed_capacity:rule_capacity ->
  ?tags:tag_list ->
  ?rule_group_status:resource_status ->
  ?capacity:rule_capacity ->
  ?type_:rule_group_type ->
  ?description:description ->
  rule_group_id:resource_id ->
  rule_group_name:resource_name ->
  rule_group_arn:resource_arn ->
  unit ->
  rule_group_response

val make_update_rule_group_response :
  rule_group_response:rule_group_response ->
  update_token:update_token ->
  unit ->
  update_rule_group_response

val make_ip_set : definition:variable_definition_list -> unit -> ip_set
val make_port_set : ?definition:variable_definition_list -> unit -> port_set
val make_rule_variables : ?port_sets:port_sets -> ?ip_sets:ip_sets -> unit -> rule_variables
val make_ip_set_reference : ?reference_arn:resource_arn -> unit -> ip_set_reference
val make_reference_sets : ?ip_set_references:ip_set_reference_map -> unit -> reference_sets

val make_rules_source_list :
  generated_rules_type:generated_rules_type ->
  target_types:target_types ->
  targets:rule_targets ->
  unit ->
  rules_source_list

val make_header :
  destination_port:port ->
  destination:destination ->
  direction:stateful_rule_direction ->
  source_port:port ->
  source:source ->
  protocol:stateful_rule_protocol ->
  unit ->
  header

val make_rule_option : ?settings:settings -> keyword:keyword -> unit -> rule_option

val make_stateful_rule :
  rule_options:rule_options -> header:header -> action:stateful_action -> unit -> stateful_rule

val make_tcp_flag_field : ?masks:flags -> flags:flags -> unit -> tcp_flag_field

val make_match_attributes :
  ?tcp_flags:tcp_flags ->
  ?protocols:protocol_numbers ->
  ?destination_ports:port_ranges ->
  ?source_ports:port_ranges ->
  ?destinations:addresses ->
  ?sources:addresses ->
  unit ->
  match_attributes

val make_rule_definition :
  actions:stateless_actions -> match_attributes:match_attributes -> unit -> rule_definition

val make_stateless_rule :
  priority:priority -> rule_definition:rule_definition -> unit -> stateless_rule

val make_dimension : value:dimension_value -> unit -> dimension
val make_publish_metric_action : dimensions:dimensions -> unit -> publish_metric_action

val make_action_definition :
  ?publish_metric_action:publish_metric_action -> unit -> action_definition

val make_custom_action :
  action_definition:action_definition -> action_name:action_name -> unit -> custom_action

val make_stateless_rules_and_custom_actions :
  ?custom_actions:custom_actions ->
  stateless_rules:stateless_rules ->
  unit ->
  stateless_rules_and_custom_actions

val make_rules_source :
  ?stateless_rules_and_custom_actions:stateless_rules_and_custom_actions ->
  ?stateful_rules:stateful_rules ->
  ?rules_source_list:rules_source_list ->
  ?rules_string:rules_string ->
  unit ->
  rules_source

val make_stateful_rule_options : ?rule_order:rule_order -> unit -> stateful_rule_options

val make_rule_group :
  ?stateful_rule_options:stateful_rule_options ->
  ?reference_sets:reference_sets ->
  ?rule_variables:rule_variables ->
  rules_source:rules_source ->
  unit ->
  rule_group

val make_update_rule_group_request :
  ?summary_configuration:summary_configuration ->
  ?analyze_rule_group:boolean_ ->
  ?source_metadata:source_metadata ->
  ?encryption_configuration:encryption_configuration ->
  ?dry_run:boolean_ ->
  ?description:description ->
  ?type_:rule_group_type ->
  ?rules:rules_string ->
  ?rule_group:rule_group ->
  ?rule_group_name:resource_name ->
  ?rule_group_arn:resource_arn ->
  update_token:update_token ->
  unit ->
  update_rule_group_request

val make_proxy_rule_condition :
  ?condition_values:proxy_condition_value_list ->
  ?condition_key:condition_key ->
  ?condition_operator:condition_operator ->
  unit ->
  proxy_rule_condition

val make_proxy_rule :
  ?conditions:proxy_rule_condition_list ->
  ?action:proxy_rule_phase_action ->
  ?description:description ->
  ?proxy_rule_name:resource_name ->
  unit ->
  proxy_rule

val make_update_proxy_rule_response :
  ?update_token:update_token ->
  ?removed_conditions:proxy_rule_condition_list ->
  ?proxy_rule:proxy_rule ->
  unit ->
  update_proxy_rule_response

val make_update_proxy_rule_request :
  ?remove_conditions:proxy_rule_condition_list ->
  ?add_conditions:proxy_rule_condition_list ->
  ?action:proxy_rule_phase_action ->
  ?description:description ->
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  update_token:update_token ->
  proxy_rule_name:resource_name ->
  unit ->
  update_proxy_rule_request

val make_proxy_rule_priority :
  ?new_position:insert_position -> ?proxy_rule_name:resource_name -> unit -> proxy_rule_priority

val make_update_proxy_rule_priorities_response :
  ?update_token:update_token ->
  ?rules:proxy_rule_priority_list ->
  ?rule_group_request_phase:rule_group_request_phase ->
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  update_proxy_rule_priorities_response

val make_update_proxy_rule_priorities_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  update_token:update_token ->
  rules:proxy_rule_priority_list ->
  rule_group_request_phase:rule_group_request_phase ->
  unit ->
  update_proxy_rule_priorities_request

val make_update_proxy_rule_group_priorities_response :
  ?update_token:update_token ->
  ?proxy_rule_groups:proxy_rule_group_priority_result_list ->
  unit ->
  update_proxy_rule_group_priorities_response

val make_proxy_rule_group_priority :
  ?new_position:insert_position ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  proxy_rule_group_priority

val make_update_proxy_rule_group_priorities_request :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  update_token:update_token ->
  rule_groups:proxy_rule_group_priority_list ->
  unit ->
  update_proxy_rule_group_priorities_request

val make_listener_property :
  ?type_:listener_property_type -> ?port:nat_gateway_port -> unit -> listener_property

val make_tls_intercept_properties :
  ?tls_intercept_mode:tls_intercept_mode ->
  ?pca_arn:resource_arn ->
  unit ->
  tls_intercept_properties

val make_proxy :
  ?tags:tag_list ->
  ?tls_intercept_properties:tls_intercept_properties ->
  ?listener_properties:listener_properties ->
  ?proxy_arn:resource_arn ->
  ?proxy_name:resource_name ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  ?nat_gateway_id:nat_gateway_id ->
  ?proxy_modify_state:proxy_modify_state ->
  ?proxy_state:proxy_state ->
  ?failure_message:failure_message ->
  ?failure_code:failure_code ->
  ?update_time:update_time ->
  ?delete_time:delete_time ->
  ?create_time:create_time ->
  unit ->
  proxy

val make_update_proxy_response :
  ?update_token:update_token -> ?proxy:proxy -> unit -> update_proxy_response

val make_listener_property_request :
  type_:listener_property_type -> port:nat_gateway_port -> unit -> listener_property_request

val make_tls_intercept_properties_request :
  ?tls_intercept_mode:tls_intercept_mode ->
  ?pca_arn:resource_arn ->
  unit ->
  tls_intercept_properties_request

val make_update_proxy_request :
  ?tls_intercept_properties:tls_intercept_properties_request ->
  ?listener_properties_to_remove:listener_properties_request ->
  ?listener_properties_to_add:listener_properties_request ->
  ?proxy_arn:resource_arn ->
  ?proxy_name:resource_name ->
  update_token:update_token ->
  nat_gateway_id:nat_gateway_id ->
  unit ->
  update_proxy_request

val make_proxy_config_rule_group :
  ?priority:proxy_config_rule_group_priority ->
  ?type_:proxy_config_rule_group_type ->
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  proxy_config_rule_group

val make_proxy_config_default_rule_phase_actions_request :
  ?post_respons_e:proxy_rule_phase_action ->
  ?pre_reques_t:proxy_rule_phase_action ->
  ?pre_dn_s:proxy_rule_phase_action ->
  unit ->
  proxy_config_default_rule_phase_actions_request

val make_proxy_configuration :
  ?tags:tag_list ->
  ?default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  ?rule_groups:proxy_config_rule_group_set ->
  ?delete_time:delete_time ->
  ?create_time:create_time ->
  ?description:description ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  unit ->
  proxy_configuration

val make_update_proxy_configuration_response :
  ?update_token:update_token ->
  ?proxy_configuration:proxy_configuration ->
  unit ->
  update_proxy_configuration_response

val make_update_proxy_configuration_request :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  update_token:update_token ->
  default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  unit ->
  update_proxy_configuration_request

val make_log_destination_config :
  log_destination:log_destination_map ->
  log_destination_type:log_destination_type ->
  log_type:log_type ->
  unit ->
  log_destination_config

val make_logging_configuration :
  log_destination_configs:log_destination_configs -> unit -> logging_configuration

val make_update_logging_configuration_response :
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  ?logging_configuration:logging_configuration ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  update_logging_configuration_response

val make_update_logging_configuration_request :
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  ?logging_configuration:logging_configuration ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  update_logging_configuration_request

val make_firewall_policy_response :
  ?last_modified_time:last_update_time ->
  ?encryption_configuration:encryption_configuration ->
  ?number_of_associations:number_of_associations ->
  ?consumed_stateful_domain_capacity:rule_capacity ->
  ?consumed_stateful_rule_capacity:rule_capacity ->
  ?consumed_stateless_rule_capacity:rule_capacity ->
  ?tags:tag_list ->
  ?firewall_policy_status:resource_status ->
  ?description:description ->
  firewall_policy_id:resource_id ->
  firewall_policy_arn:resource_arn ->
  firewall_policy_name:resource_name ->
  unit ->
  firewall_policy_response

val make_update_firewall_policy_response :
  firewall_policy_response:firewall_policy_response ->
  update_token:update_token ->
  unit ->
  update_firewall_policy_response

val make_stateless_rule_group_reference :
  priority:priority -> resource_arn:resource_arn -> unit -> stateless_rule_group_reference

val make_stateful_rule_group_override :
  ?action:override_action -> unit -> stateful_rule_group_override

val make_stateful_rule_group_reference :
  ?deep_threat_inspection:deep_threat_inspection ->
  ?override:stateful_rule_group_override ->
  ?priority:priority ->
  resource_arn:resource_arn ->
  unit ->
  stateful_rule_group_reference

val make_flow_timeouts :
  ?tcp_idle_timeout_seconds:tcp_idle_timeout_range_bound -> unit -> flow_timeouts

val make_stateful_engine_options :
  ?flow_timeouts:flow_timeouts ->
  ?stream_exception_policy:stream_exception_policy ->
  ?rule_order:rule_order ->
  unit ->
  stateful_engine_options

val make_policy_variables : ?rule_variables:ip_sets -> unit -> policy_variables

val make_firewall_policy :
  ?enable_tls_session_holding:enable_tls_session_holding ->
  ?policy_variables:policy_variables ->
  ?tls_inspection_configuration_arn:resource_arn ->
  ?stateful_engine_options:stateful_engine_options ->
  ?stateful_default_actions:stateful_actions ->
  ?stateful_rule_group_references:stateful_rule_group_references ->
  ?stateless_custom_actions:custom_actions ->
  ?stateless_rule_group_references:stateless_rule_group_references ->
  stateless_fragment_default_actions:stateless_actions ->
  stateless_default_actions:stateless_actions ->
  unit ->
  firewall_policy

val make_update_firewall_policy_request :
  ?encryption_configuration:encryption_configuration ->
  ?dry_run:boolean_ ->
  ?description:description ->
  ?firewall_policy_name:resource_name ->
  ?firewall_policy_arn:resource_arn ->
  firewall_policy:firewall_policy ->
  update_token:update_token ->
  unit ->
  update_firewall_policy_request

val make_update_firewall_policy_change_protection_response :
  ?firewall_policy_change_protection:boolean_ ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  update_firewall_policy_change_protection_response

val make_update_firewall_policy_change_protection_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  firewall_policy_change_protection:boolean_ ->
  unit ->
  update_firewall_policy_change_protection_request

val make_update_firewall_encryption_configuration_response :
  ?encryption_configuration:encryption_configuration ->
  ?update_token:update_token ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  update_firewall_encryption_configuration_response

val make_update_firewall_encryption_configuration_request :
  ?encryption_configuration:encryption_configuration ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  update_firewall_encryption_configuration_request

val make_update_firewall_description_response :
  ?update_token:update_token ->
  ?description:description ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  update_firewall_description_response

val make_update_firewall_description_request :
  ?description:description ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  update_firewall_description_request

val make_update_firewall_delete_protection_response :
  ?update_token:update_token ->
  ?delete_protection:boolean_ ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  update_firewall_delete_protection_response

val make_update_firewall_delete_protection_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  delete_protection:boolean_ ->
  unit ->
  update_firewall_delete_protection_request

val make_update_firewall_analysis_settings_response :
  ?update_token:update_token ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?enabled_analysis_types:enabled_analysis_types ->
  unit ->
  update_firewall_analysis_settings_response

val make_update_firewall_analysis_settings_request :
  ?update_token:update_token ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?enabled_analysis_types:enabled_analysis_types ->
  unit ->
  update_firewall_analysis_settings_request

val make_container_attribute :
  value:container_attribute_value -> key:container_attribute_key -> unit -> container_attribute

val make_container_monitoring_configuration :
  ?attribute_filters:container_attributes ->
  cluster_arn:resource_arn ->
  unit ->
  container_monitoring_configuration

val make_update_container_association_response :
  ?update_token:update_token ->
  ?tags:tag_list ->
  ?status:container_association_status ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?type_:container_monitoring_type ->
  ?description:description ->
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  update_container_association_response

val make_update_container_association_request :
  ?tags:tag_list ->
  ?description:description ->
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  update_token:update_token ->
  container_monitoring_configurations:container_monitoring_configurations ->
  type_:container_monitoring_type ->
  unit ->
  update_container_association_request

val make_update_availability_zone_change_protection_response :
  ?availability_zone_change_protection:boolean_ ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  unit ->
  update_availability_zone_change_protection_response

val make_update_availability_zone_change_protection_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  availability_zone_change_protection:boolean_ ->
  unit ->
  update_availability_zone_change_protection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_unique_sources : ?count:count -> unit -> unique_sources

val make_transit_gateway_attachment_sync_state :
  ?status_message:transit_gateway_attachment_sync_state_message ->
  ?transit_gateway_attachment_status:transit_gateway_attachment_status ->
  ?attachment_id:attachment_id ->
  unit ->
  transit_gateway_attachment_sync_state

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_tls_inspection_configuration_metadata :
  ?arn:resource_arn -> ?name:resource_name -> unit -> tls_inspection_configuration_metadata

val make_per_object_status :
  ?update_token:update_token -> ?sync_status:per_object_sync_status -> unit -> per_object_status

val make_sync_state : ?config:sync_state_config -> ?attachment:attachment -> unit -> sync_state

val make_availability_zone_metadata :
  ?ip_address_type:ip_address_type -> unit -> availability_zone_metadata

val make_rule_summary :
  ?metadata:collection_member__string ->
  ?msg:collection_member__string ->
  ?si_d:collection_member__string ->
  unit ->
  rule_summary

val make_summary : ?rule_summaries:rule_summaries -> unit -> summary

val make_start_flow_flush_response :
  ?flow_operation_status:flow_operation_status ->
  ?flow_operation_id:flow_operation_id ->
  ?firewall_arn:resource_arn ->
  unit ->
  start_flow_flush_response

val make_flow_filter :
  ?protocols:protocol_strings ->
  ?destination_port:port ->
  ?source_port:port ->
  ?destination_address:address ->
  ?source_address:address ->
  unit ->
  flow_filter

val make_start_flow_flush_request :
  ?minimum_flow_age_in_seconds:age ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  flow_filters:flow_filters ->
  firewall_arn:resource_arn ->
  unit ->
  start_flow_flush_request

val make_start_flow_capture_response :
  ?flow_operation_status:flow_operation_status ->
  ?flow_operation_id:flow_operation_id ->
  ?firewall_arn:resource_arn ->
  unit ->
  start_flow_capture_response

val make_start_flow_capture_request :
  ?minimum_flow_age_in_seconds:age ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  flow_filters:flow_filters ->
  firewall_arn:resource_arn ->
  unit ->
  start_flow_capture_request

val make_start_analysis_report_response :
  analysis_report_id:analysis_report_id -> unit -> start_analysis_report_response

val make_start_analysis_report_request :
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  analysis_type:enabled_analysis_type ->
  unit ->
  start_analysis_report_request

val make_rule_group_metadata :
  ?vendor_name:vendor_name ->
  ?arn:resource_arn ->
  ?name:resource_name ->
  unit ->
  rule_group_metadata

val make_reject_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  reject_network_firewall_transit_gateway_attachment_response

val make_reject_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  reject_network_firewall_transit_gateway_attachment_request

val make_put_resource_policy_response : unit -> unit

val make_put_resource_policy_request :
  policy:policy_string -> resource_arn:resource_arn -> unit -> put_resource_policy_request

val make_proxy_rules_by_request_phase :
  ?post_respons_e:proxy_rule_list ->
  ?pre_reques_t:proxy_rule_list ->
  ?pre_dn_s:proxy_rule_list ->
  unit ->
  proxy_rules_by_request_phase

val make_proxy_rule_group_metadata :
  ?arn:resource_arn -> ?name:resource_name -> unit -> proxy_rule_group_metadata

val make_proxy_rule_group_attachment :
  ?insert_position:insert_position ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  proxy_rule_group_attachment

val make_proxy_rule_group :
  ?tags:tag_list ->
  ?description:description ->
  ?rules:proxy_rules_by_request_phase ->
  ?delete_time:delete_time ->
  ?create_time:create_time ->
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  proxy_rule_group

val make_proxy_metadata : ?arn:resource_arn -> ?name:resource_name -> unit -> proxy_metadata

val make_proxy_configuration_metadata :
  ?arn:resource_arn -> ?name:resource_name -> unit -> proxy_configuration_metadata

val make_list_vpc_endpoint_associations_response :
  ?vpc_endpoint_associations:vpc_endpoint_associations ->
  ?next_token:pagination_token ->
  unit ->
  list_vpc_endpoint_associations_response

val make_list_vpc_endpoint_associations_request :
  ?firewall_arn:resource_arn ->
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_vpc_endpoint_associations_request

val make_list_tls_inspection_configurations_response :
  ?tls_inspection_configurations:tls_inspection_configurations ->
  ?next_token:pagination_token ->
  unit ->
  list_tls_inspection_configurations_response

val make_list_tls_inspection_configurations_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_tls_inspection_configurations_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:pagination_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:tags_pagination_max_results ->
  ?next_token:pagination_token ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_list_rule_groups_response :
  ?rule_groups:rule_groups -> ?next_token:pagination_token -> unit -> list_rule_groups_response

val make_list_rule_groups_request :
  ?type_:rule_group_type ->
  ?subscription_status:subscription_status ->
  ?managed_type:resource_managed_type ->
  ?scope:resource_managed_status ->
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_rule_groups_request

val make_list_proxy_rule_groups_response :
  ?next_token:pagination_token ->
  ?proxy_rule_groups:proxy_rule_groups ->
  unit ->
  list_proxy_rule_groups_response

val make_list_proxy_rule_groups_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_proxy_rule_groups_request

val make_list_proxy_configurations_response :
  ?next_token:pagination_token ->
  ?proxy_configurations:proxy_configurations ->
  unit ->
  list_proxy_configurations_response

val make_list_proxy_configurations_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_proxy_configurations_request

val make_list_proxies_response :
  ?next_token:pagination_token -> ?proxies:proxies -> unit -> list_proxies_response

val make_list_proxies_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_proxies_request

val make_flow_operation_metadata :
  ?flow_operation_status:flow_operation_status ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?flow_operation_type:flow_operation_type ->
  ?flow_operation_id:flow_operation_id ->
  unit ->
  flow_operation_metadata

val make_list_flow_operations_response :
  ?next_token:pagination_token ->
  ?flow_operations:flow_operations ->
  unit ->
  list_flow_operations_response

val make_list_flow_operations_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  ?flow_operation_type:flow_operation_type ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  firewall_arn:resource_arn ->
  unit ->
  list_flow_operations_request

val make_flow :
  ?byte_count:byte_count ->
  ?packet_count:packet_count ->
  ?age:age ->
  ?protocol:protocol_string ->
  ?destination_port:port ->
  ?source_port:port ->
  ?destination_address:address ->
  ?source_address:address ->
  unit ->
  flow

val make_list_flow_operation_results_response :
  ?next_token:pagination_token ->
  ?flows:flows ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?status_message:status_reason ->
  ?flow_operation_status:flow_operation_status ->
  ?flow_operation_id:flow_operation_id ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  ?firewall_arn:resource_arn ->
  unit ->
  list_flow_operation_results_response

val make_list_flow_operation_results_request :
  ?vpc_endpoint_association_arn:resource_arn ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?availability_zone:availability_zone ->
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  flow_operation_id:flow_operation_id ->
  firewall_arn:resource_arn ->
  unit ->
  list_flow_operation_results_request

val make_firewall_metadata :
  ?transit_gateway_attachment_id:transit_gateway_attachment_id ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  unit ->
  firewall_metadata

val make_list_firewalls_response :
  ?firewalls:firewalls -> ?next_token:pagination_token -> unit -> list_firewalls_response

val make_list_firewalls_request :
  ?max_results:pagination_max_results ->
  ?vpc_ids:vpc_ids ->
  ?next_token:pagination_token ->
  unit ->
  list_firewalls_request

val make_firewall_policy_metadata :
  ?arn:resource_arn -> ?name:resource_name -> unit -> firewall_policy_metadata

val make_list_firewall_policies_response :
  ?firewall_policies:firewall_policies ->
  ?next_token:pagination_token ->
  unit ->
  list_firewall_policies_response

val make_list_firewall_policies_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_firewall_policies_request

val make_container_association_summary :
  ?name:resource_name -> ?arn:resource_arn -> unit -> container_association_summary

val make_list_container_associations_response :
  ?next_token:pagination_token ->
  ?container_associations:container_associations ->
  unit ->
  list_container_associations_response

val make_list_container_associations_request :
  ?next_token:pagination_token ->
  ?max_results:pagination_max_results ->
  unit ->
  list_container_associations_request

val make_analysis_report :
  ?status:status ->
  ?report_time:report_time ->
  ?analysis_type:enabled_analysis_type ->
  ?analysis_report_id:analysis_report_id ->
  unit ->
  analysis_report

val make_list_analysis_reports_response :
  ?next_token:pagination_token ->
  ?analysis_reports:analysis_reports ->
  unit ->
  list_analysis_reports_response

val make_list_analysis_reports_request :
  ?max_results:pagination_max_results ->
  ?next_token:pagination_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  unit ->
  list_analysis_reports_request

val make_hits : ?count:count -> unit -> hits

val make_get_analysis_report_results_response :
  ?analysis_report_results:analysis_report_results ->
  ?next_token:analysis_report_next_token ->
  ?analysis_type:enabled_analysis_type ->
  ?report_time:report_time ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?status:status ->
  unit ->
  get_analysis_report_results_response

val make_get_analysis_report_results_request :
  ?max_results:pagination_max_results ->
  ?next_token:analysis_report_next_token ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  analysis_report_id:analysis_report_id ->
  unit ->
  get_analysis_report_results_request

val make_disassociate_subnets_response :
  ?update_token:update_token ->
  ?subnet_mappings:subnet_mappings ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  disassociate_subnets_response

val make_disassociate_subnets_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  subnet_ids:az_subnets ->
  unit ->
  disassociate_subnets_request

val make_availability_zone_mapping :
  availability_zone:availability_zone_mapping_string -> unit -> availability_zone_mapping

val make_disassociate_availability_zones_response :
  ?update_token:update_token ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  disassociate_availability_zones_response

val make_disassociate_availability_zones_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  availability_zone_mappings:availability_zone_mappings ->
  unit ->
  disassociate_availability_zones_request

val make_detach_rule_groups_from_proxy_configuration_response :
  ?update_token:update_token ->
  ?proxy_configuration:proxy_configuration ->
  unit ->
  detach_rule_groups_from_proxy_configuration_response

val make_detach_rule_groups_from_proxy_configuration_request :
  ?rule_group_arns:resource_arn_list ->
  ?rule_group_names:resource_name_list ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  update_token:update_token ->
  unit ->
  detach_rule_groups_from_proxy_configuration_request

val make_describe_vpc_endpoint_association_response :
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  ?vpc_endpoint_association:vpc_endpoint_association ->
  unit ->
  describe_vpc_endpoint_association_response

val make_describe_vpc_endpoint_association_request :
  vpc_endpoint_association_arn:resource_arn -> unit -> describe_vpc_endpoint_association_request

val make_describe_tls_inspection_configuration_response :
  ?tls_inspection_configuration:tls_inspection_configuration ->
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  update_token:update_token ->
  unit ->
  describe_tls_inspection_configuration_response

val make_describe_tls_inspection_configuration_request :
  ?tls_inspection_configuration_name:resource_name ->
  ?tls_inspection_configuration_arn:resource_arn ->
  unit ->
  describe_tls_inspection_configuration_request

val make_describe_rule_group_summary_response :
  ?summary:summary ->
  ?description:description ->
  rule_group_name:resource_name ->
  unit ->
  describe_rule_group_summary_response

val make_describe_rule_group_summary_request :
  ?type_:rule_group_type ->
  ?rule_group_arn:resource_arn ->
  ?rule_group_name:resource_name ->
  unit ->
  describe_rule_group_summary_request

val make_describe_rule_group_metadata_response :
  ?listing_name:listing_name ->
  ?product_id:product_id ->
  ?vendor_name:vendor_name ->
  ?last_modified_time:last_update_time ->
  ?stateful_rule_options:stateful_rule_options ->
  ?capacity:rule_capacity ->
  ?type_:rule_group_type ->
  ?description:description ->
  rule_group_name:resource_name ->
  rule_group_arn:resource_arn ->
  unit ->
  describe_rule_group_metadata_response

val make_describe_rule_group_metadata_request :
  ?type_:rule_group_type ->
  ?rule_group_arn:resource_arn ->
  ?rule_group_name:resource_name ->
  unit ->
  describe_rule_group_metadata_request

val make_describe_rule_group_response :
  ?rule_group:rule_group ->
  rule_group_response:rule_group_response ->
  update_token:update_token ->
  unit ->
  describe_rule_group_response

val make_describe_rule_group_request :
  ?analyze_rule_group:boolean_ ->
  ?type_:rule_group_type ->
  ?rule_group_arn:resource_arn ->
  ?rule_group_name:resource_name ->
  unit ->
  describe_rule_group_request

val make_describe_resource_policy_response :
  ?policy:policy_string -> unit -> describe_resource_policy_response

val make_describe_resource_policy_request :
  resource_arn:resource_arn -> unit -> describe_resource_policy_request

val make_describe_proxy_rule_group_response :
  ?update_token:update_token ->
  ?proxy_rule_group:proxy_rule_group ->
  unit ->
  describe_proxy_rule_group_response

val make_describe_proxy_rule_group_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  describe_proxy_rule_group_request

val make_describe_proxy_rule_response :
  ?update_token:update_token -> ?proxy_rule:proxy_rule -> unit -> describe_proxy_rule_response

val make_describe_proxy_rule_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  proxy_rule_name:resource_name ->
  unit ->
  describe_proxy_rule_request

val make_describe_proxy_configuration_response :
  ?update_token:update_token ->
  ?proxy_configuration:proxy_configuration ->
  unit ->
  describe_proxy_configuration_response

val make_describe_proxy_configuration_request :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  unit ->
  describe_proxy_configuration_request

val make_describe_proxy_resource :
  ?tags:tag_list ->
  ?failure_message:failure_message ->
  ?failure_code:failure_code ->
  ?update_time:update_time ->
  ?delete_time:delete_time ->
  ?create_time:create_time ->
  ?private_dns_name:private_dns_name ->
  ?vpc_endpoint_service_name:vpc_endpoint_service_name ->
  ?tls_intercept_properties:tls_intercept_properties ->
  ?listener_properties:listener_properties ->
  ?proxy_modify_state:proxy_modify_state ->
  ?proxy_state:proxy_state ->
  ?nat_gateway_id:nat_gateway_id ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  ?proxy_arn:resource_arn ->
  ?proxy_name:resource_name ->
  unit ->
  describe_proxy_resource

val make_describe_proxy_response :
  ?update_token:update_token -> ?proxy:describe_proxy_resource -> unit -> describe_proxy_response

val make_describe_proxy_request :
  ?proxy_arn:resource_arn -> ?proxy_name:resource_name -> unit -> describe_proxy_request

val make_describe_logging_configuration_response :
  ?enable_monitoring_dashboard:enable_monitoring_dashboard ->
  ?logging_configuration:logging_configuration ->
  ?firewall_arn:resource_arn ->
  unit ->
  describe_logging_configuration_response

val make_describe_logging_configuration_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  describe_logging_configuration_request

val make_flow_operation :
  ?flow_filters:flow_filters -> ?minimum_flow_age_in_seconds:age -> unit -> flow_operation

val make_describe_flow_operation_response :
  ?flow_operation:flow_operation ->
  ?flow_request_timestamp:flow_request_timestamp ->
  ?status_message:status_reason ->
  ?flow_operation_status:flow_operation_status ->
  ?flow_operation_type:flow_operation_type ->
  ?flow_operation_id:flow_operation_id ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  ?firewall_arn:resource_arn ->
  unit ->
  describe_flow_operation_response

val make_describe_flow_operation_request :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_endpoint_association_arn:resource_arn ->
  ?availability_zone:availability_zone ->
  flow_operation_id:flow_operation_id ->
  firewall_arn:resource_arn ->
  unit ->
  describe_flow_operation_request

val make_describe_firewall_policy_response :
  ?firewall_policy:firewall_policy ->
  firewall_policy_response:firewall_policy_response ->
  update_token:update_token ->
  unit ->
  describe_firewall_policy_response

val make_describe_firewall_policy_request :
  ?firewall_policy_arn:resource_arn ->
  ?firewall_policy_name:resource_name ->
  unit ->
  describe_firewall_policy_request

val make_describe_firewall_metadata_response :
  ?transit_gateway_attachment_id:transit_gateway_attachment_id ->
  ?supported_availability_zones:supported_availability_zones ->
  ?status:firewall_status_value ->
  ?description:description ->
  ?firewall_policy_arn:resource_arn ->
  ?firewall_arn:resource_arn ->
  unit ->
  describe_firewall_metadata_response

val make_describe_firewall_metadata_request :
  ?firewall_arn:resource_arn -> unit -> describe_firewall_metadata_request

val make_firewall :
  ?availability_zone_change_protection:boolean_ ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?transit_gateway_owner_account_id:aws_account_id ->
  ?transit_gateway_id:transit_gateway_id ->
  ?enabled_analysis_types:enabled_analysis_types ->
  ?number_of_associations:number_of_associations ->
  ?encryption_configuration:encryption_configuration ->
  ?tags:tag_list ->
  ?description:description ->
  ?firewall_policy_change_protection:boolean_ ->
  ?subnet_change_protection:boolean_ ->
  ?delete_protection:boolean_ ->
  ?firewall_arn:resource_arn ->
  ?firewall_name:resource_name ->
  firewall_id:resource_id ->
  subnet_mappings:subnet_mappings ->
  vpc_id:vpc_id ->
  firewall_policy_arn:resource_arn ->
  unit ->
  firewall

val make_ip_set_metadata : ?resolved_cidr_count:cidr_count -> unit -> ip_set_metadata

val make_cidr_summary :
  ?ip_set_references:ip_set_metadata_map ->
  ?utilized_cidr_count:cidr_count ->
  ?available_cidr_count:cidr_count ->
  unit ->
  cidr_summary

val make_capacity_usage_summary : ?cid_rs:cidr_summary -> unit -> capacity_usage_summary

val make_firewall_status :
  ?transit_gateway_attachment_sync_state:transit_gateway_attachment_sync_state ->
  ?capacity_usage_summary:capacity_usage_summary ->
  ?sync_states:sync_states ->
  configuration_sync_state_summary:configuration_sync_state ->
  status:firewall_status_value ->
  unit ->
  firewall_status

val make_describe_firewall_response :
  ?firewall_status:firewall_status ->
  ?firewall:firewall ->
  ?update_token:update_token ->
  unit ->
  describe_firewall_response

val make_describe_firewall_request :
  ?firewall_arn:resource_arn -> ?firewall_name:resource_name -> unit -> describe_firewall_request

val make_describe_container_association_response :
  ?update_token:update_token ->
  ?tags:tag_list ->
  ?last_updated_time:container_association_last_updated_time ->
  ?resolved_cidr_count:cidr_count ->
  ?status:container_association_status ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?type_:container_monitoring_type ->
  ?description:description ->
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  describe_container_association_response

val make_describe_container_association_request :
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  describe_container_association_request

val make_delete_vpc_endpoint_association_response :
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  ?vpc_endpoint_association:vpc_endpoint_association ->
  unit ->
  delete_vpc_endpoint_association_response

val make_delete_vpc_endpoint_association_request :
  vpc_endpoint_association_arn:resource_arn -> unit -> delete_vpc_endpoint_association_request

val make_delete_tls_inspection_configuration_response :
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  unit ->
  delete_tls_inspection_configuration_response

val make_delete_tls_inspection_configuration_request :
  ?tls_inspection_configuration_name:resource_name ->
  ?tls_inspection_configuration_arn:resource_arn ->
  unit ->
  delete_tls_inspection_configuration_request

val make_delete_rule_group_response :
  rule_group_response:rule_group_response -> unit -> delete_rule_group_response

val make_delete_rule_group_request :
  ?type_:rule_group_type ->
  ?rule_group_arn:resource_arn ->
  ?rule_group_name:resource_name ->
  unit ->
  delete_rule_group_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:resource_arn -> unit -> delete_resource_policy_request

val make_delete_proxy_rules_response :
  ?proxy_rule_group:proxy_rule_group -> unit -> delete_proxy_rules_response

val make_delete_proxy_rules_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  rules:resource_name_list ->
  unit ->
  delete_proxy_rules_request

val make_delete_proxy_rule_group_response :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  delete_proxy_rule_group_response

val make_delete_proxy_rule_group_request :
  ?proxy_rule_group_arn:resource_arn ->
  ?proxy_rule_group_name:resource_name ->
  unit ->
  delete_proxy_rule_group_request

val make_delete_proxy_configuration_response :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  unit ->
  delete_proxy_configuration_response

val make_delete_proxy_configuration_request :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  unit ->
  delete_proxy_configuration_request

val make_delete_proxy_response :
  ?proxy_arn:resource_arn ->
  ?proxy_name:resource_name ->
  ?nat_gateway_id:nat_gateway_id ->
  unit ->
  delete_proxy_response

val make_delete_proxy_request :
  ?proxy_arn:resource_arn ->
  ?proxy_name:resource_name ->
  nat_gateway_id:nat_gateway_id ->
  unit ->
  delete_proxy_request

val make_delete_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  delete_network_firewall_transit_gateway_attachment_response

val make_delete_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  delete_network_firewall_transit_gateway_attachment_request

val make_delete_firewall_policy_response :
  firewall_policy_response:firewall_policy_response -> unit -> delete_firewall_policy_response

val make_delete_firewall_policy_request :
  ?firewall_policy_arn:resource_arn ->
  ?firewall_policy_name:resource_name ->
  unit ->
  delete_firewall_policy_request

val make_delete_firewall_response :
  ?firewall_status:firewall_status -> ?firewall:firewall -> unit -> delete_firewall_response

val make_delete_firewall_request :
  ?firewall_arn:resource_arn -> ?firewall_name:resource_name -> unit -> delete_firewall_request

val make_delete_container_association_response :
  ?status:container_association_status ->
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  delete_container_association_response

val make_delete_container_association_request :
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  delete_container_association_request

val make_create_vpc_endpoint_association_response :
  ?vpc_endpoint_association_status:vpc_endpoint_association_status ->
  ?vpc_endpoint_association:vpc_endpoint_association ->
  unit ->
  create_vpc_endpoint_association_response

val make_create_vpc_endpoint_association_request :
  ?tags:tag_list ->
  ?description:description ->
  subnet_mapping:subnet_mapping ->
  vpc_id:vpc_id ->
  firewall_arn:resource_arn ->
  unit ->
  create_vpc_endpoint_association_request

val make_create_tls_inspection_configuration_response :
  tls_inspection_configuration_response:tls_inspection_configuration_response ->
  update_token:update_token ->
  unit ->
  create_tls_inspection_configuration_response

val make_create_tls_inspection_configuration_request :
  ?encryption_configuration:encryption_configuration ->
  ?tags:tag_list ->
  ?description:description ->
  tls_inspection_configuration:tls_inspection_configuration ->
  tls_inspection_configuration_name:resource_name ->
  unit ->
  create_tls_inspection_configuration_request

val make_create_rule_group_response :
  rule_group_response:rule_group_response ->
  update_token:update_token ->
  unit ->
  create_rule_group_response

val make_create_rule_group_request :
  ?summary_configuration:summary_configuration ->
  ?analyze_rule_group:boolean_ ->
  ?source_metadata:source_metadata ->
  ?encryption_configuration:encryption_configuration ->
  ?dry_run:boolean_ ->
  ?tags:tag_list ->
  ?description:description ->
  ?rules:rules_string ->
  ?rule_group:rule_group ->
  capacity:rule_capacity ->
  type_:rule_group_type ->
  rule_group_name:resource_name ->
  unit ->
  create_rule_group_request

val make_create_proxy_rules_response :
  ?update_token:update_token ->
  ?proxy_rule_group:proxy_rule_group ->
  unit ->
  create_proxy_rules_response

val make_create_proxy_rule :
  ?insert_position:insert_position ->
  ?conditions:proxy_rule_condition_list ->
  ?action:proxy_rule_phase_action ->
  ?description:description ->
  ?proxy_rule_name:resource_name ->
  unit ->
  create_proxy_rule

val make_create_proxy_rules_by_request_phase :
  ?post_respons_e:create_proxy_rule_list ->
  ?pre_reques_t:create_proxy_rule_list ->
  ?pre_dn_s:create_proxy_rule_list ->
  unit ->
  create_proxy_rules_by_request_phase

val make_create_proxy_rules_request :
  ?proxy_rule_group_name:resource_name ->
  ?proxy_rule_group_arn:resource_arn ->
  rules:create_proxy_rules_by_request_phase ->
  unit ->
  create_proxy_rules_request

val make_create_proxy_rule_group_response :
  ?update_token:update_token ->
  ?proxy_rule_group:proxy_rule_group ->
  unit ->
  create_proxy_rule_group_response

val make_create_proxy_rule_group_request :
  ?tags:tag_list ->
  ?rules:proxy_rules_by_request_phase ->
  ?description:description ->
  proxy_rule_group_name:resource_name ->
  unit ->
  create_proxy_rule_group_request

val make_create_proxy_configuration_response :
  ?update_token:update_token ->
  ?proxy_configuration:proxy_configuration ->
  unit ->
  create_proxy_configuration_response

val make_create_proxy_configuration_request :
  ?tags:tag_list ->
  ?rule_group_arns:resource_arn_list ->
  ?rule_group_names:resource_name_list ->
  ?description:description ->
  default_rule_phase_actions:proxy_config_default_rule_phase_actions_request ->
  proxy_configuration_name:resource_name ->
  unit ->
  create_proxy_configuration_request

val make_create_proxy_response :
  ?update_token:update_token -> ?proxy:proxy -> unit -> create_proxy_response

val make_create_proxy_request :
  ?tags:tag_list ->
  ?listener_properties:listener_properties_request ->
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  tls_intercept_properties:tls_intercept_properties_request ->
  nat_gateway_id:nat_gateway_id ->
  proxy_name:resource_name ->
  unit ->
  create_proxy_request

val make_create_firewall_policy_response :
  firewall_policy_response:firewall_policy_response ->
  update_token:update_token ->
  unit ->
  create_firewall_policy_response

val make_create_firewall_policy_request :
  ?encryption_configuration:encryption_configuration ->
  ?dry_run:boolean_ ->
  ?tags:tag_list ->
  ?description:description ->
  firewall_policy:firewall_policy ->
  firewall_policy_name:resource_name ->
  unit ->
  create_firewall_policy_request

val make_create_firewall_response :
  ?firewall_status:firewall_status -> ?firewall:firewall -> unit -> create_firewall_response

val make_create_firewall_request :
  ?availability_zone_change_protection:boolean_ ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?transit_gateway_id:transit_gateway_id ->
  ?enabled_analysis_types:enabled_analysis_types ->
  ?encryption_configuration:encryption_configuration ->
  ?tags:tag_list ->
  ?description:description ->
  ?firewall_policy_change_protection:boolean_ ->
  ?subnet_change_protection:boolean_ ->
  ?delete_protection:boolean_ ->
  ?subnet_mappings:subnet_mappings ->
  ?vpc_id:vpc_id ->
  firewall_policy_arn:resource_arn ->
  firewall_name:resource_name ->
  unit ->
  create_firewall_request

val make_create_container_association_response :
  ?update_token:update_token ->
  ?tags:tag_list ->
  ?status:container_association_status ->
  ?container_monitoring_configurations:container_monitoring_configurations ->
  ?type_:container_monitoring_type ->
  ?description:description ->
  ?container_association_arn:resource_arn ->
  ?container_association_name:resource_name ->
  unit ->
  create_container_association_response

val make_create_container_association_request :
  ?tags:tag_list ->
  ?description:description ->
  container_monitoring_configurations:container_monitoring_configurations ->
  type_:container_monitoring_type ->
  container_association_name:resource_name ->
  unit ->
  create_container_association_request

val make_attach_rule_groups_to_proxy_configuration_response :
  ?update_token:update_token ->
  ?proxy_configuration:proxy_configuration ->
  unit ->
  attach_rule_groups_to_proxy_configuration_response

val make_attach_rule_groups_to_proxy_configuration_request :
  ?proxy_configuration_arn:resource_arn ->
  ?proxy_configuration_name:resource_name ->
  update_token:update_token ->
  rule_groups:proxy_rule_group_attachment_list ->
  unit ->
  attach_rule_groups_to_proxy_configuration_request

val make_associate_subnets_response :
  ?update_token:update_token ->
  ?subnet_mappings:subnet_mappings ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  associate_subnets_response

val make_associate_subnets_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  subnet_mappings:subnet_mappings ->
  unit ->
  associate_subnets_request

val make_associate_firewall_policy_response :
  ?update_token:update_token ->
  ?firewall_policy_arn:resource_arn ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  associate_firewall_policy_response

val make_associate_firewall_policy_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  firewall_policy_arn:resource_arn ->
  unit ->
  associate_firewall_policy_request

val make_associate_availability_zones_response :
  ?update_token:update_token ->
  ?availability_zone_mappings:availability_zone_mappings ->
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  unit ->
  associate_availability_zones_response

val make_associate_availability_zones_request :
  ?firewall_name:resource_name ->
  ?firewall_arn:resource_arn ->
  ?update_token:update_token ->
  availability_zone_mappings:availability_zone_mappings ->
  unit ->
  associate_availability_zones_request

val make_accept_network_firewall_transit_gateway_attachment_response :
  transit_gateway_attachment_status:transit_gateway_attachment_status ->
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  accept_network_firewall_transit_gateway_attachment_response

val make_accept_network_firewall_transit_gateway_attachment_request :
  transit_gateway_attachment_id:transit_gateway_attachment_id ->
  unit ->
  accept_network_firewall_transit_gateway_attachment_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
