open Types

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
