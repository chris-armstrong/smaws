(** evs client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UpdateEnvironmentConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_connector_request ->
    ( update_environment_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_environment_connector_request ->
    ( update_environment_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a connector for an Amazon EVS environment. You can update the Amazon Web Services \
   Secrets Manager secret ARN or the appliance FQDN to reconfigure the connector metadata.\n\n\
  \  You cannot update both the secret and the FQDN in the same request.\n\
  \  \n\
  \   "]

module ListVmEntitlements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vm_entitlements_request ->
    ( list_vm_entitlements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_vm_entitlements_request ->
    ( list_vm_entitlements_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Windows Server License entitlements for virtual machines in an Amazon EVS \
   environment. Returns existing entitlements for virtual machines associated with the specified \
   environment and connector.\n"]

module ListEnvironments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    ( list_environments_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    ( list_environments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Amazon EVS environments in your Amazon Web Services account in the specified Amazon \
   Web Services Region.\n"]

module ListEnvironmentVlans : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_vlans_request ->
    ( list_environment_vlans_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environment_vlans_request ->
    ( list_environment_vlans_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists environment VLANs that are associated with the specified environment.\n"]

module ListEnvironmentHosts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_hosts_request ->
    ( list_environment_hosts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environment_hosts_request ->
    ( list_environment_hosts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the hosts within an environment.\n"]

module ListEnvironmentConnectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_connectors_request ->
    ( list_environment_connectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environment_connectors_request ->
    ( list_environment_connectors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the connectors within an environment. Returns the status of each connector and its \
   applicable checks, among other connector details.\n"]

module GetEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_request ->
    ( get_environment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_environment_request ->
    ( get_environment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of the specified environment.\n"]

module GetDepotUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_depot_url_request ->
    ( get_depot_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_depot_url_request ->
    ( get_depot_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a URL and authentication token for accessing the Amazon EVS Custom Addon depot. \
   Configure the depot URL as a download source in vSphere Lifecycle Manager (vLCM) to sync and \
   install the Amazon EVS Custom Addon.\n\n\
  \ The depot URL remains active until you rotate the authentication token by calling this action \
   with [rotate] set to [true].\n\
  \ "]

module DisassociateEipFromVlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_eip_from_vlan_request ->
    ( disassociate_eip_from_vlan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_eip_from_vlan_request ->
    ( disassociate_eip_from_vlan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates an Elastic IP address from a public HCX VLAN. This operation is only allowed for \
   public HCX VLANs at this time.\n"]

module DeleteEnvironmentHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_host_request ->
    ( delete_environment_host_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_host_request ->
    ( delete_environment_host_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a host from an Amazon EVS environment.\n\n\
  \  Before deleting a host, you must unassign and decommission the host from within the SDDC \
   Manager user interface. Not doing so could impact the availability of your virtual machines or \
   result in data loss.\n\
  \  \n\
  \   "]

module DeleteEnvironmentConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_connector_request ->
    ( delete_environment_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_connector_request ->
    ( delete_environment_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a connector from an Amazon EVS environment.\n\n\
  \  Before deleting a connector, you must remove all entitlements that are associated with the \
   same vCenter.\n\
  \  \n\
  \   "]

module DeleteEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_request ->
    ( delete_environment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_request ->
    ( delete_environment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon EVS environment.\n\n\
  \ Amazon EVS environments will only be enabled for deletion once the hosts are deleted. You can \
   delete hosts using the [DeleteEnvironmentHost] action.\n\
  \ \n\
  \  Environment deletion also deletes the associated Amazon EVS VLAN subnets and Amazon Web \
   Services Secrets Manager secrets that Amazon EVS created. Amazon Web Services resources that \
   you create are not deleted. These resources may continue to incur costs.\n\
  \  "]

module DeleteEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Windows Server License entitlement for virtual machines in an Amazon EVS environment. \
   Deleting an entitlement stops usage tracking for the specified virtual machines.\n"]

module CreateEnvironmentHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_host_request ->
    ( create_environment_host_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_host_request ->
    ( create_environment_host_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an ESX host and adds it to an Amazon EVS environment.\n\n\
  \ This action can only be used after the Amazon EVS environment is deployed.\n\
  \ \n\
  \  You can use the [dedicatedHostId] parameter to specify an Amazon EC2 Dedicated Host for ESX \
   host creation.\n\
  \  \n\
  \    You can use the [placementGroupId] parameter to specify a cluster or partition placement \
   group to launch EC2 instances into.\n\
  \   \n\
  \     If you don't specify an ESX version when adding hosts using [CreateEnvironmentHost] \
   action, Amazon EVS automatically uses the default ESX version for your environment's VCF \
   version. To find the available ESX versions for a particular VCF version, use the [GetVersions] \
   action.\n\
  \     \n\
  \      You cannot use the [dedicatedHostId] and [placementGroupId] parameters together in the \
   same [CreateEnvironmentHost] action. This results in a [ValidationException] response.\n\
  \      \n\
  \       "]

module CreateEnvironmentConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_connector_request ->
    ( create_environment_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_connector_request ->
    ( create_environment_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connector for an Amazon EVS environment. A connector allows the Amazon EVS control \
   plane to interface with VCF appliances using a fully qualified domain name.\n\n\
  \ You can create only one connector of each type per environment. For environments where Amazon \
   EVS installs VCF, the [SDDC_MANAGER] connector is created automatically.\n\
  \ \n\
  \   Amazon EVS requires an active connector to SDDC Manager or VCF Operations Manager to monitor \
   environment health and license compliance.\n\
  \   \n\
  \    "]

module CreateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_request ->
    ( create_environment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_request ->
    ( create_environment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon EVS environment that runs VCF software, such as SDDC Manager, NSX Manager, \
   and vCenter Server.\n\n\
  \  When you specify [SELF_DEPLOYED] for [vcfVersion], Amazon EVS provisions only the VLAN \
   subnets; no hosts are added and no VCF installation is performed. After the environment is \
   created, you can add hosts with [CreateEnvironmentHost] and install VCF yourself. The \
   [licenseInfo], [hosts], [vcfHostnames], [siteId], and [connectivityInfo] parameters are not \
   supported in this mode.\n\
  \  \n\
  \    When you specify any other VCF version, Amazon EVS installs and configures VCF for you. For \
   more information, see \
   {{:https://docs.aws.amazon.com/evs/latest/userguide/getting-started-self-deployed.html}Self-deployed \
   mode} in the {i Amazon EVS User Guide}.\n\
  \    \n\
  \      When Amazon EVS installs VCF, the default ESX version for the selected VCF version will \
   be used. After a host is added with a specific ESX version, it can only be upgraded using \
   vCenter Lifecycle Manager.\n\
  \      \n\
  \         You cannot use the [dedicatedHostId] and [placementGroupId] parameters together in the \
   same [CreateEnvironment] action. This results in a [ValidationException] response.\n\
  \         \n\
  \          "]

module CreateEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Windows Server License entitlement for virtual machines in an Amazon EVS environment \
   using the provided vCenter Server connector. This is an asynchronous operation. Amazon EVS \
   validates the specified virtual machines before starting usage tracking.\n"]

module AssociateEipToVlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_eip_to_vlan_request ->
    ( associate_eip_to_vlan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_eip_to_vlan_request ->
    ( associate_eip_to_vlan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Elastic IP address with a public HCX VLAN. This operation is only allowed for \
   public HCX VLANs at this time.\n"]

module GetVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_versions_request ->
    ( get_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_versions_request ->
    ( get_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about VCF versions, ESX versions and EC2 instance types provided by Amazon \
   EVS. For each VCF version, the response also includes the default ESX version and provided EC2 \
   instance types.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags for an Amazon EVS resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to an Amazon EVS resource with the specified [resourceArn]. If \
   existing tags on a resource are not specified in the request parameters, they aren't changed. \
   When a resource is deleted, the tags associated with that resource are also deleted. Tags that \
   you create for Amazon EVS resources don't propagate to any other resources associated with the \
   environment. For example, if you tag an environment with this operation, that tag doesn't \
   automatically propagate to the VLAN subnets and hosts associated with the environment.\n"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes specified tags from an Amazon EVS resource.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
