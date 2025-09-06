open Types

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    create_connection_input ->
    ( create_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result
end
[@@ocaml.doc
  "Creates a connection that can then be given to other Amazon Web Services services like \
   CodePipeline so that it can access third-party code repositories. The connection is in pending \
   status until the third-party connection handshake is completed from the console.\n"]

module CreateHost : sig
  val request :
    Smaws_Lib.Context.t ->
    create_host_input ->
    ( create_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result
end
[@@ocaml.doc
  "Creates a resource that represents the infrastructure where a third-party provider is \
   installed. The host is used when you create connections to an installed third-party provider \
   type, such as GitHub Enterprise Server. You create one host for all connections to that \
   provider.\n\n\
  \  A host created through the CLI or the SDK is in `PENDING` status by default. You can make its \
   status `AVAILABLE` by setting up the host in the console.\n\
  \  \n\
  \   "]

module CreateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
    create_repository_link_input ->
    ( create_repository_link_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Creates a link to a specified external Git repository. A repository link allows Git sync to \
   monitor and sync changes to files in a specified Git repository.\n"]

module CreateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    create_sync_configuration_input ->
    ( create_sync_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Creates a sync configuration which allows Amazon Web Services to sync content from a Git \
   repository to update a specified Amazon Web Services resource. Parameters for the sync \
   configuration are determined by the sync type.\n"]

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_connection_input ->
    ( delete_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "The connection to be deleted.\n"]

module DeleteHost : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_host_input ->
    ( delete_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result
end
[@@ocaml.doc
  "The host to be deleted. Before you delete a host, all connections associated to the host must \
   be deleted.\n\n\
  \  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or VPC_CONFIG_DELETING state.\n\
  \  \n\
  \   "]

module DeleteRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_repository_link_input ->
    ( delete_repository_link_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedProviderTypeException of unsupported_provider_type_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the association between your connection and a specified external Git repository.\n"]

module DeleteSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_sync_configuration_input ->
    ( delete_sync_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Deletes the sync configuration for a specified repository and connection.\n"]

module GetConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    get_connection_input ->
    ( get_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result
end
[@@ocaml.doc "Returns the connection ARN and details such as status, owner, and provider type.\n"]

module GetHost : sig
  val request :
    Smaws_Lib.Context.t ->
    get_host_input ->
    ( get_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result
end
[@@ocaml.doc
  "Returns the host ARN and details such as status, provider type, endpoint, and, if applicable, \
   the VPC configuration.\n"]

module GetRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
    get_repository_link_input ->
    ( get_repository_link_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Returns details about a repository link. A repository link allows Git sync to monitor and sync \
   changes from files in a specified Git repository.\n"]

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_repository_sync_status_input ->
    ( get_repository_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Returns details about the sync status for a repository. A repository sync uses Git sync to push \
   and pull changes from your remote repository.\n"]

module GetResourceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_resource_sync_status_input ->
    ( get_resource_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Returns the status of the sync with the Git repository for a specific Amazon Web Services \
   resource.\n"]

module GetSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_sync_blocker_summary_input ->
    ( get_sync_blocker_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Returns a list of the most recent sync blockers.\n"]

module GetSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    get_sync_configuration_input ->
    ( get_sync_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Returns details about a sync configuration, including the sync type and resource name. A sync \
   configuration allows the configuration to sync (push and pull) changes from the remote \
   repository for a specified branch in a Git repository.\n"]

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
    list_connections_input ->
    ( list_connections_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Lists the connections associated with your account.\n"]

module ListHosts : sig
  val request :
    Smaws_Lib.Context.t ->
    list_hosts_input ->
    (list_hosts_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "Lists the hosts associated with your account.\n"]

module ListRepositoryLinks : sig
  val request :
    Smaws_Lib.Context.t ->
    list_repository_links_input ->
    ( list_repository_links_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Lists the repository links created for connections in your account.\n"]

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
    list_repository_sync_definitions_input ->
    ( list_repository_sync_definitions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Lists the repository sync definitions for repository links in your account.\n"]

module ListSyncConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_sync_configurations_input ->
    ( list_sync_configurations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc "Returns a list of sync configurations for a specified repository.\n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Gets the set of key-value pairs (metadata) that are used to manage the resource.\n"]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds to or modifies the tags of the given resource. Tags are metadata that can be used to \
   manage a resource.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateHost : sig
  val request :
    Smaws_Lib.Context.t ->
    update_host_input ->
    ( update_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Updates a specified host with the provided configurations.\n"]

module UpdateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
    update_repository_link_input ->
    ( update_repository_link_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConditionalCheckFailedException of conditional_check_failed_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UpdateOutOfSyncException of update_out_of_sync_exception ] )
    result
end
[@@ocaml.doc
  "Updates the association between your connection and a specified external Git repository. A \
   repository link allows Git sync to monitor and sync changes to files in a specified Git \
   repository.\n"]

module UpdateSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
    update_sync_blocker_input ->
    ( update_sync_blocker_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
      | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Allows you to update the status of a sync blocker, resolving the blocker and allowing syncing \
   to continue.\n"]

module UpdateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    update_sync_configuration_input ->
    ( update_sync_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UpdateOutOfSyncException of update_out_of_sync_exception ] )
    result
end
[@@ocaml.doc
  "Updates the sync configuration for your connection and a specified external Git repository.\n"]
