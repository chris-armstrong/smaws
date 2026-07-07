open Types

let make_error_detail ~error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_detail)

let make_vm_entitlement ?error_detail:(error_detail_ : error_detail option)
    ?stopped_at:(stopped_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_synced_at:(last_synced_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : entitlement_status option) ?type_:(type__ : entitlement_type option)
    ?vm_name:(vm_name_ : vm_name option) ?connector_id:(connector_id_ : connector_id option)
    ?environment_id:(environment_id_ : environment_id option) ?vm_id:(vm_id_ : vm_id option) () =
  ({
     error_detail = error_detail_;
     stopped_at = stopped_at_;
     started_at = started_at_;
     last_synced_at = last_synced_at_;
     status = status_;
     type_ = type__;
     vm_name = vm_name_;
     connector_id = connector_id_;
     environment_id = environment_id_;
     vm_id = vm_id_;
   }
    : vm_entitlement)

let make_eip_association ?ip_address:(ip_address_ : ip_address option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?association_id:(association_id_ : association_id option) () =
  ({ ip_address = ip_address_; allocation_id = allocation_id_; association_id = association_id_ }
    : eip_association)

let make_vlan ?network_acl_id:(network_acl_id_ : network_acl_id option)
    ?is_public:(is_public_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?eip_associations:(eip_associations_ : eip_association_list option)
    ?state_details:(state_details_ : state_details option)
    ?vlan_state:(vlan_state_ : vlan_state option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?function_name:(function_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cidr:(cidr_ : cidr option) ?vlan_id:(vlan_id_ : vlan_id option) () =
  ({
     network_acl_id = network_acl_id_;
     is_public = is_public_;
     eip_associations = eip_associations_;
     state_details = state_details_;
     vlan_state = vlan_state_;
     modified_at = modified_at_;
     created_at = created_at_;
     subnet_id = subnet_id_;
     function_name = function_name_;
     availability_zone = availability_zone_;
     cidr = cidr_;
     vlan_id = vlan_id_;
   }
    : vlan)

let make_vcf_version_info ~instance_types:(instance_types_ : instance_type_list)
    ~default_esx_version:(default_esx_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : Smaws_Lib.Smithy_api.Types.string_) ~vcf_version:(vcf_version_ : vcf_version)
    () =
  ({
     instance_types = instance_types_;
     default_esx_version = default_esx_version_;
     status = status_;
     vcf_version = vcf_version_;
   }
    : vcf_version_info)

let make_vcf_hostnames ~cloud_builder:(cloud_builder_ : host_name)
    ~sddc_manager:(sddc_manager_ : host_name) ~nsx_edge2:(nsx_edge2_ : host_name)
    ~nsx_edge1:(nsx_edge1_ : host_name) ~nsx_manager3:(nsx_manager3_ : host_name)
    ~nsx_manager2:(nsx_manager2_ : host_name) ~nsx_manager1:(nsx_manager1_ : host_name)
    ~nsx:(nsx_ : host_name) ~v_center:(v_center_ : host_name) () =
  ({
     cloud_builder = cloud_builder_;
     sddc_manager = sddc_manager_;
     nsx_edge2 = nsx_edge2_;
     nsx_edge1 = nsx_edge1_;
     nsx_manager3 = nsx_manager3_;
     nsx_manager2 = nsx_manager2_;
     nsx_manager1 = nsx_manager1_;
     nsx = nsx_;
     v_center = v_center_;
   }
    : vcf_hostnames)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_connector_check
    ?impaired_since:(impaired_since_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_check_attempt:(last_check_attempt_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?result_:(result__ : check_result option) ?type_:(type__ : check_type option) () =
  ({
     impaired_since = impaired_since_;
     last_check_attempt = last_check_attempt_;
     result_ = result__;
     type_ = type__;
   }
    : connector_check)

let make_connector ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?checks:(checks_ : connectors_checks_list option) ?status:(status_ : check_result option)
    ?state_details:(state_details_ : state_details option) ?state:(state_ : connector_state option)
    ?secret_arn:(secret_arn_ : secret_identifier option)
    ?appliance_fqdn:(appliance_fqdn_ : appliance_fqdn option)
    ?type_:(type__ : connector_type option) ?connector_id:(connector_id_ : connector_id option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     checks = checks_;
     status = status_;
     state_details = state_details_;
     state = state_;
     secret_arn = secret_arn_;
     appliance_fqdn = appliance_fqdn_;
     type_ = type__;
     connector_id = connector_id_;
     environment_id = environment_id_;
   }
    : connector)

let make_update_environment_connector_response ?connector:(connector_ : connector option) () =
  ({ connector = connector_ } : update_environment_connector_response)

let make_update_environment_connector_request
    ?secret_identifier:(secret_identifier_ : secret_identifier option)
    ?appliance_fqdn:(appliance_fqdn_ : appliance_fqdn option)
    ?client_token:(client_token_ : client_token option) ~connector_id:(connector_id_ : connector_id)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     secret_identifier = secret_identifier_;
     appliance_fqdn = appliance_fqdn_;
     connector_id = connector_id_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : update_environment_connector_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~resource_arn:(resource_arn_ : arn)
    () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : request_tag_map) ~resource_arn:(resource_arn_ : arn) ()
    =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_service_access_security_groups ?security_groups:(security_groups_ : security_groups option)
    () =
  ({ security_groups = security_groups_ } : service_access_security_groups)

let make_secret ?secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ secret_arn = secret_arn_ } : secret)

let make_network_interface
    ?network_interface_id:(network_interface_id_ : network_interface_id option) () =
  ({ network_interface_id = network_interface_id_ } : network_interface)

let make_list_vm_entitlements_response ?entitlements:(entitlements_ : vm_entitlement_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ entitlements = entitlements_; next_token = next_token_ } : list_vm_entitlements_response)

let make_list_vm_entitlements_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~entitlement_type:(entitlement_type_ : entitlement_type)
    ~connector_id:(connector_id_ : connector_id) ~environment_id:(environment_id_ : environment_id)
    () =
  ({
     entitlement_type = entitlement_type_;
     connector_id = connector_id_;
     environment_id = environment_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_vm_entitlements_request)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_environment_summary ?environment_arn:(environment_arn_ : arn option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?environment_state:(environment_state_ : environment_state option)
    ?environment_status:(environment_status_ : check_result option)
    ?vcf_version:(vcf_version_ : vcf_version option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({
     environment_arn = environment_arn_;
     modified_at = modified_at_;
     created_at = created_at_;
     environment_state = environment_state_;
     environment_status = environment_status_;
     vcf_version = vcf_version_;
     environment_name = environment_name_;
     environment_id = environment_id_;
   }
    : environment_summary)

let make_list_environments_response
    ?environment_summaries:(environment_summaries_ : environment_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ environment_summaries = environment_summaries_; next_token = next_token_ }
    : list_environments_response)

let make_list_environments_request ?state:(state_ : environment_state_list option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ state = state_; max_results = max_results_; next_token = next_token_ }
    : list_environments_request)

let make_list_environment_vlans_response ?environment_vlans:(environment_vlans_ : vlan_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ environment_vlans = environment_vlans_; next_token = next_token_ }
    : list_environment_vlans_response)

let make_list_environment_vlans_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_; max_results = max_results_; next_token = next_token_ }
    : list_environment_vlans_request)

let make_host ?network_interfaces:(network_interfaces_ : network_interface_list option)
    ?ec2_instance_id:(ec2_instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?state_details:(state_details_ : state_details option)
    ?host_state:(host_state_ : host_state option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?dedicated_host_id:(dedicated_host_id_ : dedicated_host_id option)
    ?placement_group_id:(placement_group_id_ : placement_group_id option)
    ?instance_type:(instance_type_ : instance_type option) ?key_name:(key_name_ : key_name option)
    ?ip_address:(ip_address_ : ip_address option) ?host_name:(host_name_ : host_name option) () =
  ({
     network_interfaces = network_interfaces_;
     ec2_instance_id = ec2_instance_id_;
     state_details = state_details_;
     host_state = host_state_;
     modified_at = modified_at_;
     created_at = created_at_;
     dedicated_host_id = dedicated_host_id_;
     placement_group_id = placement_group_id_;
     instance_type = instance_type_;
     key_name = key_name_;
     ip_address = ip_address_;
     host_name = host_name_;
   }
    : host)

let make_list_environment_hosts_response ?environment_hosts:(environment_hosts_ : host_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ environment_hosts = environment_hosts_; next_token = next_token_ }
    : list_environment_hosts_response)

let make_list_environment_hosts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_; max_results = max_results_; next_token = next_token_ }
    : list_environment_hosts_request)

let make_list_environment_connectors_response ?connectors:(connectors_ : connector_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ connectors = connectors_; next_token = next_token_ } : list_environment_connectors_response)

let make_list_environment_connectors_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_; max_results = max_results_; next_token = next_token_ }
    : list_environment_connectors_request)

let make_license_info ~vsan_key:(vsan_key_ : v_san_license_key)
    ~solution_key:(solution_key_ : solution_key) () =
  ({ vsan_key = vsan_key_; solution_key = solution_key_ } : license_info)

let make_instance_type_esx_versions_info ~esx_versions:(esx_versions_ : esx_version_list)
    ~instance_type:(instance_type_ : instance_type) () =
  ({ esx_versions = esx_versions_; instance_type = instance_type_ }
    : instance_type_esx_versions_info)

let make_initial_vlan_info ~cidr:(cidr_ : cidr) () = ({ cidr = cidr_ } : initial_vlan_info)

let make_initial_vlans ?hcx_network_acl_id:(hcx_network_acl_id_ : network_acl_id option)
    ?is_hcx_public:(is_hcx_public_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~expansion_vlan2:(expansion_vlan2_ : initial_vlan_info)
    ~expansion_vlan1:(expansion_vlan1_ : initial_vlan_info) ~hcx:(hcx_ : initial_vlan_info)
    ~nsx_uplink:(nsx_uplink_ : initial_vlan_info) ~edge_v_tep:(edge_v_tep_ : initial_vlan_info)
    ~v_tep:(v_tep_ : initial_vlan_info) ~v_san:(v_san_ : initial_vlan_info)
    ~v_motion:(v_motion_ : initial_vlan_info) ~vm_management:(vm_management_ : initial_vlan_info)
    ~vmk_management:(vmk_management_ : initial_vlan_info) () =
  ({
     hcx_network_acl_id = hcx_network_acl_id_;
     is_hcx_public = is_hcx_public_;
     expansion_vlan2 = expansion_vlan2_;
     expansion_vlan1 = expansion_vlan1_;
     hcx = hcx_;
     nsx_uplink = nsx_uplink_;
     edge_v_tep = edge_v_tep_;
     v_tep = v_tep_;
     v_san = v_san_;
     v_motion = v_motion_;
     vm_management = vm_management_;
     vmk_management = vmk_management_;
   }
    : initial_vlans)

let make_host_info_for_create ?dedicated_host_id:(dedicated_host_id_ : dedicated_host_id option)
    ?placement_group_id:(placement_group_id_ : placement_group_id option)
    ~instance_type:(instance_type_ : instance_type) ~key_name:(key_name_ : key_name)
    ~host_name:(host_name_ : host_name) () =
  ({
     dedicated_host_id = dedicated_host_id_;
     placement_group_id = placement_group_id_;
     instance_type = instance_type_;
     key_name = key_name_;
     host_name = host_name_;
   }
    : host_info_for_create)

let make_get_versions_response
    ~instance_type_esx_versions:(instance_type_esx_versions_ : instance_type_esx_versions_list)
    ~vcf_versions:(vcf_versions_ : vcf_version_list) () =
  ({ instance_type_esx_versions = instance_type_esx_versions_; vcf_versions = vcf_versions_ }
    : get_versions_response)

let make_get_versions_request () = (() : unit)

let make_check ?impaired_since:(impaired_since_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?result_:(result__ : check_result option) ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?type_:(type__ : check_type option) () =
  ({ impaired_since = impaired_since_; result_ = result__; id = id_; type_ = type__ } : check)

let make_connectivity_info
    ~private_route_server_peerings:(private_route_server_peerings_ : route_server_peering_list) () =
  ({ private_route_server_peerings = private_route_server_peerings_ } : connectivity_info)

let make_environment ?credentials:(credentials_ : secret_list option)
    ?service_access_security_groups:
      (service_access_security_groups_ : service_access_security_groups option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vcf_hostnames:(vcf_hostnames_ : vcf_hostnames option)
    ?connectivity_info:(connectivity_info_ : connectivity_info option)
    ?checks:(checks_ : checks_list option)
    ?environment_status:(environment_status_ : check_result option)
    ?site_id:(site_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_info:(license_info_ : license_info_list option)
    ?terms_accepted:(terms_accepted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vcf_version:(vcf_version_ : vcf_version option)
    ?service_access_subnet_id:(service_access_subnet_id_ : subnet_id option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?environment_arn:(environment_arn_ : arn option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?state_details:(state_details_ : state_details option)
    ?environment_state:(environment_state_ : environment_state option)
    ?environment_id:(environment_id_ : environment_id option) () =
  ({
     credentials = credentials_;
     service_access_security_groups = service_access_security_groups_;
     kms_key_id = kms_key_id_;
     vcf_hostnames = vcf_hostnames_;
     connectivity_info = connectivity_info_;
     checks = checks_;
     environment_status = environment_status_;
     site_id = site_id_;
     license_info = license_info_;
     terms_accepted = terms_accepted_;
     vcf_version = vcf_version_;
     service_access_subnet_id = service_access_subnet_id_;
     vpc_id = vpc_id_;
     environment_name = environment_name_;
     environment_arn = environment_arn_;
     modified_at = modified_at_;
     created_at = created_at_;
     state_details = state_details_;
     environment_state = environment_state_;
     environment_id = environment_id_;
   }
    : environment)

let make_get_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : get_environment_response)

let make_get_environment_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : get_environment_request)

let make_get_depot_url_response ~token:(token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~depot_url:(depot_url_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ token = token_; depot_url = depot_url_ } : get_depot_url_response)

let make_get_depot_url_request ?rotate:(rotate_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ rotate = rotate_; environment_id = environment_id_ } : get_depot_url_request)

let make_disassociate_eip_from_vlan_response ?vlan:(vlan_ : vlan option) () =
  ({ vlan = vlan_ } : disassociate_eip_from_vlan_response)

let make_disassociate_eip_from_vlan_request ?client_token:(client_token_ : client_token option)
    ~association_id:(association_id_ : association_id)
    ~vlan_name:(vlan_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     association_id = association_id_;
     vlan_name = vlan_name_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : disassociate_eip_from_vlan_request)

let make_delete_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : delete_environment_response)

let make_delete_environment_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_; client_token = client_token_ } : delete_environment_request)

let make_delete_environment_host_response ?host:(host_ : host option)
    ?environment_summary:(environment_summary_ : environment_summary option) () =
  ({ host = host_; environment_summary = environment_summary_ } : delete_environment_host_response)

let make_delete_environment_host_request ?client_token:(client_token_ : client_token option)
    ~host_name:(host_name_ : host_name) ~environment_id:(environment_id_ : environment_id) () =
  ({ host_name = host_name_; environment_id = environment_id_; client_token = client_token_ }
    : delete_environment_host_request)

let make_delete_environment_connector_response
    ?environment_summary:(environment_summary_ : environment_summary option)
    ?connector:(connector_ : connector option) () =
  ({ environment_summary = environment_summary_; connector = connector_ }
    : delete_environment_connector_response)

let make_delete_environment_connector_request ?client_token:(client_token_ : client_token option)
    ~connector_id:(connector_id_ : connector_id) ~environment_id:(environment_id_ : environment_id)
    () =
  ({ connector_id = connector_id_; environment_id = environment_id_; client_token = client_token_ }
    : delete_environment_connector_request)

let make_delete_entitlement_response ?entitlements:(entitlements_ : vm_entitlement_list option) () =
  ({ entitlements = entitlements_ } : delete_entitlement_response)

let make_delete_entitlement_request ?client_token:(client_token_ : client_token option)
    ~vm_ids:(vm_ids_ : vm_id_list) ~entitlement_type:(entitlement_type_ : entitlement_type)
    ~connector_id:(connector_id_ : connector_id) ~environment_id:(environment_id_ : environment_id)
    () =
  ({
     vm_ids = vm_ids_;
     entitlement_type = entitlement_type_;
     connector_id = connector_id_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : delete_entitlement_request)

let make_create_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : create_environment_response)

let make_create_environment_request ?site_id:(site_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vcf_hostnames:(vcf_hostnames_ : vcf_hostnames option)
    ?hosts:(hosts_ : host_info_for_create_list option)
    ?license_info:(license_info_ : license_info_list option)
    ?connectivity_info:(connectivity_info_ : connectivity_info option)
    ?service_access_security_groups:
      (service_access_security_groups_ : service_access_security_groups option)
    ?tags:(tags_ : request_tag_map option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?environment_name:(environment_name_ : environment_name option)
    ?client_token:(client_token_ : client_token option)
    ~initial_vlans:(initial_vlans_ : initial_vlans)
    ~terms_accepted:(terms_accepted_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~vcf_version:(vcf_version_ : vcf_version)
    ~service_access_subnet_id:(service_access_subnet_id_ : subnet_id) ~vpc_id:(vpc_id_ : vpc_id) ()
    =
  ({
     site_id = site_id_;
     vcf_hostnames = vcf_hostnames_;
     hosts = hosts_;
     license_info = license_info_;
     connectivity_info = connectivity_info_;
     initial_vlans = initial_vlans_;
     terms_accepted = terms_accepted_;
     vcf_version = vcf_version_;
     service_access_subnet_id = service_access_subnet_id_;
     vpc_id = vpc_id_;
     service_access_security_groups = service_access_security_groups_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     environment_name = environment_name_;
     client_token = client_token_;
   }
    : create_environment_request)

let make_create_environment_host_response ?host:(host_ : host option)
    ?environment_summary:(environment_summary_ : environment_summary option) () =
  ({ host = host_; environment_summary = environment_summary_ } : create_environment_host_response)

let make_create_environment_host_request ?esx_version:(esx_version_ : esx_version option)
    ?client_token:(client_token_ : client_token option) ~host:(host_ : host_info_for_create)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     esx_version = esx_version_;
     host = host_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : create_environment_host_request)

let make_create_environment_connector_response ?connector:(connector_ : connector option) () =
  ({ connector = connector_ } : create_environment_connector_response)

let make_create_environment_connector_request ?client_token:(client_token_ : client_token option)
    ~secret_identifier:(secret_identifier_ : secret_identifier)
    ~appliance_fqdn:(appliance_fqdn_ : appliance_fqdn) ~type_:(type__ : connector_type)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     secret_identifier = secret_identifier_;
     appliance_fqdn = appliance_fqdn_;
     type_ = type__;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : create_environment_connector_request)

let make_create_entitlement_response ?entitlements:(entitlements_ : vm_entitlement_list option) () =
  ({ entitlements = entitlements_ } : create_entitlement_response)

let make_create_entitlement_request ?client_token:(client_token_ : client_token option)
    ~vm_ids:(vm_ids_ : vm_id_list) ~entitlement_type:(entitlement_type_ : entitlement_type)
    ~connector_id:(connector_id_ : connector_id) ~environment_id:(environment_id_ : environment_id)
    () =
  ({
     vm_ids = vm_ids_;
     entitlement_type = entitlement_type_;
     connector_id = connector_id_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : create_entitlement_request)

let make_associate_eip_to_vlan_response ?vlan:(vlan_ : vlan option) () =
  ({ vlan = vlan_ } : associate_eip_to_vlan_response)

let make_associate_eip_to_vlan_request ?client_token:(client_token_ : client_token option)
    ~allocation_id:(allocation_id_ : allocation_id)
    ~vlan_name:(vlan_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     allocation_id = allocation_id_;
     vlan_name = vlan_name_;
     environment_id = environment_id_;
     client_token = client_token_;
   }
    : associate_eip_to_vlan_request)
