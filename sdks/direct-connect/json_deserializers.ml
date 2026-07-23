open Smaws_Lib.Json.DeserializeHelpers
open Types

let as_n_of_yojson = int_of_yojson
let error_message_of_yojson = string_of_yojson

let direct_connect_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : direct_connect_server_exception)

let direct_connect_client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : direct_connect_client_exception)

let owner_account_of_yojson = string_of_yojson
let virtual_gateway_region_of_yojson = string_of_yojson
let virtual_gateway_id_of_yojson = string_of_yojson
let core_network_attachment_id_of_yojson = string_of_yojson
let core_network_identifier_of_yojson = string_of_yojson

let associated_core_network_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key core_network_identifier_of_yojson "id") _list path;
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     attachment_id =
       option_of_yojson
         (value_for_key core_network_attachment_id_of_yojson "attachmentId")
         _list path;
   }
    : associated_core_network)

let cid_r_of_yojson = string_of_yojson

let route_filter_prefix_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cidr = option_of_yojson (value_for_key cid_r_of_yojson "cidr") _list path }
    : route_filter_prefix)

let route_filter_prefix_list_of_yojson tree path =
  list_of_yojson route_filter_prefix_of_yojson tree path

let direct_connect_gateway_association_id_of_yojson = string_of_yojson
let region_of_yojson = string_of_yojson

let gateway_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "virtualPrivateGateway" -> VirtualPrivateGateway
    | `String "transitGateway" -> TransitGateway
    | `String value -> raise (deserialize_unknown_enum_value_error path "GatewayType" value)
    | _ -> raise (deserialize_wrong_type_error path "GatewayType")
     : gateway_type)
    : gateway_type)

let gateway_identifier_of_yojson = string_of_yojson

let associated_gateway_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key gateway_identifier_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key gateway_type_of_yojson "type") _list path;
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
   }
    : associated_gateway)

let state_change_error_of_yojson = string_of_yojson

let direct_connect_gateway_association_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "associating" -> Associating
    | `String "associated" -> Associated
    | `String "disassociating" -> Disassociating
    | `String "disassociated" -> Disassociated
    | `String "updating" -> Updating
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectConnectGatewayAssociationState" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectConnectGatewayAssociationState")
     : direct_connect_gateway_association_state)
    : direct_connect_gateway_association_state)

let direct_connect_gateway_id_of_yojson = string_of_yojson

let direct_connect_gateway_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     direct_connect_gateway_owner_account =
       option_of_yojson
         (value_for_key owner_account_of_yojson "directConnectGatewayOwnerAccount")
         _list path;
     association_state =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_state_of_yojson "associationState")
         _list path;
     state_change_error =
       option_of_yojson (value_for_key state_change_error_of_yojson "stateChangeError") _list path;
     associated_gateway =
       option_of_yojson (value_for_key associated_gateway_of_yojson "associatedGateway") _list path;
     association_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_id_of_yojson "associationId")
         _list path;
     allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson "allowedPrefixesToDirectConnectGateway")
         _list path;
     associated_core_network =
       option_of_yojson
         (value_for_key associated_core_network_of_yojson "associatedCoreNetwork")
         _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
     virtual_gateway_region =
       option_of_yojson
         (value_for_key virtual_gateway_region_of_yojson "virtualGatewayRegion")
         _list path;
     virtual_gateway_owner_account =
       option_of_yojson
         (value_for_key owner_account_of_yojson "virtualGatewayOwnerAccount")
         _list path;
   }
    : direct_connect_gateway_association)

let accept_direct_connect_gateway_association_proposal_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_of_yojson
            "directConnectGatewayAssociation")
         _list path;
   }
    : accept_direct_connect_gateway_association_proposal_result)

let direct_connect_gateway_association_proposal_id_of_yojson = string_of_yojson

let accept_direct_connect_gateway_association_proposal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
     proposal_id =
       value_for_key direct_connect_gateway_association_proposal_id_of_yojson "proposalId" _list
         path;
     associated_gateway_owner_account =
       value_for_key owner_account_of_yojson "associatedGatewayOwnerAccount" _list path;
     override_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "overrideAllowedPrefixesToDirectConnectGateway")
         _list path;
   }
    : accept_direct_connect_gateway_association_proposal_request)

let address_family_of_yojson (tree : t) path =
  ((match tree with
    | `String "ipv4" -> IPv4
    | `String "ipv6" -> IPv6
    | `String value -> raise (deserialize_unknown_enum_value_error path "AddressFamily" value)
    | _ -> raise (deserialize_wrong_type_error path "AddressFamily")
     : address_family)
    : address_family)

let status_of_yojson = string_of_yojson
let agreement_name_of_yojson = string_of_yojson

let customer_agreement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_name =
       option_of_yojson (value_for_key agreement_name_of_yojson "agreementName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
   }
    : customer_agreement)

let agreement_list_of_yojson tree path = list_of_yojson customer_agreement_of_yojson tree path
let partner_interconnect_mac_sec_capable_of_yojson = bool_of_yojson
let bandwidth_of_yojson = string_of_yojson
let count_of_yojson = int_of_yojson

let rate_limiter_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_allowed = option_of_yojson (value_for_key count_of_yojson "maxAllowed") _list path;
     in_use = option_of_yojson (value_for_key count_of_yojson "inUse") _list path;
     remaining = option_of_yojson (value_for_key count_of_yojson "remaining") _list path;
     total_bandwidth =
       option_of_yojson (value_for_key bandwidth_of_yojson "totalBandwidth") _list path;
   }
    : rate_limiter_status)

let start_on_date_of_yojson = string_of_yojson
let state_of_yojson = string_of_yojson
let ckn_of_yojson = string_of_yojson
let secret_ar_n_of_yojson = string_of_yojson

let mac_sec_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_ar_n = option_of_yojson (value_for_key secret_ar_n_of_yojson "secretARN") _list path;
     ckn = option_of_yojson (value_for_key ckn_of_yojson "ckn") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "state") _list path;
     start_on = option_of_yojson (value_for_key start_on_date_of_yojson "startOn") _list path;
   }
    : mac_sec_key)

let mac_sec_key_list_of_yojson tree path = list_of_yojson mac_sec_key_of_yojson tree path
let encryption_mode_of_yojson = string_of_yojson
let port_encryption_status_of_yojson = string_of_yojson
let mac_sec_capable_of_yojson = bool_of_yojson
let provider_name_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let has_logical_redundancy_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknown" -> Unknown
    | `String "yes" -> Yes
    | `String "no" -> No
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HasLogicalRedundancy" value)
    | _ -> raise (deserialize_wrong_type_error path "HasLogicalRedundancy")
     : has_logical_redundancy)
    : has_logical_redundancy)

let aws_logical_device_id_of_yojson = string_of_yojson
let aws_device_v2_of_yojson = string_of_yojson
let jumbo_frame_capable_of_yojson = bool_of_yojson
let aws_device_of_yojson = string_of_yojson
let lag_id_of_yojson = string_of_yojson
let loa_issue_time_of_yojson = timestamp_epoch_seconds_of_yojson
let partner_name_of_yojson = string_of_yojson
let vla_n_of_yojson = int_of_yojson
let location_code_of_yojson = string_of_yojson

let connection_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ordering" -> Ordering
    | `String "requested" -> Requested
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "down" -> Down
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String "rejected" -> Rejected
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionState")
     : connection_state)
    : connection_state)

let connection_name_of_yojson = string_of_yojson
let connection_id_of_yojson = string_of_yojson

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "connectionName") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "connectionState") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     location = option_of_yojson (value_for_key location_code_of_yojson "location") _list path;
     bandwidth = option_of_yojson (value_for_key bandwidth_of_yojson "bandwidth") _list path;
     vlan = option_of_yojson (value_for_key vla_n_of_yojson "vlan") _list path;
     partner_name = option_of_yojson (value_for_key partner_name_of_yojson "partnerName") _list path;
     loa_issue_time =
       option_of_yojson (value_for_key loa_issue_time_of_yojson "loaIssueTime") _list path;
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     aws_device = option_of_yojson (value_for_key aws_device_of_yojson "awsDevice") _list path;
     jumbo_frame_capable =
       option_of_yojson (value_for_key jumbo_frame_capable_of_yojson "jumboFrameCapable") _list path;
     aws_device_v2 =
       option_of_yojson (value_for_key aws_device_v2_of_yojson "awsDeviceV2") _list path;
     aws_logical_device_id =
       option_of_yojson
         (value_for_key aws_logical_device_id_of_yojson "awsLogicalDeviceId")
         _list path;
     has_logical_redundancy =
       option_of_yojson
         (value_for_key has_logical_redundancy_of_yojson "hasLogicalRedundancy")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     mac_sec_capable =
       option_of_yojson (value_for_key mac_sec_capable_of_yojson "macSecCapable") _list path;
     port_encryption_status =
       option_of_yojson
         (value_for_key port_encryption_status_of_yojson "portEncryptionStatus")
         _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_of_yojson "encryptionMode") _list path;
     mac_sec_keys =
       option_of_yojson (value_for_key mac_sec_key_list_of_yojson "macSecKeys") _list path;
     rate_limiter_status =
       option_of_yojson (value_for_key rate_limiter_status_of_yojson "rateLimiterStatus") _list path;
     partner_interconnect_mac_sec_capable =
       option_of_yojson
         (value_for_key partner_interconnect_mac_sec_capable_of_yojson
            "partnerInterconnectMacSecCapable")
         _list path;
   }
    : connection)

let interconnect_id_of_yojson = string_of_yojson

let allocate_connection_on_interconnect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth = value_for_key bandwidth_of_yojson "bandwidth" _list path;
     connection_name = value_for_key connection_name_of_yojson "connectionName" _list path;
     owner_account = value_for_key owner_account_of_yojson "ownerAccount" _list path;
     interconnect_id = value_for_key interconnect_id_of_yojson "interconnectId" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
   }
    : allocate_connection_on_interconnect_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : too_many_tags_exception)

let duplicate_tag_keys_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : duplicate_tag_keys_exception)

let allocate_hosted_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     owner_account = value_for_key owner_account_of_yojson "ownerAccount" _list path;
     bandwidth = value_for_key bandwidth_of_yojson "bandwidth" _list path;
     connection_name = value_for_key connection_name_of_yojson "connectionName" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : allocate_hosted_connection_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let rate_limit_of_yojson = string_of_yojson
let site_link_enabled_of_yojson = bool_of_yojson

let bgp_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "up" -> Up
    | `String "down" -> Down
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "BGPStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BGPStatus")
     : bgp_status)
    : bgp_status)

let bgp_peer_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "verifying" -> Verifying
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String value -> raise (deserialize_unknown_enum_value_error path "BGPPeerState" value)
    | _ -> raise (deserialize_wrong_type_error path "BGPPeerState")
     : bgp_peer_state)
    : bgp_peer_state)

let customer_address_of_yojson = string_of_yojson
let amazon_address_of_yojson = string_of_yojson
let bgp_auth_key_of_yojson = string_of_yojson
let long_asn_of_yojson = long_of_yojson
let bgp_peer_id_of_yojson = string_of_yojson

let bgp_peer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bgp_peer_id = option_of_yojson (value_for_key bgp_peer_id_of_yojson "bgpPeerId") _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     bgp_peer_state =
       option_of_yojson (value_for_key bgp_peer_state_of_yojson "bgpPeerState") _list path;
     bgp_status = option_of_yojson (value_for_key bgp_status_of_yojson "bgpStatus") _list path;
     aws_device_v2 =
       option_of_yojson (value_for_key aws_device_v2_of_yojson "awsDeviceV2") _list path;
     aws_logical_device_id =
       option_of_yojson
         (value_for_key aws_logical_device_id_of_yojson "awsLogicalDeviceId")
         _list path;
   }
    : bgp_peer)

let bgp_peer_list_of_yojson tree path = list_of_yojson bgp_peer_of_yojson tree path
let mt_u_of_yojson = int_of_yojson
let router_config_of_yojson = string_of_yojson

let virtual_interface_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "confirming" -> Confirming
    | `String "verifying" -> Verifying
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "down" -> Down
    | `String "testing" -> Testing
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String "rejected" -> Rejected
    | `String "unknown" -> Unknown
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VirtualInterfaceState" value)
    | _ -> raise (deserialize_wrong_type_error path "VirtualInterfaceState")
     : virtual_interface_state)
    : virtual_interface_state)

let virtual_interface_name_of_yojson = string_of_yojson
let virtual_interface_type_of_yojson = string_of_yojson
let virtual_interface_id_of_yojson = string_of_yojson

let virtual_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     location = option_of_yojson (value_for_key location_code_of_yojson "location") _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     virtual_interface_type =
       option_of_yojson
         (value_for_key virtual_interface_type_of_yojson "virtualInterfaceType")
         _list path;
     virtual_interface_name =
       option_of_yojson
         (value_for_key virtual_interface_name_of_yojson "virtualInterfaceName")
         _list path;
     vlan = option_of_yojson (value_for_key vla_n_of_yojson "vlan") _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     amazon_side_asn =
       option_of_yojson (value_for_key long_asn_of_yojson "amazonSideAsn") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     virtual_interface_state =
       option_of_yojson
         (value_for_key virtual_interface_state_of_yojson "virtualInterfaceState")
         _list path;
     customer_router_config =
       option_of_yojson (value_for_key router_config_of_yojson "customerRouterConfig") _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     jumbo_frame_capable =
       option_of_yojson (value_for_key jumbo_frame_capable_of_yojson "jumboFrameCapable") _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     route_filter_prefixes =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson "routeFilterPrefixes")
         _list path;
     bgp_peers = option_of_yojson (value_for_key bgp_peer_list_of_yojson "bgpPeers") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     aws_device_v2 =
       option_of_yojson (value_for_key aws_device_v2_of_yojson "awsDeviceV2") _list path;
     aws_logical_device_id =
       option_of_yojson
         (value_for_key aws_logical_device_id_of_yojson "awsLogicalDeviceId")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     site_link_enabled =
       option_of_yojson (value_for_key site_link_enabled_of_yojson "siteLinkEnabled") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : virtual_interface)

let new_private_virtual_interface_allocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       value_for_key virtual_interface_name_of_yojson "virtualInterfaceName" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_private_virtual_interface_allocation)

let allocate_private_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     owner_account = value_for_key owner_account_of_yojson "ownerAccount" _list path;
     new_private_virtual_interface_allocation =
       value_for_key new_private_virtual_interface_allocation_of_yojson
         "newPrivateVirtualInterfaceAllocation" _list path;
   }
    : allocate_private_virtual_interface_request)

let new_public_virtual_interface_allocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       value_for_key virtual_interface_name_of_yojson "virtualInterfaceName" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     route_filter_prefixes =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson "routeFilterPrefixes")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_public_virtual_interface_allocation)

let allocate_public_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     owner_account = value_for_key owner_account_of_yojson "ownerAccount" _list path;
     new_public_virtual_interface_allocation =
       value_for_key new_public_virtual_interface_allocation_of_yojson
         "newPublicVirtualInterfaceAllocation" _list path;
   }
    : allocate_public_virtual_interface_request)

let allocate_transit_virtual_interface_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface =
       option_of_yojson (value_for_key virtual_interface_of_yojson "virtualInterface") _list path;
   }
    : allocate_transit_virtual_interface_result)

let new_transit_virtual_interface_allocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       option_of_yojson
         (value_for_key virtual_interface_name_of_yojson "virtualInterfaceName")
         _list path;
     vlan = option_of_yojson (value_for_key vla_n_of_yojson "vlan") _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_transit_virtual_interface_allocation)

let allocate_transit_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     owner_account = value_for_key owner_account_of_yojson "ownerAccount" _list path;
     new_transit_virtual_interface_allocation =
       value_for_key new_transit_virtual_interface_allocation_of_yojson
         "newTransitVirtualInterfaceAllocation" _list path;
   }
    : allocate_transit_virtual_interface_request)

let associate_connection_with_lag_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     lag_id = value_for_key lag_id_of_yojson "lagId" _list path;
   }
    : associate_connection_with_lag_request)

let associate_hosted_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     parent_connection_id = value_for_key connection_id_of_yojson "parentConnectionId" _list path;
   }
    : associate_hosted_connection_request)

let associate_mac_sec_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     mac_sec_keys =
       option_of_yojson (value_for_key mac_sec_key_list_of_yojson "macSecKeys") _list path;
   }
    : associate_mac_sec_key_response)

let cak_of_yojson = string_of_yojson

let associate_mac_sec_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     secret_ar_n = option_of_yojson (value_for_key secret_ar_n_of_yojson "secretARN") _list path;
     ckn = option_of_yojson (value_for_key ckn_of_yojson "ckn") _list path;
     cak = option_of_yojson (value_for_key cak_of_yojson "cak") _list path;
   }
    : associate_mac_sec_key_request)

let associate_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
   }
    : associate_virtual_interface_request)

let associated_gateway_id_of_yojson = string_of_yojson
let port_speed_of_yojson = string_of_yojson

let available_mac_sec_port_speeds_of_yojson tree path =
  list_of_yojson port_speed_of_yojson tree path

let available_port_speeds_of_yojson tree path = list_of_yojson port_speed_of_yojson tree path
let bgp_peer_id_list_of_yojson tree path = list_of_yojson bgp_peer_id_of_yojson tree path
let boolean_flag_of_yojson = bool_of_yojson

let confirm_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "connectionState") _list path;
   }
    : confirm_connection_response)

let confirm_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_id = value_for_key connection_id_of_yojson "connectionId" _list path }
    : confirm_connection_request)

let confirm_customer_agreement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key status_of_yojson "status") _list path }
    : confirm_customer_agreement_response)

let confirm_customer_agreement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_name =
       option_of_yojson (value_for_key agreement_name_of_yojson "agreementName") _list path;
   }
    : confirm_customer_agreement_request)

let confirm_private_virtual_interface_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_state =
       option_of_yojson
         (value_for_key virtual_interface_state_of_yojson "virtualInterfaceState")
         _list path;
   }
    : confirm_private_virtual_interface_response)

let confirm_private_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
   }
    : confirm_private_virtual_interface_request)

let confirm_public_virtual_interface_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_state =
       option_of_yojson
         (value_for_key virtual_interface_state_of_yojson "virtualInterfaceState")
         _list path;
   }
    : confirm_public_virtual_interface_response)

let confirm_public_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
   }
    : confirm_public_virtual_interface_request)

let confirm_transit_virtual_interface_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_state =
       option_of_yojson
         (value_for_key virtual_interface_state_of_yojson "virtualInterfaceState")
         _list path;
   }
    : confirm_transit_virtual_interface_response)

let confirm_transit_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
   }
    : confirm_transit_virtual_interface_request)

let connection_list_of_yojson tree path = list_of_yojson connection_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let connections_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connections =
       option_of_yojson (value_for_key connection_list_of_yojson "connections") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : connections)

let create_bgp_peer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface =
       option_of_yojson (value_for_key virtual_interface_of_yojson "virtualInterface") _list path;
   }
    : create_bgp_peer_response)

let new_bgp_peer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
   }
    : new_bgp_peer)

let create_bgp_peer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     new_bgp_peer = option_of_yojson (value_for_key new_bgp_peer_of_yojson "newBGPPeer") _list path;
   }
    : create_bgp_peer_request)

let request_mac_sec_of_yojson = bool_of_yojson

let create_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = value_for_key location_code_of_yojson "location" _list path;
     bandwidth = value_for_key bandwidth_of_yojson "bandwidth" _list path;
     connection_name = value_for_key connection_name_of_yojson "connectionName" _list path;
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     request_mac_sec =
       option_of_yojson (value_for_key request_mac_sec_of_yojson "requestMACSec") _list path;
   }
    : create_connection_request)

let direct_connect_gateway_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DirectConnectGatewayState" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectConnectGatewayState")
     : direct_connect_gateway_state)
    : direct_connect_gateway_state)

let direct_connect_gateway_name_of_yojson = string_of_yojson

let direct_connect_gateway_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     direct_connect_gateway_name =
       option_of_yojson
         (value_for_key direct_connect_gateway_name_of_yojson "directConnectGatewayName")
         _list path;
     amazon_side_asn =
       option_of_yojson (value_for_key long_asn_of_yojson "amazonSideAsn") _list path;
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     direct_connect_gateway_state =
       option_of_yojson
         (value_for_key direct_connect_gateway_state_of_yojson "directConnectGatewayState")
         _list path;
     state_change_error =
       option_of_yojson (value_for_key state_change_error_of_yojson "stateChangeError") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : direct_connect_gateway)

let create_direct_connect_gateway_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway =
       option_of_yojson
         (value_for_key direct_connect_gateway_of_yojson "directConnectGateway")
         _list path;
   }
    : create_direct_connect_gateway_result)

let create_direct_connect_gateway_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_name =
       value_for_key direct_connect_gateway_name_of_yojson "directConnectGatewayName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     amazon_side_asn =
       option_of_yojson (value_for_key long_asn_of_yojson "amazonSideAsn") _list path;
   }
    : create_direct_connect_gateway_request)

let create_direct_connect_gateway_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_of_yojson
            "directConnectGatewayAssociation")
         _list path;
   }
    : create_direct_connect_gateway_association_result)

let gateway_id_to_associate_of_yojson = string_of_yojson

let create_direct_connect_gateway_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
     gateway_id =
       option_of_yojson (value_for_key gateway_id_to_associate_of_yojson "gatewayId") _list path;
     add_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "addAllowedPrefixesToDirectConnectGateway")
         _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
   }
    : create_direct_connect_gateway_association_request)

let direct_connect_gateway_association_proposal_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "requested" -> Requested
    | `String "accepted" -> Accepted
    | `String "deleted" -> Deleted
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectConnectGatewayAssociationProposalState"
             value)
    | _ -> raise (deserialize_wrong_type_error path "DirectConnectGatewayAssociationProposalState")
     : direct_connect_gateway_association_proposal_state)
    : direct_connect_gateway_association_proposal_state)

let direct_connect_gateway_association_proposal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proposal_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_id_of_yojson "proposalId")
         _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     direct_connect_gateway_owner_account =
       option_of_yojson
         (value_for_key owner_account_of_yojson "directConnectGatewayOwnerAccount")
         _list path;
     proposal_state =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_state_of_yojson "proposalState")
         _list path;
     associated_gateway =
       option_of_yojson (value_for_key associated_gateway_of_yojson "associatedGateway") _list path;
     existing_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "existingAllowedPrefixesToDirectConnectGateway")
         _list path;
     requested_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "requestedAllowedPrefixesToDirectConnectGateway")
         _list path;
   }
    : direct_connect_gateway_association_proposal)

let create_direct_connect_gateway_association_proposal_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association_proposal =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_of_yojson
            "directConnectGatewayAssociationProposal")
         _list path;
   }
    : create_direct_connect_gateway_association_proposal_result)

let create_direct_connect_gateway_association_proposal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
     direct_connect_gateway_owner_account =
       value_for_key owner_account_of_yojson "directConnectGatewayOwnerAccount" _list path;
     gateway_id = value_for_key gateway_id_to_associate_of_yojson "gatewayId" _list path;
     add_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "addAllowedPrefixesToDirectConnectGateway")
         _list path;
     remove_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "removeAllowedPrefixesToDirectConnectGateway")
         _list path;
   }
    : create_direct_connect_gateway_association_proposal_request)

let interconnect_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "requested" -> Requested
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "down" -> Down
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "InterconnectState" value)
    | _ -> raise (deserialize_wrong_type_error path "InterconnectState")
     : interconnect_state)
    : interconnect_state)

let interconnect_name_of_yojson = string_of_yojson

let interconnect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnect_id =
       option_of_yojson (value_for_key interconnect_id_of_yojson "interconnectId") _list path;
     interconnect_name =
       option_of_yojson (value_for_key interconnect_name_of_yojson "interconnectName") _list path;
     interconnect_state =
       option_of_yojson (value_for_key interconnect_state_of_yojson "interconnectState") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     location = option_of_yojson (value_for_key location_code_of_yojson "location") _list path;
     bandwidth = option_of_yojson (value_for_key bandwidth_of_yojson "bandwidth") _list path;
     loa_issue_time =
       option_of_yojson (value_for_key loa_issue_time_of_yojson "loaIssueTime") _list path;
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     aws_device = option_of_yojson (value_for_key aws_device_of_yojson "awsDevice") _list path;
     jumbo_frame_capable =
       option_of_yojson (value_for_key jumbo_frame_capable_of_yojson "jumboFrameCapable") _list path;
     aws_device_v2 =
       option_of_yojson (value_for_key aws_device_v2_of_yojson "awsDeviceV2") _list path;
     aws_logical_device_id =
       option_of_yojson
         (value_for_key aws_logical_device_id_of_yojson "awsLogicalDeviceId")
         _list path;
     has_logical_redundancy =
       option_of_yojson
         (value_for_key has_logical_redundancy_of_yojson "hasLogicalRedundancy")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     mac_sec_capable =
       option_of_yojson (value_for_key mac_sec_capable_of_yojson "macSecCapable") _list path;
     port_encryption_status =
       option_of_yojson
         (value_for_key port_encryption_status_of_yojson "portEncryptionStatus")
         _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_of_yojson "encryptionMode") _list path;
     mac_sec_keys =
       option_of_yojson (value_for_key mac_sec_key_list_of_yojson "macSecKeys") _list path;
   }
    : interconnect)

let create_interconnect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnect_name = value_for_key interconnect_name_of_yojson "interconnectName" _list path;
     bandwidth = value_for_key bandwidth_of_yojson "bandwidth" _list path;
     location = value_for_key location_code_of_yojson "location" _list path;
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     request_mac_sec =
       option_of_yojson (value_for_key request_mac_sec_of_yojson "requestMACSec") _list path;
   }
    : create_interconnect_request)

let lag_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "requested" -> Requested
    | `String "pending" -> Pending
    | `String "available" -> Available
    | `String "down" -> Down
    | `String "deleting" -> Deleting
    | `String "deleted" -> Deleted
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "LagState" value)
    | _ -> raise (deserialize_wrong_type_error path "LagState")
     : lag_state)
    : lag_state)

let lag_name_of_yojson = string_of_yojson

let lag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connections_bandwidth =
       option_of_yojson (value_for_key bandwidth_of_yojson "connectionsBandwidth") _list path;
     number_of_connections =
       option_of_yojson (value_for_key count_of_yojson "numberOfConnections") _list path;
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     lag_name = option_of_yojson (value_for_key lag_name_of_yojson "lagName") _list path;
     lag_state = option_of_yojson (value_for_key lag_state_of_yojson "lagState") _list path;
     location = option_of_yojson (value_for_key location_code_of_yojson "location") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     minimum_links = option_of_yojson (value_for_key count_of_yojson "minimumLinks") _list path;
     aws_device = option_of_yojson (value_for_key aws_device_of_yojson "awsDevice") _list path;
     aws_device_v2 =
       option_of_yojson (value_for_key aws_device_v2_of_yojson "awsDeviceV2") _list path;
     aws_logical_device_id =
       option_of_yojson
         (value_for_key aws_logical_device_id_of_yojson "awsLogicalDeviceId")
         _list path;
     connections =
       option_of_yojson (value_for_key connection_list_of_yojson "connections") _list path;
     allows_hosted_connections =
       option_of_yojson (value_for_key boolean_flag_of_yojson "allowsHostedConnections") _list path;
     jumbo_frame_capable =
       option_of_yojson (value_for_key jumbo_frame_capable_of_yojson "jumboFrameCapable") _list path;
     has_logical_redundancy =
       option_of_yojson
         (value_for_key has_logical_redundancy_of_yojson "hasLogicalRedundancy")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     mac_sec_capable =
       option_of_yojson (value_for_key mac_sec_capable_of_yojson "macSecCapable") _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_of_yojson "encryptionMode") _list path;
     mac_sec_keys =
       option_of_yojson (value_for_key mac_sec_key_list_of_yojson "macSecKeys") _list path;
     rate_limiter_status =
       option_of_yojson (value_for_key rate_limiter_status_of_yojson "rateLimiterStatus") _list path;
   }
    : lag)

let create_lag_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_connections = value_for_key count_of_yojson "numberOfConnections" _list path;
     location = value_for_key location_code_of_yojson "location" _list path;
     connections_bandwidth = value_for_key bandwidth_of_yojson "connectionsBandwidth" _list path;
     lag_name = value_for_key lag_name_of_yojson "lagName" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     child_connection_tags =
       option_of_yojson (value_for_key tag_list_of_yojson "childConnectionTags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     request_mac_sec =
       option_of_yojson (value_for_key request_mac_sec_of_yojson "requestMACSec") _list path;
   }
    : create_lag_request)

let enable_site_link_of_yojson = bool_of_yojson

let new_private_virtual_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       value_for_key virtual_interface_name_of_yojson "virtualInterfaceName" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     enable_site_link =
       option_of_yojson (value_for_key enable_site_link_of_yojson "enableSiteLink") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_private_virtual_interface)

let create_private_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     new_private_virtual_interface =
       value_for_key new_private_virtual_interface_of_yojson "newPrivateVirtualInterface" _list path;
   }
    : create_private_virtual_interface_request)

let new_public_virtual_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       value_for_key virtual_interface_name_of_yojson "virtualInterfaceName" _list path;
     vlan = value_for_key vla_n_of_yojson "vlan" _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     route_filter_prefixes =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson "routeFilterPrefixes")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_public_virtual_interface)

let create_public_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     new_public_virtual_interface =
       value_for_key new_public_virtual_interface_of_yojson "newPublicVirtualInterface" _list path;
   }
    : create_public_virtual_interface_request)

let create_transit_virtual_interface_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface =
       option_of_yojson (value_for_key virtual_interface_of_yojson "virtualInterface") _list path;
   }
    : create_transit_virtual_interface_result)

let new_transit_virtual_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_name =
       option_of_yojson
         (value_for_key virtual_interface_name_of_yojson "virtualInterfaceName")
         _list path;
     vlan = option_of_yojson (value_for_key vla_n_of_yojson "vlan") _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     auth_key = option_of_yojson (value_for_key bgp_auth_key_of_yojson "authKey") _list path;
     amazon_address =
       option_of_yojson (value_for_key amazon_address_of_yojson "amazonAddress") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     address_family =
       option_of_yojson (value_for_key address_family_of_yojson "addressFamily") _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     enable_site_link =
       option_of_yojson (value_for_key enable_site_link_of_yojson "enableSiteLink") _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : new_transit_virtual_interface)

let create_transit_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     new_transit_virtual_interface =
       value_for_key new_transit_virtual_interface_of_yojson "newTransitVirtualInterface" _list path;
   }
    : create_transit_virtual_interface_request)

let delete_bgp_peer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface =
       option_of_yojson (value_for_key virtual_interface_of_yojson "virtualInterface") _list path;
   }
    : delete_bgp_peer_response)

let delete_bgp_peer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     asn = option_of_yojson (value_for_key as_n_of_yojson "asn") _list path;
     asn_long = option_of_yojson (value_for_key long_asn_of_yojson "asnLong") _list path;
     customer_address =
       option_of_yojson (value_for_key customer_address_of_yojson "customerAddress") _list path;
     bgp_peer_id = option_of_yojson (value_for_key bgp_peer_id_of_yojson "bgpPeerId") _list path;
   }
    : delete_bgp_peer_request)

let delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_id = value_for_key connection_id_of_yojson "connectionId" _list path }
    : delete_connection_request)

let delete_direct_connect_gateway_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway =
       option_of_yojson
         (value_for_key direct_connect_gateway_of_yojson "directConnectGateway")
         _list path;
   }
    : delete_direct_connect_gateway_result)

let delete_direct_connect_gateway_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
   }
    : delete_direct_connect_gateway_request)

let delete_direct_connect_gateway_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_of_yojson
            "directConnectGatewayAssociation")
         _list path;
   }
    : delete_direct_connect_gateway_association_result)

let delete_direct_connect_gateway_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_id_of_yojson "associationId")
         _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
   }
    : delete_direct_connect_gateway_association_request)

let delete_direct_connect_gateway_association_proposal_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association_proposal =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_of_yojson
            "directConnectGatewayAssociationProposal")
         _list path;
   }
    : delete_direct_connect_gateway_association_proposal_result)

let delete_direct_connect_gateway_association_proposal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proposal_id =
       value_for_key direct_connect_gateway_association_proposal_id_of_yojson "proposalId" _list
         path;
   }
    : delete_direct_connect_gateway_association_proposal_request)

let delete_interconnect_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnect_state =
       option_of_yojson (value_for_key interconnect_state_of_yojson "interconnectState") _list path;
   }
    : delete_interconnect_response)

let delete_interconnect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ interconnect_id = value_for_key interconnect_id_of_yojson "interconnectId" _list path }
    : delete_interconnect_request)

let delete_lag_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ lag_id = value_for_key lag_id_of_yojson "lagId" _list path } : delete_lag_request)

let delete_virtual_interface_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_state =
       option_of_yojson
         (value_for_key virtual_interface_state_of_yojson "virtualInterfaceState")
         _list path;
   }
    : delete_virtual_interface_response)

let delete_virtual_interface_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
   }
    : delete_virtual_interface_request)

let loa_content_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "application/pdf" -> PDF
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoaContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "LoaContentType")
     : loa_content_type)
    : loa_content_type)

let loa_content_of_yojson = blob_of_yojson

let loa_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     loa_content = option_of_yojson (value_for_key loa_content_of_yojson "loaContent") _list path;
     loa_content_type =
       option_of_yojson (value_for_key loa_content_type_of_yojson "loaContentType") _list path;
   }
    : loa)

let describe_connection_loa_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ loa = option_of_yojson (value_for_key loa_of_yojson "loa") _list path }
    : describe_connection_loa_response)

let describe_connection_loa_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     loa_content_type =
       option_of_yojson (value_for_key loa_content_type_of_yojson "loaContentType") _list path;
   }
    : describe_connection_loa_request)

let max_result_set_size_of_yojson = int_of_yojson

let describe_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_connections_request)

let describe_connections_on_interconnect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ interconnect_id = value_for_key interconnect_id_of_yojson "interconnectId" _list path }
    : describe_connections_on_interconnect_request)

let nni_partner_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "v1" -> V1
    | `String "v2" -> V2
    | `String "nonPartner" -> NonPartner
    | `String value -> raise (deserialize_unknown_enum_value_error path "NniPartnerType" value)
    | _ -> raise (deserialize_wrong_type_error path "NniPartnerType")
     : nni_partner_type)
    : nni_partner_type)

let describe_customer_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreements = option_of_yojson (value_for_key agreement_list_of_yojson "agreements") _list path;
     nni_partner_type =
       option_of_yojson (value_for_key nni_partner_type_of_yojson "nniPartnerType") _list path;
   }
    : describe_customer_metadata_response)

let direct_connect_gateway_association_proposal_list_of_yojson tree path =
  list_of_yojson direct_connect_gateway_association_proposal_of_yojson tree path

let describe_direct_connect_gateway_association_proposals_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association_proposals =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_list_of_yojson
            "directConnectGatewayAssociationProposals")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateway_association_proposals_result)

let describe_direct_connect_gateway_association_proposals_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     proposal_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_proposal_id_of_yojson "proposalId")
         _list path;
     associated_gateway_id =
       option_of_yojson
         (value_for_key associated_gateway_id_of_yojson "associatedGatewayId")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateway_association_proposals_request)

let direct_connect_gateway_association_list_of_yojson tree path =
  list_of_yojson direct_connect_gateway_association_of_yojson tree path

let describe_direct_connect_gateway_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_associations =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_list_of_yojson
            "directConnectGatewayAssociations")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateway_associations_result)

let describe_direct_connect_gateway_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_id_of_yojson "associationId")
         _list path;
     associated_gateway_id =
       option_of_yojson
         (value_for_key associated_gateway_id_of_yojson "associatedGatewayId")
         _list path;
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
   }
    : describe_direct_connect_gateway_associations_request)

let direct_connect_gateway_attachment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TransitVirtualInterface" -> TransitVirtualInterface
    | `String "PrivateVirtualInterface" -> PrivateVirtualInterface
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DirectConnectGatewayAttachmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectConnectGatewayAttachmentType")
     : direct_connect_gateway_attachment_type)
    : direct_connect_gateway_attachment_type)

let direct_connect_gateway_attachment_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "attaching" -> Attaching
    | `String "attached" -> Attached
    | `String "detaching" -> Detaching
    | `String "detached" -> Detached
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectConnectGatewayAttachmentState" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectConnectGatewayAttachmentState")
     : direct_connect_gateway_attachment_state)
    : direct_connect_gateway_attachment_state)

let virtual_interface_region_of_yojson = string_of_yojson

let direct_connect_gateway_attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     virtual_interface_region =
       option_of_yojson
         (value_for_key virtual_interface_region_of_yojson "virtualInterfaceRegion")
         _list path;
     virtual_interface_owner_account =
       option_of_yojson
         (value_for_key owner_account_of_yojson "virtualInterfaceOwnerAccount")
         _list path;
     attachment_state =
       option_of_yojson
         (value_for_key direct_connect_gateway_attachment_state_of_yojson "attachmentState")
         _list path;
     attachment_type =
       option_of_yojson
         (value_for_key direct_connect_gateway_attachment_type_of_yojson "attachmentType")
         _list path;
     state_change_error =
       option_of_yojson (value_for_key state_change_error_of_yojson "stateChangeError") _list path;
   }
    : direct_connect_gateway_attachment)

let direct_connect_gateway_attachment_list_of_yojson tree path =
  list_of_yojson direct_connect_gateway_attachment_of_yojson tree path

let describe_direct_connect_gateway_attachments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_attachments =
       option_of_yojson
         (value_for_key direct_connect_gateway_attachment_list_of_yojson
            "directConnectGatewayAttachments")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateway_attachments_result)

let describe_direct_connect_gateway_attachments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateway_attachments_request)

let direct_connect_gateway_list_of_yojson tree path =
  list_of_yojson direct_connect_gateway_of_yojson tree path

let describe_direct_connect_gateways_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateways =
       option_of_yojson
         (value_for_key direct_connect_gateway_list_of_yojson "directConnectGateways")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateways_result)

let describe_direct_connect_gateways_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_direct_connect_gateways_request)

let describe_hosted_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_hosted_connections_request)

let describe_interconnect_loa_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ loa = option_of_yojson (value_for_key loa_of_yojson "loa") _list path }
    : describe_interconnect_loa_response)

let describe_interconnect_loa_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnect_id = value_for_key interconnect_id_of_yojson "interconnectId" _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     loa_content_type =
       option_of_yojson (value_for_key loa_content_type_of_yojson "loaContentType") _list path;
   }
    : describe_interconnect_loa_request)

let interconnect_list_of_yojson tree path = list_of_yojson interconnect_of_yojson tree path

let interconnects_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnects =
       option_of_yojson (value_for_key interconnect_list_of_yojson "interconnects") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : interconnects)

let describe_interconnects_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interconnect_id =
       option_of_yojson (value_for_key interconnect_id_of_yojson "interconnectId") _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_interconnects_request)

let lag_list_of_yojson tree path = list_of_yojson lag_of_yojson tree path

let lags_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lags = option_of_yojson (value_for_key lag_list_of_yojson "lags") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : lags)

let describe_lags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lag_id = option_of_yojson (value_for_key lag_id_of_yojson "lagId") _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_lags_request)

let describe_loa_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "providerName") _list path;
     loa_content_type =
       option_of_yojson (value_for_key loa_content_type_of_yojson "loaContentType") _list path;
   }
    : describe_loa_request)

let provider_list_of_yojson tree path = list_of_yojson provider_name_of_yojson tree path
let location_name_of_yojson = string_of_yojson

let location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_code =
       option_of_yojson (value_for_key location_code_of_yojson "locationCode") _list path;
     location_name =
       option_of_yojson (value_for_key location_name_of_yojson "locationName") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     available_port_speeds =
       option_of_yojson
         (value_for_key available_port_speeds_of_yojson "availablePortSpeeds")
         _list path;
     available_providers =
       option_of_yojson (value_for_key provider_list_of_yojson "availableProviders") _list path;
     available_mac_sec_port_speeds =
       option_of_yojson
         (value_for_key available_mac_sec_port_speeds_of_yojson "availableMacSecPortSpeeds")
         _list path;
   }
    : location)

let location_list_of_yojson tree path = list_of_yojson location_of_yojson tree path

let locations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ locations = option_of_yojson (value_for_key location_list_of_yojson "locations") _list path }
    : locations)

let router_type_identifier_of_yojson = string_of_yojson
let xslt_template_name_for_mac_sec_of_yojson = string_of_yojson
let xslt_template_name_of_yojson = string_of_yojson
let software_of_yojson = string_of_yojson
let platform_of_yojson = string_of_yojson
let vendor_of_yojson = string_of_yojson

let router_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor = option_of_yojson (value_for_key vendor_of_yojson "vendor") _list path;
     platform = option_of_yojson (value_for_key platform_of_yojson "platform") _list path;
     software = option_of_yojson (value_for_key software_of_yojson "software") _list path;
     xslt_template_name =
       option_of_yojson (value_for_key xslt_template_name_of_yojson "xsltTemplateName") _list path;
     xslt_template_name_for_mac_sec =
       option_of_yojson
         (value_for_key xslt_template_name_for_mac_sec_of_yojson "xsltTemplateNameForMacSec")
         _list path;
     router_type_identifier =
       option_of_yojson
         (value_for_key router_type_identifier_of_yojson "routerTypeIdentifier")
         _list path;
   }
    : router_type)

let describe_router_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_router_config =
       option_of_yojson (value_for_key router_config_of_yojson "customerRouterConfig") _list path;
     router = option_of_yojson (value_for_key router_type_of_yojson "router") _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     virtual_interface_name =
       option_of_yojson
         (value_for_key virtual_interface_name_of_yojson "virtualInterfaceName")
         _list path;
   }
    : describe_router_configuration_response)

let describe_router_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     router_type_identifier =
       option_of_yojson
         (value_for_key router_type_identifier_of_yojson "routerTypeIdentifier")
         _list path;
   }
    : describe_router_configuration_request)

let resource_arn_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let describe_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
   }
    : describe_tags_response)

let resource_arn_list_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let describe_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arns = value_for_key resource_arn_list_of_yojson "resourceArns" _list path }
    : describe_tags_request)

let virtual_gateway_state_of_yojson = string_of_yojson

let virtual_gateway_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_gateway_id =
       option_of_yojson (value_for_key virtual_gateway_id_of_yojson "virtualGatewayId") _list path;
     virtual_gateway_state =
       option_of_yojson
         (value_for_key virtual_gateway_state_of_yojson "virtualGatewayState")
         _list path;
   }
    : virtual_gateway)

let virtual_gateway_list_of_yojson tree path = list_of_yojson virtual_gateway_of_yojson tree path

let virtual_gateways_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_gateways =
       option_of_yojson (value_for_key virtual_gateway_list_of_yojson "virtualGateways") _list path;
   }
    : virtual_gateways)

let virtual_interface_list_of_yojson tree path =
  list_of_yojson virtual_interface_of_yojson tree path

let virtual_interfaces_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interfaces =
       option_of_yojson
         (value_for_key virtual_interface_list_of_yojson "virtualInterfaces")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : virtual_interfaces)

let describe_virtual_interfaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : describe_virtual_interfaces_request)

let disassociate_connection_from_lag_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     lag_id = value_for_key lag_id_of_yojson "lagId" _list path;
   }
    : disassociate_connection_from_lag_request)

let disassociate_mac_sec_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "connectionId") _list path;
     mac_sec_keys =
       option_of_yojson (value_for_key mac_sec_key_list_of_yojson "macSecKeys") _list path;
   }
    : disassociate_mac_sec_key_response)

let disassociate_mac_sec_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     secret_ar_n = value_for_key secret_ar_n_of_yojson "secretARN" _list path;
   }
    : disassociate_mac_sec_key_request)

let end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let failure_test_history_status_of_yojson = string_of_yojson
let start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let test_duration_of_yojson = int_of_yojson
let test_id_of_yojson = string_of_yojson

let virtual_interface_test_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_id = option_of_yojson (value_for_key test_id_of_yojson "testId") _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     bgp_peers = option_of_yojson (value_for_key bgp_peer_id_list_of_yojson "bgpPeers") _list path;
     status =
       option_of_yojson (value_for_key failure_test_history_status_of_yojson "status") _list path;
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     test_duration_in_minutes =
       option_of_yojson (value_for_key test_duration_of_yojson "testDurationInMinutes") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "endTime") _list path;
   }
    : virtual_interface_test_history)

let virtual_interface_test_history_list_of_yojson tree path =
  list_of_yojson virtual_interface_test_history_of_yojson tree path

let list_virtual_interface_test_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_test_history =
       option_of_yojson
         (value_for_key virtual_interface_test_history_list_of_yojson "virtualInterfaceTestHistory")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_virtual_interface_test_history_response)

let list_virtual_interface_test_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_id = option_of_yojson (value_for_key test_id_of_yojson "testId") _list path;
     virtual_interface_id =
       option_of_yojson
         (value_for_key virtual_interface_id_of_yojson "virtualInterfaceId")
         _list path;
     bgp_peers = option_of_yojson (value_for_key bgp_peer_id_list_of_yojson "bgpPeers") _list path;
     status =
       option_of_yojson (value_for_key failure_test_history_status_of_yojson "status") _list path;
     max_results =
       option_of_yojson (value_for_key max_result_set_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_virtual_interface_test_history_request)

let update_virtual_interface_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     mtu = option_of_yojson (value_for_key mt_u_of_yojson "mtu") _list path;
     enable_site_link =
       option_of_yojson (value_for_key enable_site_link_of_yojson "enableSiteLink") _list path;
     virtual_interface_name =
       option_of_yojson
         (value_for_key virtual_interface_name_of_yojson "virtualInterfaceName")
         _list path;
     rate_limit = option_of_yojson (value_for_key rate_limit_of_yojson "rateLimit") _list path;
   }
    : update_virtual_interface_attributes_request)

let update_lag_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lag_id = value_for_key lag_id_of_yojson "lagId" _list path;
     lag_name = option_of_yojson (value_for_key lag_name_of_yojson "lagName") _list path;
     minimum_links = option_of_yojson (value_for_key count_of_yojson "minimumLinks") _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_of_yojson "encryptionMode") _list path;
   }
    : update_lag_request)

let update_direct_connect_gateway_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_association =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_of_yojson
            "directConnectGatewayAssociation")
         _list path;
   }
    : update_direct_connect_gateway_association_result)

let update_direct_connect_gateway_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key direct_connect_gateway_association_id_of_yojson "associationId")
         _list path;
     add_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "addAllowedPrefixesToDirectConnectGateway")
         _list path;
     remove_allowed_prefixes_to_direct_connect_gateway =
       option_of_yojson
         (value_for_key route_filter_prefix_list_of_yojson
            "removeAllowedPrefixesToDirectConnectGateway")
         _list path;
   }
    : update_direct_connect_gateway_association_request)

let update_direct_connect_gateway_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway =
       option_of_yojson
         (value_for_key direct_connect_gateway_of_yojson "directConnectGateway")
         _list path;
   }
    : update_direct_connect_gateway_response)

let update_direct_connect_gateway_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_connect_gateway_id =
       value_for_key direct_connect_gateway_id_of_yojson "directConnectGatewayId" _list path;
     new_direct_connect_gateway_name =
       value_for_key direct_connect_gateway_name_of_yojson "newDirectConnectGatewayName" _list path;
   }
    : update_direct_connect_gateway_request)

let update_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_id = value_for_key connection_id_of_yojson "connectionId" _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "connectionName") _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_of_yojson "encryptionMode") _list path;
   }
    : update_connection_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let stop_bgp_failover_test_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_test =
       option_of_yojson
         (value_for_key virtual_interface_test_history_of_yojson "virtualInterfaceTest")
         _list path;
   }
    : stop_bgp_failover_test_response)

let stop_bgp_failover_test_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
   }
    : stop_bgp_failover_test_request)

let start_bgp_failover_test_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_test =
       option_of_yojson
         (value_for_key virtual_interface_test_history_of_yojson "virtualInterfaceTest")
         _list path;
   }
    : start_bgp_failover_test_response)

let start_bgp_failover_test_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_interface_id =
       value_for_key virtual_interface_id_of_yojson "virtualInterfaceId" _list path;
     bgp_peers = option_of_yojson (value_for_key bgp_peer_id_list_of_yojson "bgpPeers") _list path;
     test_duration_in_minutes =
       option_of_yojson (value_for_key test_duration_of_yojson "testDurationInMinutes") _list path;
   }
    : start_bgp_failover_test_request)
