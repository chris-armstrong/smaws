open Types

val make_associated_core_network :
  ?id:core_network_identifier ->
  ?owner_account:owner_account ->
  ?attachment_id:core_network_attachment_id ->
  unit ->
  associated_core_network

val make_route_filter_prefix : ?cidr:cid_r -> unit -> route_filter_prefix

val make_associated_gateway :
  ?id:gateway_identifier ->
  ?type_:gateway_type ->
  ?owner_account:owner_account ->
  ?region:region ->
  unit ->
  associated_gateway

val make_direct_connect_gateway_association :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?direct_connect_gateway_owner_account:owner_account ->
  ?association_state:direct_connect_gateway_association_state ->
  ?state_change_error:state_change_error ->
  ?associated_gateway:associated_gateway ->
  ?association_id:direct_connect_gateway_association_id ->
  ?allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?associated_core_network:associated_core_network ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?virtual_gateway_region:virtual_gateway_region ->
  ?virtual_gateway_owner_account:owner_account ->
  unit ->
  direct_connect_gateway_association

val make_accept_direct_connect_gateway_association_proposal_request :
  ?override_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  proposal_id:direct_connect_gateway_association_proposal_id ->
  associated_gateway_owner_account:owner_account ->
  unit ->
  accept_direct_connect_gateway_association_proposal_request

val make_customer_agreement :
  ?agreement_name:agreement_name -> ?status:status -> unit -> customer_agreement

val make_rate_limiter_status :
  ?max_allowed:count ->
  ?in_use:count ->
  ?remaining:count ->
  ?total_bandwidth:bandwidth ->
  unit ->
  rate_limiter_status

val make_mac_sec_key :
  ?secret_ar_n:secret_ar_n ->
  ?ckn:ckn ->
  ?state:state ->
  ?start_on:start_on_date ->
  unit ->
  mac_sec_key

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_connection :
  ?owner_account:owner_account ->
  ?connection_id:connection_id ->
  ?connection_name:connection_name ->
  ?connection_state:connection_state ->
  ?region:region ->
  ?location:location_code ->
  ?bandwidth:bandwidth ->
  ?vlan:vla_n ->
  ?partner_name:partner_name ->
  ?loa_issue_time:loa_issue_time ->
  ?lag_id:lag_id ->
  ?aws_device:aws_device ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?tags:tag_list ->
  ?provider_name:provider_name ->
  ?mac_sec_capable:mac_sec_capable ->
  ?port_encryption_status:port_encryption_status ->
  ?encryption_mode:encryption_mode ->
  ?mac_sec_keys:mac_sec_key_list ->
  ?rate_limiter_status:rate_limiter_status ->
  ?partner_interconnect_mac_sec_capable:partner_interconnect_mac_sec_capable ->
  unit ->
  connection

val make_allocate_connection_on_interconnect_request :
  bandwidth:bandwidth ->
  connection_name:connection_name ->
  owner_account:owner_account ->
  interconnect_id:interconnect_id ->
  vlan:vla_n ->
  unit ->
  allocate_connection_on_interconnect_request

val make_allocate_hosted_connection_request :
  ?tags:tag_list ->
  connection_id:connection_id ->
  owner_account:owner_account ->
  bandwidth:bandwidth ->
  connection_name:connection_name ->
  vlan:vla_n ->
  unit ->
  allocate_hosted_connection_request

val make_bgp_peer :
  ?bgp_peer_id:bgp_peer_id ->
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?auth_key:bgp_auth_key ->
  ?address_family:address_family ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?bgp_peer_state:bgp_peer_state ->
  ?bgp_status:bgp_status ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_logical_device_id:aws_logical_device_id ->
  unit ->
  bgp_peer

val make_virtual_interface :
  ?owner_account:owner_account ->
  ?virtual_interface_id:virtual_interface_id ->
  ?location:location_code ->
  ?connection_id:connection_id ->
  ?virtual_interface_type:virtual_interface_type ->
  ?virtual_interface_name:virtual_interface_name ->
  ?vlan:vla_n ->
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?amazon_side_asn:long_asn ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?virtual_interface_state:virtual_interface_state ->
  ?customer_router_config:router_config ->
  ?mtu:mt_u ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?bgp_peers:bgp_peer_list ->
  ?region:region ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?tags:tag_list ->
  ?site_link_enabled:site_link_enabled ->
  ?rate_limit:rate_limit ->
  unit ->
  virtual_interface

val make_new_private_virtual_interface_allocation :
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?mtu:mt_u ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?tags:tag_list ->
  ?rate_limit:rate_limit ->
  virtual_interface_name:virtual_interface_name ->
  vlan:vla_n ->
  unit ->
  new_private_virtual_interface_allocation

val make_allocate_private_virtual_interface_request :
  connection_id:connection_id ->
  owner_account:owner_account ->
  new_private_virtual_interface_allocation:new_private_virtual_interface_allocation ->
  unit ->
  allocate_private_virtual_interface_request

val make_new_public_virtual_interface_allocation :
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?tags:tag_list ->
  ?rate_limit:rate_limit ->
  virtual_interface_name:virtual_interface_name ->
  vlan:vla_n ->
  unit ->
  new_public_virtual_interface_allocation

val make_allocate_public_virtual_interface_request :
  connection_id:connection_id ->
  owner_account:owner_account ->
  new_public_virtual_interface_allocation:new_public_virtual_interface_allocation ->
  unit ->
  allocate_public_virtual_interface_request

val make_new_transit_virtual_interface_allocation :
  ?virtual_interface_name:virtual_interface_name ->
  ?vlan:vla_n ->
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?mtu:mt_u ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?tags:tag_list ->
  ?rate_limit:rate_limit ->
  unit ->
  new_transit_virtual_interface_allocation

val make_allocate_transit_virtual_interface_request :
  connection_id:connection_id ->
  owner_account:owner_account ->
  new_transit_virtual_interface_allocation:new_transit_virtual_interface_allocation ->
  unit ->
  allocate_transit_virtual_interface_request

val make_associate_connection_with_lag_request :
  connection_id:connection_id -> lag_id:lag_id -> unit -> associate_connection_with_lag_request

val make_associate_hosted_connection_request :
  connection_id:connection_id ->
  parent_connection_id:connection_id ->
  unit ->
  associate_hosted_connection_request

val make_associate_mac_sec_key_response :
  ?connection_id:connection_id ->
  ?mac_sec_keys:mac_sec_key_list ->
  unit ->
  associate_mac_sec_key_response

val make_associate_mac_sec_key_request :
  ?secret_ar_n:secret_ar_n ->
  ?ckn:ckn ->
  ?cak:cak ->
  connection_id:connection_id ->
  unit ->
  associate_mac_sec_key_request

val make_associate_virtual_interface_request :
  virtual_interface_id:virtual_interface_id ->
  connection_id:connection_id ->
  unit ->
  associate_virtual_interface_request

val make_confirm_connection_response :
  ?connection_state:connection_state -> unit -> confirm_connection_response

val make_confirm_connection_request :
  connection_id:connection_id -> unit -> confirm_connection_request

val make_confirm_customer_agreement_response :
  ?status:status -> unit -> confirm_customer_agreement_response

val make_confirm_customer_agreement_request :
  ?agreement_name:agreement_name -> unit -> confirm_customer_agreement_request

val make_confirm_private_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_private_virtual_interface_response

val make_confirm_private_virtual_interface_request :
  ?virtual_gateway_id:virtual_gateway_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  confirm_private_virtual_interface_request

val make_confirm_public_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_public_virtual_interface_response

val make_confirm_public_virtual_interface_request :
  virtual_interface_id:virtual_interface_id -> unit -> confirm_public_virtual_interface_request

val make_confirm_transit_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_transit_virtual_interface_response

val make_confirm_transit_virtual_interface_request :
  virtual_interface_id:virtual_interface_id ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  confirm_transit_virtual_interface_request

val make_connections :
  ?connections:connection_list -> ?next_token:pagination_token -> unit -> connections

val make_create_bgp_peer_response :
  ?virtual_interface:virtual_interface -> unit -> create_bgp_peer_response

val make_new_bgp_peer :
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?auth_key:bgp_auth_key ->
  ?address_family:address_family ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  unit ->
  new_bgp_peer

val make_create_bgp_peer_request :
  ?virtual_interface_id:virtual_interface_id ->
  ?new_bgp_peer:new_bgp_peer ->
  unit ->
  create_bgp_peer_request

val make_create_connection_request :
  ?lag_id:lag_id ->
  ?tags:tag_list ->
  ?provider_name:provider_name ->
  ?request_mac_sec:request_mac_sec ->
  location:location_code ->
  bandwidth:bandwidth ->
  connection_name:connection_name ->
  unit ->
  create_connection_request

val make_direct_connect_gateway :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?direct_connect_gateway_name:direct_connect_gateway_name ->
  ?amazon_side_asn:long_asn ->
  ?owner_account:owner_account ->
  ?direct_connect_gateway_state:direct_connect_gateway_state ->
  ?state_change_error:state_change_error ->
  ?tags:tag_list ->
  unit ->
  direct_connect_gateway

val make_create_direct_connect_gateway_request :
  ?tags:tag_list ->
  ?amazon_side_asn:long_asn ->
  direct_connect_gateway_name:direct_connect_gateway_name ->
  unit ->
  create_direct_connect_gateway_request

val make_create_direct_connect_gateway_association_request :
  ?gateway_id:gateway_id_to_associate ->
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?virtual_gateway_id:virtual_gateway_id ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  create_direct_connect_gateway_association_request

val make_direct_connect_gateway_association_proposal :
  ?proposal_id:direct_connect_gateway_association_proposal_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?direct_connect_gateway_owner_account:owner_account ->
  ?proposal_state:direct_connect_gateway_association_proposal_state ->
  ?associated_gateway:associated_gateway ->
  ?existing_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?requested_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  unit ->
  direct_connect_gateway_association_proposal

val make_create_direct_connect_gateway_association_proposal_request :
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?remove_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  direct_connect_gateway_owner_account:owner_account ->
  gateway_id:gateway_id_to_associate ->
  unit ->
  create_direct_connect_gateway_association_proposal_request

val make_interconnect :
  ?interconnect_id:interconnect_id ->
  ?interconnect_name:interconnect_name ->
  ?interconnect_state:interconnect_state ->
  ?region:region ->
  ?location:location_code ->
  ?bandwidth:bandwidth ->
  ?loa_issue_time:loa_issue_time ->
  ?lag_id:lag_id ->
  ?aws_device:aws_device ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?tags:tag_list ->
  ?provider_name:provider_name ->
  ?mac_sec_capable:mac_sec_capable ->
  ?port_encryption_status:port_encryption_status ->
  ?encryption_mode:encryption_mode ->
  ?mac_sec_keys:mac_sec_key_list ->
  unit ->
  interconnect

val make_create_interconnect_request :
  ?lag_id:lag_id ->
  ?tags:tag_list ->
  ?provider_name:provider_name ->
  ?request_mac_sec:request_mac_sec ->
  interconnect_name:interconnect_name ->
  bandwidth:bandwidth ->
  location:location_code ->
  unit ->
  create_interconnect_request

val make_lag :
  ?connections_bandwidth:bandwidth ->
  ?number_of_connections:count ->
  ?lag_id:lag_id ->
  ?owner_account:owner_account ->
  ?lag_name:lag_name ->
  ?lag_state:lag_state ->
  ?location:location_code ->
  ?region:region ->
  ?minimum_links:count ->
  ?aws_device:aws_device ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?connections:connection_list ->
  ?allows_hosted_connections:boolean_flag ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?tags:tag_list ->
  ?provider_name:provider_name ->
  ?mac_sec_capable:mac_sec_capable ->
  ?encryption_mode:encryption_mode ->
  ?mac_sec_keys:mac_sec_key_list ->
  ?rate_limiter_status:rate_limiter_status ->
  unit ->
  lag

val make_create_lag_request :
  ?connection_id:connection_id ->
  ?tags:tag_list ->
  ?child_connection_tags:tag_list ->
  ?provider_name:provider_name ->
  ?request_mac_sec:request_mac_sec ->
  number_of_connections:count ->
  location:location_code ->
  connections_bandwidth:bandwidth ->
  lag_name:lag_name ->
  unit ->
  create_lag_request

val make_new_private_virtual_interface :
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?mtu:mt_u ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?tags:tag_list ->
  ?enable_site_link:enable_site_link ->
  ?rate_limit:rate_limit ->
  virtual_interface_name:virtual_interface_name ->
  vlan:vla_n ->
  unit ->
  new_private_virtual_interface

val make_create_private_virtual_interface_request :
  connection_id:connection_id ->
  new_private_virtual_interface:new_private_virtual_interface ->
  unit ->
  create_private_virtual_interface_request

val make_new_public_virtual_interface :
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?tags:tag_list ->
  ?rate_limit:rate_limit ->
  virtual_interface_name:virtual_interface_name ->
  vlan:vla_n ->
  unit ->
  new_public_virtual_interface

val make_create_public_virtual_interface_request :
  connection_id:connection_id ->
  new_public_virtual_interface:new_public_virtual_interface ->
  unit ->
  create_public_virtual_interface_request

val make_new_transit_virtual_interface :
  ?virtual_interface_name:virtual_interface_name ->
  ?vlan:vla_n ->
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?mtu:mt_u ->
  ?auth_key:bgp_auth_key ->
  ?amazon_address:amazon_address ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?tags:tag_list ->
  ?enable_site_link:enable_site_link ->
  ?rate_limit:rate_limit ->
  unit ->
  new_transit_virtual_interface

val make_create_transit_virtual_interface_request :
  connection_id:connection_id ->
  new_transit_virtual_interface:new_transit_virtual_interface ->
  unit ->
  create_transit_virtual_interface_request

val make_delete_bgp_peer_response :
  ?virtual_interface:virtual_interface -> unit -> delete_bgp_peer_response

val make_delete_bgp_peer_request :
  ?virtual_interface_id:virtual_interface_id ->
  ?asn:as_n ->
  ?asn_long:long_asn ->
  ?customer_address:customer_address ->
  ?bgp_peer_id:bgp_peer_id ->
  unit ->
  delete_bgp_peer_request

val make_delete_connection_request :
  connection_id:connection_id -> unit -> delete_connection_request

val make_delete_direct_connect_gateway_request :
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  delete_direct_connect_gateway_request

val make_delete_direct_connect_gateway_association_request :
  ?association_id:direct_connect_gateway_association_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_gateway_id:virtual_gateway_id ->
  unit ->
  delete_direct_connect_gateway_association_request

val make_delete_direct_connect_gateway_association_proposal_request :
  proposal_id:direct_connect_gateway_association_proposal_id ->
  unit ->
  delete_direct_connect_gateway_association_proposal_request

val make_delete_interconnect_response :
  ?interconnect_state:interconnect_state -> unit -> delete_interconnect_response

val make_delete_interconnect_request :
  interconnect_id:interconnect_id -> unit -> delete_interconnect_request

val make_delete_lag_request : lag_id:lag_id -> unit -> delete_lag_request

val make_delete_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state -> unit -> delete_virtual_interface_response

val make_delete_virtual_interface_request :
  virtual_interface_id:virtual_interface_id -> unit -> delete_virtual_interface_request

val make_loa : ?loa_content:loa_content -> ?loa_content_type:loa_content_type -> unit -> loa
val make_describe_connection_loa_response : ?loa:loa -> unit -> describe_connection_loa_response

val make_describe_connection_loa_request :
  ?provider_name:provider_name ->
  ?loa_content_type:loa_content_type ->
  connection_id:connection_id ->
  unit ->
  describe_connection_loa_request

val make_describe_connections_request :
  ?connection_id:connection_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_connections_request

val make_describe_connections_on_interconnect_request :
  interconnect_id:interconnect_id -> unit -> describe_connections_on_interconnect_request

val make_describe_customer_metadata_response :
  ?agreements:agreement_list ->
  ?nni_partner_type:nni_partner_type ->
  unit ->
  describe_customer_metadata_response

val make_describe_direct_connect_gateway_association_proposals_request :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?proposal_id:direct_connect_gateway_association_proposal_id ->
  ?associated_gateway_id:associated_gateway_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_direct_connect_gateway_association_proposals_request

val make_describe_direct_connect_gateway_associations_request :
  ?association_id:direct_connect_gateway_association_id ->
  ?associated_gateway_id:associated_gateway_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  ?virtual_gateway_id:virtual_gateway_id ->
  unit ->
  describe_direct_connect_gateway_associations_request

val make_direct_connect_gateway_attachment :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_interface_id:virtual_interface_id ->
  ?virtual_interface_region:virtual_interface_region ->
  ?virtual_interface_owner_account:owner_account ->
  ?attachment_state:direct_connect_gateway_attachment_state ->
  ?attachment_type:direct_connect_gateway_attachment_type ->
  ?state_change_error:state_change_error ->
  unit ->
  direct_connect_gateway_attachment

val make_describe_direct_connect_gateway_attachments_request :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_interface_id:virtual_interface_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_direct_connect_gateway_attachments_request

val make_describe_direct_connect_gateways_request :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_direct_connect_gateways_request

val make_describe_hosted_connections_request :
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  connection_id:connection_id ->
  unit ->
  describe_hosted_connections_request

val make_describe_interconnect_loa_response : ?loa:loa -> unit -> describe_interconnect_loa_response

val make_describe_interconnect_loa_request :
  ?provider_name:provider_name ->
  ?loa_content_type:loa_content_type ->
  interconnect_id:interconnect_id ->
  unit ->
  describe_interconnect_loa_request

val make_interconnects :
  ?interconnects:interconnect_list -> ?next_token:pagination_token -> unit -> interconnects

val make_describe_interconnects_request :
  ?interconnect_id:interconnect_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_interconnects_request

val make_lags : ?lags:lag_list -> ?next_token:pagination_token -> unit -> lags

val make_describe_lags_request :
  ?lag_id:lag_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_lags_request

val make_describe_loa_request :
  ?provider_name:provider_name ->
  ?loa_content_type:loa_content_type ->
  connection_id:connection_id ->
  unit ->
  describe_loa_request

val make_location :
  ?location_code:location_code ->
  ?location_name:location_name ->
  ?region:region ->
  ?available_port_speeds:available_port_speeds ->
  ?available_providers:provider_list ->
  ?available_mac_sec_port_speeds:available_mac_sec_port_speeds ->
  unit ->
  location

val make_locations : ?locations:location_list -> unit -> locations

val make_router_type :
  ?vendor:vendor ->
  ?platform:platform ->
  ?software:software ->
  ?xslt_template_name:xslt_template_name ->
  ?xslt_template_name_for_mac_sec:xslt_template_name_for_mac_sec ->
  ?router_type_identifier:router_type_identifier ->
  unit ->
  router_type

val make_describe_router_configuration_response :
  ?customer_router_config:router_config ->
  ?router:router_type ->
  ?virtual_interface_id:virtual_interface_id ->
  ?virtual_interface_name:virtual_interface_name ->
  unit ->
  describe_router_configuration_response

val make_describe_router_configuration_request :
  ?router_type_identifier:router_type_identifier ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  describe_router_configuration_request

val make_resource_tag : ?resource_arn:resource_arn -> ?tags:tag_list -> unit -> resource_tag
val make_describe_tags_response : ?resource_tags:resource_tag_list -> unit -> describe_tags_response
val make_describe_tags_request : resource_arns:resource_arn_list -> unit -> describe_tags_request

val make_virtual_gateway :
  ?virtual_gateway_id:virtual_gateway_id ->
  ?virtual_gateway_state:virtual_gateway_state ->
  unit ->
  virtual_gateway

val make_virtual_gateways : ?virtual_gateways:virtual_gateway_list -> unit -> virtual_gateways

val make_virtual_interfaces :
  ?virtual_interfaces:virtual_interface_list ->
  ?next_token:pagination_token ->
  unit ->
  virtual_interfaces

val make_describe_virtual_interfaces_request :
  ?connection_id:connection_id ->
  ?virtual_interface_id:virtual_interface_id ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  describe_virtual_interfaces_request

val make_disassociate_connection_from_lag_request :
  connection_id:connection_id -> lag_id:lag_id -> unit -> disassociate_connection_from_lag_request

val make_disassociate_mac_sec_key_response :
  ?connection_id:connection_id ->
  ?mac_sec_keys:mac_sec_key_list ->
  unit ->
  disassociate_mac_sec_key_response

val make_disassociate_mac_sec_key_request :
  connection_id:connection_id -> secret_ar_n:secret_ar_n -> unit -> disassociate_mac_sec_key_request

val make_virtual_interface_test_history :
  ?test_id:test_id ->
  ?virtual_interface_id:virtual_interface_id ->
  ?bgp_peers:bgp_peer_id_list ->
  ?status:failure_test_history_status ->
  ?owner_account:owner_account ->
  ?test_duration_in_minutes:test_duration ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  unit ->
  virtual_interface_test_history

val make_list_virtual_interface_test_history_response :
  ?virtual_interface_test_history:virtual_interface_test_history_list ->
  ?next_token:pagination_token ->
  unit ->
  list_virtual_interface_test_history_response

val make_list_virtual_interface_test_history_request :
  ?test_id:test_id ->
  ?virtual_interface_id:virtual_interface_id ->
  ?bgp_peers:bgp_peer_id_list ->
  ?status:failure_test_history_status ->
  ?max_results:max_result_set_size ->
  ?next_token:pagination_token ->
  unit ->
  list_virtual_interface_test_history_request

val make_update_virtual_interface_attributes_request :
  ?mtu:mt_u ->
  ?enable_site_link:enable_site_link ->
  ?virtual_interface_name:virtual_interface_name ->
  ?rate_limit:rate_limit ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  update_virtual_interface_attributes_request

val make_update_lag_request :
  ?lag_name:lag_name ->
  ?minimum_links:count ->
  ?encryption_mode:encryption_mode ->
  lag_id:lag_id ->
  unit ->
  update_lag_request

val make_update_direct_connect_gateway_association_request :
  ?association_id:direct_connect_gateway_association_id ->
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?remove_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  unit ->
  update_direct_connect_gateway_association_request

val make_update_direct_connect_gateway_response :
  ?direct_connect_gateway:direct_connect_gateway -> unit -> update_direct_connect_gateway_response

val make_update_direct_connect_gateway_request :
  direct_connect_gateway_id:direct_connect_gateway_id ->
  new_direct_connect_gateway_name:direct_connect_gateway_name ->
  unit ->
  update_direct_connect_gateway_request

val make_update_connection_request :
  ?connection_name:connection_name ->
  ?encryption_mode:encryption_mode ->
  connection_id:connection_id ->
  unit ->
  update_connection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_stop_bgp_failover_test_response :
  ?virtual_interface_test:virtual_interface_test_history -> unit -> stop_bgp_failover_test_response

val make_stop_bgp_failover_test_request :
  virtual_interface_id:virtual_interface_id -> unit -> stop_bgp_failover_test_request

val make_start_bgp_failover_test_response :
  ?virtual_interface_test:virtual_interface_test_history -> unit -> start_bgp_failover_test_response

val make_start_bgp_failover_test_request :
  ?bgp_peers:bgp_peer_id_list ->
  ?test_duration_in_minutes:test_duration ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  start_bgp_failover_test_request
