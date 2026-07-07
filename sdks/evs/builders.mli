open Types

val make_error_detail :
  error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  error_detail

val make_vm_entitlement :
  ?error_detail:error_detail ->
  ?stopped_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_synced_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:entitlement_status ->
  ?type_:entitlement_type ->
  ?vm_name:vm_name ->
  ?connector_id:connector_id ->
  ?environment_id:environment_id ->
  ?vm_id:vm_id ->
  unit ->
  vm_entitlement

val make_eip_association :
  ?ip_address:ip_address ->
  ?allocation_id:allocation_id ->
  ?association_id:association_id ->
  unit ->
  eip_association

val make_vlan :
  ?network_acl_id:network_acl_id ->
  ?is_public:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?eip_associations:eip_association_list ->
  ?state_details:state_details ->
  ?vlan_state:vlan_state ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?subnet_id:subnet_id ->
  ?function_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cidr:cidr ->
  ?vlan_id:vlan_id ->
  unit ->
  vlan

val make_vcf_version_info :
  instance_types:instance_type_list ->
  default_esx_version:Smaws_Lib.Smithy_api.Types.string_ ->
  status:Smaws_Lib.Smithy_api.Types.string_ ->
  vcf_version:vcf_version ->
  unit ->
  vcf_version_info

val make_vcf_hostnames :
  cloud_builder:host_name ->
  sddc_manager:host_name ->
  nsx_edge2:host_name ->
  nsx_edge1:host_name ->
  nsx_manager3:host_name ->
  nsx_manager2:host_name ->
  nsx_manager1:host_name ->
  nsx:host_name ->
  v_center:host_name ->
  unit ->
  vcf_hostnames

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_connector_check :
  ?impaired_since:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_check_attempt:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?result_:check_result ->
  ?type_:check_type ->
  unit ->
  connector_check

val make_connector :
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?checks:connectors_checks_list ->
  ?status:check_result ->
  ?state_details:state_details ->
  ?state:connector_state ->
  ?secret_arn:secret_identifier ->
  ?appliance_fqdn:appliance_fqdn ->
  ?type_:connector_type ->
  ?connector_id:connector_id ->
  ?environment_id:environment_id ->
  unit ->
  connector

val make_update_environment_connector_response :
  ?connector:connector -> unit -> update_environment_connector_response

val make_update_environment_connector_request :
  ?secret_identifier:secret_identifier ->
  ?appliance_fqdn:appliance_fqdn ->
  ?client_token:client_token ->
  connector_id:connector_id ->
  environment_id:environment_id ->
  unit ->
  update_environment_connector_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:request_tag_map -> resource_arn:arn -> unit -> tag_resource_request

val make_service_access_security_groups :
  ?security_groups:security_groups -> unit -> service_access_security_groups

val make_secret : ?secret_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> secret
val make_network_interface : ?network_interface_id:network_interface_id -> unit -> network_interface

val make_list_vm_entitlements_response :
  ?entitlements:vm_entitlement_list ->
  ?next_token:pagination_token ->
  unit ->
  list_vm_entitlements_response

val make_list_vm_entitlements_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  entitlement_type:entitlement_type ->
  connector_id:connector_id ->
  environment_id:environment_id ->
  unit ->
  list_vm_entitlements_request

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_environment_summary :
  ?environment_arn:arn ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?environment_state:environment_state ->
  ?environment_status:check_result ->
  ?vcf_version:vcf_version ->
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  environment_summary

val make_list_environments_response :
  ?environment_summaries:environment_summary_list ->
  ?next_token:pagination_token ->
  unit ->
  list_environments_response

val make_list_environments_request :
  ?state:environment_state_list ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_environments_request

val make_list_environment_vlans_response :
  ?environment_vlans:vlan_list ->
  ?next_token:pagination_token ->
  unit ->
  list_environment_vlans_response

val make_list_environment_vlans_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  environment_id:environment_id ->
  unit ->
  list_environment_vlans_request

val make_host :
  ?network_interfaces:network_interface_list ->
  ?ec2_instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?state_details:state_details ->
  ?host_state:host_state ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?dedicated_host_id:dedicated_host_id ->
  ?placement_group_id:placement_group_id ->
  ?instance_type:instance_type ->
  ?key_name:key_name ->
  ?ip_address:ip_address ->
  ?host_name:host_name ->
  unit ->
  host

val make_list_environment_hosts_response :
  ?environment_hosts:host_list ->
  ?next_token:pagination_token ->
  unit ->
  list_environment_hosts_response

val make_list_environment_hosts_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  environment_id:environment_id ->
  unit ->
  list_environment_hosts_request

val make_list_environment_connectors_response :
  ?connectors:connector_list ->
  ?next_token:pagination_token ->
  unit ->
  list_environment_connectors_response

val make_list_environment_connectors_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  environment_id:environment_id ->
  unit ->
  list_environment_connectors_request

val make_license_info :
  vsan_key:v_san_license_key -> solution_key:solution_key -> unit -> license_info

val make_instance_type_esx_versions_info :
  esx_versions:esx_version_list ->
  instance_type:instance_type ->
  unit ->
  instance_type_esx_versions_info

val make_initial_vlan_info : cidr:cidr -> unit -> initial_vlan_info

val make_initial_vlans :
  ?hcx_network_acl_id:network_acl_id ->
  ?is_hcx_public:Smaws_Lib.Smithy_api.Types.boolean_ ->
  expansion_vlan2:initial_vlan_info ->
  expansion_vlan1:initial_vlan_info ->
  hcx:initial_vlan_info ->
  nsx_uplink:initial_vlan_info ->
  edge_v_tep:initial_vlan_info ->
  v_tep:initial_vlan_info ->
  v_san:initial_vlan_info ->
  v_motion:initial_vlan_info ->
  vm_management:initial_vlan_info ->
  vmk_management:initial_vlan_info ->
  unit ->
  initial_vlans

val make_host_info_for_create :
  ?dedicated_host_id:dedicated_host_id ->
  ?placement_group_id:placement_group_id ->
  instance_type:instance_type ->
  key_name:key_name ->
  host_name:host_name ->
  unit ->
  host_info_for_create

val make_get_versions_response :
  instance_type_esx_versions:instance_type_esx_versions_list ->
  vcf_versions:vcf_version_list ->
  unit ->
  get_versions_response

val make_get_versions_request : unit -> unit

val make_check :
  ?impaired_since:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?result_:check_result ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:check_type ->
  unit ->
  check

val make_connectivity_info :
  private_route_server_peerings:route_server_peering_list -> unit -> connectivity_info

val make_environment :
  ?credentials:secret_list ->
  ?service_access_security_groups:service_access_security_groups ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vcf_hostnames:vcf_hostnames ->
  ?connectivity_info:connectivity_info ->
  ?checks:checks_list ->
  ?environment_status:check_result ->
  ?site_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_info:license_info_list ->
  ?terms_accepted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vcf_version:vcf_version ->
  ?service_access_subnet_id:subnet_id ->
  ?vpc_id:vpc_id ->
  ?environment_name:environment_name ->
  ?environment_arn:arn ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?state_details:state_details ->
  ?environment_state:environment_state ->
  ?environment_id:environment_id ->
  unit ->
  environment

val make_get_environment_response : ?environment:environment -> unit -> get_environment_response
val make_get_environment_request : environment_id:environment_id -> unit -> get_environment_request

val make_get_depot_url_response :
  token:Smaws_Lib.Smithy_api.Types.string_ ->
  depot_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_depot_url_response

val make_get_depot_url_request :
  ?rotate:Smaws_Lib.Smithy_api.Types.boolean_ ->
  environment_id:environment_id ->
  unit ->
  get_depot_url_request

val make_disassociate_eip_from_vlan_response :
  ?vlan:vlan -> unit -> disassociate_eip_from_vlan_response

val make_disassociate_eip_from_vlan_request :
  ?client_token:client_token ->
  association_id:association_id ->
  vlan_name:Smaws_Lib.Smithy_api.Types.string_ ->
  environment_id:environment_id ->
  unit ->
  disassociate_eip_from_vlan_request

val make_delete_environment_response :
  ?environment:environment -> unit -> delete_environment_response

val make_delete_environment_request :
  ?client_token:client_token -> environment_id:environment_id -> unit -> delete_environment_request

val make_delete_environment_host_response :
  ?host:host -> ?environment_summary:environment_summary -> unit -> delete_environment_host_response

val make_delete_environment_host_request :
  ?client_token:client_token ->
  host_name:host_name ->
  environment_id:environment_id ->
  unit ->
  delete_environment_host_request

val make_delete_environment_connector_response :
  ?environment_summary:environment_summary ->
  ?connector:connector ->
  unit ->
  delete_environment_connector_response

val make_delete_environment_connector_request :
  ?client_token:client_token ->
  connector_id:connector_id ->
  environment_id:environment_id ->
  unit ->
  delete_environment_connector_request

val make_delete_entitlement_response :
  ?entitlements:vm_entitlement_list -> unit -> delete_entitlement_response

val make_delete_entitlement_request :
  ?client_token:client_token ->
  vm_ids:vm_id_list ->
  entitlement_type:entitlement_type ->
  connector_id:connector_id ->
  environment_id:environment_id ->
  unit ->
  delete_entitlement_request

val make_create_environment_response :
  ?environment:environment -> unit -> create_environment_response

val make_create_environment_request :
  ?site_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vcf_hostnames:vcf_hostnames ->
  ?hosts:host_info_for_create_list ->
  ?license_info:license_info_list ->
  ?connectivity_info:connectivity_info ->
  ?service_access_security_groups:service_access_security_groups ->
  ?tags:request_tag_map ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?environment_name:environment_name ->
  ?client_token:client_token ->
  initial_vlans:initial_vlans ->
  terms_accepted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  vcf_version:vcf_version ->
  service_access_subnet_id:subnet_id ->
  vpc_id:vpc_id ->
  unit ->
  create_environment_request

val make_create_environment_host_response :
  ?host:host -> ?environment_summary:environment_summary -> unit -> create_environment_host_response

val make_create_environment_host_request :
  ?esx_version:esx_version ->
  ?client_token:client_token ->
  host:host_info_for_create ->
  environment_id:environment_id ->
  unit ->
  create_environment_host_request

val make_create_environment_connector_response :
  ?connector:connector -> unit -> create_environment_connector_response

val make_create_environment_connector_request :
  ?client_token:client_token ->
  secret_identifier:secret_identifier ->
  appliance_fqdn:appliance_fqdn ->
  type_:connector_type ->
  environment_id:environment_id ->
  unit ->
  create_environment_connector_request

val make_create_entitlement_response :
  ?entitlements:vm_entitlement_list -> unit -> create_entitlement_response

val make_create_entitlement_request :
  ?client_token:client_token ->
  vm_ids:vm_id_list ->
  entitlement_type:entitlement_type ->
  connector_id:connector_id ->
  environment_id:environment_id ->
  unit ->
  create_entitlement_request

val make_associate_eip_to_vlan_response : ?vlan:vlan -> unit -> associate_eip_to_vlan_response

val make_associate_eip_to_vlan_request :
  ?client_token:client_token ->
  allocation_id:allocation_id ->
  vlan_name:Smaws_Lib.Smithy_api.Types.string_ ->
  environment_id:environment_id ->
  unit ->
  associate_eip_to_vlan_request
