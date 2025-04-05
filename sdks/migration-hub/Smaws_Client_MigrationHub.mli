(** 
    Migration Hub client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec unauthorized_operation = {
  message: string option }
type nonrec throttling_exception =
  {
  retry_after_seconds: int option ;
  message: string }
type nonrec status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | NOT_STARTED 
type nonrec task =
  {
  progress_percent: int option ;
  status_detail: string option ;
  status: status }
type nonrec service_unavailable_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_attribute_type =
  | MOTHERBOARD_SERIAL_NUMBER 
  | BIOS_ID 
  | VM_PATH 
  | VM_NAME 
  | VM_MANAGED_OBJECT_REFERENCE 
  | VM_MANAGER_ID 
  | FQDN 
  | MAC_ADDRESS 
  | IPV6_ADDRESS 
  | IPV4_ADDRESS 
type nonrec resource_attribute =
  {
  value: string ;
  type_: resource_attribute_type }
type nonrec put_resource_attributes_result = unit
type nonrec put_resource_attributes_request =
  {
  dry_run: bool option ;
  resource_attribute_list: resource_attribute list ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec invalid_input_exception = {
  message: string option }
type nonrec internal_server_error = {
  message: string option }
type nonrec home_region_not_set_exception = {
  message: string option }
type nonrec dry_run_operation = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec progress_update_stream_summary =
  {
  progress_update_stream_name: string option }
type nonrec policy_error_exception = {
  message: string option }
type nonrec notify_migration_task_state_result = unit
type nonrec notify_migration_task_state_request =
  {
  dry_run: bool option ;
  next_update_seconds: int ;
  update_date_time: CoreTypes.Timestamp.t ;
  task: task ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec notify_application_state_result = unit
type nonrec application_status =
  | COMPLETED 
  | IN_PROGRESS 
  | NOT_STARTED 
type nonrec notify_application_state_request =
  {
  dry_run: bool option ;
  update_date_time: CoreTypes.Timestamp.t option ;
  status: application_status ;
  application_id: string }
type nonrec migration_task_summary =
  {
  update_date_time: CoreTypes.Timestamp.t option ;
  status_detail: string option ;
  progress_percent: int option ;
  status: status option ;
  migration_task_name: string option ;
  progress_update_stream: string option }
type nonrec migration_task =
  {
  resource_attribute_list: resource_attribute list option ;
  update_date_time: CoreTypes.Timestamp.t option ;
  task: task option ;
  migration_task_name: string option ;
  progress_update_stream: string option }
type nonrec list_progress_update_streams_result =
  {
  next_token: string option ;
  progress_update_stream_summary_list:
    progress_update_stream_summary list option }
type nonrec list_progress_update_streams_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_migration_tasks_result =
  {
  migration_task_summary_list: migration_task_summary list option ;
  next_token: string option }
type nonrec list_migration_tasks_request =
  {
  resource_name: string option ;
  max_results: int option ;
  next_token: string option }
type nonrec discovered_resource =
  {
  description: string option ;
  configuration_id: string }
type nonrec list_discovered_resources_result =
  {
  discovered_resource_list: discovered_resource list option ;
  next_token: string option }
type nonrec list_discovered_resources_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec created_artifact = {
  description: string option ;
  name: string }
type nonrec list_created_artifacts_result =
  {
  created_artifact_list: created_artifact list option ;
  next_token: string option }
type nonrec list_created_artifacts_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec application_state =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  application_status: application_status option ;
  application_id: string option }
type nonrec list_application_states_result =
  {
  next_token: string option ;
  application_state_list: application_state list option }
type nonrec list_application_states_request =
  {
  max_results: int option ;
  next_token: string option ;
  application_ids: string list option }
type nonrec import_migration_task_result = unit
type nonrec import_migration_task_request =
  {
  dry_run: bool option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec disassociate_discovered_resource_result = unit
type nonrec disassociate_discovered_resource_request =
  {
  dry_run: bool option ;
  configuration_id: string ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec disassociate_created_artifact_result = unit
type nonrec disassociate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact_name: string ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec describe_migration_task_result =
  {
  migration_task: migration_task option }
type nonrec describe_migration_task_request =
  {
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec describe_application_state_result =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  application_status: application_status option }
type nonrec describe_application_state_request = {
  application_id: string }
type nonrec delete_progress_update_stream_result = unit
type nonrec delete_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }
type nonrec create_progress_update_stream_result = unit
type nonrec create_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }
type nonrec associate_discovered_resource_result = unit
type nonrec associate_discovered_resource_request =
  {
  dry_run: bool option ;
  discovered_resource: discovered_resource ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec associate_created_artifact_result = unit
type nonrec associate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact: created_artifact ;
  migration_task_name: string ;
  progress_update_stream: string }(** {1:builders Builders} *)

val make_task :
  ?progress_percent:int ->
    ?status_detail:string -> status:status -> unit -> task
val make_resource_attribute :
  value:string -> type_:resource_attribute_type -> unit -> resource_attribute
val make_put_resource_attributes_request :
  ?dry_run:bool ->
    resource_attribute_list:resource_attribute list ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> put_resource_attributes_request
val make_progress_update_stream_summary :
  ?progress_update_stream_name:string ->
    unit -> progress_update_stream_summary
val make_notify_migration_task_state_request :
  ?dry_run:bool ->
    next_update_seconds:int ->
      update_date_time:CoreTypes.Timestamp.t ->
        task:task ->
          migration_task_name:string ->
            progress_update_stream:string ->
              unit -> notify_migration_task_state_request
val make_notify_application_state_request :
  ?dry_run:bool ->
    ?update_date_time:CoreTypes.Timestamp.t ->
      status:application_status ->
        application_id:string -> unit -> notify_application_state_request
val make_migration_task_summary :
  ?update_date_time:CoreTypes.Timestamp.t ->
    ?status_detail:string ->
      ?progress_percent:int ->
        ?status:status ->
          ?migration_task_name:string ->
            ?progress_update_stream:string -> unit -> migration_task_summary
val make_migration_task :
  ?resource_attribute_list:resource_attribute list ->
    ?update_date_time:CoreTypes.Timestamp.t ->
      ?task:task ->
        ?migration_task_name:string ->
          ?progress_update_stream:string -> unit -> migration_task
val make_list_progress_update_streams_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_progress_update_streams_request
val make_list_migration_tasks_request :
  ?resource_name:string ->
    ?max_results:int ->
      ?next_token:string -> unit -> list_migration_tasks_request
val make_discovered_resource :
  ?description:string ->
    configuration_id:string -> unit -> discovered_resource
val make_list_discovered_resources_request :
  ?max_results:int ->
    ?next_token:string ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> list_discovered_resources_request
val make_created_artifact :
  ?description:string -> name:string -> unit -> created_artifact
val make_list_created_artifacts_request :
  ?max_results:int ->
    ?next_token:string ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> list_created_artifacts_request
val make_application_state :
  ?last_updated_time:CoreTypes.Timestamp.t ->
    ?application_status:application_status ->
      ?application_id:string -> unit -> application_state
val make_list_application_states_request :
  ?max_results:int ->
    ?next_token:string ->
      ?application_ids:string list -> unit -> list_application_states_request
val make_import_migration_task_request :
  ?dry_run:bool ->
    migration_task_name:string ->
      progress_update_stream:string -> unit -> import_migration_task_request
val make_disassociate_discovered_resource_request :
  ?dry_run:bool ->
    configuration_id:string ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> disassociate_discovered_resource_request
val make_disassociate_created_artifact_request :
  ?dry_run:bool ->
    created_artifact_name:string ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> disassociate_created_artifact_request
val make_describe_migration_task_request :
  migration_task_name:string ->
    progress_update_stream:string -> unit -> describe_migration_task_request
val make_describe_application_state_request :
  application_id:string -> unit -> describe_application_state_request
val make_delete_progress_update_stream_request :
  ?dry_run:bool ->
    progress_update_stream_name:string ->
      unit -> delete_progress_update_stream_request
val make_create_progress_update_stream_request :
  ?dry_run:bool ->
    progress_update_stream_name:string ->
      unit -> create_progress_update_stream_request
val make_associate_discovered_resource_request :
  ?dry_run:bool ->
    discovered_resource:discovered_resource ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> associate_discovered_resource_request
val make_associate_created_artifact_request :
  ?dry_run:bool ->
    created_artifact:created_artifact ->
      migration_task_name:string ->
        progress_update_stream:string ->
          unit -> associate_created_artifact_request(** {1:operations Operations} *)

module AssociateCreatedArtifact : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_created_artifact_request ->
        (associate_created_artifact_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Associates a created artifact of an AWS cloud resource, the target receiving the migration, with the migration task performed by a migration tool. This API has the following traits:
    
     {ul
          {- Migration tools can call the [AssociateCreatedArtifact] operation to indicate which AWS artifact is associated with a migration task.
             
             }
           {- The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: [arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b].
              
              }
           {- Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or DMS endpoint, etc.
              
              }
          
      }
       *)

  
end

module AssociateDiscoveredResource : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_discovered_resource_request ->
        (associate_discovered_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Associates a discovered resource ID from Application Discovery Service with a migration task.
     *)

  
end

module CreateProgressUpdateStream : sig
  val request :
    Smaws_Lib.Context.t ->
      create_progress_update_stream_request ->
        (create_progress_update_stream_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Creates a progress update stream which is an AWS resource used for access control as well as a namespace for migration task names that is implicitly linked to your AWS account. It must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.
     *)

  
end

module DeleteProgressUpdateStream : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_progress_update_stream_request ->
        (delete_progress_update_stream_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  [@@ocaml.doc {| 
    Deletes a progress update stream, including all of its tasks, which was previously created as an AWS resource used for access control. This API has the following traits:
    
     {ul
          {- The only parameter needed for [DeleteProgressUpdateStream] is the stream name (same as a [CreateProgressUpdateStream] call).
             
             }
           {- The call will return, and a background process will asynchronously delete the stream and all of its resources (tasks, associated resources, resource attributes, created artifacts).
              
              }
           {- If the stream takes time to be deleted, it might still show up on a [ListProgressUpdateStreams] call.
              
              }
           {- [CreateProgressUpdateStream], [ImportMigrationTask], [NotifyMigrationTaskState], and all Associate\[*\] APIs related to the tasks belonging to the stream will throw "InvalidInputException" if the stream of the same name is in the process of being deleted.
              
              }
           {- Once the stream and all of its resources are deleted, [CreateProgressUpdateStream] for a stream of the same name will succeed, and that stream will be an entirely new logical resource (without any resources associated with the old stream).
              
              }
          
      }
       |}]

  
end

module DescribeApplicationState : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_state_request ->
        (describe_application_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Gets the migration status of an application.
     *)

  
end

module DescribeMigrationTask : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_migration_task_request ->
        (describe_migration_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Retrieves a list of all attributes associated with a specific migration task.
     *)

  
end

module DisassociateCreatedArtifact : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_created_artifact_request ->
        (disassociate_created_artifact_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Disassociates a created artifact of an AWS resource with a migration task performed by a migration tool that was previously associated. This API has the following traits:
    
     {ul
          {- A migration user can call the [DisassociateCreatedArtifacts] operation to disassociate a created AWS Artifact from a migration task.
             
             }
           {- The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: [arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b].
              
              }
           {- Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or RDS instance, etc.
              
              }
          
      }
       *)

  
end

module DisassociateDiscoveredResource : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_discovered_resource_request ->
        (disassociate_discovered_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Disassociate an Application Discovery Service discovered resource from a migration task.
     *)

  
end

module ImportMigrationTask : sig
  val request :
    Smaws_Lib.Context.t ->
      import_migration_task_request ->
        (import_migration_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Registers a new migration task which represents a server, database, etc., being migrated to AWS by a migration tool.
    
     This API is a prerequisite to calling the [NotifyMigrationTaskState] API as the migration tool must first register the migration task with Migration Hub.
      *)

  
end

module ListApplicationStates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_states_request ->
        (list_application_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Lists all the migration statuses for your applications. If you use the optional [ApplicationIds] parameter, only the migration statuses for those applications will be returned.
     *)

  
end

module ListCreatedArtifacts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_created_artifacts_request ->
        (list_created_artifacts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Lists the created artifacts attached to a given migration task in an update stream. This API has the following traits:
    
     {ul
          {- Gets the list of the created artifacts while migration is taking place.
             
             }
           {- Shows the artifacts created by the migration tool that was associated by the [AssociateCreatedArtifact] API.
              
              }
           {- Lists created artifacts in a paginated interface.
              
              }
          
      }
       *)

  
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Lists discovered resources associated with the given [MigrationTask].
     *)

  
end

module ListMigrationTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_migration_tasks_request ->
        (list_migration_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Lists all, or filtered by resource name, migration tasks associated with the user account making this call. This API has the following traits:
    
     {ul
          {- Can show a summary list of the most recent migration tasks.
             
             }
           {- Can show a summary list of migration tasks associated with a given discovered resource.
              
              }
           {- Lists migration tasks in a paginated interface.
              
              }
          
      }
       *)

  
end

module ListProgressUpdateStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      list_progress_update_streams_request ->
        (list_progress_update_streams_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Lists progress update streams associated with the user account making this call.
     *)

  
end

module NotifyApplicationState : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_application_state_request ->
        (notify_application_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Sets the migration state of an application. For a given application identified by the value passed to [ApplicationId], its status is set or updated by passing one of three values to [Status]: [NOT_STARTED | IN_PROGRESS |
         COMPLETED].
     *)

  
end

module NotifyMigrationTaskState : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_migration_task_state_request ->
        (notify_migration_task_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  (** 
    Notifies Migration Hub of the current status, progress, or other detail regarding a migration task. This API has the following traits:
    
     {ul
          {- Migration tools will call the [NotifyMigrationTaskState] API to share the latest progress and status.
             
             }
           {- [MigrationTaskName] is used for addressing updates to the correct target.
              
              }
           {- [ProgressUpdateStream] is used for access control and to provide a namespace for each migration tool.
              
              }
          
      }
       *)

  
end

module PutResourceAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_attributes_request ->
        (put_resource_attributes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
  [@@ocaml.doc {| 
    Provides identifying details of the resource being migrated so that it can be associated in the Application Discovery Service repository. This association occurs asynchronously after [PutResourceAttributes] returns.
    
     {ul
          {- Keep in mind that subsequent calls to PutResourceAttributes will override previously stored attributes. For example, if it is first called with a MAC address, but later, it is desired to {i add} an IP address, it will then be required to call it with {i both} the IP and MAC addresses to prevent overriding the MAC address.
             
             }
           {- Note the instructions regarding the special use case of the {{:https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList}[ResourceAttributeList]} parameter when specifying any "VM" related value.
              
              }
          
      }
       Because this is an asynchronous call, it will always return 200, whether an association occurs or not. To confirm if an association was found based on the provided details, call [ListDiscoveredResources].
       
        |}]

  
end

