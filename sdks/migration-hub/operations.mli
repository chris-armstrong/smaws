open Types

module AssociateCreatedArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_created_artifact_request ->
    ( associate_created_artifact_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Associates a created artifact of an AWS cloud resource, the target receiving the migration, \
   with the migration task performed by a migration tool. This API has the following traits:\n\n\
  \ {ul\n\
  \       {-  Migration tools can call the [AssociateCreatedArtifact] operation to indicate which \
   AWS artifact is associated with a migration task.\n\
  \           \n\
  \            }\n\
  \       {-  The created artifact name must be provided in ARN (Amazon Resource Name) format \
   which will contain information about type and region; for example: \
   [arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b].\n\
  \           \n\
  \            }\n\
  \       {-  Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, \
   or DMS endpoint, etc.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module AssociateDiscoveredResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `PolicyErrorException of policy_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_discovered_resource_request ->
    ( associate_discovered_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `PolicyErrorException of policy_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Associates a discovered resource ID from Application Discovery Service with a migration task.\n"]

module AssociateSourceResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_source_resource_request ->
    ( associate_source_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Associates a source resource with a migration task. For example, the source resource can be a \
   source server, an application, or a migration wave.\n"]

module CreateProgressUpdateStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_progress_update_stream_request ->
    ( create_progress_update_stream_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Creates a progress update stream which is an AWS resource used for access control as well as a \
   namespace for migration task names that is implicitly linked to your AWS account. It must \
   uniquely identify the migration tool as it is used for all updates made by the tool; however, \
   it does not need to be unique for each AWS account because it is scoped to the AWS account.\n"]

module DeleteProgressUpdateStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_progress_update_stream_request ->
    ( delete_progress_update_stream_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Deletes a progress update stream, including all of its tasks, which was previously created as \
   an AWS resource used for access control. This API has the following traits:\n\n\
  \ {ul\n\
  \       {-  The only parameter needed for [DeleteProgressUpdateStream] is the stream name (same \
   as a [CreateProgressUpdateStream] call).\n\
  \           \n\
  \            }\n\
  \       {-  The call will return, and a background process will asynchronously delete the stream \
   and all of its resources (tasks, associated resources, resource attributes, created artifacts).\n\
  \           \n\
  \            }\n\
  \       {-  If the stream takes time to be deleted, it might still show up on a \
   [ListProgressUpdateStreams] call.\n\
  \           \n\
  \            }\n\
  \       {-   [CreateProgressUpdateStream], [ImportMigrationTask], [NotifyMigrationTaskState], \
   and all Associate\\[*\\] APIs related to the tasks belonging to the stream will throw \
   \"InvalidInputException\" if the stream of the same name is in the process of being deleted.\n\
  \           \n\
  \            }\n\
  \       {-  Once the stream and all of its resources are deleted, [CreateProgressUpdateStream] \
   for a stream of the same name will succeed, and that stream will be an entirely new logical \
   resource (without any resources associated with the old stream).\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeApplicationState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `PolicyErrorException of policy_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_state_request ->
    ( describe_application_state_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `PolicyErrorException of policy_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Gets the migration status of an application.\n"]

module DescribeMigrationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_migration_task_request ->
    ( describe_migration_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Retrieves a list of all attributes associated with a specific migration task.\n"]

module DisassociateCreatedArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_created_artifact_request ->
    ( disassociate_created_artifact_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Disassociates a created artifact of an AWS resource with a migration task performed by a \
   migration tool that was previously associated. This API has the following traits:\n\n\
  \ {ul\n\
  \       {-  A migration user can call the [DisassociateCreatedArtifacts] operation to \
   disassociate a created AWS Artifact from a migration task.\n\
  \           \n\
  \            }\n\
  \       {-  The created artifact name must be provided in ARN (Amazon Resource Name) format \
   which will contain information about type and region; for example: \
   [arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b].\n\
  \           \n\
  \            }\n\
  \       {-  Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, \
   or RDS instance, etc.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DisassociateDiscoveredResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_discovered_resource_request ->
    ( disassociate_discovered_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Disassociate an Application Discovery Service discovered resource from a migration task.\n"]

module DisassociateSourceResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_source_resource_request ->
    ( disassociate_source_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc "Removes the association between a source resource and a migration task.\n"]

module ImportMigrationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_migration_task_request ->
    ( import_migration_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Registers a new migration task which represents a server, database, etc., being migrated to AWS \
   by a migration tool.\n\n\
  \ This API is a prerequisite to calling the [NotifyMigrationTaskState] API as the migration tool \
   must first register the migration task with Migration Hub.\n\
  \ "]

module ListApplicationStates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_states_request ->
    ( list_application_states_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Lists all the migration statuses for your applications. If you use the optional \
   [ApplicationIds] parameter, only the migration statuses for those applications will be returned.\n"]

module ListCreatedArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_created_artifacts_request ->
    ( list_created_artifacts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Lists the created artifacts attached to a given migration task in an update stream. This API \
   has the following traits:\n\n\
  \ {ul\n\
  \       {-  Gets the list of the created artifacts while migration is taking place.\n\
  \           \n\
  \            }\n\
  \       {-  Shows the artifacts created by the migration tool that was associated by the \
   [AssociateCreatedArtifact] API. \n\
  \           \n\
  \            }\n\
  \       {-  Lists created artifacts in a paginated interface. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListDiscoveredResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_discovered_resources_request ->
    ( list_discovered_resources_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Lists discovered resources associated with the given [MigrationTask].\n"]

module ListMigrationTaskUpdates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_migration_task_updates_request ->
    ( list_migration_task_updates_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "This is a paginated API that returns all the migration-task states for the specified \
   [MigrationTaskName] and [ProgressUpdateStream].\n"]

module ListMigrationTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `PolicyErrorException of policy_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_migration_tasks_request ->
    ( list_migration_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `PolicyErrorException of policy_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Lists all, or filtered by resource name, migration tasks associated with the user account \
   making this call. This API has the following traits:\n\n\
  \ {ul\n\
  \       {-  Can show a summary list of the most recent migration tasks.\n\
  \           \n\
  \            }\n\
  \       {-  Can show a summary list of migration tasks associated with a given discovered \
   resource.\n\
  \           \n\
  \            }\n\
  \       {-  Lists migration tasks in a paginated interface.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListProgressUpdateStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_progress_update_streams_request ->
    ( list_progress_update_streams_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Lists progress update streams associated with the user account making this call.\n"]

module ListSourceResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_source_resources_request ->
    ( list_source_resources_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Lists all the source resource that are associated with the specified [MigrationTaskName] and \
   [ProgressUpdateStream].\n"]

module NotifyApplicationState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `PolicyErrorException of policy_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_application_state_request ->
    ( notify_application_state_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `PolicyErrorException of policy_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Sets the migration state of an application. For a given application identified by the value \
   passed to [ApplicationId], its status is set or updated by passing one of three values to \
   [Status]: [NOT_STARTED | IN_PROGRESS |\n\
  \         COMPLETED].\n"]

module NotifyMigrationTaskState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_migration_task_state_request ->
    ( notify_migration_task_state_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Notifies Migration Hub of the current status, progress, or other detail regarding a migration \
   task. This API has the following traits:\n\n\
  \ {ul\n\
  \       {-  Migration tools will call the [NotifyMigrationTaskState] API to share the latest \
   progress and status.\n\
  \           \n\
  \            }\n\
  \       {-   [MigrationTaskName] is used for addressing updates to the correct target.\n\
  \           \n\
  \            }\n\
  \       {-   [ProgressUpdateStream] is used for access control and to provide a namespace for \
   each migration tool.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module PutResourceAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_attributes_request ->
    ( put_resource_attributes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `UnauthorizedOperation of unauthorized_operation ] )
    result
end
[@@ocaml.doc
  "Provides identifying details of the resource being migrated so that it can be associated in the \
   Application Discovery Service repository. This association occurs asynchronously after \
   [PutResourceAttributes] returns.\n\n\
  \  {ul\n\
  \        {-  Keep in mind that subsequent calls to PutResourceAttributes will override \
   previously stored attributes. For example, if it is first called with a MAC address, but later, \
   it is desired to {i add} an IP address, it will then be required to call it with {i both} the \
   IP and MAC addresses to prevent overriding the MAC address.\n\
  \            \n\
  \             }\n\
  \        {-  Note the instructions regarding the special use case of the \
   {{:https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList} \
   [ResourceAttributeList] } parameter when specifying any \"VM\" related value.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \     Because this is an asynchronous call, it will always return 200, whether an association \
   occurs or not. To confirm if an association was found based on the provided details, call \
   [ListDiscoveredResources].\n\
  \     \n\
  \      "]
