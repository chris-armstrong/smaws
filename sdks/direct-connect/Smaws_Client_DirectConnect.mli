(** Direct Connect client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_route_filter_prefix : ?cidr:cid_r -> unit -> route_filter_prefix

val make_bgp_peer :
  ?aws_logical_device_id:aws_logical_device_id ->
  ?aws_device_v2:aws_device_v2 ->
  ?bgp_status:bgp_status ->
  ?bgp_peer_state:bgp_peer_state ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?address_family:address_family ->
  ?auth_key:bgp_auth_key ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  ?bgp_peer_id:bgp_peer_id ->
  unit ->
  bgp_peer

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_virtual_interface :
  ?rate_limit:rate_limit ->
  ?site_link_enabled:site_link_enabled ->
  ?tags:tag_list ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?aws_device_v2:aws_device_v2 ->
  ?region:region ->
  ?bgp_peers:bgp_peer_list ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?mtu:mt_u ->
  ?customer_router_config:router_config ->
  ?virtual_interface_state:virtual_interface_state ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?amazon_side_asn:long_asn ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  ?vlan:vla_n ->
  ?virtual_interface_name:virtual_interface_name ->
  ?virtual_interface_type:virtual_interface_type ->
  ?connection_id:connection_id ->
  ?location:location_code ->
  ?virtual_interface_id:virtual_interface_id ->
  ?owner_account:owner_account ->
  unit ->
  virtual_interface

val make_virtual_interfaces :
  ?next_token:pagination_token ->
  ?virtual_interfaces:virtual_interface_list ->
  unit ->
  virtual_interfaces

val make_virtual_interface_test_history :
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?test_duration_in_minutes:test_duration ->
  ?owner_account:owner_account ->
  ?status:failure_test_history_status ->
  ?bgp_peers:bgp_peer_id_list ->
  ?virtual_interface_id:virtual_interface_id ->
  ?test_id:test_id ->
  unit ->
  virtual_interface_test_history

val make_virtual_gateway :
  ?virtual_gateway_state:virtual_gateway_state ->
  ?virtual_gateway_id:virtual_gateway_id ->
  unit ->
  virtual_gateway

val make_virtual_gateways : ?virtual_gateways:virtual_gateway_list -> unit -> virtual_gateways

val make_update_virtual_interface_attributes_request :
  ?rate_limit:rate_limit ->
  ?virtual_interface_name:virtual_interface_name ->
  ?enable_site_link:enable_site_link ->
  ?mtu:mt_u ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  update_virtual_interface_attributes_request

val make_update_lag_request :
  ?encryption_mode:encryption_mode ->
  ?minimum_links:count ->
  ?lag_name:lag_name ->
  lag_id:lag_id ->
  unit ->
  update_lag_request

val make_mac_sec_key :
  ?start_on:start_on_date ->
  ?state:state ->
  ?ckn:ckn ->
  ?secret_ar_n:secret_ar_n ->
  unit ->
  mac_sec_key

val make_rate_limiter_status :
  ?total_bandwidth:bandwidth ->
  ?remaining:count ->
  ?in_use:count ->
  ?max_allowed:count ->
  unit ->
  rate_limiter_status

val make_connection :
  ?partner_interconnect_mac_sec_capable:partner_interconnect_mac_sec_capable ->
  ?rate_limiter_status:rate_limiter_status ->
  ?mac_sec_keys:mac_sec_key_list ->
  ?encryption_mode:encryption_mode ->
  ?port_encryption_status:port_encryption_status ->
  ?mac_sec_capable:mac_sec_capable ->
  ?provider_name:provider_name ->
  ?tags:tag_list ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?aws_device_v2:aws_device_v2 ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?aws_device:aws_device ->
  ?lag_id:lag_id ->
  ?loa_issue_time:loa_issue_time ->
  ?partner_name:partner_name ->
  ?vlan:vla_n ->
  ?bandwidth:bandwidth ->
  ?location:location_code ->
  ?region:region ->
  ?connection_state:connection_state ->
  ?connection_name:connection_name ->
  ?connection_id:connection_id ->
  ?owner_account:owner_account ->
  unit ->
  connection

val make_lag :
  ?rate_limiter_status:rate_limiter_status ->
  ?mac_sec_keys:mac_sec_key_list ->
  ?encryption_mode:encryption_mode ->
  ?mac_sec_capable:mac_sec_capable ->
  ?provider_name:provider_name ->
  ?tags:tag_list ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?allows_hosted_connections:boolean_flag ->
  ?connections:connection_list ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?aws_device_v2:aws_device_v2 ->
  ?aws_device:aws_device ->
  ?minimum_links:count ->
  ?region:region ->
  ?location:location_code ->
  ?lag_state:lag_state ->
  ?lag_name:lag_name ->
  ?owner_account:owner_account ->
  ?lag_id:lag_id ->
  ?number_of_connections:count ->
  ?connections_bandwidth:bandwidth ->
  unit ->
  lag

val make_direct_connect_gateway :
  ?tags:tag_list ->
  ?state_change_error:state_change_error ->
  ?direct_connect_gateway_state:direct_connect_gateway_state ->
  ?owner_account:owner_account ->
  ?amazon_side_asn:long_asn ->
  ?direct_connect_gateway_name:direct_connect_gateway_name ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  direct_connect_gateway

val make_update_direct_connect_gateway_response :
  ?direct_connect_gateway:direct_connect_gateway -> unit -> update_direct_connect_gateway_response

val make_update_direct_connect_gateway_request :
  new_direct_connect_gateway_name:direct_connect_gateway_name ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  update_direct_connect_gateway_request

val make_associated_gateway :
  ?region:region ->
  ?owner_account:owner_account ->
  ?type_:gateway_type ->
  ?id:gateway_identifier ->
  unit ->
  associated_gateway

val make_associated_core_network :
  ?attachment_id:core_network_attachment_id ->
  ?owner_account:owner_account ->
  ?id:core_network_identifier ->
  unit ->
  associated_core_network

val make_direct_connect_gateway_association :
  ?virtual_gateway_owner_account:owner_account ->
  ?virtual_gateway_region:virtual_gateway_region ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?associated_core_network:associated_core_network ->
  ?allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?association_id:direct_connect_gateway_association_id ->
  ?associated_gateway:associated_gateway ->
  ?state_change_error:state_change_error ->
  ?association_state:direct_connect_gateway_association_state ->
  ?direct_connect_gateway_owner_account:owner_account ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  direct_connect_gateway_association

val make_update_direct_connect_gateway_association_request :
  ?remove_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?association_id:direct_connect_gateway_association_id ->
  unit ->
  update_direct_connect_gateway_association_request

val make_update_connection_request :
  ?encryption_mode:encryption_mode ->
  ?connection_name:connection_name ->
  connection_id:connection_id ->
  unit ->
  update_connection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_stop_bgp_failover_test_response :
  ?virtual_interface_test:virtual_interface_test_history -> unit -> stop_bgp_failover_test_response

val make_stop_bgp_failover_test_request :
  virtual_interface_id:virtual_interface_id -> unit -> stop_bgp_failover_test_request

val make_start_bgp_failover_test_response :
  ?virtual_interface_test:virtual_interface_test_history -> unit -> start_bgp_failover_test_response

val make_start_bgp_failover_test_request :
  ?test_duration_in_minutes:test_duration ->
  ?bgp_peers:bgp_peer_id_list ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  start_bgp_failover_test_request

val make_router_type :
  ?router_type_identifier:router_type_identifier ->
  ?xslt_template_name_for_mac_sec:xslt_template_name_for_mac_sec ->
  ?xslt_template_name:xslt_template_name ->
  ?software:software ->
  ?platform:platform ->
  ?vendor:vendor ->
  unit ->
  router_type

val make_resource_tag : ?tags:tag_list -> ?resource_arn:resource_arn -> unit -> resource_tag

val make_list_virtual_interface_test_history_response :
  ?next_token:pagination_token ->
  ?virtual_interface_test_history:virtual_interface_test_history_list ->
  unit ->
  list_virtual_interface_test_history_response

val make_list_virtual_interface_test_history_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?status:failure_test_history_status ->
  ?bgp_peers:bgp_peer_id_list ->
  ?virtual_interface_id:virtual_interface_id ->
  ?test_id:test_id ->
  unit ->
  list_virtual_interface_test_history_request

val make_disassociate_mac_sec_key_response :
  ?mac_sec_keys:mac_sec_key_list ->
  ?connection_id:connection_id ->
  unit ->
  disassociate_mac_sec_key_response

val make_disassociate_mac_sec_key_request :
  secret_ar_n:secret_ar_n -> connection_id:connection_id -> unit -> disassociate_mac_sec_key_request

val make_disassociate_connection_from_lag_request :
  lag_id:lag_id -> connection_id:connection_id -> unit -> disassociate_connection_from_lag_request

val make_describe_virtual_interfaces_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?virtual_interface_id:virtual_interface_id ->
  ?connection_id:connection_id ->
  unit ->
  describe_virtual_interfaces_request

val make_describe_tags_response : ?resource_tags:resource_tag_list -> unit -> describe_tags_response
val make_describe_tags_request : resource_arns:resource_arn_list -> unit -> describe_tags_request

val make_describe_router_configuration_response :
  ?virtual_interface_name:virtual_interface_name ->
  ?virtual_interface_id:virtual_interface_id ->
  ?router:router_type ->
  ?customer_router_config:router_config ->
  unit ->
  describe_router_configuration_response

val make_describe_router_configuration_request :
  ?router_type_identifier:router_type_identifier ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  describe_router_configuration_request

val make_location :
  ?available_mac_sec_port_speeds:available_mac_sec_port_speeds ->
  ?available_providers:provider_list ->
  ?available_port_speeds:available_port_speeds ->
  ?region:region ->
  ?location_name:location_name ->
  ?location_code:location_code ->
  unit ->
  location

val make_locations : ?locations:location_list -> unit -> locations
val make_loa : ?loa_content_type:loa_content_type -> ?loa_content:loa_content -> unit -> loa

val make_describe_loa_request :
  ?loa_content_type:loa_content_type ->
  ?provider_name:provider_name ->
  connection_id:connection_id ->
  unit ->
  describe_loa_request

val make_lags : ?next_token:pagination_token -> ?lags:lag_list -> unit -> lags

val make_describe_lags_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?lag_id:lag_id ->
  unit ->
  describe_lags_request

val make_interconnect :
  ?mac_sec_keys:mac_sec_key_list ->
  ?encryption_mode:encryption_mode ->
  ?port_encryption_status:port_encryption_status ->
  ?mac_sec_capable:mac_sec_capable ->
  ?provider_name:provider_name ->
  ?tags:tag_list ->
  ?has_logical_redundancy:has_logical_redundancy ->
  ?aws_logical_device_id:aws_logical_device_id ->
  ?aws_device_v2:aws_device_v2 ->
  ?jumbo_frame_capable:jumbo_frame_capable ->
  ?aws_device:aws_device ->
  ?lag_id:lag_id ->
  ?loa_issue_time:loa_issue_time ->
  ?bandwidth:bandwidth ->
  ?location:location_code ->
  ?region:region ->
  ?interconnect_state:interconnect_state ->
  ?interconnect_name:interconnect_name ->
  ?interconnect_id:interconnect_id ->
  unit ->
  interconnect

val make_interconnects :
  ?next_token:pagination_token -> ?interconnects:interconnect_list -> unit -> interconnects

val make_describe_interconnects_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?interconnect_id:interconnect_id ->
  unit ->
  describe_interconnects_request

val make_describe_interconnect_loa_response : ?loa:loa -> unit -> describe_interconnect_loa_response

val make_describe_interconnect_loa_request :
  ?loa_content_type:loa_content_type ->
  ?provider_name:provider_name ->
  interconnect_id:interconnect_id ->
  unit ->
  describe_interconnect_loa_request

val make_connections :
  ?next_token:pagination_token -> ?connections:connection_list -> unit -> connections

val make_describe_hosted_connections_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  connection_id:connection_id ->
  unit ->
  describe_hosted_connections_request

val make_describe_direct_connect_gateways_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  describe_direct_connect_gateways_request

val make_direct_connect_gateway_attachment :
  ?state_change_error:state_change_error ->
  ?attachment_type:direct_connect_gateway_attachment_type ->
  ?attachment_state:direct_connect_gateway_attachment_state ->
  ?virtual_interface_owner_account:owner_account ->
  ?virtual_interface_region:virtual_interface_region ->
  ?virtual_interface_id:virtual_interface_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  direct_connect_gateway_attachment

val make_describe_direct_connect_gateway_attachments_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?virtual_interface_id:virtual_interface_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  describe_direct_connect_gateway_attachments_request

val make_describe_direct_connect_gateway_associations_request :
  ?virtual_gateway_id:virtual_gateway_id ->
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?associated_gateway_id:associated_gateway_id ->
  ?association_id:direct_connect_gateway_association_id ->
  unit ->
  describe_direct_connect_gateway_associations_request

val make_direct_connect_gateway_association_proposal :
  ?requested_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?existing_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?associated_gateway:associated_gateway ->
  ?proposal_state:direct_connect_gateway_association_proposal_state ->
  ?direct_connect_gateway_owner_account:owner_account ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?proposal_id:direct_connect_gateway_association_proposal_id ->
  unit ->
  direct_connect_gateway_association_proposal

val make_describe_direct_connect_gateway_association_proposals_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?associated_gateway_id:associated_gateway_id ->
  ?proposal_id:direct_connect_gateway_association_proposal_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  describe_direct_connect_gateway_association_proposals_request

val make_customer_agreement :
  ?status:status -> ?agreement_name:agreement_name -> unit -> customer_agreement

val make_describe_customer_metadata_response :
  ?nni_partner_type:nni_partner_type ->
  ?agreements:agreement_list ->
  unit ->
  describe_customer_metadata_response

val make_describe_connections_on_interconnect_request :
  interconnect_id:interconnect_id -> unit -> describe_connections_on_interconnect_request

val make_describe_connections_request :
  ?next_token:pagination_token ->
  ?max_results:max_result_set_size ->
  ?connection_id:connection_id ->
  unit ->
  describe_connections_request

val make_describe_connection_loa_response : ?loa:loa -> unit -> describe_connection_loa_response

val make_describe_connection_loa_request :
  ?loa_content_type:loa_content_type ->
  ?provider_name:provider_name ->
  connection_id:connection_id ->
  unit ->
  describe_connection_loa_request

val make_delete_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state -> unit -> delete_virtual_interface_response

val make_delete_virtual_interface_request :
  virtual_interface_id:virtual_interface_id -> unit -> delete_virtual_interface_request

val make_delete_lag_request : lag_id:lag_id -> unit -> delete_lag_request

val make_delete_interconnect_response :
  ?interconnect_state:interconnect_state -> unit -> delete_interconnect_response

val make_delete_interconnect_request :
  interconnect_id:interconnect_id -> unit -> delete_interconnect_request

val make_delete_direct_connect_gateway_association_proposal_request :
  proposal_id:direct_connect_gateway_association_proposal_id ->
  unit ->
  delete_direct_connect_gateway_association_proposal_request

val make_delete_direct_connect_gateway_association_request :
  ?virtual_gateway_id:virtual_gateway_id ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?association_id:direct_connect_gateway_association_id ->
  unit ->
  delete_direct_connect_gateway_association_request

val make_delete_direct_connect_gateway_request :
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  delete_direct_connect_gateway_request

val make_delete_connection_request :
  connection_id:connection_id -> unit -> delete_connection_request

val make_delete_bgp_peer_response :
  ?virtual_interface:virtual_interface -> unit -> delete_bgp_peer_response

val make_delete_bgp_peer_request :
  ?bgp_peer_id:bgp_peer_id ->
  ?customer_address:customer_address ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  ?virtual_interface_id:virtual_interface_id ->
  unit ->
  delete_bgp_peer_request

val make_new_transit_virtual_interface :
  ?rate_limit:rate_limit ->
  ?enable_site_link:enable_site_link ->
  ?tags:tag_list ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?mtu:mt_u ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  ?vlan:vla_n ->
  ?virtual_interface_name:virtual_interface_name ->
  unit ->
  new_transit_virtual_interface

val make_create_transit_virtual_interface_request :
  new_transit_virtual_interface:new_transit_virtual_interface ->
  connection_id:connection_id ->
  unit ->
  create_transit_virtual_interface_request

val make_new_public_virtual_interface :
  ?rate_limit:rate_limit ->
  ?tags:tag_list ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  vlan:vla_n ->
  virtual_interface_name:virtual_interface_name ->
  unit ->
  new_public_virtual_interface

val make_create_public_virtual_interface_request :
  new_public_virtual_interface:new_public_virtual_interface ->
  connection_id:connection_id ->
  unit ->
  create_public_virtual_interface_request

val make_new_private_virtual_interface :
  ?rate_limit:rate_limit ->
  ?enable_site_link:enable_site_link ->
  ?tags:tag_list ->
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_gateway_id:virtual_gateway_id ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?mtu:mt_u ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  vlan:vla_n ->
  virtual_interface_name:virtual_interface_name ->
  unit ->
  new_private_virtual_interface

val make_create_private_virtual_interface_request :
  new_private_virtual_interface:new_private_virtual_interface ->
  connection_id:connection_id ->
  unit ->
  create_private_virtual_interface_request

val make_create_lag_request :
  ?request_mac_sec:request_mac_sec ->
  ?provider_name:provider_name ->
  ?child_connection_tags:tag_list ->
  ?tags:tag_list ->
  ?connection_id:connection_id ->
  lag_name:lag_name ->
  connections_bandwidth:bandwidth ->
  location:location_code ->
  number_of_connections:count ->
  unit ->
  create_lag_request

val make_create_interconnect_request :
  ?request_mac_sec:request_mac_sec ->
  ?provider_name:provider_name ->
  ?tags:tag_list ->
  ?lag_id:lag_id ->
  location:location_code ->
  bandwidth:bandwidth ->
  interconnect_name:interconnect_name ->
  unit ->
  create_interconnect_request

val make_create_direct_connect_gateway_association_proposal_request :
  ?remove_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  gateway_id:gateway_id_to_associate ->
  direct_connect_gateway_owner_account:owner_account ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  create_direct_connect_gateway_association_proposal_request

val make_create_direct_connect_gateway_association_request :
  ?virtual_gateway_id:virtual_gateway_id ->
  ?add_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  ?gateway_id:gateway_id_to_associate ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  create_direct_connect_gateway_association_request

val make_create_direct_connect_gateway_request :
  ?amazon_side_asn:long_asn ->
  ?tags:tag_list ->
  direct_connect_gateway_name:direct_connect_gateway_name ->
  unit ->
  create_direct_connect_gateway_request

val make_create_connection_request :
  ?request_mac_sec:request_mac_sec ->
  ?provider_name:provider_name ->
  ?tags:tag_list ->
  ?lag_id:lag_id ->
  connection_name:connection_name ->
  bandwidth:bandwidth ->
  location:location_code ->
  unit ->
  create_connection_request

val make_create_bgp_peer_response :
  ?virtual_interface:virtual_interface -> unit -> create_bgp_peer_response

val make_new_bgp_peer :
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?address_family:address_family ->
  ?auth_key:bgp_auth_key ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  unit ->
  new_bgp_peer

val make_create_bgp_peer_request :
  ?new_bgp_peer:new_bgp_peer ->
  ?virtual_interface_id:virtual_interface_id ->
  unit ->
  create_bgp_peer_request

val make_confirm_transit_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_transit_virtual_interface_response

val make_confirm_transit_virtual_interface_request :
  direct_connect_gateway_id:direct_connect_gateway_id ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  confirm_transit_virtual_interface_request

val make_confirm_public_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_public_virtual_interface_response

val make_confirm_public_virtual_interface_request :
  virtual_interface_id:virtual_interface_id -> unit -> confirm_public_virtual_interface_request

val make_confirm_private_virtual_interface_response :
  ?virtual_interface_state:virtual_interface_state ->
  unit ->
  confirm_private_virtual_interface_response

val make_confirm_private_virtual_interface_request :
  ?direct_connect_gateway_id:direct_connect_gateway_id ->
  ?virtual_gateway_id:virtual_gateway_id ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  confirm_private_virtual_interface_request

val make_confirm_customer_agreement_response :
  ?status:status -> unit -> confirm_customer_agreement_response

val make_confirm_customer_agreement_request :
  ?agreement_name:agreement_name -> unit -> confirm_customer_agreement_request

val make_confirm_connection_response :
  ?connection_state:connection_state -> unit -> confirm_connection_response

val make_confirm_connection_request :
  connection_id:connection_id -> unit -> confirm_connection_request

val make_associate_virtual_interface_request :
  connection_id:connection_id ->
  virtual_interface_id:virtual_interface_id ->
  unit ->
  associate_virtual_interface_request

val make_associate_mac_sec_key_response :
  ?mac_sec_keys:mac_sec_key_list ->
  ?connection_id:connection_id ->
  unit ->
  associate_mac_sec_key_response

val make_associate_mac_sec_key_request :
  ?cak:cak ->
  ?ckn:ckn ->
  ?secret_ar_n:secret_ar_n ->
  connection_id:connection_id ->
  unit ->
  associate_mac_sec_key_request

val make_associate_hosted_connection_request :
  parent_connection_id:connection_id ->
  connection_id:connection_id ->
  unit ->
  associate_hosted_connection_request

val make_associate_connection_with_lag_request :
  lag_id:lag_id -> connection_id:connection_id -> unit -> associate_connection_with_lag_request

val make_new_transit_virtual_interface_allocation :
  ?rate_limit:rate_limit ->
  ?tags:tag_list ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?mtu:mt_u ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  ?vlan:vla_n ->
  ?virtual_interface_name:virtual_interface_name ->
  unit ->
  new_transit_virtual_interface_allocation

val make_allocate_transit_virtual_interface_request :
  new_transit_virtual_interface_allocation:new_transit_virtual_interface_allocation ->
  owner_account:owner_account ->
  connection_id:connection_id ->
  unit ->
  allocate_transit_virtual_interface_request

val make_new_public_virtual_interface_allocation :
  ?rate_limit:rate_limit ->
  ?tags:tag_list ->
  ?route_filter_prefixes:route_filter_prefix_list ->
  ?address_family:address_family ->
  ?customer_address:customer_address ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  vlan:vla_n ->
  virtual_interface_name:virtual_interface_name ->
  unit ->
  new_public_virtual_interface_allocation

val make_allocate_public_virtual_interface_request :
  new_public_virtual_interface_allocation:new_public_virtual_interface_allocation ->
  owner_account:owner_account ->
  connection_id:connection_id ->
  unit ->
  allocate_public_virtual_interface_request

val make_new_private_virtual_interface_allocation :
  ?rate_limit:rate_limit ->
  ?tags:tag_list ->
  ?customer_address:customer_address ->
  ?address_family:address_family ->
  ?amazon_address:amazon_address ->
  ?auth_key:bgp_auth_key ->
  ?mtu:mt_u ->
  ?asn_long:long_asn ->
  ?asn:as_n ->
  vlan:vla_n ->
  virtual_interface_name:virtual_interface_name ->
  unit ->
  new_private_virtual_interface_allocation

val make_allocate_private_virtual_interface_request :
  new_private_virtual_interface_allocation:new_private_virtual_interface_allocation ->
  owner_account:owner_account ->
  connection_id:connection_id ->
  unit ->
  allocate_private_virtual_interface_request

val make_allocate_hosted_connection_request :
  ?tags:tag_list ->
  vlan:vla_n ->
  connection_name:connection_name ->
  bandwidth:bandwidth ->
  owner_account:owner_account ->
  connection_id:connection_id ->
  unit ->
  allocate_hosted_connection_request

val make_allocate_connection_on_interconnect_request :
  vlan:vla_n ->
  interconnect_id:interconnect_id ->
  owner_account:owner_account ->
  connection_name:connection_name ->
  bandwidth:bandwidth ->
  unit ->
  allocate_connection_on_interconnect_request

val make_accept_direct_connect_gateway_association_proposal_request :
  ?override_allowed_prefixes_to_direct_connect_gateway:route_filter_prefix_list ->
  associated_gateway_owner_account:owner_account ->
  proposal_id:direct_connect_gateway_association_proposal_id ->
  direct_connect_gateway_id:direct_connect_gateway_id ->
  unit ->
  accept_direct_connect_gateway_association_proposal_request
(** {1:operations Operations} *)

module AcceptDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_direct_connect_gateway_association_proposal_request ->
    ( accept_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_direct_connect_gateway_association_proposal_request ->
    ( accept_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct \
   Connect gateway.\n"]

module AllocateConnectionOnInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_connection_on_interconnect_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_connection_on_interconnect_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [AllocateHostedConnection] instead.\n\
  \ \n\
  \   Creates a hosted connection on an interconnect.\n\
  \   \n\
  \    Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection \
   on the specified interconnect.\n\
  \    \n\
  \      Intended for use by Direct Connect Partners only.\n\
  \      \n\
  \       "]

module AllocateHostedConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_hosted_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_hosted_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of \
   interconnects.\n\n\
  \ Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a hosted \
   connection on the specified interconnect or LAG of interconnects. Amazon Web Services polices \
   the hosted connection for the specified capacity and the Direct Connect Partner must also \
   police the hosted connection for the specified capacity.\n\
  \ \n\
  \   Intended for use by Direct Connect Partners only.\n\
  \   \n\
  \    "]

module AllocatePrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_private_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_private_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a private virtual interface to be owned by the specified Amazon Web Services \
   account.\n\n\
  \ Virtual interfaces created using this action must be confirmed by the owner using \
   [ConfirmPrivateVirtualInterface]. Until then, the virtual interface is in the [Confirming] \
   state and is not available to handle traffic.\n\
  \ "]

module AllocatePublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_public_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_public_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a public virtual interface to be owned by the specified Amazon Web Services account.\n\n\
  \ The owner of a connection calls this function to provision a public virtual interface to be \
   owned by the specified Amazon Web Services account.\n\
  \ \n\
  \  Virtual interfaces created using this function must be confirmed by the owner using \
   [ConfirmPublicVirtualInterface]. Until this step has been completed, the virtual interface is \
   in the [confirming] state and is not available to handle traffic.\n\
  \  \n\
  \   When creating an IPv6 public virtual interface, omit the Amazon address and customer \
   address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you \
   cannot specify custom IPv6 addresses.\n\
  \   "]

module AllocateTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_transit_virtual_interface_request ->
    ( allocate_transit_virtual_interface_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_transit_virtual_interface_request ->
    ( allocate_transit_virtual_interface_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a transit virtual interface to be owned by the specified Amazon Web Services \
   account. Use this type of interface to connect a transit gateway to your Direct Connect \
   gateway.\n\n\
  \ The owner of a connection provisions a transit virtual interface to be owned by the specified \
   Amazon Web Services account.\n\
  \ \n\
  \  After you create a transit virtual interface, it must be confirmed by the owner using \
   [ConfirmTransitVirtualInterface]. Until this step has been completed, the transit virtual \
   interface is in the [requested] state and is not available to handle traffic.\n\
  \  "]

module AssociateConnectionWithLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_with_lag_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_with_lag_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an existing connection with a link aggregation group (LAG). The connection is \
   interrupted and re-established as a member of the LAG (connectivity to Amazon Web Services is \
   interrupted). The connection must be hosted on the same Direct Connect endpoint as the LAG, and \
   its bandwidth must match the bandwidth for the LAG. You can re-associate a connection that's \
   currently associated with a different LAG; however, if removing the connection would cause the \
   original LAG to fall below its setting for minimum number of operational connections, the \
   request fails.\n\n\
  \ Any virtual interfaces that are directly associated with the connection are automatically \
   re-associated with the LAG. If the connection was originally associated with a different LAG, \
   the virtual interfaces remain associated with the original LAG.\n\
  \ \n\
  \  For interconnects, any hosted connections are automatically re-associated with the LAG. If \
   the interconnect was originally associated with a different LAG, the hosted connections remain \
   associated with the original LAG.\n\
  \  "]

module AssociateHostedConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_hosted_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_hosted_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) \
   or interconnect. If the target interconnect or LAG has an existing hosted connection with a \
   conflicting VLAN number or IP address, the operation fails. This action temporarily interrupts \
   the hosted connection's connectivity to Amazon Web Services as it is being migrated.\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module AssociateMacSecKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_mac_sec_key_request ->
    ( associate_mac_sec_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_mac_sec_key_request ->
    ( associate_mac_sec_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a MAC Security (MACsec) Connection Key Name (CKN)/ Connectivity Association Key \
   (CAK) pair with a Direct Connect connection.\n\n\
  \ You must supply either the [secretARN,] or the CKN/CAK ([ckn] and [cak]) pair in the request.\n\
  \ \n\
  \  For information about MAC Security (MACsec) key considerations, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-key-consideration}MACsec \
   pre-shared CKN/CAK key considerations } in the {i Direct Connect User Guide}.\n\
  \  "]

module AssociateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a virtual interface with a specified link aggregation group (LAG) or connection. \
   Connectivity to Amazon Web Services is temporarily interrupted as the virtual interface is \
   being migrated. If the target connection or LAG has an associated virtual interface with a \
   conflicting VLAN number or a conflicting IP address, the operation fails.\n\n\
  \ Virtual interfaces associated with a hosted connection cannot be associated with a LAG; hosted \
   connections must be migrated along with their virtual interfaces using \
   [AssociateHostedConnection].\n\
  \ \n\
  \  To reassociate a virtual interface to a new connection or LAG, the requester must own either \
   the virtual interface itself or the connection to which the virtual interface is currently \
   associated. Additionally, the requester must own the connection or LAG for the association.\n\
  \  "]

module ConfirmConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_connection_request ->
    ( confirm_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_connection_request ->
    ( confirm_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms the creation of the specified hosted connection on an interconnect.\n\n\
  \ Upon creation, the hosted connection is initially in the [Ordering] state, and remains in this \
   state until the owner confirms creation of the hosted connection.\n\
  \ "]

module ConfirmCustomerAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_customer_agreement_request ->
    ( confirm_customer_agreement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_customer_agreement_request ->
    ( confirm_customer_agreement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The confirmation of the terms of agreement when creating the connection/link aggregation group \
   (LAG). \n"]

module ConfirmPrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_private_virtual_interface_request ->
    ( confirm_private_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_private_virtual_interface_request ->
    ( confirm_private_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a private virtual interface created by another Amazon Web Services \
   account.\n\n\
  \ After the virtual interface owner makes this call, the virtual interface is created and \
   attached to the specified virtual private gateway or Direct Connect gateway, and is made \
   available to handle traffic.\n\
  \ "]

module ConfirmPublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_public_virtual_interface_request ->
    ( confirm_public_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_public_virtual_interface_request ->
    ( confirm_public_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a public virtual interface created by another Amazon Web Services account.\n\n\
  \ After the virtual interface owner makes this call, the specified virtual interface is created \
   and made available to handle traffic.\n\
  \ "]

module ConfirmTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_transit_virtual_interface_request ->
    ( confirm_transit_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_transit_virtual_interface_request ->
    ( confirm_transit_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a transit virtual interface created by another Amazon Web Services \
   account.\n\n\
  \  After the owner of the transit virtual interface makes this call, the specified transit \
   virtual interface is created and made available to handle traffic.\n\
  \ "]

module CreateBGPPeer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_bgp_peer_request ->
    ( create_bgp_peer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_bgp_peer_request ->
    ( create_bgp_peer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a BGP peer on the specified virtual interface.\n\n\
  \ You must create a BGP peer for the corresponding address family (IPv4/IPv6) in order to access \
   Amazon Web Services resources that also use that address family.\n\
  \ \n\
  \  If logical redundancy is not supported by the connection, interconnect, or LAG, the BGP peer \
   cannot be in the same address family as an existing BGP peer on the virtual interface.\n\
  \  \n\
  \   When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6 addresses \
   are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom \
   IPv6 addresses.\n\
  \   \n\
  \     If you let Amazon Web Services auto-assign IPv4 addresses, a /30 CIDR will be allocated \
   from 169.254.0.0/16. Amazon Web Services does not recommend this option if you intend to use \
   the customer router peer IP address as the source and destination for traffic. Instead you \
   should use RFC 1918 or other addressing, and specify the address yourself. For more information \
   about RFC 1918 see {{:https://datatracker.ietf.org/doc/html/rfc1918} Address Allocation for \
   Private Internets}.\n\
  \     \n\
  \       For a public virtual interface, the Autonomous System Number (ASN) must be private or \
   already on the allow list for the virtual interface.\n\
  \       "]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection between a customer network and a specific Direct Connect location.\n\n\
  \ A connection links your internal network to an Direct Connect location over a standard \
   Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an \
   Direct Connect router.\n\
  \ \n\
  \  To find the locations for your Region, use [DescribeLocations].\n\
  \  \n\
  \   You can automatically add the new connection to a link aggregation group (LAG) by specifying \
   a LAG ID in the request. This ensures that the new connection is allocated on the same Direct \
   Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, \
   the request fails and no connection is created.\n\
  \   "]

module CreateDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_request ->
    ( create_direct_connect_gateway_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_request ->
    ( create_direct_connect_gateway_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a \
   set of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and \
   visible in any Amazon Web Services Region after it is created. The virtual interfaces and \
   virtual private gateways that are connected through a Direct Connect gateway can be in \
   different Amazon Web Services Regions. This enables you to connect to a VPC in any Region, \
   regardless of the Region in which the virtual interfaces are located, and pass traffic between \
   them.\n"]

module CreateDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_request ->
    ( create_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_request ->
    ( create_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an association between a Direct Connect gateway and a virtual private gateway. The \
   virtual private gateway must be attached to a VPC and must not be associated with another \
   Direct Connect gateway.\n"]

module CreateDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_proposal_request ->
    ( create_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_proposal_request ->
    ( create_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a proposal to associate the specified virtual private gateway or transit gateway with \
   the specified Direct Connect gateway.\n\n\
  \ You can associate a Direct Connect gateway and virtual private gateway or transit gateway that \
   is owned by any Amazon Web Services account. \n\
  \ "]

module CreateInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_interconnect_request ->
    ( interconnect,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_interconnect_request ->
    ( interconnect Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an interconnect between an Direct Connect Partner's network and a specific Direct \
   Connect location.\n\n\
  \ An interconnect is a connection that is capable of hosting other connections. The Direct \
   Connect Partner can use an interconnect to provide Direct Connect hosted connections to \
   customers through their own network services. Like a standard connection, an interconnect links \
   the partner's network to an Direct Connect location over a standard Ethernet fiber-optic cable. \
   One end is connected to the partner's router, the other to an Direct Connect router.\n\
  \ \n\
  \  You can automatically add the new interconnect to a link aggregation group (LAG) by \
   specifying a LAG ID in the request. This ensures that the new interconnect is allocated on the \
   same Direct Connect endpoint that hosts the specified LAG. If there are no available ports on \
   the endpoint, the request fails and no interconnect is created.\n\
  \  \n\
  \   For each end customer, the Direct Connect Partner provisions a connection on their \
   interconnect by calling [AllocateHostedConnection]. The end customer can then connect to Amazon \
   Web Services resources by creating a virtual interface on their connection, using the VLAN \
   assigned to them by the Direct Connect Partner.\n\
  \   \n\
  \     Intended for use by Direct Connect Partners only.\n\
  \     \n\
  \      "]

module CreateLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a link aggregation group (LAG) with the specified number of bundled physical dedicated \
   connections between the customer network and a specific Direct Connect location. A LAG is a \
   logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple \
   interfaces, enabling you to treat them as a single interface.\n\n\
  \ All connections in a LAG must use the same bandwidth (either 1Gbps, 10Gbps, 100Gbps, or \
   400Gbps) and must terminate at the same Direct Connect endpoint.\n\
  \ \n\
  \  You can have up to 10 dedicated connections per location. Regardless of this limit, if you \
   request more connections for the LAG than Direct Connect can allocate on a single endpoint, no \
   LAG is created..\n\
  \  \n\
  \   You can specify an existing physical dedicated connection or interconnect to include in the \
   LAG (which counts towards the total number of connections). Doing so interrupts the current \
   physical dedicated connection, and re-establishes them as a member of the LAG. The LAG will be \
   created on the same Direct Connect endpoint to which the dedicated connection terminates. Any \
   virtual interfaces associated with the dedicated connection are automatically disassociated and \
   re-associated with the LAG. The connection ID does not change.\n\
  \   \n\
  \    If the Amazon Web Services account used to create a LAG is a registered Direct Connect \
   Partner, the LAG is automatically enabled to host sub-connections. For a LAG owned by a \
   partner, any associated virtual interfaces cannot be directly configured.\n\
  \    "]

module CreatePrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_private_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_private_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a private virtual interface. A virtual interface is the VLAN that transports Direct \
   Connect traffic. A private virtual interface can be connected to either a Direct Connect \
   gateway or a Virtual Private Gateway (VGW). Connecting the private virtual interface to a \
   Direct Connect gateway enables the possibility for connecting to multiple VPCs, including VPCs \
   in different Amazon Web Services Regions. Connecting the private virtual interface to a VGW \
   only provides access to a single VPC within the same Region.\n\n\
  \ Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the \
   underlying physical connection if it wasn't updated to support jumbo frames. Updating the \
   connection disrupts network connectivity for all virtual interfaces associated with the \
   connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \ "]

module CreatePublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_public_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_public_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a public virtual interface. A virtual interface is the VLAN that transports Direct \
   Connect traffic. A public virtual interface supports sending traffic to public services of \
   Amazon Web Services such as Amazon S3.\n\n\
  \ When creating an IPv6 public virtual interface ([addressFamily] is [ipv6]), leave the \
   [customer] and [amazon] address fields blank to use auto-assigned IPv6 space. Custom IPv6 \
   addresses are not supported.\n\
  \ "]

module CreateTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_transit_virtual_interface_request ->
    ( create_transit_virtual_interface_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_transit_virtual_interface_request ->
    ( create_transit_virtual_interface_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transit virtual interface. A transit virtual interface should be used to access one \
   or more transit gateways associated with Direct Connect gateways. A transit virtual interface \
   enables the connection of multiple VPCs attached to a transit gateway to a Direct Connect \
   gateway.\n\n\
  \  If you associate your transit gateway with one or more Direct Connect gateways, the \
   Autonomous System Number (ASN) used by the transit gateway and the Direct Connect gateway must \
   be different. For example, if you use the default ASN 64512 for both your the transit gateway \
   and Direct Connect gateway, the association request fails.\n\
  \  \n\
  \    A jumbo MTU value must be either 1500 or 8500. No other values will be accepted. Setting \
   the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the underlying \
   physical connection if it wasn't updated to support jumbo frames. Updating the connection \
   disrupts network connectivity for all virtual interfaces associated with the connection for up \
   to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \    "]

module DeleteBGPPeer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_bgp_peer_request ->
    ( delete_bgp_peer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_bgp_peer_request ->
    ( delete_bgp_peer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified BGP peer on the specified virtual interface with the specified customer \
   address and ASN.\n\n\
  \ You cannot delete the last BGP peer from a virtual interface.\n\
  \ "]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified connection.\n\n\
  \ Deleting a connection only stops the Direct Connect port hour and data transfer charges. If \
   you are partnering with any third parties to connect with the Direct Connect location, you must \
   cancel your service with them separately.\n\
  \ "]

module DeleteDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_request ->
    ( delete_direct_connect_gateway_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_request ->
    ( delete_direct_connect_gateway_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that \
   are attached to the Direct Connect gateway and disassociate all virtual private gateways \
   associated with the Direct Connect gateway.\n"]

module DeleteDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_request ->
    ( delete_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_request ->
    ( delete_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between the specified Direct Connect gateway and virtual private \
   gateway.\n\n\
  \ We recommend that you specify the [associationID] to delete the association. Alternatively, if \
   you own virtual gateway and a Direct Connect gateway association, you can specify the \
   [virtualGatewayId] and [directConnectGatewayId] to delete an association.\n\
  \ "]

module DeleteDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_proposal_request ->
    ( delete_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_proposal_request ->
    ( delete_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association proposal request between the specified Direct Connect gateway and \
   virtual private gateway or transit gateway.\n"]

module DeleteInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_interconnect_request ->
    ( delete_interconnect_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_interconnect_request ->
    ( delete_interconnect_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified interconnect.\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module DeleteLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active \
   virtual interfaces or hosted connections.\n"]

module DeleteVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_interface_request ->
    ( delete_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_interface_request ->
    ( delete_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a virtual interface.\n"]

module DescribeConnectionLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_loa_request ->
    ( describe_connection_loa_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_loa_request ->
    ( describe_connection_loa_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeLoa] instead.\n\
  \ \n\
  \   Gets the LOA-CFA for a connection.\n\
  \   \n\
  \    The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that \
   your APN partner or service provider uses when establishing your cross connect to Amazon Web \
   Services at the colocation facility. For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \    "]

module DescribeConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Displays the specified connection or all connections in this Region.\n"]

module DescribeConnectionsOnInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_on_interconnect_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_on_interconnect_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeHostedConnections] instead.\n\
  \ \n\
  \   Lists the connections that have been provisioned on the specified interconnect.\n\
  \   \n\
  \     Intended for use by Direct Connect Partners only.\n\
  \     \n\
  \      "]

module DescribeCustomerMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_customer_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_customer_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get and view a list of customer agreements, along with their signed status and whether the \
   customer is an NNIPartner, NNIPartnerV2, or a nonPartner. \n"]

module DescribeDirectConnectGatewayAssociationProposals : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_association_proposals_request ->
    ( describe_direct_connect_gateway_association_proposals_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_association_proposals_request ->
    ( describe_direct_connect_gateway_association_proposals_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more association proposals for connection between a virtual private gateway or \
   transit gateway and a Direct Connect gateway. \n"]

module DescribeDirectConnectGatewayAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_associations_request ->
    ( describe_direct_connect_gateway_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_associations_request ->
    ( describe_direct_connect_gateway_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the associations between your Direct Connect gateways and virtual private gateways and \
   transit gateways. You must specify one of the following:\n\n\
  \ {ul\n\
  \       {-  A Direct Connect gateway\n\
  \           \n\
  \            The response contains all virtual private gateways and transit gateways associated \
   with the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A virtual private gateway\n\
  \           \n\
  \            The response contains the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A transit gateway\n\
  \           \n\
  \            The response contains the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a virtual private gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   virtual private gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a transit gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   transit gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a virtual private gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   virtual private gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway association to a Cloud WAN core network\n\
  \           \n\
  \            The response contains the Cloud WAN core network ID that the Direct Connect gateway \
   is associated to.\n\
  \            \n\
  \             }\n\
  \       }\n\
  \  "]

module DescribeDirectConnectGatewayAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_attachments_request ->
    ( describe_direct_connect_gateway_attachments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_attachments_request ->
    ( describe_direct_connect_gateway_attachments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the attachments between your Direct Connect gateways and virtual interfaces. You must \
   specify a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect \
   gateway, the response contains all virtual interfaces attached to the Direct Connect gateway. \
   If you specify a virtual interface, the response contains all Direct Connect gateways attached \
   to the virtual interface. If you specify both, the response contains the attachment between the \
   Direct Connect gateway and the virtual interface.\n"]

module DescribeDirectConnectGateways : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateways_request ->
    ( describe_direct_connect_gateways_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateways_request ->
    ( describe_direct_connect_gateways_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted \
   Direct Connect gateways are not returned.\n"]

module DescribeHostedConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hosted_connections_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hosted_connections_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the hosted connections that have been provisioned on the specified interconnect or link \
   aggregation group (LAG).\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module DescribeInterconnectLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnect_loa_request ->
    ( describe_interconnect_loa_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnect_loa_request ->
    ( describe_interconnect_loa_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeLoa] instead.\n\
  \ \n\
  \   Gets the LOA-CFA for the specified interconnect.\n\
  \   \n\
  \    The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that \
   is used when establishing your cross connect to Amazon Web Services at the colocation facility. \
   For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \    "]

module DescribeInterconnects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnects_request ->
    ( interconnects,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnects_request ->
    ( interconnects Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the interconnects owned by the Amazon Web Services account or only the specified \
   interconnect.\n"]

module DescribeLags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lags_request ->
    ( lags,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lags_request ->
    ( lags Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all your link aggregation groups (LAG) or the specified LAG.\n"]

module DescribeLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_loa_request ->
    ( loa,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_loa_request ->
    ( loa Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG).\n\n\
  \ The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is \
   used when establishing your cross connect to Amazon Web Services at the colocation facility. \
   For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \ "]

module DescribeLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( locations,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( locations Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Direct Connect locations in the current Amazon Web Services Region. These are the \
   locations that can be selected when calling [CreateConnection] or [CreateInterconnect].\n"]

module DescribeRouterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_router_configuration_request ->
    ( describe_router_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_router_configuration_request ->
    ( describe_router_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Details about the router. \n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the tags associated with the specified Direct Connect resources.\n"]

module DescribeVirtualGateways : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( virtual_gateways,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( virtual_gateways Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeVpnGateways] instead. See \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeVpnGateways.html}DescribeVPNGateways} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \ \n\
  \   Lists the virtual private gateways owned by the Amazon Web Services account.\n\
  \   \n\
  \    You can create one or more Direct Connect private virtual interfaces linked to a virtual \
   private gateway.\n\
  \    "]

module DescribeVirtualInterfaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_virtual_interfaces_request ->
    ( virtual_interfaces,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_virtual_interfaces_request ->
    ( virtual_interfaces Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays all virtual interfaces for an Amazon Web Services account. Virtual interfaces deleted \
   fewer than 15 minutes before you make the request are also returned. If you specify a \
   connection ID, only the virtual interfaces associated with the connection are returned. If you \
   specify a virtual interface ID, then only a single virtual interface is returned.\n\n\
  \ A virtual interface (VLAN) transmits the traffic between the Direct Connect location and the \
   customer network.\n\
  \ \n\
  \  {ul\n\
  \        {-  If you're using an [asn], the response includes the ASN value in both the [asn] and \
   [asnLong] fields.\n\
  \            \n\
  \             }\n\
  \        {-  If you're using [asnLong], the response returns a value of [0] (zero) for the [asn] \
   attribute because it exceeds the highest ASN value of 2,147,483,647 that it can support\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DisassociateConnectionFromLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_from_lag_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_from_lag_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a connection from a link aggregation group (LAG). The connection is interrupted \
   and re-established as a standalone connection (the connection is not deleted; to delete the \
   connection, use the [DeleteConnection] request). If the LAG has associated virtual interfaces \
   or hosted connections, they remain associated with the LAG. A disassociated connection owned by \
   an Direct Connect Partner is automatically converted to an interconnect.\n\n\
  \ If disassociating the connection would cause the LAG to fall below its setting for minimum \
   number of operational connections, the request fails, except when it's the last member of the \
   LAG. If all connections are disassociated, the LAG continues to exist as an empty LAG with no \
   physical connections. \n\
  \ "]

module DisassociateMacSecKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mac_sec_key_request ->
    ( disassociate_mac_sec_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mac_sec_key_request ->
    ( disassociate_mac_sec_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a MAC Security (MACsec) security key and a Direct Connect \
   connection.\n"]

module ListVirtualInterfaceTestHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_interface_test_history_request ->
    ( list_virtual_interface_test_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_interface_test_history_request ->
    ( list_virtual_interface_test_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the virtual interface failover test history.\n"]

module StartBgpFailoverTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_bgp_failover_test_request ->
    ( start_bgp_failover_test_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_bgp_failover_test_request ->
    ( start_bgp_failover_test_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the virtual interface failover test that verifies your configuration meets your \
   resiliency requirements by placing the BGP peering session in the DOWN state. You can then send \
   traffic to verify that there are no outages.\n\n\
  \ You can run the test on public, private, transit, and hosted virtual interfaces.\n\
  \ \n\
  \  You can use \
   {{:https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html}ListVirtualInterfaceTestHistory} \
   to view the virtual interface test history.\n\
  \  \n\
  \   If you need to stop the test before the test interval completes, use \
   {{:https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html}StopBgpFailoverTest}.\n\
  \   "]

module StopBgpFailoverTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_bgp_failover_test_request ->
    ( stop_bgp_failover_test_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_bgp_failover_test_request ->
    ( stop_bgp_failover_test_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the virtual interface failover test.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified Direct Connect resource. Each resource can have a \
   maximum of 50 tags.\n\n\
  \ Each tag consists of a key and an optional value. If a tag with the same key is already \
   associated with the resource, this action updates its value.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from the specified Direct Connect resource.\n"]

module UpdateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Direct Connect connection configuration.\n\n\
  \ You can update the following parameters for a connection:\n\
  \ \n\
  \  {ul\n\
  \        {-  The connection name\n\
  \            \n\
  \             }\n\
  \        {-  The connection's MAC Security (MACsec) encryption mode.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module UpdateDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_request ->
    ( update_direct_connect_gateway_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_request ->
    ( update_direct_connect_gateway_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of a current Direct Connect gateway.\n"]

module UpdateDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_association_request ->
    ( update_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_association_request ->
    ( update_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified attributes of the Direct Connect gateway association.\n\n\
  \ Add or remove prefixes from the association.\n\
  \ "]

module UpdateLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the attributes of the specified link aggregation group (LAG).\n\n\
  \ You can update the following LAG attributes:\n\
  \ \n\
  \  {ul\n\
  \        {-  The name of the LAG.\n\
  \            \n\
  \             }\n\
  \        {-  The value for the minimum number of connections that must be operational for the \
   LAG itself to be operational. \n\
  \            \n\
  \             }\n\
  \        {-  The LAG's MACsec encryption mode.\n\
  \            \n\
  \             Amazon Web Services assigns this value to each connection which is part of the LAG.\n\
  \             \n\
  \              }\n\
  \        {-  The tags\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    If you adjust the threshold value for the minimum number of operational connections, ensure \
   that the new value does not cause the LAG to fall below the threshold and become \
   non-operational.\n\
  \    \n\
  \     "]

(** {1:Serialization and Deserialization} *)
module UpdateVirtualInterfaceAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_virtual_interface_attributes_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_virtual_interface_attributes_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified attributes of the specified virtual private interface.\n\n\
  \ Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the \
   underlying physical connection if it wasn't updated to support jumbo frames. Updating the \
   connection disrupts network connectivity for all virtual interfaces associated with the \
   connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
