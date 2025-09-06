(** Backup Gateway client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vmware_to_aws_tag_mapping :
  aws_tag_value:tag_value ->
  aws_tag_key:tag_key ->
  vmware_tag_name:vmware_tag_name ->
  vmware_category:vmware_category ->
  unit ->
  vmware_to_aws_tag_mapping

val make_vmware_tag :
  ?vmware_tag_description:string_ ->
  ?vmware_tag_name:vmware_tag_name ->
  ?vmware_category:vmware_category ->
  unit ->
  vmware_tag

val make_virtual_machine :
  ?last_backup_date:time ->
  ?resource_arn:resource_arn ->
  ?path:path ->
  ?name:name ->
  ?hypervisor_id:string_ ->
  ?host_name:name ->
  unit ->
  virtual_machine

val make_virtual_machine_details :
  ?vmware_tags:vmware_tags ->
  ?last_backup_date:time ->
  ?resource_arn:resource_arn ->
  ?path:path ->
  ?name:name ->
  ?hypervisor_id:string_ ->
  ?host_name:name ->
  unit ->
  virtual_machine_details

val make_update_hypervisor_output : ?hypervisor_arn:server_arn -> unit -> update_hypervisor_output

val make_update_hypervisor_input :
  ?log_group_arn:log_group_arn ->
  ?name:name ->
  ?password:password ->
  ?username:username ->
  ?host:host ->
  hypervisor_arn:server_arn ->
  unit ->
  update_hypervisor_input

val make_update_gateway_software_now_output :
  ?gateway_arn:gateway_arn -> unit -> update_gateway_software_now_output

val make_update_gateway_software_now_input :
  gateway_arn:gateway_arn -> unit -> update_gateway_software_now_input

val make_update_gateway_information_output :
  ?gateway_arn:gateway_arn -> unit -> update_gateway_information_output

val make_update_gateway_information_input :
  ?gateway_display_name:name -> gateway_arn:gateway_arn -> unit -> update_gateway_information_input

val make_untag_resource_output : ?resource_ar_n:resource_arn -> unit -> untag_resource_output

val make_untag_resource_input :
  tag_keys:tag_keys -> resource_ar_n:resource_arn -> unit -> untag_resource_input

val make_test_hypervisor_configuration_output : unit -> unit

val make_test_hypervisor_configuration_input :
  ?password:password ->
  ?username:username ->
  host:host ->
  gateway_arn:gateway_arn ->
  unit ->
  test_hypervisor_configuration_input

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_output : ?resource_ar_n:resource_arn -> unit -> tag_resource_output
val make_tag_resource_input : tags:tags -> resource_ar_n:resource_arn -> unit -> tag_resource_input

val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:server_arn -> unit -> start_virtual_machines_metadata_sync_output

val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:server_arn -> unit -> start_virtual_machines_metadata_sync_input

val make_put_maintenance_start_time_output :
  ?gateway_arn:gateway_arn -> unit -> put_maintenance_start_time_output

val make_put_maintenance_start_time_input :
  ?day_of_month:day_of_month ->
  ?day_of_week:day_of_week ->
  minute_of_hour:minute_of_hour ->
  hour_of_day:hour_of_day ->
  gateway_arn:gateway_arn ->
  unit ->
  put_maintenance_start_time_input

val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:server_arn -> unit -> put_hypervisor_property_mappings_output

val make_put_hypervisor_property_mappings_input :
  iam_role_arn:iam_role_arn ->
  vmware_to_aws_tag_mappings:vmware_to_aws_tag_mappings ->
  hypervisor_arn:server_arn ->
  unit ->
  put_hypervisor_property_mappings_input

val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:gateway_arn -> unit -> put_bandwidth_rate_limit_schedule_output

val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:average_upload_rate_limit ->
  days_of_week:days_of_week ->
  end_minute_of_hour:minute_of_hour ->
  start_minute_of_hour:minute_of_hour ->
  end_hour_of_day:hour_of_day ->
  start_hour_of_day:hour_of_day ->
  unit ->
  bandwidth_rate_limit_interval

val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  gateway_arn:gateway_arn ->
  unit ->
  put_bandwidth_rate_limit_schedule_input

val make_maintenance_start_time :
  ?day_of_week:day_of_week ->
  ?day_of_month:day_of_month ->
  minute_of_hour:minute_of_hour ->
  hour_of_day:hour_of_day ->
  unit ->
  maintenance_start_time

val make_list_virtual_machines_output :
  ?next_token:next_token ->
  ?virtual_machines:virtual_machines ->
  unit ->
  list_virtual_machines_output

val make_list_virtual_machines_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?hypervisor_arn:server_arn ->
  unit ->
  list_virtual_machines_input

val make_list_tags_for_resource_output :
  ?tags:tags -> ?resource_arn:resource_arn -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_input

val make_hypervisor :
  ?state:hypervisor_state ->
  ?name:name ->
  ?kms_key_arn:kms_key_arn ->
  ?hypervisor_arn:server_arn ->
  ?host:host ->
  unit ->
  hypervisor

val make_list_hypervisors_output :
  ?next_token:next_token -> ?hypervisors:hypervisors -> unit -> list_hypervisors_output

val make_list_hypervisors_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_hypervisors_input

val make_gateway :
  ?last_seen_time:time ->
  ?hypervisor_id:hypervisor_id ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:name ->
  ?gateway_arn:gateway_arn ->
  unit ->
  gateway

val make_list_gateways_output :
  ?next_token:next_token -> ?gateways:gateways -> unit -> list_gateways_output

val make_list_gateways_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_gateways_input

val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:server_arn -> unit -> import_hypervisor_configuration_output

val make_import_hypervisor_configuration_input :
  ?tags:tags ->
  ?kms_key_arn:kms_key_arn ->
  ?password:password ->
  ?username:username ->
  host:host ->
  name:name ->
  unit ->
  import_hypervisor_configuration_input

val make_hypervisor_details :
  ?latest_metadata_sync_status:sync_metadata_status ->
  ?latest_metadata_sync_status_message:string_ ->
  ?last_successful_metadata_sync_time:time ->
  ?state:hypervisor_state ->
  ?log_group_arn:log_group_arn ->
  ?name:name ->
  ?kms_key_arn:kms_key_arn ->
  ?hypervisor_arn:server_arn ->
  ?host:host ->
  unit ->
  hypervisor_details

val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details -> unit -> get_virtual_machine_output

val make_get_virtual_machine_input : resource_arn:resource_arn -> unit -> get_virtual_machine_input

val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:iam_role_arn ->
  ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mappings ->
  ?hypervisor_arn:server_arn ->
  unit ->
  get_hypervisor_property_mappings_output

val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:server_arn -> unit -> get_hypervisor_property_mappings_input

val make_get_hypervisor_output : ?hypervisor:hypervisor_details -> unit -> get_hypervisor_output
val make_get_hypervisor_input : hypervisor_arn:server_arn -> unit -> get_hypervisor_input

val make_gateway_details :
  ?vpc_endpoint:vpc_endpoint ->
  ?next_update_availability_time:time ->
  ?maintenance_start_time:maintenance_start_time ->
  ?last_seen_time:time ->
  ?hypervisor_id:hypervisor_id ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:name ->
  ?gateway_arn:gateway_arn ->
  unit ->
  gateway_details

val make_get_gateway_output : ?gateway:gateway_details -> unit -> get_gateway_output
val make_get_gateway_input : gateway_arn:gateway_arn -> unit -> get_gateway_input

val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  ?gateway_arn:gateway_arn ->
  unit ->
  get_bandwidth_rate_limit_schedule_output

val make_get_bandwidth_rate_limit_schedule_input :
  gateway_arn:gateway_arn -> unit -> get_bandwidth_rate_limit_schedule_input

val make_disassociate_gateway_from_server_output :
  ?gateway_arn:gateway_arn -> unit -> disassociate_gateway_from_server_output

val make_disassociate_gateway_from_server_input :
  gateway_arn:gateway_arn -> unit -> disassociate_gateway_from_server_input

val make_delete_hypervisor_output : ?hypervisor_arn:server_arn -> unit -> delete_hypervisor_output
val make_delete_hypervisor_input : hypervisor_arn:server_arn -> unit -> delete_hypervisor_input
val make_delete_gateway_output : ?gateway_arn:gateway_arn -> unit -> delete_gateway_output
val make_delete_gateway_input : gateway_arn:gateway_arn -> unit -> delete_gateway_input
val make_create_gateway_output : ?gateway_arn:gateway_arn -> unit -> create_gateway_output

val make_create_gateway_input :
  ?tags:tags ->
  gateway_type:gateway_type ->
  gateway_display_name:name ->
  activation_key:activation_key ->
  unit ->
  create_gateway_input

val make_associate_gateway_to_server_output :
  ?gateway_arn:gateway_arn -> unit -> associate_gateway_to_server_output

val make_associate_gateway_to_server_input :
  server_arn:server_arn -> gateway_arn:gateway_arn -> unit -> associate_gateway_to_server_input
(** {1:operations Operations} *)

module AssociateGatewayToServer : sig
  val request :
    Smaws_Lib.Context.t ->
    associate_gateway_to_server_input ->
    ( associate_gateway_to_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result
end
[@@ocaml.doc
  "Associates a backup gateway with your server. After you complete the association process, you \
   can back up and restore your VMs through the gateway.\n"]

module CreateGateway : sig
  val request :
    Smaws_Lib.Context.t ->
    create_gateway_input ->
    (create_gateway_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc
  "Creates a backup gateway. After you create a gateway, you can associate it with a server using \
   the [AssociateGatewayToServer] operation.\n"]

module DeleteGateway : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_gateway_input ->
    ( delete_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Deletes a backup gateway.\n"]

module DeleteHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_hypervisor_input ->
    ( delete_hypervisor_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Deletes a hypervisor.\n"]

module DisassociateGatewayFromServer : sig
  val request :
    Smaws_Lib.Context.t ->
    disassociate_gateway_from_server_input ->
    ( disassociate_gateway_from_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Disassociates a backup gateway from the specified server. After the disassociation process \
   finishes, the gateway can no longer access the virtual machines on the server.\n"]

module GetBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
    get_bandwidth_rate_limit_schedule_input ->
    ( get_bandwidth_rate_limit_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves the bandwidth rate limit schedule for a specified gateway. By default, gateways do \
   not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. \
   Use this to get a gateway's bandwidth rate limit schedule.\n"]

module GetGateway : sig
  val request :
    Smaws_Lib.Context.t ->
    get_gateway_input ->
    ( get_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "By providing the ARN (Amazon Resource Name), this API returns the gateway.\n"]

module GetHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
    get_hypervisor_input ->
    ( get_hypervisor_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This action requests information about the specified hypervisor to which the gateway will \
   connect. A hypervisor is hardware, software, or firmware that creates and manages virtual \
   machines, and allocates resources to them.\n"]

module GetHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
    get_hypervisor_property_mappings_input ->
    ( get_hypervisor_property_mappings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This action retrieves the property mappings for the specified hypervisor. A hypervisor property \
   mapping displays the relationship of entity properties available from the on-premises \
   hypervisor to the properties available in Amazon Web Services.\n"]

module GetVirtualMachine : sig
  val request :
    Smaws_Lib.Context.t ->
    get_virtual_machine_input ->
    ( get_virtual_machine_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "By providing the ARN (Amazon Resource Name), this API returns the virtual machine.\n"]

module ImportHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    import_hypervisor_configuration_input ->
    ( import_hypervisor_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception ] )
    result
end
[@@ocaml.doc "Connect to a hypervisor by importing its configuration.\n"]

module ListGateways : sig
  val request :
    Smaws_Lib.Context.t ->
    list_gateways_input ->
    (list_gateways_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc
  "Lists backup gateways owned by an Amazon Web Services account in an Amazon Web Services Region. \
   The returned list is ordered by gateway Amazon Resource Name (ARN).\n"]

module ListHypervisors : sig
  val request :
    Smaws_Lib.Context.t ->
    list_hypervisors_input ->
    (list_hypervisors_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "Lists your hypervisors.\n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Lists the tags applied to the resource identified by its Amazon Resource Name (ARN).\n"]

module ListVirtualMachines : sig
  val request :
    Smaws_Lib.Context.t ->
    list_virtual_machines_input ->
    (list_virtual_machines_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "Lists your virtual machines.\n"]

module PutBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
    put_bandwidth_rate_limit_schedule_input ->
    ( put_bandwidth_rate_limit_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This action sets the bandwidth rate limit schedule for a specified gateway. By default, \
   gateways do not have a bandwidth rate limit schedule, which means no bandwidth rate limiting is \
   in effect. Use this to initiate a gateway's bandwidth rate limit schedule.\n"]

module PutHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
    put_hypervisor_property_mappings_input ->
    ( put_hypervisor_property_mappings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This action sets the property mappings for the specified hypervisor. A hypervisor property \
   mapping displays the relationship of entity properties available from the on-premises \
   hypervisor to the properties available in Amazon Web Services.\n"]

module PutMaintenanceStartTime : sig
  val request :
    Smaws_Lib.Context.t ->
    put_maintenance_start_time_input ->
    ( put_maintenance_start_time_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Set the maintenance start time for a gateway.\n"]

module StartVirtualMachinesMetadataSync : sig
  val request :
    Smaws_Lib.Context.t ->
    start_virtual_machines_metadata_sync_input ->
    ( start_virtual_machines_metadata_sync_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This action sends a request to sync metadata across the specified virtual machines.\n"]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Tag the resource.\n"]

module TestHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    test_hypervisor_configuration_input ->
    ( test_hypervisor_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Tests your hypervisor configuration to validate that backup gateway can connect with the \
   hypervisor and its resources.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Removes tags from the resource.\n"]

module UpdateGatewayInformation : sig
  val request :
    Smaws_Lib.Context.t ->
    update_gateway_information_input ->
    ( update_gateway_information_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Updates a gateway's name. Specify which gateway to update using the Amazon Resource Name (ARN) \
   of the gateway in your request.\n"]

module UpdateGatewaySoftwareNow : sig
  val request :
    Smaws_Lib.Context.t ->
    update_gateway_software_now_input ->
    ( update_gateway_software_now_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Updates the gateway virtual machine (VM) software. The request immediately triggers the \
   software update.\n\n\
  \  When you make this request, you get a [200 OK] success response immediately. However, it \
   might take some time for the update to complete.\n\
  \  \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
    update_hypervisor_input ->
    ( update_hypervisor_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Updates a hypervisor metadata, including its host, username, and password. Specify which \
   hypervisor to update using the Amazon Resource Name (ARN) of the hypervisor in your request.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
