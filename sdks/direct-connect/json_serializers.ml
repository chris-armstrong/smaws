open Smaws_Lib.Json.SerializeHelpers
open Types

let as_n_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson

let direct_connect_server_exception_to_yojson (x : direct_connect_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let direct_connect_client_exception_to_yojson (x : direct_connect_client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let owner_account_to_yojson = string_to_yojson
let virtual_gateway_region_to_yojson = string_to_yojson
let virtual_gateway_id_to_yojson = string_to_yojson
let core_network_attachment_id_to_yojson = string_to_yojson
let core_network_identifier_to_yojson = string_to_yojson

let associated_core_network_to_yojson (x : associated_core_network) =
  assoc_to_yojson
    [
      ("id", option_to_yojson core_network_identifier_to_yojson x.id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("attachmentId", option_to_yojson core_network_attachment_id_to_yojson x.attachment_id);
    ]

let cid_r_to_yojson = string_to_yojson

let route_filter_prefix_to_yojson (x : route_filter_prefix) =
  assoc_to_yojson [ ("cidr", option_to_yojson cid_r_to_yojson x.cidr) ]

let route_filter_prefix_list_to_yojson tree = list_to_yojson route_filter_prefix_to_yojson tree
let direct_connect_gateway_association_id_to_yojson = string_to_yojson
let region_to_yojson = string_to_yojson

let gateway_type_to_yojson (x : gateway_type) =
  match x with
  | VirtualPrivateGateway -> `String "virtualPrivateGateway"
  | TransitGateway -> `String "transitGateway"

let gateway_identifier_to_yojson = string_to_yojson

let associated_gateway_to_yojson (x : associated_gateway) =
  assoc_to_yojson
    [
      ("id", option_to_yojson gateway_identifier_to_yojson x.id);
      ("type", option_to_yojson gateway_type_to_yojson x.type_);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("region", option_to_yojson region_to_yojson x.region);
    ]

let state_change_error_to_yojson = string_to_yojson

let direct_connect_gateway_association_state_to_yojson
    (x : direct_connect_gateway_association_state) =
  match x with
  | Associating -> `String "associating"
  | Associated -> `String "associated"
  | Disassociating -> `String "disassociating"
  | Disassociated -> `String "disassociated"
  | Updating -> `String "updating"

let direct_connect_gateway_id_to_yojson = string_to_yojson

let direct_connect_gateway_association_to_yojson (x : direct_connect_gateway_association) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "directConnectGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.direct_connect_gateway_owner_account );
      ( "associationState",
        option_to_yojson direct_connect_gateway_association_state_to_yojson x.association_state );
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
      ("associatedGateway", option_to_yojson associated_gateway_to_yojson x.associated_gateway);
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
      ( "allowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.allowed_prefixes_to_direct_connect_gateway );
      ( "associatedCoreNetwork",
        option_to_yojson associated_core_network_to_yojson x.associated_core_network );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "virtualGatewayRegion",
        option_to_yojson virtual_gateway_region_to_yojson x.virtual_gateway_region );
      ( "virtualGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.virtual_gateway_owner_account );
    ]

let accept_direct_connect_gateway_association_proposal_result_to_yojson
    (x : accept_direct_connect_gateway_association_proposal_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let direct_connect_gateway_association_proposal_id_to_yojson = string_to_yojson

let accept_direct_connect_gateway_association_proposal_request_to_yojson
    (x : accept_direct_connect_gateway_association_proposal_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
      ("proposalId", Some (direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id));
      ( "associatedGatewayOwnerAccount",
        Some (owner_account_to_yojson x.associated_gateway_owner_account) );
      ( "overrideAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.override_allowed_prefixes_to_direct_connect_gateway );
    ]

let address_family_to_yojson (x : address_family) =
  match x with IPv4 -> `String "ipv4" | IPv6 -> `String "ipv6"

let status_to_yojson = string_to_yojson
let agreement_name_to_yojson = string_to_yojson

let customer_agreement_to_yojson (x : customer_agreement) =
  assoc_to_yojson
    [
      ("agreementName", option_to_yojson agreement_name_to_yojson x.agreement_name);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let agreement_list_to_yojson tree = list_to_yojson customer_agreement_to_yojson tree
let partner_interconnect_mac_sec_capable_to_yojson = bool_to_yojson
let bandwidth_to_yojson = string_to_yojson
let count_to_yojson = int_to_yojson

let rate_limiter_status_to_yojson (x : rate_limiter_status) =
  assoc_to_yojson
    [
      ("maxAllowed", option_to_yojson count_to_yojson x.max_allowed);
      ("inUse", option_to_yojson count_to_yojson x.in_use);
      ("remaining", option_to_yojson count_to_yojson x.remaining);
      ("totalBandwidth", option_to_yojson bandwidth_to_yojson x.total_bandwidth);
    ]

let start_on_date_to_yojson = string_to_yojson
let state_to_yojson = string_to_yojson
let ckn_to_yojson = string_to_yojson
let secret_ar_n_to_yojson = string_to_yojson

let mac_sec_key_to_yojson (x : mac_sec_key) =
  assoc_to_yojson
    [
      ("secretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
      ("ckn", option_to_yojson ckn_to_yojson x.ckn);
      ("state", option_to_yojson state_to_yojson x.state);
      ("startOn", option_to_yojson start_on_date_to_yojson x.start_on);
    ]

let mac_sec_key_list_to_yojson tree = list_to_yojson mac_sec_key_to_yojson tree
let encryption_mode_to_yojson = string_to_yojson
let port_encryption_status_to_yojson = string_to_yojson
let mac_sec_capable_to_yojson = bool_to_yojson
let provider_name_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", Some (tag_key_to_yojson x.key));
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let has_logical_redundancy_to_yojson (x : has_logical_redundancy) =
  match x with Unknown -> `String "unknown" | Yes -> `String "yes" | No -> `String "no"

let aws_logical_device_id_to_yojson = string_to_yojson
let aws_device_v2_to_yojson = string_to_yojson
let jumbo_frame_capable_to_yojson = bool_to_yojson
let aws_device_to_yojson = string_to_yojson
let lag_id_to_yojson = string_to_yojson
let loa_issue_time_to_yojson = timestamp_epoch_seconds_to_yojson
let partner_name_to_yojson = string_to_yojson
let vla_n_to_yojson = int_to_yojson
let location_code_to_yojson = string_to_yojson

let connection_state_to_yojson (x : connection_state) =
  match x with
  | Ordering -> `String "ordering"
  | Requested -> `String "requested"
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Down -> `String "down"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"
  | Rejected -> `String "rejected"
  | Unknown -> `String "unknown"

let connection_name_to_yojson = string_to_yojson
let connection_id_to_yojson = string_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("connectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("connectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("region", option_to_yojson region_to_yojson x.region);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("bandwidth", option_to_yojson bandwidth_to_yojson x.bandwidth);
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ("partnerName", option_to_yojson partner_name_to_yojson x.partner_name);
      ("loaIssueTime", option_to_yojson loa_issue_time_to_yojson x.loa_issue_time);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ( "portEncryptionStatus",
        option_to_yojson port_encryption_status_to_yojson x.port_encryption_status );
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("rateLimiterStatus", option_to_yojson rate_limiter_status_to_yojson x.rate_limiter_status);
      ( "partnerInterconnectMacSecCapable",
        option_to_yojson partner_interconnect_mac_sec_capable_to_yojson
          x.partner_interconnect_mac_sec_capable );
    ]

let interconnect_id_to_yojson = string_to_yojson

let allocate_connection_on_interconnect_request_to_yojson
    (x : allocate_connection_on_interconnect_request) =
  assoc_to_yojson
    [
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id));
      ("vlan", Some (vla_n_to_yojson x.vlan));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_tag_keys_exception_to_yojson (x : duplicate_tag_keys_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let allocate_hosted_connection_request_to_yojson (x : allocate_hosted_connection_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let rate_limit_to_yojson = string_to_yojson
let site_link_enabled_to_yojson = bool_to_yojson

let bgp_status_to_yojson (x : bgp_status) =
  match x with Up -> `String "up" | Down -> `String "down" | Unknown -> `String "unknown"

let bgp_peer_state_to_yojson (x : bgp_peer_state) =
  match x with
  | Verifying -> `String "verifying"
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"

let customer_address_to_yojson = string_to_yojson
let amazon_address_to_yojson = string_to_yojson
let bgp_auth_key_to_yojson = string_to_yojson
let long_asn_to_yojson = long_to_yojson
let bgp_peer_id_to_yojson = string_to_yojson

let bgp_peer_to_yojson (x : bgp_peer) =
  assoc_to_yojson
    [
      ("bgpPeerId", option_to_yojson bgp_peer_id_to_yojson x.bgp_peer_id);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("bgpPeerState", option_to_yojson bgp_peer_state_to_yojson x.bgp_peer_state);
      ("bgpStatus", option_to_yojson bgp_status_to_yojson x.bgp_status);
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
    ]

let bgp_peer_list_to_yojson tree = list_to_yojson bgp_peer_to_yojson tree
let mt_u_to_yojson = int_to_yojson
let router_config_to_yojson = string_to_yojson

let virtual_interface_state_to_yojson (x : virtual_interface_state) =
  match x with
  | Confirming -> `String "confirming"
  | Verifying -> `String "verifying"
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Down -> `String "down"
  | Testing -> `String "testing"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"
  | Rejected -> `String "rejected"
  | Unknown -> `String "unknown"

let virtual_interface_name_to_yojson = string_to_yojson
let virtual_interface_type_to_yojson = string_to_yojson
let virtual_interface_id_to_yojson = string_to_yojson

let virtual_interface_to_yojson (x : virtual_interface) =
  assoc_to_yojson
    [
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ( "virtualInterfaceType",
        option_to_yojson virtual_interface_type_to_yojson x.virtual_interface_type );
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
      ("customerRouterConfig", option_to_yojson router_config_to_yojson x.customer_router_config);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ("bgpPeers", option_to_yojson bgp_peer_list_to_yojson x.bgp_peers);
      ("region", option_to_yojson region_to_yojson x.region);
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("siteLinkEnabled", option_to_yojson site_link_enabled_to_yojson x.site_link_enabled);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let new_private_virtual_interface_allocation_to_yojson
    (x : new_private_virtual_interface_allocation) =
  assoc_to_yojson
    [
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let allocate_private_virtual_interface_request_to_yojson
    (x : allocate_private_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ( "newPrivateVirtualInterfaceAllocation",
        Some
          (new_private_virtual_interface_allocation_to_yojson
             x.new_private_virtual_interface_allocation) );
    ]

let new_public_virtual_interface_allocation_to_yojson (x : new_public_virtual_interface_allocation)
    =
  assoc_to_yojson
    [
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let allocate_public_virtual_interface_request_to_yojson
    (x : allocate_public_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ( "newPublicVirtualInterfaceAllocation",
        Some
          (new_public_virtual_interface_allocation_to_yojson
             x.new_public_virtual_interface_allocation) );
    ]

let allocate_transit_virtual_interface_result_to_yojson
    (x : allocate_transit_virtual_interface_result) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_transit_virtual_interface_allocation_to_yojson
    (x : new_transit_virtual_interface_allocation) =
  assoc_to_yojson
    [
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let allocate_transit_virtual_interface_request_to_yojson
    (x : allocate_transit_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("ownerAccount", Some (owner_account_to_yojson x.owner_account));
      ( "newTransitVirtualInterfaceAllocation",
        Some
          (new_transit_virtual_interface_allocation_to_yojson
             x.new_transit_virtual_interface_allocation) );
    ]

let associate_connection_with_lag_request_to_yojson (x : associate_connection_with_lag_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("lagId", Some (lag_id_to_yojson x.lag_id));
    ]

let associate_hosted_connection_request_to_yojson (x : associate_hosted_connection_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("parentConnectionId", Some (connection_id_to_yojson x.parent_connection_id));
    ]

let associate_mac_sec_key_response_to_yojson (x : associate_mac_sec_key_response) =
  assoc_to_yojson
    [
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
    ]

let cak_to_yojson = string_to_yojson

let associate_mac_sec_key_request_to_yojson (x : associate_mac_sec_key_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("secretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
      ("ckn", option_to_yojson ckn_to_yojson x.ckn);
      ("cak", option_to_yojson cak_to_yojson x.cak);
    ]

let associate_virtual_interface_request_to_yojson (x : associate_virtual_interface_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
    ]

let associated_gateway_id_to_yojson = string_to_yojson
let port_speed_to_yojson = string_to_yojson
let available_mac_sec_port_speeds_to_yojson tree = list_to_yojson port_speed_to_yojson tree
let available_port_speeds_to_yojson tree = list_to_yojson port_speed_to_yojson tree
let bgp_peer_id_list_to_yojson tree = list_to_yojson bgp_peer_id_to_yojson tree
let boolean_flag_to_yojson = bool_to_yojson

let confirm_connection_response_to_yojson (x : confirm_connection_response) =
  assoc_to_yojson
    [ ("connectionState", option_to_yojson connection_state_to_yojson x.connection_state) ]

let confirm_connection_request_to_yojson (x : confirm_connection_request) =
  assoc_to_yojson [ ("connectionId", Some (connection_id_to_yojson x.connection_id)) ]

let confirm_customer_agreement_response_to_yojson (x : confirm_customer_agreement_response) =
  assoc_to_yojson [ ("status", option_to_yojson status_to_yojson x.status) ]

let confirm_customer_agreement_request_to_yojson (x : confirm_customer_agreement_request) =
  assoc_to_yojson [ ("agreementName", option_to_yojson agreement_name_to_yojson x.agreement_name) ]

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
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
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
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let connections_to_yojson (x : connections) =
  assoc_to_yojson
    [
      ("connections", option_to_yojson connection_list_to_yojson x.connections);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let create_bgp_peer_response_to_yojson (x : create_bgp_peer_response) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_bgp_peer_to_yojson (x : new_bgp_peer) =
  assoc_to_yojson
    [
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
    ]

let create_bgp_peer_request_to_yojson (x : create_bgp_peer_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("newBGPPeer", option_to_yojson new_bgp_peer_to_yojson x.new_bgp_peer);
    ]

let request_mac_sec_to_yojson = bool_to_yojson

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("location", Some (location_code_to_yojson x.location));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("connectionName", Some (connection_name_to_yojson x.connection_name));
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
    ]

let direct_connect_gateway_state_to_yojson (x : direct_connect_gateway_state) =
  match x with
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"

let direct_connect_gateway_name_to_yojson = string_to_yojson

let direct_connect_gateway_to_yojson (x : direct_connect_gateway) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "directConnectGatewayName",
        option_to_yojson direct_connect_gateway_name_to_yojson x.direct_connect_gateway_name );
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ( "directConnectGatewayState",
        option_to_yojson direct_connect_gateway_state_to_yojson x.direct_connect_gateway_state );
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
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
      ( "directConnectGatewayName",
        Some (direct_connect_gateway_name_to_yojson x.direct_connect_gateway_name) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("amazonSideAsn", option_to_yojson long_asn_to_yojson x.amazon_side_asn);
    ]

let create_direct_connect_gateway_association_result_to_yojson
    (x : create_direct_connect_gateway_association_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociation",
        option_to_yojson direct_connect_gateway_association_to_yojson
          x.direct_connect_gateway_association );
    ]

let gateway_id_to_associate_to_yojson = string_to_yojson

let create_direct_connect_gateway_association_request_to_yojson
    (x : create_direct_connect_gateway_association_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
      ("gatewayId", option_to_yojson gateway_id_to_associate_to_yojson x.gateway_id);
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
    ]

let direct_connect_gateway_association_proposal_state_to_yojson
    (x : direct_connect_gateway_association_proposal_state) =
  match x with
  | Requested -> `String "requested"
  | Accepted -> `String "accepted"
  | Deleted -> `String "deleted"

let direct_connect_gateway_association_proposal_to_yojson
    (x : direct_connect_gateway_association_proposal) =
  assoc_to_yojson
    [
      ( "proposalId",
        option_to_yojson direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "directConnectGatewayOwnerAccount",
        option_to_yojson owner_account_to_yojson x.direct_connect_gateway_owner_account );
      ( "proposalState",
        option_to_yojson direct_connect_gateway_association_proposal_state_to_yojson
          x.proposal_state );
      ("associatedGateway", option_to_yojson associated_gateway_to_yojson x.associated_gateway);
      ( "existingAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.existing_allowed_prefixes_to_direct_connect_gateway );
      ( "requestedAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.requested_allowed_prefixes_to_direct_connect_gateway );
    ]

let create_direct_connect_gateway_association_proposal_result_to_yojson
    (x : create_direct_connect_gateway_association_proposal_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociationProposal",
        option_to_yojson direct_connect_gateway_association_proposal_to_yojson
          x.direct_connect_gateway_association_proposal );
    ]

let create_direct_connect_gateway_association_proposal_request_to_yojson
    (x : create_direct_connect_gateway_association_proposal_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
      ( "directConnectGatewayOwnerAccount",
        Some (owner_account_to_yojson x.direct_connect_gateway_owner_account) );
      ("gatewayId", Some (gateway_id_to_associate_to_yojson x.gateway_id));
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ( "removeAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.remove_allowed_prefixes_to_direct_connect_gateway );
    ]

let interconnect_state_to_yojson (x : interconnect_state) =
  match x with
  | Requested -> `String "requested"
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Down -> `String "down"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"
  | Unknown -> `String "unknown"

let interconnect_name_to_yojson = string_to_yojson

let interconnect_to_yojson (x : interconnect) =
  assoc_to_yojson
    [
      ("interconnectId", option_to_yojson interconnect_id_to_yojson x.interconnect_id);
      ("interconnectName", option_to_yojson interconnect_name_to_yojson x.interconnect_name);
      ("interconnectState", option_to_yojson interconnect_state_to_yojson x.interconnect_state);
      ("region", option_to_yojson region_to_yojson x.region);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("bandwidth", option_to_yojson bandwidth_to_yojson x.bandwidth);
      ("loaIssueTime", option_to_yojson loa_issue_time_to_yojson x.loa_issue_time);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ( "portEncryptionStatus",
        option_to_yojson port_encryption_status_to_yojson x.port_encryption_status );
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
    ]

let create_interconnect_request_to_yojson (x : create_interconnect_request) =
  assoc_to_yojson
    [
      ("interconnectName", Some (interconnect_name_to_yojson x.interconnect_name));
      ("bandwidth", Some (bandwidth_to_yojson x.bandwidth));
      ("location", Some (location_code_to_yojson x.location));
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
    ]

let lag_state_to_yojson (x : lag_state) =
  match x with
  | Requested -> `String "requested"
  | Pending -> `String "pending"
  | Available -> `String "available"
  | Down -> `String "down"
  | Deleting -> `String "deleting"
  | Deleted -> `String "deleted"
  | Unknown -> `String "unknown"

let lag_name_to_yojson = string_to_yojson

let lag_to_yojson (x : lag) =
  assoc_to_yojson
    [
      ("connectionsBandwidth", option_to_yojson bandwidth_to_yojson x.connections_bandwidth);
      ("numberOfConnections", option_to_yojson count_to_yojson x.number_of_connections);
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("lagName", option_to_yojson lag_name_to_yojson x.lag_name);
      ("lagState", option_to_yojson lag_state_to_yojson x.lag_state);
      ("location", option_to_yojson location_code_to_yojson x.location);
      ("region", option_to_yojson region_to_yojson x.region);
      ("minimumLinks", option_to_yojson count_to_yojson x.minimum_links);
      ("awsDevice", option_to_yojson aws_device_to_yojson x.aws_device);
      ("awsDeviceV2", option_to_yojson aws_device_v2_to_yojson x.aws_device_v2);
      ( "awsLogicalDeviceId",
        option_to_yojson aws_logical_device_id_to_yojson x.aws_logical_device_id );
      ("connections", option_to_yojson connection_list_to_yojson x.connections);
      ( "allowsHostedConnections",
        option_to_yojson boolean_flag_to_yojson x.allows_hosted_connections );
      ("jumboFrameCapable", option_to_yojson jumbo_frame_capable_to_yojson x.jumbo_frame_capable);
      ( "hasLogicalRedundancy",
        option_to_yojson has_logical_redundancy_to_yojson x.has_logical_redundancy );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("macSecCapable", option_to_yojson mac_sec_capable_to_yojson x.mac_sec_capable);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
      ("rateLimiterStatus", option_to_yojson rate_limiter_status_to_yojson x.rate_limiter_status);
    ]

let create_lag_request_to_yojson (x : create_lag_request) =
  assoc_to_yojson
    [
      ("numberOfConnections", Some (count_to_yojson x.number_of_connections));
      ("location", Some (location_code_to_yojson x.location));
      ("connectionsBandwidth", Some (bandwidth_to_yojson x.connections_bandwidth));
      ("lagName", Some (lag_name_to_yojson x.lag_name));
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("childConnectionTags", option_to_yojson tag_list_to_yojson x.child_connection_tags);
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("requestMACSec", option_to_yojson request_mac_sec_to_yojson x.request_mac_sec);
    ]

let enable_site_link_to_yojson = bool_to_yojson

let new_private_virtual_interface_to_yojson (x : new_private_virtual_interface) =
  assoc_to_yojson
    [
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let create_private_virtual_interface_request_to_yojson
    (x : create_private_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ( "newPrivateVirtualInterface",
        Some (new_private_virtual_interface_to_yojson x.new_private_virtual_interface) );
    ]

let new_public_virtual_interface_to_yojson (x : new_public_virtual_interface) =
  assoc_to_yojson
    [
      ("virtualInterfaceName", Some (virtual_interface_name_to_yojson x.virtual_interface_name));
      ("vlan", Some (vla_n_to_yojson x.vlan));
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ( "routeFilterPrefixes",
        option_to_yojson route_filter_prefix_list_to_yojson x.route_filter_prefixes );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let create_public_virtual_interface_request_to_yojson (x : create_public_virtual_interface_request)
    =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ( "newPublicVirtualInterface",
        Some (new_public_virtual_interface_to_yojson x.new_public_virtual_interface) );
    ]

let create_transit_virtual_interface_result_to_yojson (x : create_transit_virtual_interface_result)
    =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let new_transit_virtual_interface_to_yojson (x : new_transit_virtual_interface) =
  assoc_to_yojson
    [
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("vlan", option_to_yojson vla_n_to_yojson x.vlan);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("authKey", option_to_yojson bgp_auth_key_to_yojson x.auth_key);
      ("amazonAddress", option_to_yojson amazon_address_to_yojson x.amazon_address);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("addressFamily", option_to_yojson address_family_to_yojson x.address_family);
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let create_transit_virtual_interface_request_to_yojson
    (x : create_transit_virtual_interface_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ( "newTransitVirtualInterface",
        Some (new_transit_virtual_interface_to_yojson x.new_transit_virtual_interface) );
    ]

let delete_bgp_peer_response_to_yojson (x : delete_bgp_peer_response) =
  assoc_to_yojson
    [ ("virtualInterface", option_to_yojson virtual_interface_to_yojson x.virtual_interface) ]

let delete_bgp_peer_request_to_yojson (x : delete_bgp_peer_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("asn", option_to_yojson as_n_to_yojson x.asn);
      ("asnLong", option_to_yojson long_asn_to_yojson x.asn_long);
      ("customerAddress", option_to_yojson customer_address_to_yojson x.customer_address);
      ("bgpPeerId", option_to_yojson bgp_peer_id_to_yojson x.bgp_peer_id);
    ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson [ ("connectionId", Some (connection_id_to_yojson x.connection_id)) ]

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
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
    ]

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

let delete_interconnect_response_to_yojson (x : delete_interconnect_response) =
  assoc_to_yojson
    [ ("interconnectState", option_to_yojson interconnect_state_to_yojson x.interconnect_state) ]

let delete_interconnect_request_to_yojson (x : delete_interconnect_request) =
  assoc_to_yojson [ ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id)) ]

let delete_lag_request_to_yojson (x : delete_lag_request) =
  assoc_to_yojson [ ("lagId", Some (lag_id_to_yojson x.lag_id)) ]

let delete_virtual_interface_response_to_yojson (x : delete_virtual_interface_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceState",
        option_to_yojson virtual_interface_state_to_yojson x.virtual_interface_state );
    ]

let delete_virtual_interface_request_to_yojson (x : delete_virtual_interface_request) =
  assoc_to_yojson
    [ ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id)) ]

let loa_content_type_to_yojson (x : loa_content_type) =
  match x with PDF -> `String "application/pdf"

let loa_content_to_yojson = blob_to_yojson

let loa_to_yojson (x : loa) =
  assoc_to_yojson
    [
      ("loaContent", option_to_yojson loa_content_to_yojson x.loa_content);
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
    ]

let describe_connection_loa_response_to_yojson (x : describe_connection_loa_response) =
  assoc_to_yojson [ ("loa", option_to_yojson loa_to_yojson x.loa) ]

let describe_connection_loa_request_to_yojson (x : describe_connection_loa_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
    ]

let max_result_set_size_to_yojson = int_to_yojson

let describe_connections_request_to_yojson (x : describe_connections_request) =
  assoc_to_yojson
    [
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_connections_on_interconnect_request_to_yojson
    (x : describe_connections_on_interconnect_request) =
  assoc_to_yojson [ ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id)) ]

let nni_partner_type_to_yojson (x : nni_partner_type) =
  match x with V1 -> `String "v1" | V2 -> `String "v2" | NonPartner -> `String "nonPartner"

let describe_customer_metadata_response_to_yojson (x : describe_customer_metadata_response) =
  assoc_to_yojson
    [
      ("agreements", option_to_yojson agreement_list_to_yojson x.agreements);
      ("nniPartnerType", option_to_yojson nni_partner_type_to_yojson x.nni_partner_type);
    ]

let direct_connect_gateway_association_proposal_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_association_proposal_to_yojson tree

let describe_direct_connect_gateway_association_proposals_result_to_yojson
    (x : describe_direct_connect_gateway_association_proposals_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociationProposals",
        option_to_yojson direct_connect_gateway_association_proposal_list_to_yojson
          x.direct_connect_gateway_association_proposals );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_direct_connect_gateway_association_proposals_request_to_yojson
    (x : describe_direct_connect_gateway_association_proposals_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ( "proposalId",
        option_to_yojson direct_connect_gateway_association_proposal_id_to_yojson x.proposal_id );
      ( "associatedGatewayId",
        option_to_yojson associated_gateway_id_to_yojson x.associated_gateway_id );
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let direct_connect_gateway_association_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_association_to_yojson tree

let describe_direct_connect_gateway_associations_result_to_yojson
    (x : describe_direct_connect_gateway_associations_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAssociations",
        option_to_yojson direct_connect_gateway_association_list_to_yojson
          x.direct_connect_gateway_associations );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_direct_connect_gateway_associations_request_to_yojson
    (x : describe_direct_connect_gateway_associations_request) =
  assoc_to_yojson
    [
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
      ( "associatedGatewayId",
        option_to_yojson associated_gateway_id_to_yojson x.associated_gateway_id );
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
    ]

let direct_connect_gateway_attachment_type_to_yojson (x : direct_connect_gateway_attachment_type) =
  match x with
  | TransitVirtualInterface -> `String "TransitVirtualInterface"
  | PrivateVirtualInterface -> `String "PrivateVirtualInterface"

let direct_connect_gateway_attachment_state_to_yojson (x : direct_connect_gateway_attachment_state)
    =
  match x with
  | Attaching -> `String "attaching"
  | Attached -> `String "attached"
  | Detaching -> `String "detaching"
  | Detached -> `String "detached"

let virtual_interface_region_to_yojson = string_to_yojson

let direct_connect_gateway_attachment_to_yojson (x : direct_connect_gateway_attachment) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ( "virtualInterfaceRegion",
        option_to_yojson virtual_interface_region_to_yojson x.virtual_interface_region );
      ( "virtualInterfaceOwnerAccount",
        option_to_yojson owner_account_to_yojson x.virtual_interface_owner_account );
      ( "attachmentState",
        option_to_yojson direct_connect_gateway_attachment_state_to_yojson x.attachment_state );
      ( "attachmentType",
        option_to_yojson direct_connect_gateway_attachment_type_to_yojson x.attachment_type );
      ("stateChangeError", option_to_yojson state_change_error_to_yojson x.state_change_error);
    ]

let direct_connect_gateway_attachment_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_attachment_to_yojson tree

let describe_direct_connect_gateway_attachments_result_to_yojson
    (x : describe_direct_connect_gateway_attachments_result) =
  assoc_to_yojson
    [
      ( "directConnectGatewayAttachments",
        option_to_yojson direct_connect_gateway_attachment_list_to_yojson
          x.direct_connect_gateway_attachments );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_direct_connect_gateway_attachments_request_to_yojson
    (x : describe_direct_connect_gateway_attachments_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let direct_connect_gateway_list_to_yojson tree =
  list_to_yojson direct_connect_gateway_to_yojson tree

let describe_direct_connect_gateways_result_to_yojson (x : describe_direct_connect_gateways_result)
    =
  assoc_to_yojson
    [
      ( "directConnectGateways",
        option_to_yojson direct_connect_gateway_list_to_yojson x.direct_connect_gateways );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_direct_connect_gateways_request_to_yojson
    (x : describe_direct_connect_gateways_request) =
  assoc_to_yojson
    [
      ( "directConnectGatewayId",
        option_to_yojson direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id );
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_hosted_connections_request_to_yojson (x : describe_hosted_connections_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_interconnect_loa_response_to_yojson (x : describe_interconnect_loa_response) =
  assoc_to_yojson [ ("loa", option_to_yojson loa_to_yojson x.loa) ]

let describe_interconnect_loa_request_to_yojson (x : describe_interconnect_loa_request) =
  assoc_to_yojson
    [
      ("interconnectId", Some (interconnect_id_to_yojson x.interconnect_id));
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
    ]

let interconnect_list_to_yojson tree = list_to_yojson interconnect_to_yojson tree

let interconnects_to_yojson (x : interconnects) =
  assoc_to_yojson
    [
      ("interconnects", option_to_yojson interconnect_list_to_yojson x.interconnects);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_interconnects_request_to_yojson (x : describe_interconnects_request) =
  assoc_to_yojson
    [
      ("interconnectId", option_to_yojson interconnect_id_to_yojson x.interconnect_id);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let lag_list_to_yojson tree = list_to_yojson lag_to_yojson tree

let lags_to_yojson (x : lags) =
  assoc_to_yojson
    [
      ("lags", option_to_yojson lag_list_to_yojson x.lags);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_lags_request_to_yojson (x : describe_lags_request) =
  assoc_to_yojson
    [
      ("lagId", option_to_yojson lag_id_to_yojson x.lag_id);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_loa_request_to_yojson (x : describe_loa_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("providerName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("loaContentType", option_to_yojson loa_content_type_to_yojson x.loa_content_type);
    ]

let provider_list_to_yojson tree = list_to_yojson provider_name_to_yojson tree
let location_name_to_yojson = string_to_yojson

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ("locationCode", option_to_yojson location_code_to_yojson x.location_code);
      ("locationName", option_to_yojson location_name_to_yojson x.location_name);
      ("region", option_to_yojson region_to_yojson x.region);
      ( "availablePortSpeeds",
        option_to_yojson available_port_speeds_to_yojson x.available_port_speeds );
      ("availableProviders", option_to_yojson provider_list_to_yojson x.available_providers);
      ( "availableMacSecPortSpeeds",
        option_to_yojson available_mac_sec_port_speeds_to_yojson x.available_mac_sec_port_speeds );
    ]

let location_list_to_yojson tree = list_to_yojson location_to_yojson tree

let locations_to_yojson (x : locations) =
  assoc_to_yojson [ ("locations", option_to_yojson location_list_to_yojson x.locations) ]

let router_type_identifier_to_yojson = string_to_yojson
let xslt_template_name_for_mac_sec_to_yojson = string_to_yojson
let xslt_template_name_to_yojson = string_to_yojson
let software_to_yojson = string_to_yojson
let platform_to_yojson = string_to_yojson
let vendor_to_yojson = string_to_yojson

let router_type_to_yojson (x : router_type) =
  assoc_to_yojson
    [
      ("vendor", option_to_yojson vendor_to_yojson x.vendor);
      ("platform", option_to_yojson platform_to_yojson x.platform);
      ("software", option_to_yojson software_to_yojson x.software);
      ("xsltTemplateName", option_to_yojson xslt_template_name_to_yojson x.xslt_template_name);
      ( "xsltTemplateNameForMacSec",
        option_to_yojson xslt_template_name_for_mac_sec_to_yojson x.xslt_template_name_for_mac_sec
      );
      ( "routerTypeIdentifier",
        option_to_yojson router_type_identifier_to_yojson x.router_type_identifier );
    ]

let describe_router_configuration_response_to_yojson (x : describe_router_configuration_response) =
  assoc_to_yojson
    [
      ("customerRouterConfig", option_to_yojson router_config_to_yojson x.customer_router_config);
      ("router", option_to_yojson router_type_to_yojson x.router);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
    ]

let describe_router_configuration_request_to_yojson (x : describe_router_configuration_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ( "routerTypeIdentifier",
        option_to_yojson router_type_identifier_to_yojson x.router_type_identifier );
    ]

let resource_arn_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let describe_tags_response_to_yojson (x : describe_tags_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson [ ("resourceArns", Some (resource_arn_list_to_yojson x.resource_arns)) ]

let virtual_gateway_state_to_yojson = string_to_yojson

let virtual_gateway_to_yojson (x : virtual_gateway) =
  assoc_to_yojson
    [
      ("virtualGatewayId", option_to_yojson virtual_gateway_id_to_yojson x.virtual_gateway_id);
      ( "virtualGatewayState",
        option_to_yojson virtual_gateway_state_to_yojson x.virtual_gateway_state );
    ]

let virtual_gateway_list_to_yojson tree = list_to_yojson virtual_gateway_to_yojson tree

let virtual_gateways_to_yojson (x : virtual_gateways) =
  assoc_to_yojson
    [ ("virtualGateways", option_to_yojson virtual_gateway_list_to_yojson x.virtual_gateways) ]

let virtual_interface_list_to_yojson tree = list_to_yojson virtual_interface_to_yojson tree

let virtual_interfaces_to_yojson (x : virtual_interfaces) =
  assoc_to_yojson
    [
      ("virtualInterfaces", option_to_yojson virtual_interface_list_to_yojson x.virtual_interfaces);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_virtual_interfaces_request_to_yojson (x : describe_virtual_interfaces_request) =
  assoc_to_yojson
    [
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let disassociate_connection_from_lag_request_to_yojson
    (x : disassociate_connection_from_lag_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("lagId", Some (lag_id_to_yojson x.lag_id));
    ]

let disassociate_mac_sec_key_response_to_yojson (x : disassociate_mac_sec_key_response) =
  assoc_to_yojson
    [
      ("connectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("macSecKeys", option_to_yojson mac_sec_key_list_to_yojson x.mac_sec_keys);
    ]

let disassociate_mac_sec_key_request_to_yojson (x : disassociate_mac_sec_key_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("secretARN", Some (secret_ar_n_to_yojson x.secret_ar_n));
    ]

let end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let failure_test_history_status_to_yojson = string_to_yojson
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let test_duration_to_yojson = int_to_yojson
let test_id_to_yojson = string_to_yojson

let virtual_interface_test_history_to_yojson (x : virtual_interface_test_history) =
  assoc_to_yojson
    [
      ("testId", option_to_yojson test_id_to_yojson x.test_id);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("status", option_to_yojson failure_test_history_status_to_yojson x.status);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("testDurationInMinutes", option_to_yojson test_duration_to_yojson x.test_duration_in_minutes);
      ("startTime", option_to_yojson start_time_to_yojson x.start_time);
      ("endTime", option_to_yojson end_time_to_yojson x.end_time);
    ]

let virtual_interface_test_history_list_to_yojson tree =
  list_to_yojson virtual_interface_test_history_to_yojson tree

let list_virtual_interface_test_history_response_to_yojson
    (x : list_virtual_interface_test_history_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceTestHistory",
        option_to_yojson virtual_interface_test_history_list_to_yojson
          x.virtual_interface_test_history );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_virtual_interface_test_history_request_to_yojson
    (x : list_virtual_interface_test_history_request) =
  assoc_to_yojson
    [
      ("testId", option_to_yojson test_id_to_yojson x.test_id);
      ("virtualInterfaceId", option_to_yojson virtual_interface_id_to_yojson x.virtual_interface_id);
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("status", option_to_yojson failure_test_history_status_to_yojson x.status);
      ("maxResults", option_to_yojson max_result_set_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let update_virtual_interface_attributes_request_to_yojson
    (x : update_virtual_interface_attributes_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ("mtu", option_to_yojson mt_u_to_yojson x.mtu);
      ("enableSiteLink", option_to_yojson enable_site_link_to_yojson x.enable_site_link);
      ( "virtualInterfaceName",
        option_to_yojson virtual_interface_name_to_yojson x.virtual_interface_name );
      ("rateLimit", option_to_yojson rate_limit_to_yojson x.rate_limit);
    ]

let update_lag_request_to_yojson (x : update_lag_request) =
  assoc_to_yojson
    [
      ("lagId", Some (lag_id_to_yojson x.lag_id));
      ("lagName", option_to_yojson lag_name_to_yojson x.lag_name);
      ("minimumLinks", option_to_yojson count_to_yojson x.minimum_links);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
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
      ( "associationId",
        option_to_yojson direct_connect_gateway_association_id_to_yojson x.association_id );
      ( "addAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.add_allowed_prefixes_to_direct_connect_gateway );
      ( "removeAllowedPrefixesToDirectConnectGateway",
        option_to_yojson route_filter_prefix_list_to_yojson
          x.remove_allowed_prefixes_to_direct_connect_gateway );
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
      ( "directConnectGatewayId",
        Some (direct_connect_gateway_id_to_yojson x.direct_connect_gateway_id) );
      ( "newDirectConnectGatewayName",
        Some (direct_connect_gateway_name_to_yojson x.new_direct_connect_gateway_name) );
    ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("connectionId", Some (connection_id_to_yojson x.connection_id));
      ("connectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("encryptionMode", option_to_yojson encryption_mode_to_yojson x.encryption_mode);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let stop_bgp_failover_test_response_to_yojson (x : stop_bgp_failover_test_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceTest",
        option_to_yojson virtual_interface_test_history_to_yojson x.virtual_interface_test );
    ]

let stop_bgp_failover_test_request_to_yojson (x : stop_bgp_failover_test_request) =
  assoc_to_yojson
    [ ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id)) ]

let start_bgp_failover_test_response_to_yojson (x : start_bgp_failover_test_response) =
  assoc_to_yojson
    [
      ( "virtualInterfaceTest",
        option_to_yojson virtual_interface_test_history_to_yojson x.virtual_interface_test );
    ]

let start_bgp_failover_test_request_to_yojson (x : start_bgp_failover_test_request) =
  assoc_to_yojson
    [
      ("virtualInterfaceId", Some (virtual_interface_id_to_yojson x.virtual_interface_id));
      ("bgpPeers", option_to_yojson bgp_peer_id_list_to_yojson x.bgp_peers);
      ("testDurationInMinutes", option_to_yojson test_duration_to_yojson x.test_duration_in_minutes);
    ]
