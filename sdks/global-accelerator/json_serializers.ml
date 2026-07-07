open Smaws_Lib.Json.SerializeHelpers
open Types

let generic_string_to_yojson = string_to_yojson

let byoip_cidr_state_to_yojson (x : byoip_cidr_state) =
  match x with
  | FAILED_DEPROVISION -> `String "FAILED_DEPROVISION"
  | FAILED_WITHDRAW -> `String "FAILED_WITHDRAW"
  | FAILED_ADVERTISING -> `String "FAILED_ADVERTISING"
  | FAILED_PROVISION -> `String "FAILED_PROVISION"
  | DEPROVISIONED -> `String "DEPROVISIONED"
  | PENDING_DEPROVISIONING -> `String "PENDING_DEPROVISIONING"
  | PENDING_WITHDRAWING -> `String "PENDING_WITHDRAWING"
  | ADVERTISING -> `String "ADVERTISING"
  | PENDING_ADVERTISING -> `String "PENDING_ADVERTISING"
  | READY -> `String "READY"
  | PENDING_PROVISIONING -> `String "PENDING_PROVISIONING"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let byoip_cidr_event_to_yojson (x : byoip_cidr_event) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Message", option_to_yojson generic_string_to_yojson x.message);
    ]

let byoip_cidr_events_to_yojson tree = list_to_yojson byoip_cidr_event_to_yojson tree

let byoip_cidr_to_yojson (x : byoip_cidr) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson byoip_cidr_events_to_yojson x.events);
      ("State", option_to_yojson byoip_cidr_state_to_yojson x.state);
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
    ]

let withdraw_byoip_cidr_response_to_yojson (x : withdraw_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let withdraw_byoip_cidr_request_to_yojson (x : withdraw_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let error_message_to_yojson = string_to_yojson

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let incorrect_cidr_state_exception_to_yojson (x : incorrect_cidr_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let byoip_cidr_not_found_exception_to_yojson (x : byoip_cidr_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let port_number_to_yojson = int_to_yojson

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("ToPort", option_to_yojson port_number_to_yojson x.to_port);
      ("FromPort", option_to_yojson port_number_to_yojson x.from_port);
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree
let protocol_to_yojson (x : protocol) = match x with UDP -> `String "UDP" | TCP -> `String "TCP"

let client_affinity_to_yojson (x : client_affinity) =
  match x with SOURCE_IP -> `String "SOURCE_IP" | NONE -> `String "NONE"

let listener_to_yojson (x : listener) =
  assoc_to_yojson
    [
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
      ("ListenerArn", option_to_yojson generic_string_to_yojson x.listener_arn);
    ]

let update_listener_response_to_yojson (x : update_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let update_listener_request_to_yojson (x : update_listener_request) =
  assoc_to_yojson
    [
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let listener_not_found_exception_to_yojson (x : listener_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_port_range_exception_to_yojson (x : invalid_port_range_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let endpoint_weight_to_yojson = int_to_yojson

let health_state_to_yojson (x : health_state) =
  match x with
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"
  | INITIAL -> `String "INITIAL"

let generic_boolean_to_yojson = bool_to_yojson

let endpoint_description_to_yojson (x : endpoint_description) =
  assoc_to_yojson
    [
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
      ("HealthReason", option_to_yojson generic_string_to_yojson x.health_reason);
      ("HealthState", option_to_yojson health_state_to_yojson x.health_state);
      ("Weight", option_to_yojson endpoint_weight_to_yojson x.weight);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
    ]

let endpoint_descriptions_to_yojson tree = list_to_yojson endpoint_description_to_yojson tree
let traffic_dial_percentage_to_yojson = float_to_yojson
let health_check_port_to_yojson = int_to_yojson

let health_check_protocol_to_yojson (x : health_check_protocol) =
  match x with HTTPS -> `String "HTTPS" | HTTP -> `String "HTTP" | TCP -> `String "TCP"

let health_check_path_to_yojson = string_to_yojson
let health_check_interval_seconds_to_yojson = int_to_yojson
let threshold_count_to_yojson = int_to_yojson

let port_override_to_yojson (x : port_override) =
  assoc_to_yojson
    [
      ("EndpointPort", option_to_yojson port_number_to_yojson x.endpoint_port);
      ("ListenerPort", option_to_yojson port_number_to_yojson x.listener_port);
    ]

let port_overrides_to_yojson tree = list_to_yojson port_override_to_yojson tree

let endpoint_group_to_yojson (x : endpoint_group) =
  assoc_to_yojson
    [
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ( "EndpointDescriptions",
        option_to_yojson endpoint_descriptions_to_yojson x.endpoint_descriptions );
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
    ]

let update_endpoint_group_response_to_yojson (x : update_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let endpoint_configuration_to_yojson (x : endpoint_configuration) =
  assoc_to_yojson
    [
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
      ("Weight", option_to_yojson endpoint_weight_to_yojson x.weight);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
    ]

let endpoint_configurations_to_yojson tree = list_to_yojson endpoint_configuration_to_yojson tree

let update_endpoint_group_request_to_yojson (x : update_endpoint_group_request) =
  assoc_to_yojson
    [
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ( "EndpointConfigurations",
        option_to_yojson endpoint_configurations_to_yojson x.endpoint_configurations );
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let endpoint_group_not_found_exception_to_yojson (x : endpoint_group_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let custom_routing_listener_to_yojson (x : custom_routing_listener) =
  assoc_to_yojson
    [
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
      ("ListenerArn", option_to_yojson generic_string_to_yojson x.listener_arn);
    ]

let update_custom_routing_listener_response_to_yojson (x : update_custom_routing_listener_response)
    =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let update_custom_routing_listener_request_to_yojson (x : update_custom_routing_listener_request) =
  assoc_to_yojson
    [
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with DUAL_STACK -> `String "DUAL_STACK" | IPV4 -> `String "IPV4"

let ip_address_to_yojson = string_to_yojson
let ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let ip_address_family_to_yojson (x : ip_address_family) =
  match x with IPv6 -> `String "IPv6" | IPv4 -> `String "IPv4"

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson
    [
      ("IpAddressFamily", option_to_yojson ip_address_family_to_yojson x.ip_address_family);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpFamily", option_to_yojson generic_string_to_yojson x.ip_family);
    ]

let ip_sets_to_yojson tree = list_to_yojson ip_set_to_yojson tree

let custom_routing_accelerator_status_to_yojson (x : custom_routing_accelerator_status) =
  match x with IN_PROGRESS -> `String "IN_PROGRESS" | DEPLOYED -> `String "DEPLOYED"

let custom_routing_accelerator_to_yojson (x : custom_routing_accelerator) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson custom_routing_accelerator_status_to_yojson x.status);
      ("DnsName", option_to_yojson generic_string_to_yojson x.dns_name);
      ("IpSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
    ]

let update_custom_routing_accelerator_response_to_yojson
    (x : update_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let update_custom_routing_accelerator_request_to_yojson
    (x : update_custom_routing_accelerator_request) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let custom_routing_accelerator_attributes_to_yojson (x : custom_routing_accelerator_attributes) =
  assoc_to_yojson
    [
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
    ]

let update_custom_routing_accelerator_attributes_response_to_yojson
    (x : update_custom_routing_accelerator_attributes_response) =
  assoc_to_yojson
    [
      ( "AcceleratorAttributes",
        option_to_yojson custom_routing_accelerator_attributes_to_yojson x.accelerator_attributes );
    ]

let update_custom_routing_accelerator_attributes_request_to_yojson
    (x : update_custom_routing_accelerator_attributes_request) =
  assoc_to_yojson
    [
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let transaction_in_progress_exception_to_yojson (x : transaction_in_progress_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let accelerator_not_found_exception_to_yojson (x : accelerator_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_name_to_yojson = string_to_yojson
let principal_to_yojson = string_to_yojson
let principals_to_yojson tree = list_to_yojson principal_to_yojson tree

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("Resources", option_to_yojson resources_to_yojson x.resources);
      ("Principals", option_to_yojson principals_to_yojson x.principals);
      ("Name", option_to_yojson attachment_name_to_yojson x.name);
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
    ]

let update_cross_account_attachment_response_to_yojson
    (x : update_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let update_cross_account_attachment_request_to_yojson (x : update_cross_account_attachment_request)
    =
  assoc_to_yojson
    [
      ("RemoveResources", option_to_yojson resources_to_yojson x.remove_resources);
      ("AddResources", option_to_yojson resources_to_yojson x.add_resources);
      ("RemovePrincipals", option_to_yojson principals_to_yojson x.remove_principals);
      ("AddPrincipals", option_to_yojson principals_to_yojson x.add_principals);
      ("Name", option_to_yojson attachment_name_to_yojson x.name);
      ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn));
    ]

let attachment_not_found_exception_to_yojson (x : attachment_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let accelerator_status_to_yojson (x : accelerator_status) =
  match x with IN_PROGRESS -> `String "IN_PROGRESS" | DEPLOYED -> `String "DEPLOYED"

let accelerator_event_to_yojson (x : accelerator_event) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Message", option_to_yojson generic_string_to_yojson x.message);
    ]

let accelerator_events_to_yojson tree = list_to_yojson accelerator_event_to_yojson tree

let accelerator_to_yojson (x : accelerator) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson accelerator_events_to_yojson x.events);
      ("DualStackDnsName", option_to_yojson generic_string_to_yojson x.dual_stack_dns_name);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson accelerator_status_to_yojson x.status);
      ("DnsName", option_to_yojson generic_string_to_yojson x.dns_name);
      ("IpSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
    ]

let update_accelerator_response_to_yojson (x : update_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let update_accelerator_request_to_yojson (x : update_accelerator_request) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let accelerator_attributes_to_yojson (x : accelerator_attributes) =
  assoc_to_yojson
    [
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
    ]

let update_accelerator_attributes_response_to_yojson (x : update_accelerator_attributes_response) =
  assoc_to_yojson
    [
      ( "AcceleratorAttributes",
        option_to_yojson accelerator_attributes_to_yojson x.accelerator_attributes );
    ]

let update_accelerator_attributes_request_to_yojson (x : update_accelerator_attributes_request) =
  assoc_to_yojson
    [
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let socket_address_to_yojson (x : socket_address) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("IpAddress", option_to_yojson generic_string_to_yojson x.ip_address);
    ]

let socket_addresses_to_yojson tree = list_to_yojson socket_address_to_yojson tree

let endpoint_identifier_to_yojson (x : endpoint_identifier) =
  assoc_to_yojson
    [
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
    ]

let endpoint_identifiers_to_yojson tree = list_to_yojson endpoint_identifier_to_yojson tree

let remove_endpoints_request_to_yojson (x : remove_endpoints_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ("EndpointIdentifiers", Some (endpoint_identifiers_to_yojson x.endpoint_identifiers));
    ]

let endpoint_ids_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let remove_custom_routing_endpoints_request_to_yojson (x : remove_custom_routing_endpoints_request)
    =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ("EndpointIds", Some (endpoint_ids_to_yojson x.endpoint_ids));
    ]

let endpoint_not_found_exception_to_yojson (x : endpoint_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let provision_byoip_cidr_response_to_yojson (x : provision_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let cidr_authorization_context_to_yojson (x : cidr_authorization_context) =
  assoc_to_yojson
    [
      ("Signature", Some (generic_string_to_yojson x.signature));
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let provision_byoip_cidr_request_to_yojson (x : provision_byoip_cidr_request) =
  assoc_to_yojson
    [
      ( "CidrAuthorizationContext",
        Some (cidr_authorization_context_to_yojson x.cidr_authorization_context) );
      ("Cidr", Some (generic_string_to_yojson x.cidr));
    ]

let protocols_to_yojson tree = list_to_yojson protocol_to_yojson tree
let port_mappings_max_results_to_yojson = int_to_yojson

let custom_routing_protocol_to_yojson (x : custom_routing_protocol) =
  match x with UDP -> `String "UDP" | TCP -> `String "TCP"

let custom_routing_protocols_to_yojson tree = list_to_yojson custom_routing_protocol_to_yojson tree

let custom_routing_destination_traffic_state_to_yojson
    (x : custom_routing_destination_traffic_state) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let port_mapping_to_yojson (x : port_mapping) =
  assoc_to_yojson
    [
      ( "DestinationTrafficState",
        option_to_yojson custom_routing_destination_traffic_state_to_yojson
          x.destination_traffic_state );
      ("Protocols", option_to_yojson custom_routing_protocols_to_yojson x.protocols);
      ( "DestinationSocketAddress",
        option_to_yojson socket_address_to_yojson x.destination_socket_address );
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("AcceleratorPort", option_to_yojson port_number_to_yojson x.accelerator_port);
    ]

let port_mappings_to_yojson tree = list_to_yojson port_mapping_to_yojson tree
let max_results_to_yojson = int_to_yojson
let listeners_to_yojson tree = list_to_yojson listener_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let list_listeners_response_to_yojson (x : list_listeners_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Listeners", option_to_yojson listeners_to_yojson x.listeners);
    ]

let list_listeners_request_to_yojson (x : list_listeners_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let endpoint_groups_to_yojson tree = list_to_yojson endpoint_group_to_yojson tree

let list_endpoint_groups_response_to_yojson (x : list_endpoint_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("EndpointGroups", option_to_yojson endpoint_groups_to_yojson x.endpoint_groups);
    ]

let list_endpoint_groups_request_to_yojson (x : list_endpoint_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let list_custom_routing_port_mappings_response_to_yojson
    (x : list_custom_routing_port_mappings_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("PortMappings", option_to_yojson port_mappings_to_yojson x.port_mappings);
    ]

let list_custom_routing_port_mappings_request_to_yojson
    (x : list_custom_routing_port_mappings_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson port_mappings_max_results_to_yojson x.max_results);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let destination_port_mapping_to_yojson (x : destination_port_mapping) =
  assoc_to_yojson
    [
      ( "DestinationTrafficState",
        option_to_yojson custom_routing_destination_traffic_state_to_yojson
          x.destination_traffic_state );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "DestinationSocketAddress",
        option_to_yojson socket_address_to_yojson x.destination_socket_address );
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ( "AcceleratorSocketAddresses",
        option_to_yojson socket_addresses_to_yojson x.accelerator_socket_addresses );
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
    ]

let destination_port_mappings_to_yojson tree =
  list_to_yojson destination_port_mapping_to_yojson tree

let list_custom_routing_port_mappings_by_destination_response_to_yojson
    (x : list_custom_routing_port_mappings_by_destination_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ( "DestinationPortMappings",
        option_to_yojson destination_port_mappings_to_yojson x.destination_port_mappings );
    ]

let list_custom_routing_port_mappings_by_destination_request_to_yojson
    (x : list_custom_routing_port_mappings_by_destination_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson port_mappings_max_results_to_yojson x.max_results);
      ("DestinationAddress", Some (generic_string_to_yojson x.destination_address));
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
    ]

let custom_routing_listeners_to_yojson tree = list_to_yojson custom_routing_listener_to_yojson tree

let list_custom_routing_listeners_response_to_yojson (x : list_custom_routing_listeners_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Listeners", option_to_yojson custom_routing_listeners_to_yojson x.listeners);
    ]

let list_custom_routing_listeners_request_to_yojson (x : list_custom_routing_listeners_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let custom_routing_destination_description_to_yojson (x : custom_routing_destination_description) =
  assoc_to_yojson
    [
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ("ToPort", option_to_yojson port_number_to_yojson x.to_port);
      ("FromPort", option_to_yojson port_number_to_yojson x.from_port);
    ]

let custom_routing_destination_descriptions_to_yojson tree =
  list_to_yojson custom_routing_destination_description_to_yojson tree

let custom_routing_endpoint_description_to_yojson (x : custom_routing_endpoint_description) =
  assoc_to_yojson [ ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id) ]

let custom_routing_endpoint_descriptions_to_yojson tree =
  list_to_yojson custom_routing_endpoint_description_to_yojson tree

let custom_routing_endpoint_group_to_yojson (x : custom_routing_endpoint_group) =
  assoc_to_yojson
    [
      ( "EndpointDescriptions",
        option_to_yojson custom_routing_endpoint_descriptions_to_yojson x.endpoint_descriptions );
      ( "DestinationDescriptions",
        option_to_yojson custom_routing_destination_descriptions_to_yojson
          x.destination_descriptions );
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
    ]

let custom_routing_endpoint_groups_to_yojson tree =
  list_to_yojson custom_routing_endpoint_group_to_yojson tree

let list_custom_routing_endpoint_groups_response_to_yojson
    (x : list_custom_routing_endpoint_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("EndpointGroups", option_to_yojson custom_routing_endpoint_groups_to_yojson x.endpoint_groups);
    ]

let list_custom_routing_endpoint_groups_request_to_yojson
    (x : list_custom_routing_endpoint_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let custom_routing_accelerators_to_yojson tree =
  list_to_yojson custom_routing_accelerator_to_yojson tree

let list_custom_routing_accelerators_response_to_yojson
    (x : list_custom_routing_accelerators_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Accelerators", option_to_yojson custom_routing_accelerators_to_yojson x.accelerators);
    ]

let list_custom_routing_accelerators_request_to_yojson
    (x : list_custom_routing_accelerators_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let cross_account_resource_to_yojson (x : cross_account_resource) =
  assoc_to_yojson
    [
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
    ]

let cross_account_resources_to_yojson tree = list_to_yojson cross_account_resource_to_yojson tree

let list_cross_account_resources_response_to_yojson (x : list_cross_account_resources_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ( "CrossAccountResources",
        option_to_yojson cross_account_resources_to_yojson x.cross_account_resources );
    ]

let aws_account_id_to_yojson = string_to_yojson

let list_cross_account_resources_request_to_yojson (x : list_cross_account_resources_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceOwnerAwsAccountId", Some (aws_account_id_to_yojson x.resource_owner_aws_account_id));
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
    ]

let aws_account_ids_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree

let list_cross_account_resource_accounts_response_to_yojson
    (x : list_cross_account_resource_accounts_response) =
  assoc_to_yojson
    [
      ( "ResourceOwnerAwsAccountIds",
        option_to_yojson aws_account_ids_to_yojson x.resource_owner_aws_account_ids );
    ]

let list_cross_account_resource_accounts_request_to_yojson = unit_to_yojson
let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree

let list_cross_account_attachments_response_to_yojson (x : list_cross_account_attachments_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("CrossAccountAttachments", option_to_yojson attachments_to_yojson x.cross_account_attachments);
    ]

let list_cross_account_attachments_request_to_yojson (x : list_cross_account_attachments_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let byoip_cidrs_to_yojson tree = list_to_yojson byoip_cidr_to_yojson tree

let list_byoip_cidrs_response_to_yojson (x : list_byoip_cidrs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("ByoipCidrs", option_to_yojson byoip_cidrs_to_yojson x.byoip_cidrs);
    ]

let list_byoip_cidrs_request_to_yojson (x : list_byoip_cidrs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let accelerators_to_yojson tree = list_to_yojson accelerator_to_yojson tree

let list_accelerators_response_to_yojson (x : list_accelerators_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Accelerators", option_to_yojson accelerators_to_yojson x.accelerators);
    ]

let list_accelerators_request_to_yojson (x : list_accelerators_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let idempotency_token_to_yojson = string_to_yojson

let describe_listener_response_to_yojson (x : describe_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let describe_listener_request_to_yojson (x : describe_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let describe_endpoint_group_response_to_yojson (x : describe_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let describe_endpoint_group_request_to_yojson (x : describe_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let describe_custom_routing_listener_response_to_yojson
    (x : describe_custom_routing_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let describe_custom_routing_listener_request_to_yojson
    (x : describe_custom_routing_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let describe_custom_routing_endpoint_group_response_to_yojson
    (x : describe_custom_routing_endpoint_group_response) =
  assoc_to_yojson
    [ ("EndpointGroup", option_to_yojson custom_routing_endpoint_group_to_yojson x.endpoint_group) ]

let describe_custom_routing_endpoint_group_request_to_yojson
    (x : describe_custom_routing_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let describe_custom_routing_accelerator_attributes_response_to_yojson
    (x : describe_custom_routing_accelerator_attributes_response) =
  assoc_to_yojson
    [
      ( "AcceleratorAttributes",
        option_to_yojson custom_routing_accelerator_attributes_to_yojson x.accelerator_attributes );
    ]

let describe_custom_routing_accelerator_attributes_request_to_yojson
    (x : describe_custom_routing_accelerator_attributes_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let describe_custom_routing_accelerator_response_to_yojson
    (x : describe_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let describe_custom_routing_accelerator_request_to_yojson
    (x : describe_custom_routing_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let describe_cross_account_attachment_response_to_yojson
    (x : describe_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let describe_cross_account_attachment_request_to_yojson
    (x : describe_cross_account_attachment_request) =
  assoc_to_yojson [ ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn)) ]

let describe_accelerator_attributes_response_to_yojson
    (x : describe_accelerator_attributes_response) =
  assoc_to_yojson
    [
      ( "AcceleratorAttributes",
        option_to_yojson accelerator_attributes_to_yojson x.accelerator_attributes );
    ]

let describe_accelerator_attributes_request_to_yojson (x : describe_accelerator_attributes_request)
    =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let describe_accelerator_response_to_yojson (x : describe_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let describe_accelerator_request_to_yojson (x : describe_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let deprovision_byoip_cidr_response_to_yojson (x : deprovision_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let deprovision_byoip_cidr_request_to_yojson (x : deprovision_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let destination_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree
let destination_ports_to_yojson tree = list_to_yojson port_number_to_yojson tree

let deny_custom_routing_traffic_request_to_yojson (x : deny_custom_routing_traffic_request) =
  assoc_to_yojson
    [
      ( "DenyAllTrafficToEndpoint",
        option_to_yojson generic_boolean_to_yojson x.deny_all_traffic_to_endpoint );
      ("DestinationPorts", option_to_yojson destination_ports_to_yojson x.destination_ports);
      ( "DestinationAddresses",
        option_to_yojson destination_addresses_to_yojson x.destination_addresses );
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let associated_endpoint_group_found_exception_to_yojson
    (x : associated_endpoint_group_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_listener_request_to_yojson (x : delete_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let delete_endpoint_group_request_to_yojson (x : delete_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let delete_custom_routing_listener_request_to_yojson (x : delete_custom_routing_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let delete_custom_routing_endpoint_group_request_to_yojson
    (x : delete_custom_routing_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let associated_listener_found_exception_to_yojson (x : associated_listener_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let accelerator_not_disabled_exception_to_yojson (x : accelerator_not_disabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_custom_routing_accelerator_request_to_yojson
    (x : delete_custom_routing_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let delete_cross_account_attachment_request_to_yojson (x : delete_cross_account_attachment_request)
    =
  assoc_to_yojson [ ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn)) ]

let delete_accelerator_request_to_yojson (x : delete_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let create_listener_response_to_yojson (x : create_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let create_listener_request_to_yojson (x : create_listener_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
      ("Protocol", Some (protocol_to_yojson x.protocol));
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let endpoint_group_already_exists_exception_to_yojson (x : endpoint_group_already_exists_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_endpoint_group_response_to_yojson (x : create_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let create_endpoint_group_request_to_yojson (x : create_endpoint_group_request) =
  assoc_to_yojson
    [
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ( "EndpointConfigurations",
        option_to_yojson endpoint_configurations_to_yojson x.endpoint_configurations );
      ("EndpointGroupRegion", Some (generic_string_to_yojson x.endpoint_group_region));
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let create_custom_routing_listener_response_to_yojson (x : create_custom_routing_listener_response)
    =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let create_custom_routing_listener_request_to_yojson (x : create_custom_routing_listener_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
    ]

let create_custom_routing_endpoint_group_response_to_yojson
    (x : create_custom_routing_endpoint_group_response) =
  assoc_to_yojson
    [ ("EndpointGroup", option_to_yojson custom_routing_endpoint_group_to_yojson x.endpoint_group) ]

let custom_routing_destination_configuration_to_yojson
    (x : custom_routing_destination_configuration) =
  assoc_to_yojson
    [
      ("Protocols", Some (custom_routing_protocols_to_yojson x.protocols));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("FromPort", Some (port_number_to_yojson x.from_port));
    ]

let custom_routing_destination_configurations_to_yojson tree =
  list_to_yojson custom_routing_destination_configuration_to_yojson tree

let create_custom_routing_endpoint_group_request_to_yojson
    (x : create_custom_routing_endpoint_group_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ( "DestinationConfigurations",
        Some (custom_routing_destination_configurations_to_yojson x.destination_configurations) );
      ("EndpointGroupRegion", Some (generic_string_to_yojson x.endpoint_group_region));
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
    ]

let create_custom_routing_accelerator_response_to_yojson
    (x : create_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let create_custom_routing_accelerator_request_to_yojson
    (x : create_custom_routing_accelerator_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", Some (generic_string_to_yojson x.name));
    ]

let create_cross_account_attachment_response_to_yojson
    (x : create_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let create_cross_account_attachment_request_to_yojson (x : create_cross_account_attachment_request)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Resources", option_to_yojson resources_to_yojson x.resources);
      ("Principals", option_to_yojson principals_to_yojson x.principals);
      ("Name", Some (attachment_name_to_yojson x.name));
    ]

let create_accelerator_response_to_yojson (x : create_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let create_accelerator_request_to_yojson (x : create_accelerator_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Name", Some (generic_string_to_yojson x.name));
    ]

let allow_custom_routing_traffic_request_to_yojson (x : allow_custom_routing_traffic_request) =
  assoc_to_yojson
    [
      ( "AllowAllTrafficToEndpoint",
        option_to_yojson generic_boolean_to_yojson x.allow_all_traffic_to_endpoint );
      ("DestinationPorts", option_to_yojson destination_ports_to_yojson x.destination_ports);
      ( "DestinationAddresses",
        option_to_yojson destination_addresses_to_yojson x.destination_addresses );
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let advertise_byoip_cidr_response_to_yojson (x : advertise_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let advertise_byoip_cidr_request_to_yojson (x : advertise_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let add_endpoints_response_to_yojson (x : add_endpoints_response) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ( "EndpointDescriptions",
        option_to_yojson endpoint_descriptions_to_yojson x.endpoint_descriptions );
    ]

let add_endpoints_request_to_yojson (x : add_endpoints_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ("EndpointConfigurations", Some (endpoint_configurations_to_yojson x.endpoint_configurations));
    ]

let endpoint_already_exists_exception_to_yojson (x : endpoint_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let add_custom_routing_endpoints_response_to_yojson (x : add_custom_routing_endpoints_response) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ( "EndpointDescriptions",
        option_to_yojson custom_routing_endpoint_descriptions_to_yojson x.endpoint_descriptions );
    ]

let custom_routing_endpoint_configuration_to_yojson (x : custom_routing_endpoint_configuration) =
  assoc_to_yojson
    [
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
    ]

let custom_routing_endpoint_configurations_to_yojson tree =
  list_to_yojson custom_routing_endpoint_configuration_to_yojson tree

let add_custom_routing_endpoints_request_to_yojson (x : add_custom_routing_endpoints_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ( "EndpointConfigurations",
        Some (custom_routing_endpoint_configurations_to_yojson x.endpoint_configurations) );
    ]
