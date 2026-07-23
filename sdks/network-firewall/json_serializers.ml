open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_to_yojson = string_to_yojson
let status_message_to_yojson = string_to_yojson

let attachment_status_to_yojson (x : attachment_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | ERROR -> `String "ERROR"
  | SCALING -> `String "SCALING"
  | READY -> `String "READY"

let endpoint_id_to_yojson = string_to_yojson
let az_subnet_to_yojson = string_to_yojson

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("SubnetId", option_to_yojson az_subnet_to_yojson x.subnet_id);
      ("EndpointId", option_to_yojson endpoint_id_to_yojson x.endpoint_id);
      ("Status", option_to_yojson attachment_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let az_sync_state_to_yojson (x : az_sync_state) =
  assoc_to_yojson [ ("Attachment", option_to_yojson attachment_to_yojson x.attachment) ]

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let transit_gateway_attachment_status_to_yojson (x : transit_gateway_attachment_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | FAILED -> `String "FAILED"
  | ERROR -> `String "ERROR"
  | READY -> `String "READY"
  | PENDING_ACCEPTANCE -> `String "PENDING_ACCEPTANCE"
  | REJECTING -> `String "REJECTING"
  | REJECTED -> `String "REJECTED"

let transit_gateway_attachment_id_to_yojson = string_to_yojson

let accept_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : accept_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
    ]

let accept_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : accept_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let dimension_value_to_yojson = string_to_yojson

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson [ ("Value", Some (dimension_value_to_yojson x.value)) ]

let dimensions_to_yojson tree = list_to_yojson dimension_to_yojson tree

let publish_metric_action_to_yojson (x : publish_metric_action) =
  assoc_to_yojson [ ("Dimensions", Some (dimensions_to_yojson x.dimensions)) ]

let action_definition_to_yojson (x : action_definition) =
  assoc_to_yojson
    [
      ( "PublishMetricAction",
        option_to_yojson publish_metric_action_to_yojson x.publish_metric_action );
    ]

let action_name_to_yojson = string_to_yojson
let address_definition_to_yojson = string_to_yojson

let address_to_yojson (x : address) =
  assoc_to_yojson
    [ ("AddressDefinition", Some (address_definition_to_yojson x.address_definition)) ]

let addresses_to_yojson tree = list_to_yojson address_to_yojson tree
let age_to_yojson = int_to_yojson
let status_to_yojson = string_to_yojson
let report_time_to_yojson = timestamp_epoch_seconds_to_yojson

let enabled_analysis_type_to_yojson (x : enabled_analysis_type) =
  match x with TLS_SNI -> `String "TLS_SNI" | HTTP_HOST -> `String "HTTP_HOST"

let analysis_report_id_to_yojson = string_to_yojson

let analysis_report_to_yojson (x : analysis_report) =
  assoc_to_yojson
    [
      ("AnalysisReportId", option_to_yojson analysis_report_id_to_yojson x.analysis_report_id);
      ("AnalysisType", option_to_yojson enabled_analysis_type_to_yojson x.analysis_type);
      ("ReportTime", option_to_yojson report_time_to_yojson x.report_time);
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let analysis_report_next_token_to_yojson = string_to_yojson
let count_to_yojson = int_to_yojson

let unique_sources_to_yojson (x : unique_sources) =
  assoc_to_yojson [ ("Count", option_to_yojson count_to_yojson x.count) ]

let hits_to_yojson (x : hits) =
  assoc_to_yojson [ ("Count", option_to_yojson count_to_yojson x.count) ]

let domain_to_yojson = string_to_yojson
let last_accessed_to_yojson = timestamp_epoch_seconds_to_yojson
let first_accessed_to_yojson = timestamp_epoch_seconds_to_yojson
let collection_member__string_to_yojson = string_to_yojson

let analysis_type_report_result_to_yojson (x : analysis_type_report_result) =
  assoc_to_yojson
    [
      ("Protocol", option_to_yojson collection_member__string_to_yojson x.protocol);
      ("FirstAccessed", option_to_yojson first_accessed_to_yojson x.first_accessed);
      ("LastAccessed", option_to_yojson last_accessed_to_yojson x.last_accessed);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("Hits", option_to_yojson hits_to_yojson x.hits);
      ("UniqueSources", option_to_yojson unique_sources_to_yojson x.unique_sources);
    ]

let analysis_report_results_to_yojson tree =
  list_to_yojson analysis_type_report_result_to_yojson tree

let analysis_reports_to_yojson tree = list_to_yojson analysis_report_to_yojson tree

let identified_type_to_yojson (x : identified_type) =
  match x with
  | STATELESS_RULE_FORWARDING_ASYMMETRICALLY -> `String "STATELESS_RULE_FORWARDING_ASYMMETRICALLY"
  | STATELESS_RULE_CONTAINS_TCP_FLAGS -> `String "STATELESS_RULE_CONTAINS_TCP_FLAGS"

let rule_id_list_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let analysis_result_to_yojson (x : analysis_result) =
  assoc_to_yojson
    [
      ("IdentifiedRuleIds", option_to_yojson rule_id_list_to_yojson x.identified_rule_ids);
      ("IdentifiedType", option_to_yojson identified_type_to_yojson x.identified_type);
      ("AnalysisDetail", option_to_yojson collection_member__string_to_yojson x.analysis_detail);
    ]

let analysis_result_list_to_yojson tree = list_to_yojson analysis_result_to_yojson tree

let invalid_token_exception_to_yojson (x : invalid_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_capacity_exception_to_yojson (x : insufficient_capacity_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_token_to_yojson = string_to_yojson
let availability_zone_mapping_string_to_yojson = string_to_yojson

let availability_zone_mapping_to_yojson (x : availability_zone_mapping) =
  assoc_to_yojson
    [ ("AvailabilityZone", Some (availability_zone_mapping_string_to_yojson x.availability_zone)) ]

let availability_zone_mappings_to_yojson tree =
  list_to_yojson availability_zone_mapping_to_yojson tree

let resource_name_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let associate_availability_zones_response_to_yojson (x : associate_availability_zones_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let associate_availability_zones_request_to_yojson (x : associate_availability_zones_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneMappings",
        Some (availability_zone_mappings_to_yojson x.availability_zone_mappings) );
    ]

let associate_firewall_policy_response_to_yojson (x : associate_firewall_policy_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let associate_firewall_policy_request_to_yojson (x : associate_firewall_policy_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
    ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4" | IPV6 -> `String "IPV6"

let subnet_mapping_to_yojson (x : subnet_mapping) =
  assoc_to_yojson
    [
      ("SubnetId", Some (collection_member__string_to_yojson x.subnet_id));
      ("IPAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let subnet_mappings_to_yojson tree = list_to_yojson subnet_mapping_to_yojson tree

let associate_subnets_response_to_yojson (x : associate_subnets_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let associate_subnets_request_to_yojson (x : associate_subnets_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetMappings", Some (subnet_mappings_to_yojson x.subnet_mappings));
    ]

let availability_zone_to_yojson = string_to_yojson

let association_sync_state_to_yojson tree =
  map_to_yojson availability_zone_to_yojson az_sync_state_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let proxy_rule_phase_action_to_yojson (x : proxy_rule_phase_action) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY" | ALERT -> `String "ALERT"

let proxy_config_default_rule_phase_actions_request_to_yojson
    (x : proxy_config_default_rule_phase_actions_request) =
  assoc_to_yojson
    [
      ("PreDNS", option_to_yojson proxy_rule_phase_action_to_yojson x.pre_dn_s);
      ("PreREQUEST", option_to_yojson proxy_rule_phase_action_to_yojson x.pre_reques_t);
      ("PostRESPONSE", option_to_yojson proxy_rule_phase_action_to_yojson x.post_respons_e);
    ]

let proxy_config_rule_group_priority_to_yojson = int_to_yojson
let proxy_config_rule_group_type_to_yojson = string_to_yojson

let proxy_config_rule_group_to_yojson (x : proxy_config_rule_group) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("Type", option_to_yojson proxy_config_rule_group_type_to_yojson x.type_);
      ("Priority", option_to_yojson proxy_config_rule_group_priority_to_yojson x.priority);
    ]

let proxy_config_rule_group_set_to_yojson tree =
  list_to_yojson proxy_config_rule_group_to_yojson tree

let delete_time_to_yojson = timestamp_epoch_seconds_to_yojson
let create_time_to_yojson = timestamp_epoch_seconds_to_yojson
let description_to_yojson = string_to_yojson

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("RuleGroups", option_to_yojson proxy_config_rule_group_set_to_yojson x.rule_groups);
      ( "DefaultRulePhaseActions",
        option_to_yojson proxy_config_default_rule_phase_actions_request_to_yojson
          x.default_rule_phase_actions );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let attach_rule_groups_to_proxy_configuration_response_to_yojson
    (x : attach_rule_groups_to_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let insert_position_to_yojson = int_to_yojson

let proxy_rule_group_attachment_to_yojson (x : proxy_rule_group_attachment) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("InsertPosition", option_to_yojson insert_position_to_yojson x.insert_position);
    ]

let proxy_rule_group_attachment_list_to_yojson tree =
  list_to_yojson proxy_rule_group_attachment_to_yojson tree

let attach_rule_groups_to_proxy_configuration_request_to_yojson
    (x : attach_rule_groups_to_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("RuleGroups", Some (proxy_rule_group_attachment_list_to_yojson x.rule_groups));
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let attachment_id_to_yojson = string_to_yojson

let availability_zone_metadata_to_yojson (x : availability_zone_metadata) =
  assoc_to_yojson
    [ ("IPAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type) ]

let az_subnets_to_yojson tree = list_to_yojson az_subnet_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let byte_count_to_yojson = long_to_yojson
let cidr_count_to_yojson = int_to_yojson

let ip_set_metadata_to_yojson (x : ip_set_metadata) =
  assoc_to_yojson
    [ ("ResolvedCIDRCount", option_to_yojson cidr_count_to_yojson x.resolved_cidr_count) ]

let ip_set_arn_to_yojson = string_to_yojson

let ip_set_metadata_map_to_yojson tree =
  map_to_yojson ip_set_arn_to_yojson ip_set_metadata_to_yojson tree

let cidr_summary_to_yojson (x : cidr_summary) =
  assoc_to_yojson
    [
      ("AvailableCIDRCount", option_to_yojson cidr_count_to_yojson x.available_cidr_count);
      ("UtilizedCIDRCount", option_to_yojson cidr_count_to_yojson x.utilized_cidr_count);
      ("IPSetReferences", option_to_yojson ip_set_metadata_map_to_yojson x.ip_set_references);
    ]

let capacity_usage_summary_to_yojson (x : capacity_usage_summary) =
  assoc_to_yojson [ ("CIDRs", option_to_yojson cidr_summary_to_yojson x.cid_rs) ]

let status_reason_to_yojson = string_to_yojson

let tls_certificate_data_to_yojson (x : tls_certificate_data) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson resource_arn_to_yojson x.certificate_arn);
      ( "CertificateSerial",
        option_to_yojson collection_member__string_to_yojson x.certificate_serial );
      ("Status", option_to_yojson collection_member__string_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
    ]

let certificates_to_yojson tree = list_to_yojson tls_certificate_data_to_yojson tree

let revocation_check_action_to_yojson (x : revocation_check_action) =
  match x with PASS -> `String "PASS" | DROP -> `String "DROP" | REJECT -> `String "REJECT"

let check_certificate_revocation_status_actions_to_yojson
    (x : check_certificate_revocation_status_actions) =
  assoc_to_yojson
    [
      ( "RevokedStatusAction",
        option_to_yojson revocation_check_action_to_yojson x.revoked_status_action );
      ( "UnknownStatusAction",
        option_to_yojson revocation_check_action_to_yojson x.unknown_status_action );
    ]

let condition_key_to_yojson = string_to_yojson
let condition_operator_to_yojson = string_to_yojson

let configuration_sync_state_to_yojson (x : configuration_sync_state) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_SYNC -> `String "IN_SYNC"
  | CAPACITY_CONSTRAINED -> `String "CAPACITY_CONSTRAINED"

let container_association_last_updated_time_to_yojson = timestamp_epoch_seconds_to_yojson

let container_association_status_to_yojson (x : container_association_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"

let container_association_summary_to_yojson (x : container_association_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let container_associations_to_yojson tree =
  list_to_yojson container_association_summary_to_yojson tree

let container_attribute_value_to_yojson = string_to_yojson
let container_attribute_key_to_yojson = string_to_yojson

let container_attribute_to_yojson (x : container_attribute) =
  assoc_to_yojson
    [
      ("Key", Some (container_attribute_key_to_yojson x.key));
      ("Value", Some (container_attribute_value_to_yojson x.value));
    ]

let container_attributes_to_yojson tree = list_to_yojson container_attribute_to_yojson tree

let container_monitoring_configuration_to_yojson (x : container_monitoring_configuration) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (resource_arn_to_yojson x.cluster_arn));
      ("AttributeFilters", option_to_yojson container_attributes_to_yojson x.attribute_filters);
    ]

let container_monitoring_configurations_to_yojson tree =
  list_to_yojson container_monitoring_configuration_to_yojson tree

let container_monitoring_type_to_yojson (x : container_monitoring_type) =
  match x with ECS -> `String "ECS" | EKS -> `String "EKS"

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_container_association_response_to_yojson (x : create_container_association_response) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let create_container_association_request_to_yojson (x : create_container_association_request) =
  assoc_to_yojson
    [
      ("ContainerAssociationName", Some (resource_name_to_yojson x.container_association_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", Some (container_monitoring_type_to_yojson x.type_));
      ( "ContainerMonitoringConfigurations",
        Some (container_monitoring_configurations_to_yojson x.container_monitoring_configurations)
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let transit_gateway_attachment_sync_state_message_to_yojson = string_to_yojson

let transit_gateway_attachment_sync_state_to_yojson (x : transit_gateway_attachment_sync_state) =
  assoc_to_yojson
    [
      ("AttachmentId", option_to_yojson attachment_id_to_yojson x.attachment_id);
      ( "TransitGatewayAttachmentStatus",
        option_to_yojson transit_gateway_attachment_status_to_yojson
          x.transit_gateway_attachment_status );
      ( "StatusMessage",
        option_to_yojson transit_gateway_attachment_sync_state_message_to_yojson x.status_message );
    ]

let per_object_sync_status_to_yojson (x : per_object_sync_status) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_SYNC -> `String "IN_SYNC"
  | CAPACITY_CONSTRAINED -> `String "CAPACITY_CONSTRAINED"
  | NOT_SUBSCRIBED -> `String "NOT_SUBSCRIBED"
  | DEPRECATED -> `String "DEPRECATED"

let per_object_status_to_yojson (x : per_object_status) =
  assoc_to_yojson
    [
      ("SyncStatus", option_to_yojson per_object_sync_status_to_yojson x.sync_status);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let sync_state_config_to_yojson tree =
  map_to_yojson resource_name_to_yojson per_object_status_to_yojson tree

let sync_state_to_yojson (x : sync_state) =
  assoc_to_yojson
    [
      ("Attachment", option_to_yojson attachment_to_yojson x.attachment);
      ("Config", option_to_yojson sync_state_config_to_yojson x.config);
    ]

let sync_states_to_yojson tree = map_to_yojson availability_zone_to_yojson sync_state_to_yojson tree

let firewall_status_value_to_yojson (x : firewall_status_value) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | DELETING -> `String "DELETING"
  | READY -> `String "READY"

let firewall_status_to_yojson (x : firewall_status) =
  assoc_to_yojson
    [
      ("Status", Some (firewall_status_value_to_yojson x.status));
      ( "ConfigurationSyncStateSummary",
        Some (configuration_sync_state_to_yojson x.configuration_sync_state_summary) );
      ("SyncStates", option_to_yojson sync_states_to_yojson x.sync_states);
      ( "CapacityUsageSummary",
        option_to_yojson capacity_usage_summary_to_yojson x.capacity_usage_summary );
      ( "TransitGatewayAttachmentSyncState",
        option_to_yojson transit_gateway_attachment_sync_state_to_yojson
          x.transit_gateway_attachment_sync_state );
    ]

let transit_gateway_id_to_yojson = string_to_yojson
let enabled_analysis_types_to_yojson tree = list_to_yojson enabled_analysis_type_to_yojson tree
let number_of_associations_to_yojson = int_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | CUSTOMER_KMS -> `String "CUSTOMER_KMS"
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"

let key_id_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
      ("Type", Some (encryption_type_to_yojson x.type_));
    ]

let resource_id_to_yojson = string_to_yojson
let vpc_id_to_yojson = string_to_yojson

let firewall_to_yojson (x : firewall) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetMappings", Some (subnet_mappings_to_yojson x.subnet_mappings));
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallId", Some (resource_id_to_yojson x.firewall_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ("TransitGatewayId", option_to_yojson transit_gateway_id_to_yojson x.transit_gateway_id);
      ( "TransitGatewayOwnerAccountId",
        option_to_yojson aws_account_id_to_yojson x.transit_gateway_owner_account_id );
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
    ]

let create_firewall_response_to_yojson (x : create_firewall_response) =
  assoc_to_yojson
    [
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
    ]

let create_firewall_request_to_yojson (x : create_firewall_request) =
  assoc_to_yojson
    [
      ("FirewallName", Some (resource_name_to_yojson x.firewall_name));
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ("TransitGatewayId", option_to_yojson transit_gateway_id_to_yojson x.transit_gateway_id);
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
    ]

let last_update_time_to_yojson = timestamp_epoch_seconds_to_yojson
let rule_capacity_to_yojson = int_to_yojson

let resource_status_to_yojson (x : resource_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | ERROR -> `String "ERROR"

let firewall_policy_response_to_yojson (x : firewall_policy_response) =
  assoc_to_yojson
    [
      ("FirewallPolicyName", Some (resource_name_to_yojson x.firewall_policy_name));
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("FirewallPolicyId", Some (resource_id_to_yojson x.firewall_policy_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallPolicyStatus", option_to_yojson resource_status_to_yojson x.firewall_policy_status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ConsumedStatelessRuleCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateless_rule_capacity );
      ( "ConsumedStatefulRuleCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateful_rule_capacity );
      ( "ConsumedStatefulDomainCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateful_domain_capacity );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
    ]

let create_firewall_policy_response_to_yojson (x : create_firewall_policy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
    ]

let enable_tls_session_holding_to_yojson = bool_to_yojson
let variable_definition_to_yojson = string_to_yojson
let variable_definition_list_to_yojson tree = list_to_yojson variable_definition_to_yojson tree

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson [ ("Definition", Some (variable_definition_list_to_yojson x.definition)) ]

let rule_variable_name_to_yojson = string_to_yojson
let ip_sets_to_yojson tree = map_to_yojson rule_variable_name_to_yojson ip_set_to_yojson tree

let policy_variables_to_yojson (x : policy_variables) =
  assoc_to_yojson [ ("RuleVariables", option_to_yojson ip_sets_to_yojson x.rule_variables) ]

let tcp_idle_timeout_range_bound_to_yojson = int_to_yojson

let flow_timeouts_to_yojson (x : flow_timeouts) =
  assoc_to_yojson
    [
      ( "TcpIdleTimeoutSeconds",
        option_to_yojson tcp_idle_timeout_range_bound_to_yojson x.tcp_idle_timeout_seconds );
    ]

let stream_exception_policy_to_yojson (x : stream_exception_policy) =
  match x with
  | DROP -> `String "DROP"
  | CONTINUE -> `String "CONTINUE"
  | REJECT -> `String "REJECT"

let rule_order_to_yojson (x : rule_order) =
  match x with
  | DEFAULT_ACTION_ORDER -> `String "DEFAULT_ACTION_ORDER"
  | STRICT_ORDER -> `String "STRICT_ORDER"

let stateful_engine_options_to_yojson (x : stateful_engine_options) =
  assoc_to_yojson
    [
      ("RuleOrder", option_to_yojson rule_order_to_yojson x.rule_order);
      ( "StreamExceptionPolicy",
        option_to_yojson stream_exception_policy_to_yojson x.stream_exception_policy );
      ("FlowTimeouts", option_to_yojson flow_timeouts_to_yojson x.flow_timeouts);
    ]

let stateful_actions_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree
let deep_threat_inspection_to_yojson = bool_to_yojson

let override_action_to_yojson (x : override_action) =
  match x with DROP_TO_ALERT -> `String "DROP_TO_ALERT"

let stateful_rule_group_override_to_yojson (x : stateful_rule_group_override) =
  assoc_to_yojson [ ("Action", option_to_yojson override_action_to_yojson x.action) ]

let priority_to_yojson = int_to_yojson

let stateful_rule_group_reference_to_yojson (x : stateful_rule_group_reference) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Override", option_to_yojson stateful_rule_group_override_to_yojson x.override);
      ( "DeepThreatInspection",
        option_to_yojson deep_threat_inspection_to_yojson x.deep_threat_inspection );
    ]

let stateful_rule_group_references_to_yojson tree =
  list_to_yojson stateful_rule_group_reference_to_yojson tree

let custom_action_to_yojson (x : custom_action) =
  assoc_to_yojson
    [
      ("ActionName", Some (action_name_to_yojson x.action_name));
      ("ActionDefinition", Some (action_definition_to_yojson x.action_definition));
    ]

let custom_actions_to_yojson tree = list_to_yojson custom_action_to_yojson tree
let stateless_actions_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let stateless_rule_group_reference_to_yojson (x : stateless_rule_group_reference) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Priority", Some (priority_to_yojson x.priority));
    ]

let stateless_rule_group_references_to_yojson tree =
  list_to_yojson stateless_rule_group_reference_to_yojson tree

let firewall_policy_to_yojson (x : firewall_policy) =
  assoc_to_yojson
    [
      ( "StatelessRuleGroupReferences",
        option_to_yojson stateless_rule_group_references_to_yojson x.stateless_rule_group_references
      );
      ("StatelessDefaultActions", Some (stateless_actions_to_yojson x.stateless_default_actions));
      ( "StatelessFragmentDefaultActions",
        Some (stateless_actions_to_yojson x.stateless_fragment_default_actions) );
      ( "StatelessCustomActions",
        option_to_yojson custom_actions_to_yojson x.stateless_custom_actions );
      ( "StatefulRuleGroupReferences",
        option_to_yojson stateful_rule_group_references_to_yojson x.stateful_rule_group_references
      );
      ( "StatefulDefaultActions",
        option_to_yojson stateful_actions_to_yojson x.stateful_default_actions );
      ( "StatefulEngineOptions",
        option_to_yojson stateful_engine_options_to_yojson x.stateful_engine_options );
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
      ("PolicyVariables", option_to_yojson policy_variables_to_yojson x.policy_variables);
      ( "EnableTLSSessionHolding",
        option_to_yojson enable_tls_session_holding_to_yojson x.enable_tls_session_holding );
    ]

let create_firewall_policy_request_to_yojson (x : create_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyName", Some (resource_name_to_yojson x.firewall_policy_name));
      ("FirewallPolicy", Some (firewall_policy_to_yojson x.firewall_policy));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tls_intercept_mode_to_yojson (x : tls_intercept_mode) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let tls_intercept_properties_to_yojson (x : tls_intercept_properties) =
  assoc_to_yojson
    [
      ("PcaArn", option_to_yojson resource_arn_to_yojson x.pca_arn);
      ("TlsInterceptMode", option_to_yojson tls_intercept_mode_to_yojson x.tls_intercept_mode);
    ]

let listener_property_type_to_yojson (x : listener_property_type) =
  match x with HTTP -> `String "HTTP" | HTTPS -> `String "HTTPS"

let nat_gateway_port_to_yojson = int_to_yojson

let listener_property_to_yojson (x : listener_property) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson nat_gateway_port_to_yojson x.port);
      ("Type", option_to_yojson listener_property_type_to_yojson x.type_);
    ]

let listener_properties_to_yojson tree = list_to_yojson listener_property_to_yojson tree
let nat_gateway_id_to_yojson = string_to_yojson

let proxy_modify_state_to_yojson (x : proxy_modify_state) =
  match x with
  | MODIFYING -> `String "MODIFYING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let proxy_state_to_yojson (x : proxy_state) =
  match x with
  | ATTACHING -> `String "ATTACHING"
  | ATTACHED -> `String "ATTACHED"
  | DETACHING -> `String "DETACHING"
  | DETACHED -> `String "DETACHED"
  | ATTACH_FAILED -> `String "ATTACH_FAILED"
  | DETACH_FAILED -> `String "DETACH_FAILED"

let failure_message_to_yojson = string_to_yojson
let failure_code_to_yojson = string_to_yojson
let update_time_to_yojson = timestamp_epoch_seconds_to_yojson

let proxy_to_yojson (x : proxy) =
  assoc_to_yojson
    [
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("UpdateTime", option_to_yojson update_time_to_yojson x.update_time);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
      ("ProxyState", option_to_yojson proxy_state_to_yojson x.proxy_state);
      ("ProxyModifyState", option_to_yojson proxy_modify_state_to_yojson x.proxy_modify_state);
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ListenerProperties", option_to_yojson listener_properties_to_yojson x.listener_properties);
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_to_yojson x.tls_intercept_properties );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_proxy_response_to_yojson (x : create_proxy_response) =
  assoc_to_yojson
    [
      ("Proxy", option_to_yojson proxy_to_yojson x.proxy);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let tls_intercept_properties_request_to_yojson (x : tls_intercept_properties_request) =
  assoc_to_yojson
    [
      ("PcaArn", option_to_yojson resource_arn_to_yojson x.pca_arn);
      ("TlsInterceptMode", option_to_yojson tls_intercept_mode_to_yojson x.tls_intercept_mode);
    ]

let listener_property_request_to_yojson (x : listener_property_request) =
  assoc_to_yojson
    [
      ("Port", Some (nat_gateway_port_to_yojson x.port));
      ("Type", Some (listener_property_type_to_yojson x.type_));
    ]

let listener_properties_request_to_yojson tree =
  list_to_yojson listener_property_request_to_yojson tree

let create_proxy_request_to_yojson (x : create_proxy_request) =
  assoc_to_yojson
    [
      ("ProxyName", Some (resource_name_to_yojson x.proxy_name));
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ( "ListenerProperties",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties );
      ( "TlsInterceptProperties",
        Some (tls_intercept_properties_request_to_yojson x.tls_intercept_properties) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_proxy_configuration_response_to_yojson (x : create_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree
let resource_name_list_to_yojson tree = list_to_yojson resource_name_to_yojson tree

let create_proxy_configuration_request_to_yojson (x : create_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", Some (resource_name_to_yojson x.proxy_configuration_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RuleGroupNames", option_to_yojson resource_name_list_to_yojson x.rule_group_names);
      ("RuleGroupArns", option_to_yojson resource_arn_list_to_yojson x.rule_group_arns);
      ( "DefaultRulePhaseActions",
        Some
          (proxy_config_default_rule_phase_actions_request_to_yojson x.default_rule_phase_actions)
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let proxy_condition_value_to_yojson = string_to_yojson
let proxy_condition_value_list_to_yojson tree = list_to_yojson proxy_condition_value_to_yojson tree

let proxy_rule_condition_to_yojson (x : proxy_rule_condition) =
  assoc_to_yojson
    [
      ("ConditionOperator", option_to_yojson condition_operator_to_yojson x.condition_operator);
      ("ConditionKey", option_to_yojson condition_key_to_yojson x.condition_key);
      ("ConditionValues", option_to_yojson proxy_condition_value_list_to_yojson x.condition_values);
    ]

let proxy_rule_condition_list_to_yojson tree = list_to_yojson proxy_rule_condition_to_yojson tree

let create_proxy_rule_to_yojson (x : create_proxy_rule) =
  assoc_to_yojson
    [
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("Conditions", option_to_yojson proxy_rule_condition_list_to_yojson x.conditions);
      ("InsertPosition", option_to_yojson insert_position_to_yojson x.insert_position);
    ]

let proxy_rule_to_yojson (x : proxy_rule) =
  assoc_to_yojson
    [
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("Conditions", option_to_yojson proxy_rule_condition_list_to_yojson x.conditions);
    ]

let proxy_rule_list_to_yojson tree = list_to_yojson proxy_rule_to_yojson tree

let proxy_rules_by_request_phase_to_yojson (x : proxy_rules_by_request_phase) =
  assoc_to_yojson
    [
      ("PreDNS", option_to_yojson proxy_rule_list_to_yojson x.pre_dn_s);
      ("PreREQUEST", option_to_yojson proxy_rule_list_to_yojson x.pre_reques_t);
      ("PostRESPONSE", option_to_yojson proxy_rule_list_to_yojson x.post_respons_e);
    ]

let proxy_rule_group_to_yojson (x : proxy_rule_group) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("Rules", option_to_yojson proxy_rules_by_request_phase_to_yojson x.rules);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_proxy_rule_group_response_to_yojson (x : create_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let create_proxy_rule_group_request_to_yojson (x : create_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", Some (resource_name_to_yojson x.proxy_rule_group_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Rules", option_to_yojson proxy_rules_by_request_phase_to_yojson x.rules);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_proxy_rule_list_to_yojson tree = list_to_yojson create_proxy_rule_to_yojson tree

let create_proxy_rules_response_to_yojson (x : create_proxy_rules_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let create_proxy_rules_by_request_phase_to_yojson (x : create_proxy_rules_by_request_phase) =
  assoc_to_yojson
    [
      ("PreDNS", option_to_yojson create_proxy_rule_list_to_yojson x.pre_dn_s);
      ("PreREQUEST", option_to_yojson create_proxy_rule_list_to_yojson x.pre_reques_t);
      ("PostRESPONSE", option_to_yojson create_proxy_rule_list_to_yojson x.post_respons_e);
    ]

let create_proxy_rules_request_to_yojson (x : create_proxy_rules_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("Rules", Some (create_proxy_rules_by_request_phase_to_yojson x.rules));
    ]

let summary_rule_option_to_yojson (x : summary_rule_option) =
  match x with SID -> `String "SID" | MSG -> `String "MSG" | METADATA -> `String "METADATA"

let summary_rule_options_to_yojson tree = list_to_yojson summary_rule_option_to_yojson tree

let summary_configuration_to_yojson (x : summary_configuration) =
  assoc_to_yojson
    [ ("RuleOptions", option_to_yojson summary_rule_options_to_yojson x.rule_options) ]

let source_metadata_to_yojson (x : source_metadata) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson resource_arn_to_yojson x.source_arn);
      ("SourceUpdateToken", option_to_yojson update_token_to_yojson x.source_update_token);
    ]

let rule_group_type_to_yojson (x : rule_group_type) =
  match x with
  | STATELESS -> `String "STATELESS"
  | STATEFUL -> `String "STATEFUL"
  | STATEFUL_DOMAIN -> `String "STATEFUL_DOMAIN"

let rule_group_response_to_yojson (x : rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroupArn", Some (resource_arn_to_yojson x.rule_group_arn));
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Capacity", option_to_yojson rule_capacity_to_yojson x.capacity);
      ("RuleGroupStatus", option_to_yojson resource_status_to_yojson x.rule_group_status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ConsumedCapacity", option_to_yojson rule_capacity_to_yojson x.consumed_capacity);
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ("SnsTopic", option_to_yojson resource_arn_to_yojson x.sns_topic);
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ("AnalysisResults", option_to_yojson analysis_result_list_to_yojson x.analysis_results);
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
    ]

let create_rule_group_response_to_yojson (x : create_rule_group_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
    ]

let rules_string_to_yojson = string_to_yojson

let stateful_rule_options_to_yojson (x : stateful_rule_options) =
  assoc_to_yojson [ ("RuleOrder", option_to_yojson rule_order_to_yojson x.rule_order) ]

let tcp_flag_to_yojson (x : tcp_flag) =
  match x with
  | FIN -> `String "FIN"
  | SYN -> `String "SYN"
  | RST -> `String "RST"
  | PSH -> `String "PSH"
  | ACK -> `String "ACK"
  | URG -> `String "URG"
  | ECE -> `String "ECE"
  | CWR -> `String "CWR"

let flags_to_yojson tree = list_to_yojson tcp_flag_to_yojson tree

let tcp_flag_field_to_yojson (x : tcp_flag_field) =
  assoc_to_yojson
    [
      ("Flags", Some (flags_to_yojson x.flags)); ("Masks", option_to_yojson flags_to_yojson x.masks);
    ]

let tcp_flags_to_yojson tree = list_to_yojson tcp_flag_field_to_yojson tree
let protocol_number_to_yojson = int_to_yojson
let protocol_numbers_to_yojson tree = list_to_yojson protocol_number_to_yojson tree
let port_range_bound_to_yojson = int_to_yojson

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("FromPort", Some (port_range_bound_to_yojson x.from_port));
      ("ToPort", Some (port_range_bound_to_yojson x.to_port));
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree

let match_attributes_to_yojson (x : match_attributes) =
  assoc_to_yojson
    [
      ("Sources", option_to_yojson addresses_to_yojson x.sources);
      ("Destinations", option_to_yojson addresses_to_yojson x.destinations);
      ("SourcePorts", option_to_yojson port_ranges_to_yojson x.source_ports);
      ("DestinationPorts", option_to_yojson port_ranges_to_yojson x.destination_ports);
      ("Protocols", option_to_yojson protocol_numbers_to_yojson x.protocols);
      ("TCPFlags", option_to_yojson tcp_flags_to_yojson x.tcp_flags);
    ]

let rule_definition_to_yojson (x : rule_definition) =
  assoc_to_yojson
    [
      ("MatchAttributes", Some (match_attributes_to_yojson x.match_attributes));
      ("Actions", Some (stateless_actions_to_yojson x.actions));
    ]

let stateless_rule_to_yojson (x : stateless_rule) =
  assoc_to_yojson
    [
      ("RuleDefinition", Some (rule_definition_to_yojson x.rule_definition));
      ("Priority", Some (priority_to_yojson x.priority));
    ]

let stateless_rules_to_yojson tree = list_to_yojson stateless_rule_to_yojson tree

let stateless_rules_and_custom_actions_to_yojson (x : stateless_rules_and_custom_actions) =
  assoc_to_yojson
    [
      ("StatelessRules", Some (stateless_rules_to_yojson x.stateless_rules));
      ("CustomActions", option_to_yojson custom_actions_to_yojson x.custom_actions);
    ]

let setting_to_yojson = string_to_yojson
let settings_to_yojson tree = list_to_yojson setting_to_yojson tree
let keyword_to_yojson = string_to_yojson

let rule_option_to_yojson (x : rule_option) =
  assoc_to_yojson
    [
      ("Keyword", Some (keyword_to_yojson x.keyword));
      ("Settings", option_to_yojson settings_to_yojson x.settings);
    ]

let rule_options_to_yojson tree = list_to_yojson rule_option_to_yojson tree
let port_to_yojson = string_to_yojson
let destination_to_yojson = string_to_yojson

let stateful_rule_direction_to_yojson (x : stateful_rule_direction) =
  match x with FORWARD -> `String "FORWARD" | ANY -> `String "ANY"

let source_to_yojson = string_to_yojson

let stateful_rule_protocol_to_yojson (x : stateful_rule_protocol) =
  match x with
  | ANY -> `String "IP"
  | TCP -> `String "TCP"
  | UDP -> `String "UDP"
  | ICMP -> `String "ICMP"
  | HTTP -> `String "HTTP"
  | FTP -> `String "FTP"
  | TLS -> `String "TLS"
  | SMB -> `String "SMB"
  | DNS -> `String "DNS"
  | DCERPC -> `String "DCERPC"
  | SSH -> `String "SSH"
  | SMTP -> `String "SMTP"
  | IMAP -> `String "IMAP"
  | MSN -> `String "MSN"
  | KRB5 -> `String "KRB5"
  | IKEV2 -> `String "IKEV2"
  | TFTP -> `String "TFTP"
  | NTP -> `String "NTP"
  | DHCP -> `String "DHCP"
  | HTTP2 -> `String "HTTP2"
  | QUIC -> `String "QUIC"

let header_to_yojson (x : header) =
  assoc_to_yojson
    [
      ("Protocol", Some (stateful_rule_protocol_to_yojson x.protocol));
      ("Source", Some (source_to_yojson x.source));
      ("SourcePort", Some (port_to_yojson x.source_port));
      ("Direction", Some (stateful_rule_direction_to_yojson x.direction));
      ("Destination", Some (destination_to_yojson x.destination));
      ("DestinationPort", Some (port_to_yojson x.destination_port));
    ]

let stateful_action_to_yojson (x : stateful_action) =
  match x with
  | PASS -> `String "PASS"
  | DROP -> `String "DROP"
  | ALERT -> `String "ALERT"
  | REJECT -> `String "REJECT"

let stateful_rule_to_yojson (x : stateful_rule) =
  assoc_to_yojson
    [
      ("Action", Some (stateful_action_to_yojson x.action));
      ("Header", Some (header_to_yojson x.header));
      ("RuleOptions", Some (rule_options_to_yojson x.rule_options));
    ]

let stateful_rules_to_yojson tree = list_to_yojson stateful_rule_to_yojson tree

let generated_rules_type_to_yojson (x : generated_rules_type) =
  match x with
  | ALLOWLIST -> `String "ALLOWLIST"
  | DENYLIST -> `String "DENYLIST"
  | REJECTLIST -> `String "REJECTLIST"
  | ALERTLIST -> `String "ALERTLIST"

let target_type_to_yojson (x : target_type) =
  match x with TLS_SNI -> `String "TLS_SNI" | HTTP_HOST -> `String "HTTP_HOST"

let target_types_to_yojson tree = list_to_yojson target_type_to_yojson tree
let rule_targets_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let rules_source_list_to_yojson (x : rules_source_list) =
  assoc_to_yojson
    [
      ("Targets", Some (rule_targets_to_yojson x.targets));
      ("TargetTypes", Some (target_types_to_yojson x.target_types));
      ("GeneratedRulesType", Some (generated_rules_type_to_yojson x.generated_rules_type));
    ]

let rules_source_to_yojson (x : rules_source) =
  assoc_to_yojson
    [
      ("RulesString", option_to_yojson rules_string_to_yojson x.rules_string);
      ("RulesSourceList", option_to_yojson rules_source_list_to_yojson x.rules_source_list);
      ("StatefulRules", option_to_yojson stateful_rules_to_yojson x.stateful_rules);
      ( "StatelessRulesAndCustomActions",
        option_to_yojson stateless_rules_and_custom_actions_to_yojson
          x.stateless_rules_and_custom_actions );
    ]

let ip_set_reference_to_yojson (x : ip_set_reference) =
  assoc_to_yojson [ ("ReferenceArn", option_to_yojson resource_arn_to_yojson x.reference_arn) ]

let ip_set_reference_name_to_yojson = string_to_yojson

let ip_set_reference_map_to_yojson tree =
  map_to_yojson ip_set_reference_name_to_yojson ip_set_reference_to_yojson tree

let reference_sets_to_yojson (x : reference_sets) =
  assoc_to_yojson
    [ ("IPSetReferences", option_to_yojson ip_set_reference_map_to_yojson x.ip_set_references) ]

let port_set_to_yojson (x : port_set) =
  assoc_to_yojson
    [ ("Definition", option_to_yojson variable_definition_list_to_yojson x.definition) ]

let port_sets_to_yojson tree = map_to_yojson rule_variable_name_to_yojson port_set_to_yojson tree

let rule_variables_to_yojson (x : rule_variables) =
  assoc_to_yojson
    [
      ("IPSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
      ("PortSets", option_to_yojson port_sets_to_yojson x.port_sets);
    ]

let rule_group_to_yojson (x : rule_group) =
  assoc_to_yojson
    [
      ("RuleVariables", option_to_yojson rule_variables_to_yojson x.rule_variables);
      ("ReferenceSets", option_to_yojson reference_sets_to_yojson x.reference_sets);
      ("RulesSource", Some (rules_source_to_yojson x.rules_source));
      ( "StatefulRuleOptions",
        option_to_yojson stateful_rule_options_to_yojson x.stateful_rule_options );
    ]

let create_rule_group_request_to_yojson (x : create_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("Rules", option_to_yojson rules_string_to_yojson x.rules);
      ("Type", Some (rule_group_type_to_yojson x.type_));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Capacity", Some (rule_capacity_to_yojson x.capacity));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
    ]

let tls_inspection_configuration_response_to_yojson (x : tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationArn",
        Some (resource_arn_to_yojson x.tls_inspection_configuration_arn) );
      ( "TLSInspectionConfigurationName",
        Some (resource_name_to_yojson x.tls_inspection_configuration_name) );
      ( "TLSInspectionConfigurationId",
        Some (resource_id_to_yojson x.tls_inspection_configuration_id) );
      ( "TLSInspectionConfigurationStatus",
        option_to_yojson resource_status_to_yojson x.tls_inspection_configuration_status );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Certificates", option_to_yojson certificates_to_yojson x.certificates);
      ( "CertificateAuthority",
        option_to_yojson tls_certificate_data_to_yojson x.certificate_authority );
    ]

let create_tls_inspection_configuration_response_to_yojson
    (x : create_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
    ]

let server_certificate_scope_to_yojson (x : server_certificate_scope) =
  assoc_to_yojson
    [
      ("Sources", option_to_yojson addresses_to_yojson x.sources);
      ("Destinations", option_to_yojson addresses_to_yojson x.destinations);
      ("SourcePorts", option_to_yojson port_ranges_to_yojson x.source_ports);
      ("DestinationPorts", option_to_yojson port_ranges_to_yojson x.destination_ports);
      ("Protocols", option_to_yojson protocol_numbers_to_yojson x.protocols);
    ]

let server_certificate_scopes_to_yojson tree =
  list_to_yojson server_certificate_scope_to_yojson tree

let server_certificate_to_yojson (x : server_certificate) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn) ]

let server_certificates_to_yojson tree = list_to_yojson server_certificate_to_yojson tree

let server_certificate_configuration_to_yojson (x : server_certificate_configuration) =
  assoc_to_yojson
    [
      ("ServerCertificates", option_to_yojson server_certificates_to_yojson x.server_certificates);
      ("Scopes", option_to_yojson server_certificate_scopes_to_yojson x.scopes);
      ( "CertificateAuthorityArn",
        option_to_yojson resource_arn_to_yojson x.certificate_authority_arn );
      ( "CheckCertificateRevocationStatus",
        option_to_yojson check_certificate_revocation_status_actions_to_yojson
          x.check_certificate_revocation_status );
    ]

let server_certificate_configurations_to_yojson tree =
  list_to_yojson server_certificate_configuration_to_yojson tree

let tls_inspection_configuration_to_yojson (x : tls_inspection_configuration) =
  assoc_to_yojson
    [
      ( "ServerCertificateConfigurations",
        option_to_yojson server_certificate_configurations_to_yojson
          x.server_certificate_configurations );
    ]

let create_tls_inspection_configuration_request_to_yojson
    (x : create_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationName",
        Some (resource_name_to_yojson x.tls_inspection_configuration_name) );
      ( "TLSInspectionConfiguration",
        Some (tls_inspection_configuration_to_yojson x.tls_inspection_configuration) );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let vpc_endpoint_association_status_to_yojson (x : vpc_endpoint_association_status) =
  assoc_to_yojson
    [
      ("Status", Some (firewall_status_value_to_yojson x.status));
      ( "AssociationSyncState",
        option_to_yojson association_sync_state_to_yojson x.association_sync_state );
    ]

let vpc_endpoint_association_to_yojson (x : vpc_endpoint_association) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationId",
        option_to_yojson resource_id_to_yojson x.vpc_endpoint_association_id );
      ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn));
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetMapping", Some (subnet_mapping_to_yojson x.subnet_mapping));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_vpc_endpoint_association_response_to_yojson
    (x : create_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
    ]

let create_vpc_endpoint_association_request_to_yojson (x : create_vpc_endpoint_association_request)
    =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetMapping", Some (subnet_mapping_to_yojson x.subnet_mapping));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let delete_container_association_response_to_yojson (x : delete_container_association_response) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
    ]

let delete_container_association_request_to_yojson (x : delete_container_association_request) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
    ]

let delete_firewall_response_to_yojson (x : delete_firewall_response) =
  assoc_to_yojson
    [
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
    ]

let delete_firewall_request_to_yojson (x : delete_firewall_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let delete_firewall_policy_response_to_yojson (x : delete_firewall_policy_response) =
  assoc_to_yojson
    [
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
    ]

let delete_firewall_policy_request_to_yojson (x : delete_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
    ]

let delete_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : delete_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
    ]

let delete_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : delete_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let delete_proxy_response_to_yojson (x : delete_proxy_response) =
  assoc_to_yojson
    [
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
    ]

let delete_proxy_request_to_yojson (x : delete_proxy_request) =
  assoc_to_yojson
    [
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
    ]

let delete_proxy_configuration_response_to_yojson (x : delete_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
    ]

let delete_proxy_configuration_request_to_yojson (x : delete_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
    ]

let delete_proxy_rule_group_response_to_yojson (x : delete_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let delete_proxy_rule_group_request_to_yojson (x : delete_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let delete_proxy_rules_response_to_yojson (x : delete_proxy_rules_response) =
  assoc_to_yojson
    [ ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group) ]

let delete_proxy_rules_request_to_yojson (x : delete_proxy_rules_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("Rules", Some (resource_name_list_to_yojson x.rules));
    ]

let invalid_resource_policy_exception_to_yojson (x : invalid_resource_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_rule_group_response_to_yojson (x : delete_rule_group_response) =
  assoc_to_yojson
    [ ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response)) ]

let delete_rule_group_request_to_yojson (x : delete_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
    ]

let delete_tls_inspection_configuration_response_to_yojson
    (x : delete_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
    ]

let delete_tls_inspection_configuration_request_to_yojson
    (x : delete_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
    ]

let delete_vpc_endpoint_association_response_to_yojson
    (x : delete_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
    ]

let delete_vpc_endpoint_association_request_to_yojson (x : delete_vpc_endpoint_association_request)
    =
  assoc_to_yojson
    [ ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn)) ]

let describe_container_association_response_to_yojson (x : describe_container_association_response)
    =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ("ResolvedCidrCount", option_to_yojson cidr_count_to_yojson x.resolved_cidr_count);
      ( "LastUpdatedTime",
        option_to_yojson container_association_last_updated_time_to_yojson x.last_updated_time );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_container_association_request_to_yojson (x : describe_container_association_request) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
    ]

let describe_firewall_response_to_yojson (x : describe_firewall_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
    ]

let describe_firewall_request_to_yojson (x : describe_firewall_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let supported_availability_zones_to_yojson tree =
  map_to_yojson availability_zone_to_yojson availability_zone_metadata_to_yojson tree

let describe_firewall_metadata_response_to_yojson (x : describe_firewall_metadata_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson firewall_status_value_to_yojson x.status);
      ( "SupportedAvailabilityZones",
        option_to_yojson supported_availability_zones_to_yojson x.supported_availability_zones );
      ( "TransitGatewayAttachmentId",
        option_to_yojson transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id );
    ]

let describe_firewall_metadata_request_to_yojson (x : describe_firewall_metadata_request) =
  assoc_to_yojson [ ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn) ]

let describe_firewall_policy_response_to_yojson (x : describe_firewall_policy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
      ("FirewallPolicy", option_to_yojson firewall_policy_to_yojson x.firewall_policy);
    ]

let describe_firewall_policy_request_to_yojson (x : describe_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
    ]

let protocol_string_to_yojson = string_to_yojson
let protocol_strings_to_yojson tree = list_to_yojson protocol_string_to_yojson tree

let flow_filter_to_yojson (x : flow_filter) =
  assoc_to_yojson
    [
      ("SourceAddress", option_to_yojson address_to_yojson x.source_address);
      ("DestinationAddress", option_to_yojson address_to_yojson x.destination_address);
      ("SourcePort", option_to_yojson port_to_yojson x.source_port);
      ("DestinationPort", option_to_yojson port_to_yojson x.destination_port);
      ("Protocols", option_to_yojson protocol_strings_to_yojson x.protocols);
    ]

let flow_filters_to_yojson tree = list_to_yojson flow_filter_to_yojson tree

let flow_operation_to_yojson (x : flow_operation) =
  assoc_to_yojson
    [
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
      ("FlowFilters", option_to_yojson flow_filters_to_yojson x.flow_filters);
    ]

let flow_request_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let flow_operation_status_to_yojson (x : flow_operation_status) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"

let flow_operation_type_to_yojson (x : flow_operation_type) =
  match x with FLOW_FLUSH -> `String "FLOW_FLUSH" | FLOW_CAPTURE -> `String "FLOW_CAPTURE"

let flow_operation_id_to_yojson = string_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson

let describe_flow_operation_response_to_yojson (x : describe_flow_operation_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ("FlowOperation", option_to_yojson flow_operation_to_yojson x.flow_operation);
    ]

let describe_flow_operation_request_to_yojson (x : describe_flow_operation_request) =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("FlowOperationId", Some (flow_operation_id_to_yojson x.flow_operation_id));
    ]

let enable_monitoring_dashboard_to_yojson = bool_to_yojson
let hash_map_value_to_yojson = string_to_yojson
let hash_map_key_to_yojson = string_to_yojson

let log_destination_map_to_yojson tree =
  map_to_yojson hash_map_key_to_yojson hash_map_value_to_yojson tree

let log_destination_type_to_yojson (x : log_destination_type) =
  match x with
  | S3 -> `String "S3"
  | CLOUDWATCH_LOGS -> `String "CloudWatchLogs"
  | KINESIS_DATA_FIREHOSE -> `String "KinesisDataFirehose"

let log_type_to_yojson (x : log_type) =
  match x with ALERT -> `String "ALERT" | FLOW -> `String "FLOW" | TLS -> `String "TLS"

let log_destination_config_to_yojson (x : log_destination_config) =
  assoc_to_yojson
    [
      ("LogType", Some (log_type_to_yojson x.log_type));
      ("LogDestinationType", Some (log_destination_type_to_yojson x.log_destination_type));
      ("LogDestination", Some (log_destination_map_to_yojson x.log_destination));
    ]

let log_destination_configs_to_yojson tree = list_to_yojson log_destination_config_to_yojson tree

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("LogDestinationConfigs", Some (log_destination_configs_to_yojson x.log_destination_configs));
    ]

let describe_logging_configuration_response_to_yojson (x : describe_logging_configuration_response)
    =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
    ]

let describe_logging_configuration_request_to_yojson (x : describe_logging_configuration_request) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let private_dns_name_to_yojson = string_to_yojson
let vpc_endpoint_service_name_to_yojson = string_to_yojson

let describe_proxy_resource_to_yojson (x : describe_proxy_resource) =
  assoc_to_yojson
    [
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
      ("ProxyState", option_to_yojson proxy_state_to_yojson x.proxy_state);
      ("ProxyModifyState", option_to_yojson proxy_modify_state_to_yojson x.proxy_modify_state);
      ("ListenerProperties", option_to_yojson listener_properties_to_yojson x.listener_properties);
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_to_yojson x.tls_intercept_properties );
      ( "VpcEndpointServiceName",
        option_to_yojson vpc_endpoint_service_name_to_yojson x.vpc_endpoint_service_name );
      ("PrivateDNSName", option_to_yojson private_dns_name_to_yojson x.private_dns_name);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("UpdateTime", option_to_yojson update_time_to_yojson x.update_time);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_proxy_response_to_yojson (x : describe_proxy_response) =
  assoc_to_yojson
    [
      ("Proxy", option_to_yojson describe_proxy_resource_to_yojson x.proxy);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_proxy_request_to_yojson (x : describe_proxy_request) =
  assoc_to_yojson
    [
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
    ]

let describe_proxy_configuration_response_to_yojson (x : describe_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_proxy_configuration_request_to_yojson (x : describe_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
    ]

let describe_proxy_rule_response_to_yojson (x : describe_proxy_rule_response) =
  assoc_to_yojson
    [
      ("ProxyRule", option_to_yojson proxy_rule_to_yojson x.proxy_rule);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_proxy_rule_request_to_yojson (x : describe_proxy_rule_request) =
  assoc_to_yojson
    [
      ("ProxyRuleName", Some (resource_name_to_yojson x.proxy_rule_name));
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let describe_proxy_rule_group_response_to_yojson (x : describe_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_proxy_rule_group_request_to_yojson (x : describe_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let policy_string_to_yojson = string_to_yojson

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_string_to_yojson x.policy) ]

let describe_resource_policy_request_to_yojson (x : describe_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let describe_rule_group_response_to_yojson (x : describe_rule_group_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
    ]

let describe_rule_group_request_to_yojson (x : describe_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
    ]

let listing_name_to_yojson = string_to_yojson
let product_id_to_yojson = string_to_yojson
let vendor_name_to_yojson = string_to_yojson

let describe_rule_group_metadata_response_to_yojson (x : describe_rule_group_metadata_response) =
  assoc_to_yojson
    [
      ("RuleGroupArn", Some (resource_arn_to_yojson x.rule_group_arn));
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Capacity", option_to_yojson rule_capacity_to_yojson x.capacity);
      ( "StatefulRuleOptions",
        option_to_yojson stateful_rule_options_to_yojson x.stateful_rule_options );
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("ListingName", option_to_yojson listing_name_to_yojson x.listing_name);
    ]

let describe_rule_group_metadata_request_to_yojson (x : describe_rule_group_metadata_request) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
    ]

let rule_summary_to_yojson (x : rule_summary) =
  assoc_to_yojson
    [
      ("SID", option_to_yojson collection_member__string_to_yojson x.si_d);
      ("Msg", option_to_yojson collection_member__string_to_yojson x.msg);
      ("Metadata", option_to_yojson collection_member__string_to_yojson x.metadata);
    ]

let rule_summaries_to_yojson tree = list_to_yojson rule_summary_to_yojson tree

let summary_to_yojson (x : summary) =
  assoc_to_yojson [ ("RuleSummaries", option_to_yojson rule_summaries_to_yojson x.rule_summaries) ]

let describe_rule_group_summary_response_to_yojson (x : describe_rule_group_summary_response) =
  assoc_to_yojson
    [
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Summary", option_to_yojson summary_to_yojson x.summary);
    ]

let describe_rule_group_summary_request_to_yojson (x : describe_rule_group_summary_request) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
    ]

let describe_tls_inspection_configuration_response_to_yojson
    (x : describe_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "TLSInspectionConfiguration",
        option_to_yojson tls_inspection_configuration_to_yojson x.tls_inspection_configuration );
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
    ]

let describe_tls_inspection_configuration_request_to_yojson
    (x : describe_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
    ]

let describe_vpc_endpoint_association_response_to_yojson
    (x : describe_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
    ]

let describe_vpc_endpoint_association_request_to_yojson
    (x : describe_vpc_endpoint_association_request) =
  assoc_to_yojson
    [ ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn)) ]

let detach_rule_groups_from_proxy_configuration_response_to_yojson
    (x : detach_rule_groups_from_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let detach_rule_groups_from_proxy_configuration_request_to_yojson
    (x : detach_rule_groups_from_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("RuleGroupNames", option_to_yojson resource_name_list_to_yojson x.rule_group_names);
      ("RuleGroupArns", option_to_yojson resource_arn_list_to_yojson x.rule_group_arns);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let disassociate_availability_zones_response_to_yojson
    (x : disassociate_availability_zones_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let disassociate_availability_zones_request_to_yojson (x : disassociate_availability_zones_request)
    =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneMappings",
        Some (availability_zone_mappings_to_yojson x.availability_zone_mappings) );
    ]

let disassociate_subnets_response_to_yojson (x : disassociate_subnets_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let disassociate_subnets_request_to_yojson (x : disassociate_subnets_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetIds", Some (az_subnets_to_yojson x.subnet_ids));
    ]

let end_time_to_yojson = timestamp_epoch_seconds_to_yojson

let firewall_metadata_to_yojson (x : firewall_metadata) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ( "TransitGatewayAttachmentId",
        option_to_yojson transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id );
    ]

let firewall_policy_metadata_to_yojson (x : firewall_policy_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let firewall_policies_to_yojson tree = list_to_yojson firewall_policy_metadata_to_yojson tree
let firewalls_to_yojson tree = list_to_yojson firewall_metadata_to_yojson tree
let packet_count_to_yojson = int_to_yojson

let flow_to_yojson (x : flow) =
  assoc_to_yojson
    [
      ("SourceAddress", option_to_yojson address_to_yojson x.source_address);
      ("DestinationAddress", option_to_yojson address_to_yojson x.destination_address);
      ("SourcePort", option_to_yojson port_to_yojson x.source_port);
      ("DestinationPort", option_to_yojson port_to_yojson x.destination_port);
      ("Protocol", option_to_yojson protocol_string_to_yojson x.protocol);
      ("Age", option_to_yojson age_to_yojson x.age);
      ("PacketCount", option_to_yojson packet_count_to_yojson x.packet_count);
      ("ByteCount", option_to_yojson byte_count_to_yojson x.byte_count);
    ]

let flow_operation_metadata_to_yojson (x : flow_operation_metadata) =
  assoc_to_yojson
    [
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
    ]

let flow_operations_to_yojson tree = list_to_yojson flow_operation_metadata_to_yojson tree
let flows_to_yojson tree = list_to_yojson flow_to_yojson tree
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let get_analysis_report_results_response_to_yojson (x : get_analysis_report_results_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("ReportTime", option_to_yojson report_time_to_yojson x.report_time);
      ("AnalysisType", option_to_yojson enabled_analysis_type_to_yojson x.analysis_type);
      ("NextToken", option_to_yojson analysis_report_next_token_to_yojson x.next_token);
      ( "AnalysisReportResults",
        option_to_yojson analysis_report_results_to_yojson x.analysis_report_results );
    ]

let pagination_max_results_to_yojson = int_to_yojson

let get_analysis_report_results_request_to_yojson (x : get_analysis_report_results_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("NextToken", option_to_yojson analysis_report_next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let pagination_token_to_yojson = string_to_yojson

let list_analysis_reports_response_to_yojson (x : list_analysis_reports_response) =
  assoc_to_yojson
    [
      ("AnalysisReports", option_to_yojson analysis_reports_to_yojson x.analysis_reports);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_analysis_reports_request_to_yojson (x : list_analysis_reports_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let list_container_associations_response_to_yojson (x : list_container_associations_response) =
  assoc_to_yojson
    [
      ( "ContainerAssociations",
        option_to_yojson container_associations_to_yojson x.container_associations );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_container_associations_request_to_yojson (x : list_container_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_firewall_policies_response_to_yojson (x : list_firewall_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FirewallPolicies", option_to_yojson firewall_policies_to_yojson x.firewall_policies);
    ]

let list_firewall_policies_request_to_yojson (x : list_firewall_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let list_firewalls_response_to_yojson (x : list_firewalls_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Firewalls", option_to_yojson firewalls_to_yojson x.firewalls);
    ]

let vpc_ids_to_yojson tree = list_to_yojson vpc_id_to_yojson tree

let list_firewalls_request_to_yojson (x : list_firewalls_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VpcIds", option_to_yojson vpc_ids_to_yojson x.vpc_ids);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let list_flow_operation_results_response_to_yojson (x : list_flow_operation_results_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ("Flows", option_to_yojson flows_to_yojson x.flows);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_flow_operation_results_request_to_yojson (x : list_flow_operation_results_request) =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("FlowOperationId", Some (flow_operation_id_to_yojson x.flow_operation_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
    ]

let list_flow_operations_response_to_yojson (x : list_flow_operations_response) =
  assoc_to_yojson
    [
      ("FlowOperations", option_to_yojson flow_operations_to_yojson x.flow_operations);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_flow_operations_request_to_yojson (x : list_flow_operations_request) =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let proxy_metadata_to_yojson (x : proxy_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let proxies_to_yojson tree = list_to_yojson proxy_metadata_to_yojson tree

let list_proxies_response_to_yojson (x : list_proxies_response) =
  assoc_to_yojson
    [
      ("Proxies", option_to_yojson proxies_to_yojson x.proxies);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxies_request_to_yojson (x : list_proxies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let proxy_configuration_metadata_to_yojson (x : proxy_configuration_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let proxy_configurations_to_yojson tree = list_to_yojson proxy_configuration_metadata_to_yojson tree

let list_proxy_configurations_response_to_yojson (x : list_proxy_configurations_response) =
  assoc_to_yojson
    [
      ("ProxyConfigurations", option_to_yojson proxy_configurations_to_yojson x.proxy_configurations);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxy_configurations_request_to_yojson (x : list_proxy_configurations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let proxy_rule_group_metadata_to_yojson (x : proxy_rule_group_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let proxy_rule_groups_to_yojson tree = list_to_yojson proxy_rule_group_metadata_to_yojson tree

let list_proxy_rule_groups_response_to_yojson (x : list_proxy_rule_groups_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroups", option_to_yojson proxy_rule_groups_to_yojson x.proxy_rule_groups);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxy_rule_groups_request_to_yojson (x : list_proxy_rule_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let rule_group_metadata_to_yojson (x : rule_group_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
    ]

let rule_groups_to_yojson tree = list_to_yojson rule_group_metadata_to_yojson tree

let list_rule_groups_response_to_yojson (x : list_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RuleGroups", option_to_yojson rule_groups_to_yojson x.rule_groups);
    ]

let subscription_status_to_yojson (x : subscription_status) =
  match x with NOT_SUBSCRIBED -> `String "NOT_SUBSCRIBED" | SUBSCRIBED -> `String "SUBSCRIBED"

let resource_managed_type_to_yojson (x : resource_managed_type) =
  match x with
  | AWS_MANAGED_THREAT_SIGNATURES -> `String "AWS_MANAGED_THREAT_SIGNATURES"
  | AWS_MANAGED_DOMAIN_LISTS -> `String "AWS_MANAGED_DOMAIN_LISTS"
  | ACTIVE_THREAT_DEFENSE -> `String "ACTIVE_THREAT_DEFENSE"
  | PARTNER_MANAGED -> `String "PARTNER_MANAGED"

let resource_managed_status_to_yojson (x : resource_managed_status) =
  match x with MANAGED -> `String "MANAGED" | ACCOUNT -> `String "ACCOUNT"

let list_rule_groups_request_to_yojson (x : list_rule_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("Scope", option_to_yojson resource_managed_status_to_yojson x.scope);
      ("ManagedType", option_to_yojson resource_managed_type_to_yojson x.managed_type);
      ("SubscriptionStatus", option_to_yojson subscription_status_to_yojson x.subscription_status);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
    ]

let tls_inspection_configuration_metadata_to_yojson (x : tls_inspection_configuration_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let tls_inspection_configurations_to_yojson tree =
  list_to_yojson tls_inspection_configuration_metadata_to_yojson tree

let list_tls_inspection_configurations_response_to_yojson
    (x : list_tls_inspection_configurations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "TLSInspectionConfigurations",
        option_to_yojson tls_inspection_configurations_to_yojson x.tls_inspection_configurations );
    ]

let list_tls_inspection_configurations_request_to_yojson
    (x : list_tls_inspection_configurations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let tags_pagination_max_results_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson tags_pagination_max_results_to_yojson x.max_results);
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let vpc_endpoint_association_metadata_to_yojson (x : vpc_endpoint_association_metadata) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
    ]

let vpc_endpoint_associations_to_yojson tree =
  list_to_yojson vpc_endpoint_association_metadata_to_yojson tree

let list_vpc_endpoint_associations_response_to_yojson (x : list_vpc_endpoint_associations_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "VpcEndpointAssociations",
        option_to_yojson vpc_endpoint_associations_to_yojson x.vpc_endpoint_associations );
    ]

let list_vpc_endpoint_associations_request_to_yojson (x : list_vpc_endpoint_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let log_destination_permission_exception_to_yojson (x : log_destination_permission_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_tls_inspection_configuration_response_to_yojson
    (x : update_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
    ]

let update_tls_inspection_configuration_request_to_yojson
    (x : update_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
      ( "TLSInspectionConfiguration",
        Some (tls_inspection_configuration_to_yojson x.tls_inspection_configuration) );
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let resource_owner_check_exception_to_yojson (x : resource_owner_check_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_subnet_change_protection_response_to_yojson
    (x : update_subnet_change_protection_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
    ]

let update_subnet_change_protection_request_to_yojson (x : update_subnet_change_protection_request)
    =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("SubnetChangeProtection", Some (boolean__to_yojson x.subnet_change_protection));
    ]

let update_rule_group_response_to_yojson (x : update_rule_group_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
    ]

let update_rule_group_request_to_yojson (x : update_rule_group_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("Rules", option_to_yojson rules_string_to_yojson x.rules);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
    ]

let proxy_rule_priority_to_yojson (x : proxy_rule_priority) =
  assoc_to_yojson
    [
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
      ("NewPosition", option_to_yojson insert_position_to_yojson x.new_position);
    ]

let proxy_rule_priority_list_to_yojson tree = list_to_yojson proxy_rule_priority_to_yojson tree

let rule_group_request_phase_to_yojson (x : rule_group_request_phase) =
  match x with
  | PRE_DNS -> `String "PRE_DNS"
  | PRE_REQ -> `String "PRE_REQ"
  | POST_RES -> `String "POST_RES"

let update_proxy_rule_priorities_response_to_yojson (x : update_proxy_rule_priorities_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ( "RuleGroupRequestPhase",
        option_to_yojson rule_group_request_phase_to_yojson x.rule_group_request_phase );
      ("Rules", option_to_yojson proxy_rule_priority_list_to_yojson x.rules);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_proxy_rule_priorities_request_to_yojson (x : update_proxy_rule_priorities_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("RuleGroupRequestPhase", Some (rule_group_request_phase_to_yojson x.rule_group_request_phase));
      ("Rules", Some (proxy_rule_priority_list_to_yojson x.rules));
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let proxy_rule_group_priority_result_priority_to_yojson = int_to_yojson

let proxy_rule_group_priority_result_to_yojson (x : proxy_rule_group_priority_result) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("Priority", option_to_yojson proxy_rule_group_priority_result_priority_to_yojson x.priority);
    ]

let proxy_rule_group_priority_result_list_to_yojson tree =
  list_to_yojson proxy_rule_group_priority_result_to_yojson tree

let update_proxy_rule_group_priorities_response_to_yojson
    (x : update_proxy_rule_group_priorities_response) =
  assoc_to_yojson
    [
      ( "ProxyRuleGroups",
        option_to_yojson proxy_rule_group_priority_result_list_to_yojson x.proxy_rule_groups );
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let proxy_rule_group_priority_to_yojson (x : proxy_rule_group_priority) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("NewPosition", option_to_yojson insert_position_to_yojson x.new_position);
    ]

let proxy_rule_group_priority_list_to_yojson tree =
  list_to_yojson proxy_rule_group_priority_to_yojson tree

let update_proxy_rule_group_priorities_request_to_yojson
    (x : update_proxy_rule_group_priorities_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("RuleGroups", Some (proxy_rule_group_priority_list_to_yojson x.rule_groups));
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_proxy_rule_response_to_yojson (x : update_proxy_rule_response) =
  assoc_to_yojson
    [
      ("ProxyRule", option_to_yojson proxy_rule_to_yojson x.proxy_rule);
      ( "RemovedConditions",
        option_to_yojson proxy_rule_condition_list_to_yojson x.removed_conditions );
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_proxy_rule_request_to_yojson (x : update_proxy_rule_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleName", Some (resource_name_to_yojson x.proxy_rule_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("AddConditions", option_to_yojson proxy_rule_condition_list_to_yojson x.add_conditions);
      ("RemoveConditions", option_to_yojson proxy_rule_condition_list_to_yojson x.remove_conditions);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_proxy_configuration_response_to_yojson (x : update_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_proxy_configuration_request_to_yojson (x : update_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ( "DefaultRulePhaseActions",
        Some
          (proxy_config_default_rule_phase_actions_request_to_yojson x.default_rule_phase_actions)
      );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_proxy_response_to_yojson (x : update_proxy_response) =
  assoc_to_yojson
    [
      ("Proxy", option_to_yojson proxy_to_yojson x.proxy);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_proxy_request_to_yojson (x : update_proxy_request) =
  assoc_to_yojson
    [
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ( "ListenerPropertiesToAdd",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties_to_add );
      ( "ListenerPropertiesToRemove",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties_to_remove );
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_request_to_yojson x.tls_intercept_properties );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_logging_configuration_response_to_yojson (x : update_logging_configuration_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
    ]

let update_logging_configuration_request_to_yojson (x : update_logging_configuration_request) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
    ]

let update_firewall_policy_change_protection_response_to_yojson
    (x : update_firewall_policy_change_protection_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
    ]

let update_firewall_policy_change_protection_request_to_yojson
    (x : update_firewall_policy_change_protection_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "FirewallPolicyChangeProtection",
        Some (boolean__to_yojson x.firewall_policy_change_protection) );
    ]

let update_firewall_policy_response_to_yojson (x : update_firewall_policy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
    ]

let update_firewall_policy_request_to_yojson (x : update_firewall_policy_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
      ("FirewallPolicy", Some (firewall_policy_to_yojson x.firewall_policy));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let update_firewall_encryption_configuration_response_to_yojson
    (x : update_firewall_encryption_configuration_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let update_firewall_encryption_configuration_request_to_yojson
    (x : update_firewall_encryption_configuration_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let update_firewall_description_response_to_yojson (x : update_firewall_description_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_description_request_to_yojson (x : update_firewall_description_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let update_firewall_delete_protection_response_to_yojson
    (x : update_firewall_delete_protection_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_delete_protection_request_to_yojson
    (x : update_firewall_delete_protection_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("DeleteProtection", Some (boolean__to_yojson x.delete_protection));
    ]

let update_firewall_analysis_settings_response_to_yojson
    (x : update_firewall_analysis_settings_response) =
  assoc_to_yojson
    [
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_analysis_settings_request_to_yojson
    (x : update_firewall_analysis_settings_request) =
  assoc_to_yojson
    [
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_container_association_response_to_yojson (x : update_container_association_response) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_container_association_request_to_yojson (x : update_container_association_request) =
  assoc_to_yojson
    [
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", Some (container_monitoring_type_to_yojson x.type_));
      ( "ContainerMonitoringConfigurations",
        Some (container_monitoring_configurations_to_yojson x.container_monitoring_configurations)
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_availability_zone_change_protection_response_to_yojson
    (x : update_availability_zone_change_protection_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
    ]

let update_availability_zone_change_protection_request_to_yojson
    (x : update_availability_zone_change_protection_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ( "AvailabilityZoneChangeProtection",
        Some (boolean__to_yojson x.availability_zone_change_protection) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let start_flow_flush_response_to_yojson (x : start_flow_flush_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
    ]

let start_flow_flush_request_to_yojson (x : start_flow_flush_request) =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
      ("FlowFilters", Some (flow_filters_to_yojson x.flow_filters));
    ]

let start_flow_capture_response_to_yojson (x : start_flow_capture_response) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
    ]

let start_flow_capture_request_to_yojson (x : start_flow_capture_request) =
  assoc_to_yojson
    [
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
      ("FlowFilters", Some (flow_filters_to_yojson x.flow_filters));
    ]

let start_analysis_report_response_to_yojson (x : start_analysis_report_response) =
  assoc_to_yojson [ ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id)) ]

let start_analysis_report_request_to_yojson (x : start_analysis_report_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("AnalysisType", Some (enabled_analysis_type_to_yojson x.analysis_type));
    ]

let reject_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : reject_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
    ]

let reject_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : reject_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let put_resource_policy_response_to_yojson = unit_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Policy", Some (policy_string_to_yojson x.policy));
    ]
