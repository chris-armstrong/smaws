open Types

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:arn -> tags:request_tag_map -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_instance_type_esx_versions_info :
  instance_type:instance_type ->
  esx_versions:esx_version_list ->
  unit ->
  instance_type_esx_versions_info

val make_vcf_version_info :
  vcf_version:vcf_version ->
  status:Smaws_Lib.Smithy_api.Types.string_ ->
  default_esx_version:Smaws_Lib.Smithy_api.Types.string_ ->
  instance_types:instance_type_list ->
  unit ->
  vcf_version_info

val make_get_versions_response :
  vcf_versions:vcf_version_list ->
  instance_type_esx_versions:instance_type_esx_versions_list ->
  unit ->
  get_versions_response

val make_get_versions_request : unit -> unit

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_eip_association :
  ?association_id:association_id ->
  ?allocation_id:allocation_id ->
  ?ip_address:ip_address ->
  unit ->
  eip_association

val make_vlan :
  ?vlan_id:vlan_id ->
  ?cidr:cidr ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?function_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subnet_id:subnet_id ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?vlan_state:vlan_state ->
  ?state_details:state_details ->
  ?eip_associations:eip_association_list ->
  ?is_public:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?network_acl_id:network_acl_id ->
  unit ->
  vlan

val make_associate_eip_to_vlan_response : ?vlan:vlan -> unit -> associate_eip_to_vlan_response

val make_associate_eip_to_vlan_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  vlan_name:Smaws_Lib.Smithy_api.Types.string_ ->
  allocation_id:allocation_id ->
  unit ->
  associate_eip_to_vlan_request

val make_check :
  ?type_:check_type ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?result_:check_result ->
  ?impaired_since:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  check

val make_connectivity_info :
  private_route_server_peerings:route_server_peering_list -> unit -> connectivity_info

val make_connector_check :
  ?type_:check_type ->
  ?result_:check_result ->
  ?last_check_attempt:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?impaired_since:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  connector_check

val make_connector :
  ?environment_id:environment_id ->
  ?connector_id:connector_id ->
  ?type_:connector_type ->
  ?appliance_fqdn:appliance_fqdn ->
  ?secret_arn:secret_identifier ->
  ?state:connector_state ->
  ?state_details:state_details ->
  ?status:check_result ->
  ?checks:connectors_checks_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  connector

val make_error_detail :
  error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  error_detail

val make_vm_entitlement :
  ?vm_id:vm_id ->
  ?environment_id:environment_id ->
  ?connector_id:connector_id ->
  ?vm_name:vm_name ->
  ?type_:entitlement_type ->
  ?status:entitlement_status ->
  ?last_synced_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?stopped_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?error_detail:error_detail ->
  unit ->
  vm_entitlement

val make_create_entitlement_response :
  ?entitlements:vm_entitlement_list -> unit -> create_entitlement_response

val make_create_entitlement_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  connector_id:connector_id ->
  entitlement_type:entitlement_type ->
  vm_ids:vm_id_list ->
  unit ->
  create_entitlement_request

val make_secret : ?secret_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> secret

val make_service_access_security_groups :
  ?security_groups:security_groups -> unit -> service_access_security_groups

val make_vcf_hostnames :
  v_center:host_name ->
  nsx:host_name ->
  nsx_manager1:host_name ->
  nsx_manager2:host_name ->
  nsx_manager3:host_name ->
  nsx_edge1:host_name ->
  nsx_edge2:host_name ->
  sddc_manager:host_name ->
  cloud_builder:host_name ->
  unit ->
  vcf_hostnames

val make_license_info :
  solution_key:solution_key -> vsan_key:v_san_license_key -> unit -> license_info

val make_environment :
  ?environment_id:environment_id ->
  ?environment_state:environment_state ->
  ?state_details:state_details ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?environment_arn:arn ->
  ?environment_name:environment_name ->
  ?vpc_id:vpc_id ->
  ?service_access_subnet_id:subnet_id ->
  ?vcf_version:vcf_version ->
  ?terms_accepted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_info:license_info_list ->
  ?site_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?environment_status:check_result ->
  ?checks:checks_list ->
  ?connectivity_info:connectivity_info ->
  ?vcf_hostnames:vcf_hostnames ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service_access_security_groups:service_access_security_groups ->
  ?credentials:secret_list ->
  unit ->
  environment

val make_create_environment_response :
  ?environment:environment -> unit -> create_environment_response

val make_host_info_for_create :
  ?placement_group_id:placement_group_id ->
  ?dedicated_host_id:dedicated_host_id ->
  host_name:host_name ->
  key_name:key_name ->
  instance_type:instance_type ->
  unit ->
  host_info_for_create

val make_initial_vlan_info : cidr:cidr -> unit -> initial_vlan_info

val make_initial_vlans :
  ?is_hcx_public:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?hcx_network_acl_id:network_acl_id ->
  vmk_management:initial_vlan_info ->
  vm_management:initial_vlan_info ->
  v_motion:initial_vlan_info ->
  v_san:initial_vlan_info ->
  v_tep:initial_vlan_info ->
  edge_v_tep:initial_vlan_info ->
  nsx_uplink:initial_vlan_info ->
  hcx:initial_vlan_info ->
  expansion_vlan1:initial_vlan_info ->
  expansion_vlan2:initial_vlan_info ->
  unit ->
  initial_vlans

val make_create_environment_request :
  ?client_token:client_token ->
  ?environment_name:environment_name ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:request_tag_map ->
  ?service_access_security_groups:service_access_security_groups ->
  ?connectivity_info:connectivity_info ->
  ?license_info:license_info_list ->
  ?hosts:host_info_for_create_list ->
  ?vcf_hostnames:vcf_hostnames ->
  ?site_id:Smaws_Lib.Smithy_api.Types.string_ ->
  vpc_id:vpc_id ->
  service_access_subnet_id:subnet_id ->
  vcf_version:vcf_version ->
  terms_accepted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  initial_vlans:initial_vlans ->
  unit ->
  create_environment_request

val make_create_environment_connector_response :
  ?connector:connector -> unit -> create_environment_connector_response

val make_create_environment_connector_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  type_:connector_type ->
  appliance_fqdn:appliance_fqdn ->
  secret_identifier:secret_identifier ->
  unit ->
  create_environment_connector_request

val make_network_interface : ?network_interface_id:network_interface_id -> unit -> network_interface

val make_host :
  ?host_name:host_name ->
  ?ip_address:ip_address ->
  ?key_name:key_name ->
  ?instance_type:instance_type ->
  ?placement_group_id:placement_group_id ->
  ?dedicated_host_id:dedicated_host_id ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?host_state:host_state ->
  ?state_details:state_details ->
  ?ec2_instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?network_interfaces:network_interface_list ->
  unit ->
  host

val make_environment_summary :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  ?vcf_version:vcf_version ->
  ?environment_status:check_result ->
  ?environment_state:environment_state ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?environment_arn:arn ->
  unit ->
  environment_summary

val make_create_environment_host_response :
  ?environment_summary:environment_summary -> ?host:host -> unit -> create_environment_host_response

val make_create_environment_host_request :
  ?client_token:client_token ->
  ?esx_version:esx_version ->
  environment_id:environment_id ->
  host:host_info_for_create ->
  unit ->
  create_environment_host_request

val make_delete_entitlement_response :
  ?entitlements:vm_entitlement_list -> unit -> delete_entitlement_response

val make_delete_entitlement_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  connector_id:connector_id ->
  entitlement_type:entitlement_type ->
  vm_ids:vm_id_list ->
  unit ->
  delete_entitlement_request

val make_delete_environment_response :
  ?environment:environment -> unit -> delete_environment_response

val make_delete_environment_request :
  ?client_token:client_token -> environment_id:environment_id -> unit -> delete_environment_request

val make_delete_environment_connector_response :
  ?connector:connector ->
  ?environment_summary:environment_summary ->
  unit ->
  delete_environment_connector_response

val make_delete_environment_connector_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  connector_id:connector_id ->
  unit ->
  delete_environment_connector_request

val make_delete_environment_host_response :
  ?environment_summary:environment_summary -> ?host:host -> unit -> delete_environment_host_response

val make_delete_environment_host_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  host_name:host_name ->
  unit ->
  delete_environment_host_request

val make_disassociate_eip_from_vlan_response :
  ?vlan:vlan -> unit -> disassociate_eip_from_vlan_response

val make_disassociate_eip_from_vlan_request :
  ?client_token:client_token ->
  environment_id:environment_id ->
  vlan_name:Smaws_Lib.Smithy_api.Types.string_ ->
  association_id:association_id ->
  unit ->
  disassociate_eip_from_vlan_request

val make_get_depot_url_response :
  depot_url:Smaws_Lib.Smithy_api.Types.string_ ->
  token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_depot_url_response

val make_get_depot_url_request :
  ?rotate:Smaws_Lib.Smithy_api.Types.boolean_ ->
  environment_id:environment_id ->
  unit ->
  get_depot_url_request

val make_get_environment_response : ?environment:environment -> unit -> get_environment_response
val make_get_environment_request : environment_id:environment_id -> unit -> get_environment_request

val make_list_environment_connectors_response :
  ?next_token:pagination_token ->
  ?connectors:connector_list ->
  unit ->
  list_environment_connectors_response

val make_list_environment_connectors_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  unit ->
  list_environment_connectors_request

val make_list_environment_hosts_response :
  ?next_token:pagination_token ->
  ?environment_hosts:host_list ->
  unit ->
  list_environment_hosts_response

val make_list_environment_hosts_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  unit ->
  list_environment_hosts_request

val make_list_environment_vlans_response :
  ?next_token:pagination_token ->
  ?environment_vlans:vlan_list ->
  unit ->
  list_environment_vlans_response

val make_list_environment_vlans_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  unit ->
  list_environment_vlans_request

val make_list_environments_response :
  ?next_token:pagination_token ->
  ?environment_summaries:environment_summary_list ->
  unit ->
  list_environments_response

val make_list_environments_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?state:environment_state_list ->
  unit ->
  list_environments_request

val make_list_vm_entitlements_response :
  ?next_token:pagination_token ->
  ?entitlements:vm_entitlement_list ->
  unit ->
  list_vm_entitlements_response

val make_list_vm_entitlements_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  connector_id:connector_id ->
  entitlement_type:entitlement_type ->
  unit ->
  list_vm_entitlements_request

val make_update_environment_connector_response :
  ?connector:connector -> unit -> update_environment_connector_response

val make_update_environment_connector_request :
  ?client_token:client_token ->
  ?appliance_fqdn:appliance_fqdn ->
  ?secret_identifier:secret_identifier ->
  environment_id:environment_id ->
  connector_id:connector_id ->
  unit ->
  update_environment_connector_request
