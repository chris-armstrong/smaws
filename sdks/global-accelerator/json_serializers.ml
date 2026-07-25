open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let generic_string_to_yojson = string_to_yojson

let accelerator_event_to_yojson (x : accelerator_event) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson generic_string_to_yojson x.message);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let accelerator_events_to_yojson tree = list_to_yojson accelerator_event_to_yojson tree

let accelerator_status_to_yojson (x : accelerator_status) =
  match x with DEPLOYED -> `String "DEPLOYED" | IN_PROGRESS -> `String "IN_PROGRESS"

let ip_address_family_to_yojson (x : ip_address_family) =
  match x with IPv4 -> `String "IPv4" | IPv6 -> `String "IPv6"

let ip_address_to_yojson = string_to_yojson
let ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson
    [
      ("IpFamily", option_to_yojson generic_string_to_yojson x.ip_family);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("IpAddressFamily", option_to_yojson ip_address_family_to_yojson x.ip_address_family);
    ]

let ip_sets_to_yojson tree = list_to_yojson ip_set_to_yojson tree
let generic_boolean_to_yojson = bool_to_yojson

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with IPV4 -> `String "IPV4" | DUAL_STACK -> `String "DUAL_STACK"

let accelerator_to_yojson (x : accelerator) =
  assoc_to_yojson
    [
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
      ("DnsName", option_to_yojson generic_string_to_yojson x.dns_name);
      ("Status", option_to_yojson accelerator_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("DualStackDnsName", option_to_yojson generic_string_to_yojson x.dual_stack_dns_name);
      ("Events", option_to_yojson accelerator_events_to_yojson x.events);
    ]

let accelerator_attributes_to_yojson (x : accelerator_attributes) =
  assoc_to_yojson
    [
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
    ]

let error_message_to_yojson = string_to_yojson

let accelerator_not_disabled_exception_to_yojson (x : accelerator_not_disabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let accelerator_not_found_exception_to_yojson (x : accelerator_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let accelerators_to_yojson tree = list_to_yojson accelerator_to_yojson tree

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let endpoint_group_not_found_exception_to_yojson (x : endpoint_group_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let endpoint_already_exists_exception_to_yojson (x : endpoint_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let custom_routing_endpoint_description_to_yojson (x : custom_routing_endpoint_description) =
  assoc_to_yojson [ ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id) ]

let custom_routing_endpoint_descriptions_to_yojson tree =
  list_to_yojson custom_routing_endpoint_description_to_yojson tree

let add_custom_routing_endpoints_response_to_yojson (x : add_custom_routing_endpoints_response) =
  assoc_to_yojson
    [
      ( "EndpointDescriptions",
        option_to_yojson custom_routing_endpoint_descriptions_to_yojson x.endpoint_descriptions );
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
    ]

let custom_routing_endpoint_configuration_to_yojson (x : custom_routing_endpoint_configuration) =
  assoc_to_yojson
    [
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
    ]

let custom_routing_endpoint_configurations_to_yojson tree =
  list_to_yojson custom_routing_endpoint_configuration_to_yojson tree

let add_custom_routing_endpoints_request_to_yojson (x : add_custom_routing_endpoints_request) =
  assoc_to_yojson
    [
      ( "EndpointConfigurations",
        Some (custom_routing_endpoint_configurations_to_yojson x.endpoint_configurations) );
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let transaction_in_progress_exception_to_yojson (x : transaction_in_progress_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let health_state_to_yojson (x : health_state) =
  match x with
  | INITIAL -> `String "INITIAL"
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"

let endpoint_weight_to_yojson = int_to_yojson

let endpoint_description_to_yojson (x : endpoint_description) =
  assoc_to_yojson
    [
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("Weight", option_to_yojson endpoint_weight_to_yojson x.weight);
      ("HealthState", option_to_yojson health_state_to_yojson x.health_state);
      ("HealthReason", option_to_yojson generic_string_to_yojson x.health_reason);
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
    ]

let endpoint_descriptions_to_yojson tree = list_to_yojson endpoint_description_to_yojson tree

let add_endpoints_response_to_yojson (x : add_endpoints_response) =
  assoc_to_yojson
    [
      ( "EndpointDescriptions",
        option_to_yojson endpoint_descriptions_to_yojson x.endpoint_descriptions );
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
    ]

let endpoint_configuration_to_yojson (x : endpoint_configuration) =
  assoc_to_yojson
    [
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("Weight", option_to_yojson endpoint_weight_to_yojson x.weight);
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
    ]

let endpoint_configurations_to_yojson tree = list_to_yojson endpoint_configuration_to_yojson tree

let add_endpoints_request_to_yojson (x : add_endpoints_request) =
  assoc_to_yojson
    [
      ("EndpointConfigurations", Some (endpoint_configurations_to_yojson x.endpoint_configurations));
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let incorrect_cidr_state_exception_to_yojson (x : incorrect_cidr_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let byoip_cidr_not_found_exception_to_yojson (x : byoip_cidr_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let byoip_cidr_event_to_yojson (x : byoip_cidr_event) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson generic_string_to_yojson x.message);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let byoip_cidr_events_to_yojson tree = list_to_yojson byoip_cidr_event_to_yojson tree

let byoip_cidr_state_to_yojson (x : byoip_cidr_state) =
  match x with
  | PENDING_PROVISIONING -> `String "PENDING_PROVISIONING"
  | READY -> `String "READY"
  | PENDING_ADVERTISING -> `String "PENDING_ADVERTISING"
  | ADVERTISING -> `String "ADVERTISING"
  | PENDING_WITHDRAWING -> `String "PENDING_WITHDRAWING"
  | PENDING_DEPROVISIONING -> `String "PENDING_DEPROVISIONING"
  | DEPROVISIONED -> `String "DEPROVISIONED"
  | FAILED_PROVISION -> `String "FAILED_PROVISION"
  | FAILED_ADVERTISING -> `String "FAILED_ADVERTISING"
  | FAILED_WITHDRAW -> `String "FAILED_WITHDRAW"
  | FAILED_DEPROVISION -> `String "FAILED_DEPROVISION"

let byoip_cidr_to_yojson (x : byoip_cidr) =
  assoc_to_yojson
    [
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
      ("State", option_to_yojson byoip_cidr_state_to_yojson x.state);
      ("Events", option_to_yojson byoip_cidr_events_to_yojson x.events);
    ]

let advertise_byoip_cidr_response_to_yojson (x : advertise_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let advertise_byoip_cidr_request_to_yojson (x : advertise_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let port_number_to_yojson = int_to_yojson
let destination_ports_to_yojson tree = list_to_yojson port_number_to_yojson tree
let destination_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let allow_custom_routing_traffic_request_to_yojson (x : allow_custom_routing_traffic_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ( "DestinationAddresses",
        option_to_yojson destination_addresses_to_yojson x.destination_addresses );
      ("DestinationPorts", option_to_yojson destination_ports_to_yojson x.destination_ports);
      ( "AllowAllTrafficToEndpoint",
        option_to_yojson generic_boolean_to_yojson x.allow_all_traffic_to_endpoint );
    ]

let associated_endpoint_group_found_exception_to_yojson
    (x : associated_endpoint_group_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let associated_listener_found_exception_to_yojson (x : associated_listener_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree
let principal_to_yojson = string_to_yojson
let principals_to_yojson tree = list_to_yojson principal_to_yojson tree
let attachment_name_to_yojson = string_to_yojson

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
      ("Name", option_to_yojson attachment_name_to_yojson x.name);
      ("Principals", option_to_yojson principals_to_yojson x.principals);
      ("Resources", option_to_yojson resources_to_yojson x.resources);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
    ]

let attachment_not_found_exception_to_yojson (x : attachment_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree
let aws_account_id_to_yojson = string_to_yojson
let aws_account_ids_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree
let byoip_cidrs_to_yojson tree = list_to_yojson byoip_cidr_to_yojson tree

let cidr_authorization_context_to_yojson (x : cidr_authorization_context) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("Signature", Some (generic_string_to_yojson x.signature));
    ]

let client_affinity_to_yojson (x : client_affinity) =
  match x with NONE -> `String "NONE" | SOURCE_IP -> `String "SOURCE_IP"

let create_accelerator_response_to_yojson (x : create_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let idempotency_token_to_yojson = string_to_yojson

let create_accelerator_request_to_yojson (x : create_accelerator_request) =
  assoc_to_yojson
    [
      ("Name", Some (generic_string_to_yojson x.name));
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_cross_account_attachment_response_to_yojson
    (x : create_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let create_cross_account_attachment_request_to_yojson (x : create_cross_account_attachment_request)
    =
  assoc_to_yojson
    [
      ("Name", Some (attachment_name_to_yojson x.name));
      ("Principals", option_to_yojson principals_to_yojson x.principals);
      ("Resources", option_to_yojson resources_to_yojson x.resources);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let custom_routing_accelerator_status_to_yojson (x : custom_routing_accelerator_status) =
  match x with DEPLOYED -> `String "DEPLOYED" | IN_PROGRESS -> `String "IN_PROGRESS"

let custom_routing_accelerator_to_yojson (x : custom_routing_accelerator) =
  assoc_to_yojson
    [
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IpSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
      ("DnsName", option_to_yojson generic_string_to_yojson x.dns_name);
      ("Status", option_to_yojson custom_routing_accelerator_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let create_custom_routing_accelerator_response_to_yojson
    (x : create_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let create_custom_routing_accelerator_request_to_yojson
    (x : create_custom_routing_accelerator_request) =
  assoc_to_yojson
    [
      ("Name", Some (generic_string_to_yojson x.name));
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let listener_not_found_exception_to_yojson (x : listener_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_port_range_exception_to_yojson (x : invalid_port_range_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let endpoint_group_already_exists_exception_to_yojson (x : endpoint_group_already_exists_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let protocol_to_yojson (x : protocol) = match x with TCP -> `String "TCP" | UDP -> `String "UDP"
let protocols_to_yojson tree = list_to_yojson protocol_to_yojson tree

let custom_routing_destination_description_to_yojson (x : custom_routing_destination_description) =
  assoc_to_yojson
    [
      ("FromPort", option_to_yojson port_number_to_yojson x.from_port);
      ("ToPort", option_to_yojson port_number_to_yojson x.to_port);
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
    ]

let custom_routing_destination_descriptions_to_yojson tree =
  list_to_yojson custom_routing_destination_description_to_yojson tree

let custom_routing_endpoint_group_to_yojson (x : custom_routing_endpoint_group) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ( "DestinationDescriptions",
        option_to_yojson custom_routing_destination_descriptions_to_yojson
          x.destination_descriptions );
      ( "EndpointDescriptions",
        option_to_yojson custom_routing_endpoint_descriptions_to_yojson x.endpoint_descriptions );
    ]

let create_custom_routing_endpoint_group_response_to_yojson
    (x : create_custom_routing_endpoint_group_response) =
  assoc_to_yojson
    [ ("EndpointGroup", option_to_yojson custom_routing_endpoint_group_to_yojson x.endpoint_group) ]

let custom_routing_protocol_to_yojson (x : custom_routing_protocol) =
  match x with TCP -> `String "TCP" | UDP -> `String "UDP"

let custom_routing_protocols_to_yojson tree = list_to_yojson custom_routing_protocol_to_yojson tree

let custom_routing_destination_configuration_to_yojson
    (x : custom_routing_destination_configuration) =
  assoc_to_yojson
    [
      ("FromPort", Some (port_number_to_yojson x.from_port));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("Protocols", Some (custom_routing_protocols_to_yojson x.protocols));
    ]

let custom_routing_destination_configurations_to_yojson tree =
  list_to_yojson custom_routing_destination_configuration_to_yojson tree

let create_custom_routing_endpoint_group_request_to_yojson
    (x : create_custom_routing_endpoint_group_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("EndpointGroupRegion", Some (generic_string_to_yojson x.endpoint_group_region));
      ( "DestinationConfigurations",
        Some (custom_routing_destination_configurations_to_yojson x.destination_configurations) );
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("FromPort", option_to_yojson port_number_to_yojson x.from_port);
      ("ToPort", option_to_yojson port_number_to_yojson x.to_port);
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree

let custom_routing_listener_to_yojson (x : custom_routing_listener) =
  assoc_to_yojson
    [
      ("ListenerArn", option_to_yojson generic_string_to_yojson x.listener_arn);
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
    ]

let create_custom_routing_listener_response_to_yojson (x : create_custom_routing_listener_response)
    =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let create_custom_routing_listener_request_to_yojson (x : create_custom_routing_listener_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let port_override_to_yojson (x : port_override) =
  assoc_to_yojson
    [
      ("ListenerPort", option_to_yojson port_number_to_yojson x.listener_port);
      ("EndpointPort", option_to_yojson port_number_to_yojson x.endpoint_port);
    ]

let port_overrides_to_yojson tree = list_to_yojson port_override_to_yojson tree
let threshold_count_to_yojson = int_to_yojson
let health_check_interval_seconds_to_yojson = int_to_yojson
let health_check_path_to_yojson = string_to_yojson

let health_check_protocol_to_yojson (x : health_check_protocol) =
  match x with TCP -> `String "TCP" | HTTP -> `String "HTTP" | HTTPS -> `String "HTTPS"

let health_check_port_to_yojson = int_to_yojson
let traffic_dial_percentage_to_yojson = float_to_yojson

let endpoint_group_to_yojson (x : endpoint_group) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ( "EndpointDescriptions",
        option_to_yojson endpoint_descriptions_to_yojson x.endpoint_descriptions );
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
    ]

let create_endpoint_group_response_to_yojson (x : create_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let create_endpoint_group_request_to_yojson (x : create_endpoint_group_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("EndpointGroupRegion", Some (generic_string_to_yojson x.endpoint_group_region));
      ( "EndpointConfigurations",
        option_to_yojson endpoint_configurations_to_yojson x.endpoint_configurations );
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
    ]

let listener_to_yojson (x : listener) =
  assoc_to_yojson
    [
      ("ListenerArn", option_to_yojson generic_string_to_yojson x.listener_arn);
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
    ]

let create_listener_response_to_yojson (x : create_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let create_listener_request_to_yojson (x : create_listener_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
      ("Protocol", Some (protocol_to_yojson x.protocol));
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let cross_account_resource_to_yojson (x : cross_account_resource) =
  assoc_to_yojson
    [
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("Cidr", option_to_yojson generic_string_to_yojson x.cidr);
      ("AttachmentArn", option_to_yojson generic_string_to_yojson x.attachment_arn);
    ]

let cross_account_resources_to_yojson tree = list_to_yojson cross_account_resource_to_yojson tree

let custom_routing_accelerator_attributes_to_yojson (x : custom_routing_accelerator_attributes) =
  assoc_to_yojson
    [
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
    ]

let custom_routing_accelerators_to_yojson tree =
  list_to_yojson custom_routing_accelerator_to_yojson tree

let custom_routing_destination_traffic_state_to_yojson
    (x : custom_routing_destination_traffic_state) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let custom_routing_endpoint_groups_to_yojson tree =
  list_to_yojson custom_routing_endpoint_group_to_yojson tree

let custom_routing_listeners_to_yojson tree = list_to_yojson custom_routing_listener_to_yojson tree

let delete_accelerator_request_to_yojson (x : delete_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let delete_cross_account_attachment_request_to_yojson (x : delete_cross_account_attachment_request)
    =
  assoc_to_yojson [ ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn)) ]

let delete_custom_routing_accelerator_request_to_yojson
    (x : delete_custom_routing_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

let delete_custom_routing_endpoint_group_request_to_yojson
    (x : delete_custom_routing_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let delete_custom_routing_listener_request_to_yojson (x : delete_custom_routing_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let delete_endpoint_group_request_to_yojson (x : delete_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let delete_listener_request_to_yojson (x : delete_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let deny_custom_routing_traffic_request_to_yojson (x : deny_custom_routing_traffic_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ( "DestinationAddresses",
        option_to_yojson destination_addresses_to_yojson x.destination_addresses );
      ("DestinationPorts", option_to_yojson destination_ports_to_yojson x.destination_ports);
      ( "DenyAllTrafficToEndpoint",
        option_to_yojson generic_boolean_to_yojson x.deny_all_traffic_to_endpoint );
    ]

let deprovision_byoip_cidr_response_to_yojson (x : deprovision_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let deprovision_byoip_cidr_request_to_yojson (x : deprovision_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let describe_accelerator_response_to_yojson (x : describe_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let describe_accelerator_request_to_yojson (x : describe_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

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

let describe_cross_account_attachment_response_to_yojson
    (x : describe_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let describe_cross_account_attachment_request_to_yojson
    (x : describe_cross_account_attachment_request) =
  assoc_to_yojson [ ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn)) ]

let describe_custom_routing_accelerator_response_to_yojson
    (x : describe_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let describe_custom_routing_accelerator_request_to_yojson
    (x : describe_custom_routing_accelerator_request) =
  assoc_to_yojson [ ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn)) ]

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

let describe_custom_routing_endpoint_group_response_to_yojson
    (x : describe_custom_routing_endpoint_group_response) =
  assoc_to_yojson
    [ ("EndpointGroup", option_to_yojson custom_routing_endpoint_group_to_yojson x.endpoint_group) ]

let describe_custom_routing_endpoint_group_request_to_yojson
    (x : describe_custom_routing_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let describe_custom_routing_listener_response_to_yojson
    (x : describe_custom_routing_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let describe_custom_routing_listener_request_to_yojson
    (x : describe_custom_routing_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let describe_endpoint_group_response_to_yojson (x : describe_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let describe_endpoint_group_request_to_yojson (x : describe_endpoint_group_request) =
  assoc_to_yojson [ ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn)) ]

let describe_listener_response_to_yojson (x : describe_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let describe_listener_request_to_yojson (x : describe_listener_request) =
  assoc_to_yojson [ ("ListenerArn", Some (generic_string_to_yojson x.listener_arn)) ]

let socket_address_to_yojson (x : socket_address) =
  assoc_to_yojson
    [
      ("IpAddress", option_to_yojson generic_string_to_yojson x.ip_address);
      ("Port", option_to_yojson port_number_to_yojson x.port);
    ]

let socket_addresses_to_yojson tree = list_to_yojson socket_address_to_yojson tree

let destination_port_mapping_to_yojson (x : destination_port_mapping) =
  assoc_to_yojson
    [
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
      ( "AcceleratorSocketAddresses",
        option_to_yojson socket_addresses_to_yojson x.accelerator_socket_addresses );
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ("EndpointGroupRegion", option_to_yojson generic_string_to_yojson x.endpoint_group_region);
      ( "DestinationSocketAddress",
        option_to_yojson socket_address_to_yojson x.destination_socket_address );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "DestinationTrafficState",
        option_to_yojson custom_routing_destination_traffic_state_to_yojson
          x.destination_traffic_state );
    ]

let destination_port_mappings_to_yojson tree =
  list_to_yojson destination_port_mapping_to_yojson tree

let endpoint_groups_to_yojson tree = list_to_yojson endpoint_group_to_yojson tree

let endpoint_identifier_to_yojson (x : endpoint_identifier) =
  assoc_to_yojson
    [
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ( "ClientIPPreservationEnabled",
        option_to_yojson generic_boolean_to_yojson x.client_ip_preservation_enabled );
    ]

let endpoint_identifiers_to_yojson tree = list_to_yojson endpoint_identifier_to_yojson tree
let endpoint_ids_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let endpoint_not_found_exception_to_yojson (x : endpoint_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let withdraw_byoip_cidr_response_to_yojson (x : withdraw_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let withdraw_byoip_cidr_request_to_yojson (x : withdraw_byoip_cidr_request) =
  assoc_to_yojson [ ("Cidr", Some (generic_string_to_yojson x.cidr)) ]

let update_listener_response_to_yojson (x : update_listener_response) =
  assoc_to_yojson [ ("Listener", option_to_yojson listener_to_yojson x.listener) ]

let update_listener_request_to_yojson (x : update_listener_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("PortRanges", option_to_yojson port_ranges_to_yojson x.port_ranges);
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ("ClientAffinity", option_to_yojson client_affinity_to_yojson x.client_affinity);
    ]

let update_endpoint_group_response_to_yojson (x : update_endpoint_group_response) =
  assoc_to_yojson [ ("EndpointGroup", option_to_yojson endpoint_group_to_yojson x.endpoint_group) ]

let update_endpoint_group_request_to_yojson (x : update_endpoint_group_request) =
  assoc_to_yojson
    [
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
      ( "EndpointConfigurations",
        option_to_yojson endpoint_configurations_to_yojson x.endpoint_configurations );
      ( "TrafficDialPercentage",
        option_to_yojson traffic_dial_percentage_to_yojson x.traffic_dial_percentage );
      ("HealthCheckPort", option_to_yojson health_check_port_to_yojson x.health_check_port);
      ( "HealthCheckProtocol",
        option_to_yojson health_check_protocol_to_yojson x.health_check_protocol );
      ("HealthCheckPath", option_to_yojson health_check_path_to_yojson x.health_check_path);
      ( "HealthCheckIntervalSeconds",
        option_to_yojson health_check_interval_seconds_to_yojson x.health_check_interval_seconds );
      ("ThresholdCount", option_to_yojson threshold_count_to_yojson x.threshold_count);
      ("PortOverrides", option_to_yojson port_overrides_to_yojson x.port_overrides);
    ]

let update_custom_routing_listener_response_to_yojson (x : update_custom_routing_listener_response)
    =
  assoc_to_yojson [ ("Listener", option_to_yojson custom_routing_listener_to_yojson x.listener) ]

let update_custom_routing_listener_request_to_yojson (x : update_custom_routing_listener_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("PortRanges", Some (port_ranges_to_yojson x.port_ranges));
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
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
    ]

let update_custom_routing_accelerator_response_to_yojson
    (x : update_custom_routing_accelerator_response) =
  assoc_to_yojson
    [ ("Accelerator", option_to_yojson custom_routing_accelerator_to_yojson x.accelerator) ]

let update_custom_routing_accelerator_request_to_yojson
    (x : update_custom_routing_accelerator_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
    ]

let update_cross_account_attachment_response_to_yojson
    (x : update_cross_account_attachment_response) =
  assoc_to_yojson
    [ ("CrossAccountAttachment", option_to_yojson attachment_to_yojson x.cross_account_attachment) ]

let update_cross_account_attachment_request_to_yojson (x : update_cross_account_attachment_request)
    =
  assoc_to_yojson
    [
      ("AttachmentArn", Some (generic_string_to_yojson x.attachment_arn));
      ("Name", option_to_yojson attachment_name_to_yojson x.name);
      ("AddPrincipals", option_to_yojson principals_to_yojson x.add_principals);
      ("RemovePrincipals", option_to_yojson principals_to_yojson x.remove_principals);
      ("AddResources", option_to_yojson resources_to_yojson x.add_resources);
      ("RemoveResources", option_to_yojson resources_to_yojson x.remove_resources);
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
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("FlowLogsEnabled", option_to_yojson generic_boolean_to_yojson x.flow_logs_enabled);
      ("FlowLogsS3Bucket", option_to_yojson generic_string_to_yojson x.flow_logs_s3_bucket);
      ("FlowLogsS3Prefix", option_to_yojson generic_string_to_yojson x.flow_logs_s3_prefix);
    ]

let update_accelerator_response_to_yojson (x : update_accelerator_response) =
  assoc_to_yojson [ ("Accelerator", option_to_yojson accelerator_to_yojson x.accelerator) ]

let update_accelerator_request_to_yojson (x : update_accelerator_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("IpAddresses", option_to_yojson ip_addresses_to_yojson x.ip_addresses);
      ("Enabled", option_to_yojson generic_boolean_to_yojson x.enabled);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let remove_endpoints_request_to_yojson (x : remove_endpoints_request) =
  assoc_to_yojson
    [
      ("EndpointIdentifiers", Some (endpoint_identifiers_to_yojson x.endpoint_identifiers));
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let remove_custom_routing_endpoints_request_to_yojson (x : remove_custom_routing_endpoints_request)
    =
  assoc_to_yojson
    [
      ("EndpointIds", Some (endpoint_ids_to_yojson x.endpoint_ids));
      ("EndpointGroupArn", Some (generic_string_to_yojson x.endpoint_group_arn));
    ]

let provision_byoip_cidr_response_to_yojson (x : provision_byoip_cidr_response) =
  assoc_to_yojson [ ("ByoipCidr", option_to_yojson byoip_cidr_to_yojson x.byoip_cidr) ]

let provision_byoip_cidr_request_to_yojson (x : provision_byoip_cidr_request) =
  assoc_to_yojson
    [
      ("Cidr", Some (generic_string_to_yojson x.cidr));
      ( "CidrAuthorizationContext",
        Some (cidr_authorization_context_to_yojson x.cidr_authorization_context) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let listeners_to_yojson tree = list_to_yojson listener_to_yojson tree

let list_listeners_response_to_yojson (x : list_listeners_response) =
  assoc_to_yojson
    [
      ("Listeners", option_to_yojson listeners_to_yojson x.listeners);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_listeners_request_to_yojson (x : list_listeners_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_endpoint_groups_response_to_yojson (x : list_endpoint_groups_response) =
  assoc_to_yojson
    [
      ("EndpointGroups", option_to_yojson endpoint_groups_to_yojson x.endpoint_groups);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_endpoint_groups_request_to_yojson (x : list_endpoint_groups_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_port_mappings_by_destination_response_to_yojson
    (x : list_custom_routing_port_mappings_by_destination_response) =
  assoc_to_yojson
    [
      ( "DestinationPortMappings",
        option_to_yojson destination_port_mappings_to_yojson x.destination_port_mappings );
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let port_mappings_max_results_to_yojson = int_to_yojson

let list_custom_routing_port_mappings_by_destination_request_to_yojson
    (x : list_custom_routing_port_mappings_by_destination_request) =
  assoc_to_yojson
    [
      ("EndpointId", Some (generic_string_to_yojson x.endpoint_id));
      ("DestinationAddress", Some (generic_string_to_yojson x.destination_address));
      ("MaxResults", option_to_yojson port_mappings_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let port_mapping_to_yojson (x : port_mapping) =
  assoc_to_yojson
    [
      ("AcceleratorPort", option_to_yojson port_number_to_yojson x.accelerator_port);
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("EndpointId", option_to_yojson generic_string_to_yojson x.endpoint_id);
      ( "DestinationSocketAddress",
        option_to_yojson socket_address_to_yojson x.destination_socket_address );
      ("Protocols", option_to_yojson custom_routing_protocols_to_yojson x.protocols);
      ( "DestinationTrafficState",
        option_to_yojson custom_routing_destination_traffic_state_to_yojson
          x.destination_traffic_state );
    ]

let port_mappings_to_yojson tree = list_to_yojson port_mapping_to_yojson tree

let list_custom_routing_port_mappings_response_to_yojson
    (x : list_custom_routing_port_mappings_response) =
  assoc_to_yojson
    [
      ("PortMappings", option_to_yojson port_mappings_to_yojson x.port_mappings);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_port_mappings_request_to_yojson
    (x : list_custom_routing_port_mappings_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("EndpointGroupArn", option_to_yojson generic_string_to_yojson x.endpoint_group_arn);
      ("MaxResults", option_to_yojson port_mappings_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_listeners_response_to_yojson (x : list_custom_routing_listeners_response) =
  assoc_to_yojson
    [
      ("Listeners", option_to_yojson custom_routing_listeners_to_yojson x.listeners);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_listeners_request_to_yojson (x : list_custom_routing_listeners_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", Some (generic_string_to_yojson x.accelerator_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_endpoint_groups_response_to_yojson
    (x : list_custom_routing_endpoint_groups_response) =
  assoc_to_yojson
    [
      ("EndpointGroups", option_to_yojson custom_routing_endpoint_groups_to_yojson x.endpoint_groups);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_endpoint_groups_request_to_yojson
    (x : list_custom_routing_endpoint_groups_request) =
  assoc_to_yojson
    [
      ("ListenerArn", Some (generic_string_to_yojson x.listener_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_accelerators_response_to_yojson
    (x : list_custom_routing_accelerators_response) =
  assoc_to_yojson
    [
      ("Accelerators", option_to_yojson custom_routing_accelerators_to_yojson x.accelerators);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_custom_routing_accelerators_request_to_yojson
    (x : list_custom_routing_accelerators_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_cross_account_resources_response_to_yojson (x : list_cross_account_resources_response) =
  assoc_to_yojson
    [
      ( "CrossAccountResources",
        option_to_yojson cross_account_resources_to_yojson x.cross_account_resources );
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_cross_account_resources_request_to_yojson (x : list_cross_account_resources_request) =
  assoc_to_yojson
    [
      ("AcceleratorArn", option_to_yojson generic_string_to_yojson x.accelerator_arn);
      ("ResourceOwnerAwsAccountId", Some (aws_account_id_to_yojson x.resource_owner_aws_account_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_cross_account_resource_accounts_response_to_yojson
    (x : list_cross_account_resource_accounts_response) =
  assoc_to_yojson
    [
      ( "ResourceOwnerAwsAccountIds",
        option_to_yojson aws_account_ids_to_yojson x.resource_owner_aws_account_ids );
    ]

let list_cross_account_resource_accounts_request_to_yojson = unit_to_yojson

let list_cross_account_attachments_response_to_yojson (x : list_cross_account_attachments_response)
    =
  assoc_to_yojson
    [
      ("CrossAccountAttachments", option_to_yojson attachments_to_yojson x.cross_account_attachments);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_cross_account_attachments_request_to_yojson (x : list_cross_account_attachments_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_byoip_cidrs_response_to_yojson (x : list_byoip_cidrs_response) =
  assoc_to_yojson
    [
      ("ByoipCidrs", option_to_yojson byoip_cidrs_to_yojson x.byoip_cidrs);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_byoip_cidrs_request_to_yojson (x : list_byoip_cidrs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_accelerators_response_to_yojson (x : list_accelerators_response) =
  assoc_to_yojson
    [
      ("Accelerators", option_to_yojson accelerators_to_yojson x.accelerators);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_accelerators_request_to_yojson (x : list_accelerators_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]
