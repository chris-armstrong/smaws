open Smaws_Lib.Json.SerializeHelpers
open Types

let xslt_template_name_for_mac_sec_to_yojson = string_to_yojson
let xslt_template_name_to_yojson = string_to_yojson
let owner_account_to_yojson = string_to_yojson
let virtual_interface_id_to_yojson = string_to_yojson
let location_code_to_yojson = string_to_yojson
let connection_id_to_yojson = string_to_yojson
let virtual_interface_type_to_yojson = string_to_yojson
let virtual_interface_name_to_yojson = string_to_yojson
let vla_n_to_yojson = int_to_yojson
let as_n_to_yojson = int_to_yojson
let long_asn_to_yojson = long_to_yojson
let bgp_auth_key_to_yojson = string_to_yojson
let amazon_address_to_yojson = string_to_yojson
let customer_address_to_yojson = string_to_yojson

let address_family_to_yojson (x : address_family) =
  match x with IPv6 -> `String "ipv6" | IPv4 -> `String "ipv4"

let virtual_interface_state_to_yojson (x : virtual_interface_state) =
  match x with
  | Unknown -> `String "unknown"
  | Rejected -> `String "rejected"
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Testing -> `String "testing"
  | Down -> `String "down"
  | Available -> `String "available"
  | Pending -> `String "pending"
  | Verifying -> `String "verifying"
  | Confirming -> `String "confirming"

let router_config_to_yojson = string_to_yojson
let mt_u_to_yojson = int_to_yojson
let jumbo_frame_capable_to_yojson = bool_to_yojson
let virtual_gateway_id_to_yojson = string_to_yojson
let direct_connect_gateway_id_to_yojson = string_to_yojson
let cid_r_to_yojson = string_to_yojson

let route_filter_prefix_to_yojson (x : route_filter_prefix) =
  assoc_to_yojson [ ("cidr", option_to_yojson cid_r_to_yojson x.cidr) ]

let route_filter_prefix_list_to_yojson tree = list_to_yojson route_filter_prefix_to_yojson tree
let bgp_peer_id_to_yojson = string_to_yojson

let bgp_peer_state_to_yojson (x : bgp_peer_state) =
  match x with
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Available -> `String "available"
  | Pending -> `String "pending"
  | Verifying -> `String "verifying"

let bgp_status_to_yojson (x : bgp_status) =
  match x with Unknown -> `String "unknown" | Down -> `String "down" | Up -> `String "up"

let aws_device_v2_to_yojson = string_to_yojson
let aws_logical_device_id_to_yojson = string_to_yojson

let bgp_peer_to_yojson (x : bgp_peer) =
  assoc_to_yojson
    [
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ("bgpStatus", option_to_yojson bgp_status_to_yojson x.bgp_status);
      ("bgpPeerState", option_to_yojson bgp_peer_state_to_yojson x.bgp_peer_state);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("bgpPeerId", option_to_yojson bgp_peer_id_to_yojson x.bgp_peer_id);
    ]

let bgp_peer_list_to_yojson tree = list_to_yojson bgp_peer_to_yojson tree
let region_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let site_link_enabled_to_yojson = bool_to_yojson
let rate_limit_to_yojson = string_to_yojson

let virtual_interface_to_yojson (x : virtual_interface) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("siteLinkEnabled", option_to_yojson site_link_enabled_to_yojson x.site_link_enabled);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ("region", option_to_yojson region_to_yojson x.region);
      ("bgpPeers", option_to_yojson bgp_peer_list_to_yojson x.bgp_peers);
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("customerRouterConfig", option_to_yojson router_config_to_yojson x.customer_router_config);
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ( "virtualInterfaceType",
        option_to_yojson virtual_interface_type_to_yojson x.virtual_interface_type );
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
    ]

let virtual_interface_list_to_yojson tree = list_to_yojson virtual_interface_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let virtual_interfaces_to_yojson (x : virtual_interfaces) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("virtualInterfaces", option_to_yojson virtual_interface_list_to_yojson x.virtual_interfaces);
    ]

let test_id_to_yojson = string_to_yojson
let bgp_peer_id_list_to_yojson tree = list_to_yojson bgp_peer_id_to_yojson tree
let failure_test_history_status_to_yojson = string_to_yojson
let test_duration_to_yojson = int_to_yojson
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let end_time_to_yojson = timestamp_epoch_seconds_to_yojson

let virtual_interface_test_history_to_yojson (x : virtual_interface_test_history) =
  assoc_to_yojson
    [
      ("endTime", option_to_yojson end_time_to_yojson x.end_time);
      ("startTime", option_to_yojson start_time_to_yojson x.start_time);
      ("testDurationInMinutes", option_to_yojson test_duration_to_yojson x.test_duration_in_minutes);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("status", option_to_yojson failure_test_history_status_to_yojson x.status);
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("testId", option_to_yojson test_id_to_yojson x.test_id);
    ]

let virtual_interface_test_history_list_to_yojson tree =
  list_to_yojson virtual_interface_test_history_to_yojson tree

let virtual_interface_region_to_yojson = string_to_yojson
let virtual_gateway_state_to_yojson = string_to_yojson

let virtual_gateway_to_yojson (x : virtual_gateway) =
  assoc_to_yojson
    [
      ( "virtualGatewayState",
        option_to_yojson virtual_gateway_state_to_yojson x.virtual_gateway_state );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
    ]

let virtual_gateway_list_to_yojson tree = list_to_yojson virtual_gateway_to_yojson tree

let virtual_gateways_to_yojson (x : virtual_gateways) =
  assoc_to_yojson
    [ ("virtualGateways", option_to_yojson virtual_gateway_list_to_yojson x.virtual_gateways) ]

let virtual_gateway_region_to_yojson = string_to_yojson
let vendor_to_yojson = string_to_yojson
let enable_site_link_to_yojson = bool_to_yojson

let update_virtual_interface_attributes_request_to_yojson
    (x : update_virtual_interface_attributes_request) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let error_message_to_yojson = string_to_yojson

let direct_connect_server_exception_to_yojson (x : direct_connect_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let direct_connect_client_exception_to_yojson (x : direct_connect_client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let lag_id_to_yojson = string_to_yojson
let lag_name_to_yojson = string_to_yojson
let count_to_yojson = int_to_yojson
let encryption_mode_to_yojson = string_to_yojson

let update_lag_request_to_yojson (x : update_lag_request) =
  assoc_to_yojson
    [
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("minimumLinks", option_to_yojson count_to_yojson x.minimum_links);
      ("lagName", option_to_yojson lag_name_to_yojson x.lag_name);
      ("lagId", Some (lag_id_to_yojson x.lag_id));
    ]

let bandwidth_to_yojson = string_to_yojson

let lag_state_to_yojson (x : lag_state) =
  match x with
  | Unknown -> `String "unknown"
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Down -> `String "down"
  | Available -> `String "available"
  | Pending -> `String "pending"
  | Requested -> `String "requested"

let aws_device_to_yojson = string_to_yojson
let connection_name_to_yojson = string_to_yojson

let connection_state_to_yojson (x : connection_state) =
  match x with
  | Unknown -> `String "unknown"
  | Rejected -> `String "rejected"
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Down -> `String "down"
  | Available -> `String "available"
  | Pending -> `String "pending"
  | Requested -> `String "requested"
  | Ordering -> `String "ordering"

let partner_name_to_yojson = string_to_yojson
let loa_issue_time_to_yojson = timestamp_epoch_seconds_to_yojson

let has_logical_redundancy_to_yojson (x : has_logical_redundancy) =
  match x with No -> `String "no" | Yes -> `String "yes" | Unknown -> `String "unknown"

let provider_name_to_yojson = string_to_yojson
let mac_sec_capable_to_yojson = bool_to_yojson
let port_encryption_status_to_yojson = string_to_yojson
let secret_ar_n_to_yojson = string_to_yojson
let ckn_to_yojson = string_to_yojson
let state_to_yojson = string_to_yojson
let start_on_date_to_yojson = string_to_yojson

let mac_sec_key_to_yojson (x : mac_sec_key) =
  assoc_to_yojson
    [
      ("startOn", option_to_yojson start_on_date_to_yojson x.start_on);
      ("state", option_to_yojson state_to_yojson x.state);
      ("ckn", option_to_yojson ckn_to_yojson x.ckn);
      ("secretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
    ]

let mac_sec_key_list_to_yojson tree = list_to_yojson mac_sec_key_to_yojson tree

let rate_limiter_status_to_yojson (x : rate_limiter_status) =
  assoc_to_yojson
    [
      ("totalBandwidth", option_to_yojson bandwidth_to_yojson x.total_bandwidth);
      ("remaining", option_to_yojson count_to_yojson x.remaining);
      ("inUse", option_to_yojson count_to_yojson x.in_use);
      ("maxAllowed", option_to_yojson count_to_yojson x.max_allowed);
    ]

let partner_interconnect_mac_sec_capable_to_yojson = bool_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ( "partnerInterconnectMacSecCapable",
        option_to_yojson partner_interconnect_mac_sec_capable_to_yojson
          x.partner_interconnect_mac_sec_capable );
      ("rateLimiterStatus", option_to_yojson rate_limiter_status_to_yojson x.rate_limiter_status);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ( "portEncryptionStatus",
        option_to_yojson port_encryption_status_to_yojson x.port_encryption_status );
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("loaIssueTime", option_to_yojson loa_issue_time_to_yojson x.loa_issue_time);
      ("partnerName", option_to_yojson partner_name_to_yojson x.partner_name);
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ("bandwidth", option_to_yojson bandwidth_to_yojson x.bandwidth);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("region", option_to_yojson region_to_yojson x.region);
      ("connectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("connectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree
let boolean_flag_to_yojson = bool_to_yojson

let lag_to_yojson (x : lag) =
  assoc_to_yojson
    [
      ("rateLimiterStatus", option_to_yojson rate_limiter_status_to_yojson x.rate_limiter_status);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ( "allowsHostedConnections",
        option_to_yojson boolean_flag_to_yojson x.allows_hosted_connections );
      ("connections", option_to_yojson connection_list_to_yojson x.connections);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("minimumLinks", option_to_yojson count_to_yojson x.minimum_links);
      ("region", option_to_yojson region_to_yojson x.region);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("lagState", option_to_yojson lag_state_to_yojson x.lag_state);
      ("lagName", option_to_yojson lag_name_to_yojson x.lag_name);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("numberOfConnections", option_to_yojson count_to_yojson x.number_of_connections);
      ("connectionsBandwidth", option_to_yojson bandwidth_to_yojson x.connections_bandwidth);
    ]

let direct_connect_gateway_name_to_yojson = string_to_yojson

let direct_connect_gateway_state_to_yojson (x : direct_connect_gateway_state) =
  match x with
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Available -> `String "available"
  | Pending -> `String "pending"

let state_change_error_to_yojson = string_to_yojson

let direct_connect_gateway_to_yojson (x : direct_connect_gateway) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
      ( "directConnectGatewayState",
        option_to_yojson direct_connect_gateway_state_to_yojson x.direct_connect_gateway_state );
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
      ( "directConnectGatewayName",
        option_to_yojson direct_connect_gateway_name_to_yojson x.direct_connect_gateway_name );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let update_direct_connect_gateway_response_to_yojson (x : update_direct_connect_gateway_response) =
  assoc_to_yojson
    [
      ( "directConnectGateway",
        option_to_yojson direct_connect_gateway_to_yojson x.direct_connect_gateway );
    ]

let update_direct_connect_gateway_request_to_yojson (x : update_direct_connect_gateway_request) =
  assoc_to_yojson
    [
      ( "newDirectConnectGatewayName",
        Some (direct_connect_gateway_name_to_yojson x.new_direct_connect_gateway_name) );
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]

let direct_connect_gateway_association_state_to_yojson
    (x : direct_connect_gateway_association_state) =
  match x with
  | Updating -> `String "updating"
  | Disassociated -> `String "disassociated"
  | Disassociating -> `String "disassociating"
  | Associated -> `String "associated"
  | Associating -> `String "associating"

let gateway_identifier_to_yojson = string_to_yojson

let gateway_type_to_yojson (x : gateway_type) =
  match x with
  | TransitGateway -> `String "transitGateway"
  | VirtualPrivateGateway -> `String "virtualPrivateGateway"

let associated_gateway_to_yojson (x : associated_gateway) =
  assoc_to_yojson
    [
      ("region", option_to_yojson region_to_yojson x.region);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("type", option_to_yojson gateway_type_to_yojson x.type_);
      ("id", option_to_yojson gateway_identifier_to_yojson x.id);
    ]

let direct_connect_gateway_association_id_to_yojson = string_to_yojson
let core_network_identifier_to_yojson = string_to_yojson
let core_network_attachment_id_to_yojson = string_to_yojson

let associated_core_network_to_yojson (x : associated_core_network) =
  assoc_to_yojson
    [
      ("attachmentId", option_to_yojson core_network_attachment_id_to_yojson x.attachment_id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("id", option_to_yojson core_network_identifier_to_yojson x.id);
    ]

let direct_connect_gateway_association_to_yojson (x : direct_connect_gateway_association) =
  assoc_to_yojson
    [
      ( "virtualGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.virtual_gateway_owner_account );
      ( "virtualGatewayRegion",
        option_to_yojson virtual_gateway_region_to_yojson x.virtual_gateway_region );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "associatedCoreNetwork",
        option_to_yojson associated_core_network_to_yojson x.associated_core_network );
      ( "allowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.allowed_prefixes_to_direct_connect_gateway );
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
      ("associatedGateway", option_to_yojson associated_gateway_to_yojson x.associated_gateway);
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
      ( "associationState",
        option_to_yojson direct_connect_gateway_association_state_to_yojson x.association_state );
      ( "directConnectGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.direct_connect_gateway_owner_account );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let update_direct_connect_gateway_association_result_to_yojson
    (x : update_direct_connect_gateway_association_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let update_direct_connect_gateway_association_request_to_yojson
    (x : update_direct_connect_gateway_association_request) =
  assoc_to_yojson
    [
      ( "removeAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.remove_allowed_prefixes_to_direct_connect_gateway );
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
    ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("connectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let duplicate_tag_keys_exception_to_yojson (x : duplicate_tag_keys_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let stop_bgp_failover_test_response_to_yojson (x : stop_bgp_failover_test_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceTest",
        option_to_yojson virtual_interface_test_history_to_yojson x.virtual_interface_test );
    ]

let stop_bgp_failover_test_request_to_yojson (x : stop_bgp_failover_test_request) =
  assoc_to_yojson
    [ ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id)) ]

let status_to_yojson = string_to_yojson

let start_bgp_failover_test_response_to_yojson (x : start_bgp_failover_test_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceTest",
        option_to_yojson virtual_interface_test_history_to_yojson x.virtual_interface_test );
    ]

let start_bgp_failover_test_request_to_yojson (x : start_bgp_failover_test_request) =
  assoc_to_yojson
    [
      ("testDurationInMinutes", option_to_yojson test_duration_to_yojson x.test_duration_in_minutes);
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let software_to_yojson = string_to_yojson
let router_type_identifier_to_yojson = string_to_yojson
let platform_to_yojson = string_to_yojson

let router_type_to_yojson (x : router_type) =
  assoc_to_yojson
    [
      ( "routerTypeIdentifier",
        option_to_yojson router_type_identifier_to_yojson x.router_type_identifier );
      ( "xsltTemplateNameForMacSec",
        option_to_yojson xslt_template_name_for_mac_sec_to_yojson x.xslt_template_name_for_mac_sec
      );
      ("xsltTemplateName", option_to_yojson xslt_template_name_to_yojson x.xslt_template_name);
      ("software", option_to_yojson software_to_yojson x.software);
      ("platform", option_to_yojson platform_to_yojson x.platform);
      ("vendor", option_to_yojson vendor_to_yojson x.vendor);
    ]

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree
let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree
let request_mac_sec_to_yojson = bool_to_yojson
let provider_list_to_yojson tree = list_to_yojson provider_name_to_yojson tree
let port_speed_to_yojson = string_to_yojson

let list_virtual_interface_test_history_response_to_yojson
    (x : list_virtual_interface_test_history_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "virtualInterfaceTestHistory",
        option_to_yojson virtual_interface_test_history_list_to_yojson
          x.virtual_interface_test_history );
    ]

let max_result_set_size_to_yojson = int_to_yojson

let list_virtual_interface_test_history_request_to_yojson
    (x : list_virtual_interface_test_history_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("status", option_to_yojson failure_test_history_status_to_yojson x.status);
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("testId", option_to_yojson test_id_to_yojson x.test_id);
    ]

let disassociate_mac_sec_key_response_to_yojson (x : disassociate_mac_sec_key_response) =
  assoc_to_yojson
    [
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
    ]

let disassociate_mac_sec_key_request_to_yojson (x : disassociate_mac_sec_key_request) =
  assoc_to_yojson
    [
      ("secretARN", Some (secret_ar_n_to_yojson x.secret_ar_n));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let disassociate_connection_from_lag_request_to_yojson
    (x : disassociate_connection_from_lag_request) =
  assoc_to_yojson
    [
      ("lagId", Some (lag_id_to_yojson x.lag_id));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let describe_virtual_interfaces_request_to_yojson (x : describe_virtual_interfaces_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
    ]

let describe_tags_response_to_yojson (x : describe_tags_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson [ ("resourceArns", Some (resource_arn_list_to_yojson x.resource_arns)) ]

let describe_router_configuration_response_to_yojson (x : describe_router_configuration_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("router", option_to_yojson router_type_to_yojson x.router);
      ("customerRouterConfig", option_to_yojson router_config_to_yojson x.customer_router_config);
    ]

let describe_router_configuration_request_to_yojson (x : describe_router_configuration_request) =
  assoc_to_yojson
    [
      ( "routerTypeIdentifier",
        option_to_yojson router_type_identifier_to_yojson x.router_type_identifier );
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let location_name_to_yojson = string_to_yojson
let available_port_speeds_to_yojson tree = list_to_yojson port_speed_to_yojson tree
let available_mac_sec_port_speeds_to_yojson tree = list_to_yojson port_speed_to_yojson tree

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ( "availableMacSecPortSpeeds",
        option_to_yojson available_mac_sec_port_speeds_to_yojson x.available_mac_sec_port_speeds );
      ("availableProviders", option_to_yojson provider_list_to_yojson x.available_providers);
      ( "availablePortSpeeds",
        option_to_yojson available_port_speeds_to_yojson x.available_port_speeds );
      ("region", option_to_yojson region_to_yojson x.region);
      ("locationName", option_to_yojson location_name_to_yojson x.location_name);
      ("locationCode", option_to_yojson location_code_to_yojson x.location_code);
    ]

let location_list_to_yojson tree = list_to_yojson location_to_yojson tree

let locations_to_yojson (x : locations) =
  assoc_to_yojson [ ("locations", option_to_yojson location_list_to_yojson x.locations) ]

let loa_content_to_yojson = blob_to_yojson

let loa_content_type_to_yojson (x : loa_content_type) =
  match x with PDF -> `String "application/pdf"

let loa_to_yojson (x : loa) =
  assoc_to_yojson
    [
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
      ("loaContent", option_to_yojson loa_content_to_yojson x.loa_content);
    ]

let describe_loa_request_to_yojson (x : describe_loa_request) =
  assoc_to_yojson
    [
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let lag_list_to_yojson tree = list_to_yojson lag_to_yojson tree

let lags_to_yojson (x : lags) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("lags", option_to_yojson lag_list_to_yojson x.lags);
    ]

let describe_lags_request_to_yojson (x : describe_lags_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
    ]

let interconnect_id_to_yojson = string_to_yojson
let interconnect_name_to_yojson = string_to_yojson

let interconnect_state_to_yojson (x : interconnect_state) =
  match x with
  | Unknown -> `String "unknown"
  | Deleted -> `String "deleted"
  | Deleting -> `String "deleting"
  | Down -> `String "down"
  | Available -> `String "available"
  | Pending -> `String "pending"
  | Requested -> `String "requested"

let interconnect_to_yojson (x : interconnect) =
  assoc_to_yojson
    [
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ( "portEncryptionStatus",
        option_to_yojson port_encryption_status_to_yojson x.port_encryption_status );
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("loaIssueTime", option_to_yojson loa_issue_time_to_yojson x.loa_issue_time);
      ("bandwidth", option_to_yojson bandwidth_to_yojson x.bandwidth);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("region", option_to_yojson region_to_yojson x.region);
      ("interconnectState", option_to_yojson interconnect_state_to_yojson x.interconnect_state);
      ("interconnectName", option_to_yojson interconnect_name_to_yojson x.interconnect_name);
      ("interconnectId", option_to_yojson interconnect_id_to_yojson x.interconnect_id);
    ]

let interconnect_list_to_yojson tree = list_to_yojson interconnect_to_yojson tree

let interconnects_to_yojson (x : interconnects) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("interconnects", option_to_yojson interconnect_list_to_yojson x.interconnects);
    ]

let describe_interconnects_request_to_yojson (x : describe_interconnects_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("interconnectId", option_to_yojson interconnect_id_to_yojson x.interconnect_id);
    ]

let describe_interconnect_loa_response_to_yojson (x : describe_interconnect_loa_response) =
  assoc_to_yojson [ ("loa", option_to_yojson loa_to_yojson x.loa) ]

let describe_interconnect_loa_request_to_yojson (x : describe_interconnect_loa_request) =
  assoc_to_yojson
    [
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id));
    ]

let connections_to_yojson (x : connections) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("connections", option_to_yojson connection_list_to_yojson x.connections);
    ]

let describe_hosted_connections_request_to_yojson (x : describe_hosted_connections_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let direct_connect_gateway_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_to_yojson tree

let describe_direct_connect_gateways_result_to_yojson (x : describe_direct_connect_gateways_result)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "directConnectGateways",
        option_to_yojson direct_connect_gateway_list_to_yojson x.direct_connect_gateways );
    ]

let describe_direct_connect_gateways_request_to_yojson
    (x : describe_direct_connect_gateways_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let direct_connect_gateway_attachment_state_to_yojson (x : direct_connect_gateway_attachment_state)
    =
  match x with
  | Detached -> `String "detached"
  | Detaching -> `String "detaching"
  | Attached -> `String "attached"
  | Attaching -> `String "attaching"

let direct_connect_gateway_attachment_type_to_yojson (x : direct_connect_gateway_attachment_type) =
  match x with
  | PrivateVirtualInterface -> `String "PrivateVirtualInterface"
  | TransitVirtualInterface -> `String "TransitVirtualInterface"

let direct_connect_gateway_attachment_to_yojson (x : direct_connect_gateway_attachment) =
  assoc_to_yojson
    [
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
      ( "attachmentType",
        option_to_yojson direct_connect_gateway_attachment_type_to_yojson x.attachment_type );
      ( "attachmentState",
        option_to_yojson direct_connect_gateway_attachment_state_to_yojson x.attachment_state );
      ( "virtualInterfaceOwnerAccount",
        option_to_yojson owner_account_to_yojson x.virtual_interface_owner_account );
      ( "virtualInterfaceRegion",
        option_to_yojson virtual_interface_region_to_yojson x.virtual_interface_region );
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let direct_connect_gateway_attachment_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_attachment_to_yojson tree

let describe_direct_connect_gateway_attachments_result_to_yojson
    (x : describe_direct_connect_gateway_attachments_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "directConnectGatewayAttachments",
        option_to_yojson direct_connect_gateway_attachment_list_to_yojson
          x.direct_connect_gateway_attachments );
    ]

let describe_direct_connect_gateway_attachments_request_to_yojson
    (x : describe_direct_connect_gateway_attachments_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let direct_connect_gateway_association_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_association_to_yojson tree

let describe_direct_connect_gateway_associations_result_to_yojson
    (x : describe_direct_connect_gateway_associations_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "directConnectGatewayAssociations",
        option_to_yojson direct_connect_gateway_association_list_to_yojson
          x.direct_connect_gateway_associations );
    ]

let associated_gateway_id_to_yojson = string_to_yojson

let describe_direct_connect_gateway_associations_request_to_yojson
    (x : describe_direct_connect_gateway_associations_request) =
  assoc_to_yojson
    [
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "associatedGatewayId",
        option_to_yojson associated_gateway_id_to_yojson x.associated_gateway_id );
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
    ]

let direct_connect_gateway_association_proposal_id_to_yojson = string_to_yojson

let direct_connect_gateway_association_proposal_state_to_yojson
    (x : direct_connect_gateway_association_proposal_state) =
  match x with
  | Deleted -> `String "deleted"
  | Accepted -> `String "accepted"
  | Requested -> `String "requested"

let direct_connect_gateway_association_proposal_to_yojson
    (x : direct_connect_gateway_association_proposal) =
  assoc_to_yojson
    [
      ( "requestedAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.requested_allowed_prefixes_to_direct_connect_gateway );
      ( "existingAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.existing_allowed_prefixes_to_direct_connect_gateway );
      ("associatedGateway", option_to_yojson associated_gateway_to_yojson x.associated_gateway);
      ( "proposalState",
        option_to_yojson direct_connect_gateway_association_proposal_state_to_yojson
          x.proposal_state );
      ( "directConnectGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.direct_connect_gateway_owner_account );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "proposalId",
        option_to_yojson direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id );
    ]

let direct_connect_gateway_association_proposal_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_association_proposal_to_yojson tree

let describe_direct_connect_gateway_association_proposals_result_to_yojson
    (x : describe_direct_connect_gateway_association_proposals_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "directConnectGatewayAssociationProposals",
        option_to_yojson direct_connect_gateway_association_proposal_list_to_yojson
          x.direct_connect_gateway_association_proposals );
    ]

let describe_direct_connect_gateway_association_proposals_request_to_yojson
    (x : describe_direct_connect_gateway_association_proposals_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ( "associatedGatewayId",
        option_to_yojson associated_gateway_id_to_yojson x.associated_gateway_id );
      ( "proposalId",
        option_to_yojson direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
    ]

let agreement_name_to_yojson = string_to_yojson

let customer_agreement_to_yojson (x : customer_agreement) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("agreementName", option_to_yojson agreement_name_to_yojson x.agreement_name);
    ]

let agreement_list_to_yojson tree = list_to_yojson customer_agreement_to_yojson tree

let nni_partner_type_to_yojson (x : nni_partner_type) =
  match x with NonPartner -> `String "nonPartner" | V2 -> `String "v2" | V1 -> `String "v1"

let describe_customer_metadata_response_to_yojson (x : describe_customer_metadata_response) =
  assoc_to_yojson
    [
      ("nniPartnerType", option_to_yojson nni_partner_type_to_yojson x.nni_partner_type);
      ("agreements", option_to_yojson agreement_list_to_yojson x.agreements);
    ]

let describe_connections_on_interconnect_request_to_yojson
    (x : describe_connections_on_interconnect_request) =
  assoc_to_yojson [ ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id)) ]

let describe_connections_request_to_yojson (x : describe_connections_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
    ]

let describe_connection_loa_response_to_yojson (x : describe_connection_loa_response) =
  assoc_to_yojson [ ("loa", option_to_yojson loa_to_yojson x.loa) ]

let describe_connection_loa_request_to_yojson (x : describe_connection_loa_request) =
  assoc_to_yojson
    [
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let delete_virtual_interface_response_to_yojson (x : delete_virtual_interface_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
    ]

let delete_virtual_interface_request_to_yojson (x : delete_virtual_interface_request) =
  assoc_to_yojson
    [ ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id)) ]

let delete_lag_request_to_yojson (x : delete_lag_request) =
  assoc_to_yojson [ ("lagId", Some (lag_id_to_yojson x.lag_id)) ]

let delete_interconnect_response_to_yojson (x : delete_interconnect_response) =
  assoc_to_yojson
    [ ("interconnectState", option_to_yojson interconnect_state_to_yojson x.interconnect_state) ]

let delete_interconnect_request_to_yojson (x : delete_interconnect_request) =
  assoc_to_yojson [ ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id)) ]

let delete_direct_connect_gateway_association_proposal_result_to_yojson
    (x : delete_direct_connect_gateway_association_proposal_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociationProposal",
        option_to_yojson direct_connect_gateway_association_proposal_to_yojson
          x.direct_connect_gateway_association_proposal );
    ]

let delete_direct_connect_gateway_association_proposal_request_to_yojson
    (x : delete_direct_connect_gateway_association_proposal_request) =
  assoc_to_yojson
    [
      ("proposalId", Some (direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id));
    ]

let delete_direct_connect_gateway_association_result_to_yojson
    (x : delete_direct_connect_gateway_association_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let delete_direct_connect_gateway_association_request_to_yojson
    (x : delete_direct_connect_gateway_association_request) =
  assoc_to_yojson
    [
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
    ]

let delete_direct_connect_gateway_result_to_yojson (x : delete_direct_connect_gateway_result) =
  assoc_to_yojson
    [
      ( "directConnectGateway",
        option_to_yojson direct_connect_gateway_to_yojson x.direct_connect_gateway );
    ]

let delete_direct_connect_gateway_request_to_yojson (x : delete_direct_connect_gateway_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson [ ("connectionId", Some (connection_id_to_yojson x.connection_id)) ]

let delete_bgp_peer_response_to_yojson (x : delete_bgp_peer_response) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let delete_bgp_peer_request_to_yojson (x : delete_bgp_peer_request) =
  assoc_to_yojson
    [
      ("bgpPeerId", option_to_yojson bgp_peer_id_to_yojson x.bgp_peer_id);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_transit_virtual_interface_result_to_yojson (x : create_transit_virtual_interface_result)
    =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_transit_virtual_interface_to_yojson (x : new_transit_virtual_interface) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
    ]

let create_transit_virtual_interface_request_to_yojson
    (x : create_transit_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "newTransitVirtualInterface",
        Some (new_transit_virtual_interface_to_yojson x.new_transit_virtual_interface) );
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let new_public_virtual_interface_to_yojson (x : new_public_virtual_interface) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
    ]

let create_public_virtual_interface_request_to_yojson (x : create_public_virtual_interface_request)
    =
  assoc_to_yojson
    [
      ( "newPublicVirtualInterface",
        Some (new_public_virtual_interface_to_yojson x.new_public_virtual_interface) );
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let new_private_virtual_interface_to_yojson (x : new_private_virtual_interface) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
    ]

let create_private_virtual_interface_request_to_yojson
    (x : create_private_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "newPrivateVirtualInterface",
        Some (new_private_virtual_interface_to_yojson x.new_private_virtual_interface) );
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let create_lag_request_to_yojson (x : create_lag_request) =
  assoc_to_yojson
    [
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("childConnectionTags", option_to_yojson tag_list_to_yojson x.child_connection_tags);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("lagName", Some (lag_name_to_yojson x.lag_name));
      ("connectionsBandwidth", Some (bandwidth_to_yojson x.connections_bandwidth));
      ("location", Some (location_code_to_yojson x.location));
      ("numberOfConnections", Some (count_to_yojson x.number_of_connections));
    ]

let create_interconnect_request_to_yojson (x : create_interconnect_request) =
  assoc_to_yojson
    [
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("location", Some (location_code_to_yojson x.location));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("interconnectName", Some (interconnect_name_to_yojson x.interconnect_name));
    ]

let create_direct_connect_gateway_association_proposal_result_to_yojson
    (x : create_direct_connect_gateway_association_proposal_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociationProposal",
        option_to_yojson direct_connect_gateway_association_proposal_to_yojson
          x.direct_connect_gateway_association_proposal );
    ]

let gateway_id_to_associate_to_yojson = string_to_yojson

let create_direct_connect_gateway_association_proposal_request_to_yojson
    (x : create_direct_connect_gateway_association_proposal_request) =
  assoc_to_yojson
    [
      ( "removeAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.remove_allowed_prefixes_to_direct_connect_gateway );
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ("gatewayId", Some (gateway_id_to_associate_to_yojson x.gateway_id));
      ( "directConnectGatewayOwnerAccount",
        Some (owner_account_to_yojson x.direct_connect_gateway_owner_account) );
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]

let create_direct_connect_gateway_association_result_to_yojson
    (x : create_direct_connect_gateway_association_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let create_direct_connect_gateway_association_request_to_yojson
    (x : create_direct_connect_gateway_association_request) =
  assoc_to_yojson
    [
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ("gatewayId", option_to_yojson gateway_id_to_associate_to_yojson x.gateway_id);
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]

let create_direct_connect_gateway_result_to_yojson (x : create_direct_connect_gateway_result) =
  assoc_to_yojson
    [
      ( "directConnectGateway",
        option_to_yojson direct_connect_gateway_to_yojson x.direct_connect_gateway );
    ]

let create_direct_connect_gateway_request_to_yojson (x : create_direct_connect_gateway_request) =
  assoc_to_yojson
    [
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "directConnectGatewayName",
        Some (direct_connect_gateway_name_to_yojson x.direct_connect_gateway_name) );
    ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("location", Some (location_code_to_yojson x.location));
    ]

let create_bgp_peer_response_to_yojson (x : create_bgp_peer_response) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_bgp_peer_to_yojson (x : new_bgp_peer) =
  assoc_to_yojson
    [
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
    ]

let create_bgp_peer_request_to_yojson (x : create_bgp_peer_request) =
  assoc_to_yojson
    [
      ("newBGPPeer", option_to_yojson new_bgp_peer_to_yojson x.new_bgp_peer);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
    ]

let confirm_transit_virtual_interface_response_to_yojson
    (x : confirm_transit_virtual_interface_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
    ]

let confirm_transit_virtual_interface_request_to_yojson
    (x : confirm_transit_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let confirm_public_virtual_interface_response_to_yojson
    (x : confirm_public_virtual_interface_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
    ]

let confirm_public_virtual_interface_request_to_yojson
    (x : confirm_public_virtual_interface_request) =
  assoc_to_yojson
    [ ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id)) ]

let confirm_private_virtual_interface_response_to_yojson
    (x : confirm_private_virtual_interface_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
    ]

let confirm_private_virtual_interface_request_to_yojson
    (x : confirm_private_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let confirm_customer_agreement_response_to_yojson (x : confirm_customer_agreement_response) =
  assoc_to_yojson [ ("status", option_to_yojson status_to_yojson x.status) ]

let confirm_customer_agreement_request_to_yojson (x : confirm_customer_agreement_request) =
  assoc_to_yojson [ ("agreementName", option_to_yojson agreement_name_to_yojson x.agreement_name) ]

let confirm_connection_response_to_yojson (x : confirm_connection_response) =
  assoc_to_yojson
    [ ("connectionState", option_to_yojson connection_state_to_yojson x.connection_state) ]

let confirm_connection_request_to_yojson (x : confirm_connection_request) =
  assoc_to_yojson [ ("connectionId", Some (connection_id_to_yojson x.connection_id)) ]

let associate_virtual_interface_request_to_yojson (x : associate_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
    ]

let associate_mac_sec_key_response_to_yojson (x : associate_mac_sec_key_response) =
  assoc_to_yojson
    [
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
    ]

let cak_to_yojson = string_to_yojson

let associate_mac_sec_key_request_to_yojson (x : associate_mac_sec_key_request) =
  assoc_to_yojson
    [
      ("cak", option_to_yojson cak_to_yojson x.cak);
      ("ckn", option_to_yojson ckn_to_yojson x.ckn);
      ("secretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let associate_hosted_connection_request_to_yojson (x : associate_hosted_connection_request) =
  assoc_to_yojson
    [
      ("parentConnectionId", Some (connection_id_to_yojson x.parent_connection_id));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let associate_connection_with_lag_request_to_yojson (x : associate_connection_with_lag_request) =
  assoc_to_yojson
    [
      ("lagId", Some (lag_id_to_yojson x.lag_id));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let allocate_transit_virtual_interface_result_to_yojson
    (x : allocate_transit_virtual_interface_result) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_transit_virtual_interface_allocation_to_yojson
    (x : new_transit_virtual_interface_allocation) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
    ]

let allocate_transit_virtual_interface_request_to_yojson
    (x : allocate_transit_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "newTransitVirtualInterfaceAllocation",
        Some
          (new_transit_virtual_interface_allocation_to_yojson
             x.new_transit_virtual_interface_allocation) );
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let new_public_virtual_interface_allocation_to_yojson (x : new_public_virtual_interface_allocation)
    =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
    ]

let allocate_public_virtual_interface_request_to_yojson
    (x : allocate_public_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "newPublicVirtualInterfaceAllocation",
        Some
          (new_public_virtual_interface_allocation_to_yojson
             x.new_public_virtual_interface_allocation) );
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let new_private_virtual_interface_allocation_to_yojson
    (x : new_private_virtual_interface_allocation) =
  assoc_to_yojson
    [
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
    ]

let allocate_private_virtual_interface_request_to_yojson
    (x : allocate_private_virtual_interface_request) =
  assoc_to_yojson
    [
      ( "newPrivateVirtualInterfaceAllocation",
        Some
          (new_private_virtual_interface_allocation_to_yojson
             x.new_private_virtual_interface_allocation) );
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let allocate_hosted_connection_request_to_yojson (x : allocate_hosted_connection_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let allocate_connection_on_interconnect_request_to_yojson
    (x : allocate_connection_on_interconnect_request) =
  assoc_to_yojson
    [
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
    ]

let accept_direct_connect_gateway_association_proposal_result_to_yojson
    (x : accept_direct_connect_gateway_association_proposal_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let accept_direct_connect_gateway_association_proposal_request_to_yojson
    (x : accept_direct_connect_gateway_association_proposal_request) =
  assoc_to_yojson
    [
      ( "overrideAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.override_allowed_prefixes_to_direct_connect_gateway );
      ( "associatedGatewayOwnerAccount",
        Some (owner_account_to_yojson x.associated_gateway_owner_account) );
      ("proposalId", Some (direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id));
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]
