open Types

let make_route_filter_prefix ?cidr:(cidr_ : cid_r option) () =
  ({ cidr = cidr_ } : route_filter_prefix)

let make_bgp_peer ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?bgp_status:(bgp_status_ : bgp_status option)
    ?bgp_peer_state:(bgp_peer_state_ : bgp_peer_state option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?address_family:(address_family_ : address_family option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?asn_long:(asn_long_ : long_asn option)
    ?asn:(asn_ : as_n option) ?bgp_peer_id:(bgp_peer_id_ : bgp_peer_id option) () =
  ({
     aws_logical_device_id = aws_logical_device_id_;
     aws_device_v2 = aws_device_v2_;
     bgp_status = bgp_status_;
     bgp_peer_state = bgp_peer_state_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     address_family = address_family_;
     auth_key = auth_key_;
     asn_long = asn_long_;
     asn = asn_;
     bgp_peer_id = bgp_peer_id_;
   }
    : bgp_peer)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_virtual_interface ?rate_limit:(rate_limit_ : rate_limit option)
    ?site_link_enabled:(site_link_enabled_ : site_link_enabled option)
    ?tags:(tags_ : tag_list option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option) ?region:(region_ : region option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_list option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?mtu:(mtu_ : mt_u option)
    ?customer_router_config:(customer_router_config_ : router_config option)
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option)
    ?amazon_side_asn:(amazon_side_asn_ : long_asn option) ?asn_long:(asn_long_ : long_asn option)
    ?asn:(asn_ : as_n option) ?vlan:(vlan_ : vla_n option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?virtual_interface_type:(virtual_interface_type_ : virtual_interface_type option)
    ?connection_id:(connection_id_ : connection_id option)
    ?location:(location_ : location_code option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?owner_account:(owner_account_ : owner_account option) () =
  ({
     rate_limit = rate_limit_;
     site_link_enabled = site_link_enabled_;
     tags = tags_;
     aws_logical_device_id = aws_logical_device_id_;
     aws_device_v2 = aws_device_v2_;
     region = region_;
     bgp_peers = bgp_peers_;
     route_filter_prefixes = route_filter_prefixes_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_gateway_id = virtual_gateway_id_;
     jumbo_frame_capable = jumbo_frame_capable_;
     mtu = mtu_;
     customer_router_config = customer_router_config_;
     virtual_interface_state = virtual_interface_state_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     amazon_side_asn = amazon_side_asn_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
     virtual_interface_type = virtual_interface_type_;
     connection_id = connection_id_;
     location = location_;
     virtual_interface_id = virtual_interface_id_;
     owner_account = owner_account_;
   }
    : virtual_interface)

let make_virtual_interfaces ?next_token:(next_token_ : pagination_token option)
    ?virtual_interfaces:(virtual_interfaces_ : virtual_interface_list option) () =
  ({ next_token = next_token_; virtual_interfaces = virtual_interfaces_ } : virtual_interfaces)

let make_virtual_interface_test_history ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option)
    ?test_duration_in_minutes:(test_duration_in_minutes_ : test_duration option)
    ?owner_account:(owner_account_ : owner_account option)
    ?status:(status_ : failure_test_history_status option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?test_id:(test_id_ : test_id option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     test_duration_in_minutes = test_duration_in_minutes_;
     owner_account = owner_account_;
     status = status_;
     bgp_peers = bgp_peers_;
     virtual_interface_id = virtual_interface_id_;
     test_id = test_id_;
   }
    : virtual_interface_test_history)

let make_virtual_gateway
    ?virtual_gateway_state:(virtual_gateway_state_ : virtual_gateway_state option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option) () =
  ({ virtual_gateway_state = virtual_gateway_state_; virtual_gateway_id = virtual_gateway_id_ }
    : virtual_gateway)

let make_virtual_gateways ?virtual_gateways:(virtual_gateways_ : virtual_gateway_list option) () =
  ({ virtual_gateways = virtual_gateways_ } : virtual_gateways)

let make_update_virtual_interface_attributes_request ?rate_limit:(rate_limit_ : rate_limit option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?enable_site_link:(enable_site_link_ : enable_site_link option) ?mtu:(mtu_ : mt_u option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     rate_limit = rate_limit_;
     virtual_interface_name = virtual_interface_name_;
     enable_site_link = enable_site_link_;
     mtu = mtu_;
     virtual_interface_id = virtual_interface_id_;
   }
    : update_virtual_interface_attributes_request)

let make_update_lag_request ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?minimum_links:(minimum_links_ : count option) ?lag_name:(lag_name_ : lag_name option)
    ~lag_id:(lag_id_ : lag_id) () =
  ({
     encryption_mode = encryption_mode_;
     minimum_links = minimum_links_;
     lag_name = lag_name_;
     lag_id = lag_id_;
   }
    : update_lag_request)

let make_mac_sec_key ?start_on:(start_on_ : start_on_date option) ?state:(state_ : state option)
    ?ckn:(ckn_ : ckn option) ?secret_ar_n:(secret_ar_n_ : secret_ar_n option) () =
  ({ start_on = start_on_; state = state_; ckn = ckn_; secret_ar_n = secret_ar_n_ } : mac_sec_key)

let make_rate_limiter_status ?total_bandwidth:(total_bandwidth_ : bandwidth option)
    ?remaining:(remaining_ : count option) ?in_use:(in_use_ : count option)
    ?max_allowed:(max_allowed_ : count option) () =
  ({
     total_bandwidth = total_bandwidth_;
     remaining = remaining_;
     in_use = in_use_;
     max_allowed = max_allowed_;
   }
    : rate_limiter_status)

let make_connection
    ?partner_interconnect_mac_sec_capable:
      (partner_interconnect_mac_sec_capable_ : partner_interconnect_mac_sec_capable option)
    ?rate_limiter_status:(rate_limiter_status_ : rate_limiter_status option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?port_encryption_status:(port_encryption_status_ : port_encryption_status option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?provider_name:(provider_name_ : provider_name option) ?tags:(tags_ : tag_list option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?aws_device:(aws_device_ : aws_device option) ?lag_id:(lag_id_ : lag_id option)
    ?loa_issue_time:(loa_issue_time_ : loa_issue_time option)
    ?partner_name:(partner_name_ : partner_name option) ?vlan:(vlan_ : vla_n option)
    ?bandwidth:(bandwidth_ : bandwidth option) ?location:(location_ : location_code option)
    ?region:(region_ : region option)
    ?connection_state:(connection_state_ : connection_state option)
    ?connection_name:(connection_name_ : connection_name option)
    ?connection_id:(connection_id_ : connection_id option)
    ?owner_account:(owner_account_ : owner_account option) () =
  ({
     partner_interconnect_mac_sec_capable = partner_interconnect_mac_sec_capable_;
     rate_limiter_status = rate_limiter_status_;
     mac_sec_keys = mac_sec_keys_;
     encryption_mode = encryption_mode_;
     port_encryption_status = port_encryption_status_;
     mac_sec_capable = mac_sec_capable_;
     provider_name = provider_name_;
     tags = tags_;
     has_logical_redundancy = has_logical_redundancy_;
     aws_logical_device_id = aws_logical_device_id_;
     aws_device_v2 = aws_device_v2_;
     jumbo_frame_capable = jumbo_frame_capable_;
     aws_device = aws_device_;
     lag_id = lag_id_;
     loa_issue_time = loa_issue_time_;
     partner_name = partner_name_;
     vlan = vlan_;
     bandwidth = bandwidth_;
     location = location_;
     region = region_;
     connection_state = connection_state_;
     connection_name = connection_name_;
     connection_id = connection_id_;
     owner_account = owner_account_;
   }
    : connection)

let make_lag ?rate_limiter_status:(rate_limiter_status_ : rate_limiter_status option)
    ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?provider_name:(provider_name_ : provider_name option) ?tags:(tags_ : tag_list option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?allows_hosted_connections:(allows_hosted_connections_ : boolean_flag option)
    ?connections:(connections_ : connection_list option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?aws_device:(aws_device_ : aws_device option) ?minimum_links:(minimum_links_ : count option)
    ?region:(region_ : region option) ?location:(location_ : location_code option)
    ?lag_state:(lag_state_ : lag_state option) ?lag_name:(lag_name_ : lag_name option)
    ?owner_account:(owner_account_ : owner_account option) ?lag_id:(lag_id_ : lag_id option)
    ?number_of_connections:(number_of_connections_ : count option)
    ?connections_bandwidth:(connections_bandwidth_ : bandwidth option) () =
  ({
     rate_limiter_status = rate_limiter_status_;
     mac_sec_keys = mac_sec_keys_;
     encryption_mode = encryption_mode_;
     mac_sec_capable = mac_sec_capable_;
     provider_name = provider_name_;
     tags = tags_;
     has_logical_redundancy = has_logical_redundancy_;
     jumbo_frame_capable = jumbo_frame_capable_;
     allows_hosted_connections = allows_hosted_connections_;
     connections = connections_;
     aws_logical_device_id = aws_logical_device_id_;
     aws_device_v2 = aws_device_v2_;
     aws_device = aws_device_;
     minimum_links = minimum_links_;
     region = region_;
     location = location_;
     lag_state = lag_state_;
     lag_name = lag_name_;
     owner_account = owner_account_;
     lag_id = lag_id_;
     number_of_connections = number_of_connections_;
     connections_bandwidth = connections_bandwidth_;
   }
    : lag)

let make_direct_connect_gateway ?tags:(tags_ : tag_list option)
    ?state_change_error:(state_change_error_ : state_change_error option)
    ?direct_connect_gateway_state:
      (direct_connect_gateway_state_ : direct_connect_gateway_state option)
    ?owner_account:(owner_account_ : owner_account option)
    ?amazon_side_asn:(amazon_side_asn_ : long_asn option)
    ?direct_connect_gateway_name:(direct_connect_gateway_name_ : direct_connect_gateway_name option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     tags = tags_;
     state_change_error = state_change_error_;
     direct_connect_gateway_state = direct_connect_gateway_state_;
     owner_account = owner_account_;
     amazon_side_asn = amazon_side_asn_;
     direct_connect_gateway_name = direct_connect_gateway_name_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : direct_connect_gateway)

let make_update_direct_connect_gateway_response
    ?direct_connect_gateway:(direct_connect_gateway_ : direct_connect_gateway option) () =
  ({ direct_connect_gateway = direct_connect_gateway_ } : update_direct_connect_gateway_response)

let make_update_direct_connect_gateway_request
    ~new_direct_connect_gateway_name:
      (new_direct_connect_gateway_name_ : direct_connect_gateway_name)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     new_direct_connect_gateway_name = new_direct_connect_gateway_name_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : update_direct_connect_gateway_request)

let make_associated_gateway ?region:(region_ : region option)
    ?owner_account:(owner_account_ : owner_account option) ?type_:(type__ : gateway_type option)
    ?id:(id_ : gateway_identifier option) () =
  ({ region = region_; owner_account = owner_account_; type_ = type__; id = id_ }
    : associated_gateway)

let make_associated_core_network ?attachment_id:(attachment_id_ : core_network_attachment_id option)
    ?owner_account:(owner_account_ : owner_account option)
    ?id:(id_ : core_network_identifier option) () =
  ({ attachment_id = attachment_id_; owner_account = owner_account_; id = id_ }
    : associated_core_network)

let make_direct_connect_gateway_association
    ?virtual_gateway_owner_account:(virtual_gateway_owner_account_ : owner_account option)
    ?virtual_gateway_region:(virtual_gateway_region_ : virtual_gateway_region option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?associated_core_network:(associated_core_network_ : associated_core_network option)
    ?allowed_prefixes_to_direct_connect_gateway:
      (allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?association_id:(association_id_ : direct_connect_gateway_association_id option)
    ?associated_gateway:(associated_gateway_ : associated_gateway option)
    ?state_change_error:(state_change_error_ : state_change_error option)
    ?association_state:(association_state_ : direct_connect_gateway_association_state option)
    ?direct_connect_gateway_owner_account:
      (direct_connect_gateway_owner_account_ : owner_account option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     virtual_gateway_owner_account = virtual_gateway_owner_account_;
     virtual_gateway_region = virtual_gateway_region_;
     virtual_gateway_id = virtual_gateway_id_;
     associated_core_network = associated_core_network_;
     allowed_prefixes_to_direct_connect_gateway = allowed_prefixes_to_direct_connect_gateway_;
     association_id = association_id_;
     associated_gateway = associated_gateway_;
     state_change_error = state_change_error_;
     association_state = association_state_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : direct_connect_gateway_association)

let make_update_direct_connect_gateway_association_request
    ?remove_allowed_prefixes_to_direct_connect_gateway:
      (remove_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?association_id:(association_id_ : direct_connect_gateway_association_id option) () =
  ({
     remove_allowed_prefixes_to_direct_connect_gateway =
       remove_allowed_prefixes_to_direct_connect_gateway_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     association_id = association_id_;
   }
    : update_direct_connect_gateway_association_request)

let make_update_connection_request ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?connection_name:(connection_name_ : connection_name option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     encryption_mode = encryption_mode_;
     connection_name = connection_name_;
     connection_id = connection_id_;
   }
    : update_connection_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_bgp_failover_test_response
    ?virtual_interface_test:(virtual_interface_test_ : virtual_interface_test_history option) () =
  ({ virtual_interface_test = virtual_interface_test_ } : stop_bgp_failover_test_response)

let make_stop_bgp_failover_test_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : stop_bgp_failover_test_request)

let make_start_bgp_failover_test_response
    ?virtual_interface_test:(virtual_interface_test_ : virtual_interface_test_history option) () =
  ({ virtual_interface_test = virtual_interface_test_ } : start_bgp_failover_test_response)

let make_start_bgp_failover_test_request
    ?test_duration_in_minutes:(test_duration_in_minutes_ : test_duration option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     test_duration_in_minutes = test_duration_in_minutes_;
     bgp_peers = bgp_peers_;
     virtual_interface_id = virtual_interface_id_;
   }
    : start_bgp_failover_test_request)

let make_router_type
    ?router_type_identifier:(router_type_identifier_ : router_type_identifier option)
    ?xslt_template_name_for_mac_sec:
      (xslt_template_name_for_mac_sec_ : xslt_template_name_for_mac_sec option)
    ?xslt_template_name:(xslt_template_name_ : xslt_template_name option)
    ?software:(software_ : software option) ?platform:(platform_ : platform option)
    ?vendor:(vendor_ : vendor option) () =
  ({
     router_type_identifier = router_type_identifier_;
     xslt_template_name_for_mac_sec = xslt_template_name_for_mac_sec_;
     xslt_template_name = xslt_template_name_;
     software = software_;
     platform = platform_;
     vendor = vendor_;
   }
    : router_type)

let make_resource_tag ?tags:(tags_ : tag_list option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : resource_tag)

let make_list_virtual_interface_test_history_response
    ?next_token:(next_token_ : pagination_token option)
    ?virtual_interface_test_history:
      (virtual_interface_test_history_ : virtual_interface_test_history_list option) () =
  ({ next_token = next_token_; virtual_interface_test_history = virtual_interface_test_history_ }
    : list_virtual_interface_test_history_response)

let make_list_virtual_interface_test_history_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?status:(status_ : failure_test_history_status option)
    ?bgp_peers:(bgp_peers_ : bgp_peer_id_list option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?test_id:(test_id_ : test_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     bgp_peers = bgp_peers_;
     virtual_interface_id = virtual_interface_id_;
     test_id = test_id_;
   }
    : list_virtual_interface_test_history_request)

let make_disassociate_mac_sec_key_response ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?connection_id:(connection_id_ : connection_id option) () =
  ({ mac_sec_keys = mac_sec_keys_; connection_id = connection_id_ }
    : disassociate_mac_sec_key_response)

let make_disassociate_mac_sec_key_request ~secret_ar_n:(secret_ar_n_ : secret_ar_n)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ secret_ar_n = secret_ar_n_; connection_id = connection_id_ }
    : disassociate_mac_sec_key_request)

let make_disassociate_connection_from_lag_request ~lag_id:(lag_id_ : lag_id)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ lag_id = lag_id_; connection_id = connection_id_ } : disassociate_connection_from_lag_request)

let make_describe_virtual_interfaces_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?connection_id:(connection_id_ : connection_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     virtual_interface_id = virtual_interface_id_;
     connection_id = connection_id_;
   }
    : describe_virtual_interfaces_request)

let make_describe_tags_response ?resource_tags:(resource_tags_ : resource_tag_list option) () =
  ({ resource_tags = resource_tags_ } : describe_tags_response)

let make_describe_tags_request ~resource_arns:(resource_arns_ : resource_arn_list) () =
  ({ resource_arns = resource_arns_ } : describe_tags_request)

let make_describe_router_configuration_response
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?router:(router_ : router_type option)
    ?customer_router_config:(customer_router_config_ : router_config option) () =
  ({
     virtual_interface_name = virtual_interface_name_;
     virtual_interface_id = virtual_interface_id_;
     router = router_;
     customer_router_config = customer_router_config_;
   }
    : describe_router_configuration_response)

let make_describe_router_configuration_request
    ?router_type_identifier:(router_type_identifier_ : router_type_identifier option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     router_type_identifier = router_type_identifier_;
     virtual_interface_id = virtual_interface_id_;
   }
    : describe_router_configuration_request)

let make_location
    ?available_mac_sec_port_speeds:
      (available_mac_sec_port_speeds_ : available_mac_sec_port_speeds option)
    ?available_providers:(available_providers_ : provider_list option)
    ?available_port_speeds:(available_port_speeds_ : available_port_speeds option)
    ?region:(region_ : region option) ?location_name:(location_name_ : location_name option)
    ?location_code:(location_code_ : location_code option) () =
  ({
     available_mac_sec_port_speeds = available_mac_sec_port_speeds_;
     available_providers = available_providers_;
     available_port_speeds = available_port_speeds_;
     region = region_;
     location_name = location_name_;
     location_code = location_code_;
   }
    : location)

let make_locations ?locations:(locations_ : location_list option) () =
  ({ locations = locations_ } : locations)

let make_loa ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ?loa_content:(loa_content_ : loa_content option) () =
  ({ loa_content_type = loa_content_type_; loa_content = loa_content_ } : loa)

let make_describe_loa_request ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ?provider_name:(provider_name_ : provider_name option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     loa_content_type = loa_content_type_;
     provider_name = provider_name_;
     connection_id = connection_id_;
   }
    : describe_loa_request)

let make_lags ?next_token:(next_token_ : pagination_token option) ?lags:(lags_ : lag_list option) ()
    =
  ({ next_token = next_token_; lags = lags_ } : lags)

let make_describe_lags_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option) ?lag_id:(lag_id_ : lag_id option) () =
  ({ next_token = next_token_; max_results = max_results_; lag_id = lag_id_ }
    : describe_lags_request)

let make_interconnect ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?encryption_mode:(encryption_mode_ : encryption_mode option)
    ?port_encryption_status:(port_encryption_status_ : port_encryption_status option)
    ?mac_sec_capable:(mac_sec_capable_ : mac_sec_capable option)
    ?provider_name:(provider_name_ : provider_name option) ?tags:(tags_ : tag_list option)
    ?has_logical_redundancy:(has_logical_redundancy_ : has_logical_redundancy option)
    ?aws_logical_device_id:(aws_logical_device_id_ : aws_logical_device_id option)
    ?aws_device_v2:(aws_device_v2_ : aws_device_v2 option)
    ?jumbo_frame_capable:(jumbo_frame_capable_ : jumbo_frame_capable option)
    ?aws_device:(aws_device_ : aws_device option) ?lag_id:(lag_id_ : lag_id option)
    ?loa_issue_time:(loa_issue_time_ : loa_issue_time option)
    ?bandwidth:(bandwidth_ : bandwidth option) ?location:(location_ : location_code option)
    ?region:(region_ : region option)
    ?interconnect_state:(interconnect_state_ : interconnect_state option)
    ?interconnect_name:(interconnect_name_ : interconnect_name option)
    ?interconnect_id:(interconnect_id_ : interconnect_id option) () =
  ({
     mac_sec_keys = mac_sec_keys_;
     encryption_mode = encryption_mode_;
     port_encryption_status = port_encryption_status_;
     mac_sec_capable = mac_sec_capable_;
     provider_name = provider_name_;
     tags = tags_;
     has_logical_redundancy = has_logical_redundancy_;
     aws_logical_device_id = aws_logical_device_id_;
     aws_device_v2 = aws_device_v2_;
     jumbo_frame_capable = jumbo_frame_capable_;
     aws_device = aws_device_;
     lag_id = lag_id_;
     loa_issue_time = loa_issue_time_;
     bandwidth = bandwidth_;
     location = location_;
     region = region_;
     interconnect_state = interconnect_state_;
     interconnect_name = interconnect_name_;
     interconnect_id = interconnect_id_;
   }
    : interconnect)

let make_interconnects ?next_token:(next_token_ : pagination_token option)
    ?interconnects:(interconnects_ : interconnect_list option) () =
  ({ next_token = next_token_; interconnects = interconnects_ } : interconnects)

let make_describe_interconnects_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?interconnect_id:(interconnect_id_ : interconnect_id option) () =
  ({ next_token = next_token_; max_results = max_results_; interconnect_id = interconnect_id_ }
    : describe_interconnects_request)

let make_describe_interconnect_loa_response ?loa:(loa_ : loa option) () =
  ({ loa = loa_ } : describe_interconnect_loa_response)

let make_describe_interconnect_loa_request
    ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ?provider_name:(provider_name_ : provider_name option)
    ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({
     loa_content_type = loa_content_type_;
     provider_name = provider_name_;
     interconnect_id = interconnect_id_;
   }
    : describe_interconnect_loa_request)

let make_connections ?next_token:(next_token_ : pagination_token option)
    ?connections:(connections_ : connection_list option) () =
  ({ next_token = next_token_; connections = connections_ } : connections)

let make_describe_hosted_connections_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ next_token = next_token_; max_results = max_results_; connection_id = connection_id_ }
    : describe_hosted_connections_request)

let make_describe_direct_connect_gateways_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : describe_direct_connect_gateways_request)

let make_direct_connect_gateway_attachment
    ?state_change_error:(state_change_error_ : state_change_error option)
    ?attachment_type:(attachment_type_ : direct_connect_gateway_attachment_type option)
    ?attachment_state:(attachment_state_ : direct_connect_gateway_attachment_state option)
    ?virtual_interface_owner_account:(virtual_interface_owner_account_ : owner_account option)
    ?virtual_interface_region:(virtual_interface_region_ : virtual_interface_region option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     state_change_error = state_change_error_;
     attachment_type = attachment_type_;
     attachment_state = attachment_state_;
     virtual_interface_owner_account = virtual_interface_owner_account_;
     virtual_interface_region = virtual_interface_region_;
     virtual_interface_id = virtual_interface_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : direct_connect_gateway_attachment)

let make_describe_direct_connect_gateway_attachments_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     virtual_interface_id = virtual_interface_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : describe_direct_connect_gateway_attachments_request)

let make_describe_direct_connect_gateway_associations_request
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?associated_gateway_id:(associated_gateway_id_ : associated_gateway_id option)
    ?association_id:(association_id_ : direct_connect_gateway_association_id option) () =
  ({
     virtual_gateway_id = virtual_gateway_id_;
     next_token = next_token_;
     max_results = max_results_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     associated_gateway_id = associated_gateway_id_;
     association_id = association_id_;
   }
    : describe_direct_connect_gateway_associations_request)

let make_direct_connect_gateway_association_proposal
    ?requested_allowed_prefixes_to_direct_connect_gateway:
      (requested_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?existing_allowed_prefixes_to_direct_connect_gateway:
      (existing_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?associated_gateway:(associated_gateway_ : associated_gateway option)
    ?proposal_state:(proposal_state_ : direct_connect_gateway_association_proposal_state option)
    ?direct_connect_gateway_owner_account:
      (direct_connect_gateway_owner_account_ : owner_account option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id option) () =
  ({
     requested_allowed_prefixes_to_direct_connect_gateway =
       requested_allowed_prefixes_to_direct_connect_gateway_;
     existing_allowed_prefixes_to_direct_connect_gateway =
       existing_allowed_prefixes_to_direct_connect_gateway_;
     associated_gateway = associated_gateway_;
     proposal_state = proposal_state_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     proposal_id = proposal_id_;
   }
    : direct_connect_gateway_association_proposal)

let make_describe_direct_connect_gateway_association_proposals_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?associated_gateway_id:(associated_gateway_id_ : associated_gateway_id option)
    ?proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     associated_gateway_id = associated_gateway_id_;
     proposal_id = proposal_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : describe_direct_connect_gateway_association_proposals_request)

let make_customer_agreement ?status:(status_ : status option)
    ?agreement_name:(agreement_name_ : agreement_name option) () =
  ({ status = status_; agreement_name = agreement_name_ } : customer_agreement)

let make_describe_customer_metadata_response
    ?nni_partner_type:(nni_partner_type_ : nni_partner_type option)
    ?agreements:(agreements_ : agreement_list option) () =
  ({ nni_partner_type = nni_partner_type_; agreements = agreements_ }
    : describe_customer_metadata_response)

let make_describe_connections_on_interconnect_request
    ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({ interconnect_id = interconnect_id_ } : describe_connections_on_interconnect_request)

let make_describe_connections_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_result_set_size option)
    ?connection_id:(connection_id_ : connection_id option) () =
  ({ next_token = next_token_; max_results = max_results_; connection_id = connection_id_ }
    : describe_connections_request)

let make_describe_connection_loa_response ?loa:(loa_ : loa option) () =
  ({ loa = loa_ } : describe_connection_loa_response)

let make_describe_connection_loa_request
    ?loa_content_type:(loa_content_type_ : loa_content_type option)
    ?provider_name:(provider_name_ : provider_name option)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     loa_content_type = loa_content_type_;
     provider_name = provider_name_;
     connection_id = connection_id_;
   }
    : describe_connection_loa_request)

let make_delete_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ } : delete_virtual_interface_response)

let make_delete_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : delete_virtual_interface_request)

let make_delete_lag_request ~lag_id:(lag_id_ : lag_id) () =
  ({ lag_id = lag_id_ } : delete_lag_request)

let make_delete_interconnect_response
    ?interconnect_state:(interconnect_state_ : interconnect_state option) () =
  ({ interconnect_state = interconnect_state_ } : delete_interconnect_response)

let make_delete_interconnect_request ~interconnect_id:(interconnect_id_ : interconnect_id) () =
  ({ interconnect_id = interconnect_id_ } : delete_interconnect_request)

let make_delete_direct_connect_gateway_association_proposal_request
    ~proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id) () =
  ({ proposal_id = proposal_id_ } : delete_direct_connect_gateway_association_proposal_request)

let make_delete_direct_connect_gateway_association_request
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?association_id:(association_id_ : direct_connect_gateway_association_id option) () =
  ({
     virtual_gateway_id = virtual_gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     association_id = association_id_;
   }
    : delete_direct_connect_gateway_association_request)

let make_delete_direct_connect_gateway_request
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({ direct_connect_gateway_id = direct_connect_gateway_id_ }
    : delete_direct_connect_gateway_request)

let make_delete_connection_request ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_ } : delete_connection_request)

let make_delete_bgp_peer_response ?virtual_interface:(virtual_interface_ : virtual_interface option)
    () =
  ({ virtual_interface = virtual_interface_ } : delete_bgp_peer_response)

let make_delete_bgp_peer_request ?bgp_peer_id:(bgp_peer_id_ : bgp_peer_id option)
    ?customer_address:(customer_address_ : customer_address option)
    ?asn_long:(asn_long_ : long_asn option) ?asn:(asn_ : as_n option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option) () =
  ({
     bgp_peer_id = bgp_peer_id_;
     customer_address = customer_address_;
     asn_long = asn_long_;
     asn = asn_;
     virtual_interface_id = virtual_interface_id_;
   }
    : delete_bgp_peer_request)

let make_new_transit_virtual_interface ?rate_limit:(rate_limit_ : rate_limit option)
    ?enable_site_link:(enable_site_link_ : enable_site_link option) ?tags:(tags_ : tag_list option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?mtu:(mtu_ : mt_u option)
    ?asn_long:(asn_long_ : long_asn option) ?asn:(asn_ : as_n option) ?vlan:(vlan_ : vla_n option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option) () =
  ({
     rate_limit = rate_limit_;
     enable_site_link = enable_site_link_;
     tags = tags_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     mtu = mtu_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_transit_virtual_interface)

let make_create_transit_virtual_interface_request
    ~new_transit_virtual_interface:(new_transit_virtual_interface_ : new_transit_virtual_interface)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     new_transit_virtual_interface = new_transit_virtual_interface_;
     connection_id = connection_id_;
   }
    : create_transit_virtual_interface_request)

let make_new_public_virtual_interface ?rate_limit:(rate_limit_ : rate_limit option)
    ?tags:(tags_ : tag_list option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?asn_long:(asn_long_ : long_asn option)
    ?asn:(asn_ : as_n option) ~vlan:(vlan_ : vla_n)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) () =
  ({
     rate_limit = rate_limit_;
     tags = tags_;
     route_filter_prefixes = route_filter_prefixes_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_public_virtual_interface)

let make_create_public_virtual_interface_request
    ~new_public_virtual_interface:(new_public_virtual_interface_ : new_public_virtual_interface)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ new_public_virtual_interface = new_public_virtual_interface_; connection_id = connection_id_ }
    : create_public_virtual_interface_request)

let make_new_private_virtual_interface ?rate_limit:(rate_limit_ : rate_limit option)
    ?enable_site_link:(enable_site_link_ : enable_site_link option) ?tags:(tags_ : tag_list option)
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?mtu:(mtu_ : mt_u option)
    ?asn_long:(asn_long_ : long_asn option) ?asn:(asn_ : as_n option) ~vlan:(vlan_ : vla_n)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) () =
  ({
     rate_limit = rate_limit_;
     enable_site_link = enable_site_link_;
     tags = tags_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_gateway_id = virtual_gateway_id_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     mtu = mtu_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_private_virtual_interface)

let make_create_private_virtual_interface_request
    ~new_private_virtual_interface:(new_private_virtual_interface_ : new_private_virtual_interface)
    ~connection_id:(connection_id_ : connection_id) () =
  ({
     new_private_virtual_interface = new_private_virtual_interface_;
     connection_id = connection_id_;
   }
    : create_private_virtual_interface_request)

let make_create_lag_request ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ?provider_name:(provider_name_ : provider_name option)
    ?child_connection_tags:(child_connection_tags_ : tag_list option)
    ?tags:(tags_ : tag_list option) ?connection_id:(connection_id_ : connection_id option)
    ~lag_name:(lag_name_ : lag_name) ~connections_bandwidth:(connections_bandwidth_ : bandwidth)
    ~location:(location_ : location_code) ~number_of_connections:(number_of_connections_ : count) ()
    =
  ({
     request_mac_sec = request_mac_sec_;
     provider_name = provider_name_;
     child_connection_tags = child_connection_tags_;
     tags = tags_;
     connection_id = connection_id_;
     lag_name = lag_name_;
     connections_bandwidth = connections_bandwidth_;
     location = location_;
     number_of_connections = number_of_connections_;
   }
    : create_lag_request)

let make_create_interconnect_request ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ?provider_name:(provider_name_ : provider_name option) ?tags:(tags_ : tag_list option)
    ?lag_id:(lag_id_ : lag_id option) ~location:(location_ : location_code)
    ~bandwidth:(bandwidth_ : bandwidth) ~interconnect_name:(interconnect_name_ : interconnect_name)
    () =
  ({
     request_mac_sec = request_mac_sec_;
     provider_name = provider_name_;
     tags = tags_;
     lag_id = lag_id_;
     location = location_;
     bandwidth = bandwidth_;
     interconnect_name = interconnect_name_;
   }
    : create_interconnect_request)

let make_create_direct_connect_gateway_association_proposal_request
    ?remove_allowed_prefixes_to_direct_connect_gateway:
      (remove_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ~gateway_id:(gateway_id_ : gateway_id_to_associate)
    ~direct_connect_gateway_owner_account:(direct_connect_gateway_owner_account_ : owner_account)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     remove_allowed_prefixes_to_direct_connect_gateway =
       remove_allowed_prefixes_to_direct_connect_gateway_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     gateway_id = gateway_id_;
     direct_connect_gateway_owner_account = direct_connect_gateway_owner_account_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : create_direct_connect_gateway_association_proposal_request)

let make_create_direct_connect_gateway_association_request
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ?add_allowed_prefixes_to_direct_connect_gateway:
      (add_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ?gateway_id:(gateway_id_ : gateway_id_to_associate option)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     virtual_gateway_id = virtual_gateway_id_;
     add_allowed_prefixes_to_direct_connect_gateway =
       add_allowed_prefixes_to_direct_connect_gateway_;
     gateway_id = gateway_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : create_direct_connect_gateway_association_request)

let make_create_direct_connect_gateway_request ?amazon_side_asn:(amazon_side_asn_ : long_asn option)
    ?tags:(tags_ : tag_list option)
    ~direct_connect_gateway_name:(direct_connect_gateway_name_ : direct_connect_gateway_name) () =
  ({
     amazon_side_asn = amazon_side_asn_;
     tags = tags_;
     direct_connect_gateway_name = direct_connect_gateway_name_;
   }
    : create_direct_connect_gateway_request)

let make_create_connection_request ?request_mac_sec:(request_mac_sec_ : request_mac_sec option)
    ?provider_name:(provider_name_ : provider_name option) ?tags:(tags_ : tag_list option)
    ?lag_id:(lag_id_ : lag_id option) ~connection_name:(connection_name_ : connection_name)
    ~bandwidth:(bandwidth_ : bandwidth) ~location:(location_ : location_code) () =
  ({
     request_mac_sec = request_mac_sec_;
     provider_name = provider_name_;
     tags = tags_;
     lag_id = lag_id_;
     connection_name = connection_name_;
     bandwidth = bandwidth_;
     location = location_;
   }
    : create_connection_request)

let make_create_bgp_peer_response ?virtual_interface:(virtual_interface_ : virtual_interface option)
    () =
  ({ virtual_interface = virtual_interface_ } : create_bgp_peer_response)

let make_new_bgp_peer ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?address_family:(address_family_ : address_family option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?asn_long:(asn_long_ : long_asn option)
    ?asn:(asn_ : as_n option) () =
  ({
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     address_family = address_family_;
     auth_key = auth_key_;
     asn_long = asn_long_;
     asn = asn_;
   }
    : new_bgp_peer)

let make_create_bgp_peer_request ?new_bgp_peer:(new_bgp_peer_ : new_bgp_peer option)
    ?virtual_interface_id:(virtual_interface_id_ : virtual_interface_id option) () =
  ({ new_bgp_peer = new_bgp_peer_; virtual_interface_id = virtual_interface_id_ }
    : create_bgp_peer_request)

let make_confirm_transit_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_transit_virtual_interface_response)

let make_confirm_transit_virtual_interface_request
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_interface_id = virtual_interface_id_;
   }
    : confirm_transit_virtual_interface_request)

let make_confirm_public_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_public_virtual_interface_response)

let make_confirm_public_virtual_interface_request
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ virtual_interface_id = virtual_interface_id_ } : confirm_public_virtual_interface_request)

let make_confirm_private_virtual_interface_response
    ?virtual_interface_state:(virtual_interface_state_ : virtual_interface_state option) () =
  ({ virtual_interface_state = virtual_interface_state_ }
    : confirm_private_virtual_interface_response)

let make_confirm_private_virtual_interface_request
    ?direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id option)
    ?virtual_gateway_id:(virtual_gateway_id_ : virtual_gateway_id option)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({
     direct_connect_gateway_id = direct_connect_gateway_id_;
     virtual_gateway_id = virtual_gateway_id_;
     virtual_interface_id = virtual_interface_id_;
   }
    : confirm_private_virtual_interface_request)

let make_confirm_customer_agreement_response ?status:(status_ : status option) () =
  ({ status = status_ } : confirm_customer_agreement_response)

let make_confirm_customer_agreement_request
    ?agreement_name:(agreement_name_ : agreement_name option) () =
  ({ agreement_name = agreement_name_ } : confirm_customer_agreement_request)

let make_confirm_connection_response ?connection_state:(connection_state_ : connection_state option)
    () =
  ({ connection_state = connection_state_ } : confirm_connection_response)

let make_confirm_connection_request ~connection_id:(connection_id_ : connection_id) () =
  ({ connection_id = connection_id_ } : confirm_connection_request)

let make_associate_virtual_interface_request ~connection_id:(connection_id_ : connection_id)
    ~virtual_interface_id:(virtual_interface_id_ : virtual_interface_id) () =
  ({ connection_id = connection_id_; virtual_interface_id = virtual_interface_id_ }
    : associate_virtual_interface_request)

let make_associate_mac_sec_key_response ?mac_sec_keys:(mac_sec_keys_ : mac_sec_key_list option)
    ?connection_id:(connection_id_ : connection_id option) () =
  ({ mac_sec_keys = mac_sec_keys_; connection_id = connection_id_ }
    : associate_mac_sec_key_response)

let make_associate_mac_sec_key_request ?cak:(cak_ : cak option) ?ckn:(ckn_ : ckn option)
    ?secret_ar_n:(secret_ar_n_ : secret_ar_n option) ~connection_id:(connection_id_ : connection_id)
    () =
  ({ cak = cak_; ckn = ckn_; secret_ar_n = secret_ar_n_; connection_id = connection_id_ }
    : associate_mac_sec_key_request)

let make_associate_hosted_connection_request
    ~parent_connection_id:(parent_connection_id_ : connection_id)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ parent_connection_id = parent_connection_id_; connection_id = connection_id_ }
    : associate_hosted_connection_request)

let make_associate_connection_with_lag_request ~lag_id:(lag_id_ : lag_id)
    ~connection_id:(connection_id_ : connection_id) () =
  ({ lag_id = lag_id_; connection_id = connection_id_ } : associate_connection_with_lag_request)

let make_new_transit_virtual_interface_allocation ?rate_limit:(rate_limit_ : rate_limit option)
    ?tags:(tags_ : tag_list option) ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?mtu:(mtu_ : mt_u option)
    ?asn_long:(asn_long_ : long_asn option) ?asn:(asn_ : as_n option) ?vlan:(vlan_ : vla_n option)
    ?virtual_interface_name:(virtual_interface_name_ : virtual_interface_name option) () =
  ({
     rate_limit = rate_limit_;
     tags = tags_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     mtu = mtu_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_transit_virtual_interface_allocation)

let make_allocate_transit_virtual_interface_request
    ~new_transit_virtual_interface_allocation:
      (new_transit_virtual_interface_allocation_ : new_transit_virtual_interface_allocation)
    ~owner_account:(owner_account_ : owner_account) ~connection_id:(connection_id_ : connection_id)
    () =
  ({
     new_transit_virtual_interface_allocation = new_transit_virtual_interface_allocation_;
     owner_account = owner_account_;
     connection_id = connection_id_;
   }
    : allocate_transit_virtual_interface_request)

let make_new_public_virtual_interface_allocation ?rate_limit:(rate_limit_ : rate_limit option)
    ?tags:(tags_ : tag_list option)
    ?route_filter_prefixes:(route_filter_prefixes_ : route_filter_prefix_list option)
    ?address_family:(address_family_ : address_family option)
    ?customer_address:(customer_address_ : customer_address option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?asn_long:(asn_long_ : long_asn option)
    ?asn:(asn_ : as_n option) ~vlan:(vlan_ : vla_n)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) () =
  ({
     rate_limit = rate_limit_;
     tags = tags_;
     route_filter_prefixes = route_filter_prefixes_;
     address_family = address_family_;
     customer_address = customer_address_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_public_virtual_interface_allocation)

let make_allocate_public_virtual_interface_request
    ~new_public_virtual_interface_allocation:
      (new_public_virtual_interface_allocation_ : new_public_virtual_interface_allocation)
    ~owner_account:(owner_account_ : owner_account) ~connection_id:(connection_id_ : connection_id)
    () =
  ({
     new_public_virtual_interface_allocation = new_public_virtual_interface_allocation_;
     owner_account = owner_account_;
     connection_id = connection_id_;
   }
    : allocate_public_virtual_interface_request)

let make_new_private_virtual_interface_allocation ?rate_limit:(rate_limit_ : rate_limit option)
    ?tags:(tags_ : tag_list option) ?customer_address:(customer_address_ : customer_address option)
    ?address_family:(address_family_ : address_family option)
    ?amazon_address:(amazon_address_ : amazon_address option)
    ?auth_key:(auth_key_ : bgp_auth_key option) ?mtu:(mtu_ : mt_u option)
    ?asn_long:(asn_long_ : long_asn option) ?asn:(asn_ : as_n option) ~vlan:(vlan_ : vla_n)
    ~virtual_interface_name:(virtual_interface_name_ : virtual_interface_name) () =
  ({
     rate_limit = rate_limit_;
     tags = tags_;
     customer_address = customer_address_;
     address_family = address_family_;
     amazon_address = amazon_address_;
     auth_key = auth_key_;
     mtu = mtu_;
     asn_long = asn_long_;
     asn = asn_;
     vlan = vlan_;
     virtual_interface_name = virtual_interface_name_;
   }
    : new_private_virtual_interface_allocation)

let make_allocate_private_virtual_interface_request
    ~new_private_virtual_interface_allocation:
      (new_private_virtual_interface_allocation_ : new_private_virtual_interface_allocation)
    ~owner_account:(owner_account_ : owner_account) ~connection_id:(connection_id_ : connection_id)
    () =
  ({
     new_private_virtual_interface_allocation = new_private_virtual_interface_allocation_;
     owner_account = owner_account_;
     connection_id = connection_id_;
   }
    : allocate_private_virtual_interface_request)

let make_allocate_hosted_connection_request ?tags:(tags_ : tag_list option) ~vlan:(vlan_ : vla_n)
    ~connection_name:(connection_name_ : connection_name) ~bandwidth:(bandwidth_ : bandwidth)
    ~owner_account:(owner_account_ : owner_account) ~connection_id:(connection_id_ : connection_id)
    () =
  ({
     tags = tags_;
     vlan = vlan_;
     connection_name = connection_name_;
     bandwidth = bandwidth_;
     owner_account = owner_account_;
     connection_id = connection_id_;
   }
    : allocate_hosted_connection_request)

let make_allocate_connection_on_interconnect_request ~vlan:(vlan_ : vla_n)
    ~interconnect_id:(interconnect_id_ : interconnect_id)
    ~owner_account:(owner_account_ : owner_account)
    ~connection_name:(connection_name_ : connection_name) ~bandwidth:(bandwidth_ : bandwidth) () =
  ({
     vlan = vlan_;
     interconnect_id = interconnect_id_;
     owner_account = owner_account_;
     connection_name = connection_name_;
     bandwidth = bandwidth_;
   }
    : allocate_connection_on_interconnect_request)

let make_accept_direct_connect_gateway_association_proposal_request
    ?override_allowed_prefixes_to_direct_connect_gateway:
      (override_allowed_prefixes_to_direct_connect_gateway_ : route_filter_prefix_list option)
    ~associated_gateway_owner_account:(associated_gateway_owner_account_ : owner_account)
    ~proposal_id:(proposal_id_ : direct_connect_gateway_association_proposal_id)
    ~direct_connect_gateway_id:(direct_connect_gateway_id_ : direct_connect_gateway_id) () =
  ({
     override_allowed_prefixes_to_direct_connect_gateway =
       override_allowed_prefixes_to_direct_connect_gateway_;
     associated_gateway_owner_account = associated_gateway_owner_account_;
     proposal_id = proposal_id_;
     direct_connect_gateway_id = direct_connect_gateway_id_;
   }
    : accept_direct_connect_gateway_association_proposal_request)
