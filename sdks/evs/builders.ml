open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : request_tag_map) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_instance_type_esx_versions_info ~instance_type:(instance_type_ : instance_type)
    ~esx_versions:(esx_versions_ : esx_version_list) () =
  ({ instance_type = instance_type_; esx_versions = esx_versions_ }
    : instance_type_esx_versions_info)

let make_vcf_version_info ~vcf_version:(vcf_version_ : vcf_version)
    ~status:(status_ : Smaws_Lib.Smithy_api.Types.string_)
    ~default_esx_version:(default_esx_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~instance_types:(instance_types_ : instance_type_list) () =
  ({
     vcf_version = vcf_version_;
     status = status_;
     default_esx_version = default_esx_version_;
     instance_types = instance_types_;
   }
    : vcf_version_info)

let make_get_versions_response ~vcf_versions:(vcf_versions_ : vcf_version_list)
    ~instance_type_esx_versions:(instance_type_esx_versions_ : instance_type_esx_versions_list) () =
  ({ vcf_versions = vcf_versions_; instance_type_esx_versions = instance_type_esx_versions_ }
    : get_versions_response)

let make_get_versions_request () = (() : unit)

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_eip_association ?association_id:(association_id_ : association_id option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?ip_address:(ip_address_ : ip_address option) () =
  ({ association_id = association_id_; allocation_id = allocation_id_; ip_address = ip_address_ }
    : eip_association)

let make_vlan ?vlan_id:(vlan_id_ : vlan_id option) ?cidr:(cidr_ : cidr option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?function_name:(function_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?vlan_state:(vlan_state_ : vlan_state option)
    ?state_details:(state_details_ : state_details option)
    ?eip_associations:(eip_associations_ : eip_association_list option)
    ?is_public:(is_public_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?network_acl_id:(network_acl_id_ : network_acl_id option) () =
  ({
     vlan_id = vlan_id_;
     cidr = cidr_;
     availability_zone = availability_zone_;
     function_name = function_name_;
     subnet_id = subnet_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     vlan_state = vlan_state_;
     state_details = state_details_;
     eip_associations = eip_associations_;
     is_public = is_public_;
     network_acl_id = network_acl_id_;
   }
    : vlan)

let make_associate_eip_to_vlan_response ?vlan:(vlan_ : vlan option) () =
  ({ vlan = vlan_ } : associate_eip_to_vlan_response)

let make_associate_eip_to_vlan_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id)
    ~vlan_name:(vlan_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~allocation_id:(allocation_id_ : allocation_id) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     vlan_name = vlan_name_;
     allocation_id = allocation_id_;
   }
    : associate_eip_to_vlan_request)

let make_check ?type_:(type__ : check_type option)
    ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option) ?result_:(result__ : check_result option)
    ?impaired_since:(impaired_since_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ type_ = type__; id = id_; result_ = result__; impaired_since = impaired_since_ } : check)

let make_connectivity_info
    ~private_route_server_peerings:(private_route_server_peerings_ : route_server_peering_list) () =
  ({ private_route_server_peerings = private_route_server_peerings_ } : connectivity_info)

let make_connector_check ?type_:(type__ : check_type option)
    ?result_:(result__ : check_result option)
    ?last_check_attempt:(last_check_attempt_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?impaired_since:(impaired_since_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     type_ = type__;
     result_ = result__;
     last_check_attempt = last_check_attempt_;
     impaired_since = impaired_since_;
   }
    : connector_check)

let make_connector ?environment_id:(environment_id_ : environment_id option)
    ?connector_id:(connector_id_ : connector_id option) ?type_:(type__ : connector_type option)
    ?appliance_fqdn:(appliance_fqdn_ : appliance_fqdn option)
    ?secret_arn:(secret_arn_ : secret_identifier option) ?state:(state_ : connector_state option)
    ?state_details:(state_details_ : state_details option) ?status:(status_ : check_result option)
    ?checks:(checks_ : connectors_checks_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     environment_id = environment_id_;
     connector_id = connector_id_;
     type_ = type__;
     appliance_fqdn = appliance_fqdn_;
     secret_arn = secret_arn_;
     state = state_;
     state_details = state_details_;
     status = status_;
     checks = checks_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : connector)

let make_error_detail ~error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_detail)

let make_vm_entitlement ?vm_id:(vm_id_ : vm_id option)
    ?environment_id:(environment_id_ : environment_id option)
    ?connector_id:(connector_id_ : connector_id option) ?vm_name:(vm_name_ : vm_name option)
    ?type_:(type__ : entitlement_type option) ?status:(status_ : entitlement_status option)
    ?last_synced_at:(last_synced_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?stopped_at:(stopped_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?error_detail:(error_detail_ : error_detail option) () =
  ({
     vm_id = vm_id_;
     environment_id = environment_id_;
     connector_id = connector_id_;
     vm_name = vm_name_;
     type_ = type__;
     status = status_;
     last_synced_at = last_synced_at_;
     started_at = started_at_;
     stopped_at = stopped_at_;
     error_detail = error_detail_;
   }
    : vm_entitlement)

let make_create_entitlement_response ?entitlements:(entitlements_ : vm_entitlement_list option) () =
  ({ entitlements = entitlements_ } : create_entitlement_response)

let make_create_entitlement_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) ~connector_id:(connector_id_ : connector_id)
    ~entitlement_type:(entitlement_type_ : entitlement_type) ~vm_ids:(vm_ids_ : vm_id_list) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     connector_id = connector_id_;
     entitlement_type = entitlement_type_;
     vm_ids = vm_ids_;
   }
    : create_entitlement_request)

let make_secret ?secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ secret_arn = secret_arn_ } : secret)

let make_service_access_security_groups ?security_groups:(security_groups_ : security_groups option)
    () =
  ({ security_groups = security_groups_ } : service_access_security_groups)

let make_vcf_hostnames ~v_center:(v_center_ : host_name) ~nsx:(nsx_ : host_name)
    ~nsx_manager1:(nsx_manager1_ : host_name) ~nsx_manager2:(nsx_manager2_ : host_name)
    ~nsx_manager3:(nsx_manager3_ : host_name) ~nsx_edge1:(nsx_edge1_ : host_name)
    ~nsx_edge2:(nsx_edge2_ : host_name) ~sddc_manager:(sddc_manager_ : host_name)
    ~cloud_builder:(cloud_builder_ : host_name) () =
  ({
     v_center = v_center_;
     nsx = nsx_;
     nsx_manager1 = nsx_manager1_;
     nsx_manager2 = nsx_manager2_;
     nsx_manager3 = nsx_manager3_;
     nsx_edge1 = nsx_edge1_;
     nsx_edge2 = nsx_edge2_;
     sddc_manager = sddc_manager_;
     cloud_builder = cloud_builder_;
   }
    : vcf_hostnames)

let make_license_info ~solution_key:(solution_key_ : solution_key)
    ~vsan_key:(vsan_key_ : v_san_license_key) () =
  ({ solution_key = solution_key_; vsan_key = vsan_key_ } : license_info)

let make_environment ?environment_id:(environment_id_ : environment_id option)
    ?environment_state:(environment_state_ : environment_state option)
    ?state_details:(state_details_ : state_details option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?environment_arn:(environment_arn_ : arn option)
    ?environment_name:(environment_name_ : environment_name option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?service_access_subnet_id:(service_access_subnet_id_ : subnet_id option)
    ?vcf_version:(vcf_version_ : vcf_version option)
    ?terms_accepted:(terms_accepted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_info:(license_info_ : license_info_list option)
    ?site_id:(site_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?environment_status:(environment_status_ : check_result option)
    ?checks:(checks_ : checks_list option)
    ?connectivity_info:(connectivity_info_ : connectivity_info option)
    ?vcf_hostnames:(vcf_hostnames_ : vcf_hostnames option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service_access_security_groups:
      (service_access_security_groups_ : service_access_security_groups option)
    ?credentials:(credentials_ : secret_list option) () =
  ({
     environment_id = environment_id_;
     environment_state = environment_state_;
     state_details = state_details_;
     created_at = created_at_;
     modified_at = modified_at_;
     environment_arn = environment_arn_;
     environment_name = environment_name_;
     vpc_id = vpc_id_;
     service_access_subnet_id = service_access_subnet_id_;
     vcf_version = vcf_version_;
     terms_accepted = terms_accepted_;
     license_info = license_info_;
     site_id = site_id_;
     environment_status = environment_status_;
     checks = checks_;
     connectivity_info = connectivity_info_;
     vcf_hostnames = vcf_hostnames_;
     kms_key_id = kms_key_id_;
     service_access_security_groups = service_access_security_groups_;
     credentials = credentials_;
   }
    : environment)

let make_create_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : create_environment_response)

let make_host_info_for_create ?placement_group_id:(placement_group_id_ : placement_group_id option)
    ?dedicated_host_id:(dedicated_host_id_ : dedicated_host_id option)
    ~host_name:(host_name_ : host_name) ~key_name:(key_name_ : key_name)
    ~instance_type:(instance_type_ : instance_type) () =
  ({
     host_name = host_name_;
     key_name = key_name_;
     instance_type = instance_type_;
     placement_group_id = placement_group_id_;
     dedicated_host_id = dedicated_host_id_;
   }
    : host_info_for_create)

let make_initial_vlan_info ~cidr:(cidr_ : cidr) () = ({ cidr = cidr_ } : initial_vlan_info)

let make_initial_vlans ?is_hcx_public:(is_hcx_public_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?hcx_network_acl_id:(hcx_network_acl_id_ : network_acl_id option)
    ~vmk_management:(vmk_management_ : initial_vlan_info)
    ~vm_management:(vm_management_ : initial_vlan_info) ~v_motion:(v_motion_ : initial_vlan_info)
    ~v_san:(v_san_ : initial_vlan_info) ~v_tep:(v_tep_ : initial_vlan_info)
    ~edge_v_tep:(edge_v_tep_ : initial_vlan_info) ~nsx_uplink:(nsx_uplink_ : initial_vlan_info)
    ~hcx:(hcx_ : initial_vlan_info) ~expansion_vlan1:(expansion_vlan1_ : initial_vlan_info)
    ~expansion_vlan2:(expansion_vlan2_ : initial_vlan_info) () =
  ({
     vmk_management = vmk_management_;
     vm_management = vm_management_;
     v_motion = v_motion_;
     v_san = v_san_;
     v_tep = v_tep_;
     edge_v_tep = edge_v_tep_;
     nsx_uplink = nsx_uplink_;
     hcx = hcx_;
     expansion_vlan1 = expansion_vlan1_;
     expansion_vlan2 = expansion_vlan2_;
     is_hcx_public = is_hcx_public_;
     hcx_network_acl_id = hcx_network_acl_id_;
   }
    : initial_vlans)

let make_create_environment_request ?client_token:(client_token_ : client_token option)
    ?environment_name:(environment_name_ : environment_name option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : request_tag_map option)
    ?service_access_security_groups:
      (service_access_security_groups_ : service_access_security_groups option)
    ?connectivity_info:(connectivity_info_ : connectivity_info option)
    ?license_info:(license_info_ : license_info_list option)
    ?hosts:(hosts_ : host_info_for_create_list option)
    ?vcf_hostnames:(vcf_hostnames_ : vcf_hostnames option)
    ?site_id:(site_id_ : Smaws_Lib.Smithy_api.Types.string_ option) ~vpc_id:(vpc_id_ : vpc_id)
    ~service_access_subnet_id:(service_access_subnet_id_ : subnet_id)
    ~vcf_version:(vcf_version_ : vcf_version)
    ~terms_accepted:(terms_accepted_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~initial_vlans:(initial_vlans_ : initial_vlans) () =
  ({
     client_token = client_token_;
     environment_name = environment_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     service_access_security_groups = service_access_security_groups_;
     vpc_id = vpc_id_;
     service_access_subnet_id = service_access_subnet_id_;
     vcf_version = vcf_version_;
     terms_accepted = terms_accepted_;
     initial_vlans = initial_vlans_;
     connectivity_info = connectivity_info_;
     license_info = license_info_;
     hosts = hosts_;
     vcf_hostnames = vcf_hostnames_;
     site_id = site_id_;
   }
    : create_environment_request)

let make_create_environment_connector_response ?connector:(connector_ : connector option) () =
  ({ connector = connector_ } : create_environment_connector_response)

let make_create_environment_connector_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) ~type_:(type__ : connector_type)
    ~appliance_fqdn:(appliance_fqdn_ : appliance_fqdn)
    ~secret_identifier:(secret_identifier_ : secret_identifier) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     type_ = type__;
     appliance_fqdn = appliance_fqdn_;
     secret_identifier = secret_identifier_;
   }
    : create_environment_connector_request)

let make_network_interface
    ?network_interface_id:(network_interface_id_ : network_interface_id option) () =
  ({ network_interface_id = network_interface_id_ } : network_interface)

let make_host ?host_name:(host_name_ : host_name option)
    ?ip_address:(ip_address_ : ip_address option) ?key_name:(key_name_ : key_name option)
    ?instance_type:(instance_type_ : instance_type option)
    ?placement_group_id:(placement_group_id_ : placement_group_id option)
    ?dedicated_host_id:(dedicated_host_id_ : dedicated_host_id option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?host_state:(host_state_ : host_state option)
    ?state_details:(state_details_ : state_details option)
    ?ec2_instance_id:(ec2_instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?network_interfaces:(network_interfaces_ : network_interface_list option) () =
  ({
     host_name = host_name_;
     ip_address = ip_address_;
     key_name = key_name_;
     instance_type = instance_type_;
     placement_group_id = placement_group_id_;
     dedicated_host_id = dedicated_host_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     host_state = host_state_;
     state_details = state_details_;
     ec2_instance_id = ec2_instance_id_;
     network_interfaces = network_interfaces_;
   }
    : host)

let make_environment_summary ?environment_id:(environment_id_ : environment_id option)
    ?environment_name:(environment_name_ : environment_name option)
    ?vcf_version:(vcf_version_ : vcf_version option)
    ?environment_status:(environment_status_ : check_result option)
    ?environment_state:(environment_state_ : environment_state option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?environment_arn:(environment_arn_ : arn option) () =
  ({
     environment_id = environment_id_;
     environment_name = environment_name_;
     vcf_version = vcf_version_;
     environment_status = environment_status_;
     environment_state = environment_state_;
     created_at = created_at_;
     modified_at = modified_at_;
     environment_arn = environment_arn_;
   }
    : environment_summary)

let make_create_environment_host_response
    ?environment_summary:(environment_summary_ : environment_summary option)
    ?host:(host_ : host option) () =
  ({ environment_summary = environment_summary_; host = host_ } : create_environment_host_response)

let make_create_environment_host_request ?client_token:(client_token_ : client_token option)
    ?esx_version:(esx_version_ : esx_version option)
    ~environment_id:(environment_id_ : environment_id) ~host:(host_ : host_info_for_create) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     host = host_;
     esx_version = esx_version_;
   }
    : create_environment_host_request)

let make_delete_entitlement_response ?entitlements:(entitlements_ : vm_entitlement_list option) () =
  ({ entitlements = entitlements_ } : delete_entitlement_response)

let make_delete_entitlement_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) ~connector_id:(connector_id_ : connector_id)
    ~entitlement_type:(entitlement_type_ : entitlement_type) ~vm_ids:(vm_ids_ : vm_id_list) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     connector_id = connector_id_;
     entitlement_type = entitlement_type_;
     vm_ids = vm_ids_;
   }
    : delete_entitlement_request)

let make_delete_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : delete_environment_response)

let make_delete_environment_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ client_token = client_token_; environment_id = environment_id_ } : delete_environment_request)

let make_delete_environment_connector_response ?connector:(connector_ : connector option)
    ?environment_summary:(environment_summary_ : environment_summary option) () =
  ({ connector = connector_; environment_summary = environment_summary_ }
    : delete_environment_connector_response)

let make_delete_environment_connector_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) ~connector_id:(connector_id_ : connector_id)
    () =
  ({ client_token = client_token_; environment_id = environment_id_; connector_id = connector_id_ }
    : delete_environment_connector_request)

let make_delete_environment_host_response
    ?environment_summary:(environment_summary_ : environment_summary option)
    ?host:(host_ : host option) () =
  ({ environment_summary = environment_summary_; host = host_ } : delete_environment_host_response)

let make_delete_environment_host_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id) ~host_name:(host_name_ : host_name) () =
  ({ client_token = client_token_; environment_id = environment_id_; host_name = host_name_ }
    : delete_environment_host_request)

let make_disassociate_eip_from_vlan_response ?vlan:(vlan_ : vlan option) () =
  ({ vlan = vlan_ } : disassociate_eip_from_vlan_response)

let make_disassociate_eip_from_vlan_request ?client_token:(client_token_ : client_token option)
    ~environment_id:(environment_id_ : environment_id)
    ~vlan_name:(vlan_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~association_id:(association_id_ : association_id) () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     vlan_name = vlan_name_;
     association_id = association_id_;
   }
    : disassociate_eip_from_vlan_request)

let make_get_depot_url_response ~depot_url:(depot_url_ : Smaws_Lib.Smithy_api.Types.string_)
    ~token:(token_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ depot_url = depot_url_; token = token_ } : get_depot_url_response)

let make_get_depot_url_request ?rotate:(rotate_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_; rotate = rotate_ } : get_depot_url_request)

let make_get_environment_response ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : get_environment_response)

let make_get_environment_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : get_environment_request)

let make_list_environment_connectors_response ?next_token:(next_token_ : pagination_token option)
    ?connectors:(connectors_ : connector_list option) () =
  ({ next_token = next_token_; connectors = connectors_ } : list_environment_connectors_response)

let make_list_environment_connectors_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ next_token = next_token_; max_results = max_results_; environment_id = environment_id_ }
    : list_environment_connectors_request)

let make_list_environment_hosts_response ?next_token:(next_token_ : pagination_token option)
    ?environment_hosts:(environment_hosts_ : host_list option) () =
  ({ next_token = next_token_; environment_hosts = environment_hosts_ }
    : list_environment_hosts_response)

let make_list_environment_hosts_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ next_token = next_token_; max_results = max_results_; environment_id = environment_id_ }
    : list_environment_hosts_request)

let make_list_environment_vlans_response ?next_token:(next_token_ : pagination_token option)
    ?environment_vlans:(environment_vlans_ : vlan_list option) () =
  ({ next_token = next_token_; environment_vlans = environment_vlans_ }
    : list_environment_vlans_response)

let make_list_environment_vlans_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ next_token = next_token_; max_results = max_results_; environment_id = environment_id_ }
    : list_environment_vlans_request)

let make_list_environments_response ?next_token:(next_token_ : pagination_token option)
    ?environment_summaries:(environment_summaries_ : environment_summary_list option) () =
  ({ next_token = next_token_; environment_summaries = environment_summaries_ }
    : list_environments_response)

let make_list_environments_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ?state:(state_ : environment_state_list option)
    () =
  ({ next_token = next_token_; max_results = max_results_; state = state_ }
    : list_environments_request)

let make_list_vm_entitlements_response ?next_token:(next_token_ : pagination_token option)
    ?entitlements:(entitlements_ : vm_entitlement_list option) () =
  ({ next_token = next_token_; entitlements = entitlements_ } : list_vm_entitlements_response)

let make_list_vm_entitlements_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ~environment_id:(environment_id_ : environment_id) ~connector_id:(connector_id_ : connector_id)
    ~entitlement_type:(entitlement_type_ : entitlement_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     environment_id = environment_id_;
     connector_id = connector_id_;
     entitlement_type = entitlement_type_;
   }
    : list_vm_entitlements_request)

let make_update_environment_connector_response ?connector:(connector_ : connector option) () =
  ({ connector = connector_ } : update_environment_connector_response)

let make_update_environment_connector_request ?client_token:(client_token_ : client_token option)
    ?appliance_fqdn:(appliance_fqdn_ : appliance_fqdn option)
    ?secret_identifier:(secret_identifier_ : secret_identifier option)
    ~environment_id:(environment_id_ : environment_id) ~connector_id:(connector_id_ : connector_id)
    () =
  ({
     client_token = client_token_;
     environment_id = environment_id_;
     connector_id = connector_id_;
     appliance_fqdn = appliance_fqdn_;
     secret_identifier = secret_identifier_;
   }
    : update_environment_connector_request)
