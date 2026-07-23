open Types

let make_associated_core_network ?id:(id_ : core_network_identifier option)
    ?owner_account:(owner_account_ : owner_account option)
    ?attachment_id:(attachment_id_ : core_network_attachment_id option) () =
  ({ id = id_; owner_account = owner_account_; attachment_id = attachment_id_ }
    : associated_core_network)

let make_route_filter_prefix ?cidr:(cidr_ : cid_r option) () =
  ({ cidr = cidr_ } : route_filter_prefix)

let make_associated_gateway ?id:(id_ : gateway_identifier option)
    ?type_:(type__ : gateway_type option) ?owner_account:(owner_account_ : owner_account option)
    ?region:(region_ : region option) () =
  ({ id = id_; type_ = type__; owner_account = owner_account_; region = region_ }
    : associated_gateway)

let make_direct_connect_gateway_association
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?direct_connect_gateway_owner_account:
      (direct_connect_gateway_owner_account_ : owner_account option)
    ?association_state:(association_state_ : direct_connect_gateway_association_state option)
    ?state_change_error:(state_change_error_ : state_change_error option)
    ?associated_gateway:(associated_gateway_ : associated_gateway option)
    ?association_id:(association_id_ : direct_connect_gateway_association_id option)
    ?allowed_prefixes_to_direct_connect_gateway:
      (allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?associated_core_network:(associated_core_network_ : associated_core_network option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?virtual_gateway_region:(virtual_gateway_region_ : virtual_gateway_region option)
    ?virtual_gateway_owner_account:(virtual_gateway_owner_account_ : owner_account option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     association_state = association_state_;
     state_change_error = state_change_error_;
     associated_gateway = associated_gateway_;
     association_id = association_id_;
     allowed_prefixes_to_direct_connect_gateway = allowed_prefixes_to_direct_connect_gateway_;
     associated_core_network = associated_core_network_;
     virtual_gateway_id = virtual_gateway_id_;
     virtual_gateway_region = virtual_gateway_region_;
     virtual_gateway_owner_account = virtual_gateway_owner_account_;
   }
    : direct_connect_gateway_association)

let make_accept_direct_connect_gateway_association_proposal_request
    ?override_allowed_prefixes_to_direct_connect_gateway:
      (override_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id)
    ~proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id)
    ~associated_gateway_owner_account:(associated_gateway_owner_account_ : owner_account) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     proposal_id = proposal_id_;
     associated_gateway_owner_account = associated_gateway_owner_account_;
     override_allowed_prefixes_to_direct_connect_gateway =
       override_allowed_prefixes_to_direct_connect_gateway_;
   }
    : accept_direct_connect_gateway_association_proposal_request)

let make_customer_agreement ?agreement_name:(agreement_name_ : agreement_name option)
    ?status:(status_ : status option) () =
  ({ agreement_name = agreement_name_; status = status_ } : customer_agreement)

let make_rate_limiter_status ?max_allowed:(max_allowed_ : count option)
    ?in_use:(in_use_ : count option) ?remaining:(remaining_ : count option)
    ?total_bandwidth:(total_bandwidth_ : bandwidth option) () =
  ({
     max_allowed = max_allowed_;
     in_use = in_use_;
     remaining = remaining_;
     total_bandwidth = total_bandwidth_;
   }
    : rate_limiter_status)

let make_mac_sec_key ?secret_ar_n:(secret_ar_n_ : secret_ar_n option) ?ckn:(ckn_ : ckn option)
    ?state:(state_ : state option) ?start_on:(start_on_ : start_on_date option) () =
  ({ secret_ar_n = secret_ar_n_; ckn = ckn_; state = state_; start_on = start_on_ } : mac_sec_key)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_connection ?owner_account:(owner_account_ : owner_account option)
    ?connection_id:(connection_id_ : connection_id option)
    ?connection_name:(connection_name_ : connection_name option)
    ?connection_state:(connection_state_ : connection_state option)
    ?region:(region_ : region option) ?location:(location_ : location_code option)
    ?bandwidth:(bandwidth_ : bandwidth option) ?vlan:(vlan_ : vla_n option)
    ?partner_name:(partner_name_ : partner_name option)
    ?loa_issue_time:(loa_issue_time_ : loa_issue_time option) ?lag_id:(lag_id_ : lag_id option)
    ?aws_device:(aws_device_ : aws_device option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?tags:(tags_ : tag_list option) ?provider_name:(provider_name_ : provider_name option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?port_encryption_status:(port_encryption_status_ : port_encryption_status option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?rate_limiter_status:(rate_limiter_status_ : rate_limiter_status option)
    ?partner_interconnect_mac_sec_capable:
      (partner_interconnect_mac_sec_capable_ : partner_interconnect_mac_sec_capable option) () =
  ({
     owner_account = owner_account_;
     connection_id = connection_id_;
     connection_name = connection_name_;
     connection_state = connection_state_;
     region = region_;
     location = location_;
     bandwidth = bandwidth_;
     vlan = vlan_;
     partner_name = partner_name_;
     loa_issue_time = loa_issue_time_;
     lag_id = lag_id_;
     aws_device = aws_device_;
     jumbo_frame_capable = jumbo_frame_capable_;
     aws_device_v2 = aws_device_v2_;
     aws_logical_device_id = aws_logical_device_id_;
     has_logical_redundancy = has_logical_redundancy_;
     tags = tags_;
     provider_name = provider_name_;
     mac_sec_capable = mac_sec_capable_;
     port_encryption_status = port_encryption_status_;
     encryption_mode = encryption_mode_;
     mac_sec_keys = mac_sec_keys_;
     rate_limiter_status = rate_limiter_status_;
     partner_interconnect_mac_sec_capable = partner_interconnect_mac_sec_capable_;
   }
    : connection)

let make_allocate_connection_on_interconnect_request ~bandwidth:(bandwidth_ : bandwidth)
    ~connection_name:(connection_name_ : connection_name)
    ~owner_account:(owner_account_ : owner_account)
    ~interconnect_id:(interconnect_id_ : interconnect_id) ~vlan:(vlan_ : vla_n) () =
  ({
     bandwidth = bandwidth_;
     connection_name = connection_name_;
     owner_account = owner_account_;
     interconnect_id = interconnect_id_;
     vlan = vlan_;
   }
    : allocate_connection_on_interconnect_request)

let make_allocate_hosted_connection_request ?tags:(tags_ : tag_list option)
    ~connection_id:(connection_id_ : connection_id) ~owner_account:(owner_account_ : owner_account)
    ~bandwidth:(bandwidth_ : bandwidth) ~connection_name:(connection_name_ : connection_name)
    ~vlan:(vlan_ : vla_n) () =
  ({
     connection_id = connection_id_;
     owner_account = owner_account_;
     bandwidth = bandwidth_;
     connection_name = connection_name_;
     vlan = vlan_;
     tags = tags_;
   }
    : allocate_hosted_connection_request)

let make_bgp_peer ?bgp_peer_id:(bgp_peer_id_ : bgp_peer_id option) ?asn:(asn_ : as_n option)
    ?asn_long:(asn_long_ : long_asn option) ?auth_key:(auth_key_ : bgp_auth_key option)
    ?address_family:(address_family_ : address_family option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?bgp_peer_state:(bgp_peer_state_ : bgp_peer_state option)
    ?bgp_status:(bgp_status_ : bgp_status option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option) () =
  ({
     bgp_peer_id = bgp_peer_id_;
     asn = asn_;
     asn_long = asn_long_;
     auth_key = auth_key_;
     address_family = address_family_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     bgp_peer_state = bgp_peer_state_;
     bgp_status = bgp_status_;
     aws_device_v2 = aws_device_v2_;
     aws_logical_device_id = aws_logical_device_id_;
   }
    : bgp_peer)

let make_virtual_interface ?owner_account:(owner_account_ : owner_account option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?location:(location_ : location_code option)
    ?connection_id:(connection_id_ : connection_id option)
    ?virtual_interface_type:(virtual_interface_type_ : virtual_interface_type option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?vlan:(vlan_ : vla_n option) ?asn:(asn_ : as_n option) ?asn_long:(asn_long_ : long_asn option)
    ?amazon_side_asn:(amazon_side_asn_ : long_asn option)
    ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option)
    ?customer_router_config:(customer_router_config_ : router_config option)
    ?mtu:(mtu_ : mt_u option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_list option) ?region:(region_ : region option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?tags:(tags_ : tag_list option)
    ?site_link_enabled:(site_link_enabled_ : site_link_enabled option)
    ?rate_limit:(rate_limit_ : rate_limit option) () =
  ({
     owner_account = owner_account_;
     virtual_interface_id = virtual_interface_id_;
     location = location_;
     connection_id = connection_id_;
     virtual_interface_type = virtual_interface_type_;
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     amazon_side_asn = amazon_side_asn_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     virtual_interface_state = virtual_interface_state_;
     customer_router_config = customer_router_config_;
     mtu = mtu_;
     jumbo_frame_capable = jumbo_frame_capable_;
     virtual_gateway_id = virtual_gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     route_filter_prefixes = route_filter_prefixes_;
     bgp_peers = bgp_peers_;
     region = region_;
     aws_device_v2 = aws_device_v2_;
     aws_logical_device_id = aws_logical_device_id_;
     tags = tags_;
     site_link_enabled = site_link_enabled_;
     rate_limit = rate_limit_;
   }
    : virtual_interface)

let make_new_private_virtual_interface_allocation ?asn:(asn_ : as_n option)
    ?asn_long:(asn_long_ : long_asn option) ?mtu:(mtu_ : mt_u option)
    ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option) ?tags:(tags_ : tag_list option)
    ?rate_limit:(rate_limit_ : rate_limit option)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) ~vlan:(vlan_ : vla_n)
    () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     mtu = mtu_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     address_family = address_family_;
     customer_address = customer_address_;
     tags = tags_;
     rate_limit = rate_limit_;
   }
    : new_private_virtual_interface_allocation)

let make_allocate_private_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~owner_account:(owner_account_ : owner_account)
    ~new_private_virtual_interface_allocation:
      (new_private_virtual_interface_allocation_ : new_private_virtual_interface_allocation) () =
  ({
     connection_id = connection_id_;
     owner_account = owner_account_;
     new_private_virtual_interface_allocation = new_private_virtual_interface_allocation_;
   }
    : allocate_private_virtual_interface_request)

let make_new_public_virtual_interface_allocation ?asn:(asn_ : as_n option)
    ?asn_long:(asn_long_ : long_asn option) ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?tags:(tags_ : tag_list option) ?rate_limit:(rate_limit_ : rate_limit option)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) ~vlan:(vlan_ : vla_n)
    () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     route_filter_prefixes = route_filter_prefixes_;
     tags = tags_;
     rate_limit = rate_limit_;
   }
    : new_public_virtual_interface_allocation)

let make_allocate_public_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~owner_account:(owner_account_ : owner_account)
    ~new_public_virtual_interface_allocation:
      (new_public_virtual_interface_allocation_ : new_public_virtual_interface_allocation) () =
  ({
     connection_id = connection_id_;
     owner_account = owner_account_;
     new_public_virtual_interface_allocation = new_public_virtual_interface_allocation_;
   }
    : allocate_public_virtual_interface_request)

let make_new_transit_virtual_interface_allocation
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?vlan:(vlan_ : vla_n option) ?asn:(asn_ : as_n option) ?asn_long:(asn_long_ : long_asn option)
    ?mtu:(mtu_ : mt_u option) ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option) ?tags:(tags_ : tag_list option)
    ?rate_limit:(rate_limit_ : rate_limit option) () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     mtu = mtu_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     tags = tags_;
     rate_limit = rate_limit_;
   }
    : new_transit_virtual_interface_allocation)

let make_allocate_transit_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~owner_account:(owner_account_ : owner_account)
    ~new_transit_virtual_interface_allocation:
      (new_transit_virtual_interface_allocation_ : new_transit_virtual_interface_allocation) () =
  ({
     connection_id = connection_id_;
     owner_account = owner_account_;
     new_transit_virtual_interface_allocation = new_transit_virtual_interface_allocation_;
   }
    : allocate_transit_virtual_interface_request)

let make_associate_connection_with_lag_request ~connection_id:(connection_id_ : connection_id)
    ~lag_id:(lag_id_ : lag_id) () =
  ({ connection_id = connection_id_; lag_id = lag_id_ } : associate_connection_with_lag_request)

let make_associate_hosted_connection_request ~connection_id:(connection_id_ : connection_id)
    ~parent_connection_id:(parent_connection_id_ : connection_id) () =
  ({ connection_id = connection_id_; parent_connection_id = parent_connection_id_ }
    : associate_hosted_connection_request)

let make_associate_mac_sec_key_response ?connection_id:(connection_id_ : connection_id option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option) () =
  ({ connection_id = connection_id_; mac_sec_keys = mac_sec_keys_ }
    : associate_mac_sec_key_response)

let make_associate_mac_sec_key_request ?secret_ar_n:(secret_ar_n_ : secret_ar_n option)
    ?ckn:(ckn_ : ckn option) ?cak:(cak_ : cak option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_; secret_ar_n = secret_ar_n_; ckn = ckn_; cak = cak_ }
    : associate_mac_sec_key_request)

let make_associate_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ virtual_interface_id = virtual_interface_id_; connection_id = connection_id_ }
    : associate_virtual_interface_request)

let make_confirm_connection_response ?connection_state:(connection_state_ : connection_state option)
    () =
  ({ connection_state = connection_state_ } : confirm_connection_response)

let make_confirm_connection_request ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_ } : confirm_connection_request)

let make_confirm_customer_agreement_response ?status:(status_ : status option) () =
  ({ status = status_ } : confirm_customer_agreement_response)

let make_confirm_customer_agreement_request
    ?agreement_name:(agreement_name_ : agreement_name option) () =
  ({ agreement_name = agreement_name_ } : confirm_customer_agreement_request)

let make_confirm_private_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_private_virtual_interface_response)

let make_confirm_private_virtual_interface_request
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     virtual_gateway_id = virtual_gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : confirm_private_virtual_interface_request)

let make_confirm_public_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_public_virtual_interface_response)

let make_confirm_public_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : confirm_public_virtual_interface_request)

let make_confirm_transit_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_transit_virtual_interface_response)

let make_confirm_transit_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : confirm_transit_virtual_interface_request)

let make_connections ?connections:(connections_ : connection_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ connections = connections_; next_token = next_token_ } : connections)

let make_create_bgp_peer_response ?virtual_interface:(virtual_interface_ : virtual_interface option)
    () =
  ({ virtual_interface = virtual_interface_ } : create_bgp_peer_response)

let make_new_bgp_peer ?asn:(asn_ : as_n option) ?asn_long:(asn_long_ : long_asn option)
    ?auth_key:(auth_key_ : bgp_auth_key option)
    ?address_family:(address_family_ : address_family option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option) () =
  ({
     asn = asn_;
     asn_long = asn_long_;
     auth_key = auth_key_;
     address_family = address_family_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
   }
    : new_bgp_peer)

let make_create_bgp_peer_request
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?new_bgp_peer:(new_bgp_peer_ : new_bgp_peer option) () =
  ({ virtual_interface_id = virtual_interface_id_; new_bgp_peer = new_bgp_peer_ }
    : create_bgp_peer_request)

let make_create_connection_request ?lag_id:(lag_id_ : lag_id option) ?tags:(tags_ : tag_list option)
    ?provider_name:(provider_name_ : provider_name option)
    ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ~location:(location_ : location_code) ~bandwidth:(bandwidth_ : bandwidth)
    ~connection_name:(connection_name_ : connection_name) () =
  ({
     location = location_;
     bandwidth = bandwidth_;
     connection_name = connection_name_;
     lag_id = lag_id_;
     tags = tags_;
     provider_name = provider_name_;
     request_mac_sec = request_mac_sec_;
   }
    : create_connection_request)

let make_direct_connect_gateway
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?direct_connect_gateway_name:(direct_connect_gateway_name_ : direct_connect_gateway_name option)
    ?amazon_side_asn:(amazon_side_asn_ : long_asn option)
    ?owner_account:(owner_account_ : owner_account option)
    ?direct_connect_gateway_state:
      (direct_connect_gateway_state_ : direct_connect_gateway_state option)
    ?state_change_error:(state_change_error_ : state_change_error option)
    ?tags:(tags_ : tag_list option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     direct_connect_gateway_name = direct_connect_gateway_name_;
     amazon_side_asn = amazon_side_asn_;
     owner_account = owner_account_;
     direct_connect_gateway_state = direct_connect_gateway_state_;
     state_change_error = state_change_error_;
     tags = tags_;
   }
    : direct_connect_gateway)

let make_create_direct_connect_gateway_request ?tags:(tags_ : tag_list option)
    ?amazon_side_asn:(amazon_side_asn_ : long_asn option)
    ~direct_connect_gateway_name:(direct_connect_gateway_name_ : direct_connect_gateway_name) () =
  ({
     direct_connect_gateway_name = direct_connect_gateway_name_;
     tags = tags_;
     amazon_side_asn = amazon_side_asn_;
   }
    : create_direct_connect_gateway_request)

let make_create_direct_connect_gateway_association_request
    ?gateway_id:(gateway_id_ : gateway_id_to_associate option)
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     gateway_id = gateway_id_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     virtual_gateway_id = virtual_gateway_id_;
   }
    : create_direct_connect_gateway_association_request)

let make_direct_connect_gateway_association_proposal
    ?proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?direct_connect_gateway_owner_account:
      (direct_connect_gateway_owner_account_ : owner_account option)
    ?proposal_state:(proposal_state_ : direct_connect_gateway_association_proposal_state option)
    ?associated_gateway:(associated_gateway_ : associated_gateway option)
    ?existing_allowed_prefixes_to_direct_connect_gateway:
      (existing_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?requested_allowed_prefixes_to_direct_connect_gateway:
      (requested_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option) () =
  ({
     proposal_id = proposal_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     proposal_state = proposal_state_;
     associated_gateway = associated_gateway_;
     existing_allowed_prefixes_to_direct_connect_gateway =
       existing_allowed_prefixes_to_direct_connect_gateway_;
     requested_allowed_prefixes_to_direct_connect_gateway =
       requested_allowed_prefixes_to_direct_connect_gateway_;
   }
    : direct_connect_gateway_association_proposal)

let make_create_direct_connect_gateway_association_proposal_request
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?remove_allowed_prefixes_to_direct_connect_gateway:
      (remove_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id)
    ~direct_connect_gateway_owner_account:(direct_connect_gateway_owner_account_ : owner_account)
    ~gateway_id:(gateway_id_ : gateway_id_to_associate) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     gateway_id = gateway_id_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     remove_allowed_prefixes_to_direct_connect_gateway =
       remove_allowed_prefixes_to_direct_connect_gateway_;
   }
    : create_direct_connect_gateway_association_proposal_request)

let make_interconnect ?interconnect_id:(interconnect_id_ : interconnect_id option)
    ?interconnect_name:(interconnect_name_ : interconnect_name option)
    ?interconnect_state:(interconnect_state_ : interconnect_state option)
    ?region:(region_ : region option) ?location:(location_ : location_code option)
    ?bandwidth:(bandwidth_ : bandwidth option)
    ?loa_issue_time:(loa_issue_time_ : loa_issue_time option) ?lag_id:(lag_id_ : lag_id option)
    ?aws_device:(aws_device_ : aws_device option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?tags:(tags_ : tag_list option) ?provider_name:(provider_name_ : provider_name option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?port_encryption_status:(port_encryption_status_ : port_encryption_status option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option) () =
  ({
     interconnect_id = interconnect_id_;
     interconnect_name = interconnect_name_;
     interconnect_state = interconnect_state_;
     region = region_;
     location = location_;
     bandwidth = bandwidth_;
     loa_issue_time = loa_issue_time_;
     lag_id = lag_id_;
     aws_device = aws_device_;
     jumbo_frame_capable = jumbo_frame_capable_;
     aws_device_v2 = aws_device_v2_;
     aws_logical_device_id = aws_logical_device_id_;
     has_logical_redundancy = has_logical_redundancy_;
     tags = tags_;
     provider_name = provider_name_;
     mac_sec_capable = mac_sec_capable_;
     port_encryption_status = port_encryption_status_;
     encryption_mode = encryption_mode_;
     mac_sec_keys = mac_sec_keys_;
   }
    : interconnect)

let make_create_interconnect_request ?lag_id:(lag_id_ : lag_id option)
    ?tags:(tags_ : tag_list option) ?provider_name:(provider_name_ : provider_name option)
    ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ~interconnect_name:(interconnect_name_ : interconnect_name) ~bandwidth:(bandwidth_ : bandwidth)
    ~location:(location_ : location_code) () =
  ({
     interconnect_name = interconnect_name_;
     bandwidth = bandwidth_;
     location = location_;
     lag_id = lag_id_;
     tags = tags_;
     provider_name = provider_name_;
     request_mac_sec = request_mac_sec_;
   }
    : create_interconnect_request)

let make_lag ?connections_bandwidth:(connections_bandwidth_ : bandwidth option)
    ?number_of_connections:(number_of_connections_ : count option) ?lag_id:(lag_id_ : lag_id option)
    ?owner_account:(owner_account_ : owner_account option) ?lag_name:(lag_name_ : lag_name option)
    ?lag_state:(lag_state_ : lag_state option) ?location:(location_ : location_code option)
    ?region:(region_ : region option) ?minimum_links:(minimum_links_ : count option)
    ?aws_device:(aws_device_ : aws_device option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?connections:(connections_ : connection_list option)
    ?allows_hosted_connections:(allows_hosted_connections_ : boolean_flag option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?tags:(tags_ : tag_list option) ?provider_name:(provider_name_ : provider_name option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?rate_limiter_status:(rate_limiter_status_ : rate_limiter_status option) () =
  ({
     connections_bandwidth = connections_bandwidth_;
     number_of_connections = number_of_connections_;
     lag_id = lag_id_;
     owner_account = owner_account_;
     lag_name = lag_name_;
     lag_state = lag_state_;
     location = location_;
     region = region_;
     minimum_links = minimum_links_;
     aws_device = aws_device_;
     aws_device_v2 = aws_device_v2_;
     aws_logical_device_id = aws_logical_device_id_;
     connections = connections_;
     allows_hosted_connections = allows_hosted_connections_;
     jumbo_frame_capable = jumbo_frame_capable_;
     has_logical_redundancy = has_logical_redundancy_;
     tags = tags_;
     provider_name = provider_name_;
     mac_sec_capable = mac_sec_capable_;
     encryption_mode = encryption_mode_;
     mac_sec_keys = mac_sec_keys_;
     rate_limiter_status = rate_limiter_status_;
   }
    : lag)

let make_create_lag_request ?connection_id:(connection_id_ : connection_id option)
    ?tags:(tags_ : tag_list option)
    ?child_connection_tags:(child_connection_tags_ : tag_list option)
    ?provider_name:(provider_name_ : provider_name option)
    ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ~number_of_connections:(number_of_connections_ : count) ~location:(location_ : location_code)
    ~connections_bandwidth:(connections_bandwidth_ : bandwidth) ~lag_name:(lag_name_ : lag_name) ()
    =
  ({
     number_of_connections = number_of_connections_;
     location = location_;
     connections_bandwidth = connections_bandwidth_;
     lag_name = lag_name_;
     connection_id = connection_id_;
     tags = tags_;
     child_connection_tags = child_connection_tags_;
     provider_name = provider_name_;
     request_mac_sec = request_mac_sec_;
   }
    : create_lag_request)

let make_new_private_virtual_interface ?asn:(asn_ : as_n option)
    ?asn_long:(asn_long_ : long_asn option) ?mtu:(mtu_ : mt_u option)
    ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?tags:(tags_ : tag_list option) ?enable_site_link:(enable_site_link_ : enable_site_link option)
    ?rate_limit:(rate_limit_ : rate_limit option)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) ~vlan:(vlan_ : vla_n)
    () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     mtu = mtu_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     virtual_gateway_id = virtual_gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     tags = tags_;
     enable_site_link = enable_site_link_;
     rate_limit = rate_limit_;
   }
    : new_private_virtual_interface)

let make_create_private_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~new_private_virtual_interface:(new_private_virtual_interface_ : new_private_virtual_interface)
    () =
  ({
     connection_id = connection_id_;
     new_private_virtual_interface = new_private_virtual_interface_;
   }
    : create_private_virtual_interface_request)

let make_new_public_virtual_interface ?asn:(asn_ : as_n option)
    ?asn_long:(asn_long_ : long_asn option) ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?tags:(tags_ : tag_list option) ?rate_limit:(rate_limit_ : rate_limit option)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) ~vlan:(vlan_ : vla_n)
    () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     route_filter_prefixes = route_filter_prefixes_;
     tags = tags_;
     rate_limit = rate_limit_;
   }
    : new_public_virtual_interface)

let make_create_public_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~new_public_virtual_interface:(new_public_virtual_interface_ : new_public_virtual_interface) ()
    =
  ({ connection_id = connection_id_; new_public_virtual_interface = new_public_virtual_interface_ }
    : create_public_virtual_interface_request)

let make_new_transit_virtual_interface
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?vlan:(vlan_ : vla_n option) ?asn:(asn_ : as_n option) ?asn_long:(asn_long_ : long_asn option)
    ?mtu:(mtu_ : mt_u option) ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?tags:(tags_ : tag_list option) ?enable_site_link:(enable_site_link_ : enable_site_link option)
    ?rate_limit:(rate_limit_ : rate_limit option) () =
  ({
     virtual_interface_name = virtual_interface_name_;
     vlan = vlan_;
     asn = asn_;
     asn_long = asn_long_;
     mtu = mtu_;
     auth_key = auth_key_;
     amazon_address = amazon_address_;
     customer_address = customer_address_;
     address_family = address_family_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     tags = tags_;
     enable_site_link = enable_site_link_;
     rate_limit = rate_limit_;
   }
    : new_transit_virtual_interface)

let make_create_transit_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~new_transit_virtual_interface:(new_transit_virtual_interface_ : new_transit_virtual_interface)
    () =
  ({
     connection_id = connection_id_;
     new_transit_virtual_interface = new_transit_virtual_interface_;
   }
    : create_transit_virtual_interface_request)

let make_delete_bgp_peer_response ?virtual_interface:(virtual_interface_ : virtual_interface option)
    () =
  ({ virtual_interface = virtual_interface_ } : delete_bgp_peer_response)

let make_delete_bgp_peer_request
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?asn:(asn_ : as_n option) ?asn_long:(asn_long_ : long_asn option)
    ?customer_address:(customer_address_ : customer_address option)
    ?bgp_peer_id:(bgp_peer_id_ : bgp_peer_id option) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     asn = asn_;
     asn_long = asn_long_;
     customer_address = customer_address_;
     bgp_peer_id = bgp_peer_id_;
   }
    : delete_bgp_peer_request)

let make_delete_connection_request ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_ } : delete_connection_request)

let make_delete_direct_connect_gateway_request
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({ direct_connect_gateway_id = direct_connect_gateway_id_ }
    : delete_direct_connect_gateway_request)

let make_delete_direct_connect_gateway_association_request
    ?association_id:(association_id_ : direct_connect_gateway_association_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option) () =
  ({
     association_id = association_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_gateway_id = virtual_gateway_id_;
   }
    : delete_direct_connect_gateway_association_request)

let make_delete_direct_connect_gateway_association_proposal_request
    ~proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id) () =
  ({ proposal_id = proposal_id_ } : delete_direct_connect_gateway_association_proposal_request)

let make_delete_interconnect_response
    ?interconnect_state:(interconnect_state_ : interconnect_state option) () =
  ({ interconnect_state = interconnect_state_ } : delete_interconnect_response)

let make_delete_interconnect_request ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({ interconnect_id = interconnect_id_ } : delete_interconnect_request)

let make_delete_lag_request ~lag_id:(lag_id_ : lag_id) () =
  ({ lag_id = lag_id_ } : delete_lag_request)

let make_delete_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ } : delete_virtual_interface_response)

let make_delete_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : delete_virtual_interface_request)

let make_loa ?loa_content:(loa_content_ : loa_content option)
    ?loa_content_type:(loa_content_type_ : loa_content_type option) () =
  ({ loa_content = loa_content_; loa_content_type = loa_content_type_ } : loa)

let make_describe_connection_loa_response ?loa:(loa_ : loa option) () =
  ({ loa = loa_ } : describe_connection_loa_response)

let make_describe_connection_loa_request ?provider_name:(provider_name_ : provider_name option)
    ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     connection_id = connection_id_;
     provider_name = provider_name_;
     loa_content_type = loa_content_type_;
   }
    : describe_connection_loa_request)

let make_describe_connections_request ?connection_id:(connection_id_ : connection_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ connection_id = connection_id_; max_results = max_results_; next_token = next_token_ }
    : describe_connections_request)

let make_describe_connections_on_interconnect_request
    ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({ interconnect_id = interconnect_id_ } : describe_connections_on_interconnect_request)

let make_describe_customer_metadata_response ?agreements:(agreements_ : agreement_list option)
    ?nni_partner_type:(nni_partner_type_ : nni_partner_type option) () =
  ({ agreements = agreements_; nni_partner_type = nni_partner_type_ }
    : describe_customer_metadata_response)

let make_describe_direct_connect_gateway_association_proposals_request
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id option)
    ?associated_gateway_id:(associated_gateway_id_ : associated_gateway_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     proposal_id = proposal_id_;
     associated_gateway_id = associated_gateway_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_direct_connect_gateway_association_proposals_request)

let make_describe_direct_connect_gateway_associations_request
    ?association_id:(association_id_ : direct_connect_gateway_association_id option)
    ?associated_gateway_id:(associated_gateway_id_ : associated_gateway_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option) () =
  ({
     association_id = association_id_;
     associated_gateway_id = associated_gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     max_results = max_results_;
     next_token = next_token_;
     virtual_gateway_id = virtual_gateway_id_;
   }
    : describe_direct_connect_gateway_associations_request)

let make_direct_connect_gateway_attachment
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?virtual_interface_region:(virtual_interface_region_ : virtual_interface_region option)
    ?virtual_interface_owner_account:(virtual_interface_owner_account_ : owner_account option)
    ?attachment_state:(attachment_state_ : direct_connect_gateway_attachment_state option)
    ?attachment_type:(attachment_type_ : direct_connect_gateway_attachment_type option)
    ?state_change_error:(state_change_error_ : state_change_error option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_interface_id = virtual_interface_id_;
     virtual_interface_region = virtual_interface_region_;
     virtual_interface_owner_account = virtual_interface_owner_account_;
     attachment_state = attachment_state_;
     attachment_type = attachment_type_;
     state_change_error = state_change_error_;
   }
    : direct_connect_gateway_attachment)

let make_describe_direct_connect_gateway_attachments_request
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_interface_id = virtual_interface_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_direct_connect_gateway_attachments_request)

let make_describe_direct_connect_gateways_request
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_direct_connect_gateways_request)

let make_describe_hosted_connections_request
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_; max_results = max_results_; next_token = next_token_ }
    : describe_hosted_connections_request)

let make_describe_interconnect_loa_response ?loa:(loa_ : loa option) () =
  ({ loa = loa_ } : describe_interconnect_loa_response)

let make_describe_interconnect_loa_request ?provider_name:(provider_name_ : provider_name option)
    ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({
     interconnect_id = interconnect_id_;
     provider_name = provider_name_;
     loa_content_type = loa_content_type_;
   }
    : describe_interconnect_loa_request)

let make_interconnects ?interconnects:(interconnects_ : interconnect_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ interconnects = interconnects_; next_token = next_token_ } : interconnects)

let make_describe_interconnects_request ?interconnect_id:(interconnect_id_ : interconnect_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ interconnect_id = interconnect_id_; max_results = max_results_; next_token = next_token_ }
    : describe_interconnects_request)

let make_lags ?lags:(lags_ : lag_list option) ?next_token:(next_token_ : pagination_token option) ()
    =
  ({ lags = lags_; next_token = next_token_ } : lags)

let make_describe_lags_request ?lag_id:(lag_id_ : lag_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ lag_id = lag_id_; max_results = max_results_; next_token = next_token_ }
    : describe_lags_request)

let make_describe_loa_request ?provider_name:(provider_name_ : provider_name option)
    ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     connection_id = connection_id_;
     provider_name = provider_name_;
     loa_content_type = loa_content_type_;
   }
    : describe_loa_request)

let make_location ?location_code:(location_code_ : location_code option)
    ?location_name:(location_name_ : location_name option) ?region:(region_ : region option)
    ?available_port_speeds:(available_port_speeds_ : available_port_speeds option)
    ?available_providers:(available_providers_ : provider_list option)
    ?available_mac_sec_port_speeds:
      (available_mac_sec_port_speeds_ : available_mac_sec_port_speeds option) () =
  ({
     location_code = location_code_;
     location_name = location_name_;
     region = region_;
     available_port_speeds = available_port_speeds_;
     available_providers = available_providers_;
     available_mac_sec_port_speeds = available_mac_sec_port_speeds_;
   }
    : location)

let make_locations ?locations:(locations_ : location_list option) () =
  ({ locations = locations_ } : locations)

let make_router_type ?vendor:(vendor_ : vendor option) ?platform:(platform_ : platform option)
    ?software:(software_ : software option)
    ?xslt_template_name:(xslt_template_name_ : xslt_template_name option)
    ?xslt_template_name_for_mac_sec:
      (xslt_template_name_for_mac_sec_ : xslt_template_name_for_mac_sec option)
    ?router_type_identifier:(router_type_identifier_ : router_type_identifier option) () =
  ({
     vendor = vendor_;
     platform = platform_;
     software = software_;
     xslt_template_name = xslt_template_name_;
     xslt_template_name_for_mac_sec = xslt_template_name_for_mac_sec_;
     router_type_identifier = router_type_identifier_;
   }
    : router_type)

let make_describe_router_configuration_response
    ?customer_router_config:(customer_router_config_ : router_config option)
    ?router:(router_ : router_type option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option) () =
  ({
     customer_router_config = customer_router_config_;
     router = router_;
     virtual_interface_id = virtual_interface_id_;
     virtual_interface_name = virtual_interface_name_;
   }
    : describe_router_configuration_response)

let make_describe_router_configuration_request
    ?router_type_identifier:(router_type_identifier_ : router_type_identifier option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     router_type_identifier = router_type_identifier_;
   }
    : describe_router_configuration_request)

let make_resource_tag ?resource_arn:(resource_arn_ : resource_arn option)
    ?tags:(tags_ : tag_list option) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : resource_tag)

let make_describe_tags_response ?resource_tags:(resource_tags_ : resource_tag_list option) () =
  ({ resource_tags = resource_tags_ } : describe_tags_response)

let make_describe_tags_request ~resource_arns:(resource_arns_ : resource_arn_list) () =
  ({ resource_arns = resource_arns_ } : describe_tags_request)

let make_virtual_gateway ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?virtual_gateway_state:(virtual_gateway_state_ : virtual_gateway_state option) () =
  ({ virtual_gateway_id = virtual_gateway_id_; virtual_gateway_state = virtual_gateway_state_ }
    : virtual_gateway)

let make_virtual_gateways ?virtual_gateways:(virtual_gateways_ : virtual_gateway_list option) () =
  ({ virtual_gateways = virtual_gateways_ } : virtual_gateways)

let make_virtual_interfaces
    ?virtual_interfaces:(virtual_interfaces_ : virtual_interface_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ virtual_interfaces = virtual_interfaces_; next_token = next_token_ } : virtual_interfaces)

let make_describe_virtual_interfaces_request ?connection_id:(connection_id_ : connection_id option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     connection_id = connection_id_;
     virtual_interface_id = virtual_interface_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_virtual_interfaces_request)

let make_disassociate_connection_from_lag_request ~connection_id:(connection_id_ : connection_id)
    ~lag_id:(lag_id_ : lag_id) () =
  ({ connection_id = connection_id_; lag_id = lag_id_ } : disassociate_connection_from_lag_request)

let make_disassociate_mac_sec_key_response ?connection_id:(connection_id_ : connection_id option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option) () =
  ({ connection_id = connection_id_; mac_sec_keys = mac_sec_keys_ }
    : disassociate_mac_sec_key_response)

let make_disassociate_mac_sec_key_request ~connection_id:(connection_id_ : connection_id)
    ~secret_ar_n:(secret_ar_n_ : secret_ar_n) () =
  ({ connection_id = connection_id_; secret_ar_n = secret_ar_n_ }
    : disassociate_mac_sec_key_request)

let make_virtual_interface_test_history ?test_id:(test_id_ : test_id option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ?status:(status_ : failure_test_history_status option)
    ?owner_account:(owner_account_ : owner_account option)
    ?test_duration_in_minutes:(test_duration_in_minutes_ : test_duration option)
    ?start_time:(start_time_ : start_time option) ?end_time:(end_time_ : end_time option) () =
  ({
     test_id = test_id_;
     virtual_interface_id = virtual_interface_id_;
     bgp_peers = bgp_peers_;
     status = status_;
     owner_account = owner_account_;
     test_duration_in_minutes = test_duration_in_minutes_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : virtual_interface_test_history)

let make_list_virtual_interface_test_history_response
    ?virtual_interface_test_history:
      (virtual_interface_test_history_ : virtual_interface_test_history_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ virtual_interface_test_history = virtual_interface_test_history_; next_token = next_token_ }
    : list_virtual_interface_test_history_response)

let make_list_virtual_interface_test_history_request ?test_id:(test_id_ : test_id option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ?status:(status_ : failure_test_history_status option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     test_id = test_id_;
     virtual_interface_id = virtual_interface_id_;
     bgp_peers = bgp_peers_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_virtual_interface_test_history_request)

let make_update_virtual_interface_attributes_request ?mtu:(mtu_ : mt_u option)
    ?enable_site_link:(enable_site_link_ : enable_site_link option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?rate_limit:(rate_limit_ : rate_limit option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     mtu = mtu_;
     enable_site_link = enable_site_link_;
     virtual_interface_name = virtual_interface_name_;
     rate_limit = rate_limit_;
   }
    : update_virtual_interface_attributes_request)

let make_update_lag_request ?lag_name:(lag_name_ : lag_name option)
    ?minimum_links:(minimum_links_ : count option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option) ~lag_id:(lag_id_ : lag_id) () =
  ({
     lag_id = lag_id_;
     lag_name = lag_name_;
     minimum_links = minimum_links_;
     encryption_mode = encryption_mode_;
   }
    : update_lag_request)

let make_update_direct_connect_gateway_association_request
    ?association_id:(association_id_ : direct_connect_gateway_association_id option)
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?remove_allowed_prefixes_to_direct_connect_gateway:
      (remove_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option) () =
  ({
     association_id = association_id_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     remove_allowed_prefixes_to_direct_connect_gateway =
       remove_allowed_prefixes_to_direct_connect_gateway_;
   }
    : update_direct_connect_gateway_association_request)

let make_update_direct_connect_gateway_response
    ?direct_connect_gateway:(direct_connect_gateway_ : direct_connect_gateway option) () =
  ({ direct_connect_gateway = direct_connect_gateway_ } : update_direct_connect_gateway_response)

let make_update_direct_connect_gateway_request
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id)
    ~new_direct_connect_gateway_name:
      (new_direct_connect_gateway_name_ : direct_connect_gateway_name) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     new_direct_connect_gateway_name = new_direct_connect_gateway_name_;
   }
    : update_direct_connect_gateway_request)

let make_update_connection_request ?connection_name:(connection_name_ : connection_name option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     connection_id = connection_id_;
     connection_name = connection_name_;
     encryption_mode = encryption_mode_;
   }
    : update_connection_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_bgp_failover_test_response
    ?virtual_interface_test:(virtual_interface_test_ : virtual_interface_test_history option) () =
  ({ virtual_interface_test = virtual_interface_test_ } : stop_bgp_failover_test_response)

let make_stop_bgp_failover_test_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : stop_bgp_failover_test_request)

let make_start_bgp_failover_test_response
    ?virtual_interface_test:(virtual_interface_test_ : virtual_interface_test_history option) () =
  ({ virtual_interface_test = virtual_interface_test_ } : start_bgp_failover_test_response)

let make_start_bgp_failover_test_request ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ?test_duration_in_minutes:(test_duration_in_minutes_ : test_duration option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     virtual_interface_id = virtual_interface_id_;
     bgp_peers = bgp_peers_;
     test_duration_in_minutes = test_duration_in_minutes_;
   }
    : start_bgp_failover_test_request)
