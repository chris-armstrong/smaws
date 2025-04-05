(** 
    Backup Gateway client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vmware_to_aws_tag_mapping =
  {
  aws_tag_value: string ;
  aws_tag_key: string ;
  vmware_tag_name: string ;
  vmware_category: string }
type nonrec vmware_tag =
  {
  vmware_tag_description: string option ;
  vmware_tag_name: string option ;
  vmware_category: string option }
type nonrec virtual_machine =
  {
  last_backup_date: CoreTypes.Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }
type nonrec virtual_machine_details =
  {
  vmware_tags: vmware_tag list option ;
  last_backup_date: CoreTypes.Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }
type nonrec validation_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec update_hypervisor_output = {
  hypervisor_arn: string option }
type nonrec update_hypervisor_input =
  {
  log_group_arn: string option ;
  name: string option ;
  password: string option ;
  username: string option ;
  host: string option ;
  hypervisor_arn: string }
type nonrec resource_not_found_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec conflict_exception =
  {
  message: string option ;
  error_code: string }
type nonrec access_denied_exception =
  {
  message: string option ;
  error_code: string }
type nonrec update_gateway_software_now_output =
  {
  gateway_arn: string option }
type nonrec update_gateway_software_now_input = {
  gateway_arn: string }
type nonrec update_gateway_information_output = {
  gateway_arn: string option }
type nonrec update_gateway_information_input =
  {
  gateway_display_name: string option ;
  gateway_arn: string }
type nonrec untag_resource_output = {
  resource_ar_n: string option }
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec throttling_exception =
  {
  message: string option ;
  error_code: string }
type nonrec test_hypervisor_configuration_output = unit
type nonrec test_hypervisor_configuration_input =
  {
  password: string option ;
  username: string option ;
  host: string ;
  gateway_arn: string }
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_resource_output = {
  resource_ar_n: string option }
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec sync_metadata_status =
  | CREATED 
  | RUNNING 
  | FAILED 
  | PARTIALLY_FAILED 
  | SUCCEEDED 
type nonrec start_virtual_machines_metadata_sync_output =
  {
  hypervisor_arn: string option }
type nonrec start_virtual_machines_metadata_sync_input =
  {
  hypervisor_arn: string }
type nonrec put_maintenance_start_time_output = {
  gateway_arn: string option }
type nonrec put_maintenance_start_time_input =
  {
  day_of_month: int option ;
  day_of_week: int option ;
  minute_of_hour: int ;
  hour_of_day: int ;
  gateway_arn: string }
type nonrec put_hypervisor_property_mappings_output =
  {
  hypervisor_arn: string option }
type nonrec put_hypervisor_property_mappings_input =
  {
  iam_role_arn: string ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list ;
  hypervisor_arn: string }
type nonrec put_bandwidth_rate_limit_schedule_output =
  {
  gateway_arn: string option }
type nonrec bandwidth_rate_limit_interval =
  {
  days_of_week: int list ;
  end_minute_of_hour: int ;
  start_minute_of_hour: int ;
  end_hour_of_day: int ;
  start_hour_of_day: int ;
  average_upload_rate_limit_in_bits_per_sec: int option }
type nonrec put_bandwidth_rate_limit_schedule_input =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list ;
  gateway_arn: string }
type nonrec maintenance_start_time =
  {
  minute_of_hour: int ;
  hour_of_day: int ;
  day_of_week: int option ;
  day_of_month: int option }
type nonrec list_virtual_machines_output =
  {
  next_token: string option ;
  virtual_machines: virtual_machine list option }
type nonrec list_virtual_machines_input =
  {
  next_token: string option ;
  max_results: int option ;
  hypervisor_arn: string option }
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option ;
  resource_arn: string option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec hypervisor_state =
  | PENDING 
  | ONLINE 
  | OFFLINE 
  | ERROR 
type nonrec hypervisor =
  {
  state: hypervisor_state option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }
type nonrec list_hypervisors_output =
  {
  next_token: string option ;
  hypervisors: hypervisor list option }
type nonrec list_hypervisors_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec gateway_type =
  | BACKUP_VM 
type nonrec gateway =
  {
  last_seen_time: CoreTypes.Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }
type nonrec list_gateways_output =
  {
  next_token: string option ;
  gateways: gateway list option }
type nonrec list_gateways_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec internal_server_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec import_hypervisor_configuration_output =
  {
  hypervisor_arn: string option }
type nonrec import_hypervisor_configuration_input =
  {
  tags: tag list option ;
  kms_key_arn: string option ;
  password: string option ;
  username: string option ;
  host: string ;
  name: string }
type nonrec hypervisor_details =
  {
  latest_metadata_sync_status: sync_metadata_status option ;
  latest_metadata_sync_status_message: string option ;
  last_successful_metadata_sync_time: CoreTypes.Timestamp.t option ;
  state: hypervisor_state option ;
  log_group_arn: string option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }
type nonrec get_virtual_machine_output =
  {
  virtual_machine: virtual_machine_details option }
type nonrec get_virtual_machine_input = {
  resource_arn: string }
type nonrec get_hypervisor_property_mappings_output =
  {
  iam_role_arn: string option ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option ;
  hypervisor_arn: string option }
type nonrec get_hypervisor_property_mappings_input =
  {
  hypervisor_arn: string }
type nonrec get_hypervisor_output = {
  hypervisor: hypervisor_details option }
type nonrec get_hypervisor_input = {
  hypervisor_arn: string }
type nonrec gateway_details =
  {
  vpc_endpoint: string option ;
  next_update_availability_time: CoreTypes.Timestamp.t option ;
  maintenance_start_time: maintenance_start_time option ;
  last_seen_time: CoreTypes.Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }
type nonrec get_gateway_output = {
  gateway: gateway_details option }
type nonrec get_gateway_input = {
  gateway_arn: string }
type nonrec get_bandwidth_rate_limit_schedule_output =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option ;
  gateway_arn: string option }
type nonrec get_bandwidth_rate_limit_schedule_input = {
  gateway_arn: string }
type nonrec disassociate_gateway_from_server_output =
  {
  gateway_arn: string option }
type nonrec disassociate_gateway_from_server_input = {
  gateway_arn: string }
type nonrec delete_hypervisor_output = {
  hypervisor_arn: string option }
type nonrec delete_hypervisor_input = {
  hypervisor_arn: string }
type nonrec delete_gateway_output = {
  gateway_arn: string option }
type nonrec delete_gateway_input = {
  gateway_arn: string }
type nonrec create_gateway_output = {
  gateway_arn: string option }
type nonrec create_gateway_input =
  {
  tags: tag list option ;
  gateway_type: gateway_type ;
  gateway_display_name: string ;
  activation_key: string }
type nonrec associate_gateway_to_server_output =
  {
  gateway_arn: string option }
type nonrec associate_gateway_to_server_input =
  {
  server_arn: string ;
  gateway_arn: string }(** {1:builders Builders} *)

val make_vmware_to_aws_tag_mapping :
  aws_tag_value:string ->
    aws_tag_key:string ->
      vmware_tag_name:string ->
        vmware_category:string -> unit -> vmware_to_aws_tag_mapping
val make_vmware_tag :
  ?vmware_tag_description:string ->
    ?vmware_tag_name:string -> ?vmware_category:string -> unit -> vmware_tag
val make_virtual_machine :
  ?last_backup_date:CoreTypes.Timestamp.t ->
    ?resource_arn:string ->
      ?path:string ->
        ?name:string ->
          ?hypervisor_id:string ->
            ?host_name:string -> unit -> virtual_machine
val make_virtual_machine_details :
  ?vmware_tags:vmware_tag list ->
    ?last_backup_date:CoreTypes.Timestamp.t ->
      ?resource_arn:string ->
        ?path:string ->
          ?name:string ->
            ?hypervisor_id:string ->
              ?host_name:string -> unit -> virtual_machine_details
val make_update_hypervisor_output :
  ?hypervisor_arn:string -> unit -> update_hypervisor_output
val make_update_hypervisor_input :
  ?log_group_arn:string ->
    ?name:string ->
      ?password:string ->
        ?username:string ->
          ?host:string ->
            hypervisor_arn:string -> unit -> update_hypervisor_input
val make_update_gateway_software_now_output :
  ?gateway_arn:string -> unit -> update_gateway_software_now_output
val make_update_gateway_software_now_input :
  gateway_arn:string -> unit -> update_gateway_software_now_input
val make_update_gateway_information_output :
  ?gateway_arn:string -> unit -> update_gateway_information_output
val make_update_gateway_information_input :
  ?gateway_display_name:string ->
    gateway_arn:string -> unit -> update_gateway_information_input
val make_untag_resource_output :
  ?resource_ar_n:string -> unit -> untag_resource_output
val make_untag_resource_input :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_input
val make_test_hypervisor_configuration_output :
  unit -> test_hypervisor_configuration_output
val make_test_hypervisor_configuration_input :
  ?password:string ->
    ?username:string ->
      host:string ->
        gateway_arn:string -> unit -> test_hypervisor_configuration_input
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_output :
  ?resource_ar_n:string -> unit -> tag_resource_output
val make_tag_resource_input :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_input
val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:string ->
    unit -> start_virtual_machines_metadata_sync_output
val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:string -> unit -> start_virtual_machines_metadata_sync_input
val make_put_maintenance_start_time_output :
  ?gateway_arn:string -> unit -> put_maintenance_start_time_output
val make_put_maintenance_start_time_input :
  ?day_of_month:int ->
    ?day_of_week:int ->
      minute_of_hour:int ->
        hour_of_day:int ->
          gateway_arn:string -> unit -> put_maintenance_start_time_input
val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:string -> unit -> put_hypervisor_property_mappings_output
val make_put_hypervisor_property_mappings_input :
  iam_role_arn:string ->
    vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
      hypervisor_arn:string -> unit -> put_hypervisor_property_mappings_input
val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:string -> unit -> put_bandwidth_rate_limit_schedule_output
val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:int ->
    days_of_week:int list ->
      end_minute_of_hour:int ->
        start_minute_of_hour:int ->
          end_hour_of_day:int ->
            start_hour_of_day:int -> unit -> bandwidth_rate_limit_interval
val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
    gateway_arn:string -> unit -> put_bandwidth_rate_limit_schedule_input
val make_maintenance_start_time :
  ?day_of_week:int ->
    ?day_of_month:int ->
      minute_of_hour:int -> hour_of_day:int -> unit -> maintenance_start_time
val make_list_virtual_machines_output :
  ?next_token:string ->
    ?virtual_machines:virtual_machine list ->
      unit -> list_virtual_machines_output
val make_list_virtual_machines_input :
  ?next_token:string ->
    ?max_results:int ->
      ?hypervisor_arn:string -> unit -> list_virtual_machines_input
val make_list_tags_for_resource_output :
  ?tags:tag list ->
    ?resource_arn:string -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_hypervisor :
  ?state:hypervisor_state ->
    ?name:string ->
      ?kms_key_arn:string ->
        ?hypervisor_arn:string -> ?host:string -> unit -> hypervisor
val make_list_hypervisors_output :
  ?next_token:string ->
    ?hypervisors:hypervisor list -> unit -> list_hypervisors_output
val make_list_hypervisors_input :
  ?next_token:string -> ?max_results:int -> unit -> list_hypervisors_input
val make_gateway :
  ?last_seen_time:CoreTypes.Timestamp.t ->
    ?hypervisor_id:string ->
      ?gateway_type:gateway_type ->
        ?gateway_display_name:string ->
          ?gateway_arn:string -> unit -> gateway
val make_list_gateways_output :
  ?next_token:string ->
    ?gateways:gateway list -> unit -> list_gateways_output
val make_list_gateways_input :
  ?next_token:string -> ?max_results:int -> unit -> list_gateways_input
val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:string -> unit -> import_hypervisor_configuration_output
val make_import_hypervisor_configuration_input :
  ?tags:tag list ->
    ?kms_key_arn:string ->
      ?password:string ->
        ?username:string ->
          host:string ->
            name:string -> unit -> import_hypervisor_configuration_input
val make_hypervisor_details :
  ?latest_metadata_sync_status:sync_metadata_status ->
    ?latest_metadata_sync_status_message:string ->
      ?last_successful_metadata_sync_time:CoreTypes.Timestamp.t ->
        ?state:hypervisor_state ->
          ?log_group_arn:string ->
            ?name:string ->
              ?kms_key_arn:string ->
                ?hypervisor_arn:string ->
                  ?host:string -> unit -> hypervisor_details
val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details ->
    unit -> get_virtual_machine_output
val make_get_virtual_machine_input :
  resource_arn:string -> unit -> get_virtual_machine_input
val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:string ->
    ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
      ?hypervisor_arn:string ->
        unit -> get_hypervisor_property_mappings_output
val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:string -> unit -> get_hypervisor_property_mappings_input
val make_get_hypervisor_output :
  ?hypervisor:hypervisor_details -> unit -> get_hypervisor_output
val make_get_hypervisor_input :
  hypervisor_arn:string -> unit -> get_hypervisor_input
val make_gateway_details :
  ?vpc_endpoint:string ->
    ?next_update_availability_time:CoreTypes.Timestamp.t ->
      ?maintenance_start_time:maintenance_start_time ->
        ?last_seen_time:CoreTypes.Timestamp.t ->
          ?hypervisor_id:string ->
            ?gateway_type:gateway_type ->
              ?gateway_display_name:string ->
                ?gateway_arn:string -> unit -> gateway_details
val make_get_gateway_output :
  ?gateway:gateway_details -> unit -> get_gateway_output
val make_get_gateway_input : gateway_arn:string -> unit -> get_gateway_input
val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
    ?gateway_arn:string -> unit -> get_bandwidth_rate_limit_schedule_output
val make_get_bandwidth_rate_limit_schedule_input :
  gateway_arn:string -> unit -> get_bandwidth_rate_limit_schedule_input
val make_disassociate_gateway_from_server_output :
  ?gateway_arn:string -> unit -> disassociate_gateway_from_server_output
val make_disassociate_gateway_from_server_input :
  gateway_arn:string -> unit -> disassociate_gateway_from_server_input
val make_delete_hypervisor_output :
  ?hypervisor_arn:string -> unit -> delete_hypervisor_output
val make_delete_hypervisor_input :
  hypervisor_arn:string -> unit -> delete_hypervisor_input
val make_delete_gateway_output :
  ?gateway_arn:string -> unit -> delete_gateway_output
val make_delete_gateway_input :
  gateway_arn:string -> unit -> delete_gateway_input
val make_create_gateway_output :
  ?gateway_arn:string -> unit -> create_gateway_output
val make_create_gateway_input :
  ?tags:tag list ->
    gateway_type:gateway_type ->
      gateway_display_name:string ->
        activation_key:string -> unit -> create_gateway_input
val make_associate_gateway_to_server_output :
  ?gateway_arn:string -> unit -> associate_gateway_to_server_output
val make_associate_gateway_to_server_input :
  server_arn:string ->
    gateway_arn:string -> unit -> associate_gateway_to_server_input(** {1:operations Operations} *)

module AssociateGatewayToServer : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_gateway_to_server_input ->
        (associate_gateway_to_server_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            
        ]
      ) result
  (** 
    Associates a backup gateway with your server. After you complete the association process, you can back up and restore your VMs through the gateway.
     *)

  
end

module CreateGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      create_gateway_input ->
        (create_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Creates a backup gateway. After you create a gateway, you can associate it with a server using the [AssociateGatewayToServer] operation.
     *)

  
end

module DeleteGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_gateway_input ->
        (delete_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a backup gateway.
     *)

  
end

module DeleteHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_hypervisor_input ->
        (delete_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a hypervisor.
     *)

  
end

module DisassociateGatewayFromServer : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_gateway_from_server_input ->
        (disassociate_gateway_from_server_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disassociates a backup gateway from the specified server. After the disassociation process finishes, the gateway can no longer access the virtual machines on the server.
     *)

  
end

module GetBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bandwidth_rate_limit_schedule_input ->
        (get_bandwidth_rate_limit_schedule_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use this to get a gateway's bandwidth rate limit schedule.
     *)

  
end

module GetGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      get_gateway_input ->
        (get_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    By providing the ARN (Amazon Resource Name), this API returns the gateway.
     *)

  
end

module GetHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_input ->
        (get_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This action requests information about the specified hypervisor to which the gateway will connect. A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.
     *)

  
end

module GetHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_property_mappings_input ->
        (get_hypervisor_property_mappings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This action retrieves the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.
     *)

  
end

module GetVirtualMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      get_virtual_machine_input ->
        (get_virtual_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    By providing the ARN (Amazon Resource Name), this API returns the virtual machine.
     *)

  
end

module ImportHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      import_hypervisor_configuration_input ->
        (import_hypervisor_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            
        ]
      ) result
  (** 
    Connect to a hypervisor by importing its configuration.
     *)

  
end

module ListGateways : sig
  val request :
    Smaws_Lib.Context.t ->
      list_gateways_input ->
        (list_gateways_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Lists backup gateways owned by an Amazon Web Services account in an Amazon Web Services Region. The returned list is ordered by gateway Amazon Resource Name (ARN).
     *)

  
end

module ListHypervisors : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hypervisors_input ->
        (list_hypervisors_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Lists your hypervisors.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the tags applied to the resource identified by its Amazon Resource Name (ARN).
     *)

  
end

module ListVirtualMachines : sig
  val request :
    Smaws_Lib.Context.t ->
      list_virtual_machines_input ->
        (list_virtual_machines_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Lists your virtual machines.
     *)

  
end

module PutBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_bandwidth_rate_limit_schedule_input ->
        (put_bandwidth_rate_limit_schedule_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This action sets the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have a bandwidth rate limit schedule, which means no bandwidth rate limiting is in effect. Use this to initiate a gateway's bandwidth rate limit schedule.
     *)

  
end

module PutHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
      put_hypervisor_property_mappings_input ->
        (put_hypervisor_property_mappings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This action sets the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.
     *)

  
end

module PutMaintenanceStartTime : sig
  val request :
    Smaws_Lib.Context.t ->
      put_maintenance_start_time_input ->
        (put_maintenance_start_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Set the maintenance start time for a gateway.
     *)

  
end

module StartVirtualMachinesMetadataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      start_virtual_machines_metadata_sync_input ->
        (start_virtual_machines_metadata_sync_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This action sends a request to sync metadata across the specified virtual machines.
     *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Tag the resource.
     *)

  
end

module TestHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      test_hypervisor_configuration_input ->
        (test_hypervisor_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Tests your hypervisor configuration to validate that backup gateway can connect with the hypervisor and its resources.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes tags from the resource.
     *)

  
end

module UpdateGatewayInformation : sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_information_input ->
        (update_gateway_information_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates a gateway's name. Specify which gateway to update using the Amazon Resource Name (ARN) of the gateway in your request.
     *)

  
end

module UpdateGatewaySoftwareNow : sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_software_now_input ->
        (update_gateway_software_now_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.
    
     When you make this request, you get a [200 OK] success response immediately. However, it might take some time for the update to complete.
     
      *)

  
end

module UpdateHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      update_hypervisor_input ->
        (update_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates a hypervisor metadata, including its host, username, and password. Specify which hypervisor to update using the Amazon Resource Name (ARN) of the hypervisor in your request.
     *)

  
end

