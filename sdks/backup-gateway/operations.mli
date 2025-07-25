open Types
module AssociateGatewayToServer :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_gateway_to_server_input ->
        (associate_gateway_to_server_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception ]) result
end[@@ocaml.doc
     "Associates a backup gateway with your server. After you complete the association process, you can back up and restore your VMs through the gateway.\n"]
module CreateGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_gateway_input ->
        (create_gateway_output, [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Creates a backup gateway. After you create a gateway, you can associate it with a server using the [AssociateGatewayToServer] operation.\n"]
module DeleteGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_gateway_input ->
        (delete_gateway_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a backup gateway.\n"]
module DeleteHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_hypervisor_input ->
        (delete_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a hypervisor.\n"]
module DisassociateGatewayFromServer :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_gateway_from_server_input ->
        (disassociate_gateway_from_server_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociates a backup gateway from the specified server. After the disassociation process finishes, the gateway can no longer access the virtual machines on the server.\n"]
module GetBandwidthRateLimitSchedule :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bandwidth_rate_limit_schedule_input ->
        (get_bandwidth_rate_limit_schedule_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use this to get a gateway's bandwidth rate limit schedule.\n"]
module GetGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_gateway_input ->
        (get_gateway_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "By providing the ARN (Amazon Resource Name), this API returns the gateway.\n"]
module GetHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_input ->
        (get_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action requests information about the specified hypervisor to which the gateway will connect. A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n"]
module GetHypervisorPropertyMappings :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_property_mappings_input ->
        (get_hypervisor_property_mappings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action retrieves the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.\n"]
module GetVirtualMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_virtual_machine_input ->
        (get_virtual_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "By providing the ARN (Amazon Resource Name), this API returns the virtual machine.\n"]
module ImportHypervisorConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      import_hypervisor_configuration_input ->
        (import_hypervisor_configuration_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception ]) result
end[@@ocaml.doc "Connect to a hypervisor by importing its configuration.\n"]
module ListGateways :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_gateways_input ->
        (list_gateways_output, [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Lists backup gateways owned by an Amazon Web Services account in an Amazon Web Services Region. The returned list is ordered by gateway Amazon Resource Name (ARN).\n"]
module ListHypervisors :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_hypervisors_input ->
        (list_hypervisors_output, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc "Lists your hypervisors.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the tags applied to the resource identified by its Amazon Resource Name (ARN).\n"]
module ListVirtualMachines :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_virtual_machines_input ->
        (list_virtual_machines_output, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc "Lists your virtual machines.\n"]
module PutBandwidthRateLimitSchedule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_bandwidth_rate_limit_schedule_input ->
        (put_bandwidth_rate_limit_schedule_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sets the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have a bandwidth rate limit schedule, which means no bandwidth rate limiting is in effect. Use this to initiate a gateway's bandwidth rate limit schedule.\n"]
module PutHypervisorPropertyMappings :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_hypervisor_property_mappings_input ->
        (put_hypervisor_property_mappings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sets the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.\n"]
module PutMaintenanceStartTime :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_maintenance_start_time_input ->
        (put_maintenance_start_time_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Set the maintenance start time for a gateway.\n"]
module StartVirtualMachinesMetadataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_virtual_machines_metadata_sync_input ->
        (start_virtual_machines_metadata_sync_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sends a request to sync metadata across the specified virtual machines.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Tag the resource.\n"]
module TestHypervisorConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_hypervisor_configuration_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Tests your hypervisor configuration to validate that backup gateway can connect with the hypervisor and its resources.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Removes tags from the resource.\n"]
module UpdateGatewayInformation :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_information_input ->
        (update_gateway_information_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates a gateway's name. Specify which gateway to update using the Amazon Resource Name (ARN) of the gateway in your request.\n"]
module UpdateGatewaySoftwareNow :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_software_now_input ->
        (update_gateway_software_now_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.\n\n  When you make this request, you get a [200 OK] success response immediately. However, it might take some time for the update to complete.\n  \n   "]
module UpdateHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_hypervisor_input ->
        (update_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates a hypervisor metadata, including its host, username, and password. Specify which hypervisor to update using the Amazon Resource Name (ARN) of the hypervisor in your request.\n"]